import os, xacro

from ament_index_python.packages import get_package_share_directory

from launch import LaunchDescription
from launch.actions import RegisterEventHandler
from launch.event_handlers import OnProcessExit
from launch_ros.actions import Node


def generate_launch_description():
    xacro_file = os.path.join(get_package_share_directory("in426_desc"), "xacro", "Robot_1", "robot_1.xacro")

    robot_pose = {"x": 0.0, "y": 0.5, "yaw": 0.0}

    joint_state_broadcaster_spawner = Node(   #load and start joint_state_broadcaster
        package = "controller_manager",
        executable = "spawner",
        arguments = [
            "joint_state_broadcaster",
            "-c", "/controller_manager" #-c is the same as --controller_manager
        ]
    )

    robot_controller_spawner = Node(   #load and start joint_trajectory_position_controller
        package = "controller_manager",
        executable = "spawner",
        arguments = [
            "joint_trajectory_position_controller",
            "--controller-manager", "/controller_manager"
        ]
    )


    return LaunchDescription([
        RegisterEventHandler(
            event_handler = OnProcessExit(
              target_action = joint_state_broadcaster_spawner,
              on_exit = [robot_controller_spawner]  #start this node when 'joint_state_broadcaster' finishes  
            )
        ),

        Node(
            package = "robot_state_publisher",
            executable = "robot_state_publisher",
            parameters = [
                {"robot_description": xacro.process_file(xacro_file).toxml()},
            ]
        ),

        Node(
            package = "gazebo_ros",
            executable = "spawn_entity.py",
            arguments = [
                "-entity", "robot_ipsa", 
                "-topic", "/robot_description",
                "-x", str(robot_pose["x"]), 
                "-y", str(robot_pose["y"]),
                "-Y", str(robot_pose["yaw"]),
                # "-robot_namespace", robot["name"]
            ]
        ),

        joint_state_broadcaster_spawner
    ])