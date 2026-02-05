Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9164D33CE9B;
	Thu,  5 Feb 2026 23:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770334133; cv=none; b=QOqS1/w9oXdl0EYtEvyWIWqrVqOI+5be5gU0zAHEChEp2YXC3YbJqXhBuMzFwEfDaxmMtWY4NYRhp8FP73NOX6fL2hshecta/+nog6oihy7fAmLCzLHrmRPRMctC37A5bb2UmEGUdy2ytHk+ZC/1WGMlTc1VfcKbd7Ery7aLbHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770334133; c=relaxed/simple;
	bh=PXZ2U9dXB0df5V0gr8F+Y/VgBzoTr3wUO+MqMWs9EZE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XvYKIi+t3QuRecsAjkkIs/FwRZqZAdVI7UOp3xGptI/whbt9WJ9sHl6F1NkvFq3rg+u38JSaobLIgUaMQ3sxW3gv108oVPfZBfd1WbiE1PmrIkGT935Oq7EB0nYkWceWEEOJXMCGdZMBoFBKbz+ZbP4ezKHAE9Iiyffe8wTpNLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=HRD8Y8iD; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HRD8Y8iD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770334104; x=1770938904; i=w_armin@gmx.de;
	bh=itjbrQKZ3tSJtbGFaScgDZJkdI91VcRjB2/jlQwHQ3c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HRD8Y8iDskkxc89Pvohze/8EzoWlUSIRJtsBoAJq51AqCbDfost5brdsv4jqz5kB
	 ezJ1lltLUFCce2nh5Wdp0otx3b/wngvRyRdOVkTV9w16UJfVOkA8eS3EBMApGNjQ6
	 yK0Ycf55Phcs2PFV6+04z3z/6Xf26ifFfqvoLCIba761ZKr2CEGW+m/GpJVlr42Pg
	 zLqeOz8x0v9wp2XlFfXum4o9F56XNmdhrUuW6OLTZKMUTKwfesoFNPzowHF9Zz+I2
	 trGK9wHAmF3fzta2JnvUitFx2ReTva3MygK7TuhAq/mEGd62JTG/3jCTK2INridMc
	 XiMXPVZAGSlW2tFN3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.242.224]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M7sDg-1vt6Zx3nUY-00FpaH; Fri, 06
 Feb 2026 00:28:24 +0100
Message-ID: <593c3ba2-3a56-458b-b771-8b74df89959d@gmx.de>
Date: Fri, 6 Feb 2026 00:28:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] platform/x86: tongfang-mifs-wmi: Add new Tongfang MIFS
 WMI driver
To: Mingyou Chen <qby140326@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 cryolitia.pukngae@linux.dev
References: <20260127111556.8433-1-qby140326@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260127111556.8433-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2wH4HB9cAwlHC/A7AXr0iFw9ByWJ90XvnDoK0Vt+RwuC+gImvkW
 RWjgJ0T86a66t2rDMtXeh4PtrC6rml3E0vl6hr83SiDd0I+4lYveIXmL4pInxWwCdMgajQX
 2lCRzlVf7IBo6BmpKP3FmkvkYzMV4SkvULZk1CRCWbQ4ybWRE9hA+bLNKl0cOoXsizLrVEU
 nNkH0Y2PF/iC2WmvS0Vkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SGcWt0bNdFM=;kbqN6236yG10mwHbGhde2jKOpRY
 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
 bPchC8tPGqL

Am 27.01.26 um 12:15 schrieb Mingyou Chen:

> Add a new driver for Tongfang laptops that utilize the MIFS
> (MiInterface)
> WMI interface. This interface is commonly found in various rebranded
> laptops from manufacturers like Mechrevo, XMG, Eluktronics, and others.
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
>
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
> v8:
>    - Fix coding style issues
>    - Use MILLIDEGREE_PER_DEGREE instead of MILLI to define the temperatu=
re unit more precisely.
>    - Align lines with the first occurrence of HWMON
>    - Remove the unnecessary empty line in error handling
>    - Reverse the logic of kb_mode_strings and drop the mode_str variable
>
>   .../wmi/devices/tongfang-mifs-wmi.rst         | 210 +++++
>   drivers/platform/x86/Kconfig                  |  16 +
>   drivers/platform/x86/Makefile                 |   1 +
>   drivers/platform/x86/tongfang-mifs-wmi.c      | 824 ++++++++++++++++++
>   4 files changed, 1051 insertions(+)
>   create mode 100644 Documentation/wmi/devices/tongfang-mifs-wmi.rst
>   create mode 100644 drivers/platform/x86/tongfang-mifs-wmi.c
>
> diff --git a/Documentation/wmi/devices/tongfang-mifs-wmi.rst b/Documenta=
tion/wmi/devices/tongfang-mifs-wmi.rst
> new file mode 100644
> index 000000000000..e59873a249c1
> --- /dev/null
> +++ b/Documentation/wmi/devices/tongfang-mifs-wmi.rst
> @@ -0,0 +1,210 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Tongfang MIFS driver (tongfang-mifs-wmi)
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
> +::

Please remove this second ::, it confuses the documentation builder.

> +
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
=3D=3D=3D=3D=3D=3D=3D

Title underline too short.

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
> index 4cb7d97a9fcc..cdef5924d118 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -113,6 +113,22 @@ config GIGABYTE_WMI
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called gigabyte-wmi.
>  =20
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
>   config ACERHDF
>   	tristate "Acer Aspire One temperature and fan driver"
>   	depends on ACPI_EC && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index d25762f7114f..1160c726bda6 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+=3D nvidia-wmi-=
ec-backlight.o
>   obj-$(CONFIG_XIAOMI_WMI)		+=3D xiaomi-wmi.o
>   obj-$(CONFIG_REDMI_WMI)			+=3D redmi-wmi.o
>   obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
> +obj-$(CONFIG_TONGFANG_MIFS_WMI)		+=3D tongfang-mifs-wmi.o
>  =20
>   # Acer
>   obj-$(CONFIG_ACERHDF)		+=3D acerhdf.o
> diff --git a/drivers/platform/x86/tongfang-mifs-wmi.c b/drivers/platform=
/x86/tongfang-mifs-wmi.c
> new file mode 100644
> index 000000000000..9c853e679f27
> --- /dev/null
> +++ b/drivers/platform/x86/tongfang-mifs-wmi.c
> @@ -0,0 +1,824 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/dev_printk.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/input-event-codes.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
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
> +#define DRV_NAME		"tongfang-mifs-wmi"
> +#define TONGFANG_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
> +#define TONGFANG_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
> +
> +

Please use "scripts/checkpatch.pl --strict <path>" to catch simple style i=
ssues
like this one (multiple blank lines).

> +enum tongfang_mifs_operation {
> +	WMI_METHOD_GET	=3D 250,
> +	WMI_METHOD_SET	=3D 251,
> +};
> +
> +enum tongfang_mifs_function {
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
> +enum tongfang_system_ac_mode {
> +	WMI_SYSTEM_AC_TYPEC		=3D 1,
> +	/* Unknown type, this is unused in the original driver */
> +	WMI_SYSTEM_AC_CIRCULARHOLE	=3D 2,
> +};
> +
> +enum tongfang_mifs_power_profile {
> +	WMI_PP_BALANCED		=3D 0,
> +	WMI_PP_PERFORMANCE	=3D 1,
> +	WMI_PP_QUIET		=3D 2,
> +	WMI_PP_FULL_SPEED	=3D 3,
> +};
> +
> +enum tongfang_mifs_event_id {
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
> +enum tongfang_mifs_event_type {
> +	WMI_EVENT_TYPE_HOTKEY	=3D 1,
> +};
> +
> +enum tongfang_wmi_device_type {
> +	TONGFANG_WMI_CONTROL	=3D 0,
> +	TONGFANG_WMI_EVENT	=3D 1,
> +};
> +
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
> +	u8 value_low;	/* For most events, this is the value */
> +	u8 value_high;	/* For fan speed events, combined with value_low */
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
> +
> +	guard(mutex)(&data->lock);
> +
> +	in_buf.length =3D sizeof(*input);
> +	in_buf.data =3D (void *)input;

Is that cast really necessary? If no then please remove it.

> +
> +	if (output) {
> +		out_buf.length =3D sizeof(*output);
> +		out_buf.data =3D output;
> +	}

This is not how wmidev_invoke_method() is supposed to work. The WMI driver=
 core will
allocate a new buffer for holding the result of the WMI method call, the p=
revious contents
of out_buf are irrelevant.

Please simply check that after having called wmidev_invoke_method(), the l=
ength of out_buf
is equal or greater than sizeof(*output). Then you simply use memcpy() to =
move the necessary
bytes from out_buf.data into *output.

If *output is NULL, then you can skip all this and continue to pass NULL i=
nstead of out_buf.

> +
> +	return wmidev_invoke_method(data->wdev, 0, 1, &in_buf,
> +				   output ? &out_buf : NULL);
> +}
> +
> +static bool is_ac_online(void)
> +{
> +	struct power_supply *psy;
> +	union power_supply_propval val;
> +	bool online =3D false;
> +
> +	psy =3D power_supply_get_by_name("ADP1");
> +	if (!psy)
> +		return false;
> +
> +	if (!power_supply_get_property(psy, POWER_SUPPLY_PROP_ONLINE, &val))
> +		online =3D (val.intval =3D=3D 1);
> +
> +	power_supply_put(psy);
> +	return online;
> +}

Please use power_supply_is_system_supplied() instead.

> +
> +static int laptop_profile_get(struct device *dev,
> +			      enum platform_profile_option *profile)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_SYSTEM_PER_MODE,
> +	};
> +	struct tongfang_mifs_output result;
> +	int ret;
> +
> +	ret =3D tongfang_mifs_wmi_call(data, &input, &result);
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
> +

See the above comment regarding checkpatch and multiple blank lines.

> +static int laptop_profile_set(struct device *dev,
> +			      enum platform_profile_option profile)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_SET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_SYSTEM_PER_MODE,
> +	};
> +	struct tongfang_mifs_output ac_type_res;
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
> +		val =3D WMI_PP_PERFORMANCE;
> +		fallthrough;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		/*
> +		 * Check if Typec power is not connected for
> +		 * full-speed/performance mode
> +		 */
> +		input.operation =3D WMI_METHOD_GET;
> +		input.function =3D WMI_FN_SYSTEM_AC_TYPE;
> +		ret =3D tongfang_mifs_wmi_call(data, &input, &ac_type_res);
> +		if (ret)
> +			return ret;
> +
> +		/* Full-speed/performance mode requires DC power (not USB-C) */
> +		if (ac_type_res.data[0] =3D=3D WMI_SYSTEM_AC_TYPEC || !is_ac_online()=
)
> +			return -EOPNOTSUPP;
> +
> +		if (!val)

val is potentially uninitialized here when selecting the performance profi=
le.
I suggest that you move the type-C power check into a separate helper func=
tion
and call those when selecting balanced-performance and performance profile=
s.
This would also allow you to get rid of the fallthrough.
.

> +			val =3D WMI_PP_FULL_SPEED;
> +
> +		/* Restore operation and function for the actual SET call */
> +		input.operation =3D WMI_METHOD_SET;
> +		input.function =3D WMI_FN_SYSTEM_PER_MODE;
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	input.payload[0] =3D val;
> +
> +	return tongfang_mifs_wmi_call(data, &input, NULL);
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
> +static int tongfang_mifs_wmi_suspend(struct device *dev)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	enum platform_profile_option profile;
> +	int ret;
> +
> +	ret =3D laptop_profile_get(dev, &profile);
> +	if (ret =3D=3D 0)
> +		data->saved_profile =3D profile;

Please return the error here instead of always returning 0. Otherwise this=
 might
cause data->saved_profile to contain outdated data when resuming.

> +
> +	return 0;
> +}
> +
> +static int tongfang_mifs_wmi_resume(struct device *dev)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +
> +	if (data->saved_profile !=3D PLATFORM_PROFILE_LAST) {
> +		dev_dbg(dev, "Resuming, restoring profile %d\n",
> +			data->saved_profile);
> +		return laptop_profile_set(dev, data->saved_profile);
> +	}

Please remove the check regarding PLATFORM_PROFILE_LAST here. data->saved_=
profile
should always contain valid data after a successful suspend transition.

> +
> +	return 0;
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(tongfang_mifs_wmi_pm_ops,
> +				tongfang_mifs_wmi_suspend,
> +				tongfang_mifs_wmi_resume);
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
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +	};
> +	struct tongfang_mifs_output res;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		input.function =3D WMI_FN_CPU_THERMOMETER;
> +		ret =3D tongfang_mifs_wmi_call(data, &input, &res);
> +		if (!ret)
> +			*val =3D res.data[0] * MILLIDEGREE_PER_DEGREE;

You should directly return ret here instead of using break. This applies t=
o
the whole switch case as well. You can for example replace some breaks wit=
h
return statements.

> +		break;
> +	case hwmon_fan:
> +		input.function =3D WMI_FN_FAN_SPEEDS;
> +		ret =3D tongfang_mifs_wmi_call(data, &input, &res);
> +		if (ret)
> +			break;
> +
> +		switch (channel) {
> +		case 0: /* CPU */
> +			*val =3D get_unaligned_le16(&res.data[0]);
> +			break;
> +		case 1: /* GPU */
> +			*val =3D get_unaligned_le16(&res.data[2]);
> +			break;
> +		case 2: /* SYS */
> +			*val =3D get_unaligned_le16(&res.data[6]);
> +			break;
> +		default:
> +			ret =3D -EINVAL;
> +			break;
> +		}
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +	return ret;
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
> +				HWMON_F_INPUT | HWMON_F_LABEL,
> +				HWMON_F_INPUT | HWMON_F_LABEL),
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
> +	struct tongfang_mifs_wmi_data *data =3D
> +		container_of(led_cdev, struct tongfang_mifs_wmi_data, kbd_led);
> +	struct tongfang_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_SET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_RGB_KB_BRIGHTNESS,
> +	};
> +
> +	input.payload[0] =3D (u8)value;
> +
> +	return tongfang_mifs_wmi_call(data, &input, NULL);
> +}
> +
> +static enum led_brightness laptop_kbd_led_get(struct led_classdev *led_=
cdev)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D
> +		container_of(led_cdev, struct tongfang_mifs_wmi_data, kbd_led);
> +	struct tongfang_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_RGB_KB_BRIGHTNESS,
> +	};
> +	struct tongfang_mifs_output res;
> +	int ret;
> +
> +	ret =3D tongfang_mifs_wmi_call(data, &input, &res);
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
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_GPU_MODE,
> +	};
> +	struct tongfang_mifs_output res;
> +	u8 mode_val;
> +	int ret;
> +
> +	ret =3D tongfang_mifs_wmi_call(data, &input, &res);
> +
> +	if (ret)
> +		return ret;
> +
> +	mode_val =3D res.data[0];
> +
> +	if (mode_val >=3D ARRAY_SIZE(gpu_mode_strings))
> +		return sysfs_emit(buf, "%d\n", mode_val);

Please return -EPROTO here when receiving an unknown value from the
WMI interface.

> +
> +	return sysfs_emit(buf, "%s\n", gpu_mode_strings[mode_val]);
> +}
> +
> +static ssize_t gpu_mode_store(struct device *dev, struct device_attribu=
te *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input =3D {
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
> +	ret =3D tongfang_mifs_wmi_call(data, &input, NULL);
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
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_GET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_RGB_KB_MODE,
> +	};
> +	struct tongfang_mifs_output res;
> +	int ret;
> +	u8 mode_val;
> +
> +	ret =3D tongfang_mifs_wmi_call(data, &input, &res);
> +	if (ret)
> +		return ret;
> +
> +	mode_val =3D res.data[0];
> +
> +	if (mode_val >=3D ARRAY_SIZE(kb_mode_strings))
> +		return sysfs_emit(buf, "%u\n", mode_val);

Same as above.

> +
> +	return sysfs_emit(buf, "%s\n", kb_mode_strings[mode_val]);
> +}
> +
> +static ssize_t kb_mode_store(struct device *dev, struct device_attribut=
e *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_SET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_RGB_KB_MODE,
> +	};
> +	// the wmi value (0, 1, 2 or 3)
> +	int val;
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	val =3D sysfs_match_string(kb_mode_strings, buf);
> +	if (val < 0)
> +		return -EINVAL;
> +
> +	input.payload[0] =3D (u8)val;
> +
> +	ret =3D tongfang_mifs_wmi_call(data, &input, NULL);
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
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	struct tongfang_mifs_input input =3D {
> +		.reserved1 =3D 0,
> +		.operation =3D WMI_METHOD_SET,
> +		.reserved2 =3D 0,
> +		.function =3D WMI_FN_MAX_FAN_SWITCH,
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
> +	payload[0] =3D 0; /* CPU/GPU Fan */
> +	payload[1] =3D val;
> +
> +	memcpy(input.payload, payload, sizeof(payload));

Would it be possible to operate on input directly without using payload?

> +
> +	ret =3D tongfang_mifs_wmi_call(data, &input, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t profile_persist_show(struct device *dev,
> +					struct device_attribute *attr, char *buf)
> +{
> +	enum platform_profile_option profile;
> +	int ret;
> +
> +	ret =3D laptop_profile_get(dev, &profile);
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

What is the purpose of this sysfs attribute?

> +
> +static DEVICE_ATTR_RW(gpu_mode);
> +static DEVICE_ATTR_RW(kb_mode);
> +static DEVICE_ATTR_WO(fan_boost);
> +static DEVICE_ATTR_RW(profile_persist);
> +
> +static struct attribute *laptop_attrs[] =3D {
> +	&dev_attr_gpu_mode.attr,
> +	&dev_attr_kb_mode.attr,
> +	&dev_attr_fan_boost.attr,
> +	&dev_attr_profile_persist.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(laptop);
> +
> +static const struct key_entry tongfang_mifs_wmi_keymap[] =3D {
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
> +static int tongfang_mifs_wmi_probe(struct wmi_device *wdev, const void =
*context)
> +{
> +	struct tongfang_mifs_wmi_data *drv_data;
> +	struct device *pp_dev;
> +	struct device *hwmon_dev;
> +	enum tongfang_wmi_device_type dev_type =3D
> +		(enum tongfang_wmi_device_type)(unsigned long)context;
> +	int ret;
> +
> +	drv_data =3D devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
> +	if (!drv_data)
> +		return -ENOMEM;
> +
> +	drv_data->wdev =3D wdev;
> +
> +	ret =3D devm_mutex_init(&wdev->dev, &drv_data->lock);
> +	if (ret) {
> +		dev_err(&wdev->dev, "failed to initialize WMI data lock: %d\n", ret);
> +		return ret;
> +	}

Please just return ret here.

> +
> +	dev_set_drvdata(&wdev->dev, drv_data);
> +
> +	if (dev_type =3D=3D TONGFANG_WMI_EVENT) {
> +		/* Register input device for hotkeys */
> +		drv_data->input_dev =3D devm_input_allocate_device(&wdev->dev);
> +		if (!drv_data->input_dev)
> +			return -ENOMEM;
> +
> +		drv_data->input_dev->name =3D "Tongfang MIFS WMI hotkeys";
> +		drv_data->input_dev->phys =3D "wmi/input0";
> +		drv_data->input_dev->id.bustype =3D BUS_HOST;
> +		drv_data->input_dev->dev.parent =3D &wdev->dev;
> +
> +		ret =3D sparse_keymap_setup(drv_data->input_dev,
> +					  tongfang_mifs_wmi_keymap, NULL);
> +		if (ret) {
> +			dev_err(&wdev->dev, "Failed to setup sparse keymap\n");
> +			return ret;
> +		}

Same as above.

> +
> +		ret =3D input_register_device(drv_data->input_dev);
> +		if (ret) {
> +			dev_err(&wdev->dev,
> +				"Failed to register input device\n");
> +			return ret;
> +		}

Same as above.

> +
> +		dev_info(&wdev->dev, "Registered WMI event device\n");

Please remove this, it has no real value.

> +
> +		return 0;
> +	}
> +
> +	/* Register platform profile */
> +	pp_dev =3D devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_da=
ta,
> +						&laptop_profile_ops);
> +	if (IS_ERR(pp_dev)) {
> +		dev_err(&wdev->dev, "Failed to register platform profile\n");

...

> +		return PTR_ERR(pp_dev);
> +	}
> +
> +	drv_data->saved_profile =3D PLATFORM_PROFILE_LAST;

Please remove.

> +
> +	/* Register hwmon */
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(&wdev->dev, "tongfa=
ng_mifs",
> +						  drv_data, &laptop_chip_info, NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		dev_err(&wdev->dev, "Failed to register hwmon\n");

...

> +		return PTR_ERR(hwmon_dev);
> +	}
> +
> +	/* Register keyboard LED */
> +	drv_data->kbd_led.name =3D "laptop::kbd_backlight";
> +
> +	drv_data->kbd_led.max_brightness =3D 3;
> +	drv_data->kbd_led.brightness_set_blocking =3D laptop_kbd_led_set;
> +	drv_data->kbd_led.brightness_get =3D laptop_kbd_led_get;
> +	ret =3D devm_led_classdev_register(&wdev->dev, &drv_data->kbd_led);
> +	if (ret) {
> +		dev_err(&wdev->dev, "Failed to register keyboard LED\n");
...
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void tongfang_mifs_wmi_notify(struct wmi_device *wdev,
> +				     union acpi_object *obj)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev);
> +	const struct tongfang_mifs_event *event;
> +	u16 fan_speed;
> +
> +	if (!obj || obj->type !=3D ACPI_TYPE_BUFFER)
> +		return;
> +
> +	if (obj->buffer.length < sizeof(*event))
> +		return;

Please use the .notify_new callback. This way you receive a struct wmi_buf=
fer instead
of the ACPI object, so you can omit some of those checks.

> +
> +	event =3D (const struct tongfang_mifs_event *)obj->buffer.pointer;
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
> +		led_classdev_notify_brightness_hw_changed(&data->kbd_led,
> +							  event->value_low);

AFAIK this will not work, the LED is registered by the other WMI device.
I suggest you use a notifier chain as shown in drivers/platform/x86/uniwil=
l/uniwill-wmi.c.
This way you can forward the WMI events to the WMI method device.

> +		break;
> +
> +	case WMI_EVENT_PERFORMANCE_PLAN:
> +		platform_profile_notify(&wdev->dev);

Same as above.

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
> +		fan_speed =3D (event->value_high << 8) | event->value_low;
> +		dev_dbg(&wdev->dev, "Fan speed event: id=3D%d speed=3D%u RPM\n",
> +			event->event_id, fan_speed);
> +		/* These are informational, hwmon polling will read the actual values=
 */
> +		break;

Maybe you can use hwmon_notify_event() so that any hwmon consumers can use=
 poll() or select()
when waiting for new fan speed readings.

Thanks,
Armin Wolf

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
> +static const struct wmi_device_id tongfang_mifs_wmi_id_table[] =3D {
> +	{ TONGFANG_MIFS_GUID, (void *)TONGFANG_WMI_CONTROL },
> +	{ TONGFANG_EVENT_GUID, (void *)TONGFANG_WMI_EVENT },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(wmi, tongfang_mifs_wmi_id_table);
> +
> +static struct wmi_driver tongfang_mifs_wmi_driver =3D {
> +	.no_singleton =3D true,
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.dev_groups =3D laptop_groups,
> +		.pm =3D pm_sleep_ptr(&tongfang_mifs_wmi_pm_ops),
> +	},
> +	.id_table =3D tongfang_mifs_wmi_id_table,
> +	.probe =3D tongfang_mifs_wmi_probe,
> +	.notify =3D tongfang_mifs_wmi_notify,
> +};
> +
> +module_wmi_driver(tongfang_mifs_wmi_driver);
> +
> +MODULE_AUTHOR("Mingyou Chen <qby140326@gmail.com>");
> +MODULE_DESCRIPTION("Tongfang MIFS (MiInterface) WMI driver");
> +MODULE_LICENSE("GPL");
>
> base-commit: 2ccbdb612d0d95f25c38189b83666ff0fb2bfb47
