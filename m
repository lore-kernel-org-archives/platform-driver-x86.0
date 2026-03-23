Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535B239A047;
	Mon, 23 Mar 2026 12:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774267952; cv=none; b=eokcgVc1wLInsq7cD31jPLwjl3YiM5hcxKKR+zp7e6TDa9dIAK8N647+xWGfy1IiP1teA7lpqmTt1hTFvn1IAqI1tBQn8dcHbJjLZsuj/CmZqBHGsGCDFDcYIZvyCHeUiPOSqoNrtKHTG944whmCzS+ysUUBvdUxa+GwrN3fvos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774267952; c=relaxed/simple;
	bh=bPrLq2b2gJwyZ+jyxd1GE/dtmRe0lgyke0uQGq/JocA=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=U5bc7LvREN/UTtomT8ZY4m7ZH+NtqRypR9/3Syg3O09r5UMGBAzKWfBxDb1KdZtaWcUQR9kcSLcqVmbTOmp7uP8sfcWYPpMEK0IwIqJJRPrb2NpbznkI9Rj7BZeKWctqbFVV/yc5ZHY4BUqy0wuRTbMYmSDZX2gsvWOdjK3bwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RDWTfsHa; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RDWTfsHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774267947; x=1805803947;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=bPrLq2b2gJwyZ+jyxd1GE/dtmRe0lgyke0uQGq/JocA=;
  b=RDWTfsHaEvC9P+A2T6RFlO76cR4KLYK0IkNjXz4rzDdBV5YKEeKofsm1
   azV+/w6etK/oPlkZHMb7xHEcQWHE+wpRhSoCTIT2mYDQ1+peIkrBXZ0bS
   CokV0C6cSR9BjOPQ3PMyV2iCUb7jJdjg/oiJuSlg+YDIqDb1qLW7zYTOP
   o+aBSWiC2fNc5N3vDQ9ARXe0alIQxeUbWvcKAqqEPAc3IMUlQebf9tK2z
   rovijb7Qs1KyFHV5/peyCpfZAlAKmJA2LJttdvVkFC96Dn+rOVX1eSiQH
   K69yLRszZOAsP8uPLuR9FRR6zW5gwIJL+f3K85/ZEvoFjnaCoFeVzd2H3
   g==;
X-CSE-ConnectionGUID: ke3Ybn0ATFWLogIIy0ofFg==
X-CSE-MsgGUID: kTuePfSVQtWWIwY0NTj4yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="97883200"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="97883200"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:12:26 -0700
X-CSE-ConnectionGUID: peeAJp4+RAejIbLKM64ZZw==
X-CSE-MsgGUID: VTmydT4WRHyVC6yZ2XMeXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223965466"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.49])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:12:22 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 23 Mar 2026 14:12:19 +0200 (EET)
To: Mingyou Chen <qby140326@gmail.com>
cc: Armin Wolf <w_armin@gmx.de>, cryolitia.pukngae@linux.dev, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v14] platform/x86: bitland-mifs-wmi: Add new Bitland MIFS
 WMI driver
In-Reply-To: <20260307011208.16411-1-qby140326@gmail.com>
Message-ID: <af9c6790-011c-246c-fea2-029133b842e6@linux.intel.com>
References: <20260307011208.16411-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 7 Mar 2026, Mingyou Chen wrote:

> Add a new driver for Bitland laptops that utilize the MIFS (MiInterface)
> WMI interface.

Hi,

There are a few minor things still to address below, but generally the 
code looks good to me.

> The driver implements several features through the WMI interface:
> 
> - Platform Profile: Supports "Quiet", "Balanced", "Performance", and
>   "Full Speed" modes. The "Full Speed" mode is intelligently restricted
>   based on the AC adapter type (requires DC power, not supported on
>   USB-C charging) as required by the hardware.
> - Hwmon: Provides monitoring for CPU, GPU, and System fan speeds,
>   as well as CPU temperature sensors.
> - Keyboard Backlight: Integrated with the LED class device for
>   brightness control and provides sysfs attributes for keyboard modes
>   (cyclic, fixed, etc.).
> - GPU Mode: Allows switching between Hybrid, Discrete, and UMA
>   graphics modes via sysfs.
> - Hotkeys: Handles WMI events for system hotkeys (Calculator, Browser,
>   App launch) using sparse keymaps and reports status changes for
>   Airplane mode, Touchpad, and CapsLock.
> - Fan Boost: Provides a sysfs interface to force fans to maximum speed.
> 
> The driver registers two WMI GUIDs:
> - B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B: Control methods
> - 46C93E13-EE9B-4262-8488-563BCA757FEF: Event notifications
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
> v14:
>   - Add Reviewed-by
> v13:
>   - make laptop_attrs const
> v12:
>   - add depends on INPUT and select INPUT_SPARSEKMAP
>   - code cleanup - remove unnecessary ret variables
>   - add the copyright text and pr_fmt macro
>   - use blocking notifier instead of atomic notifier
>   - pass the platform profile device here instead of the WMI device at bitland_mifs_wmi_suspend
>   - remove unnecessary null checks
>   - pass the platform_profile dev to platform_profile_notify
>   - fetch led brightness from WMI on init led
>   - remove the (const struct bitland_mifs_event *) cast in bitland_mifs_wmi_notify
> v11:
>   - fix checkpatch reported issues
> v10:
>   - After some researches, I acknowledge my device is from Bitland, not
>     Tongfang. Rename the driver to bitland-mifs-wmi
> v9:
>   - Fix style issues in .rst documentation
>   - Rewrite the wmi_call func with correct usage
>   - Use power_supply_is_system_supplied in kernel instead of
>     is_ac_online
>   - Remove the PLATFORM_PROFILE_LAST check in wmi_resume function
>   - Directly return in the hwmon_temp case in hwmon_read function
>   - return -EPROTO on invalid wmi return value in gpu_mode and
>     keyboard brightness
>   - Remove thge dev_err debug messages
>   - Rewrite the wmi_notify method with .notify_new callback in
>     linux-next
>   - Call hwmon_notify_event (with a notifier) on WMI fan speed events
> 
> v8:
>   - Fix coding style issues
>   - Use MILLIDEGREE_PER_DEGREE instead of MILLI to define the temperature unit more precisely.
>   - Align lines with the first occurrence of HWMON
>   - Remove the unnecessary empty line in error handling
>   - Reverse the logic of kb_mode_strings and drop the mode_str variable
> 
> v7:
>   - Remove the unused includes (asm/)
>   - Align values with tab
>   - remove the previous test code which i forgot to remove
>   - return values directly with the "return" statement
>   - rmeove the wrong comment "Full-speed" since I've already use the value
>     "WMI_PP_FULL_SPEED" in the switch case
>   - remove the empty lines
>   - Change the two variables (val, ret) to reverse xmas-tree order.
>   - Add missing includes and sort them in the alphabetical order.
>   - use endianness types and conversion functions to parse temperature in
>     the wmi response
> 
> v6:
>   - add base commit
> 
> v5:
>   - add fallthrough on the PLATFORM_PROFILE_BALANCED_PERFORMANCE switch
>     case
> 
> v4:
>   - check the DC power state before switching to performance/full-speed mode
> 
> v3:
>   - Fix email address mismatch in Signed-off-by and From headers.
>   - implement the WMI event handler
>   - code style improvments
>   - condition on the performance platform profile switch
>   - driver documentation
> 
> v2:
>   - Add PLATFORM_PROFILE_BALANCED_PERFORMANCE platform profile support
> 
>  .../wmi/devices/bitland-mifs-wmi.rst          | 207 +++++
>  drivers/platform/x86/Kconfig                  |  18 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/bitland-mifs-wmi.c       | 851 ++++++++++++++++++
>  4 files changed, 1077 insertions(+)
>  create mode 100644 Documentation/wmi/devices/bitland-mifs-wmi.rst
>  create mode 100644 drivers/platform/x86/bitland-mifs-wmi.c
> 
> diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentation/wmi/devices/bitland-mifs-wmi.rst
> new file mode 100644
> index 000000000000..e0f6b4474013
> --- /dev/null
> +++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
> @@ -0,0 +1,207 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +========================================
> +Bitland MIFS driver (bitland-mifs-wmi)
> +========================================
> +
> +Introduction
> +============
> +
> +
> +EC WMI interface description
> +============================
> +
> +The EC WMI interface description can be decoded from the embedded binary MOF (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> +  class WMIEvent : __ExtrinsicEvent {
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("Root WMI HID_EVENT20"), guid("{46c93e13-ee9b-4262-8488-563bca757fef}")]
> +  class HID_EVENT20 : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("Root WMI HID_EVENT21"), guid("{fa78e245-2c0f-4ca1-91cf-15f34e474850}")]
> +  class HID_EVENT21 : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("Root WMI HID_EVENT22"), guid("{1dceaf0a-4d63-44bb-bd0c-0d6281bfddc5}")]
> +  class HID_EVENT22 : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("Root WMI HID_EVENT23"), guid("{3f9e3c26-b077-4f86-91f5-37ff64d8c7ed}")]
> +  class HID_EVENT23 : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, write, Description("Package Data")] uint8 EventDetail[8];
> +  };
> +
> +  [WMI, Dynamic, provider("WmiProv"), Locale("MS\\0x409"), Description("Class used to operate firmware interface"), guid("{b60bfb48-3e5b-49e4-a0e9-8cffe1b3434b}")]
> +  class MICommonInterface {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(1), Implemented, read, write, Description("Method used to support system functions.")] void MiInterface([in, Description("WMI Interface")] uint8 InData[32], [out] uint8 OutData[30], [out] uint16 Reserved);
> +  };
> +
> +Reverse-Engineering the EC WMI interface
> +========================================
> +
> +The OEM software can be download from `this link <https://iknow.lenovo.com.cn/detail/429447>`_
> +
> +Nothing is obfuscated, In this case, `ILSpy <https://github.com/icsharpcode/ILSpy>`_ could be helpful.
> +
> +WMI Methods (MICommonInterface)
> +========================================
> +
> +The ``MICommonInterface`` class (GUID: ``{b60bfb48-3e5b-49e4-a0e9-8cffe1b3434b}``)
> +is the primary control interface. It uses a 32-byte buffer for both input
> +(``InData``) and output (``OutData``).
> +
> +Method Structure
> +----------------
> +
> +The data packet follows a standardized format:
> +
> ++----------+------------------------------------------------------------------+
> +| Byte     | Description                                                      |
> ++==========+==================================================================+
> +| 1        | Method Type: Get (0xFA / 250) or Set (0xFB / 251)                |
> ++----------+------------------------------------------------------------------+
> +| 3        | Command ID (Method Name)                                         |
> ++----------+------------------------------------------------------------------+
> +| 4 - 31   | Arguments (for Set) or Return Data (for Get)                     |
> ++----------+------------------------------------------------------------------+
> +
> +
> +Command IDs
> +-----------
> +
> +The following Command IDs are used in the third byte of the buffer:
> +
> ++----------+-----------------------+------------------------------------------+
> +| ID       | Name                  | Values / Description                     |
> ++==========+=======================+==========================================+
> +| 8        | SystemPerMode         | 0: Balance, 1: Performance, 2: Quiet,    |
> +|          |                       | 3: Full-speed                            |
> ++----------+-----------------------+------------------------------------------+
> +| 9        | GPUMode               | 0: Hybrid, 1: Discrete, 2: UMA           |
> ++----------+-----------------------+------------------------------------------+
> +| 10       | KeyboardType          | 0: White, 1: Single RGB, 2: Zone RGB     |
> ++----------+-----------------------+------------------------------------------+
> +| 11       | FnLock                | 0: Off, 1: On                            |
> ++----------+-----------------------+------------------------------------------+
> +| 12       | TPLock                | 0: Unlock, 1: Lock (Touchpad)            |
> ++----------+-----------------------+------------------------------------------+
> +| 13       | CPUGPUSYSFanSpeed     | Returns 12 bytes of fan data:            |
> +|          |                       | Bytes 4-5: CPU Fan RPM (Little Endian)   |
> +|          |                       | Bytes 6-7: GPU Fan RPM (Little Endian)   |
> +|          |                       | Bytes 10-11: SYS Fan RPM (Little Endian) |
> ++----------+-----------------------+------------------------------------------+
> +| 16       | RGBKeyboardMode       | 0: Off, 1: Auto Cyclic, 2: Fixed,        |
> +|          |                       | 3: Custom                                |
> ++----------+-----------------------+------------------------------------------+
> +| 17       | RGBKeyboardColor      | Bytes 4, 5, 6: Red, Green, Blue values   |
> ++----------+-----------------------+------------------------------------------+
> +| 18       | RGBKeyboardBrightness | 0-10: Brightness Levels, 128: Auto       |
> ++----------+-----------------------+------------------------------------------+
> +| 19       | SystemAcType          | 1: Type-C, 2: Circular Hole (DC)         |
> ++----------+-----------------------+------------------------------------------+
> +| 20       | MaxFanSpeedSwitch     | Byte 4: Fan Type (0: CPU/GPU, 1: SYS)    |
> +|          |                       | Byte 5: State (0: Off, 1: On)            |
> ++----------+-----------------------+------------------------------------------+
> +| 21       | MaxFanSpeed           | Sets manual fan speed duty cycle         |
> ++----------+-----------------------+------------------------------------------+
> +| 22       | CPUThermometer        | Returns CPU Temperature                  |
> ++----------+-----------------------+------------------------------------------+
> +
> +WMI Events (HID_EVENT20)
> +========================
> +
> +The driver listens for events from the ``HID_EVENT20`` class
> +(GUID: ``{46c93e13-ee9b-4262-8488-563bca757fef}``). These events are triggered
> +by hotkeys or system state changes (e.g., plugging in AC power).
> +
> +Event Structure
> +---------------
> +
> +The event data is provided in an 8-byte array (``EventDetail``):
> +
> ++----------+------------------------------------------------------------------+
> +| Byte     | Description                                                      |
> ++==========+==================================================================+
> +| 0        | Event Type (Always 0x01 for HotKey/Notification)                 |
> ++----------+------------------------------------------------------------------+
> +| 1        | Event ID (Corresponds to the Command IDs above)                  |
> ++----------+------------------------------------------------------------------+
> +| 2        | Value (The new state or value of the feature)                    |
> ++----------+------------------------------------------------------------------+
> +
> +Common Event IDs:
> +-----------------
> +
> +Note: reserved event ids are not listed there
> +
> ++----------+------------------------------------------------------------------+
> +| Event Id | Description                                                      |
> ++==========+==================================================================+
> +| 4        | AirPlane mode change                                             |
> ++----------+------------------------------------------------------------------+
> +| 5        | Keyboard brightness change                                       |
> ++----------+------------------------------------------------------------------+
> +| 6        | touchpad state (enabled/disabled) change                         |

For consistency,

Touchpad ...

> ++----------+------------------------------------------------------------------+
> +| 7        | FnLock state (enabled/disabled) change                           |
> ++----------+------------------------------------------------------------------+
> +| 8        | Keyboard mode change                                             |
> ++----------+------------------------------------------------------------------+
> +| 9        | CapsLock state change                                            |
> ++----------+------------------------------------------------------------------+
> +| 13       | NumLock state change                                             |
> ++----------+------------------------------------------------------------------+
> +| 14       | ScrollLock state change                                          |
> ++----------+------------------------------------------------------------------+
> +| 15       | Performance plan change                                          |
> ++----------+------------------------------------------------------------------+
> +| 25       | Display refresh rate change                                      |
> ++----------+------------------------------------------------------------------+
> +| 33       | Super key lock state (enabled/disabled) change                   |
> ++----------+------------------------------------------------------------------+
> +| 35       | Open control center key                                          |
> ++----------+------------------------------------------------------------------+
> +
> +Implementation Details
> +======================
> +
> +Performance Modes
> +-----------------
> +Changing the performance mode via Command ID 0x08 (SystemPerMode) affects the power limits (PL1/PL2)
> +and fan curves managed by the Embedded Controller (EC). Note that the "Full-speed"
> +and "Performance" mode (1, 3) is typically only available when the system is connected to a DC power
> +source (not USB-C/PD).
> +
> +In the driver implementation, switch to performance/full-speed mode without DC power connected
> +will throw the EOPNOTSUPP error.

Please fold text paragraphs like these two to 80 chars. Shorter lines are 
generally easier for humans to read than very long lines.

> +
> +Graphics Switching
> +------------------
> +The ``GPUMode`` (0x09) allows switching between Hybrid (Muxless) and Discrete
> +(Muxed) graphics. Changing this value usually requires a system reboot to
> +take effect in the BIOS/Firmware.
> +
> +Fan Control
> +-----------
> +The system supports both automatic EC control and manual overrides. Command ID
> +0x14 (``MaxFanSpeedSwitch``) is used to toggle manual control, while ID 0x15
> +sets the actual PWM duty cycle.
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4cb7d97a9fcc..2ffa4ecf65b0 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -113,6 +113,24 @@ config GIGABYTE_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called gigabyte-wmi.
>  
> +config BITLAND_MIFS_WMI
> +	tristate "Bitland MIFS (MiInterface) WMI driver"
> +	depends on ACPI_WMI
> +	depends on HWMON
> +	depends on INPUT
> +	depends on POWER_SUPPLY
> +	select ACPI_PLATFORM_PROFILE
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This is a driver for Bitland MiInterface based laptops.
> +
> +	  It provides the access to the temperature, fan speed, gpu
> +	  control, keyboard backlight brightness and platform profile
> +	  via hwmon and sysfs.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +          be called bitland-mifs-wmi.
> +
>  config ACERHDF
>  	tristate "Acer Aspire One temperature and fan driver"
>  	depends on ACPI_EC && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index d25762f7114f..872ac3842391 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
>  obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
> +obj-$(CONFIG_BITLAND_MIFS_WMI)		+= bitland-mifs-wmi.o
>  
>  # Acer
>  obj-$(CONFIG_ACERHDF)		+= acerhdf.o
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> new file mode 100644
> index 000000000000..67691c2ffaf2
> --- /dev/null
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -0,0 +1,851 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux driver for Bitland notebooks.
> + *
> + * Copyright (C) 2026 2 Mingyou Chen <qby140326@gmail.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/device/devres.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/input-event-codes.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_profile.h>
> +#include <linux/pm.h>
> +#include <linux/power_supply.h>
> +#include <linux/stddef.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/unaligned.h>
> +#include <linux/units.h>
> +#include <linux/wmi.h>
> +
> +#define DRV_NAME		"bitland-mifs-wmi"
> +#define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
> +#define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
> +
> +enum bitland_mifs_operation {
> +	WMI_METHOD_GET	= 250,
> +	WMI_METHOD_SET	= 251,
> +};
> +
> +enum bitland_mifs_function {
> +	WMI_FN_SYSTEM_PER_MODE		= 8,
> +	WMI_FN_GPU_MODE			= 9,
> +	WMI_FN_KBD_TYPE			= 10,
> +	WMI_FN_FN_LOCK			= 11,
> +	WMI_FN_TP_LOCK			= 12,
> +	WMI_FN_FAN_SPEEDS		= 13,
> +	WMI_FN_RGB_KB_MODE		= 16,
> +	WMI_FN_RGB_KB_COLOR		= 17,
> +	WMI_FN_RGB_KB_BRIGHTNESS	= 18,
> +	WMI_FN_SYSTEM_AC_TYPE		= 19,
> +	WMI_FN_MAX_FAN_SWITCH		= 20,
> +	WMI_FN_MAX_FAN_SPEED		= 21,
> +	WMI_FN_CPU_THERMOMETER		= 22,
> +	WMI_FN_CPU_POWER		= 23,
> +};
> +
> +enum bitland_system_ac_mode {
> +	WMI_SYSTEM_AC_TYPEC		= 1,
> +	/* Unknown type, this is unused in the original driver */
> +	WMI_SYSTEM_AC_CIRCULARHOLE	= 2,
> +};
> +
> +enum bitland_mifs_power_profile {
> +	WMI_PP_BALANCED		= 0,
> +	WMI_PP_PERFORMANCE	= 1,
> +	WMI_PP_QUIET		= 2,
> +	WMI_PP_FULL_SPEED	= 3,
> +};
> +
> +enum bitland_mifs_event_id {
> +	WMI_EVENT_RESERVED_1		= 1,
> +	WMI_EVENT_RESERVED_2		= 2,
> +	WMI_EVENT_RESERVED_3		= 3,
> +	WMI_EVENT_AIRPLANE_MODE		= 4,
> +	WMI_EVENT_KBD_BRIGHTNESS	= 5,
> +	WMI_EVENT_TOUCHPAD_STATE	= 6,
> +	WMI_EVENT_FNLOCK_STATE		= 7,
> +	WMI_EVENT_KBD_MODE		= 8,
> +	WMI_EVENT_CAPSLOCK_STATE	= 9,
> +	WMI_EVENT_CALCULATOR_START	= 11,
> +	WMI_EVENT_BROWSER_START		= 12,
> +	WMI_EVENT_NUMLOCK_STATE		= 13,
> +	WMI_EVENT_SCROLLLOCK_STATE	= 14,
> +	WMI_EVENT_PERFORMANCE_PLAN	= 15,
> +	WMI_EVENT_FN_J			= 16,
> +	WMI_EVENT_FN_F			= 17,
> +	WMI_EVENT_FN_0			= 18,
> +	WMI_EVENT_FN_1			= 19,
> +	WMI_EVENT_FN_2			= 20,
> +	WMI_EVENT_FN_3			= 21,
> +	WMI_EVENT_FN_4			= 22,
> +	WMI_EVENT_FN_5			= 24,
> +	WMI_EVENT_REFRESH_RATE		= 25,
> +	WMI_EVENT_CPU_FAN_SPEED		= 26,
> +	WMI_EVENT_GPU_FAN_SPEED		= 32,
> +	WMI_EVENT_WIN_KEY_LOCK		= 33,
> +	WMI_EVENT_RESERVED_23		= 34,
> +	WMI_EVENT_OPEN_APP		= 35,
> +};
> +
> +enum bitland_mifs_event_type {
> +	WMI_EVENT_TYPE_HOTKEY	= 1,
> +};
> +
> +enum bitland_wmi_device_type {
> +	BITLAND_WMI_CONTROL	= 0,
> +	BITLAND_WMI_EVENT	= 1,
> +};
> +
> +struct bitland_mifs_input {
> +	u8 reserved1;
> +	u8 operation;
> +	u8 reserved2;
> +	u8 function;
> +	u8 payload[28];
> +} __packed;
> +
> +struct bitland_mifs_output {
> +	u8 reserved1;
> +	u8 operation;
> +	u8 reserved2;
> +	u8 function;
> +	u8 data[28];
> +} __packed;
> +
> +struct bitland_mifs_event {
> +	u8 event_type;
> +	u8 event_id;
> +	u8 value_low;	/* For most events, this is the value */
> +	u8 value_high;	/* For fan speed events, combined with value_low */
> +	u8 reserved[4];
> +} __packed;
> +
> +static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
> +
> +enum bitland_notifier_actions {
> +	BITLAND_NOTIFY_KBD_BRIGHTNESS,
> +	BITLAND_NOTIFY_PLATFORM_PROFILE,
> +	BITLAND_NOTIFY_HWMON,
> +};
> +
> +struct bitland_fan_notify_data {
> +	int channel; /* 0 = CPU, 1 = GPU */
> +	u16 speed;
> +};
> +
> +struct bitland_mifs_wmi_data {
> +	struct wmi_device *wdev;
> +	struct mutex lock; /* Protects WMI calls */

Align the comment a bit more to right as you've space there so it won't 
mix up with the structure members visually.

> +	struct led_classdev kbd_led;
> +	struct notifier_block notifier;
> +	struct input_dev *input_dev;
> +	struct device *hwmon_dev;
> +	struct device *pp_dev;
> +	enum platform_profile_option saved_profile;
> +};
> +
> +static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
> +				 const struct bitland_mifs_input *input,
> +				 struct bitland_mifs_output *output)
> +{
> +	struct wmi_buffer in_buf = { .length = sizeof(*input), .data = (void *)input };
> +	struct wmi_buffer out_buf = { 0 };
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf, output ? &out_buf : NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (output) {

Please create a local variable here for out_buf.data and use __free(kfree) 
instead of manually calling kfree() in multiple places.

> +		if (out_buf.length < sizeof(*output)) {
> +			kfree(out_buf.data);
> +			return -EIO;
> +		}
> +
> +		memcpy(output, out_buf.data, sizeof(*output));
> +
> +		kfree(out_buf.data);
> +	}
> +
> +	return 0;
> +}
> +
> +static int laptop_profile_get(struct device *dev,
> +			      enum platform_profile_option *profile)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_SYSTEM_PER_MODE,
> +	};
> +	struct bitland_mifs_output result;
> +	int ret;
> +
> +	ret = bitland_mifs_wmi_call(data, &input, &result);
> +	if (ret)
> +		return ret;
> +
> +	switch (result.data[0]) {
> +	case WMI_PP_BALANCED:
> +		*profile = PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case WMI_PP_PERFORMANCE:
> +		*profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +		break;
> +	case WMI_PP_QUIET:
> +		*profile = PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case WMI_PP_FULL_SPEED:
> +		*profile = PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int bitland_check_performance_capability(struct bitland_mifs_wmi_data *data)
> +{
> +	struct bitland_mifs_input input = {
> +		.operation = WMI_METHOD_GET,
> +		.function = WMI_FN_SYSTEM_AC_TYPE,
> +	};
> +	struct bitland_mifs_output output;
> +	int ret;
> +
> +	/* Full-speed/performance mode requires DC power (not USB-C) */
> +	if (!power_supply_is_system_supplied())
> +		return -EOPNOTSUPP;
> +
> +	ret = bitland_mifs_wmi_call(data, &input, &output);
> +	if (ret)
> +		return ret;
> +
> +	if (output.data[0] != WMI_SYSTEM_AC_CIRCULARHOLE)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static int laptop_profile_set(struct device *dev,
> +			      enum platform_profile_option profile)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_SYSTEM_PER_MODE,
> +	};
> +	int ret;
> +	u8 val;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		val = WMI_PP_QUIET;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		val = WMI_PP_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		ret = bitland_check_performance_capability(data);
> +		if (ret)
> +			return ret;
> +		val = WMI_PP_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		ret = bitland_check_performance_capability(data);
> +		if (ret)
> +			return ret;
> +		val = WMI_PP_FULL_SPEED;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	input.payload[0] = val;
> +
> +	return bitland_mifs_wmi_call(data, &input, NULL);
> +}
> +
> +static int platform_profile_probe(void *drvdata, unsigned long *choices)
> +{
> +	set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +	set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
> +
> +	return 0;
> +}
> +
> +static int bitland_mifs_wmi_suspend(struct device *dev)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	enum platform_profile_option profile;
> +	int ret;
> +
> +	ret = laptop_profile_get(data->pp_dev, &profile);
> +	if (ret == 0)
> +		data->saved_profile = profile;
> +
> +	return ret;
> +}
> +
> +static int bitland_mifs_wmi_resume(struct device *dev)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "Resuming, restoring profile %d\n",
> +		data->saved_profile);

Fits to one line.

> +	return laptop_profile_set(dev, data->saved_profile);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
> +				bitland_mifs_wmi_suspend,
> +				bitland_mifs_wmi_resume);
> +
> +static const struct platform_profile_ops laptop_profile_ops = {
> +	.probe = platform_profile_probe,
> +	.profile_get = laptop_profile_get,
> +	.profile_set = laptop_profile_set,
> +};
> +
> +static const char *const fan_labels[] = {
> +	"CPU", /* 0 */
> +	"GPU", /* 1 */
> +	"SYS", /* 2 */
> +};
> +
> +static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			     u32 attr, int channel, long *val)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +	};
> +	struct bitland_mifs_output res;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		input.function = WMI_FN_CPU_THERMOMETER;
> +		ret = bitland_mifs_wmi_call(data, &input, &res);
> +		if (!ret)
> +			*val = res.data[0] * MILLIDEGREE_PER_DEGREE;
> +		return ret;
> +	case hwmon_fan:
> +		input.function = WMI_FN_FAN_SPEEDS;
> +		ret = bitland_mifs_wmi_call(data, &input, &res);
> +		if (ret)
> +			return ret;
> +
> +		switch (channel) {
> +		case 0: /* CPU */
> +			*val = get_unaligned_le16(&res.data[0]);
> +			return 0;
> +		case 1: /* GPU */
> +			*val = get_unaligned_le16(&res.data[2]);
> +			return 0;
> +		case 2: /* SYS */
> +			*val = get_unaligned_le16(&res.data[6]);
> +			return 0;
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int laptop_hwmon_read_string(struct device *dev,
> +				    enum hwmon_sensor_types type, u32 attr,
> +				    int channel, const char **str)
> +{
> +	if (type == hwmon_fan && attr == hwmon_fan_label) {
> +		if (channel >= 0 && channel < ARRAY_SIZE(fan_labels)) {

Please add include for ARRAY_SIZE().

> +			*str = fan_labels[channel];
> +			return 0;
> +		}
> +	}
> +	return -EINVAL;
> +}
> +
> +static const struct hwmon_channel_info *laptop_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),

> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),

Please align these such that all first HWMON_*s align.

> +	NULL
> +};
> +
> +static const struct hwmon_ops laptop_hwmon_ops = {
> +	.visible = 0444,
> +	.read = laptop_hwmon_read,
> +	.read_string = laptop_hwmon_read_string,
> +};
> +
> +static const struct hwmon_chip_info laptop_chip_info = {
> +	.ops = &laptop_hwmon_ops,
> +	.info = laptop_hwmon_info,
> +};
> +
> +static int laptop_kbd_led_set(struct led_classdev *led_cdev,
> +			      enum led_brightness value)
> +{
> +	struct bitland_mifs_wmi_data *data =
> +		container_of(led_cdev, struct bitland_mifs_wmi_data, kbd_led);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_RGB_KB_BRIGHTNESS,
> +	};
> +
> +	input.payload[0] = (u8)value;
> +
> +	return bitland_mifs_wmi_call(data, &input, NULL);
> +}
> +
> +static enum led_brightness laptop_kbd_led_get(struct led_classdev *led_cdev)
> +{
> +	struct bitland_mifs_wmi_data *data =
> +		container_of(led_cdev, struct bitland_mifs_wmi_data, kbd_led);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_RGB_KB_BRIGHTNESS,
> +	};
> +	struct bitland_mifs_output res;
> +	int ret;
> +
> +	ret = bitland_mifs_wmi_call(data, &input, &res);
> +	if (ret)
> +		return ret;
> +
> +	return res.data[0];
> +}
> +
> +static const char *const gpu_mode_strings[] = {
> +	"hybrid",
> +	"discrete",
> +	"uma",
> +};
> +
> +/* GPU Mode: 0:Hybrid, 1:Discrete, 2:UMA */
> +static ssize_t gpu_mode_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_GPU_MODE,
> +	};
> +	struct bitland_mifs_output res;
> +	u8 mode_val;
> +	int ret;
> +
> +	ret = bitland_mifs_wmi_call(data, &input, &res);
> +
> +	if (ret)

Please don't leave empty lines between a call and its error handling.

> +		return ret;
> +
> +	mode_val = res.data[0];
> +
> +	if (mode_val >= ARRAY_SIZE(gpu_mode_strings))

Here too, I'd remove the empty line in between the assignment and the 
bounds check as it's kind of "error handling".

> +		return -EPROTO;
> +
> +	return sysfs_emit(buf, "%s\n", gpu_mode_strings[mode_val]);
> +}
> +
> +static ssize_t gpu_mode_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_GPU_MODE,
> +	};
> +	int val;
> +	int ret;
> +
> +	val = sysfs_match_string(gpu_mode_strings, buf);
> +	if (val < 0)
> +		return -EINVAL;
> +
> +	input.payload[0] = (u8)val;
> +
> +	ret = bitland_mifs_wmi_call(data, &input, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static const char *const kb_mode_strings[] = {
> +	"off",		/* 0 */
> +	"cyclic",	/* 1 */
> +	"fixed",	/* 2 */
> +	"custom",	/* 3 */
> +};
> +
> +static ssize_t kb_mode_show(struct device *dev, struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_RGB_KB_MODE,
> +	};
> +	struct bitland_mifs_output res;
> +	int ret;
> +	u8 mode_val;

Reverse xmas tree order.

> +
> +	ret = bitland_mifs_wmi_call(data, &input, &res);
> +	if (ret)
> +		return ret;
> +
> +	mode_val = res.data[0];
> +
> +	if (mode_val >= ARRAY_SIZE(kb_mode_strings))

Remove empty line in between

> +		return -EPROTO;
> +
> +	return sysfs_emit(buf, "%s\n", kb_mode_strings[mode_val]);
> +}
> +
> +static ssize_t kb_mode_store(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_RGB_KB_MODE,
> +	};
> +	// the wmi value (0, 1, 2 or 3)
> +	int val;
> +	int ret;
> +
> +	val = sysfs_match_string(kb_mode_strings, buf);
> +	if (val < 0)
> +		return -EINVAL;
> +
> +	input.payload[0] = (u8)val;
> +
> +	ret = bitland_mifs_wmi_call(data, &input, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +/* Fan Boost: 0:Normal, 1:Max Speed */
> +static ssize_t fan_boost_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct bitland_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_MAX_FAN_SWITCH,
> +	};
> +	bool val;
> +	int ret;
> +
> +	if (kstrtobool(buf, &val))
> +		return -EINVAL;
> +
> +	input.payload[0] = 0;	/* CPU/GPU Fan */
> +	input.payload[1] = val;
> +
> +	ret = bitland_mifs_wmi_call(data, &input, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static const DEVICE_ATTR_RW(gpu_mode);
> +static const DEVICE_ATTR_RW(kb_mode);
> +static const DEVICE_ATTR_WO(fan_boost);
> +
> +static const struct attribute *const laptop_attrs[] = {
> +	&dev_attr_gpu_mode.attr,
> +	&dev_attr_kb_mode.attr,
> +	&dev_attr_fan_boost.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(laptop);
> +
> +static const struct key_entry bitland_mifs_wmi_keymap[] = {
> +	{ KE_KEY, WMI_EVENT_OPEN_APP, { KEY_PROG1 } },
> +	{ KE_KEY, WMI_EVENT_CALCULATOR_START, { KEY_CALC } },
> +	{ KE_KEY, WMI_EVENT_BROWSER_START, { KEY_WWW } },
> +	{ KE_IGNORE, WMI_EVENT_FN_J, { KEY_RESERVED } },
> +	{ KE_IGNORE, WMI_EVENT_FN_F, { KEY_RESERVED } },
> +	{ KE_IGNORE, WMI_EVENT_FN_0, { KEY_RESERVED } },
> +	{ KE_IGNORE, WMI_EVENT_FN_1, { KEY_RESERVED } },
> +	{ KE_IGNORE, WMI_EVENT_FN_2, { KEY_RESERVED } },
> +	{ KE_IGNORE, WMI_EVENT_FN_3, { KEY_RESERVED } },
> +	{ KE_IGNORE, WMI_EVENT_FN_4, { KEY_RESERVED } },
> +	{ KE_IGNORE, WMI_EVENT_FN_5, { KEY_RESERVED } },
> +	{ KE_END, 0 }
> +};
> +
> +static void bitland_notifier_unregister(void *data)
> +{
> +	struct notifier_block *nb = data;
> +
> +	blocking_notifier_chain_unregister(&bitland_notifier_list, nb);
> +}
> +
> +static int bitland_notifier_callback(struct notifier_block *nb,
> +				     unsigned long action, void *data)
> +{
> +	struct bitland_mifs_wmi_data *data_ctx =
> +	container_of(nb, struct bitland_mifs_wmi_data, notifier);

This is misindented.

Please add include for container_of().

> +	struct bitland_fan_notify_data *fan_info;
> +	u8 *brightness;
> +
> +	switch (action) {
> +	case BITLAND_NOTIFY_KBD_BRIGHTNESS:
> +		brightness = data;
> +		led_classdev_notify_brightness_hw_changed(&data_ctx->kbd_led,
> +							  *brightness);
> +		break;
> +	case BITLAND_NOTIFY_PLATFORM_PROFILE:
> +		platform_profile_notify(data_ctx->pp_dev);
> +		break;
> +	case BITLAND_NOTIFY_HWMON:
> +		fan_info = data;
> +
> +		hwmon_notify_event(data_ctx->hwmon_dev,
> +				   hwmon_fan,
> +				   hwmon_fan_input,
> +				   fan_info->channel);

This fits to less lines.

> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct bitland_mifs_wmi_data *drv_data;
> +	enum bitland_wmi_device_type dev_type =
> +		(enum bitland_wmi_device_type)(unsigned long)context;
> +	struct led_init_data init_data = {
> +		.devicename = DRV_NAME,
> +		.default_label = ":" LED_FUNCTION_KBD_BACKLIGHT,
> +		.devname_mandatory = true,
> +	};
> +	int ret;
> +
> +	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
> +	if (!drv_data)
> +		return -ENOMEM;
> +
> +	drv_data->wdev = wdev;
> +
> +	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&wdev->dev, drv_data);
> +
> +	if (dev_type == BITLAND_WMI_EVENT) {
> +		/* Register input device for hotkeys */
> +		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
> +		if (!drv_data->input_dev)
> +			return -ENOMEM;
> +
> +		drv_data->input_dev->name = "Bitland MIFS WMI hotkeys";
> +		drv_data->input_dev->phys = "wmi/input0";
> +		drv_data->input_dev->id.bustype = BUS_HOST;
> +		drv_data->input_dev->dev.parent = &wdev->dev;
> +
> +		ret = sparse_keymap_setup(drv_data->input_dev,
> +					  bitland_mifs_wmi_keymap, NULL);
> +		if (ret)
> +			return ret;
> +
> +		return input_register_device(drv_data->input_dev);
> +	}
> +
> +	/* Register platform profile */
> +	drv_data->pp_dev = devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_data,
> +							  &laptop_profile_ops);
> +	if (IS_ERR(drv_data->pp_dev))
> +		return PTR_ERR(drv_data->pp_dev);
> +
> +	/* Register hwmon */
> +	drv_data->hwmon_dev = devm_hwmon_device_register_with_info(&wdev->dev,
> +								   "bitland_mifs",
> +								   drv_data,
> +								   &laptop_chip_info,
> +								   NULL);
> +	if (IS_ERR(drv_data->hwmon_dev))
> +		return PTR_ERR(drv_data->hwmon_dev);
> +
> +	/* Register keyboard LED */
> +	drv_data->kbd_led.max_brightness = 3;
> +	drv_data->kbd_led.brightness_set_blocking = laptop_kbd_led_set;
> +	drv_data->kbd_led.brightness_get = laptop_kbd_led_get;
> +	drv_data->kbd_led.brightness = laptop_kbd_led_get(&drv_data->kbd_led);
> +	drv_data->kbd_led.flags = LED_CORE_SUSPENDRESUME |
> +				  LED_BRIGHT_HW_CHANGED |
> +				  LED_REJECT_NAME_CONFLICT;
> +	ret = devm_led_classdev_register_ext(&wdev->dev, &drv_data->kbd_led, &init_data);
> +	if (ret)
> +		return ret;
> +
> +	drv_data->notifier.notifier_call = bitland_notifier_callback;
> +	ret = blocking_notifier_chain_register(&bitland_notifier_list, &drv_data->notifier);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(&wdev->dev,
> +				       bitland_notifier_unregister,
> +				       &drv_data->notifier);
> +}
> +
> +static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
> +				    const struct wmi_buffer *buffer)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
> +	const struct bitland_mifs_event *event;
> +	struct bitland_fan_notify_data fan_data;
> +	u8 brightness;
> +
> +	if (buffer->length < sizeof(*event))
> +		return;
> +
> +	event = buffer->data;
> +
> +	/* Validate event type */
> +	if (event->event_type != WMI_EVENT_TYPE_HOTKEY)
> +		return;
> +
> +	dev_dbg(&wdev->dev,
> +		"WMI event: id=0x%02x value_low=0x%02x value_high=0x%02x\n",
> +		event->event_id, event->value_low, event->value_high);
> +
> +	switch (event->event_id) {
> +	case WMI_EVENT_KBD_BRIGHTNESS:
> +		brightness = event->value_low;
> +		blocking_notifier_call_chain(&bitland_notifier_list,
> +					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
> +					     &brightness);
> +		break;
> +
> +	case WMI_EVENT_PERFORMANCE_PLAN:
> +		blocking_notifier_call_chain(&bitland_notifier_list,
> +					     BITLAND_NOTIFY_PLATFORM_PROFILE,
> +					     NULL);
> +		break;
> +
> +	case WMI_EVENT_OPEN_APP:
> +	case WMI_EVENT_CALCULATOR_START:
> +	case WMI_EVENT_BROWSER_START: {
> +		guard(mutex)(&data->lock);
> +		if (!sparse_keymap_report_event(data->input_dev,
> +						event->event_id, 1, true))
> +			dev_warn(&wdev->dev, "Unknown key pressed: 0x%02x\n",
> +				 event->event_id);
> +		break;
> +	}
> +
> +	/*
> +	 * The device has 3 fans (CPU, GPU, SYS),
> +	 * but there are only the CPU and GPU fan has events
> +	 */
> +	case WMI_EVENT_CPU_FAN_SPEED:
> +	case WMI_EVENT_GPU_FAN_SPEED:
> +		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED)
> +			fan_data.channel = 0;
> +		else
> +			fan_data.channel = 1;
> +
> +		/* Fan speed is 16-bit value (value_low is LSB, value_high is MSB) */
> +		fan_data.speed = (event->value_high << 8) | event->value_low;
> +		blocking_notifier_call_chain(&bitland_notifier_list,
> +					     BITLAND_NOTIFY_HWMON,
> +					     &fan_data);
> +		break;
> +
> +	case WMI_EVENT_AIRPLANE_MODE:
> +	case WMI_EVENT_TOUCHPAD_STATE:
> +	case WMI_EVENT_FNLOCK_STATE:
> +	case WMI_EVENT_KBD_MODE:
> +	case WMI_EVENT_CAPSLOCK_STATE:
> +	case WMI_EVENT_NUMLOCK_STATE:
> +	case WMI_EVENT_SCROLLLOCK_STATE:
> +	case WMI_EVENT_REFRESH_RATE:
> +	case WMI_EVENT_WIN_KEY_LOCK:
> +		/* These events are informational or handled by firmware */
> +		dev_dbg(&wdev->dev, "State change event: id=%d value=%d\n",
> +			event->event_id, event->value_low);
> +		break;
> +
> +	default:
> +		dev_dbg(&wdev->dev, "Unknown event: id=0x%02x value=0x%02x\n",
> +			event->event_id, event->value_low);
> +		break;
> +	}
> +}
> +
> +static const struct wmi_device_id bitland_mifs_wmi_id_table[] = {
> +	{ BITLAND_MIFS_GUID, (void *)BITLAND_WMI_CONTROL },
> +	{ BITLAND_EVENT_GUID, (void *)BITLAND_WMI_EVENT },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(wmi, bitland_mifs_wmi_id_table);
> +
> +static struct wmi_driver bitland_mifs_wmi_driver = {
> +	.no_singleton = true,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.dev_groups = laptop_groups,
> +		.pm = pm_sleep_ptr(&bitland_mifs_wmi_pm_ops),
> +	},
> +	.id_table = bitland_mifs_wmi_id_table,
> +	.probe = bitland_mifs_wmi_probe,
> +	.notify_new = bitland_mifs_wmi_notify,
> +};
> +
> +module_wmi_driver(bitland_mifs_wmi_driver);
> +
> +MODULE_AUTHOR("Mingyou Chen <qby140326@gmail.com>");
> +MODULE_DESCRIPTION("Bitland MIFS (MiInterface) WMI driver");
> +MODULE_LICENSE("GPL");
> 
> base-commit: d9d32e5bd5a4e57675f2b70ddf73c3dc5cf44fc2
> 

-- 
 i.

