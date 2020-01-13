From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v3 06/11] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Mon, 13 Jan 2020 16:28:34 +0000
Message-ID: <20200113162839.18103-7-vadimp@mellanox.com>
References: <20200113162839.18103-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200113162839.18103-1-vadimp@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy@infradead.org, dvhart@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Vadim Pasternak <vadimp@mellanox.com>
List-Id: platform-driver-x86.vger.kernel.org

Add documentation for the new attributes for:
- Exposing reset causes types asserted by: platform reset, SoC reset,
  AC power failure, software power off request.
- Setting and removing system VPD (EEPROM) hardware write protection.
- Voltage regulator devices configuration update status and firmware
  version.
- Setting PCIe ASIC reset to disable or enable state during PCIe root
  complex reset.
- System static topology identification, like system's static I2C
  topology, number and type of FPGA devices within the system and so on.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
v1-v2:
 Changes added by Vadim:
 - Change "Date" to "January 2020".
v3-v4:
 Comments pointed out by Andy:
 - Drop blank line between "What" and "Date".
 - Start each section with "What" keyword.
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 63 +++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index eb6db7382ae3..b0d90cc696a8 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -143,3 +143,66 @@ Description:	These files show the system reset cause, as following:
 		only last reset cause.
 
 		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/config1
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/config2
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show system static topology identification
+		like system's static I2C topology, number and type of FPGA
+		devices within the system and so on.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_ac_pwr_fail
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_platform
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_soc
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sw_pwr_off
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show the system reset causes, as following: reset
+		due to AC power failure, reset invoked from software by
+		assertion reset signal through CPLD. reset caused by signal
+		asserted by SOC through ACPI register, reset invoked from
+		software by assertion power off signal through CPLD.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pcie_asic_reset_dis
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file allows to retain ASIC up during PCIe root complex
+		reset, when attribute is set 1.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/vpd_wp
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file allows to overwrite system VPD hardware wrtie
+		protection when attribute is set 1.
+
+		The file is read/write.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/voltreg_update_status
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file exposes the configuration update status of burnable
+		voltage regulator devices. The status values are as following:
+		0 - OK; 1 - CRC failure; 2 = I2C failure; 3 - in progress.
+
+		The file is read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/ufm_version
+Date:		January 2020
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file exposes the firmware version of burnable voltage
+		regulator devices.
+
+		The file is read only.
-- 
2.11.0
