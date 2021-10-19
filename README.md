# Run the [Arm ML embedded evaluation kit](https://review.mlplatform.org/plugins/gitiles/ml/ethos-u/ml-embedded-evaluation-kit/) on [Arm Virtual Hardware](http://www.arm.com/virtual-hardware)

This is a software example from the [Arm ML embedded evaluation kit](https://review.mlplatform.org/plugins/gitiles/ml/ethos-u/ml-embedded-evaluation-kit/+/HEAD/docs/documentation.md#arm_ml-embedded-evaluation-kit)

To get started launch the Arm Virtual Harware Amazon Machine Image AMI in AWS

The [documentation](https://arm-software.github.io/VHT/main/overview/html/index.html) provides an overview of Arm Virtual Hardware.

Connect to the AMI using the methods described in the documenation section [Connect to the EC2 Instance](https://arm-software.github.io/VHT/main/infrastructure/html/run_ami_local.html#connect)

Once connected, build and run the application.

### Build the example software

```bash
$ ./build_software.sh
```

### Run the software on the FVP
```bash
$ ./run.sh
```

### From another shell, telnet to the FVP
```
$ telnet localhost 10500
```

Use the menu to run the application.

### Change the number of MACs.

Different devices contain different configurations of the Ethos-U55. The default value for number of 8x8 MACs performed per cycle is 128. The number of MACs must be changed in the software build and the run and the values must match. 

To change to 64 MACs:
```
$ ./build_software.sh 64
$ ./run.sh 64
```

### Use GUI or batch mode

The example runs in batch mode by default. Edit the file FVP\_config.txt to enable the GUI. 

Change the values below to enable the GUI (requires X display)
```
mps3_board.visualisation.disable-visualisation=0
mps3_board.telnetterminal0.start_telnet=1
```

