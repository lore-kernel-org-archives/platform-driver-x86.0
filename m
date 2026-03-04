Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04275351C13;
	Wed,  4 Mar 2026 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662655; cv=none; b=bsBXnVYDCRS1ijq+DfTZ/6VyZTb5Pit+nKY2bjNZByLA/wuU4C0u1q5BHjResIDvfHxUmd4EiFUp0qkGl1Xt6eURSOGVxpcgoTxgYcQDMFdlaUJoVCg5ePgYVTEJeFx75/PJo6kEDwPjF/Ii24O3qTC6+7Zt3K3HwkBR+1nE04M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662655; c=relaxed/simple;
	bh=O/47upoJ4nU8qHc5ez3XftJIq9wylUzvouoRB2HdTo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aik6FJuAPXAQU02ucMDjAXPbQV6HVgmHY2S5i8ErV2ReY3wfjX3cLtR8MOhESqvg+d51kkZBPPBuzWUbTByGwiDRPxCERmRc7/+cCChkIkW1m1mIu1TY4mITN+jeI+bb+iWaBnqxpAYyDFfFSXhSohhaAzpjKwzmwcEa1tgsgck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ACnILuCn; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ACnILuCn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772662634; x=1773267434; i=w_armin@gmx.de;
	bh=Gcpw4824eMKLpIIRodlGmVE2MH5dYqsCM0ZkoacIdG8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ACnILuCnvGs44H5zlVtWqpd2tplC03CnDlqP/okThfedbpghJ+HlS4HIEfwFixiK
	 hlt0wMRfjLAPSc2l+V34UnST0dvhwJZKn3V5nVAxPL2LTheSgbdHP3OqXzStHUxFk
	 7da2n7enN07NnDUY5CDyrauxY6xMQPwTiXs8iYMvq+BNshbKMaORApWvc1qXfwQx8
	 0rE8jDtD9mzsRRbRIPP2VX2n610Vs/XhxUx074AtCD/xHVLNuO9b7ZETIiTA3gxTo
	 T2WhAgg4MWianlrObUezTr3FFx2iwpWDixjLDijeAonrZ5n8qlG/C92dMacXN2jL4
	 PIgJ1Dljy+WYCmggrw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPGVx-1wJ9k712p3-00SwPo; Wed, 04
 Mar 2026 23:17:14 +0100
Message-ID: <b0f2d475-2602-4316-89ae-ef9bff6ac7a0@gmx.de>
Date: Wed, 4 Mar 2026 23:17:09 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: bitland-mifs-wmi: Add new Bitland MIFS
 WMI driver
To: Mingyou Chen <qby140326@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 cryolitia.pukngae@linux.dev
References: <20260226044410.10999-1-qby140326@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260226044410.10999-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XofPqwPZTMVGD8u4EWkN6oDhsCkDYZ6mDGZmFWKJ5Dw9CZzfZrv
 uJA7D8ONJqdR3+xjPPRY/UOjtP6xjd/ShaEQfnhcVFoHbQBqqYaTFDOUi/uGRi8vBPpctbl
 66L7bmY1LaEBwP7GbkiF1g8ZjrXwyAI1RdfBlT/gQa4rIa7NZdOHdkz/2y3Sr1zzAlqNnSM
 cPR4MGPMRH7W6Qneeir+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mVtXjd2idbM=;/H1bytv85WoD+qDxznA+9DDCb1l
 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

Am 26.02.26 um 05:44 schrieb Mingyou Chen:

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
>
>> Please make those const.
> Clangd is complaining when I make laptop_attrs const:
>    Controlling expression type 'const struct attribute **' not compatibl=
e with any generic association type
>
> const static DEVICE_ATTR_RW(gpu_mode);
> const static DEVICE_ATTR_RW(kb_mode);
> const static DEVICE_ATTR_WO(fan_boost);
>
> const static struct attribute *laptop_attrs[] =3D {
> 	&dev_attr_gpu_mode.attr,
> 	&dev_attr_kb_mode.attr,
> 	&dev_attr_fan_boost.attr,
> 	NULL,
> };
> ATTRIBUTE_GROUPS(laptop); /* clangd complains here */

Maybe you also need to declare the pointers themself const:

	static const struct attribute *const laptop_attrs[] { ... };

>> Please check if some of the
>> additional sysfs atributes need to be restored when resuming from hiber=
nation.
> The hardware will remember the GPU mode after reboot/suspend, so no
> need to restore it manually in the kernel.
>
> The original Windows WMI driver doesn't resume them manually.

Ok.

With the const fix above:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
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
>
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
> index 000000000000..5227af56e2df
> --- /dev/null
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -0,0 +1,851 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Linux driver for Bitland notebooks.
> + *
> + * Copyright (C) 2026 2 Mingyou Chen <qby140326@gmail.com>

Please remove the stray "2".

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
