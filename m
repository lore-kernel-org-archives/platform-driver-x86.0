Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C8C33372B;
	Mon, 26 Jan 2026 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428346; cv=none; b=Rwl5QWEwuDFg55PykwwrfpBB+UnWmN2EcZHfRY70tloOUClx9a+m6k1eMlWYadLv9+CXsWgTacT3rqHMuO3gkAFYAULUFEaadpjbGDx+TabjRyf4NzU8YZb+y+9xmvzYJoSZJn+PwPDyurAD5lKCnjMGOwCBNgJn/pVqoN7wxO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428346; c=relaxed/simple;
	bh=FLAvmJSmX/b3PhOoygPCgVvgGr3C6MU8JQMQye5MreY=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=MnhhflypJrQzA8clYZ5Tg8qrdxrfm5wfjDLXmlEsJ1fm8NlquA4XI66/94vbXk4SNYcKoa11/Rr/FK/Rj95sUT/qWsKbb6Vm9GBxhAmVdBbGfVKhPRXw9OXaazUoQ9QniE6xYssJyO0gRuYT7cRJOYiuu0EnIneLLAUBp38vT2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVhmytt0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVhmytt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769428344; x=1800964344;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FLAvmJSmX/b3PhOoygPCgVvgGr3C6MU8JQMQye5MreY=;
  b=jVhmytt05sSlofcTpE5t8SP10yOBxTd57nP59YWXMT+MTb013Zz15qs+
   caPaWbSqpn3clYfw4FUejxMzkWxnXbc1BnXGJ6LlTfPjjFSgKWp/MXzvf
   3heVfDEUFQyPCvFFSg5flyWP/3F64zglF62uOltvltmpD9vp7STeZSXcN
   IXhT0drCNM9PjFjQ2W++TpJIEc1VLQSHl11YqHXtofniy8MIBgLlYO6i1
   diYpRCOFJfOfJhO+r1NZ8l+4uAPWbNAH7Eca6as/cuwM1OMje3KeA4E4I
   d1Ilf43ozIqRf/joGRkuZUqzValQB8U2LA27u3SMGhMpmn85boHFuhrfQ
   w==;
X-CSE-ConnectionGUID: GMHqEAkQT8aFhK8z8Y0jUA==
X-CSE-MsgGUID: AfqdJP3EST2MxIkuE/E0Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70659341"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70659341"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:52:23 -0800
X-CSE-ConnectionGUID: A+g1/ySlTSKime0MEWO5fA==
X-CSE-MsgGUID: G8UO7glFT8O9Yu9YgQzfLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="207467001"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.150])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 03:52:20 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 Jan 2026 13:52:14 +0200 (EET)
To: Mingyou Chen <qby140326@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, cryolitia.pukngae@linux.dev
Subject: Re: [PATCH v6] platform/x86: tongfang-mifs-wmi: Add new Tongfang
 MIFS WMI driver
In-Reply-To: <20260126085713.48836-1-qby140326@gmail.com>
Message-ID: <64a11a76-7f0c-ff3c-e7e9-679aa5cc7870@linux.intel.com>
References: <20260126085713.48836-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 26 Jan 2026, Mingyou Chen wrote:

> Add a new driver for Tongfang laptops that utilize the MIFS
> (MiInterface)
> WMI interface. This interface is commonly found in various rebranded
> laptops from manufacturers like Mechrevo, XMG, Eluktronics, and others.
> 
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
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>

Please do not submit so many versions so fast but give reviewers time to 
comment on your patch. You've barely started and are already at v6.

> ---

What has changed from v1 to v6? Always when poisting a new version list
changes you've made in each version here under --- line.

>  .../wmi/devices/tongfang-mifs-wmi.rst         | 210 +++++
>  drivers/platform/x86/Kconfig                  |  17 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/tongfang-mifs-wmi.c      | 849 ++++++++++++++++++
>  4 files changed, 1077 insertions(+)
>  create mode 100644 Documentation/wmi/devices/tongfang-mifs-wmi.rst
>  create mode 100644 drivers/platform/x86/tongfang-mifs-wmi.c
> 
> diff --git a/Documentation/wmi/devices/tongfang-mifs-wmi.rst b/Documentation/wmi/devices/tongfang-mifs-wmi.rst
> new file mode 100644
> index 000000000000..e59873a249c1
> --- /dev/null
> +++ b/Documentation/wmi/devices/tongfang-mifs-wmi.rst
> @@ -0,0 +1,210 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +========================================
> +Tongfang MIFS driver (tongfang-mifs-wmi)
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
> +::
> +
> +
> +Reverse-Engineering the EC WMI interface
> +========================================
> +
> +The OEM software can be download from `this link <https://iknow.lenovo.com.cn/detail/429447>`_
> +
> +Nothing is obfuscated, In this case, `ILSpy <https://github.com/icsharpcode/ILSpy>`_ could be helpful.
> +
> +WMI Methods (MICommonInterface)
> +==============================
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
> index 4cb7d97a9fcc..8073920ae4a2 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -113,6 +113,23 @@ config GIGABYTE_WMI
>  	  To compile this driver as a module, choose M here: the module will
>  	  be called gigabyte-wmi.
>  
> +
> +config TONGFANG_MIFS_WMI
> +	tristate "Tongfang MIFS (MiInterface) WMI driver"
> +	depends on ACPI_WMI
> +	depends on HWMON
> +	depends on POWER_SUPPLY
> +	select ACPI_PLATFORM_PROFILE
> +	help
> +	  This is a driver for Tongfang MiInterface based laptops.
> +
> +	  It provides the access to the temperature, fan speed, gpu
> +	  control, keyboard backlight brightness and platform profile
> +	  via hwmon and sysfs.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +          be called tongfang-mifs-wmi.
> +
>  config ACERHDF
>  	tristate "Acer Aspire One temperature and fan driver"
>  	depends on ACPI_EC && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index d25762f7114f..1160c726bda6 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+= nvidia-wmi-ec-backlight.o
>  obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
>  obj-$(CONFIG_REDMI_WMI)			+= redmi-wmi.o
>  obj-$(CONFIG_GIGABYTE_WMI)		+= gigabyte-wmi.o
> +obj-$(CONFIG_TONGFANG_MIFS_WMI)		+= tongfang-mifs-wmi.o
>  
>  # Acer
>  obj-$(CONFIG_ACERHDF)		+= acerhdf.o
> diff --git a/drivers/platform/x86/tongfang-mifs-wmi.c b/drivers/platform/x86/tongfang-mifs-wmi.c
> new file mode 100644
> index 000000000000..85b626602611
> --- /dev/null
> +++ b/drivers/platform/x86/tongfang-mifs-wmi.c
> @@ -0,0 +1,849 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include "asm-generic/errno-base.h"
> +#include "asm-generic/errno.h"

"..." ???

As a generic guidance, don't use asm-generic but asm/.

But here you can just include <linux/errno.h> and neither of the asm 
headers, both of those will always come through linux/errno.h (you can 
rely on it, this is one of the exceptions).

> +#include "linux/err.h"
> +#include "linux/input-event-codes.h"
> +#include "linux/input.h"
> +#include "linux/input/sparse-keymap.h"
> +#include "linux/power_supply.h"
> +#include "linux/stddef.h"
> +#include "linux/string.h"
> +#include <linux/cleanup.h>
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_profile.h>
> +#include <linux/sysfs.h>
> +#include <linux/wmi.h>

Alphabetical order.

> +#define DRV_NAME "tongfang-mifs-wmi"
> +#define TONGFANG_MIFS_GUID "B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
> +#define TONGFANG_EVENT_GUID "46C93E13-EE9B-4262-8488-563BCA757FEF"

Align values.

> +#define WMI_BUFFER_SIZE 32
> +
> +static char *profile_state_path = "/sys/firmware/acpi/platform_profile_last";
> +module_param(profile_state_path, charp, 0644);
> +MODULE_PARM_DESC(profile_state_path, "Path to store profile state");

What is this for???

> +enum tongfang_mifs_operation {
> +	WMI_METHOD_GET = 250,
> +	WMI_METHOD_SET = 251,
> +};
> +
> +enum tongang_mifs_function {
> +	WMI_FN_SYSTEM_PER_MODE = 8,
> +	WMI_FN_GPU_MODE = 9,
> +	WMI_FN_KBD_TYPE = 10,
> +	WMI_FN_FN_LOCK = 11,
> +	WMI_FN_TP_LOCK = 12,
> +	WMI_FN_FAN_SPEEDS = 13,
> +	WMI_FN_RGB_KB_MODE = 16,
> +	WMI_FN_RGB_KB_COLOR = 17,
> +	WMI_FN_RGB_KB_BRIGHTNESS = 18,
> +	WMI_FN_SYSTEM_AC_TYPE = 19,
> +	WMI_FN_MAX_FAN_SWITCH = 20,
> +	WMI_FN_MAX_FAN_SPEED = 21,
> +	WMI_FN_CPU_THERMOMETER = 22,
> +	WMI_FN_CPU_POWER = 23,

Align all values with in block like this.

> +};
> +
> +enum tongfang_system_ac_mode {
> +	WMI_SYSTEM_AC_TYPEC = 1,
> +	WMI_SYSTEM_AC_CIRCULARHOLE = 2, /* Unknown type, this is unused in the original driver */
> +};
> +
> +enum tongfang_mifs_power_profile {
> +	WMI_PP_BALANCED = 0,
> +	WMI_PP_PERFORMANCE = 1,
> +	WMI_PP_QUIET = 2,
> +	WMI_PP_FULL_SPEED = 3,
> +};
> +
> +enum tongfang_mifs_event_id {
> +	WMI_EVENT_RESERVED_1 = 1,
> +	WMI_EVENT_RESERVED_2 = 2,
> +	WMI_EVENT_RESERVED_3 = 3,
> +	WMI_EVENT_AIRPLANE_MODE = 4,
> +	WMI_EVENT_KBD_BRIGHTNESS = 5,
> +	WMI_EVENT_TOUCHPAD_STATE = 6,
> +	WMI_EVENT_FNLOCK_STATE = 7,
> +	WMI_EVENT_KBD_MODE = 8,
> +	WMI_EVENT_CAPSLOCK_STATE = 9,
> +	WMI_EVENT_CALCULATOR_START = 11,
> +	WMI_EVENT_BROWSER_START = 12,
> +	WMI_EVENT_NUMLOCK_STATE = 13,
> +	WMI_EVENT_SCROLLLOCK_STATE = 14,
> +	WMI_EVENT_PERFORMANCE_PLAN = 15,
> +	WMI_EVENT_FN_J = 16,
> +	WMI_EVENT_FN_F = 17,
> +	WMI_EVENT_FN_0 = 18,
> +	WMI_EVENT_FN_1 = 19,
> +	WMI_EVENT_FN_2 = 20,
> +	WMI_EVENT_FN_3 = 21,
> +	WMI_EVENT_FN_4 = 22,
> +	WMI_EVENT_FN_5 = 24,
> +	WMI_EVENT_REFRESH_RATE = 25,
> +	WMI_EVENT_CPU_FAN_SPEED = 26,
> +	WMI_EVENT_GPU_FAN_SPEED = 32,
> +	WMI_EVENT_WIN_KEY_LOCK = 33,
> +	WMI_EVENT_RESERVED_23 = 34,
> +	WMI_EVENT_OPEN_APP = 35,
> +};
> +
> +enum tongfang_mifs_event_type {
> +	WMI_EVENT_TYPE_HOTKEY = 1,
> +};
> +
> +enum tongfang_wmi_device_type {
> +	TONGFANG_WMI_CONTROL = 0,
> +	TONGFANG_WMI_EVENT = 1,
> +};
> +
> +struct tongfang_mifs_input {
> +	u8 reserved1;
> +	u8 operation;
> +	u8 reserved2;
> +	u8 function;
> +	u8 payload[28];
> +} __packed;
> +
> +struct tongfang_mifs_output {
> +	u8 reserved1;
> +	u8 operation;
> +	u8 reserved2;
> +	u8 function;
> +	u8 data[28];
> +} __packed;
> +
> +struct tongfang_mifs_event {
> +	u8 event_type;
> +	u8 event_id;
> +	u8 value_low; /* For most events, this is the value */
> +	u8 value_high; /* For fan speed events, combined with value_low */
> +	u8 reserved[4];
> +} __packed;
> +
> +struct tongfang_mifs_wmi_data {
> +	struct wmi_device *wdev;
> +	struct mutex lock; /* Protects WMI calls */
> +	struct led_classdev kbd_led;
> +	struct input_dev *input_dev;
> +	enum platform_profile_option saved_profile;
> +};
> +
> +static int tongfang_mifs_wmi_call(struct tongfang_mifs_wmi_data *data,
> +				  const struct tongfang_mifs_input *input,
> +				  struct tongfang_mifs_output *output)
> +{
> +	struct wmi_buffer in_buf, out_buf;
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	in_buf.length = sizeof(*input);
> +	in_buf.data = (void *)input;
> +
> +	if (output) {
> +		out_buf.length = sizeof(*output);
> +		out_buf.data = output;
> +	}
> +
> +	ret = wmidev_invoke_method(data->wdev, 0, 1, &in_buf,
> +				   output ? &out_buf : NULL);
> +
> +	return ret;

Return directly without extra var.

> +}
> +
> +static bool is_ac_online(void)
> +{
> +	struct power_supply *psy;
> +	union power_supply_propval val;
> +	bool online = false;
> +
> +	psy = power_supply_get_by_name("ADP1");
> +	if (!psy)
> +		return false;
> +
> +	if (!power_supply_get_property(psy, POWER_SUPPLY_PROP_ONLINE, &val))
> +		online = (val.intval == 1);
> +
> +	power_supply_put(psy);
> +	return online;
> +}
> +
> +static int laptop_profile_get(struct device *dev,
> +			      enum platform_profile_option *profile)
> +{
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_SYSTEM_PER_MODE,
> +	};
> +	struct tongfang_mifs_output result;
> +	int ret;
> +
> +	ret = tongfang_mifs_wmi_call(data, &input, &result);
> +
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
> +		break; /* Fullspeed */

Definitely wrong place for the comment, and I don't see any value in 
that comment anyway. What I'm supposed to understand based on this 
comment???

> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +
> +static int laptop_profile_set(struct device *dev,
> +			      enum platform_profile_option profile)
> +{
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_SYSTEM_PER_MODE,
> +	};
> +	struct tongfang_mifs_output ac_type_res;
> +

Don't leave empty lines.

> +	u8 val;
> +	int ret;

Change these two to reverse xmas-tree order.

> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		val = WMI_PP_QUIET;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		val = WMI_PP_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		val = WMI_PP_PERFORMANCE;
> +		fallthrough;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		/* Check if Typec power is not connected for full-speed/performance mode */

Limit for comments lines is at 80 to make the easier to read so make this 
a multi-line comment.

(Only relates to comments, code can go beyond 80 if it makes sense).

> +		input.operation = WMI_METHOD_GET;
> +		input.function = WMI_FN_SYSTEM_AC_TYPE;
> +		ret = tongfang_mifs_wmi_call(data, &input, &ac_type_res);
> +		if (ret)
> +			return ret;
> +
> +		/* Full-speed/performance mode requires DC power (not USB-C) */
> +		if (ac_type_res.data[0] == WMI_SYSTEM_AC_TYPEC || !is_ac_online())
> +			return -EOPNOTSUPP;
> +
> +		if (!val)
> +			val = WMI_PP_FULL_SPEED;
> +
> +		/* Restore operation and function for the actual SET call */
> +		input.operation = WMI_METHOD_SET;
> +		input.function = WMI_FN_SYSTEM_PER_MODE;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	input.payload[0] = val;
> +
> +	ret = tongfang_mifs_wmi_call(data, &input, NULL);
> +	return ret;

return directly please.

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
> +static int tongfang_mifs_wmi_suspend(struct device *dev)
> +{
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	enum platform_profile_option profile;
> +	int ret;
> +
> +	ret = laptop_profile_get(dev, &profile);
> +	if (ret == 0)
> +		data->saved_profile = profile;
> +
> +	return 0;
> +}
> +
> +static int tongfang_mifs_wmi_resume(struct device *dev)
> +{
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +
> +	if (data->saved_profile != PLATFORM_PROFILE_LAST) {
> +		dev_dbg(dev, "Resuming, restoring profile %d\n",
> +			data->saved_profile);
> +		return laptop_profile_set(dev, data->saved_profile);
> +	}
> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(tongfang_mifs_wmi_pm_ops,

Missing include?

> +				tongfang_mifs_wmi_suspend,
> +				tongfang_mifs_wmi_resume);
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
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +	};
> +	struct tongfang_mifs_output res;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		input.function = WMI_FN_CPU_THERMOMETER;
> +		ret = tongfang_mifs_wmi_call(data, &input, &res);
> +		if (!ret)
> +			*val = res.data[0] * 1000;

Please check if you can change the literal to something from 
linux/units.h.

> +		break;
> +	case hwmon_fan:
> +		input.function = WMI_FN_FAN_SPEEDS;
> +		ret = tongfang_mifs_wmi_call(data, &input, &res);
> +		if (ret)
> +			break;
> +
> +		switch (channel) {
> +		case 0: /* CPU */
> +			*val = (res.data[1] << 8) | res.data[0];

Is this doing endianess conversion manually? You should use endianness 
types and conversion functions correctly if that's the case.

> +			break;
> +		case 1: /* GPU */
> +			*val = (res.data[3] << 8) | res.data[2];
> +			break;
> +		case 2: /* SYS */
> +			*val = (res.data[7] << 8) | res.data[6];
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			break;
> +		}
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static int laptop_hwmon_read_string(struct device *dev,
> +				    enum hwmon_sensor_types type, u32 attr,
> +				    int channel, const char **str)
> +{
> +	if (type == hwmon_fan && attr == hwmon_fan_label) {
> +		if (channel >= 0 && channel < ARRAY_SIZE(fan_labels)) {
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
> +	struct tongfang_mifs_wmi_data *data =
> +		container_of(led_cdev, struct tongfang_mifs_wmi_data, kbd_led);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_RGB_KB_BRIGHTNESS,
> +	};
> +	int ret;
> +
> +	input.payload[0] = (u8)value;
> +
> +	ret = tongfang_mifs_wmi_call(data, &input, NULL);
> +	return ret;

Direct return.

> +}
> +
> +static enum led_brightness laptop_kbd_led_get(struct led_classdev *led_cdev)
> +{
> +	struct tongfang_mifs_wmi_data *data =
> +		container_of(led_cdev, struct tongfang_mifs_wmi_data, kbd_led);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_RGB_KB_BRIGHTNESS,
> +	};
> +	struct tongfang_mifs_output res;
> +	u8 level_val;
> +	int ret;
> +
> +	ret = tongfang_mifs_wmi_call(data, &input, &res);
> +	if (ret)
> +		return ret;
> +
> +	level_val = res.data[0];
> +
> +	return level_val;

What's the benefit of the extra variable here?

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
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_GPU_MODE,
> +	};
> +	struct tongfang_mifs_output res;
> +	u8 mode_val;
> +	int ret;
> +	const char *mode_str;
> +
> +	ret = tongfang_mifs_wmi_call(data, &input, &res);
> +
> +	if (ret)
> +		return ret;
> +
> +	mode_val = res.data[0];
> +
> +	if (mode_val < ARRAY_SIZE(gpu_mode_strings)) {
> +		mode_str = gpu_mode_strings[mode_val];
> +	} else {
> +		// fallback: If the value is unknown, report the raw number in wmi
> +		return sysfs_emit(buf, "%d\n", mode_val);
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", mode_str);

Consider reworking the logic such that "normal" path does is on the base 
indentation level and the fallback is inside if (). There's no need to use 
else here at all.

> +}
> +
> +static ssize_t gpu_mode_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_GPU_MODE,
> +	};
> +	int val;
> +	int ret;
> +
> +	val = sysfs_match_string(gpu_mode_strings, buf);
> +
> +	if (val < 0)

Plase remove any empty lines between a call and its error handling.

> +		return -EINVAL;
> +
> +	input.payload[0] = (u8)val;
> +
> +	ret = tongfang_mifs_wmi_call(data, &input, NULL);
> +
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static const char *const kb_mode_strings[] = {
> +	"off", /* 0 */
> +	"cyclic", /* 1 */
> +	"fixed", /* 2 */
> +	"custom", /* 3 */
> +};
> +
> +static ssize_t kb_mode_show(struct device *dev, struct device_attribute *attr,
> +			    char *buf)
> +{
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_GET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_RGB_KB_MODE,
> +	};
> +	struct tongfang_mifs_output res;
> +	int ret;
> +	u8 mode_val;
> +	const char *mode_str;
> +
> +	ret = tongfang_mifs_wmi_call(data, &input, &res);
> +
> +	if (ret)
> +		return ret;
> +
> +	mode_val = res.data[0];
> +
> +	if (mode_val < ARRAY_SIZE(kb_mode_strings)) {
> +		mode_str = kb_mode_strings[mode_val];
> +	} else {
> +		// Fallback for an unexpected/unknown mode
> +		return sysfs_emit(buf, "%d\n", mode_val);
> +	}
> +
> +	return sysfs_emit(buf, "%s\n", mode_str);
> +}
> +
> +static ssize_t kb_mode_store(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_RGB_KB_MODE,
> +	};
> +	// the wmi value (0, 1, 2 or 3)
> +	int val;
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	val = sysfs_match_string(kb_mode_strings, buf);
> +
> +	if (val < 0)

Ditto.

> +		return -EINVAL;
> +
> +	input.payload[0] = (u8)val;
> +
> +	ret = tongfang_mifs_wmi_call(data, &input, NULL);
> +
> +	if (ret)

Ditto.

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
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input = {
> +		.reserved1 = 0,
> +		.operation = WMI_METHOD_SET,
> +		.reserved2 = 0,
> +		.function = WMI_FN_MAX_FAN_SWITCH,
> +	};
> +	u8 payload[2];
> +	bool val;
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	if (kstrtobool(buf, &val))
> +		return -EINVAL;
> +
> +	payload[0] = 0; /* CPU/GPU Fan */
> +	payload[1] = val;
> +
> +	memcpy(input.payload, payload, sizeof(payload));
> +
> +	ret = tongfang_mifs_wmi_call(data, &input, NULL);
> +
> +	if (ret)

Remove extra line.

> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t profile_persist_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	enum platform_profile_option profile;
> +	int ret = laptop_profile_get(dev, &profile);

Please place this call outside of parameter definition block as you can 
have it with the error handling without the empty line in between.

> +
> +	if (ret)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%d\n", profile);
> +}
> +
> +static ssize_t profile_persist_store(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	kobject_uevent(&dev->kobj, KOBJ_CHANGE);
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(gpu_mode);
> +static DEVICE_ATTR_RW(kb_mode);
> +static DEVICE_ATTR_WO(fan_boost);
> +static DEVICE_ATTR_RW(profile_persist);
> +
> +static struct attribute *laptop_attrs[] = {
> +	&dev_attr_gpu_mode.attr,
> +	&dev_attr_kb_mode.attr,
> +	&dev_attr_fan_boost.attr,
> +	&dev_attr_profile_persist.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(laptop);
> +
> +static const struct key_entry tongfang_mifs_wmi_keymap[] = {
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
> +static int tongfang_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct tongfang_mifs_wmi_data *drv_data;
> +	struct device *pp_dev;
> +	struct device *hwmon_dev;
> +	enum tongfang_wmi_device_type dev_type =
> +		(enum tongfang_wmi_device_type)(unsigned long)context;
> +

Remove empty line.

> +	int ret;
> +
> +	drv_data = devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
> +	if (!drv_data)
> +		return -ENOMEM;
> +
> +	drv_data->wdev = wdev;
> +
> +	ret = devm_mutex_init(&wdev->dev, &drv_data->lock);
> +	if (ret) {

Bonus points from getting this right without a review having to tell you 
about the error handling! :-)

> +		dev_err(&wdev->dev, "failed to initialize WMI data lock: %d\n",
> +			ret);

One line.

> +		return ret;
> +	}
> +
> +	dev_set_drvdata(&wdev->dev, drv_data);
> +
> +	if (dev_type == TONGFANG_WMI_EVENT) {
> +		/* Register input device for hotkeys */
> +		drv_data->input_dev = devm_input_allocate_device(&wdev->dev);
> +		if (!drv_data->input_dev)
> +			return -ENOMEM;
> +
> +		drv_data->input_dev->name = "Tongfang MIFS WMI hotkeys";
> +		drv_data->input_dev->phys = "wmi/input0";
> +		drv_data->input_dev->id.bustype = BUS_HOST;
> +		drv_data->input_dev->dev.parent = &wdev->dev;
> +
> +		ret = sparse_keymap_setup(drv_data->input_dev,
> +					  tongfang_mifs_wmi_keymap, NULL);
> +		if (ret) {
> +			dev_err(&wdev->dev, "Failed to setup sparse keymap\n");

dev_* print functions need an include too.

> +			return ret;
> +		}
> +
> +		ret = input_register_device(drv_data->input_dev);
> +		if (ret) {
> +			dev_err(&wdev->dev,
> +				"Failed to register input device\n");
> +			return ret;
> +		}
> +
> +		dev_info(&wdev->dev, "Registered WMI event device\n");
> +
> +		return 0;
> +	}
> +
> +	/* Register platform profile */
> +	pp_dev = devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_data,
> +						&laptop_profile_ops);
> +	if (IS_ERR(pp_dev)) {
> +		dev_err(&wdev->dev, "Failed to register platform profile\n");
> +		return PTR_ERR(pp_dev);
> +	}
> +
> +	drv_data->saved_profile = PLATFORM_PROFILE_LAST;
> +
> +	/* Register hwmon */
> +	hwmon_dev = devm_hwmon_device_register_with_info(
> +		&wdev->dev, "tongfang_mifs", drv_data, &laptop_chip_info, NULL);

Put some of the parameters on the first line.

Please align other lines to (.

You can use >80 chars (for code limit is at 100).

> +	if (IS_ERR(hwmon_dev)) {
> +		dev_err(&wdev->dev, "Failed to register hwmon\n");
> +		return PTR_ERR(hwmon_dev);
> +	}
> +
> +	/* Register keyboard LED */
> +	drv_data->kbd_led.name = "laptop::kbd_backlight";
> +
> +	drv_data->kbd_led.max_brightness = 3;
> +	drv_data->kbd_led.brightness_set_blocking = laptop_kbd_led_set;
> +	drv_data->kbd_led.brightness_get = laptop_kbd_led_get;
> +	ret = devm_led_classdev_register(&wdev->dev, &drv_data->kbd_led);
> +	if (ret) {
> +		dev_err(&wdev->dev, "Failed to register keyboard LED\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void tongfang_mifs_wmi_notify(struct wmi_device *wdev,
> +				     union acpi_object *obj)
> +{
> +	struct tongfang_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
> +	const struct tongfang_mifs_event *event;
> +	u16 fan_speed;
> +
> +	if (!obj || obj->type != ACPI_TYPE_BUFFER)
> +		return;
> +
> +	if (obj->buffer.length < sizeof(*event))
> +		return;
> +
> +	event = (const struct tongfang_mifs_event *)obj->buffer.pointer;
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
> +		led_classdev_notify_brightness_hw_changed(&data->kbd_led,
> +							  event->value_low);
> +		break;
> +
> +	case WMI_EVENT_PERFORMANCE_PLAN:
> +		platform_profile_notify(&wdev->dev);
> +		break;
> +
> +	case WMI_EVENT_OPEN_APP:
> +	case WMI_EVENT_CALCULATOR_START:
> +	case WMI_EVENT_BROWSER_START:
> +		if (!sparse_keymap_report_event(data->input_dev,
> +						event->event_id, 1, true))
> +			dev_warn(&wdev->dev, "Unknown key pressed: 0x%02x\n",
> +				 event->event_id);
> +		break;
> +
> +	case WMI_EVENT_CPU_FAN_SPEED:
> +	case WMI_EVENT_GPU_FAN_SPEED:
> +		/* Fan speed is 16-bit value (value_low is LSB, value_high is MSB) */
> +		fan_speed = (event->value_high << 8) | event->value_low;
> +		dev_dbg(&wdev->dev, "Fan speed event: id=%d speed=%u RPM\n",
> +			event->event_id, fan_speed);
> +		/* These are informational, hwmon polling will read the actual values */
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
> +static const struct wmi_device_id tongfang_mifs_wmi_id_table[] = {
> +	{ TONGFANG_MIFS_GUID, (void *)TONGFANG_WMI_CONTROL },
> +	{ TONGFANG_EVENT_GUID, (void *)TONGFANG_WMI_EVENT },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(wmi, tongfang_mifs_wmi_id_table);
> +
> +static struct wmi_driver tongfang_mifs_wmi_driver = {
> +	.no_singleton = true,
> +	.driver = {
> +		.name = DRV_NAME,
> +		.dev_groups = laptop_groups,
> +		.pm = pm_sleep_ptr(&tongfang_mifs_wmi_pm_ops),
> +	},
> +	.id_table = tongfang_mifs_wmi_id_table,
> +	.probe = tongfang_mifs_wmi_probe,
> +	.notify = tongfang_mifs_wmi_notify,
> +};
> +
> +module_wmi_driver(tongfang_mifs_wmi_driver);
> +
> +MODULE_AUTHOR("Mingyou Chen <qby140326@gmail.com>");
> +MODULE_DESCRIPTION("Tongfang MIFS (MiInterface) WMI driver");
> +MODULE_LICENSE("GPL");
> 
> base-commit: 2ccbdb612d0d95f25c38189b83666ff0fb2bfb47
> 

-- 
 i.

