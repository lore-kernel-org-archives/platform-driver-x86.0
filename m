Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7B726CE1A
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Feb 2026 03:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770350128; cv=none; b=FwjqdgB3/QuMooFoxJIgYpLpT/83CNCvZNO6399VUne0rzxtJfutKGPkDlVZHavJK9hw8dQYoGJZOp30DKko1gnsNtIGGWWiLDuHNyx73WuN1bHAmyfnMwOhh8u5/ihBdEPBRFmh6csTZue/QPu8jXlwPljNBo/C3w7BFchTHzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770350128; c=relaxed/simple;
	bh=RnB6SKiXwi65QOrLGezhUr9J6Rau8f0P2UG9GrjNmjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qovlvhyp66WA3El4KTBBgiTScwm1A8NJyHQF3mb6ClLAWTnOuTHz54YLVClFCAm3zIiN6QsIeXeSNmVKDeyhZfDhPXNAvZFGueNN90AshQT7jsRozv03IEr9Fst7A/FlyaotxxM/kbNgzTOvWfbf1NRJTC6RergrSe8vAbBMVJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+EGudHG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+EGudHG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29efd139227so1613865ad.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Feb 2026 19:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770350128; x=1770954928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F9sKOBoMMV30I7ff5ErvcT5E4yjGeUWMySXdPX8JOGs=;
        b=Z+EGudHG62C4oMk7alr8r9Ubc4HJ9AZpgXBQZ9W3qDCZ9egBb/56E+4JRM0DTgDjCz
         rxQFa94epDE5dgmX4jjxX2BX4qktlewAz0m8TTYV130fCY2uFDmJXKwflfEVmoEYIztY
         EOgS3KuaOx7moPBfjgxjS7Z/oAdvA8mFvB77wt3uYeds5uE0LVfDKvkJllAAA32kQk1k
         pACcff2so+Fk5oFVZQuW8diF7ko+C4e6q5cVoxzB3KEJDR9R1oATXT6s0rJWIEZNc0Yc
         4zOw8Hr2Zpl3ligYH0QJK7v1IXWmhtIVhsOEc5Qj4iHAwlBO8Jc0KR2x4aIOGHv/9G1M
         gZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770350128; x=1770954928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9sKOBoMMV30I7ff5ErvcT5E4yjGeUWMySXdPX8JOGs=;
        b=bygUEJVXPid8RLENsJ7lJ4IawDXo1s4/moxlkLyRsOz9oc5T5dmx5SSo2T8wf28qDm
         C00KdTMTtaUxQeJOuUVs87b04xKN+roJYeVpll/3KtpQeF+MIWtcXKffTnNXRCkrdWH2
         qKUXjLOJbd007jLTDlqGYm+Iyt6swXpyLVpgjS+yBJDbRebFXz/0+bwpttENf6fp+VT5
         eOt1TjLbgsjSH8nLEb3IzwoQcuQqn3sg7hR07/z+AwPHhHB2rVT07+fF4pLAz9eKPLRn
         B+TclaRstsAgM1AWrkg+vRB4ONisc2zUGbMThGS/E8q5bU171Q8CtDDBXhSzgKICT/r5
         k1vQ==
X-Gm-Message-State: AOJu0Yy/DUVtiHAFntJqd8y2u0SK5xRL7EXTyC+c6REPbx9WwECTfuu5
	NSrUQyTpZTjuJiUwPiO0ZEQBpEhmFVOLzbKvh1cJhNVtifyFFMBNP862
X-Gm-Gg: AZuq6aKWGhgV2sqOAcQ8u7WOTrslgX5l6x8JqbU1azY5NCBg5kz2Ff11D7jE6Sb7dFI
	3LnXdSUX6S8ofdc1P4C0o8oy5tvEiv+WwKGN3AZY1G6RyFKjHaBJoN1tos/X9IU2ciAC1mPf7lo
	TFjoEMMY3qaDuhZfeRVgiG5Skb18T/ElBTttKuLvtj+ggysAxA8LF8mk6S1V8Zq5VoKBwgCxHlD
	gUUBgQYnA8Q2wGvN/m3Mg/bDevi/CF2vZlKVtEwp2Alqg59bgzzZUKpaVeVeAOPy1aieH/kSP7q
	UpKrqK9fglxQhqALMtqkmSCpPG8m9jwvDCRIZkbAzRm/oDg0QW/VZpCAF4whQihTva93EGRwidz
	M9uKNj/4mly8qd6pdrGEm/zOJ/k2wBABZR7hlC3w89+Ywry/OD5X+8mWY22o6xQ==
X-Received: by 2002:a17:903:120d:b0:2a3:e70d:5817 with SMTP id d9443c01a7336-2a9512df445mr15714515ad.0.1770350127494;
        Thu, 05 Feb 2026 19:55:27 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521f8a50sm8801995ad.80.2026.02.05.19.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 19:55:26 -0800 (PST)
From: Mingyou Chen <qby140326@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cryolitia.pukngae@linux.dev,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v9] platform/x86: tongfang-mifs-wmi: Add new Tongfang MIFS WMI driver
Date: Fri,  6 Feb 2026 03:54:47 +0000
Message-ID: <20260206035447.778876-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new driver for Tongfang laptops that utilize the MIFS
(MiInterface)
WMI interface. This interface is commonly found in various rebranded
laptops from manufacturers like Mechrevo, XMG, Eluktronics, and others.

The driver implements several features through the WMI interface:

- Platform Profile: Supports "Quiet", "Balanced", "Performance", and
  "Full Speed" modes. The "Full Speed" mode is intelligently restricted
  based on the AC adapter type (requires DC power, not supported on
  USB-C charging) as required by the hardware.
- Hwmon: Provides monitoring for CPU, GPU, and System fan speeds,
  as well as CPU temperature sensors.
- Keyboard Backlight: Integrated with the LED class device for
  brightness control and provides sysfs attributes for keyboard modes
  (cyclic, fixed, etc.).
- GPU Mode: Allows switching between Hybrid, Discrete, and UMA
  graphics modes via sysfs.
- Hotkeys: Handles WMI events for system hotkeys (Calculator, Browser,
  App launch) using sparse keymaps and reports status changes for
  Airplane mode, Touchpad, and CapsLock.
- Fan Boost: Provides a sysfs interface to force fans to maximum speed.

The driver registers two WMI GUIDs:
- B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B: Control methods
- 46C93E13-EE9B-4262-8488-563BCA757FEF: Event notifications

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
v9:
  - Fix style issues in .rst documentation
  - Rewrite the wmi_call func with correct usage
  - Use power_supply_is_system_supplied in kernel instead of
    is_ac_online
  - Remove the PLATFORM_PROFILE_LAST check in wmi_resume function
  - Directly return in the hwmon_temp case in hwmon_read function
  - return -EPROTO on invalid wmi return value in gpu_mode and
    keyboard brightness
  - Remove thge dev_err debug messages
  - Rewrite the wmi_notify method with .notify_new callback in
    linux-next
  - Call hwmon_notify_event (with a notifier) on WMI fan speed events

v8:
  - Fix coding style issues
  - Use MILLIDEGREE_PER_DEGREE instead of MILLI to define the temperature unit more precisely.
  - Align lines with the first occurrence of HWMON
  - Remove the unnecessary empty line in error handling
  - Reverse the logic of kb_mode_strings and drop the mode_str variable

v7:
  - Remove the unused includes (asm/)
  - Align values with tab
  - remove the previous test code which i forgot to remove
  - return values directly with the "return" statement
  - rmeove the wrong comment "Full-speed" since I've already use the value
    "WMI_PP_FULL_SPEED" in the switch case
  - remove the empty lines
  - Change the two variables (val, ret) to reverse xmas-tree order.
  - Add missing includes and sort them in the alphabetical order.
  - use endianness types and conversion functions to parse temperature in
    the wmi response

v6:
  - add base commit

v5:
  - add fallthrough on the PLATFORM_PROFILE_BALANCED_PERFORMANCE switch
    case

v4:
  - check the DC power state before switching to performance/full-speed mode

v3:
  - Fix email address mismatch in Signed-off-by and From headers.
  - implement the WMI event handler
  - code style improvments
  - condition on the performance platform profile switch
  - driver documentation

v2:
  - Add PLATFORM_PROFILE_BALANCED_PERFORMANCE platform profile support

 .../wmi/devices/tongfang-mifs-wmi.rst         | 207 +++++
 drivers/platform/x86/Kconfig                  |  16 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/tongfang-mifs-wmi.c      | 851 ++++++++++++++++++
 4 files changed, 1075 insertions(+)
 create mode 100644 Documentation/wmi/devices/tongfang-mifs-wmi.rst
 create mode 100644 drivers/platform/x86/tongfang-mifs-wmi.c

diff --git a/Documentation/wmi/devices/tongfang-mifs-wmi.rst b/Documentation/wmi/devices/tongfang-mifs-wmi.rst
new file mode 100644
index 000000000000..aae2629b34c9
--- /dev/null
+++ b/Documentation/wmi/devices/tongfang-mifs-wmi.rst
@@ -0,0 +1,207 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+========================================
+Tongfang MIFS driver (tongfang-mifs-wmi)
+========================================
+
+Introduction
+============
+
+
+EC WMI interface description
+============================
+
+The EC WMI interface description can be decoded from the embedded binary MOF (bmof)
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+  class WMIEvent : __ExtrinsicEvent {
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("Root WMI HID_EVENT20"), guid("{46c93e13-ee9b-4262-8488-563bca757fef}")]
+  class HID_EVENT20 : WmiEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+    [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("Root WMI HID_EVENT21"), guid("{fa78e245-2c0f-4ca1-91cf-15f34e474850}")]
+  class HID_EVENT21 : WmiEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+    [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("Root WMI HID_EVENT22"), guid("{1dceaf0a-4d63-44bb-bd0c-0d6281bfddc5}")]
+  class HID_EVENT22 : WmiEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+    [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("Root WMI HID_EVENT23"), guid("{3f9e3c26-b077-4f86-91f5-37ff64d8c7ed}")]
+  class HID_EVENT23 : WmiEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+    [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
+  };
+
+  [WMI, Dynamic, provider("WmiProv"), Locale("MS\\0x409"), Description("Class used to operate firmware interface"), guid("{b60bfb48-3e5b-49e4-a0e9-8cffe1b3434b}")]
+  class MICommonInterface {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiMethodId(1), Implemented, read, write, Description("Method used to support system functions.")] void MiInterface([in, Description("WMI Interface")] uint8 InData[32], [out] uint8 OutData[30], [out] uint16 Reserved);
+  };
+
+Reverse-Engineering the EC WMI interface
+========================================
+
+The OEM software can be download from `this link <https://iknow.lenovo.com.cn/detail/429447>`_
+
+Nothing is obfuscated, In this case, `ILSpy <https://github.com/icsharpcode/ILSpy>`_ could be helpful.
+
+WMI Methods (MICommonInterface)
+========================================
+
+The ``MICommonInterface`` class (GUID: ``{b60bfb48-3e5b-49e4-a0e9-8cffe1b3434b}``)
+is the primary control interface. It uses a 32-byte buffer for both input
+(``InData``) and output (``OutData``).
+
+Method Structure
+----------------
+
+The data packet follows a standardized format:
+
++----------+------------------------------------------------------------------+
+| Byte     | Description                                                      |
++==========+==================================================================+
+| 1        | Method Type: Get (0xFA / 250) or Set (0xFB / 251)                |
++----------+------------------------------------------------------------------+
+| 3        | Command ID (Method Name)                                         |
++----------+------------------------------------------------------------------+
+| 4 - 31   | Arguments (for Set) or Return Data (for Get)                     |
++----------+------------------------------------------------------------------+
+
+
+Command IDs
+-----------
+
+The following Command IDs are used in the third byte of the buffer:
+
++----------+-----------------------+------------------------------------------+
+| ID       | Name                  | Values / Description                     |
++==========+=======================+==========================================+
+| 8        | SystemPerMode         | 0: Balance, 1: Performance, 2: Quiet,    |
+|          |                       | 3: Full-speed                            |
++----------+-----------------------+------------------------------------------+
+| 9        | GPUMode               | 0: Hybrid, 1: Discrete, 2: UMA           |
++----------+-----------------------+------------------------------------------+
+| 10       | KeyboardType          | 0: White, 1: Single RGB, 2: Zone RGB     |
++----------+-----------------------+------------------------------------------+
+| 11       | FnLock                | 0: Off, 1: On                            |
++----------+-----------------------+------------------------------------------+
+| 12       | TPLock                | 0: Unlock, 1: Lock (Touchpad)            |
++----------+-----------------------+------------------------------------------+
+| 13       | CPUGPUSYSFanSpeed     | Returns 12 bytes of fan data:            |
+|          |                       | Bytes 4-5: CPU Fan RPM (Little Endian)   |
+|          |                       | Bytes 6-7: GPU Fan RPM (Little Endian)   |
+|          |                       | Bytes 10-11: SYS Fan RPM (Little Endian) |
++----------+-----------------------+------------------------------------------+
+| 16       | RGBKeyboardMode       | 0: Off, 1: Auto Cyclic, 2: Fixed,        |
+|          |                       | 3: Custom                                |
++----------+-----------------------+------------------------------------------+
+| 17       | RGBKeyboardColor      | Bytes 4, 5, 6: Red, Green, Blue values   |
++----------+-----------------------+------------------------------------------+
+| 18       | RGBKeyboardBrightness | 0-10: Brightness Levels, 128: Auto       |
++----------+-----------------------+------------------------------------------+
+| 19       | SystemAcType          | 1: Type-C, 2: Circular Hole (DC)         |
++----------+-----------------------+------------------------------------------+
+| 20       | MaxFanSpeedSwitch     | Byte 4: Fan Type (0: CPU/GPU, 1: SYS)    |
+|          |                       | Byte 5: State (0: Off, 1: On)            |
++----------+-----------------------+------------------------------------------+
+| 21       | MaxFanSpeed           | Sets manual fan speed duty cycle         |
++----------+-----------------------+------------------------------------------+
+| 22       | CPUThermometer        | Returns CPU Temperature                  |
++----------+-----------------------+------------------------------------------+
+
+WMI Events (HID_EVENT20)
+========================
+
+The driver listens for events from the ``HID_EVENT20`` class
+(GUID: ``{46c93e13-ee9b-4262-8488-563bca757fef}``). These events are triggered
+by hotkeys or system state changes (e.g., plugging in AC power).
+
+Event Structure
+---------------
+
+The event data is provided in an 8-byte array (``EventDetail``):
+
++----------+------------------------------------------------------------------+
+| Byte     | Description                                                      |
++==========+==================================================================+
+| 0        | Event Type (Always 0x01 for HotKey/Notification)                 |
++----------+------------------------------------------------------------------+
+| 1        | Event ID (Corresponds to the Command IDs above)                  |
++----------+------------------------------------------------------------------+
+| 2        | Value (The new state or value of the feature)                    |
++----------+------------------------------------------------------------------+
+
+Common Event IDs:
+-----------------
+
+Note: reserved event ids are not listed there
+
++----------+------------------------------------------------------------------+
+| Event Id | Description                                                      |
++==========+==================================================================+
+| 4        | AirPlane mode change                                             |
++----------+------------------------------------------------------------------+
+| 5        | Keyboard brightness change                                       |
++----------+------------------------------------------------------------------+
+| 6        | touchpad state (enabled/disabled) change                         |
++----------+------------------------------------------------------------------+
+| 7        | FnLock state (enabled/disabled) change                           |
++----------+------------------------------------------------------------------+
+| 8        | Keyboard mode change                                             |
++----------+------------------------------------------------------------------+
+| 9        | CapsLock state change                                            |
++----------+------------------------------------------------------------------+
+| 13       | NumLock state change                                             |
++----------+------------------------------------------------------------------+
+| 14       | ScrollLock state change                                          |
++----------+------------------------------------------------------------------+
+| 15       | Performance plan change                                          |
++----------+------------------------------------------------------------------+
+| 25       | Display refresh rate change                                      |
++----------+------------------------------------------------------------------+
+| 33       | Super key lock state (enabled/disabled) change                   |
++----------+------------------------------------------------------------------+
+| 35       | Open control center key                                          |
++----------+------------------------------------------------------------------+
+
+Implementation Details
+======================
+
+Performance Modes
+-----------------
+Changing the performance mode via Command ID 0x08 (SystemPerMode) affects the power limits (PL1/PL2)
+and fan curves managed by the Embedded Controller (EC). Note that the "Full-speed"
+and "Performance" mode (1, 3) is typically only available when the system is connected to a DC power
+source (not USB-C/PD).
+
+In the driver implementation, switch to performance/full-speed mode without DC power connected
+will throw the EOPNOTSUPP error.
+
+Graphics Switching
+------------------
+The ``GPUMode`` (0x09) allows switching between Hybrid (Muxless) and Discrete
+(Muxed) graphics. Changing this value usually requires a system reboot to
+take effect in the BIOS/Firmware.
+
+Fan Control
+-----------
+The system supports both automatic EC control and manual overrides. Command ID
+0x14 (``MaxFanSpeedSwitch``) is used to toggle manual control, while ID 0x15
+sets the actual PWM duty cycle.
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 4cb7d97a9fcc..cdef5924d118 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -113,6 +113,22 @@ config GIGABYTE_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called gigabyte-wmi.
 
+config TONGFANG_MIFS_WMI
+	tristate "Tongfang MIFS (MiInterface) WMI driver"
+	depends on ACPI_WMI
+	depends on HWMON
+	depends on POWER_SUPPLY
+	select ACPI_PLATFORM_PROFILE
+	help
+	  This is a driver for Tongfang MiInterface based laptops.
+
+	  It provides the access to the temperature, fan speed, gpu
+	  control, keyboard backlight brightness and platform profile
+	  via hwmon and sysfs.
+
+	  To compile this driver as a module, choose M here: the module will
+          be called tongfang-mifs-wmi.
+
 config ACERHDF
 	tristate "Acer Aspire One temperature and fan driver"
 	depends on ACPI_EC && THERMAL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index d25762f7114f..1160c726bda6 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
 obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
 obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
+obj-$(CONFIG_TONGFANG_MIFS_WMI)		+= tongfang-mifs-wmi.o
 
 # Acer
 obj-$(CONFIG_ACERHDF)		+= acerhdf.o
diff --git a/drivers/platform/x86/tongfang-mifs-wmi.c b/drivers/platform/x86/tongfang-mifs-wmi.c
new file mode 100644
index 000000000000..5538d7713883
--- /dev/null
+++ b/drivers/platform/x86/tongfang-mifs-wmi.c
@@ -0,0 +1,851 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <linux/acpi.h>
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/dev_printk.h>
+#include <linux/device.h>
+#include <linux/device/devres.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/init.h>
+#include <linux/input-event-codes.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/kernel.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/platform_profile.h>
+#include <linux/pm.h>
+#include <linux/power_supply.h>
+#include <linux/stddef.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/unaligned.h>
+#include <linux/units.h>
+#include <linux/wmi.h>
+
+#define DRV_NAME		"tongfang-mifs-wmi"
+#define TONGFANG_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
+#define TONGFANG_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
+
+enum tongfang_mifs_operation {
+	WMI_METHOD_GET	= 250,
+	WMI_METHOD_SET	= 251,
+};
+
+enum tongfang_mifs_function {
+	WMI_FN_SYSTEM_PER_MODE		= 8,
+	WMI_FN_GPU_MODE			= 9,
+	WMI_FN_KBD_TYPE			= 10,
+	WMI_FN_FN_LOCK			= 11,
+	WMI_FN_TP_LOCK			= 12,
+	WMI_FN_FAN_SPEEDS		= 13,
+	WMI_FN_RGB_KB_MODE		= 16,
+	WMI_FN_RGB_KB_COLOR		= 17,
+	WMI_FN_RGB_KB_BRIGHTNESS	= 18,
+	WMI_FN_SYSTEM_AC_TYPE		= 19,
+	WMI_FN_MAX_FAN_SWITCH		= 20,
+	WMI_FN_MAX_FAN_SPEED		= 21,
+	WMI_FN_CPU_THERMOMETER		= 22,
+	WMI_FN_CPU_POWER		= 23,
+};
+
+enum tongfang_system_ac_mode {
+	WMI_SYSTEM_AC_TYPEC		= 1,
+	/* Unknown type, this is unused in the original driver */
+	WMI_SYSTEM_AC_CIRCULARHOLE	= 2,
+};
+
+enum tongfang_mifs_power_profile {
+	WMI_PP_BALANCED		= 0,
+	WMI_PP_PERFORMANCE	= 1,
+	WMI_PP_QUIET		= 2,
+	WMI_PP_FULL_SPEED	= 3,
+};
+
+enum tongfang_mifs_event_id {
+	WMI_EVENT_RESERVED_1		= 1,
+	WMI_EVENT_RESERVED_2		= 2,
+	WMI_EVENT_RESERVED_3		= 3,
+	WMI_EVENT_AIRPLANE_MODE		= 4,
+	WMI_EVENT_KBD_BRIGHTNESS	= 5,
+	WMI_EVENT_TOUCHPAD_STATE	= 6,
+	WMI_EVENT_FNLOCK_STATE		= 7,
+	WMI_EVENT_KBD_MODE		= 8,
+	WMI_EVENT_CAPSLOCK_STATE	= 9,
+	WMI_EVENT_CALCULATOR_START	= 11,
+	WMI_EVENT_BROWSER_START		= 12,
+	WMI_EVENT_NUMLOCK_STATE		= 13,
+	WMI_EVENT_SCROLLLOCK_STATE	= 14,
+	WMI_EVENT_PERFORMANCE_PLAN	= 15,
+	WMI_EVENT_FN_J			= 16,
+	WMI_EVENT_FN_F			= 17,
+	WMI_EVENT_FN_0			= 18,
+	WMI_EVENT_FN_1			= 19,
+	WMI_EVENT_FN_2			= 20,
+	WMI_EVENT_FN_3			= 21,
+	WMI_EVENT_FN_4			= 22,
+	WMI_EVENT_FN_5			= 24,
+	WMI_EVENT_REFRESH_RATE		= 25,
+	WMI_EVENT_CPU_FAN_SPEED		= 26,
+	WMI_EVENT_GPU_FAN_SPEED		= 32,
+	WMI_EVENT_WIN_KEY_LOCK		= 33,
+	WMI_EVENT_RESERVED_23		= 34,
+	WMI_EVENT_OPEN_APP		= 35,
+};
+
+enum tongfang_mifs_event_type {
+	WMI_EVENT_TYPE_HOTKEY	= 1,
+};
+
+enum tongfang_wmi_device_type {
+	TONGFANG_WMI_CONTROL	= 0,
+	TONGFANG_WMI_EVENT	= 1,
+};
+
+struct tongfang_mifs_input {
+	u8 reserved1;
+	u8 operation;
+	u8 reserved2;
+	u8 function;
+	u8 payload[28];
+} __packed;
+
+struct tongfang_mifs_output {
+	u8 reserved1;
+	u8 operation;
+	u8 reserved2;
+	u8 function;
+	u8 data[28];
+} __packed;
+
+struct tongfang_mifs_event {
+	u8 event_type;
+	u8 event_id;
+	u8 value_low;	/* For most events, this is the value */
+	u8 value_high;	/* For fan speed events, combined with value_low */
+	u8 reserved[4];
+} __packed;
+
+static ATOMIC_NOTIFIER_HEAD(tongfang_notifier_list);
+
+enum tongfang_notifier_actions {
+	TONGFANG_NOTIFY_KBD_BRIGHTNESS,
+	TONGFANG_NOTIFY_PLATFORM_PROFILE,
+	TONGFANG_NOTIFY_HWMON,
+};
+
+struct tongfang_fan_notify_data {
+	int channel; /* 0 = CPU, 1 = GPU */
+	u16 speed;
+};
+
+struct tongfang_mifs_wmi_data {
+	struct wmi_device *wdev;
+	struct mutex lock; /* Protects WMI calls */
+	struct led_classdev kbd_led;
+	struct notifier_block notifier;
+	struct input_dev *input_dev;
+	struct device *hwmon_dev;
+	enum platform_profile_option saved_profile;
+};
+
+static int tongfang_mifs_wmi_call(struct tongfang_mifs_wmi_data *data,
+				  const struct tongfang_mifs_input *input,
+				  struct tongfang_mifs_output *output)
+{
+	struct wmi_buffer in_buf = { .length = sizeof(*input), .data = (void *)input };
+	struct wmi_buffer out_buf = { 0 };
+	int ret;
+
+	guard(mutex)(&data->lock);
+
+	ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf, output ? &out_buf : NULL);
+	if (ret)
+		return ret;
+
+	if (output) {
+		if (out_buf.length < sizeof(*output)) {
+			kfree(out_buf.data);
+			return -EIO;
+		}
+
+		memcpy(output, out_buf.data, sizeof(*output));
+
+		kfree(out_buf.data);
+	}
+
+	return 0;
+}
+
+static int laptop_profile_get(struct device *dev,
+			      enum platform_profile_option *profile)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_GET,
+		.reserved2 = 0,
+		.function = WMI_FN_SYSTEM_PER_MODE,
+	};
+	struct tongfang_mifs_output result;
+	int ret;
+
+	ret = tongfang_mifs_wmi_call(data, &input, &result);
+	if (ret)
+		return ret;
+
+	switch (result.data[0]) {
+	case WMI_PP_BALANCED:
+		*profile = PLATFORM_PROFILE_BALANCED;
+		break;
+	case WMI_PP_PERFORMANCE:
+		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
+		break;
+	case WMI_PP_QUIET:
+		*profile = PLATFORM_PROFILE_LOW_POWER;
+		break;
+	case WMI_PP_FULL_SPEED:
+		*profile = PLATFORM_PROFILE_PERFORMANCE;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int tongfang_check_performance_capability(struct tongfang_mifs_wmi_data *data)
+{
+	struct tongfang_mifs_input input = {
+		.operation = WMI_METHOD_GET,
+		.function = WMI_FN_SYSTEM_AC_TYPE,
+	};
+	struct tongfang_mifs_output output;
+	int ret;
+
+	/* Full-speed/performance mode requires DC power (not USB-C) */
+	if (!power_supply_is_system_supplied())
+		return -EOPNOTSUPP;
+
+	ret = tongfang_mifs_wmi_call(data, &input, &output);
+	if (ret)
+		return ret;
+
+	if (output.data[0] == WMI_SYSTEM_AC_TYPEC)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int laptop_profile_set(struct device *dev,
+			      enum platform_profile_option profile)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_SYSTEM_PER_MODE,
+	};
+	int ret;
+	u8 val;
+
+	switch (profile) {
+	case PLATFORM_PROFILE_LOW_POWER:
+		val = WMI_PP_QUIET;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		val = WMI_PP_BALANCED;
+		break;
+	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
+		ret = tongfang_check_performance_capability(data);
+		if (ret)
+			return ret;
+		val = WMI_PP_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_PERFORMANCE:
+		ret = tongfang_check_performance_capability(data);
+		if (ret)
+			return ret;
+		val = WMI_PP_FULL_SPEED;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	input.payload[0] = val;
+
+	return tongfang_mifs_wmi_call(data, &input, NULL);
+}
+
+static int platform_profile_probe(void *drvdata, unsigned long *choices)
+{
+	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
+	set_bit(PLATFORM_PROFILE_BALANCED, choices);
+	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
+	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
+
+	return 0;
+}
+
+static int tongfang_mifs_wmi_suspend(struct device *dev)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	enum platform_profile_option profile;
+	int ret;
+
+	ret = laptop_profile_get(dev, &profile);
+	if (ret == 0)
+		data->saved_profile = profile;
+
+	return ret;
+}
+
+static int tongfang_mifs_wmi_resume(struct device *dev)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+
+	dev_dbg(dev, "Resuming, restoring profile %d\n",
+		data->saved_profile);
+	return laptop_profile_set(dev, data->saved_profile);
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tongfang_mifs_wmi_pm_ops,
+				tongfang_mifs_wmi_suspend,
+				tongfang_mifs_wmi_resume);
+
+static const struct platform_profile_ops laptop_profile_ops = {
+	.probe = platform_profile_probe,
+	.profile_get = laptop_profile_get,
+	.profile_set = laptop_profile_set,
+};
+
+static const char *const fan_labels[] = {
+	"CPU", /* 0 */
+	"GPU", /* 1 */
+	"SYS", /* 2 */
+};
+
+static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long *val)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_GET,
+		.reserved2 = 0,
+	};
+	struct tongfang_mifs_output res;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		input.function = WMI_FN_CPU_THERMOMETER;
+		ret = tongfang_mifs_wmi_call(data, &input, &res);
+		if (!ret)
+			*val = res.data[0] * MILLIDEGREE_PER_DEGREE;
+		return ret;
+	case hwmon_fan:
+		input.function = WMI_FN_FAN_SPEEDS;
+		ret = tongfang_mifs_wmi_call(data, &input, &res);
+		if (ret)
+			break;
+
+		switch (channel) {
+		case 0: /* CPU */
+			*val = get_unaligned_le16(&res.data[0]);
+			break;
+		case 1: /* GPU */
+			*val = get_unaligned_le16(&res.data[2]);
+			break;
+		case 2: /* SYS */
+			*val = get_unaligned_le16(&res.data[6]);
+			break;
+		default:
+			ret = -EINVAL;
+			break;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static int laptop_hwmon_read_string(struct device *dev,
+				    enum hwmon_sensor_types type, u32 attr,
+				    int channel, const char **str)
+{
+	if (type == hwmon_fan && attr == hwmon_fan_label) {
+		if (channel >= 0 && channel < ARRAY_SIZE(fan_labels)) {
+			*str = fan_labels[channel];
+			return 0;
+		}
+	}
+	return -EINVAL;
+}
+
+static const struct hwmon_channel_info *laptop_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
+	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops laptop_hwmon_ops = {
+	.visible = 0444,
+	.read = laptop_hwmon_read,
+	.read_string = laptop_hwmon_read_string,
+};
+
+static const struct hwmon_chip_info laptop_chip_info = {
+	.ops = &laptop_hwmon_ops,
+	.info = laptop_hwmon_info,
+};
+
+static int laptop_kbd_led_set(struct led_classdev *led_cdev,
+			      enum led_brightness value)
+{
+	struct tongfang_mifs_wmi_data *data =
+		container_of(led_cdev, struct tongfang_mifs_wmi_data, kbd_led);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_RGB_KB_BRIGHTNESS,
+	};
+
+	input.payload[0] = (u8)value;
+
+	return tongfang_mifs_wmi_call(data, &input, NULL);
+}
+
+static enum led_brightness laptop_kbd_led_get(struct led_classdev *led_cdev)
+{
+	struct tongfang_mifs_wmi_data *data =
+		container_of(led_cdev, struct tongfang_mifs_wmi_data, kbd_led);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_GET,
+		.reserved2 = 0,
+		.function = WMI_FN_RGB_KB_BRIGHTNESS,
+	};
+	struct tongfang_mifs_output res;
+	int ret;
+
+	ret = tongfang_mifs_wmi_call(data, &input, &res);
+	if (ret)
+		return ret;
+
+	return res.data[0];
+}
+
+static const char *const gpu_mode_strings[] = {
+	"hybrid",
+	"discrete",
+	"uma",
+};
+
+/* GPU Mode: 0:Hybrid, 1:Discrete, 2:UMA */
+static ssize_t gpu_mode_show(struct device *dev, struct device_attribute *attr,
+			     char *buf)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_GET,
+		.reserved2 = 0,
+		.function = WMI_FN_GPU_MODE,
+	};
+	struct tongfang_mifs_output res;
+	u8 mode_val;
+	int ret;
+
+	ret = tongfang_mifs_wmi_call(data, &input, &res);
+
+	if (ret)
+		return ret;
+
+	mode_val = res.data[0];
+
+	if (mode_val >= ARRAY_SIZE(gpu_mode_strings))
+		return -EPROTO;
+
+	return sysfs_emit(buf, "%s\n", gpu_mode_strings[mode_val]);
+}
+
+static ssize_t gpu_mode_store(struct device *dev, struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_GPU_MODE,
+	};
+	int val;
+	int ret;
+
+	val = sysfs_match_string(gpu_mode_strings, buf);
+	if (val < 0)
+		return -EINVAL;
+
+	input.payload[0] = (u8)val;
+
+	ret = tongfang_mifs_wmi_call(data, &input, NULL);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static const char *const kb_mode_strings[] = {
+	"off",		/* 0 */
+	"cyclic",	/* 1 */
+	"fixed",	/* 2 */
+	"custom",	/* 3 */
+};
+
+static ssize_t kb_mode_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_GET,
+		.reserved2 = 0,
+		.function = WMI_FN_RGB_KB_MODE,
+	};
+	struct tongfang_mifs_output res;
+	int ret;
+	u8 mode_val;
+
+	ret = tongfang_mifs_wmi_call(data, &input, &res);
+	if (ret)
+		return ret;
+
+	mode_val = res.data[0];
+
+	if (mode_val >= ARRAY_SIZE(kb_mode_strings))
+		return -EPROTO;
+
+	return sysfs_emit(buf, "%s\n", kb_mode_strings[mode_val]);
+}
+
+static ssize_t kb_mode_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_RGB_KB_MODE,
+	};
+	// the wmi value (0, 1, 2 or 3)
+	int val;
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	val = sysfs_match_string(kb_mode_strings, buf);
+	if (val < 0)
+		return -EINVAL;
+
+	input.payload[0] = (u8)val;
+
+	ret = tongfang_mifs_wmi_call(data, &input, NULL);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+/* Fan Boost: 0:Normal, 1:Max Speed */
+static ssize_t fan_boost_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
+	struct tongfang_mifs_input input = {
+		.reserved1 = 0,
+		.operation = WMI_METHOD_SET,
+		.reserved2 = 0,
+		.function = WMI_FN_MAX_FAN_SWITCH,
+	};
+	bool val;
+	int ret;
+
+	if (!data)
+		return -EINVAL;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	input.payload[0] = 0;	/* CPU/GPU Fan */
+	input.payload[1] = val;
+
+	ret = tongfang_mifs_wmi_call(data, &input, NULL);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(gpu_mode);
+static DEVICE_ATTR_RW(kb_mode);
+static DEVICE_ATTR_WO(fan_boost);
+
+static struct attribute *laptop_attrs[] = {
+	&dev_attr_gpu_mode.attr,
+	&dev_attr_kb_mode.attr,
+	&dev_attr_fan_boost.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(laptop);
+
+static const struct key_entry tongfang_mifs_wmi_keymap[] = {
+	{ KE_KEY, WMI_EVENT_OPEN_APP, { KEY_PROG1 } },
+	{ KE_KEY, WMI_EVENT_CALCULATOR_START, { KEY_CALC } },
+	{ KE_KEY, WMI_EVENT_BROWSER_START, { KEY_WWW } },
+	{ KE_IGNORE, WMI_EVENT_FN_J, { KEY_RESERVED } },
+	{ KE_IGNORE, WMI_EVENT_FN_F, { KEY_RESERVED } },
+	{ KE_IGNORE, WMI_EVENT_FN_0, { KEY_RESERVED } },
+	{ KE_IGNORE, WMI_EVENT_FN_1, { KEY_RESERVED } },
+	{ KE_IGNORE, WMI_EVENT_FN_2, { KEY_RESERVED } },
+	{ KE_IGNORE, WMI_EVENT_FN_3, { KEY_RESERVED } },
+	{ KE_IGNORE, WMI_EVENT_FN_4, { KEY_RESERVED } },
+	{ KE_IGNORE, WMI_EVENT_FN_5, { KEY_RESERVED } },
+	{ KE_END, 0 }
+};
+
+static void tongfang_notifier_unregister(void *data)
+{
+	struct notifier_block *nb = data;
+
+	atomic_notifier_chain_unregister(&tongfang_notifier_list, nb);
+}
+
+static int tongfang_notifier_callback(struct notifier_block *nb,
+				      unsigned long action, void *data)
+{
+	struct tongfang_mifs_wmi_data *data_ctx =
+	container_of(nb, struct tongfang_mifs_wmi_data, notifier);
+	struct tongfang_fan_notify_data *fan_info;
+	u8 *brightness;
+
+	switch (action) {
+	case TONGFANG_NOTIFY_KBD_BRIGHTNESS:
+		brightness = data;
+		led_classdev_notify_brightness_hw_changed(&data_ctx->kbd_led,
+							  *brightness);
+		break;
+	case TONGFANG_NOTIFY_PLATFORM_PROFILE:
+		platform_profile_notify(&data_ctx->wdev->dev);
+		break;
+	case TONGFANG_NOTIFY_HWMON:
+		fan_info = data;
+		if (!fan_info)
+			return NOTIFY_DONE;
+
+		hwmon_notify_event(data_ctx->hwmon_dev,
+				   hwmon_fan,
+				   hwmon_fan_input,
+				   fan_info->channel);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static int tongfang_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
+{
+	struct tongfang_mifs_wmi_data *drv_data;
+	struct device *pp_dev;
+	enum tongfang_wmi_device_type dev_type =
+		(enum tongfang_wmi_device_type)(unsigned long)context;
+	int ret;
+
+	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
+	if (!drv_data)
+		return -ENOMEM;
+
+	drv_data->wdev = wdev;
+
+	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(&wdev->dev, drv_data);
+
+	if (dev_type == TONGFANG_WMI_EVENT) {
+		/* Register input device for hotkeys */
+		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
+		if (!drv_data->input_dev)
+			return -ENOMEM;
+
+		drv_data->input_dev->name = "Tongfang MIFS WMI hotkeys";
+		drv_data->input_dev->phys = "wmi/input0";
+		drv_data->input_dev->id.bustype = BUS_HOST;
+		drv_data->input_dev->dev.parent = &wdev->dev;
+
+		ret = sparse_keymap_setup(drv_data->input_dev,
+					  tongfang_mifs_wmi_keymap, NULL);
+		if (ret)
+			return ret;
+
+		ret = input_register_device(drv_data->input_dev);
+		if (ret)
+			return ret;
+
+		return 0;
+	}
+
+	/* Register platform profile */
+	pp_dev = devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_data,
+						&laptop_profile_ops);
+	if (IS_ERR(pp_dev))
+		return PTR_ERR(pp_dev);
+
+	drv_data->saved_profile = PLATFORM_PROFILE_LAST;
+
+	/* Register hwmon */
+	drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev, "tongfang_mifs",
+								   drv_data, &laptop_chip_info, NULL);
+	if (IS_ERR(drv_data->hwmon_dev))
+		return PTR_ERR(drv_data->hwmon_dev);
+
+	/* Register keyboard LED */
+	drv_data->kbd_led.name = "laptop::kbd_backlight";
+
+	drv_data->kbd_led.max_brightness = 3;
+	drv_data->kbd_led.brightness_set_blocking = laptop_kbd_led_set;
+	drv_data->kbd_led.brightness_get = laptop_kbd_led_get;
+	ret = devm_led_classdev_register(&wdev->dev, &drv_data->kbd_led);
+	if (ret)
+		return ret;
+
+	drv_data->notifier.notifier_call = tongfang_notifier_callback;
+	ret = atomic_notifier_chain_register(&tongfang_notifier_list, &drv_data->notifier);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(&wdev->dev, tongfang_notifier_unregister, &drv_data->notifier);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void tongfang_mifs_wmi_notify(struct wmi_device *wdev,
+				     const struct wmi_buffer *buffer)
+{
+	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
+	const struct tongfang_mifs_event *event;
+	struct tongfang_fan_notify_data fan_data;
+	u8 brightness;
+
+	if (buffer->length < sizeof(*event))
+		return;
+
+	event = (const struct tongfang_mifs_event *)buffer->data;
+
+	/* Validate event type */
+	if (event->event_type != WMI_EVENT_TYPE_HOTKEY)
+		return;
+
+	dev_dbg(&wdev->dev,
+		"WMI event: id=0x%02x value_low=0x%02x value_high=0x%02x\n",
+		event->event_id, event->value_low, event->value_high);
+
+	switch (event->event_id) {
+	case WMI_EVENT_KBD_BRIGHTNESS:
+		brightness = event->value_low;
+		atomic_notifier_call_chain(&tongfang_notifier_list,
+					   TONGFANG_NOTIFY_KBD_BRIGHTNESS,
+					   &brightness);
+		break;
+
+	case WMI_EVENT_PERFORMANCE_PLAN:
+		atomic_notifier_call_chain(&tongfang_notifier_list,
+					   TONGFANG_NOTIFY_PLATFORM_PROFILE,
+					   NULL);
+		break;
+
+	case WMI_EVENT_OPEN_APP:
+	case WMI_EVENT_CALCULATOR_START:
+	case WMI_EVENT_BROWSER_START:
+		if (!sparse_keymap_report_event(data->input_dev,
+						event->event_id, 1, true))
+			dev_warn(&wdev->dev, "Unknown key pressed: 0x%02x\n",
+				 event->event_id);
+		break;
+
+	/*
+	 * The device has 3 fans (CPU, GPU, SYS),
+	 * but there are only the CPU and GPU fan has events
+	 */
+	case WMI_EVENT_CPU_FAN_SPEED:
+	case WMI_EVENT_GPU_FAN_SPEED:
+		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED)
+			fan_data.channel = 0;
+		else
+			fan_data.channel = 1;
+
+		/* Fan speed is 16-bit value (value_low is LSB, value_high is MSB) */
+		fan_data.speed = (event->value_high << 8) | event->value_low;
+		atomic_notifier_call_chain(&tongfang_notifier_list,
+					   TONGFANG_NOTIFY_HWMON,
+					   &fan_data);
+		break;
+
+	case WMI_EVENT_AIRPLANE_MODE:
+	case WMI_EVENT_TOUCHPAD_STATE:
+	case WMI_EVENT_FNLOCK_STATE:
+	case WMI_EVENT_KBD_MODE:
+	case WMI_EVENT_CAPSLOCK_STATE:
+	case WMI_EVENT_NUMLOCK_STATE:
+	case WMI_EVENT_SCROLLLOCK_STATE:
+	case WMI_EVENT_REFRESH_RATE:
+	case WMI_EVENT_WIN_KEY_LOCK:
+		/* These events are informational or handled by firmware */
+		dev_dbg(&wdev->dev, "State change event: id=%d value=%d\n",
+			event->event_id, event->value_low);
+		break;
+
+	default:
+		dev_dbg(&wdev->dev, "Unknown event: id=0x%02x value=0x%02x\n",
+			event->event_id, event->value_low);
+		break;
+	}
+}
+
+static const struct wmi_device_id tongfang_mifs_wmi_id_table[] = {
+	{ TONGFANG_MIFS_GUID, (void *)TONGFANG_WMI_CONTROL },
+	{ TONGFANG_EVENT_GUID, (void *)TONGFANG_WMI_EVENT },
+	{}
+};
+MODULE_DEVICE_TABLE(wmi, tongfang_mifs_wmi_id_table);
+
+static struct wmi_driver tongfang_mifs_wmi_driver = {
+	.no_singleton = true,
+	.driver = {
+		.name = DRV_NAME,
+		.dev_groups = laptop_groups,
+		.pm = pm_sleep_ptr(&tongfang_mifs_wmi_pm_ops),
+	},
+	.id_table = tongfang_mifs_wmi_id_table,
+	.probe = tongfang_mifs_wmi_probe,
+	.notify_new = tongfang_mifs_wmi_notify,
+};
+
+module_wmi_driver(tongfang_mifs_wmi_driver);
+
+MODULE_AUTHOR("Mingyou Chen <qby140326@gmail.com>");
+MODULE_DESCRIPTION("Tongfang MIFS (MiInterface) WMI driver");
+MODULE_LICENSE("GPL");

base-commit: 2ccbdb612d0d95f25c38189b83666ff0fb2bfb47
-- 
2.51.2

