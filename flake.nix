
{
  inputs = {
    nix-ros-overlay.url = "github:lopsided98/nix-ros-overlay/master";
    nixpkgs.follows = "nix-ros-overlay/nixpkgs";  # IMPORTANT!!!
  };
  outputs = { self, nix-ros-overlay, nixpkgs }:
    nix-ros-overlay.inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ nix-ros-overlay.overlays.default ];
    config.permittedInsecurePackages = [
            "freeimage-3.18.0-unstable-2024-04-18"
        ];
        };
      in {
        devShells.default = pkgs.mkShell {
          name = "ROS";
          packages = with pkgs; [
            colcon
            virt-viewer
            (with rosPackages.noetic; buildEnv {
              paths = [
                ros-core
                rosbash
                turtlebot3-description
                turtlebot3-teleop
                turtlebot3-gazebo
                gazebo-plugins
                xacro
              ];
            })
          ];
          env = {
            ROS_HOSTNAME = "localhost";
            ROS_MASTER_URI = "http://localhost:11311";
            TURTLEBOT3_MODEL = "burger";
          };
        };
      });
  nixConfig = {
    extra-substituters = [ "https://ros.cachix.org" ];
    extra-trusted-public-keys = [ "ros.cachix.org-1:dSyZxI8geDCJrwgvCOHDoAfOm5sV1wCPjBkKL+38Rvo=" ];
  };
}
