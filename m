From: Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH platform-next v1 3/9] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date: Tue, 31 Dec 2019 10:29:11 +0000
Message-ID: <20191231102917.24181-4-vadimp@mellanox.com>
References: <20191231102917.24181-1-vadimp@mellanox.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191231102917.24181-1-vadimp@mellanox.com>
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
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 69 +++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index fe30fe505c9b..afb73021a8d8 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -150,3 +150,72 @@ What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_from_asic
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_reload_bios
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sff_wd
 What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_wd
+
+Date:		December 2019
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show system static topology identification
+		like system's static I2C topology, number and type of FPGA
+		devices within the system and so on.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/config1
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/config2
+
+		The files are read only.
+
+Date:		December 2019
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show the system reset causes, as following: reset
+		due to AC power failure, reset invoked from software by
+		assertion reset signal through CPLD. reset caused by signal
+		asserted by SOC through ACPI register, reset invoked from
+		software by assertion power off signal through CPLD.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_ac_pwr_fail
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_platform
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_soc
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sw_pwr_off
+
+		The files are read only.
+
+Date:		December 2019
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file allows to retain ASIC up during PCIe root complex
+		reset, when attribute is set 1.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/pcie_asic_reset_dis
+
+		The file is read/write.
+
+Date:		December 2019
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file allows to overwrite system VPD hardware wrtie
+		protection when attribute is set 1.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/vpd_wp
+
+		The file is read/write.
+
+Date:		December 2019
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file exposes the configuration update status of burnable
+		voltage regulator devices. The status values are as following:
+		0 - OK; 1 - CRC failure; 2 = I2C failure; 3 - in progress.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/voltreg_update_status
+
+		The file is read only.
+
+Date:		December 2019
+KernelVersion:	5.6
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	This file exposes the firmware version of burnable voltage
+		regulator devices.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/ufm_version
+
+		The file is read only.
-- 
2.11.0
