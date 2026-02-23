Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2081B808;
	Mon, 23 Feb 2026 02:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771814002; cv=none; b=hnvZc0G7w8hSnRfd0a9yGe5T8gI+jFAd8aUEFgd7bVopD8F8goP9A9pa+LV9E/ha97B/OCL0K4fQ41UpmXlcUUUJ2Dg6pn+wAP1uW7kHGr8Oh4PCAPP6TRKT+oB9/Dj05P+p5XtXqlzAgKti4xqdK9ZquNS/Nim+mtiIpiSUYZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771814002; c=relaxed/simple;
	bh=Q454hEl7PobocIVgM9qL2lhhJVuoFVIGLb0K0KQzY5Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxRdgAEd1fNwz4yDPgjZDfB915L+09mkDfsSm2YvuCwu4+eaZg3IDpIV6kf3znKOwBTwxmzln3HN1wSMSNn0vbYOO4ddGBlxrAbM9v0pp/XxoSDMQQevr+6Y0AVC7YCykqmghr7Ht10RyZvK17FYQH7uwZ/SNCitFrTv/+xHFnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=KFvpTfZ3; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="KFvpTfZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771813978; x=1772418778; i=w_armin@gmx.de;
	bh=BgFg/qvpFSyIvwTbQJm+eBbb3wepq3CT3hmWt4yvWoc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=KFvpTfZ3eYQxcwezKDTe+hkLmySqgDU7/JBVRqTE5hptSilf7aJBQhEt8Re1l4es
	 g9raVFRewUSo6Pxa8j0mgqrdoBXZr/W8dBP9hhzD8ZaQ+Ed1c6AXx8A6viWIfEmyl
	 YVp1+MySb8I6rq6MYMN7tsVHwfs0iqFoBX6GeocPJxADOETBya1/w/UYLcAiK/0Aj
	 vOAyryOvySWV5yLDwnccBTVrAPGt9ZYRLOJcdU2ARBsqR1aXf1Ltzxcqa3ZqyEthP
	 t4LisiBvpLT9x72uDMZV7rXq1IA2vZMMqMm3HYdQQDpY+zAzwOeOqYtainoTsWM3F
	 fEh4dH4PvSefHoQG4A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.26] ([91.14.226.35]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnakR-1vUbOR0kOT-00gKur; Mon, 23
 Feb 2026 03:32:58 +0100
Message-ID: <2e1ed085-cdf1-43ef-94d1-6b105b933057@gmx.de>
Date: Mon, 23 Feb 2026 03:32:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] platform/x86: bitland-mifs-wmi: Add new Bitland MIFS
 WMI driver
To: Mingyou Chen <qby140326@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 cryolitia.pukngae@linux.dev
References: <20260216004757.8589-1-qby140326@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260216004757.8589-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:QKMc1P7uL9Tp3rfHcYnKZjp2ZPWK9EfGP5vliEyK2f65DxpBxXG
 UNpekUqu5P4syxSoNUAGf1xQr89uKDHeMHwFHdz0lXWJg2LW2UjAo8O8uKfbLGQkIanP5sE
 QpR0sKch2saExBlCG+iDKOovaH6LmPRAtonT3pjUhJ/z86coClOd39SNPQN2LfCzYWaYuNu
 //qXReDimZezw0xk9nP5Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v5TR0pyUbLo=;tA4O96KAD71cYaXEYktv/gc/wjK
 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
 bNWb3V0jDgJ

Am 16.02.26 um 01:47 schrieb Mingyou Chen:

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
>
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
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
>   drivers/platform/x86/Kconfig                  |  16 +
>   drivers/platform/x86/Makefile                 |   1 +
>   drivers/platform/x86/bitland-mifs-wmi.c       | 856 ++++++++++++++++++
>   4 files changed, 1080 insertions(+)
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
> index 4cb7d97a9fcc..1aa1f98b341d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -113,6 +113,22 @@ config GIGABYTE_WMI
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called gigabyte-wmi.
>  =20
> +config BITLAND_MIFS_WMI
> +	tristate "Bitland MIFS (MiInterface) WMI driver"
> +	depends on ACPI_WMI
> +	depends on HWMON
> +	depends on POWER_SUPPLY
> +	select ACPI_PLATFORM_PROFILE

Please also depend on INPUT and select INPUT_SPARSEKMAP. I also noticed th=
at you did not
fix the other issues that i pointed out in my review of revision 10. Pleas=
e fix them.

Thanks,
Armin Wolf

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
> index 000000000000..76c925075886
> --- /dev/null
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -0,0 +1,856 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
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
> +static ATOMIC_NOTIFIER_HEAD(bitland_notifier_list);
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
> +	if (output.data[0] =3D=3D WMI_SYSTEM_AC_TYPEC)
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
> +	ret =3D laptop_profile_get(dev, &profile);
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
> +	if (!data)
> +		return -EINVAL;
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
> +	if (!data)
> +		return -EINVAL;
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
> +static DEVICE_ATTR_RW(gpu_mode);
> +static DEVICE_ATTR_RW(kb_mode);
> +static DEVICE_ATTR_WO(fan_boost);
> +
> +static struct attribute *laptop_attrs[] =3D {
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
> +	atomic_notifier_chain_unregister(&bitland_notifier_list, nb);
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
> +		platform_profile_notify(&data_ctx->wdev->dev);
> +		break;
> +	case BITLAND_NOTIFY_HWMON:
> +		fan_info =3D data;
> +		if (!fan_info)
> +			return NOTIFY_DONE;
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
> +	struct device *pp_dev;
> +	enum bitland_wmi_device_type dev_type =3D
> +		(enum bitland_wmi_device_type)(unsigned long)context;
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
> +		ret =3D input_register_device(drv_data->input_dev);
> +		if (ret)
> +			return ret;
> +
> +		return 0;
> +	}
> +
> +	/* Register platform profile */
> +	pp_dev =3D devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_da=
ta,
> +						&laptop_profile_ops);
> +	if (IS_ERR(pp_dev))
> +		return PTR_ERR(pp_dev);
> +
> +	drv_data->saved_profile =3D PLATFORM_PROFILE_LAST;
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
> +	drv_data->kbd_led.name =3D "laptop::kbd_backlight";
> +
> +	drv_data->kbd_led.max_brightness =3D 3;
> +	drv_data->kbd_led.brightness_set_blocking =3D laptop_kbd_led_set;
> +	drv_data->kbd_led.brightness_get =3D laptop_kbd_led_get;
> +	ret =3D devm_led_classdev_register(&wdev->dev, &drv_data->kbd_led);
> +	if (ret)
> +		return ret;
> +
> +	drv_data->notifier.notifier_call =3D bitland_notifier_callback;
> +	ret =3D atomic_notifier_chain_register(&bitland_notifier_list, &drv_da=
ta->notifier);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(&wdev->dev,
> +				       bitland_notifier_unregister,
> +				       &drv_data->notifier);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
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
> +	event =3D (const struct bitland_mifs_event *)buffer->data;
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
> +		atomic_notifier_call_chain(&bitland_notifier_list,
> +					   BITLAND_NOTIFY_KBD_BRIGHTNESS,
> +					   &brightness);
> +		break;
> +
> +	case WMI_EVENT_PERFORMANCE_PLAN:
> +		atomic_notifier_call_chain(&bitland_notifier_list,
> +					   BITLAND_NOTIFY_PLATFORM_PROFILE,
> +					   NULL);
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
> +		atomic_notifier_call_chain(&bitland_notifier_list,
> +					   BITLAND_NOTIFY_HWMON,
> +					   &fan_data);
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
> base-commit: 2ccbdb612d0d95f25c38189b83666ff0fb2bfb47
