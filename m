Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F7E5914C;
	Thu,  2 Jan 2025 19:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735845252; cv=none; b=TahfChaF1I3/Fmz8z3H9K+ZrAboOWVRlo7e5US6mpst5Nrwr6/4xfY7ninyBAQaRRL9GR2JC0rPNWegr9XivSTLK5oW9LlO9LR9LgzCWnJo7HMtF2jKpwVZPdA2qXOIYWZEcUbDZ278WbpGUNCZAKzSZMj5+qhhLCOE4RQWURs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735845252; c=relaxed/simple;
	bh=FFDlZYAsNiszyI3DM1gjGzJmrGASBCu40lBaaij4KFQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iG6xrWUflzJDNdXaNS+oGoNu/WU+z4epn1CaPaYyNHpSSJUlBeVrazVFga+fuvgEPaWyhStMHWViC/whFzu0XV0mjK6T53o5F9NQ9VcBEgYucLNoTq0+PbcQKl6Ymf0bmo993GguXEtSQxTMDYjtFOQEujg7Ht1d/7Trn/SjMGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ItNSnVhd; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ItNSnVhd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735845226; x=1736450026; i=w_armin@gmx.de;
	bh=ylmUT/R6cX66M4ru+NZZZUqYH4lRoLGFYBefqtCdDI0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ItNSnVhd63xpeF2gqiDSBfwzWnd5pBnq1XNth+59NmpPwUrBLBmtvWWAf7mHUGvW
	 VVio24+YD9AboNkh2w/1tG7MhqRp0dOZhTF16IBqLMjvhcZtjz+PTetwQhm8gSK8f
	 3NkbRpea4IAHMsdTLuoopGIxJ94Gcn6qvAkheX9MdNKvG/Yi3axZNFVPfDreoVXDx
	 m+pOyIzXDbEBt+zrPBub5Ow3XFI2GcpIHRJdklMDmmD0lKwvh7Qi2/rQpyW2owJup
	 J3q+zpCG3xxW985nTrUzFLZ75LymjBWD6DHL639KMplWxQPA2pKVG8vXopzcoJ+hW
	 Cp72dCwrkvIoJKlq/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mBa-1td5ks0Nps-013wCx; Thu, 02
 Jan 2025 20:13:46 +0100
Message-ID: <0fbe58a9-ecca-437f-aa30-9d3a17c2bd43@gmx.de>
Date: Thu, 2 Jan 2025 20:13:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] platform/x86: samsung-galaxybook: Add
 samsung-galaxybook driver
To: Joshua Grisham <josh@joshuagrisham.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241226153031.49457-1-josh@joshuagrisham.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241226153031.49457-1-josh@joshuagrisham.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MQ046KyLCnb+/ltppMkMr6gbwQUgQHo5kL6Or/NvSe0BbNEPJb5
 lMRZDv69OnsPi+PyQBlQrCsosYylYI99o645a0qYnYZkfORkgYPk7msttjvV4LwruwZVe36
 8gjxXNN6v0DGt2lb9/1vAhN1jYyPqh/bD9ETXRWSC13bjFACI8WxDeAmfspYPz0lppk/+Rv
 b1bnUvFaak0om684R0TTw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Ljrjmh7S0cU=;3k81BKGXerrbVk2MS5Zq4nLyih3
 jKvOg4LCp6rkyOxsXjl067m4CWRcMkdxEYNn3hDm+/dGqRSGH4vRuqKE5nwo5otkxlc4imD2x
 jUL8GmgfgccsQpZm2TeYzB9A9VhB2LgmBXwtGLisAVzABH83wyWmcuLFPRsGwUDdNldGRGizK
 UdombIXLwM2AalH9HGpaCBL3zYybaIQnEvPCt2HUcJyjjJrV6I5jjNoAexiWqobmFR06cptWB
 knqZGSO/QIraFiEgqfj0nkxhmq76xLp1ieC/NwaGL5AI3cRSXn4Na6otnhON2eduCiusL9E+e
 pexcs2R+Jr2lA3uBrVp/4vPxsoj7xXbLLCze66ZuzHGnU0nilwXw1LRyzpzMc9x2ju2u/Vzad
 3tRI5LxsPyKAOfvldND+/5Sd/RhnrzWG2Vt5xMiGrHs01E+breBq5kYUTq74GoH55oOCGTPFt
 USsi2TrTa3D3L8zAL4sDl2P/dIhwc38seYMAeYcvva5IvVMpljONq0JikBE/YwkRe2Xx+0CTz
 yqDaZpUbQu69Mf4MvncIzKZQ6tmCNGIyzKMkyAjGjnXQnBQtKMmHRMBGg0navT4nSK9XcpmjK
 qzHn4o/0B1Vp8vyKmYVRLMEc52ndgEsa+77zdE4wAqMRly/bCG0KS/JZJO2D8OVuP08Mof/Yx
 5FmvL1aj6sHUT2DIsnxkLbE6uAIrCxmushcc6f0zF//m3h+Q1SCaBW6tjsl3eQPR0iT91Pd3Z
 i6kQFc3TibiwwthniJEjcPoI3gjf6aP7sVgcw4lBTQjyshcOUdz8G++F6KI0FiKHgvl1ks4WQ
 GaqQema+D/2hx2rrk2P6pThcoZLrLmkxYZaUWW/izzD34GtjCA0S07gyvq6v8b/9dVTuE1mRh
 OmlJq0hDH829jLf4YJCYGHJIRczRHVH4WWF7iTL8/4Q2pgXUH8fUGaYicIF0IY67VuDyoW/P1
 aCNpVbnxQo3V23WeE8lVNv1eYKSfIXH0oN/kfYqptkzeIyYoo91FKaFrPBn+Y9iytbfomwuBs
 4qMJzQMRbKYpEgBDxnkyfslyTqMH3tgFBIjqUms7WNY6v+FtMn2X8Hbi/bw5/j0Euc4PvUY7b
 uLs1rUr2rH/+Rxst0mjaaZFZkqmUEm

Am 26.12.24 um 16:30 schrieb Joshua Grisham:

> Adds a new driver for Samsung Galaxy Book series notebook devices with t=
he
> following features:
>
> - Keyboard backlight control
> - Battery extension with charge control end threshold
> - Controller for Samsung's performance modes using the platform profile
>    interface
> - Adds firmware-attributes to control various system features
> - Handles various hotkeys and notifications
>
> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
> ---
>
> v1->v2:
> - Attempt to resolve all review comments from v1 as written here:
> https://lore.kernel.org/platform-driver-x86/53c5075b-1967-45d0-937f-4639=
12dd966d@gmx.de/T/#mbcbd8d5d9bc4496bac5486636c7d3b32bc3e5cd0
>
> v2->v3:
> - Tweak to battery attribute to closer match pattern in dell-wmi-ddv
> - implement platform_profile_remove() change from
>    9b3bb37b44a317626464e79da8b39989b421963f
> - Small tweak to Documentation page
>
> v3->v4:
> - Remove custom tracepoint (can trace via existing mechanisms)
> - Remove module parameters
> - Move sysfs attributes from device to firmware-attributes
> - Refactor "allow_recording" to "camera_lens_cover" plus other small
>    renames in aim to have more standardized naming that are cross-vendor
> - Attempt to improve locking mechanisms
> - Tweak logic for setting and getting led brightness
> - More fixes for aiming to use devres/devm pattern
> - Change battery charge end threshold to use 1 to 100 instead of 0 to 99
> - Add swtich input event for camera_lens_cover remove all others (they w=
ill
>    be generated as ACPI netlink events instead)
> - Various other small tweaks and features as requested from feedback
> ---
>   .../testing/sysfs-class-firmware-attributes   |   28 +
>   Documentation/admin-guide/laptops/index.rst   |    1 +
>   .../laptops/samsung-galaxybook.rst            |  165 ++
>   MAINTAINERS                                   |    7 +
>   drivers/platform/x86/Kconfig                  |   18 +
>   drivers/platform/x86/Makefile                 |    5 +-
>   drivers/platform/x86/samsung-galaxybook.c     | 1493 +++++++++++++++++
>   7 files changed, 1715 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/admin-guide/laptops/samsung-galaxyboo=
k.rst
>   create mode 100644 drivers/platform/x86/samsung-galaxybook.c
>
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b=
/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 2713efa509b4..dd36577b68f2 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -326,6 +326,17 @@ Description:
>   					This role is specific to Secure Platform Management (SPM) attribu=
te.
>   					It requires configuring an endorsement (kek) and signing certific=
ate (sk).
>
> +What:		/sys/class/firmware-attributes/*/attributes/camera_lens_cover
> +Date:		December 2024
> +KernelVersion:	6.13
> +Contact:	Joshua Grisham <josh@joshuagrisham.com>
> +Description:
> +		This attribute can be used to control the behavior of a software-base=
d camera lens
> +		cover. The value is a boolean represented by 0 for false (camera is n=
ot blocked)
> +		and 1 for true (camera is blocked).
> +
> +		On Samsung Galaxy Book systems, this attribute will also control a so=
ftware-based
> +		"cover" of the microphone in addition to the camera.
>
>   What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
>   Date:		February 2021
> @@ -356,6 +367,14 @@ Description:
>   		Drivers may emit a CHANGE uevent when this value changes and userspa=
ce
>   		may check it again.
>
> +What:		/sys/class/firmware-attributes/*/attributes/power_on_lid_open
> +Date:		December 2024
> +KernelVersion:	6.13
> +Contact:	Joshua Grisham <josh@joshuagrisham.com>
> +Description:
> +		This attribute can be used to control powering on a device when the l=
id is opened.
> +		The value is a boolean represented by 0 for false and 1 for true.
> +
>   What:		/sys/class/firmware-attributes/*/attributes/reset_bios
>   Date:		February 2021
>   KernelVersion:	5.11
> @@ -429,6 +448,15 @@ Description:
>   		HP specific class extensions - Secure Platform Manager (SPM)
>   		--------------------------------
>
> +What:		/sys/class/firmware-attributes/*/attributes/usb_charging
> +Date:		December 2024
> +KernelVersion:	6.13
> +Contact:	Joshua Grisham <josh@joshuagrisham.com>
> +Description:
> +		This attribute can be used to control if USB ports can continue to de=
liver power to
> +		connected devices when the device is powered off or in a low sleep st=
ate. The value
> +		is a boolean represented by 0 for false and 1 for true.

Hi,

please move the documentation of the firmware attributes to samsung-galaxy=
book.rst to avoid cluttering
the subsystem docs with too much driver-specific entries.

> +
>   What:		/sys/class/firmware-attributes/*/authentication/SPM/kek
>   Date:		March 2023
>   KernelVersion:	5.18
> diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation=
/admin-guide/laptops/index.rst
> index cd9a1c2695fd..e71c8984c23e 100644
> --- a/Documentation/admin-guide/laptops/index.rst
> +++ b/Documentation/admin-guide/laptops/index.rst
> @@ -11,6 +11,7 @@ Laptop Drivers
>      disk-shock-protection
>      laptop-mode
>      lg-laptop
> +   samsung-galaxybook
>      sony-laptop
>      sonypi
>      thinkpad-acpi
> diff --git a/Documentation/admin-guide/laptops/samsung-galaxybook.rst b/=
Documentation/admin-guide/laptops/samsung-galaxybook.rst
> new file mode 100644
> index 000000000000..65da7cd84c01
> --- /dev/null
> +++ b/Documentation/admin-guide/laptops/samsung-galaxybook.rst
> @@ -0,0 +1,165 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +Samsung Galaxy Book Extras
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Joshua Grisham <josh@joshuagrisham.com>
> +
> +This is a Linux x86 platform driver for Samsung Galaxy Book series note=
book
> +devices which utilizes Samsung's ``SCAI`` ACPI device in order to contr=
ol
> +extra features and receive various notifications.
> +
> +Supported devices
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Any device with one of the supported ACPI device IDs should be supporte=
d. This
> +covers most of the "Samsung Galaxy Book" series notebooks that are curr=
ently
> +available as of this writing, and could include other Samsung notebook =
devices
> +as well.
> +
> +Status
> +=3D=3D=3D=3D=3D=3D
> +
> +The following features are currently supported:
> +
> +- :ref:`Keyboard backlight <keyboard-backlight>` control
> +- :ref:`Performance mode <performance-mode>` control implemented using =
the
> +  platform profile interface
> +- :ref:`Battery charge control end threshold
> +  <battery-charge-control-end-threshold>` (stop charging battery at giv=
en
> +  percentage value) implemented as a battery device extension
> +- :ref:`Firmware Attributes <firmware-attributes>` to allow control of =
various
> +  device settings
> +- :ref:`Handling of Fn hotkeys <keyboard-hotkey-actions>` for various a=
ctions
> +- :ref:`Handling of ACPI notifications and hotkeys
> +  <acpi-notifications-and-hotkey-actions>`
> +
> +Because different models of these devices can vary in their features, t=
here is
> +logic built within the driver which attempts to test each implemented f=
eature
> +for a valid response before enabling its support (registering additiona=
l devices
> +or extensions, adding sysfs attributes, etc). Therefore, it can be impo=
rtant to
> +note that not all features may be supported for your particular device.
> +
> +The following features might be possible to implement but will require
> +additional investigation and are therefore not supported at this time:
> +
> +- "Dolby Atmos" mode for the speakers
> +- "Outdoor Mode" for increasing screen brightness on models with ``SAM0=
427``
> +- "Silent Mode" on models with ``SAM0427``
> +
> +.. _keyboard-backlight:
> +
> +Keyboard backlight
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +A new LED class named ``samsung-galaxybook::kbd_backlight`` is created =
which
> +will then expose the device using the standard sysfs-based LED interfac=
e at
> +``/sys/class/leds/samsung-galaxybook::kbd_backlight``. Brightness can b=
e
> +controlled by writing the desired value to the ``brightness`` sysfs att=
ribute or
> +with any other desired userspace utility.
> +
> +.. note::
> +  Most of these devices have an ambient light sensor which also turns
> +  off the keyboard backlight under well-lit conditions. This behavior d=
oes not
> +  seem possible to control at this time, but can be good to be aware of=
.
> +
> +.. _performance-mode:
> +
> +Performance mode
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This driver implements the
> +Documentation/userspace-api/sysfs-platform_profile.rst interface for wo=
rking
> +with the "performance mode" function of the Samsung ACPI device.
> +
> +Mapping of each Samsung "performance mode" to its respective platform p=
rofile is
> +done dynamically based on a list of the supported modes reported by the=
 device
> +itself. Preference is given to always try and map ``low-power``, ``bala=
nced``,
> +and ``performance`` profiles, as these seem to be the most common profi=
les
> +utilized (and sometimes even required) by various userspace tools.
> +
> +The result of the mapping will be printed in the kernel log when the mo=
dule is
> +loaded. Supported profiles can also be retrieved from
> +``/sys/firmware/acpi/platform_profile_choices``, while
> +``/sys/firmware/acpi/platform_profile`` can be used to read or write th=
e
> +currently selected profile.
> +
> +The ``balanced`` platform profile will be set during module load if no =
profile
> +has been previously set.
> +
> +.. _battery-charge-control-end-threshold:
> +
> +Battery charge control end threshold
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +This platform driver will add the ability to set the battery's charge c=
ontrol
> +end threshold, but does not have the ability to set a start threshold.
> +
> +This feature is typically called "Battery Saver" by the various Samsung
> +applications in Windows, but in Linux we have implemented the standardi=
zed
> +"charge control threshold" sysfs interface on the battery device to all=
ow for
> +controlling this functionality from the userspace.
> +
> +The sysfs attribute
> +``/sys/class/power_supply/BAT1/charge_control_end_threshold`` can be us=
ed to
> +read or set the desired charge end threshold.
> +
> +If you wish to maintain interoperability with Windows, then you should =
set the
> +value to 80 to represent "on", or 100 to represent "off", as these are =
the
> +values currently recognized by the various Windows-based Samsung applic=
ations
> +and services as "on" or "off". Otherwise, the device will accept any va=
lue
> +between 1 and 100 as the percentage that you wish the battery to stop c=
harging
> +at.
> +
> +.. _firmware-attributes:
> +
> +Firmware Attributes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following firmware attributes are set up by this driver and should =
be
> +accessible under
> +``/sys/class/firmware-attributes/samsung-galaxybook/attributes/`` if yo=
ur device
> +supports them:
> +
> +- ``camera_lens_cover``
> +- ``power_on_lid_open``
> +- ``usb_charging``
> +
> +These attributes are documented in more detail under
> +Documentation/admin-guide/abi.rst.
> +
> +.. _keyboard-hotkey-actions:
> +
> +Keyboard hotkey actions (i8042 filter)
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The i8042 filter will swallow the keyboard events for the Fn+F9 hotkey =
(Multi-
> +level keyboard backlight toggle) and Fn+F10 hotkey (Block recording tog=
gle)
> +and instead execute their actions within the driver itself.
> +
> +Fn+F9 will cycle through the brightness levels of the keyboard backligh=
t. A
> +notification will be sent using ``led_classdev_notify_brightness_hw_cha=
nged``
> +so that the userspace can be aware of the change. This mimics the behav=
ior of
> +other existing devices where the brightness level is cycled internally =
by the
> +embedded controller and then reported via a notification.
> +
> +Fn+F10 will toggle the value of the "camera lens cover" setting, which =
blocks
> +or allows usage of the built-in camera and microphone.
> +
> +There is a new "Samsung Galaxy Book Extra Buttons" input device created=
 which
> +will send input events for the following notifications:
> +
> +- Switch ``SW_CAMERA_LENS_COVER`` (on or off) when the camera and micro=
phone are
> +  "blocked" or "allowed" when toggling the Camera Lens Cover setting.
> +
> +.. _acpi-notifications-and-hotkey-actions:
> +
> +ACPI notifications and hotkey actions
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +ACPI notifications will generate ACPI netlink events and can be receive=
d using
> +userspace tools such as ``acpi_listen`` and ``acpid``.
> +
> +The Fn+F11 Performance mode hotkey will be handled by the driver; each =
keypress
> +will cycle to the next available platform profile.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3809931b9240..e74873a1e74b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20733,6 +20733,13 @@ L:	linux-fbdev@vger.kernel.org
>   S:	Maintained
>   F:	drivers/video/fbdev/s3c-fb.c
>
> +SAMSUNG GALAXY BOOK EXTRAS DRIVER
> +M:	Joshua Grisham <josh@joshuagrisham.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/admin-guide/laptops/samsung-galaxybook.rst
> +F:	drivers/platform/x86/samsung-galaxybook.c
> +
>   SAMSUNG INTERCONNECT DRIVERS
>   M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>   M:	Artur =C5=9Awigo=C5=84 <a.swigon@samsung.com>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..ecc509f5df55 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -778,6 +778,24 @@ config BARCO_P50_GPIO
>   	  To compile this driver as a module, choose M here: the module
>   	  will be called barco-p50-gpio.
>
> +config SAMSUNG_GALAXYBOOK
> +	tristate "Samsung Galaxy Book extras driver"
> +	depends on ACPI
> +	depends on ACPI_BATTERY
> +	depends on INPUT
> +	depends on LEDS_CLASS
> +	depends on SERIO_I8042
> +	select ACPI_PLATFORM_PROFILE
> +	select FW_ATTR_CLASS
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This is a driver for Samsung Galaxy Book series notebooks. It adds
> +	  support for the keyboard backlight control, performance mode control=
, fan
> +	  speed reporting, function keys, and various other device controls.
> +
> +	  For more information about this driver, see
> +	  <file:Documentation/admin-guide/laptops/samsung-galaxybook.rst>.
> +
>   config SAMSUNG_LAPTOP
>   	tristate "Samsung Laptop driver"
>   	depends on RFKILL || RFKILL =3D n
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index e1b142947067..32ec4cb9d902 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -95,8 +95,9 @@ obj-$(CONFIG_PCENGINES_APU2)	+=3D pcengines-apuv2.o
>   obj-$(CONFIG_BARCO_P50_GPIO)	+=3D barco-p50-gpio.o
>
>   # Samsung
> -obj-$(CONFIG_SAMSUNG_LAPTOP)	+=3D samsung-laptop.o
> -obj-$(CONFIG_SAMSUNG_Q10)	+=3D samsung-q10.o
> +obj-$(CONFIG_SAMSUNG_GALAXYBOOK)	+=3D samsung-galaxybook.o
> +obj-$(CONFIG_SAMSUNG_LAPTOP)		+=3D samsung-laptop.o
> +obj-$(CONFIG_SAMSUNG_Q10)		+=3D samsung-q10.o
>
>   # Toshiba
>   obj-$(CONFIG_TOSHIBA_BT_RFKILL)	+=3D toshiba_bluetooth.o
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platfor=
m/x86/samsung-galaxybook.c
> new file mode 100644
> index 000000000000..c656471dd1c7
> --- /dev/null
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -0,0 +1,1493 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Samsung Galaxy Book series extras driver
> + *
> + * Copyright (c) 2024 Joshua Grisham <josh@joshuagrisham.com>
> + *
> + * With contributions to the SCAI ACPI device interface:
> + * Copyright (c) 2024 Giulio Girardi <giulio.girardi@protechgroup.it>
> + *
> + * Implementation inspired by existing x86 platform drivers.
> + * Thank you to the authors!
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/err.h>
> +#include <linux/i8042.h>
> +#include <linux/init.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/platform_profile.h>
> +#include <linux/serio.h>
> +#include <linux/sysfs.h>
> +#include <linux/uuid.h>
> +#include <linux/workqueue.h>
> +#include <acpi/battery.h>
> +#include "firmware_attributes_class.h"
> +
> +#define DRIVER_NAME "samsung-galaxybook"
> +
> +static const struct acpi_device_id galaxybook_device_ids[] =3D {
> +	{ "SAM0427" },
> +	{ "SAM0428" },
> +	{ "SAM0429" },
> +	{ "SAM0430" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(acpi, galaxybook_device_ids);

Can you move this device ID table closer to the platform driver?

> +
> +struct samsung_galaxybook {
> +	struct platform_device *platform;
> +	struct acpi_device *acpi;
> +
> +	struct device *fw_attrs_dev;
> +	struct kset *fw_attrs_kset;
> +	struct kobj_attribute power_on_lid_open_attr;
> +	struct kobj_attribute usb_charging_attr;
> +	struct kobj_attribute camera_lens_cover_attr;
> +
> +	bool has_kbd_backlight;
> +	bool has_camera_lens_cover;
> +	bool has_performance_mode;
> +
> +	struct led_classdev kbd_backlight;
> +	/* block out of sync condition in hotkey action if brightness updated =
in another thread */
> +	struct mutex kbd_backlight_lock;
> +	struct work_struct kbd_backlight_hotkey_work;
> +
> +	struct input_dev *input;
> +	/* protect sparse keymap event reporting getting out of sync from mult=
iple threads */
> +	struct mutex input_lock;
> +	void *i8042_filter_ptr;
> +
> +	/* block out of sync condition in hotkey action if value updated in an=
other thread */
> +	struct mutex camera_lens_cover_lock;
> +	struct work_struct camera_lens_cover_hotkey_work;
> +
> +	struct acpi_battery_hook battery_hook;
> +	struct device_attribute charge_control_end_threshold_attr;
> +
> +	u8 profile_performance_modes[PLATFORM_PROFILE_LAST];
> +	struct platform_profile_handler profile_handler;
> +};
> +
> +static struct samsung_galaxybook *galaxybook_ptr;
> +static const struct class *fw_attr_class;
> +
> +struct sawb {
> +	u16 safn;
> +	u16 sasb;
> +	u8 rflg;
> +	union {
> +		struct {
> +			u8 gunm;
> +			u8 guds[250];
> +		} __packed;
> +		struct {
> +			u8 caid[16];
> +			u8 fncn;
> +			u8 subn;
> +			u8 iob0;
> +			u8 iob1;
> +			u8 iob2;
> +			u8 iob3;
> +			u8 iob4;
> +			u8 iob5;
> +			u8 iob6;
> +			u8 iob7;
> +			u8 iob8;
> +			u8 iob9;
> +		} __packed;
> +		struct {
> +			u8 iob_prefix[18];
> +			u8 iob_values[10];
> +		} __packed;
> +	} __packed;
> +} __packed;
> +
> +#define SAWB_LEN_SETTINGS         0x15
> +#define SAWB_LEN_PERFORMANCE_MODE 0x100
> +
> +#define SAFN  0x5843
> +
> +#define SASB_KBD_BACKLIGHT      0x78
> +#define SASB_POWER_MANAGEMENT   0x7a
> +#define SASB_USB_CHARGING_GET   0x67
> +#define SASB_USB_CHARGING_SET   0x68
> +#define SASB_NOTIFICATIONS      0x86
> +#define SASB_CAMERA_LENS_COVER  0x8a
> +#define SASB_PERFORMANCE_MODE   0x91
> +
> +#define SAWB_RFLG_POS  4
> +#define SAWB_GUNM_POS  5
> +
> +#define RFLG_SUCCESS  0xaa
> +#define GUNM_FAIL     0xff
> +
> +#define GUNM_FEATURE_ENABLE          0xbb
> +#define GUNM_FEATURE_ENABLE_SUCCESS  0xdd
> +#define GUDS_FEATURE_ENABLE          0xaa
> +#define GUDS_FEATURE_ENABLE_SUCCESS  0xcc
> +
> +#define GUNM_GET  0x81
> +#define GUNM_SET  0x82
> +
> +#define GUNM_POWER_MANAGEMENT  0x82
> +
> +#define GUNM_USB_CHARGING_GET            0x80
> +#define GUNM_USB_CHARGING_ON             0x81
> +#define GUNM_USB_CHARGING_OFF            0x80
> +#define GUDS_POWER_ON_LID_OPEN           0xa3
> +#define GUDS_POWER_ON_LID_OPEN_GET       0x81
> +#define GUDS_POWER_ON_LID_OPEN_SET       0x80
> +#define GUDS_BATTERY_CHARGE_CONTROL      0xe9
> +#define GUDS_BATTERY_CHARGE_CONTROL_GET  0x91
> +#define GUDS_BATTERY_CHARGE_CONTROL_SET  0x90
> +#define GUNM_ACPI_NOTIFY_ENABLE          0x80
> +#define GUDS_ACPI_NOTIFY_ENABLE          0x02
> +
> +#define GB_CAMERA_LENS_COVER_ON   0x0
> +#define GB_CAMERA_LENS_COVER_OFF  0x1
> +
> +#define FNCN_PERFORMANCE_MODE       0x51
> +#define SUBN_PERFORMANCE_MODE_LIST  0x01
> +#define SUBN_PERFORMANCE_MODE_GET   0x02
> +#define SUBN_PERFORMANCE_MODE_SET   0x03
> +
> +/* guid 8246028d-8bca-4a55-ba0f-6f1e6b921b8f */
> +static const guid_t performance_mode_guid_value =3D
> +	GUID_INIT(0x8246028d, 0x8bca, 0x4a55, 0xba, 0x0f, 0x6f, 0x1e, 0x6b, 0x=
92, 0x1b, 0x8f);
> +#define PERFORMANCE_MODE_GUID performance_mode_guid_value
> +
> +#define PERFORMANCE_MODE_ULTRA               0x16
> +#define PERFORMANCE_MODE_PERFORMANCE         0x15
> +#define PERFORMANCE_MODE_SILENT              0xb
> +#define PERFORMANCE_MODE_QUIET               0xa
> +#define PERFORMANCE_MODE_OPTIMIZED           0x2
> +#define PERFORMANCE_MODE_PERFORMANCE_LEGACY  0x1
> +#define PERFORMANCE_MODE_OPTIMIZED_LEGACY    0x0
> +#define PERFORMANCE_MODE_UNKNOWN             0xff
> +
> +#define DEFAULT_PLATFORM_PROFILE PLATFORM_PROFILE_BALANCED
> +
> +#define ACPI_METHOD_ENABLE            "SDLS"
> +#define ACPI_METHOD_ENABLE_ON         1
> +#define ACPI_METHOD_ENABLE_OFF        0
> +#define ACPI_METHOD_SETTINGS          "CSFI"
> +#define ACPI_METHOD_PERFORMANCE_MODE  "CSXI"
> +
> +#define KBD_BACKLIGHT_MAX_BRIGHTNESS  3
> +
> +#define ACPI_NOTIFY_BATTERY_STATE_CHANGED    0x61
> +#define ACPI_NOTIFY_DEVICE_ON_TABLE          0x6c
> +#define ACPI_NOTIFY_DEVICE_OFF_TABLE         0x6d
> +#define ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE  0x70
> +
> +#define GB_KEY_KBD_BACKLIGHT_KEYDOWN      0x2c
> +#define GB_KEY_KBD_BACKLIGHT_KEYUP        0xac
> +#define GB_KEY_CAMERA_LENS_COVER_KEYDOWN  0x1f
> +#define GB_KEY_CAMERA_LENS_COVER_KEYUP    0x9f
> +#define GB_KEY_BATTERY_NOTIFY_KEYUP       0xf
> +#define GB_KEY_BATTERY_NOTIFY_KEYDOWN     0x8f
> +
> +#define INPUT_CAMERA_LENS_COVER_ON   0x01
> +#define INPUT_CAMERA_LENS_COVER_OFF  0x02
> +
> +static const struct key_entry galaxybook_acpi_keymap[] =3D {
> +	{ KE_SW,  INPUT_CAMERA_LENS_COVER_ON,  { .sw =3D { SW_CAMERA_LENS_COVE=
R, 1 } } },
> +	{ KE_SW,  INPUT_CAMERA_LENS_COVER_OFF, { .sw =3D { SW_CAMERA_LENS_COVE=
R, 0 } } },
> +	{ KE_END, 0 },
> +};
> +
> +/*
> + * ACPI method handling
> + */
> +
> +static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook=
, acpi_string method,
> +				  struct sawb *in_buf, size_t len, struct sawb *out_buf)
> +{
> +	struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +	union acpi_object in_obj, *out_obj;
> +	struct acpi_object_list input;
> +	acpi_status status;
> +	int err;
> +
> +	in_obj.type =3D ACPI_TYPE_BUFFER;
> +	in_obj.buffer.length =3D len;
> +	in_obj.buffer.pointer =3D (u8 *)in_buf;
> +
> +	input.count =3D 1;
> +	input.pointer =3D &in_obj;
> +
> +	status =3D acpi_evaluate_object_typed(galaxybook->acpi->handle, method=
, &input, &output,
> +					    ACPI_TYPE_BUFFER);
> +
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; got %s\=
n",
> +			method, acpi_format_exception(status));
> +		return -EIO;
> +	}
> +
> +	out_obj =3D output.pointer;
> +
> +	if (out_obj->buffer.length !=3D len || out_obj->buffer.length < SAWB_G=
UNM_POS + 1) {
> +		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
> +			"response length mismatch\n", method);
> +		err =3D -EPROTO;
> +		goto out_free;
> +	}
> +	if (out_obj->buffer.pointer[SAWB_RFLG_POS] !=3D RFLG_SUCCESS) {
> +		dev_err(&galaxybook->acpi->dev, "failed to execute method %s; "
> +			"device did not respond with success code 0x%x\n",
> +			method, RFLG_SUCCESS);
> +		err =3D -ENXIO;
> +		goto out_free;
> +	}
> +	if (out_obj->buffer.pointer[SAWB_GUNM_POS] =3D=3D GUNM_FAIL) {
> +		dev_err(&galaxybook->acpi->dev,
> +			"failed to execute method %s; device responded with failure code 0x%=
x\n",
> +			method, GUNM_FAIL);
> +		err =3D -ENXIO;
> +		goto out_free;
> +	}
> +
> +	memcpy(out_buf, out_obj->buffer.pointer, len);
> +	err =3D 0;
> +
> +out_free:
> +	kfree(out_obj);
> +	return err;
> +}
> +
> +static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *ga=
laxybook, const u16 sasb)
> +{
> +	struct sawb buf =3D { 0 };
> +	int err;
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D sasb;
> +	buf.gunm =3D GUNM_FEATURE_ENABLE;
> +	buf.guds[0] =3D GUDS_FEATURE_ENABLE;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	if (buf.gunm !=3D GUNM_FEATURE_ENABLE_SUCCESS && buf.guds[0] !=3D GUDS=
_FEATURE_ENABLE_SUCCESS)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +/*
> + * Keyboard Backlight
> + */
> +
> +static int kbd_backlight_acpi_set(struct samsung_galaxybook *galaxybook=
,
> +				  const enum led_brightness brightness)
> +{
> +	struct sawb buf =3D { 0 };
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_KBD_BACKLIGHT;
> +	buf.gunm =3D GUNM_SET;
> +
> +	buf.guds[0] =3D brightness;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int kbd_backlight_acpi_get(struct samsung_galaxybook *galaxybook=
,
> +				  enum led_brightness *brightness)
> +{
> +	struct sawb buf =3D { 0 };
> +	int err;
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_KBD_BACKLIGHT;
> +	buf.gunm =3D GUNM_GET;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*brightness =3D buf.gunm;
> +
> +	return 0;
> +}
> +
> +static int kbd_backlight_store(struct led_classdev *led,
> +			       const enum led_brightness brightness)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of_const(led, struct samsung_galaxybook, kbd_backlight);
> +
> +	return kbd_backlight_acpi_set(galaxybook, brightness);
> +}
> +
> +static enum led_brightness kbd_backlight_show(struct led_classdev *led)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(led, struct samsung_galaxybook, kbd_backlight);
> +	enum led_brightness brightness;
> +	int err;
> +
> +	err =3D kbd_backlight_acpi_get(galaxybook, &brightness);
> +	if (err)
> +		return err;
> +
> +	return brightness;
> +}
> +
> +static int galaxybook_kbd_backlight_init(struct samsung_galaxybook *gal=
axybook)
> +{
> +	struct led_init_data init_data =3D {};
> +	enum led_brightness brightness;
> +	int err;
> +
> +	err =3D devm_mutex_init(&galaxybook->platform->dev, &galaxybook->kbd_b=
acklight_lock);
> +	if (err)
> +		return err;
> +
> +	err =3D galaxybook_enable_acpi_feature(galaxybook, SASB_KBD_BACKLIGHT)=
;
> +	if (err)
> +		goto return_with_dbg;
> +
> +	/* verify we can read the value, otherwise stop without setting has_kb=
d_backlight */
> +	err =3D kbd_backlight_acpi_get(galaxybook, &brightness);
> +	if (err)
> +		goto return_with_dbg;

Reusing the same debug message for multiple error sources seems useless to=
 me, please user
different debug messages for each error source or remove some debug messag=
es. You can also
print the debug message inside the caller of galaxybook_kbd_backlight_init=
().

> +
> +	init_data.devicename =3D DRIVER_NAME;
> +	init_data.default_label =3D ":" LED_FUNCTION_KBD_BACKLIGHT;
> +	init_data.devname_mandatory =3D true;
> +
> +	galaxybook->kbd_backlight.brightness_get =3D kbd_backlight_show;
> +	galaxybook->kbd_backlight.brightness_set_blocking =3D kbd_backlight_st=
ore;
> +	galaxybook->kbd_backlight.flags =3D LED_BRIGHT_HW_CHANGED;
> +	galaxybook->kbd_backlight.max_brightness =3D KBD_BACKLIGHT_MAX_BRIGHTN=
ESS;
> +
> +	err =3D devm_led_classdev_register_ext(&galaxybook->platform->dev,
> +					     &galaxybook->kbd_backlight, &init_data);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	galaxybook->has_kbd_backlight =3D true;
> +
> +	return 0;
> +
> +return_with_dbg:
> +	dev_dbg(&galaxybook->platform->dev,
> +		"failed to initialize kbd_backlight, error %d\n", err);
> +	return 0;
> +}
> +
> +/*
> + * Platform device attributes (configuration properties which can be co=
ntrolled via userspace)
> + */
> +
> +/* Power on lid open (device should power on when lid is opened) */
> +
> +static int power_on_lid_open_acpi_set(struct samsung_galaxybook *galaxy=
book, const bool value)
> +{
> +	struct sawb buf =3D { 0 };
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_POWER_MANAGEMENT;
> +	buf.gunm =3D GUNM_POWER_MANAGEMENT;
> +	buf.guds[0] =3D GUDS_POWER_ON_LID_OPEN;
> +	buf.guds[1] =3D GUDS_POWER_ON_LID_OPEN_SET;
> +	buf.guds[2] =3D value ? 1 : 0;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int power_on_lid_open_acpi_get(struct samsung_galaxybook *galaxy=
book, bool *value)
> +{
> +	struct sawb buf =3D { 0 };
> +	int err;
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_POWER_MANAGEMENT;
> +	buf.gunm =3D GUNM_POWER_MANAGEMENT;
> +	buf.guds[0] =3D GUDS_POWER_ON_LID_OPEN;
> +	buf.guds[1] =3D GUDS_POWER_ON_LID_OPEN_GET;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*value =3D buf.guds[1];
> +
> +	return 0;
> +}
> +
> +static ssize_t power_on_lid_open_store(struct kobject *kobj, struct kob=
j_attribute *attr,
> +				       const char *buffer, size_t count)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(attr, struct samsung_galaxybook, power_on_lid_open_attr)=
;
> +
> +	bool value;
> +	int err;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	err =3D kstrtobool(buffer, &value);
> +	if (err)
> +		return err;
> +
> +	err =3D power_on_lid_open_acpi_set(galaxybook, value);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t power_on_lid_open_show(struct kobject *kobj, struct kobj=
_attribute *attr,
> +				      char *buffer)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(attr, struct samsung_galaxybook, power_on_lid_open_attr)=
;
> +	bool value;
> +	int err;
> +
> +	err =3D power_on_lid_open_acpi_get(galaxybook, &value);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buffer, "%u\n", value);
> +}
> +
> +/* USB Charging (USB ports can charge other devices even when device is=
 powered off) */
> +
> +static int usb_charging_acpi_set(struct samsung_galaxybook *galaxybook,=
 const bool value)
> +{
> +	struct sawb buf =3D { 0 };
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_USB_CHARGING_SET;
> +	buf.gunm =3D value ? GUNM_USB_CHARGING_ON : GUNM_USB_CHARGING_OFF;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int usb_charging_acpi_get(struct samsung_galaxybook *galaxybook,=
 bool *value)
> +{
> +	struct sawb buf =3D { 0 };
> +	int err;
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_USB_CHARGING_GET;
> +	buf.gunm =3D GUNM_USB_CHARGING_GET;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*value =3D buf.gunm =3D=3D 1;
> +
> +	return 0;
> +}
> +
> +static ssize_t usb_charging_store(struct kobject *kobj, struct kobj_att=
ribute *attr,
> +				  const char *buffer, size_t count)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(attr, struct samsung_galaxybook, usb_charging_attr);
> +	bool value;
> +	int err;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	err =3D kstrtobool(buffer, &value);
> +	if (err)
> +		return err;
> +
> +	err =3D usb_charging_acpi_set(galaxybook, value);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t usb_charging_show(struct kobject *kobj, struct kobj_attr=
ibute *attr, char *buffer)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(attr, struct samsung_galaxybook, usb_charging_attr);
> +	bool value;
> +	int err;
> +
> +	err =3D usb_charging_acpi_get(galaxybook, &value);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buffer, "%u\n", value);

Please use %d here.

> +}
> +
> +/* Camera lens cover (blocks access to camera and microphone) */
> +
> +static int camera_lens_cover_acpi_set(struct samsung_galaxybook *galaxy=
book, const bool value)
> +{
> +	struct sawb buf =3D { 0 };
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_CAMERA_LENS_COVER;
> +	buf.gunm =3D GUNM_SET;
> +	buf.guds[0] =3D value ? GB_CAMERA_LENS_COVER_ON : GB_CAMERA_LENS_COVER=
_OFF;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int camera_lens_cover_acpi_get(struct samsung_galaxybook *galaxy=
book, bool *value)
> +{
> +	struct sawb buf =3D { 0 };
> +	int err;
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_CAMERA_LENS_COVER;
> +	buf.gunm =3D GUNM_GET;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*value =3D buf.gunm =3D=3D GB_CAMERA_LENS_COVER_ON;
> +
> +	return 0;
> +}
> +
> +static ssize_t camera_lens_cover_store(struct kobject *kobj, struct kob=
j_attribute *attr,
> +				       const char *buffer, size_t count)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(attr, struct samsung_galaxybook, camera_lens_cover_attr)=
;
> +	bool value;
> +	int err;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	err =3D kstrtobool(buffer, &value);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&galaxybook->camera_lens_cover_lock);
> +	err =3D camera_lens_cover_acpi_set(galaxybook, value);
> +	mutex_unlock(&galaxybook->camera_lens_cover_lock);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t camera_lens_cover_show(struct kobject *kobj, struct kobj=
_attribute *attr,
> +				      char *buffer)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(attr, struct samsung_galaxybook, camera_lens_cover_attr)=
;
> +	bool value;
> +	int err;
> +
> +	err =3D camera_lens_cover_acpi_get(galaxybook, &value);
> +	if (err)
> +		return err;
> +
> +	return sysfs_emit(buffer, "%u\n", value);
> +}
> +
> +static int galaxybook_camera_lens_cover_init(struct samsung_galaxybook =
*galaxybook)
> +{
> +	int err;
> +
> +	err =3D galaxybook_enable_acpi_feature(galaxybook, SASB_CAMERA_LENS_CO=
VER);
> +	if (err) {
> +		dev_dbg(&galaxybook->platform->dev,
> +			"failed to initialize camera lens cover feature, error %d\n", err);
> +		return 0;
> +	}
> +
> +	err =3D devm_mutex_init(&galaxybook->platform->dev, &galaxybook->camer=
a_lens_cover_lock);
> +	if (err)
> +		return err;
> +
> +	galaxybook->has_camera_lens_cover =3D true;
> +
> +	return 0;
> +}
> +
> +/* Attribute setup */
> +
> +static void galaxybook_power_on_lid_open_attr_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook =3D data;
> +
> +	sysfs_remove_file(&galaxybook->fw_attrs_kset->kobj,
> +			  &galaxybook->power_on_lid_open_attr.attr);
> +}
> +
> +static void galaxybook_usb_charging_attr_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook =3D data;
> +
> +	sysfs_remove_file(&galaxybook->fw_attrs_kset->kobj,
> +			  &galaxybook->usb_charging_attr.attr);
> +}
> +
> +static void galaxybook_camera_lens_cover_attr_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook =3D data;
> +
> +	sysfs_remove_file(&galaxybook->fw_attrs_kset->kobj,
> +			  &galaxybook->camera_lens_cover_attr.attr);
> +}
> +
> +static void galaxybook_fw_attrs_kset_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook =3D data;
> +
> +	kset_unregister(galaxybook->fw_attrs_kset);
> +}
> +
> +static void galaxybook_fw_attr_class_remove(void *data)
> +{
> +	device_destroy(fw_attr_class, MKDEV(0, 0));

Please use device_unregister() instead since multiple devices might share =
the same devt of MKDEV(0, 0).
This would also allow you to remove the global variable "fw_attr_class".

> +	fw_attributes_class_put();
> +}
> +
> +static int galaxybook_fw_attrs_init(struct samsung_galaxybook *galaxybo=
ok)
> +{
> +	bool value;
> +	int err;
> +
> +	err =3D fw_attributes_class_get(&fw_attr_class);
> +	if (err)
> +		return err;
> +
> +	galaxybook->fw_attrs_dev =3D device_create(fw_attr_class, NULL, MKDEV(=
0, 0),
> +						 NULL, "%s", DRIVER_NAME);
> +	if (IS_ERR(galaxybook->fw_attrs_dev)) {
> +		fw_attributes_class_put();
> +		err =3D PTR_ERR(galaxybook->fw_attrs_dev);
> +		return err;
> +	}
> +	err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_fw_attr_class_remove, NULL);
> +	if (err)
> +		return err;
> +
> +	galaxybook->fw_attrs_kset =3D kset_create_and_add("attributes", NULL,
> +							&galaxybook->fw_attrs_dev->kobj);
> +	if (!galaxybook->fw_attrs_kset)
> +		return -ENOMEM;
> +	err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_fw_attrs_kset_remove, galaxybook);
> +	if (err)
> +		return err;
> +
> +	err =3D power_on_lid_open_acpi_get(galaxybook, &value);
> +	if (!err) {
> +		sysfs_attr_init(&galaxybook->power_on_lid_open_attr);
> +		galaxybook->power_on_lid_open_attr.attr.name =3D "power_on_lid_open";
> +		galaxybook->power_on_lid_open_attr.attr.mode =3D 0644;
> +		galaxybook->power_on_lid_open_attr.show =3D power_on_lid_open_show;
> +		galaxybook->power_on_lid_open_attr.store =3D power_on_lid_open_store;
> +		err =3D sysfs_create_file(&galaxybook->fw_attrs_kset->kobj,
> +					&galaxybook->power_on_lid_open_attr.attr);
> +		if (err)
> +			return err;
> +		err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +					       galaxybook_power_on_lid_open_attr_remove,
> +					       galaxybook);
> +		if (err)
> +			return err;
> +	}
> +
> +	err =3D usb_charging_acpi_get(galaxybook, &value);
> +	if (!err) {
> +		sysfs_attr_init(&galaxybook->usb_charging_attr);
> +		galaxybook->usb_charging_attr.attr.name =3D "usb_charging";
> +		galaxybook->usb_charging_attr.attr.mode =3D 0644;
> +		galaxybook->usb_charging_attr.show =3D usb_charging_show;
> +		galaxybook->usb_charging_attr.store =3D usb_charging_store;
> +		err =3D sysfs_create_file(&galaxybook->fw_attrs_kset->kobj,
> +					&galaxybook->usb_charging_attr.attr);
> +		if (err)
> +			return err;
> +		err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +					       galaxybook_usb_charging_attr_remove, galaxybook);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (!galaxybook->has_camera_lens_cover)
> +		return 0;
> +	err =3D camera_lens_cover_acpi_get(galaxybook, &value);
> +	if (err) {
> +		galaxybook->has_camera_lens_cover =3D false;
> +		return 0;
> +	}
> +
> +	sysfs_attr_init(&galaxybook->camera_lens_cover_attr);
> +	galaxybook->camera_lens_cover_attr.attr.name =3D "camera_lens_cover";
> +	galaxybook->camera_lens_cover_attr.attr.mode =3D 0644;
> +	galaxybook->camera_lens_cover_attr.show =3D camera_lens_cover_show;
> +	galaxybook->camera_lens_cover_attr.store =3D camera_lens_cover_store;
> +	err =3D sysfs_create_file(&galaxybook->fw_attrs_kset->kobj,
> +				&galaxybook->camera_lens_cover_attr.attr);
> +	if (err)
> +		return err;
> +	return devm_add_action_or_reset(&galaxybook->platform->dev,
> +					galaxybook_camera_lens_cover_attr_remove, galaxybook);

That is not how the firmware attribute interface is supposed to work. For =
each firmware attribute you need to
create an attribute group (with a unique name of course) with the followin=
g attributes:

- type: should return "enumeration"
- current_value: should return the current value of the firmware attribute
- default_value: should return the default value of the firmware attribute
- display_name: should contain a user friendly description of the firmware=
 attribute
- display_name_language_code: should return "en"
- possible_values: should return "0;1" since this firmware attributes are =
boolean values

You can theoretically use sysfs_create_groups() to add all groups in one g=
o to simplify error handling. Since each
attribute_group specifies a .is_visible callback you can handle the visibi=
lity of each group there.

Those groups then need to be added to the fw_attrs_kset.

Just a small question: is the value of the camera lens cover persistent ac=
ross reboots?

> +}
> +
> +/*
> + * Battery Extension (adds charge_control_end_threshold to the battery =
device)
> + */
> +
> +static int charge_control_end_threshold_acpi_set(struct samsung_galaxyb=
ook *galaxybook, u8 value)
> +{
> +	struct sawb buf =3D { 0 };
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_POWER_MANAGEMENT;
> +	buf.gunm =3D GUNM_POWER_MANAGEMENT;
> +	buf.guds[0] =3D GUDS_BATTERY_CHARGE_CONTROL;
> +	buf.guds[1] =3D GUDS_BATTERY_CHARGE_CONTROL_SET;
> +	buf.guds[2] =3D value;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static int charge_control_end_threshold_acpi_get(struct samsung_galaxyb=
ook *galaxybook, u8 *value)
> +{
> +	struct sawb buf =3D { 0 };
> +	int err;
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_POWER_MANAGEMENT;
> +	buf.gunm =3D GUNM_POWER_MANAGEMENT;
> +	buf.guds[0] =3D GUDS_BATTERY_CHARGE_CONTROL;
> +	buf.guds[1] =3D GUDS_BATTERY_CHARGE_CONTROL_GET;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				     &buf, SAWB_LEN_SETTINGS, &buf);
> +	if (err)
> +		return err;
> +
> +	*value =3D buf.guds[1];
> +
> +	return 0;
> +}
> +
> +static ssize_t charge_control_end_threshold_store(struct device *dev, s=
truct device_attribute *attr,
> +						  const char *buffer, size_t count)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(attr, struct samsung_galaxybook, charge_control_end_thre=
shold_attr);
> +	u8 value;
> +	int err;
> +
> +	if (!count)
> +		return -EINVAL;
> +
> +	err =3D kstrtou8(buffer, 0, &value);
> +	if (err)
> +		return err;
> +
> +	if (value < 1 || value > 100)
> +		return -EINVAL;
> +
> +	/* device stores "no end threshold" as 0 instead of 100; if setting to=
 100, send 0 */
> +	if (value =3D=3D 100)
> +		value =3D 0;
> +
> +	err =3D charge_control_end_threshold_acpi_set(galaxybook, value);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +
> +static ssize_t charge_control_end_threshold_show(struct device *dev, st=
ruct device_attribute *attr,
> +						 char *buffer)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(attr, struct samsung_galaxybook, charge_control_end_thre=
shold_attr);
> +	u8 value;
> +	int err;
> +
> +	err =3D charge_control_end_threshold_acpi_get(galaxybook, &value);
> +	if (err)
> +		return err;
> +
> +	/* device stores "no end threshold" as 0 instead of 100; if device has=
 0, report 100 */
> +	if (value =3D=3D 0)
> +		value =3D 100;
> +
> +	return sysfs_emit(buffer, "%d\n", value);

Please use %u here.

> +}
> +
> +static int galaxybook_battery_add(struct power_supply *battery, struct =
acpi_battery_hook *hook)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(hook, struct samsung_galaxybook, battery_hook);
> +
> +	return device_create_file(&battery->dev, &galaxybook->charge_control_e=
nd_threshold_attr);
> +}
> +
> +static int galaxybook_battery_remove(struct power_supply *battery, stru=
ct acpi_battery_hook *hook)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(hook, struct samsung_galaxybook, battery_hook);
> +
> +	device_remove_file(&battery->dev, &galaxybook->charge_control_end_thre=
shold_attr);
> +	return 0;
> +}
> +
> +static void galaxybook_battery_threshold_init(struct samsung_galaxybook=
 *galaxybook)
> +{
> +	struct acpi_battery_hook *hook;
> +	struct device_attribute *attr;
> +	u8 value;
> +	int err;
> +
> +	err =3D charge_control_end_threshold_acpi_get(galaxybook, &value);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	hook =3D &galaxybook->battery_hook;
> +	hook->add_battery =3D galaxybook_battery_add;
> +	hook->remove_battery =3D galaxybook_battery_remove;
> +	hook->name =3D "Samsung Galaxy Book Battery Extension";
> +
> +	attr =3D &galaxybook->charge_control_end_threshold_attr;
> +	sysfs_attr_init(&attr->attr);
> +	attr->attr.name =3D "charge_control_end_threshold";
> +	attr->attr.mode =3D 0644;
> +	attr->show =3D charge_control_end_threshold_show;
> +	attr->store =3D charge_control_end_threshold_store;
> +
> +	err =3D devm_battery_hook_register(&galaxybook->platform->dev, &galaxy=
book->battery_hook);
> +	if (err)
> +		goto return_with_dbg;

Please return and error here if the battery hook registration fails.

> +
> +	return;
> +
> +return_with_dbg:
> +	dev_dbg(&galaxybook->platform->dev,
> +		"failed to initialize battery charge threshold, error %d\n", err);

Again: using the same error message for multiple error sources makes littl=
e sense.

> +}
> +
> +/*
> + * Platform Profile / Performance mode
> + */
> +
> +static int performance_mode_acpi_set(struct samsung_galaxybook *galaxyb=
ook,
> +				     const u8 performance_mode)
> +{
> +	struct sawb buf =3D { 0 };
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_PERFORMANCE_MODE;
> +	export_guid(buf.caid, &PERFORMANCE_MODE_GUID);
> +	buf.fncn =3D FNCN_PERFORMANCE_MODE;
> +	buf.subn =3D SUBN_PERFORMANCE_MODE_SET;
> +	buf.iob0 =3D performance_mode;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_PERFORMANCE_MODE=
,
> +				      &buf, SAWB_LEN_PERFORMANCE_MODE, &buf);
> +}
> +
> +static int performance_mode_acpi_get(struct samsung_galaxybook *galaxyb=
ook, u8 *performance_mode)
> +{
> +	struct sawb buf =3D { 0 };
> +	int err;
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_PERFORMANCE_MODE;
> +	export_guid(buf.caid, &PERFORMANCE_MODE_GUID);
> +	buf.fncn =3D FNCN_PERFORMANCE_MODE;
> +	buf.subn =3D SUBN_PERFORMANCE_MODE_GET;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, ACPI_METHOD_PERFORMANCE_MOD=
E,
> +				     &buf, SAWB_LEN_PERFORMANCE_MODE, &buf);
> +	if (err)
> +		return err;
> +
> +	*performance_mode =3D buf.iob0;
> +
> +	return 0;
> +}
> +
> +static int get_performance_mode_profile(struct samsung_galaxybook *gala=
xybook,
> +					const u8 performance_mode,
> +					enum platform_profile_option *profile)
> +{
> +	for (int i =3D 0; i < PLATFORM_PROFILE_LAST; i++) {
> +		if (galaxybook->profile_performance_modes[i] =3D=3D performance_mode)=
 {
> +			if (profile)
> +				*profile =3D i;
> +			return 0;
> +		}
> +	}
> +
> +	return -ENODATA;
> +}
> +
> +static int galaxybook_platform_profile_set(struct platform_profile_hand=
ler *pprof,
> +					   enum platform_profile_option profile)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(pprof, struct samsung_galaxybook, profile_handler);
> +
> +	return performance_mode_acpi_set(galaxybook,
> +					 galaxybook->profile_performance_modes[profile]);
> +}
> +
> +static int galaxybook_platform_profile_get(struct platform_profile_hand=
ler *pprof,
> +					   enum platform_profile_option *profile)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(pprof, struct samsung_galaxybook, profile_handler);
> +	u8 performance_mode;
> +	int err;
> +
> +	err =3D performance_mode_acpi_get(galaxybook, &performance_mode);
> +	if (err)
> +		return err;
> +
> +	return get_performance_mode_profile(galaxybook, performance_mode, prof=
ile);
> +}
> +
> +static void galaxybook_profile_exit(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook =3D data;
> +
> +	platform_profile_remove(&galaxybook->profile_handler);
> +}
> +
> +#define IGNORE_PERFORMANCE_MODE_MAPPING  -1
> +
> +static void galaxybook_profile_init(struct samsung_galaxybook *galaxybo=
ok)
> +{
> +	u8 current_performance_mode;
> +	u8 init_performance_mode;
> +	struct sawb buf =3D { 0 };
> +	int mapped_profiles;
> +	int mode_profile;
> +	int err;
> +	int i;
> +
> +	galaxybook->profile_handler.name =3D DRIVER_NAME;
> +	galaxybook->profile_handler.dev =3D &galaxybook->platform->dev;
> +	galaxybook->profile_handler.profile_get =3D galaxybook_platform_profil=
e_get;
> +	galaxybook->profile_handler.profile_set =3D galaxybook_platform_profil=
e_set;
> +
> +	/* fetch supported performance mode values from ACPI method */
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_PERFORMANCE_MODE;
> +	export_guid(buf.caid, &PERFORMANCE_MODE_GUID);
> +	buf.fncn =3D FNCN_PERFORMANCE_MODE;
> +	buf.subn =3D SUBN_PERFORMANCE_MODE_LIST;
> +
> +	err =3D galaxybook_acpi_method(galaxybook, ACPI_METHOD_PERFORMANCE_MOD=
E,
> +				     &buf, SAWB_LEN_PERFORMANCE_MODE, &buf);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	/* set up profile_performance_modes with "unknown" as init value */
> +	for (i =3D 0; i < PLATFORM_PROFILE_LAST; i++)
> +		galaxybook->profile_performance_modes[i] =3D PERFORMANCE_MODE_UNKNOWN=
;
> +
> +	/*
> +	 * Value returned in iob0 will have the number of supported performanc=
e modes.
> +	 * The performance mode values will then be given as a list after this=
 (iob1-iobX).
> +	 * Loop backwards from last value to first value (to handle fallback c=
ases which come with
> +	 * smaller values) and map each supported value to its correct platfor=
m_profile_option.
> +	 */
> +	for (i =3D buf.iob0; i > 0; i--) {
> +		/*
> +		 * Prefer mapping to at least performance, balanced, and low-power pr=
ofiles, as they
> +		 * are the profiles which are typically supported by userspace tools
> +		 * (power-profiles-daemon, etc).
> +		 * - performance =3D "ultra", otherwise "performance"
> +		 * - balanced    =3D "optimized", otherwise "performance" when "ultra=
" is supported
> +		 * - low-power   =3D "silent", otherwise "quiet"
> +		 * Different models support different modes. Additional supported mod=
es will be
> +		 * mapped to profiles that fall in between these 3.
> +		 */

To be honest i would prefer if you remove this overly complicated mapping =
algorithm. I rather suggest that the
userspace utilities in question are updated to handle such situations them=
self (other drivers would also benefit
from this).

I think the following static mappings would make sense:

PERFORMANCE_MODE_ULTRA -> performance
PERFORMANCE_MODE_PERFORMANCE -> balanced-performance
PERFORMANCE_MODE_OPTIMIZED -> balanced
PERFORMANCE_MODE_QUIET -> quiet
PERFORMANCE_MODE_SILENT -> low-power

The legacy performance modes should not override other performance modes, =
i. e. PERFORMANCE_MODE_PERFORMANCE_LEGACY
should not override PERFORMANCE_MODE_PERFORMANCE. However non-legacy perfo=
rmance modes should override legacy
performance modes.

If you can be sure that legacy performance modes are not mixed with non-le=
gacy performance modes then you can omit
the override mechanism.

> +		switch (buf.iob_values[i]) {
> +		case PERFORMANCE_MODE_ULTRA:
> +			/* ultra always maps to performance */
> +			mode_profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +
> +		case PERFORMANCE_MODE_PERFORMANCE:
> +			/* if ultra exists, map performance to balanced-performance */
> +			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_PERFORMAN=
CE] !=3D
> +			    PERFORMANCE_MODE_UNKNOWN)
> +				mode_profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +			else /* otherwise map it to performance instead */
> +				mode_profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +			break;
> +
> +		case PERFORMANCE_MODE_SILENT:
> +			/* silent always maps to low-power */
> +			mode_profile =3D PLATFORM_PROFILE_LOW_POWER;
> +			break;
> +
> +		case PERFORMANCE_MODE_QUIET:
> +			/* if silent exists, map quiet to quiet */
> +			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_LOW_POWER=
] !=3D
> +			    PERFORMANCE_MODE_UNKNOWN)
> +				mode_profile =3D PLATFORM_PROFILE_QUIET;
> +			else /* otherwise map it to low-power for better userspace tool supp=
ort */
> +				mode_profile =3D PLATFORM_PROFILE_LOW_POWER;
> +			break;
> +
> +		case PERFORMANCE_MODE_OPTIMIZED:
> +			/* optimized always maps to balanced */
> +			mode_profile =3D PLATFORM_PROFILE_BALANCED;
> +			break;
> +
> +		case PERFORMANCE_MODE_PERFORMANCE_LEGACY:
> +			/* map to performance if performance is not already supported */
> +			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_PERFORMAN=
CE] =3D=3D
> +			    PERFORMANCE_MODE_UNKNOWN)
> +				mode_profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +			else /* otherwise, ignore */
> +				mode_profile =3D IGNORE_PERFORMANCE_MODE_MAPPING;
> +			break;
> +
> +		case PERFORMANCE_MODE_OPTIMIZED_LEGACY:
> +			/* map to balanced if balanced is not already supported */
> +			if (galaxybook->profile_performance_modes[PLATFORM_PROFILE_BALANCED]=
 =3D=3D
> +			    PERFORMANCE_MODE_UNKNOWN)
> +				mode_profile =3D PLATFORM_PROFILE_BALANCED;
> +			else /* otherwise, ignore */
> +				mode_profile =3D IGNORE_PERFORMANCE_MODE_MAPPING;
> +			break;
> +
> +		default: /* any other value is not supported */
> +			mode_profile =3D IGNORE_PERFORMANCE_MODE_MAPPING;
> +			break;
> +		}
> +
> +		/* if current mode value mapped to a supported platform_profile_optio=
n, set it up */
> +		if (mode_profile !=3D IGNORE_PERFORMANCE_MODE_MAPPING) {
> +			mapped_profiles++;
> +			galaxybook->profile_performance_modes[mode_profile] =3D buf.iob_valu=
es[i];
> +			set_bit(mode_profile, galaxybook->profile_handler.choices);
> +			if (mode_profile =3D=3D DEFAULT_PLATFORM_PROFILE)
> +				init_performance_mode =3D buf.iob_values[i];
> +			dev_dbg(&galaxybook->platform->dev,
> +				"will support platform profile %d (performance mode 0x%x)\n",
> +				mode_profile, buf.iob_values[i]);
> +		} else {
> +			dev_dbg(&galaxybook->platform->dev,
> +				"unmapped performance mode 0x%x will be ignored\n",
> +				buf.iob_values[i]);
> +		}
> +	}
> +
> +	if (mapped_profiles =3D=3D 0) {
> +		err =3D -ENODEV;
> +		goto return_with_dbg;
> +	}
> +
> +	/* now check currently set performance mode; if not supported then set=
 default mode */
> +	err =3D performance_mode_acpi_get(galaxybook, &current_performance_mod=
e);
> +	if (err)
> +		goto return_with_dbg;
> +	err =3D get_performance_mode_profile(galaxybook, current_performance_m=
ode, NULL);
> +	if (err) {
> +		dev_dbg(&galaxybook->platform->dev,
> +			"initial performance mode value is not supported by device; "
> +			"setting to default\n");
> +		err =3D performance_mode_acpi_set(galaxybook, init_performance_mode);
> +		if (err)
> +			goto return_with_dbg;
> +	}
> +
> +	err =3D platform_profile_register(&galaxybook->profile_handler);

Since devm_platform_profile_register() has been added recently i suggest t=
hat you use this instead.

Also failing to register the platform profile should return an error back =
to the caller of this function.

> +	if (err)
> +		goto return_with_dbg;
> +
> +	err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_profile_exit, galaxybook);
> +	if (err)
> +		goto return_with_dbg;
> +
> +	galaxybook->has_performance_mode =3D true;
> +
> +	return;
> +
> +return_with_dbg:
> +	dev_dbg(&galaxybook->platform->dev,
> +		"failed to initialize platform profile, error %d\n", err);

...

> +}
> +
> +/*
> + * Hotkeys and notifications
> + */
> +
> +static void galaxybook_input_notify(struct samsung_galaxybook *galaxybo=
ok, int event)
> +{
> +	if (!galaxybook->input)
> +		return;
> +	mutex_lock(&galaxybook->input_lock);
> +	if (!sparse_keymap_report_event(galaxybook->input, event, 1, true))
> +		dev_warn(&galaxybook->acpi->dev, "unknown input notification event: 0=
x%x\n", event);
> +	mutex_unlock(&galaxybook->input_lock);

Since the only two values are the states of the switch i suggest that you =
use input_report_switch() directly
and omit the sparse keymap.

> +}
> +
> +static int galaxybook_input_init(struct samsung_galaxybook *galaxybook)
> +{
> +	int err;
> +
> +	err =3D devm_mutex_init(&galaxybook->platform->dev, &galaxybook->input=
_lock);
> +	if (err)
> +		return err;
> +
> +	galaxybook->input =3D devm_input_allocate_device(&galaxybook->platform=
->dev);
> +	if (!galaxybook->input)
> +		return -ENOMEM;
> +
> +	galaxybook->input->name =3D "Samsung Galaxy Book Extra Buttons";
> +	galaxybook->input->phys =3D DRIVER_NAME "/input0";
> +	galaxybook->input->id.bustype =3D BUS_HOST;
> +	galaxybook->input->dev.parent =3D &galaxybook->platform->dev;

Please call input_report_switch() with the current value of the camera len=
se cover here to seed
the intial state of the switch. Otherwise the switch might report an incor=
rect position after
initialization.

Since this input device is only used by the camera lense cover i suggest t=
hat you merge both initialization
functions.

> +
> +	err =3D sparse_keymap_setup(galaxybook->input, galaxybook_acpi_keymap,=
 NULL);
> +	if (err)
> +		return err;
> +
> +	return input_register_device(galaxybook->input);
> +}
> +
> +static void galaxybook_kbd_backlight_hotkey_work(struct work_struct *wo=
rk)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(work, struct samsung_galaxybook, kbd_backlight_hotkey_wo=
rk);
> +	int new_brightness;
> +	int err;
> +
> +	guard(mutex)(&galaxybook->kbd_backlight_lock);
> +
> +	if (galaxybook->kbd_backlight.brightness < galaxybook->kbd_backlight.m=
ax_brightness)

Please use led_get_brightness() here.

> +		new_brightness =3D galaxybook->kbd_backlight.brightness + 1;
> +	else
> +		new_brightness =3D 0;
> +
> +	err =3D led_set_brightness_sync(&galaxybook->kbd_backlight, new_bright=
ness);
> +	if (err) {
> +		dev_err(&galaxybook->platform->dev,
> +			"failed to set kbd_backlight brightness, error %d\n", err);
> +		return;
> +	}
> +
> +	led_classdev_notify_brightness_hw_changed(&galaxybook->kbd_backlight, =
new_brightness);
> +}
> +
> +static void galaxybook_camera_lens_cover_hotkey_work(struct work_struct=
 *work)
> +{
> +	struct samsung_galaxybook *galaxybook =3D
> +		container_of(work, struct samsung_galaxybook, camera_lens_cover_hotke=
y_work);
> +	bool value;
> +	int err;
> +
> +	guard(mutex)(&galaxybook->camera_lens_cover_lock);
> +
> +	err =3D camera_lens_cover_acpi_get(galaxybook, &value);
> +	if (err) {
> +		dev_err(&galaxybook->platform->dev,
> +			"failed to get camera_lens_cover, error %d\n", err);
> +		return;
> +	}
> +
> +	err =3D camera_lens_cover_acpi_set(galaxybook, !value);
> +	if (err) {
> +		dev_err(&galaxybook->platform->dev,
> +			"failed to set camera_lens_cover, error %d\n", err);
> +		return;
> +	}
> +
> +	galaxybook_input_notify(galaxybook,
> +				!value ? INPUT_CAMERA_LENS_COVER_ON : INPUT_CAMERA_LENS_COVER_OFF);
> +}
> +
> +static bool galaxybook_i8042_filter(unsigned char data, unsigned char s=
tr, struct serio *port)
> +{
> +	static bool extended;
> +
> +	if (str & I8042_STR_AUXDATA)
> +		return false;
> +
> +	if (data =3D=3D 0xe0) {
> +		extended =3D true;
> +		return true;
> +	} else if (extended) {
> +		extended =3D false;
> +		switch (data) {
> +		case GB_KEY_KBD_BACKLIGHT_KEYDOWN:
> +			return true;
> +		case GB_KEY_KBD_BACKLIGHT_KEYUP:
> +			if (galaxybook_ptr->has_kbd_backlight)
> +				schedule_work(&galaxybook_ptr->kbd_backlight_hotkey_work);
> +			return true;
> +
> +		case GB_KEY_CAMERA_LENS_COVER_KEYDOWN:
> +			return true;
> +		case GB_KEY_CAMERA_LENS_COVER_KEYUP:
> +			if (galaxybook_ptr->has_camera_lens_cover)
> +				schedule_work(&galaxybook_ptr->camera_lens_cover_hotkey_work);
> +			return true;
> +
> +		/* battery notification already sent to battery and ACPI device; igno=
re */
> +		case GB_KEY_BATTERY_NOTIFY_KEYUP:
> +		case GB_KEY_BATTERY_NOTIFY_KEYDOWN:
> +			return true;
> +
> +		default:
> +			/*
> +			 * Report the previously filtered e0 before continuing
> +			 * with the next non-filtered byte.
> +			 */
> +			serio_interrupt(port, 0xe0, 0);
> +			return false;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static void galaxybook_i8042_filter_remove(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook =3D data;
> +
> +	i8042_remove_filter(galaxybook_i8042_filter);
> +	if (galaxybook->has_kbd_backlight)
> +		cancel_work_sync(&galaxybook->kbd_backlight_hotkey_work);
> +	if (galaxybook->has_camera_lens_cover)
> +		cancel_work_sync(&galaxybook->camera_lens_cover_hotkey_work);
> +}
> +
> +static int galaxybook_i8042_filter_install(struct samsung_galaxybook *g=
alaxybook)
> +{
> +	int err;
> +
> +	if (!galaxybook->has_kbd_backlight && !galaxybook->has_camera_lens_cov=
er)
> +		return 0;
> +
> +	if (galaxybook->has_kbd_backlight)
> +		INIT_WORK(&galaxybook->kbd_backlight_hotkey_work,
> +			  galaxybook_kbd_backlight_hotkey_work);
> +
> +	if (galaxybook->has_camera_lens_cover)
> +		INIT_WORK(&galaxybook->camera_lens_cover_hotkey_work,
> +			  galaxybook_camera_lens_cover_hotkey_work);
> +
> +	err =3D i8042_install_filter(galaxybook_i8042_filter);
> +	if (err)
> +		return err;
> +
> +	return devm_add_action_or_reset(&galaxybook->platform->dev,
> +					galaxybook_i8042_filter_remove, galaxybook);
> +}
> +
> +/*
> + * ACPI device setup
> + */
> +
> +static void galaxybook_acpi_notify(acpi_handle handle, u32 event, void =
*data)
> +{
> +	struct samsung_galaxybook *galaxybook =3D data;
> +
> +	switch (event) {
> +	case ACPI_NOTIFY_BATTERY_STATE_CHANGED:
> +	case ACPI_NOTIFY_DEVICE_ON_TABLE:
> +	case ACPI_NOTIFY_DEVICE_OFF_TABLE:
> +		break;
> +	case ACPI_NOTIFY_HOTKEY_PERFORMANCE_MODE:
> +		if (galaxybook->has_performance_mode)
> +			platform_profile_cycle();
> +		break;
> +	default:
> +		dev_warn(&galaxybook->acpi->dev, "unknown ACPI notification event: 0x=
%x\n", event);

Please only use the ACPI device for calling ACPI methods. Everything else =
should use the platform device.

> +	}
> +
> +	acpi_bus_generate_netlink_event(DRIVER_NAME, dev_name(&galaxybook->pla=
tform->dev),
> +					event, 1);
> +}
> +
> +static int galaxybook_enable_acpi_notify(struct samsung_galaxybook *gal=
axybook)
> +{
> +	struct sawb buf =3D { 0 };
> +	int err;
> +
> +	err =3D galaxybook_enable_acpi_feature(galaxybook, SASB_NOTIFICATIONS)=
;
> +	if (err)
> +		return err;
> +
> +	buf.safn =3D SAFN;
> +	buf.sasb =3D SASB_NOTIFICATIONS;
> +	buf.gunm =3D GUNM_ACPI_NOTIFY_ENABLE;
> +	buf.guds[0] =3D GUDS_ACPI_NOTIFY_ENABLE;
> +
> +	return galaxybook_acpi_method(galaxybook, ACPI_METHOD_SETTINGS,
> +				      &buf, SAWB_LEN_SETTINGS, &buf);
> +}
> +
> +static void galaxybook_acpi_remove_notify_handler(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook =3D data;
> +
> +	acpi_remove_notify_handler(galaxybook->acpi->handle, ACPI_ALL_NOTIFY,
> +				   galaxybook_acpi_notify);
> +}
> +
> +static void galaxybook_acpi_disable(void *data)
> +{
> +	struct samsung_galaxybook *galaxybook =3D data;
> +
> +	acpi_execute_simple_method(galaxybook->acpi->handle,
> +				   ACPI_METHOD_ENABLE, ACPI_METHOD_ENABLE_OFF);
> +}
> +
> +static int galaxybook_acpi_init(struct samsung_galaxybook *galaxybook)
> +{
> +	acpi_status status;
> +	int err;
> +
> +	status =3D acpi_execute_simple_method(galaxybook->acpi->handle, ACPI_M=
ETHOD_ENABLE,
> +					    ACPI_METHOD_ENABLE_ON);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +	err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_acpi_disable, galaxybook);
> +	if (err)
> +		return err;
> +
> +	status =3D acpi_install_notify_handler(galaxybook->acpi->handle, ACPI_=
ALL_NOTIFY,
> +					     galaxybook_acpi_notify, galaxybook);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +	err =3D devm_add_action_or_reset(&galaxybook->platform->dev,
> +				       galaxybook_acpi_remove_notify_handler, galaxybook);
> +	if (err)
> +		return err;
> +
> +	err =3D galaxybook_enable_acpi_notify(galaxybook);
> +	if (err)
> +		dev_warn(&galaxybook->platform->dev, "failed to enable ACPI notificat=
ions; "
> +			 "some hotkeys will not be supported\n");
> +
> +	err =3D galaxybook_enable_acpi_feature(galaxybook, SASB_POWER_MANAGEME=
NT);
> +	if (err)
> +		dev_warn(&galaxybook->acpi->dev,
> +			 "failed to initialize ACPI power management features; "
> +			 "many features of this driver will not be available\n");
> +
> +	return 0;
> +}
> +
> +/*
> + * Platform driver
> + */
> +
> +static int galaxybook_probe(struct platform_device *pdev)
> +{
> +	struct acpi_device *adev =3D ACPI_COMPANION(&pdev->dev);
> +	struct samsung_galaxybook *galaxybook;
> +	int err;
> +
> +	if (!adev)
> +		return -ENODEV;
> +
> +	galaxybook =3D devm_kzalloc(&pdev->dev, sizeof(*galaxybook), GFP_KERNE=
L);
> +	if (!galaxybook)
> +		return -ENOMEM;
> +
> +	/* set static pointer here so it can be used in i8042 filter */
> +	if (galaxybook_ptr)
> +		return -EBUSY;
> +	galaxybook_ptr =3D galaxybook;
> +
> +	galaxybook->platform =3D pdev;
> +	galaxybook->acpi =3D adev;
> +
> +	dev_set_drvdata(&galaxybook->platform->dev, galaxybook);
> +
> +	err =3D galaxybook_input_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->platform->dev, err,
> +				     "failed to initialize input device\n");
> +
> +	err =3D galaxybook_acpi_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->acpi->dev, err,
> +				     "failed to initialize ACPI device\n");
> +
> +	galaxybook_profile_init(galaxybook);
> +	galaxybook_battery_threshold_init(galaxybook);
> +
> +	err =3D galaxybook_camera_lens_cover_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->acpi->dev, err,
> +				     "failed to initialize camera_lens_cover\n");
> +
> +	err =3D galaxybook_kbd_backlight_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->acpi->dev, err,
> +				     "failed to initialize kbd_backlight\n");
> +
> +	err =3D galaxybook_fw_attrs_init(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->platform->dev, err,
> +				     "failed to initialize firmware-attributes\n");
> +
> +	err =3D galaxybook_i8042_filter_install(galaxybook);
> +	if (err)
> +		return dev_err_probe(&galaxybook->platform->dev, err,
> +				     "failed to initialize i8042_filter\n");
> +
> +	return 0;
> +}
> +
> +static void galaxybook_remove(struct platform_device *pdev)
> +{
> +	if (galaxybook_ptr)
> +		galaxybook_ptr =3D NULL;

As already being said, this will cause issues with the i8042 filter. I sug=
gest you move the whole galaxybook_ptr
handling inside galaxybook_i8042_filter_install()/_remove().

All things considered the driver looks quite good, hoping for a v5 revisio=
n in the future :).

Thanks,
Armin Wolf

> +}
> +
> +static struct platform_driver galaxybook_platform_driver =3D {
> +	.driver =3D {
> +		.name =3D DRIVER_NAME,
> +		.acpi_match_table =3D galaxybook_device_ids,
> +	},
> +	.probe =3D galaxybook_probe,
> +	.remove =3D galaxybook_remove,
> +};
> +module_platform_driver(galaxybook_platform_driver);
> +
> +MODULE_AUTHOR("Joshua Grisham <josh@joshuagrisham.com>");
> +MODULE_DESCRIPTION("Samsung Galaxy Book Extras");
> +MODULE_LICENSE("GPL");
