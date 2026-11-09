Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226929;
	b=z6hSLuKNWgLW0iCDBlWXUSi/tL08i4Yk3okjwYlyD9ZEjrzxcBSdWQocvyji+ZyM7tXa
	 WSRWSoTJ+jXjK1rXPqHRBN/MsOyOHKdM8jNa7upc0sHsOlpd1MyOcD6EMApel98KImQGF
	 cOTdEOlky2MfphUJrFTb/Ydh3+kDXNZlie/CeOEhky3vxNmTlklekPstQTRzEbWJc4V3L
	 TdxRFsqo9VMRQFSeS047jWA3pQFgrZ8SDStCAA+RTZ54SZYmhOZzJKsFmm6s5ft+uT0gH
	 aYgPYN8c3BqdEn5KYDg3TsA9qq3c3edH6WC30GwRqONmZMjJJPMEx3FxiVfaT3/0wFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226929;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 Content-ID;
	bh=sqGRNF3uTDzNFbM3MoDd6aGVsM7tSBm08PfXO6cpr7M=;
	b=mqFn9R6jMHDzprSQB6aE1EychC7BLDT+ICx//MjldYdhgvj4z2FNo/A77IAaPJ/+L1bU
	 T2BpUkoUSVUXk0qQuxf0KIz7Cx/tzAT2erzNxUB6R50wFzWtYeeZZ7w8RjkRROmSYOuWB
	 Xu43gd8EPT6QDEN5jb+eKI5QYtGAFLe5t6kRze+dPnvwk+cJqrPB8eFg7OAm7QdEB/uI+
	 mHfZJUdiEy65EBIe/xnP2s8l4NoXq8c3d3a+xlt4aXoBli09W6oBvy6PDHu4kABtGudkp
	 aUjiIdf2GrVeet99q/5InWdZEhEQ9+6ooxMOec16E5oR7tqO+ZEHSfwMPgg2vHLYhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="V4Xh7/iE";
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA52606D82A;
	Mon,  9 Nov 2026 12:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA52606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V4Xh7/iE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794226929; x=1825762929;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=pBz91DWngGXtmsvxGZf87PT+6ESY9m/SeCUnwD0fgW0=;
  b=V4Xh7/iELECi+U7qI+hXeApyeWNKTQb6o/HtXm3L9ZxlQunKhG1Gb3Uy
   9yXvYzMA+mNGZCcKrQRTiPp8XqYJukj12Ph7R2/VyvW67f8OJ7txxAZwT
   N/nAdb5DB6TIQQEpcLUzprn6ksxXmY+JLdXwuaCpCy5n81vmFr01fgYsS
   +C7up1tF9bLZ02aul9sLr9DaZ2l8+c+NqYTaFeiwvB1f7AcT9Tor/Sl7m
   HdmliPEl98BzD6EDLn6vngBcDDGhtqqQS6g00bVuDkdEI/CtmffUcatUD
   uttIhnw2n/CHmsgUttJ1oeXxnEMCr+5r+99E9x+gtk0sHgTJe5MmHDRau
   Q==;
X-CSE-ConnectionGUID: 9Y3VnOptR9uVLqR+sYD6gw==
X-CSE-MsgGUID: w+AmU7nvQFGThjXaIRLFJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2846055"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2846055"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:22:08 -0800
X-CSE-ConnectionGUID: cM7kDz8cSeyPGA/DZJPXrg==
X-CSE-MsgGUID: 7jq+lvnBTnq8UOqZ7FddKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8430101"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.139])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:22:02 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Nov 2026 14:21:59 +0200 (EET)
To: chipang_kao <prozac2734@gmail.com>
cc: W_Armin@gmx.de, corentin.chary@gmail.com, denis.benato@linux.dev, 
    Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
    luke@ljones.dev, platform-driver-x86@vger.kernel.org, 
    scardracs@disroot.org, chipang_kao <chipang_kao@asus.com>
Subject: Re: [PATCH v4] platform/asus: Move ASUS platform drivers out of
 drivers/platform/x86
In-Reply-To: <20261106033553.12411-1-chipang_kao@asus.com>
Message-ID: <23828a34-3d65-c123-f7c3-7c24ac636dfb@linux.intel.com>
References: <4c78b25c-0873-d6a9-2672-67eacff3c29a@linux.intel.com> <20261106033553.12411-1-chipang_kao@asus.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1382457609-1794226777=:1181"
Content-ID: <99c16e73-9471-eb4c-946e-d6c8ab3b89ce@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1382457609-1794226777=:1181
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <324c4a57-f8ad-c4f3-0234-fcad3703b4d0@linux.intel.com>

On Fri, 6 Nov 2026, chipang_kao wrote:

> ASUS WMI and related platform drivers currently reside under
> drivers/platform/x86/. However, with the emergence of ARM64 devices
> utilizing ACPI WMI interfaces, maintaining these drivers exclusively
> under x86 creates unnecessary architectural restrictions and Kconfig
> duplications.
>=20
> To allow non-x86 architectures (such as ARM64) to select and build
> the applicable ASUS platform drivers:
> 1. Relocate all ASUS platform drivers and headers from
>    drivers/platform/x86/ to drivers/platform/asus/.
> 2. Create dedicated Kconfig and Makefile under drivers/platform/asus/.
> 3. Update drivers/platform/x86/Kconfig to remove duplicated entries.
>=20
> Signed-off-by: chipang_kao <chipang_kao@asus.com>

Hi,

Thanks but please use your real name to sign off the patches. I'm quite=20
sure you don't sign any contracts, etc. with an underscore in your
name. ;-)

Basically, use the name you'd use to sign contract, etc. for Signed-off-by=
=20
tags too. Also non-ascii characters are perfectly fine if you prefer using=
=20
them for signing off as long as the email encoding is properly set so the=
=20
tools can reproduce the name correctly.

To understand what signing off a patch means, check=20
Documentation/process/submitting-patches.rst .

It would also be preferrable for From and Signed-off-by identities match,=
=20
if you want to have the patch discussions into some other address besides=
=20
the one used in SoB, you can always use Cc tag for those addresses.

If you're sending from a different address than SoB uses, you can add=20
extra From: into the start of the body so the tools will pick that from=20
there instead of the email's From.

--
 i.

> ---
> Changes in v4:
> - Move all ASUS platform drivers and headers from
>   drivers/platform/x86/ to drivers/platform/asus/.
> - Add a dedicated Kconfig and Makefile under drivers/platform/asus/.
> - Keep x86-specific drivers under the X86_PLATFORM_DEVICES
>   dependency.
> - Move ASUS_WMI, ASUS_NB_WMI, and ASUS_ARMOURY outside the
>   X86_PLATFORM_DEVICES dependency to allow them to be selected on
>   non-x86 architectures such as ARM64.
> - Update drivers/platform/Kconfig, drivers/platform/Makefile, and
>   MAINTAINERS for the new location.
>=20
>  MAINTAINERS                                   |   8 +-
>  drivers/platform/Kconfig                      |   2 +
>  drivers/platform/Makefile                     |   1 +
>  drivers/platform/asus/Kconfig                 | 163 ++++++++++++++++++
>  drivers/platform/asus/Makefile                |  15 ++
>  drivers/platform/{x86 =3D> asus}/asus-armoury.c |   0
>  drivers/platform/{x86 =3D> asus}/asus-armoury.h |   0
>  drivers/platform/{x86 =3D> asus}/asus-laptop.c  |   0
>  drivers/platform/{x86 =3D> asus}/asus-nb-wmi.c  |   0
>  .../platform/{x86 =3D> asus}/asus-tf103c-dock.c |   0
>  .../platform/{x86 =3D> asus}/asus-wireless.c    |   0
>  drivers/platform/{x86 =3D> asus}/asus-wmi.c     |   0
>  drivers/platform/{x86 =3D> asus}/asus-wmi.h     |   0
>  drivers/platform/{x86 =3D> asus}/eeepc-laptop.c |   0
>  drivers/platform/{x86 =3D> asus}/eeepc-wmi.c    |   0
>  drivers/platform/x86/Kconfig                  | 152 ----------------
>  drivers/platform/x86/Makefile                 |  10 --
>  17 files changed, 185 insertions(+), 166 deletions(-)
>  create mode 100644 drivers/platform/asus/Kconfig
>  create mode 100644 drivers/platform/asus/Makefile
>  rename drivers/platform/{x86 =3D> asus}/asus-armoury.c (100%)
>  rename drivers/platform/{x86 =3D> asus}/asus-armoury.h (100%)
>  rename drivers/platform/{x86 =3D> asus}/asus-laptop.c (100%)
>  rename drivers/platform/{x86 =3D> asus}/asus-nb-wmi.c (100%)
>  rename drivers/platform/{x86 =3D> asus}/asus-tf103c-dock.c (100%)
>  rename drivers/platform/{x86 =3D> asus}/asus-wireless.c (100%)
>  rename drivers/platform/{x86 =3D> asus}/asus-wmi.c (100%)
>  rename drivers/platform/{x86 =3D> asus}/asus-wmi.h (100%)
>  rename drivers/platform/{x86 =3D> asus}/eeepc-laptop.c (100%)
>  rename drivers/platform/{x86 =3D> asus}/eeepc-wmi.c (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..832d2528be10 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4226,15 +4226,15 @@ M:=09Denis Benato <denis.benato@linux.dev>
>  L:=09platform-driver-x86@vger.kernel.org
>  S:=09Maintained
>  W:=09https://asus-linux.org/
> -F:=09drivers/platform/x86/asus*.c
> -F:=09drivers/platform/x86/eeepc*.c
> +F:=09drivers/platform/asus/asus*.c
> +F:=09drivers/platform/asus/eeepc*.c
> =20
>  ASUS TF103C DOCK DRIVER
>  M:=09Hans de Goede <hansg@kernel.org>
>  L:=09platform-driver-x86@vger.kernel.org
>  S:=09Maintained
>  T:=09git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-dr=
ivers-x86.git
> -F:=09drivers/platform/x86/asus-tf103c-dock.c
> +F:=09drivers/platform/asus/asus-tf103c-dock.c
> =20
>  ASUS ROG RYUJIN AIO HARDWARE MONITOR DRIVER
>  M:=09Aleksa Savic <savicaleksa83@gmail.com>
> @@ -4246,7 +4246,7 @@ ASUS WIRELESS RADIO CONTROL DRIVER
>  M:=09Jo=E3o Paulo Rechi Vita <jprvita@gmail.com>
>  L:=09platform-driver-x86@vger.kernel.org
>  S:=09Maintained
> -F:=09drivers/platform/x86/asus-wireless.c
> +F:=09drivers/platform/asus/asus-wireless.c
> =20
>  ASUS WMI HARDWARE MONITOR DRIVER
>  M:=09Ed Brindley <kernel@maidavale.org>
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index 312788f249c9..aa004b0e4406 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -22,3 +22,5 @@ source "drivers/platform/arm64/Kconfig"
>  source "drivers/platform/raspberrypi/Kconfig"
> =20
>  source "drivers/platform/wmi/Kconfig"
> +
> +source "drivers/platform/asus/Kconfig"
> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> index fa322e7f8716..34e694e6da14 100644
> --- a/drivers/platform/Makefile
> +++ b/drivers/platform/Makefile
> @@ -15,3 +15,4 @@ obj-$(CONFIG_SURFACE_PLATFORMS)=09+=3D surface/
>  obj-$(CONFIG_ARM64_PLATFORM_DEVICES)=09+=3D arm64/
>  obj-$(CONFIG_BCM2835_VCHIQ)=09+=3D raspberrypi/
>  obj-$(CONFIG_ACPI_WMI)=09=09+=3D wmi/
> +obj-y=09=09=09=09+=3D asus/
> diff --git a/drivers/platform/asus/Kconfig b/drivers/platform/asus/Kconfi=
g
> new file mode 100644
> index 000000000000..984f25ee84f5
> --- /dev/null
> +++ b/drivers/platform/asus/Kconfig
> @@ -0,0 +1,163 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Asus Platform Specific Drivers
> +#
> +
> +if X86_PLATFORM_DEVICES
> +
> +config ASUS_LAPTOP
> +=09tristate "Asus Laptop Extras"
> +=09depends on ACPI
> +=09select LEDS_CLASS
> +=09select NEW_LEDS
> +=09depends on BACKLIGHT_CLASS_DEVICE
> +=09depends on INPUT
> +=09depends on RFKILL || RFKILL =3D n
> +=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> +=09select INPUT_SPARSEKMAP
> +=09help
> +=09  This is a driver for Asus laptops, Lenovo SL and the Pegatron
> +=09  Lucid tablet. It may also support some MEDION, JVC or VICTOR
> +=09  laptops. It makes all the extra buttons generate standard
> +=09  ACPI events and input events, and on the Lucid the built-in
> +=09  accelerometer appears as an input device.  It also adds
> +=09  support for video output switching, LCD backlight control,
> +=09  Bluetooth and Wlan control, and most importantly, allows you
> +=09  to blink those fancy LEDs.
> +
> +=09  For more information see <http://acpi4asus.sf.net>.
> +
> +=09  If you have an ACPI-compatible ASUS laptop, say Y or M here.
> +
> +config ASUS_WIRELESS
> +=09tristate "Asus Wireless Radio Control Driver"
> +=09depends on ACPI
> +=09depends on INPUT
> +=09select NEW_LEDS
> +=09select LEDS_CLASS
> +=09help
> +=09  The Asus Wireless Radio Control handles the airplane mode hotkey
> +=09  present on some Asus laptops.
> +
> +=09  Say Y or M here if you have an ASUS notebook with an airplane mode
> +=09  hotkey.
> +
> +=09  If you choose to compile this driver as a module the module will be
> +=09  called asus-wireless.
> +
> +config ASUS_TF103C_DOCK
> +=09tristate "Asus TF103C 2-in-1 keyboard dock"
> +=09depends on ACPI
> +=09depends on I2C
> +=09depends on INPUT
> +=09depends on HID
> +=09depends on GPIOLIB
> +=09help
> +=09  This is a driver for the keyboard, touchpad and USB port of the
> +=09  keyboard dock for the Asus TF103C 2-in-1 tablet.
> +
> +=09  This keyboard dock has its own I2C attached embedded controller
> +=09  and the keyboard and touchpad are also connected over I2C,
> +=09  instead of using the usual USB connection. This means that the
> +=09  keyboard dock requires this special driver to function.
> +
> +=09  If you have an Asus TF103C tablet say Y or M here, for a generic x8=
6
> +=09  distro config say M here.
> +
> +config EEEPC_WMI
> +=09tristate "Eee PC WMI Driver"
> +=09depends on ASUS_WMI
> +=09help
> +=09  This is a driver for newer Eee PC laptops. It adds extra features
> +=09  like wireless radio and bluetooth control, leds, hotkeys, backlight=
=2E..
> +
> +=09  For more information, see
> +=09  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
> +
> +=09  If you have an ACPI-WMI compatible Eee PC laptop (>=3D 1000), say Y=
 or M
> +=09  here.
> +
> +config EEEPC_LAPTOP
> +=09tristate "Eee PC Hotkey Driver"
> +=09depends on ACPI_EC
> +=09depends on INPUT
> +=09depends on RFKILL || RFKILL =3D n
> +=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> +=09depends on HOTPLUG_PCI
> +=09depends on BACKLIGHT_CLASS_DEVICE
> +=09select HWMON
> +=09select LEDS_CLASS
> +=09select NEW_LEDS
> +=09select INPUT_SPARSEKMAP
> +=09help
> +=09  This driver supports the Fn-Fx keys on Eee PC laptops.
> +
> +=09  It  also gives access to some extra laptop functionalities like
> +=09  Bluetooth, backlight and allows powering on/off some other
> +=09  devices.
> +
> +=09  If you have an Eee PC laptop, say Y or M here. If this driver
> +=09  doesn't work on your Eee PC, try eeepc-wmi instead.
> +
> +endif # X86_PLATFORM_DEVICES
> +
> +config ASUS_ARMOURY
> +=09tristate "ASUS Armoury driver"
> +=09depends on ASUS_WMI
> +=09select FW_ATTR_CLASS
> +=09help
> +=09  Say Y here if you have a WMI aware Asus machine and would like to u=
se the
> +=09  firmware_attributes API to control various settings typically expos=
ed in
> +=09  the ASUS Armoury Crate application available on Windows.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called asus-armoury.
> +
> +config ASUS_WMI
> +=09tristate "ASUS WMI Driver"
> +=09depends on ACPI_WMI
> +=09depends on ACPI_BATTERY
> +=09depends on INPUT
> +=09depends on HWMON
> +=09depends on BACKLIGHT_CLASS_DEVICE
> +=09depends on RFKILL || RFKILL =3D n
> +=09depends on HOTPLUG_PCI
> +=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> +=09depends on SERIO_I8042 || SERIO_I8042 =3D n
> +=09select INPUT_SPARSEKMAP
> +=09select LEDS_CLASS
> +=09select NEW_LEDS
> +=09select ACPI_PLATFORM_PROFILE
> +=09help
> +=09  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
> +=09  Asus Notebooks).
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called asus-wmi.
> +
> +config ASUS_WMI_DEPRECATED_ATTRS
> +=09bool "BIOS option support in WMI platform (DEPRECATED)"
> +=09depends on ASUS_WMI
> +=09default y
> +=09help
> +=09  Say Y to expose the configurable BIOS options through the asus-wmi
> +=09  driver.
> +
> +=09  This can be used with or without the asus-armoury driver which
> +=09  has the same attributes, but more, and better features.
> +
> +config ASUS_NB_WMI
> +=09tristate "Asus Notebook WMI Driver"
> +=09depends on ASUS_WMI
> +=09help
> +=09  This is a driver for newer Asus notebooks. It adds extra features
> +=09  like wireless radio and bluetooth control, leds, hotkeys, backlight=
=2E..
> +
> +=09  For more information, see
> +=09  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
> +
> +=09  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
> +=09  here.
> +
> +
> +
> diff --git a/drivers/platform/asus/Makefile b/drivers/platform/asus/Makef=
ile
> new file mode 100644
> index 000000000000..d3b5c4fc2ca6
> --- /dev/null
> +++ b/drivers/platform/asus/Makefile
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/asus
> +# Asus Platform-Specific Drivers
> +#
> +
> +obj-$(CONFIG_ASUS_LAPTOP)=09+=3D asus-laptop.o
> +obj-$(CONFIG_ASUS_WIRELESS)=09+=3D asus-wireless.o
> +obj-$(CONFIG_ASUS_ARMOURY)=09+=3D asus-armoury.o
> +obj-$(CONFIG_ASUS_WMI)=09=09+=3D asus-wmi.o
> +obj-$(CONFIG_ASUS_NB_WMI)=09+=3D asus-nb-wmi.o
> +obj-$(CONFIG_ASUS_TF103C_DOCK)=09+=3D asus-tf103c-dock.o
> +obj-$(CONFIG_EEEPC_LAPTOP)=09+=3D eeepc-laptop.o
> +obj-$(CONFIG_EEEPC_WMI)=09=09+=3D eeepc-wmi.o
> +
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/asus/=
asus-armoury.c
> similarity index 100%
> rename from drivers/platform/x86/asus-armoury.c
> rename to drivers/platform/asus/asus-armoury.c
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/asus/=
asus-armoury.h
> similarity index 100%
> rename from drivers/platform/x86/asus-armoury.h
> rename to drivers/platform/asus/asus-armoury.h
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/asus/a=
sus-laptop.c
> similarity index 100%
> rename from drivers/platform/x86/asus-laptop.c
> rename to drivers/platform/asus/asus-laptop.c
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/asus/a=
sus-nb-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/asus-nb-wmi.c
> rename to drivers/platform/asus/asus-nb-wmi.c
> diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/a=
sus/asus-tf103c-dock.c
> similarity index 100%
> rename from drivers/platform/x86/asus-tf103c-dock.c
> rename to drivers/platform/asus/asus-tf103c-dock.c
> diff --git a/drivers/platform/x86/asus-wireless.c b/drivers/platform/asus=
/asus-wireless.c
> similarity index 100%
> rename from drivers/platform/x86/asus-wireless.c
> rename to drivers/platform/asus/asus-wireless.c
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/asus/asus=
-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/asus-wmi.c
> rename to drivers/platform/asus/asus-wmi.c
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/asus/asus=
-wmi.h
> similarity index 100%
> rename from drivers/platform/x86/asus-wmi.h
> rename to drivers/platform/asus/asus-wmi.h
> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/asus/=
eeepc-laptop.c
> similarity index 100%
> rename from drivers/platform/x86/eeepc-laptop.c
> rename to drivers/platform/asus/eeepc-laptop.c
> diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/asus/eee=
pc-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/eeepc-wmi.c
> rename to drivers/platform/asus/eeepc-wmi.c
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9ce384e0475e..b2c6cc923694 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -213,123 +213,6 @@ config APPLE_GMUX
>  =09  graphics as well as the backlight. Currently only backlight
>  =09  control is supported by the driver.
> =20
> -config ASUS_LAPTOP
> -=09tristate "Asus Laptop Extras"
> -=09depends on ACPI
> -=09select LEDS_CLASS
> -=09select NEW_LEDS
> -=09depends on BACKLIGHT_CLASS_DEVICE
> -=09depends on INPUT
> -=09depends on RFKILL || RFKILL =3D n
> -=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> -=09select INPUT_SPARSEKMAP
> -=09help
> -=09  This is a driver for Asus laptops, Lenovo SL and the Pegatron
> -=09  Lucid tablet. It may also support some MEDION, JVC or VICTOR
> -=09  laptops. It makes all the extra buttons generate standard
> -=09  ACPI events and input events, and on the Lucid the built-in
> -=09  accelerometer appears as an input device.  It also adds
> -=09  support for video output switching, LCD backlight control,
> -=09  Bluetooth and Wlan control, and most importantly, allows you
> -=09  to blink those fancy LEDs.
> -
> -=09  For more information see <http://acpi4asus.sf.net>.
> -
> -=09  If you have an ACPI-compatible ASUS laptop, say Y or M here.
> -
> -config ASUS_WIRELESS
> -=09tristate "Asus Wireless Radio Control Driver"
> -=09depends on ACPI
> -=09depends on INPUT
> -=09select NEW_LEDS
> -=09select LEDS_CLASS
> -=09help
> -=09  The Asus Wireless Radio Control handles the airplane mode hotkey
> -=09  present on some Asus laptops.
> -
> -=09  Say Y or M here if you have an ASUS notebook with an airplane mode
> -=09  hotkey.
> -
> -=09  If you choose to compile this driver as a module the module will be
> -=09  called asus-wireless.
> -
> -config ASUS_ARMOURY
> -=09tristate "ASUS Armoury driver"
> -=09depends on ASUS_WMI
> -=09select FW_ATTR_CLASS
> -=09help
> -=09  Say Y here if you have a WMI aware Asus machine and would like to u=
se the
> -=09  firmware_attributes API to control various settings typically expos=
ed in
> -=09  the ASUS Armoury Crate application available on Windows.
> -
> -=09  To compile this driver as a module, choose M here: the module will
> -=09  be called asus-armoury.
> -
> -config ASUS_WMI
> -=09tristate "ASUS WMI Driver"
> -=09depends on ACPI_WMI
> -=09depends on ACPI_BATTERY
> -=09depends on INPUT
> -=09depends on HWMON
> -=09depends on BACKLIGHT_CLASS_DEVICE
> -=09depends on RFKILL || RFKILL =3D n
> -=09depends on HOTPLUG_PCI
> -=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> -=09depends on SERIO_I8042 || SERIO_I8042 =3D n
> -=09select INPUT_SPARSEKMAP
> -=09select LEDS_CLASS
> -=09select NEW_LEDS
> -=09select ACPI_PLATFORM_PROFILE
> -=09help
> -=09  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
> -=09  Asus Notebooks).
> -
> -=09  To compile this driver as a module, choose M here: the module will
> -=09  be called asus-wmi.
> -
> -config ASUS_WMI_DEPRECATED_ATTRS
> -=09bool "BIOS option support in WMI platform (DEPRECATED)"
> -=09depends on ASUS_WMI
> -=09default y
> -=09help
> -=09  Say Y to expose the configurable BIOS options through the asus-wmi
> -=09  driver.
> -
> -=09  This can be used with or without the asus-armoury driver which
> -=09  has the same attributes, but more, and better features.
> -
> -config ASUS_NB_WMI
> -=09tristate "Asus Notebook WMI Driver"
> -=09depends on ASUS_WMI
> -=09help
> -=09  This is a driver for newer Asus notebooks. It adds extra features
> -=09  like wireless radio and bluetooth control, leds, hotkeys, backlight=
=2E..
> -
> -=09  For more information, see
> -=09  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
> -
> -=09  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
> -=09  here.
> -
> -config ASUS_TF103C_DOCK
> -=09tristate "Asus TF103C 2-in-1 keyboard dock"
> -=09depends on ACPI
> -=09depends on I2C
> -=09depends on INPUT
> -=09depends on HID
> -=09depends on GPIOLIB
> -=09help
> -=09  This is a driver for the keyboard, touchpad and USB port of the
> -=09  keyboard dock for the Asus TF103C 2-in-1 tablet.
> -
> -=09  This keyboard dock has its own I2C attached embedded controller
> -=09  and the keyboard and touchpad are also connected over I2C,
> -=09  instead of using the usual USB connection. This means that the
> -=09  keyboard dock requires this special driver to function.
> -
> -=09  If you have an Asus TF103C tablet say Y or M here, for a generic x8=
6
> -=09  distro config say M here.
> -
>  config AYANEO_EC
>  =09tristate "Ayaneo EC platform control"
>  =09depends on DMI
> @@ -357,41 +240,6 @@ config MERAKI_MX100
>  =09  To compile this driver as a module, choose M here: the module
>  =09  will be called meraki-mx100.
> =20
> -config EEEPC_LAPTOP
> -=09tristate "Eee PC Hotkey Driver"
> -=09depends on ACPI_EC
> -=09depends on INPUT
> -=09depends on RFKILL || RFKILL =3D n
> -=09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> -=09depends on HOTPLUG_PCI
> -=09depends on BACKLIGHT_CLASS_DEVICE
> -=09select HWMON
> -=09select LEDS_CLASS
> -=09select NEW_LEDS
> -=09select INPUT_SPARSEKMAP
> -=09help
> -=09  This driver supports the Fn-Fx keys on Eee PC laptops.
> -
> -=09  It  also gives access to some extra laptop functionalities like
> -=09  Bluetooth, backlight and allows powering on/off some other
> -=09  devices.
> -
> -=09  If you have an Eee PC laptop, say Y or M here. If this driver
> -=09  doesn't work on your Eee PC, try eeepc-wmi instead.
> -
> -config EEEPC_WMI
> -=09tristate "Eee PC WMI Driver"
> -=09depends on ASUS_WMI
> -=09help
> -=09  This is a driver for newer Eee PC laptops. It adds extra features
> -=09  like wireless radio and bluetooth control, leds, hotkeys, backlight=
=2E..
> -
> -=09  For more information, see
> -=09  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
> -
> -=09  If you have an ACPI-WMI compatible Eee PC laptop (>=3D 1000), say Y=
 or M
> -=09  here.
> -
>  source "drivers/platform/x86/dell/Kconfig"
> =20
>  config AMILO_RFKILL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 229057234d00..88f45e03ee19 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -28,16 +28,6 @@ obj-$(CONFIG_ADV_SWBUTTON)=09+=3D adv_swbutton.o
>  # Apple
>  obj-$(CONFIG_APPLE_GMUX)=09+=3D apple-gmux.o
> =20
> -# ASUS
> -obj-$(CONFIG_ASUS_LAPTOP)=09+=3D asus-laptop.o
> -obj-$(CONFIG_ASUS_WIRELESS)=09+=3D asus-wireless.o
> -obj-$(CONFIG_ASUS_ARMOURY)=09+=3D asus-armoury.o
> -obj-$(CONFIG_ASUS_WMI)=09=09+=3D asus-wmi.o
> -obj-$(CONFIG_ASUS_NB_WMI)=09+=3D asus-nb-wmi.o
> -obj-$(CONFIG_ASUS_TF103C_DOCK)=09+=3D asus-tf103c-dock.o
> -obj-$(CONFIG_EEEPC_LAPTOP)=09+=3D eeepc-laptop.o
> -obj-$(CONFIG_EEEPC_WMI)=09=09+=3D eeepc-wmi.o
> -
>  # Ayaneo
>  obj-$(CONFIG_AYANEO_EC)=09=09+=3D ayaneo-ec.o
> =20
>=20

--=20
 i.
--8323328-1382457609-1794226777=:1181--
