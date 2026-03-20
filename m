Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525ED3D1CDB;
	Fri, 20 Mar 2026 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774026981; cv=none; b=rEUMsw2IipdKaC/BPsJiYbXpmYTvgaGe6R9QRkxTStCLtC045/KvPL6IlBmfiGZ/f2GTWcVujyEznTDVVHKucrGDrhTsez2Mv6L8b5KJpQKo81SkC1JH+LRfV1wxS4OAR96AnSiPg5fxTIULRbqriGUJN1v9CFkKFOn8C+WtcBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774026981; c=relaxed/simple;
	bh=uS/Y7slPF6Fbrhqfpm+szZeToHH6doRORQ9iQF42XGI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBjTrkNGUQFEiSGcw2Sx4zJxTQYruibqs/+Mc/kvzHbOEWqr2KNzXMOIclNNtIC8hgHE81U8wxcnNZmYRt9OZwHCIGizQ/CkXOXWTzxCii53fzwVzNwtdCccV9fH5+dbHjk7LKh6fzAPknQs3Jve8uzq7gaadk08HG9jPpp2+dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=L/lHCwsS; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="L/lHCwsS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774026942; x=1774631742; i=w_armin@gmx.de;
	bh=GZq6IOJM1iaA4FMlMx9s/ZuSGl/MyFnW6VtNGh6PoV4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=L/lHCwsSwIJdjLP/dAc/pGE3MRAyWPOpihUhHiLAIr1YX4YZd3YSydfoj0K2EDik
	 RJqnYQoan3hoojlfIFNbKetFf5T8rKPYQdbb1nDLJY8fiw0V0UqD/HDjBrZ4qNHTr
	 qHE1DxlKdAkfxd4sfz4w/z3fmU6xKzyUp67fjqx5FLY5dOb5aS6x6FDbRJAjhEmZg
	 8wBfpsDxIIoxuUvWFU/rtd0lSjV+plWZVMZ7SfLkkRXwPA6Ouoo8xGZdMpKAJsqzL
	 vzFMqQy/hogk2ZVMT8wtLwlWsirhjrANgWr9XLK/8i2YRJgEghQRpAbNBBe/mCMSS
	 aRHgyV6rRLslwTqayw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2O1-1vPdvT2JxB-00iLdH; Fri, 20
 Mar 2026 18:15:42 +0100
Message-ID: <ef9cf29c-662c-457f-9fcf-f806e1eb6933@gmx.de>
Date: Fri, 20 Mar 2026 18:15:41 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14] platform/x86: bitland-mifs-wmi: Add new Bitland MIFS
 WMI driver
To: Mingyou Chen <qby140326@gmail.com>
Cc: cryolitia.pukngae@linux.dev, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20260307011208.16411-1-qby140326@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260307011208.16411-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5eWYxPryprRVPA7wjv8x3zB8eP9DHvVWO6f6YZ2XJ5k9bs3eFoz
 69dmLF6TXV8f5uSs/A8WNitWhTfYS16J8YHFza0dmnhiHHUolWHUQEuKK/Ka77kNf86TQEU
 W2hMKXC8eQzrRPdOw98uJdvadCQopqKBPQexAKfUr+8N0cRVvz5bgwADQj4HLZeGp87e81q
 SyC3IujBDZVqoB9YENRuw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Jb6LDkP/0yo=;d1/NnhWPggVfUKRd0AeTZYaRXhw
 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
 7YS+J77U+87TR483rj5a+aaw==

Am 07.03.26 um 02:12 schrieb Mingyou Chen:

> Add a new driver for Bitland laptops that utilize the MIFS (MiInterface)
> WMI interface.
>
> The driver implements several features through the WMI interface:
>
> - Platform Profile: Supports "Quiet", "Balanced", "Performance", and
>    "Full Speed" modes. The "Full Speed" mode is intelligently restricted
>    based on the AC adapter type (requires DC power, not supported on
>    USB-C charging) as required by the hardware.
> - Hwmon: Provides monitoring for CPU, GPU, and System fan speeds,
>    as well as CPU temperature sensors.
> - Keyboard Backlight: Integrated with the LED class device for
>    brightness control and provides sysfs attributes for keyboard modes
>    (cyclic, fixed, etc.).
> - GPU Mode: Allows switching between Hybrid, Discrete, and UMA
>    graphics modes via sysfs.
> - Hotkeys: Handles WMI events for system hotkeys (Calculator, Browser,
>    App launch) using sparse keymaps and reports status changes for
>    Airplane mode, Touchpad, and CapsLock.
> - Fan Boost: Provides a sysfs interface to force fans to maximum speed.
>
> The driver registers two WMI GUIDs:
> - B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B: Control methods
> - 46C93E13-EE9B-4262-8488-563BCA757FEF: Event notifications

What are you thoughts on this, Ilpo? From my point of view the driver look=
s good.

Thanks,
Armin Wolf

> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
> v14:
>    - Add Reviewed-by
> v13:
>    - make laptop_attrs const
> v12:
>    - add depends on INPUT and select INPUT_SPARSEKMAP
>    - code cleanup - remove unnecessary ret variables
>    - add the copyright text and pr_fmt macro
>    - use blocking notifier instead of atomic notifier
>    - pass the platform profile device here instead of the WMI device at =
bitland_mifs_wmi_suspend
>    - remove unnecessary null checks
>    - pass the platform_profile dev to platform_profile_notify
>    - fetch led brightness from WMI on init led
>    - remove the (const struct bitland_mifs_event *) cast in bitland_mifs=
_wmi_notify
> v11:
>    - fix checkpatch reported issues
> v10:
>    - After some researches, I acknowledge my device is from Bitland, not
>      Tongfang. Rename the driver to bitland-mifs-wmi
> v9:
>    - Fix style issues in .rst documentation
>    - Rewrite the wmi_call func with correct usage
>    - Use power_supply_is_system_supplied in kernel instead of
>      is_ac_online
>    - Remove the PLATFORM_PROFILE_LAST check in wmi_resume function
>    - Directly return in the hwmon_temp case in hwmon_read function
>    - return -EPROTO on invalid wmi return value in gpu_mode and
>      keyboard brightness
>    - Remove thge dev_err debug messages
>    - Rewrite the wmi_notify method with .notify_new callback in
>      linux-next
>    - Call hwmon_notify_event (with a notifier) on WMI fan speed events
>
> v8:
>    - Fix coding style issues
>    - Use MILLIDEGREE_PER_DEGREE instead of MILLI to define the temperatu=
re unit more precisely.
>    - Align lines with the first occurrence of HWMON
>    - Remove the unnecessary empty line in error handling
>    - Reverse the logic of kb_mode_strings and drop the mode_str variable
>
> v7:
>    - Remove the unused includes (asm/)
>    - Align values with tab
>    - remove the previous test code which i forgot to remove
>    - return values directly with the "return" statement
>    - rmeove the wrong comment "Full-speed" since I've already use the va=
lue
>      "WMI_PP_FULL_SPEED" in the switch case
>    - remove the empty lines
>    - Change the two variables (val, ret) to reverse xmas-tree order.
>    - Add missing includes and sort them in the alphabetical order.
>    - use endianness types and conversion functions to parse temperature =
in
>      the wmi response
>
> v6:
>    - add base commit
>
> v5:
>    - add fallthrough on the PLATFORM_PROFILE_BALANCED_PERFORMANCE switch
>      case
>
> v4:
>    - check the DC power state before switching to performance/full-speed=
 mode
>
> v3:
>    - Fix email address mismatch in Signed-off-by and From headers.
>    - implement the WMI event handler
>    - code style improvments
>    - condition on the performance platform profile switch
>    - driver documentation
>
> v2:
>    - Add PLATFORM_PROFILE_BALANCED_PERFORMANCE platform profile support
>
>   .../wmi/devices/bitland-mifs-wmi.rst          | 207 +++++
>   drivers/platform/x86/Kconfig                  |  18 +
>   drivers/platform/x86/Makefile                 |   1 +
>   drivers/platform/x86/bitland-mifs-wmi.c       | 851 ++++++++++++++++++
>   4 files changed, 1077 insertions(+)
>   create mode 100644 Documentation/wmi/devices/bitland-mifs-wmi.rst
>   create mode 100644 drivers/platform/x86/bitland-mifs-wmi.c
>
> diff --git a/Documentation/wmi/devices/bitland-mifs-wmi.rst b/Documentat=
ion/wmi/devices/bitland-mifs-wmi.rst
> new file mode 100644
> index 000000000000..e0f6b4474013
> --- /dev/null
> +++ b/Documentation/wmi/devices/bitland-mifs-wmi.rst
> @@ -0,0 +1,207 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Bitland MIFS driver (bitland-mifs-wmi)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +
> +EC WMI interface description
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +The EC WMI interface description can be decoded from the embedded binar=
y MOF (bmof)
> +data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
> +
> +::
> +
> +  class WMIEvent : __ExtrinsicEvent {
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description(=
"Root WMI HID_EVENT20"), guid("{46c93e13-ee9b-4262-8488-563bca757fef}")]
> +  class HID_EVENT20 : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, write, Description("Package Data")] uint8 Even=
tDetail[8];
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description(=
"Root WMI HID_EVENT21"), guid("{fa78e245-2c0f-4ca1-91cf-15f34e474850}")]
> +  class HID_EVENT21 : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, write, Description("Package Data")] uint8 Even=
tDetail[8];
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description(=
"Root WMI HID_EVENT22"), guid("{1dceaf0a-4d63-44bb-bd0c-0d6281bfddc5}")]
> +  class HID_EVENT22 : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, write, Description("Package Data")] uint8 Even=
tDetail[8];
> +  };
> +
> +  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description(=
"Root WMI HID_EVENT23"), guid("{3f9e3c26-b077-4f86-91f5-37ff64d8c7ed}")]
> +  class HID_EVENT23 : WmiEvent {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +    [WmiDataId(1), read, write, Description("Package Data")] uint8 Even=
tDetail[8];
> +  };
> +
> +  [WMI, Dynamic, provider("WmiProv"), Locale("MS\\0x409"), Description(=
"Class used to operate firmware interface"), guid("{b60bfb48-3e5b-49e4-a0e=
9-8cffe1b3434b}")]
> +  class MICommonInterface {
> +    [key, read] string InstanceName;
> +    [read] boolean Active;
> +
> +    [WmiMethodId(1), Implemented, read, write, Description("Method used=
 to support system functions.")] void MiInterface([in, Description("WMI In=
terface")] uint8 InData[32], [out] uint8 OutData[30], [out] uint16 Reserve=
d);
> +  };
> +
> +Reverse-Engineering the EC WMI interface
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The OEM software can be download from `this link <https://iknow.lenovo.=
com.cn/detail/429447>`_
> +
> +Nothing is obfuscated, In this case, `ILSpy <https://github.com/icsharp=
code/ILSpy>`_ could be helpful.
> +
> +WMI Methods (MICommonInterface)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The ``MICommonInterface`` class (GUID: ``{b60bfb48-3e5b-49e4-a0e9-8cffe=
1b3434b}``)
> +is the primary control interface. It uses a 32-byte buffer for both inp=
ut
> +(``InData``) and output (``OutData``).
> +
> +Method Structure
> +----------------
> +
> +The data packet follows a standardized format:
> +
> ++----------+-----------------------------------------------------------=
=2D------+
> +| Byte     | Description                                               =
       |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+
> +| 1        | Method Type: Get (0xFA / 250) or Set (0xFB / 251)         =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 3        | Command ID (Method Name)                                  =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 4 - 31   | Arguments (for Set) or Return Data (for Get)              =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +
> +
> +Command IDs
> +-----------
> +
> +The following Command IDs are used in the third byte of the buffer:
> +
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| ID       | Name                  | Values / Description              =
       |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| 8        | SystemPerMode         | 0: Balance, 1: Performance, 2: Qui=
et,    |
> +|          |                       | 3: Full-speed                     =
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 9        | GPUMode               | 0: Hybrid, 1: Discrete, 2: UMA    =
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 10       | KeyboardType          | 0: White, 1: Single RGB, 2: Zone R=
GB     |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 11       | FnLock                | 0: Off, 1: On                     =
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 12       | TPLock                | 0: Unlock, 1: Lock (Touchpad)     =
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 13       | CPUGPUSYSFanSpeed     | Returns 12 bytes of fan data:     =
       |
> +|          |                       | Bytes 4-5: CPU Fan RPM (Little End=
ian)   |
> +|          |                       | Bytes 6-7: GPU Fan RPM (Little End=
ian)   |
> +|          |                       | Bytes 10-11: SYS Fan RPM (Little E=
ndian) |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 16       | RGBKeyboardMode       | 0: Off, 1: Auto Cyclic, 2: Fixed, =
       |
> +|          |                       | 3: Custom                         =
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 17       | RGBKeyboardColor      | Bytes 4, 5, 6: Red, Green, Blue va=
lues   |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 18       | RGBKeyboardBrightness | 0-10: Brightness Levels, 128: Auto=
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 19       | SystemAcType          | 1: Type-C, 2: Circular Hole (DC)  =
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 20       | MaxFanSpeedSwitch     | Byte 4: Fan Type (0: CPU/GPU, 1: S=
YS)    |
> +|          |                       | Byte 5: State (0: Off, 1: On)     =
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 21       | MaxFanSpeed           | Sets manual fan speed duty cycle  =
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +| 22       | CPUThermometer        | Returns CPU Temperature           =
       |
> ++----------+-----------------------+-----------------------------------=
=2D------+
> +
> +WMI Events (HID_EVENT20)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +The driver listens for events from the ``HID_EVENT20`` class
> +(GUID: ``{46c93e13-ee9b-4262-8488-563bca757fef}``). These events are tr=
iggered
> +by hotkeys or system state changes (e.g., plugging in AC power).
> +
> +Event Structure
> +---------------
> +
> +The event data is provided in an 8-byte array (``EventDetail``):
> +
> ++----------+-----------------------------------------------------------=
=2D------+
> +| Byte     | Description                                               =
       |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+
> +| 0        | Event Type (Always 0x01 for HotKey/Notification)          =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 1        | Event ID (Corresponds to the Command IDs above)           =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 2        | Value (The new state or value of the feature)             =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +
> +Common Event IDs:
> +-----------------
> +
> +Note: reserved event ids are not listed there
> +
> ++----------+-----------------------------------------------------------=
=2D------+
> +| Event Id | Description                                               =
       |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+
> +| 4        | AirPlane mode change                                      =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 5        | Keyboard brightness change                                =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 6        | touchpad state (enabled/disabled) change                  =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 7        | FnLock state (enabled/disabled) change                    =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 8        | Keyboard mode change                                      =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 9        | CapsLock state change                                     =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 13       | NumLock state change                                      =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 14       | ScrollLock state change                                   =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 15       | Performance plan change                                   =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 25       | Display refresh rate change                               =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 33       | Super key lock state (enabled/disabled) change            =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +| 35       | Open control center key                                   =
       |
> ++----------+-----------------------------------------------------------=
=2D------+
> +
> +Implementation Details
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Performance Modes
> +-----------------
> +Changing the performance mode via Command ID 0x08 (SystemPerMode) affec=
ts the power limits (PL1/PL2)
> +and fan curves managed by the Embedded Controller (EC). Note that the "=
Full-speed"
> +and "Performance" mode (1, 3) is typically only available when the syst=
em is connected to a DC power
> +source (not USB-C/PD).
> +
> +In the driver implementation, switch to performance/full-speed mode wit=
hout DC power connected
> +will throw the EOPNOTSUPP error.
> +
> +Graphics Switching
> +------------------
> +The ``GPUMode`` (0x09) allows switching between Hybrid (Muxless) and Di=
screte
> +(Muxed) graphics. Changing this value usually requires a system reboot =
to
> +take effect in the BIOS/Firmware.
> +
> +Fan Control
> +-----------
> +The system supports both automatic EC control and manual overrides. Com=
mand ID
> +0x14 (``MaxFanSpeedSwitch``) is used to toggle manual control, while ID=
 0x15
> +sets the actual PWM duty cycle.
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4cb7d97a9fcc..2ffa4ecf65b0 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -113,6 +113,24 @@ config GIGABYTE_WMI
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called gigabyte-wmi.
>  =20
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
>   config ACERHDF
>   	tristate "Acer Aspire One temperature and fan driver"
>   	depends on ACPI_EC && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index d25762f7114f..872ac3842391 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+=3D nvidia-wmi-=
ec-backlight.o
>   obj-$(CONFIG_XIAOMI_WMI)		+=3D xiaomi-wmi.o
>   obj-$(CONFIG_REDMI_WMI)			+=3D redmi-wmi.o
>   obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
> +obj-$(CONFIG_BITLAND_MIFS_WMI)		+=3D bitland-mifs-wmi.o
>  =20
>   # Acer
>   obj-$(CONFIG_ACERHDF)		+=3D acerhdf.o
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/=
x86/bitland-mifs-wmi.c
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
> +	WMI_METHOD_GET	=3D 250,
> +	WMI_METHOD_SET	=3D 251,
> +};
> +
> +enum bitland_mifs_function {
> +	WMI_FN_SYSTEM_PER_MODE		=3D 8,
> +	WMI_FN_GPU_MODE			=3D 9,
> +	WMI_FN_KBD_TYPE			=3D 10,
> +	WMI_FN_FN_LOCK			=3D 11,
> +	WMI_FN_TP_LOCK			=3D 12,
> +	WMI_FN_FAN_SPEEDS		=3D 13,
> +	WMI_FN_RGB_KB_MODE		=3D 16,
> +	WMI_FN_RGB_KB_COLOR		=3D 17,
> +	WMI_FN_RGB_KB_BRIGHTNESS	=3D 18,
> +	WMI_FN_SYSTEM_AC_TYPE		=3D 19,
> +	WMI_FN_MAX_FAN_SWITCH		=3D 20,
> +	WMI_FN_MAX_FAN_SPEED		=3D 21,
> +	WMI_FN_CPU_THERMOMETER		=3D 22,
> +	WMI_FN_CPU_POWER		=3D 23,
> +};
> +
> +enum bitland_system_ac_mode {
> +	WMI_SYSTEM_AC_TYPEC		=3D 1,
> +	/* Unknown type, this is unused in the original driver */
> +	WMI_SYSTEM_AC_CIRCULARHOLE	=3D 2,
> +};
> +
> +enum bitland_mifs_power_profile {
> +	WMI_PP_BALANCED		=3D 0,
> +	WMI_PP_PERFORMANCE	=3D 1,
> +	WMI_PP_QUIET		=3D 2,
> +	WMI_PP_FULL_SPEED	=3D 3,
> +};
> +
> +enum bitland_mifs_event_id {
> +	WMI_EVENT_RESERVED_1		=3D 1,
> +	WMI_EVENT_RESERVED_2		=3D 2,
> +	WMI_EVENT_RESERVED_3		=3D 3,
> +	WMI_EVENT_AIRPLANE_MODE		=3D 4,
> +	WMI_EVENT_KBD_BRIGHTNESS	=3D 5,
> +	WMI_EVENT_TOUCHPAD_STATE	=3D 6,
> +	WMI_EVENT_FNLOCK_STATE		=3D 7,
> +	WMI_EVENT_KBD_MODE		=3D 8,
> +	WMI_EVENT_CAPSLOCK_STATE	=3D 9,
> +	WMI_EVENT_CALCULATOR_START	=3D 11,
> +	WMI_EVENT_BROWSER_START		=3D 12,
> +	WMI_EVENT_NUMLOCK_STATE		=3D 13,
> +	WMI_EVENT_SCROLLLOCK_STATE	=3D 14,
> +	WMI_EVENT_PERFORMANCE_PLAN	=3D 15,
> +	WMI_EVENT_FN_J			=3D 16,
> +	WMI_EVENT_FN_F			=3D 17,
> +	WMI_EVENT_FN_0			=3D 18,
> +	WMI_EVENT_FN_1			=3D 19,
> +	WMI_EVENT_FN_2			=3D 20,
> +	WMI_EVENT_FN_3			=3D 21,
> +	WMI_EVENT_FN_4			=3D 22,
> +	WMI_EVENT_FN_5			=3D 24,
> +	WMI_EVENT_REFRESH_RATE		=3D 25,
> +	WMI_EVENT_CPU_FAN_SPEED		=3D 26,
> +	WMI_EVENT_GPU_FAN_SPEED		=3D 32,
> +	WMI_EVENT_WIN_KEY_LOCK		=3D 33,
> +	WMI_EVENT_RESERVED_23		=3D 34,
> +	WMI_EVENT_OPEN_APP		=3D 35,
> +};
> +
> +enum bitland_mifs_event_type {
> +	WMI_EVENT_TYPE_HOTKEY	=3D 1,
> +};
> +
> +enum bitland_wmi_device_type {
> +	BITLAND_WMI_CONTROL	=3D 0,
> +	BITLAND_WMI_EVENT	=3D 1,
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
> +	int channel; /* 0 =3D CPU, 1 =3D GPU */
> +	u16 speed;
> +};
> +
> +struct bitland_mifs_wmi_data {
> +	struct wmi_device *wdev;
> +	struct mutex lock; /* Protects WMI calls */
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
> +	struct wmi_buffer in_buf =3D { .length =3D sizeof(*input), .data =3D (=
void *)input };
> +	struct wmi_buffer out_buf =3D { 0 };
> +	int ret;
> +
> +	guard(mutex)(&data->lock);
> +
> +	ret =3D wmidev_invoke_method(data->wdev, 0, 1, &in_buf, output ? &out_=
buf : NULL);
> +	if (ret)
> +		return ret;
> +
> +	if (output) {
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
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_SYSTEM_PER_MODE,
> +	};
> +	struct bitland_mifs_output result;
> +	int ret;
> +
> +	ret =3D bitland_mifs_wmi_call(data, &input, &result);
> +	if (ret)
> +		return ret;
> +
> +	switch (result.data[0]) {
> +	case WMI_PP_BALANCED:
> +		*profile =3D PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case WMI_PP_PERFORMANCE:
> +		*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +		break;
> +	case WMI_PP_QUIET:
> +		*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case WMI_PP_FULL_SPEED:
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;
> +}
> +
> +static int bitland_check_performance_capability(struct bitland_mifs_wmi=
_data *data)
> +{
> +	struct bitland_mifs_input input =3D {
> +		.operation =3D WMI_METHOD_GET,
> +		.function =3D WMI_FN_SYSTEM_AC_TYPE,
> +	};
> +	struct bitland_mifs_output output;
> +	int ret;
> +
> +	/* Full-speed/performance mode requires DC power (not USB-C) */
> +	if (!power_supply_is_system_supplied())
> +		return -EOPNOTSUPP;
> +
> +	ret =3D bitland_mifs_wmi_call(data, &input, &output);
> +	if (ret)
> +		return ret;
> +
> +	if (output.data[0] !=3D WMI_SYSTEM_AC_CIRCULARHOLE)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +
> +static int laptop_profile_set(struct device *dev,
> +			      enum platform_profile_option profile)
> +{
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_SET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_SYSTEM_PER_MODE,
> +	};
> +	int ret;
> +	u8 val;
> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		val =3D WMI_PP_QUIET;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		val =3D WMI_PP_BALANCED;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		ret =3D bitland_check_performance_capability(data);
> +		if (ret)
> +			return ret;
> +		val =3D WMI_PP_PERFORMANCE;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		ret =3D bitland_check_performance_capability(data);
> +		if (ret)
> +			return ret;
> +		val =3D WMI_PP_FULL_SPEED;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	input.payload[0] =3D val;
> +
> +	return bitland_mifs_wmi_call(data, &input, NULL);
> +}
> +
> +static int platform_profile_probe(void *drvdata, unsigned long *choices=
)
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
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	enum platform_profile_option profile;
> +	int ret;
> +
> +	ret =3D laptop_profile_get(data->pp_dev, &profile);
> +	if (ret =3D=3D 0)
> +		data->saved_profile =3D profile;
> +
> +	return ret;
> +}
> +
> +static int bitland_mifs_wmi_resume(struct device *dev)
> +{
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +
> +	dev_dbg(dev, "Resuming, restoring profile %d\n",
> +		data->saved_profile);
> +	return laptop_profile_set(dev, data->saved_profile);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
> +				bitland_mifs_wmi_suspend,
> +				bitland_mifs_wmi_resume);
> +
> +static const struct platform_profile_ops laptop_profile_ops =3D {
> +	.probe =3D platform_profile_probe,
> +	.profile_get =3D laptop_profile_get,
> +	.profile_set =3D laptop_profile_set,
> +};
> +
> +static const char *const fan_labels[] =3D {
> +	"CPU", /* 0 */
> +	"GPU", /* 1 */
> +	"SYS", /* 2 */
> +};
> +
> +static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +			     u32 attr, int channel, long *val)
> +{
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +	};
> +	struct bitland_mifs_output res;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		input.function =3D WMI_FN_CPU_THERMOMETER;
> +		ret =3D bitland_mifs_wmi_call(data, &input, &res);
> +		if (!ret)
> +			*val =3D res.data[0] * MILLIDEGREE_PER_DEGREE;
> +		return ret;
> +	case hwmon_fan:
> +		input.function =3D WMI_FN_FAN_SPEEDS;
> +		ret =3D bitland_mifs_wmi_call(data, &input, &res);
> +		if (ret)
> +			return ret;
> +
> +		switch (channel) {
> +		case 0: /* CPU */
> +			*val =3D get_unaligned_le16(&res.data[0]);
> +			return 0;
> +		case 1: /* GPU */
> +			*val =3D get_unaligned_le16(&res.data[2]);
> +			return 0;
> +		case 2: /* SYS */
> +			*val =3D get_unaligned_le16(&res.data[6]);
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
> +	if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_label) {
> +		if (channel >=3D 0 && channel < ARRAY_SIZE(fan_labels)) {
> +			*str =3D fan_labels[channel];
> +			return 0;
> +		}
> +	}
> +	return -EINVAL;
> +}
> +
> +static const struct hwmon_channel_info *laptop_hwmon_info[] =3D {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL,
> +			   HWMON_F_INPUT | HWMON_F_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops laptop_hwmon_ops =3D {
> +	.visible =3D 0444,
> +	.read =3D laptop_hwmon_read,
> +	.read_string =3D laptop_hwmon_read_string,
> +};
> +
> +static const struct hwmon_chip_info laptop_chip_info =3D {
> +	.ops =3D &laptop_hwmon_ops,
> +	.info =3D laptop_hwmon_info,
> +};
> +
> +static int laptop_kbd_led_set(struct led_classdev *led_cdev,
> +			      enum led_brightness value)
> +{
> +	struct bitland_mifs_wmi_data *data =3D
> +		container_of(led_cdev, struct bitland_mifs_wmi_data, kbd_led);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_SET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_RGB_KB_BRIGHTNESS,
> +	};
> +
> +	input.payload[0] =3D (u8)value;
> +
> +	return bitland_mifs_wmi_call(data, &input, NULL);
> +}
> +
> +static enum led_brightness laptop_kbd_led_get(struct led_classdev *led_=
cdev)
> +{
> +	struct bitland_mifs_wmi_data *data =3D
> +		container_of(led_cdev, struct bitland_mifs_wmi_data, kbd_led);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_RGB_KB_BRIGHTNESS,
> +	};
> +	struct bitland_mifs_output res;
> +	int ret;
> +
> +	ret =3D bitland_mifs_wmi_call(data, &input, &res);
> +	if (ret)
> +		return ret;
> +
> +	return res.data[0];
> +}
> +
> +static const char *const gpu_mode_strings[] =3D {
> +	"hybrid",
> +	"discrete",
> +	"uma",
> +};
> +
> +/* GPU Mode: 0:Hybrid, 1:Discrete, 2:UMA */
> +static ssize_t gpu_mode_show(struct device *dev, struct device_attribut=
e *attr,
> +			     char *buf)
> +{
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_GPU_MODE,
> +	};
> +	struct bitland_mifs_output res;
> +	u8 mode_val;
> +	int ret;
> +
> +	ret =3D bitland_mifs_wmi_call(data, &input, &res);
> +
> +	if (ret)
> +		return ret;
> +
> +	mode_val =3D res.data[0];
> +
> +	if (mode_val >=3D ARRAY_SIZE(gpu_mode_strings))
> +		return -EPROTO;
> +
> +	return sysfs_emit(buf, "%s\n", gpu_mode_strings[mode_val]);
> +}
> +
> +static ssize_t gpu_mode_store(struct device *dev, struct device_attribu=
te *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_SET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_GPU_MODE,
> +	};
> +	int val;
> +	int ret;
> +
> +	val =3D sysfs_match_string(gpu_mode_strings, buf);
> +	if (val < 0)
> +		return -EINVAL;
> +
> +	input.payload[0] =3D (u8)val;
> +
> +	ret =3D bitland_mifs_wmi_call(data, &input, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static const char *const kb_mode_strings[] =3D {
> +	"off",		/* 0 */
> +	"cyclic",	/* 1 */
> +	"fixed",	/* 2 */
> +	"custom",	/* 3 */
> +};
> +
> +static ssize_t kb_mode_show(struct device *dev, struct device_attribute=
 *attr,
> +			    char *buf)
> +{
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_RGB_KB_MODE,
> +	};
> +	struct bitland_mifs_output res;
> +	int ret;
> +	u8 mode_val;
> +
> +	ret =3D bitland_mifs_wmi_call(data, &input, &res);
> +	if (ret)
> +		return ret;
> +
> +	mode_val =3D res.data[0];
> +
> +	if (mode_val >=3D ARRAY_SIZE(kb_mode_strings))
> +		return -EPROTO;
> +
> +	return sysfs_emit(buf, "%s\n", kb_mode_strings[mode_val]);
> +}
> +
> +static ssize_t kb_mode_store(struct device *dev, struct device_attribut=
e *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_SET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_RGB_KB_MODE,
> +	};
> +	// the wmi value (0, 1, 2 or 3)
> +	int val;
> +	int ret;
> +
> +	val =3D sysfs_match_string(kb_mode_strings, buf);
> +	if (val < 0)
> +		return -EINVAL;
> +
> +	input.payload[0] =3D (u8)val;
> +
> +	ret =3D bitland_mifs_wmi_call(data, &input, NULL);
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
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct bitland_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_SET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_MAX_FAN_SWITCH,
> +	};
> +	bool val;
> +	int ret;
> +
> +	if (kstrtobool(buf, &val))
> +		return -EINVAL;
> +
> +	input.payload[0] =3D 0;	/* CPU/GPU Fan */
> +	input.payload[1] =3D val;
> +
> +	ret =3D bitland_mifs_wmi_call(data, &input, NULL);
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
> +static const struct attribute *const laptop_attrs[] =3D {
> +	&dev_attr_gpu_mode.attr,
> +	&dev_attr_kb_mode.attr,
> +	&dev_attr_fan_boost.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(laptop);
> +
> +static const struct key_entry bitland_mifs_wmi_keymap[] =3D {
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
> +	struct notifier_block *nb =3D data;
> +
> +	blocking_notifier_chain_unregister(&bitland_notifier_list, nb);
> +}
> +
> +static int bitland_notifier_callback(struct notifier_block *nb,
> +				     unsigned long action, void *data)
> +{
> +	struct bitland_mifs_wmi_data *data_ctx =3D
> +	container_of(nb, struct bitland_mifs_wmi_data, notifier);
> +	struct bitland_fan_notify_data *fan_info;
> +	u8 *brightness;
> +
> +	switch (action) {
> +	case BITLAND_NOTIFY_KBD_BRIGHTNESS:
> +		brightness =3D data;
> +		led_classdev_notify_brightness_hw_changed(&data_ctx->kbd_led,
> +							  *brightness);
> +		break;
> +	case BITLAND_NOTIFY_PLATFORM_PROFILE:
> +		platform_profile_notify(data_ctx->pp_dev);
> +		break;
> +	case BITLAND_NOTIFY_HWMON:
> +		fan_info =3D data;
> +
> +		hwmon_notify_event(data_ctx->hwmon_dev,
> +				   hwmon_fan,
> +				   hwmon_fan_input,
> +				   fan_info->channel);
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *=
context)
> +{
> +	struct bitland_mifs_wmi_data *drv_data;
> +	enum bitland_wmi_device_type dev_type =3D
> +		(enum bitland_wmi_device_type)(unsigned long)context;
> +	struct led_init_data init_data =3D {
> +		.devicename =3D DRV_NAME,
> +		.default_label =3D ":" LED_FUNCTION_KBD_BACKLIGHT,
> +		.devname_mandatory =3D true,
> +	};
> +	int ret;
> +
> +	drv_data =3D devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
> +	if (!drv_data)
> +		return -ENOMEM;
> +
> +	drv_data->wdev =3D wdev;
> +
> +	ret =3D devm_mutex_init(&wdev->dev, &drv_data->lock);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&wdev->dev, drv_data);
> +
> +	if (dev_type =3D=3D BITLAND_WMI_EVENT) {
> +		/* Register input device for hotkeys */
> +		drv_data->input_dev =3D devm_input_allocate_device(&wdev->dev);
> +		if (!drv_data->input_dev)
> +			return -ENOMEM;
> +
> +		drv_data->input_dev->name =3D "Bitland MIFS WMI hotkeys";
> +		drv_data->input_dev->phys =3D "wmi/input0";
> +		drv_data->input_dev->id.bustype =3D BUS_HOST;
> +		drv_data->input_dev->dev.parent =3D &wdev->dev;
> +
> +		ret =3D sparse_keymap_setup(drv_data->input_dev,
> +					  bitland_mifs_wmi_keymap, NULL);
> +		if (ret)
> +			return ret;
> +
> +		return input_register_device(drv_data->input_dev);
> +	}
> +
> +	/* Register platform profile */
> +	drv_data->pp_dev =3D devm_platform_profile_register(&wdev->dev, DRV_NA=
ME, drv_data,
> +							  &laptop_profile_ops);
> +	if (IS_ERR(drv_data->pp_dev))
> +		return PTR_ERR(drv_data->pp_dev);
> +
> +	/* Register hwmon */
> +	drv_data->hwmon_dev =3D devm_hwmon_device_register_with_info(&wdev->de=
v,
> +								   "bitland_mifs",
> +								   drv_data,
> +								   &laptop_chip_info,
> +								   NULL);
> +	if (IS_ERR(drv_data->hwmon_dev))
> +		return PTR_ERR(drv_data->hwmon_dev);
> +
> +	/* Register keyboard LED */
> +	drv_data->kbd_led.max_brightness =3D 3;
> +	drv_data->kbd_led.brightness_set_blocking =3D laptop_kbd_led_set;
> +	drv_data->kbd_led.brightness_get =3D laptop_kbd_led_get;
> +	drv_data->kbd_led.brightness =3D laptop_kbd_led_get(&drv_data->kbd_led=
);
> +	drv_data->kbd_led.flags =3D LED_CORE_SUSPENDRESUME |
> +				  LED_BRIGHT_HW_CHANGED |
> +				  LED_REJECT_NAME_CONFLICT;
> +	ret =3D devm_led_classdev_register_ext(&wdev->dev, &drv_data->kbd_led,=
 &init_data);
> +	if (ret)
> +		return ret;
> +
> +	drv_data->notifier.notifier_call =3D bitland_notifier_callback;
> +	ret =3D blocking_notifier_chain_register(&bitland_notifier_list, &drv_=
data->notifier);
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
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev);
> +	const struct bitland_mifs_event *event;
> +	struct bitland_fan_notify_data fan_data;
> +	u8 brightness;
> +
> +	if (buffer->length < sizeof(*event))
> +		return;
> +
> +	event =3D buffer->data;
> +
> +	/* Validate event type */
> +	if (event->event_type !=3D WMI_EVENT_TYPE_HOTKEY)
> +		return;
> +
> +	dev_dbg(&wdev->dev,
> +		"WMI event: id=3D0x%02x value_low=3D0x%02x value_high=3D0x%02x\n",
> +		event->event_id, event->value_low, event->value_high);
> +
> +	switch (event->event_id) {
> +	case WMI_EVENT_KBD_BRIGHTNESS:
> +		brightness =3D event->value_low;
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
> +		if (event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED)
> +			fan_data.channel =3D 0;
> +		else
> +			fan_data.channel =3D 1;
> +
> +		/* Fan speed is 16-bit value (value_low is LSB, value_high is MSB) */
> +		fan_data.speed =3D (event->value_high << 8) | event->value_low;
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
> +		dev_dbg(&wdev->dev, "State change event: id=3D%d value=3D%d\n",
> +			event->event_id, event->value_low);
> +		break;
> +
> +	default:
> +		dev_dbg(&wdev->dev, "Unknown event: id=3D0x%02x value=3D0x%02x\n",
> +			event->event_id, event->value_low);
> +		break;
> +	}
> +}
> +
> +static const struct wmi_device_id bitland_mifs_wmi_id_table[] =3D {
> +	{ BITLAND_MIFS_GUID, (void *)BITLAND_WMI_CONTROL },
> +	{ BITLAND_EVENT_GUID, (void *)BITLAND_WMI_EVENT },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(wmi, bitland_mifs_wmi_id_table);
> +
> +static struct wmi_driver bitland_mifs_wmi_driver =3D {
> +	.no_singleton =3D true,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.dev_groups =3D laptop_groups,
> +		.pm =3D pm_sleep_ptr(&bitland_mifs_wmi_pm_ops),
> +	},
> +	.id_table =3D bitland_mifs_wmi_id_table,
> +	.probe =3D bitland_mifs_wmi_probe,
> +	.notify_new =3D bitland_mifs_wmi_notify,
> +};
> +
> +module_wmi_driver(bitland_mifs_wmi_driver);
> +
> +MODULE_AUTHOR("Mingyou Chen <qby140326@gmail.com>");
> +MODULE_DESCRIPTION("Bitland MIFS (MiInterface) WMI driver");
> +MODULE_LICENSE("GPL");
>
> base-commit: d9d32e5bd5a4e57675f2b70ddf73c3dc5cf44fc2
