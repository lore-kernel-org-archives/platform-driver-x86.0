Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795092880;
	b=DJ57+50vzT9SC+dlpt6uRt4AQZcY9SRRGs2hDsPNS94zOkN3U379vs7tu1qn1X81XAuB
	 IDRM5jji5VoAHD/Ro3QyKQ0Io5A0niPJ2PSAdOACDel3Oiv4NbCrb1vE206WlignCYHiQ
	 lmrSsJ07yg42Hr0WOMbGk6Ku5tIvIkRZnf6bnRAQhLRG4E4nTYnG1FSIpQqvIjndBaKVO
	 U0QKCHFrsUD8zP6/CsgP/JU5vRaBqeEwxFi018YFpovzifsfFrD5o2iWK9E0BHV8AMrSU
	 4LOXEndCbfOHbBYPUixNX0q5e8+LTBIyZ2y8NbGQBmsUkvXLwNrwjj0k/WcV0CX9l0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092880;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=N8DETj7ZfB+qmgeg8quQtfvIrEvT8PG84eyg9cgnRGY=;
	b=4P+CtrDwgniw4v7KS3rKEG4GAkBqanF5/2+Xoywzx+SciyM+WAissKMv518UPaL3fCoi
	 E+9iw7J8jMXpanjonnxp9aMwArCgx0drxfSivE0JZE4bujpR1eY4D6pAhebD4I0fRy7Am
	 rS+xJJaZvgmlwMvWj2Yf3iZsZ/TUbM3RVa4plp+FaLyXzvKEOsGHUYjF7i2Bswg40Ioa2
	 idbAmVZxqGEOIol2c22wneI+bTW92mIjEr2YTr7RLnk+YJaYdKKlDqitVyZbUSgkPi8oO
	 juJwA9YgvaSj/6rhFJoIOPaFZOIRjzAPCwcCA598JDrDE7mjY36HMMWqpz+F6sIsn9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=hYeLBke+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421DE606A320;
	Thu, 19 Nov 2026 12:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 421DE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=hYeLBke+
ARC-Seal: i=1; a=rsa-sha256; t=1795092864; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VffIq0MA29pifsvcvK8oh9/sVFC/XRL0hqxuvJcnDw0UzNpGiSr2Vws0l/dF+nuaS1mOIfTHfMFd2hxFpBzWXoz0ABW/Jxo1q4nnSDohlEObtBrKaslUAz8MunGQ/z1PtXLgAQqtyyjYh+aVQCotB+vZNDDc/+ahZb9VKzm3WHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795092864; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=N8DETj7ZfB+qmgeg8quQtfvIrEvT8PG84eyg9cgnRGY=; 
	b=NtrnwKqIVWM+5+WALDdpFSEzANzp2I8T8yi4CmDPj89tD18372MnYI7eVyRx1aMOK9K7uCNNskcVZcCT3qvpiCQ5De1VM+LecBoZhpmzLK921zbAeM2adpUcybGc5yREn5teIl/utrCbaeqtOPtv1hpNCe3xfwD/qXNzdYQJcJA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=hYeLBke+d1hfjZk8lgJBe767KOzw2CA5/QXyEjvdyaMyzooc0J34wJQD4XA0E7jjUV7Jc29GhHqkmg7qen2qrImlixm4u4abpjwtdUiO+KVas/CcYeMWqB73oXhLJ6GHw+kqdxBsV7Ecn3T486b3QC1Xj3WNldvMmTWLo0spd6ElK7fReRTA92NHqTdvkIeeiI2z+Gb7Zhu5g/bLvm9w2V8XN1f0BNp5u5+9jrorQMSblpALPjd1EToTbWH6ah8g4D4pzqPbNXFLYNepuDLzmfDGFln7jdeetcF3kzlIyI9vcG0Ydu+ZszMoB0vhfy8S3vMm4uEHvvWFlSdaWJuYqA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=N8DETj7ZfB+qmgeg8quQtfvIrEvT8PG84eyg9cgnRGY=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795092861532488.25720057605065;
	Thu, 19 Nov 2026 04:54:21 -0800 (PST)
Message-ID: <3448978d538b54ee9a979f79ce01390b1895a674.camel@rong.moe>
Subject: Re: [PATCH v2 1/3] platform: lenovo: move the architecture
 independent WMI drivers out of x86
From: Rong Zhang <i@rong.moe>
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 xy-jackie@139.com, 	ikepanhc@gmail.com, marco_giunta@outlook.it,
 platform-driver-x86@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 ldemarchi@nvidia.com
In-Reply-To: <20261119022719.3089229-2-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
	 <20261119022719.3089229-1-dcemin@nvidia.com>
	 <20261119022719.3089229-2-dcemin@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 20:49:13 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi David,

Thanks for working on this.

On Wed, 2026-11-18 at 18:27 -0800, David Cemin wrote:
> The Lenovo WMI drivers (events, helpers, capability data, GameZone,
> Other Mode, hotkey utilities and camera button) contain no x86 specific
> code: they talk to firmware through the ACPI-WMI core only. They live
> under drivers/platform/x86 because that is where Lenovo drivers were
> collected, and X86_PLATFORM_DEVICES keeps them off every other
> architecture.
>=20
> Lenovo now ships ACPI based arm64 laptops whose firmware exposes the
> same WMI GUIDs (the Fn key events, the mic mute LED method, GameZone and
> Other Mode). Give these drivers an architecture independent home,
> drivers/platform/lenovo, following the layout of drivers/platform/surface
> which exists for the same reason, so they can be built wherever the WMI
> core is available. ideapad-laptop, thinkpad_acpi, think-lmi, yogabook and
> the Yoga Tablet drivers stay under x86: they depend on i8042, port I/O or
> x86 only ACPI devices.
>=20
> Pure code motion: the files, their Kconfig entries and the module naming
> scheme are unchanged. MAINTAINERS entries are updated for the new paths.
>=20
> Signed-off-by: David Cemin <dcemin@nvidia.com>
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Reviewed-by: Jackie Dong <xy-jackie@139.com>

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
>  MAINTAINERS                                   |  3 +-
>  drivers/platform/Kconfig                      |  2 +
>  drivers/platform/Makefile                     |  1 +
>  drivers/platform/lenovo/Kconfig               | 87 +++++++++++++++++++
>  drivers/platform/lenovo/Makefile              | 22 +++++
>  .../platform/{x86 =3D> }/lenovo/wmi-camera.c    |  0
>  .../platform/{x86 =3D> }/lenovo/wmi-capdata.c   |  0
>  .../platform/{x86 =3D> }/lenovo/wmi-capdata.h   |  0
>  .../platform/{x86 =3D> }/lenovo/wmi-events.c    |  0
>  .../platform/{x86 =3D> }/lenovo/wmi-events.h    |  0
>  .../platform/{x86 =3D> }/lenovo/wmi-gamezone.c  |  0
>  .../platform/{x86 =3D> }/lenovo/wmi-helpers.c   |  0
>  .../platform/{x86 =3D> }/lenovo/wmi-helpers.h   |  0
>  .../{x86 =3D> }/lenovo/wmi-hotkey-utilities.c   |  0
>  drivers/platform/{x86 =3D> }/lenovo/wmi-other.c |  0
>  drivers/platform/x86/lenovo/Kconfig           | 67 --------------
>  drivers/platform/x86/lenovo/Makefile          |  7 --
>  17 files changed, 114 insertions(+), 75 deletions(-)
>  create mode 100644 drivers/platform/lenovo/Kconfig
>  create mode 100644 drivers/platform/lenovo/Makefile
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-camera.c (100%)
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-capdata.c (100%)
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-capdata.h (100%)
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-events.c (100%)
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-events.h (100%)
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-gamezone.c (100%)
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-helpers.c (100%)
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-helpers.h (100%)
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-hotkey-utilities.c (100%)
>  rename drivers/platform/{x86 =3D> }/lenovo/wmi-other.c (100%)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 056408bc086e..3b0ad5a3debe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15170,13 +15170,14 @@ L:=09platform-driver-x86@vger.kernel.org
>  S:=09Maintained
>  F:=09Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  F:=09Documentation/wmi/devices/lenovo-wmi-other.rst
> +F:=09drivers/platform/lenovo/
>  F:=09drivers/platform/x86/lenovo/*
> =20
>  LENOVO WMI HOTKEY UTILITIES DRIVER
>  M:=09Jackie Dong <xy-jackie@139.com>
>  L:=09platform-driver-x86@vger.kernel.org
>  S:=09Maintained
> -F:=09drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
> +F:=09drivers/platform/lenovo/wmi-hotkey-utilities.c
> =20
>  LENOVO HID drivers
>  M:=09Derek J. Clark <derekjohn.clark@gmail.com>
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index 312788f249c9..80b2b83b69e5 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -15,6 +15,8 @@ source "drivers/platform/olpc/Kconfig"
> =20
>  source "drivers/platform/surface/Kconfig"
> =20
> +source "drivers/platform/lenovo/Kconfig"
> +
>  source "drivers/platform/x86/Kconfig"
> =20
>  source "drivers/platform/arm64/Kconfig"
> diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> index fa322e7f8716..0144f88ff6db 100644
> --- a/drivers/platform/Makefile
> +++ b/drivers/platform/Makefile
> @@ -12,6 +12,7 @@ obj-$(CONFIG_GOLDFISH)=09=09+=3D goldfish/
>  obj-$(CONFIG_CHROME_PLATFORMS)=09+=3D chrome/
>  obj-$(CONFIG_CZNIC_PLATFORMS)=09+=3D cznic/
>  obj-$(CONFIG_SURFACE_PLATFORMS)=09+=3D surface/
> +obj-$(CONFIG_LENOVO_PLATFORMS)=09+=3D lenovo/
>  obj-$(CONFIG_ARM64_PLATFORM_DEVICES)=09+=3D arm64/
>  obj-$(CONFIG_BCM2835_VCHIQ)=09+=3D raspberrypi/
>  obj-$(CONFIG_ACPI_WMI)=09=09+=3D wmi/
> diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/Kc=
onfig
> new file mode 100644
> index 000000000000..8222322ca671
> --- /dev/null
> +++ b/drivers/platform/lenovo/Kconfig
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Lenovo Platform-Specific Drivers
> +#
> +
> +menuconfig LENOVO_PLATFORMS
> +=09bool "Lenovo Platform-Specific Device Drivers"
> +=09depends on ARM64 || X86 || COMPILE_TEST
> +=09default y if ARM64 || X86
> +=09help
> +=09  Say Y here to get to see options for platform-specific device drive=
rs
> +=09  for Lenovo devices that do not depend on the CPU architecture, such
> +=09  as the ACPI-WMI based drivers used on both x86 and arm64 laptops.
> +=09  This option alone does not add any kernel code.
> +
> +=09  If you say N, all options in this submenu will be skipped and disab=
led.
> +
> +if LENOVO_PLATFORMS
> +
> +config LENOVO_WMI_HELPERS
> +=09tristate
> +=09depends on ACPI_WMI
> +
> +config LENOVO_WMI_EVENTS
> +=09tristate
> +=09depends on ACPI_WMI
> +
> +config LENOVO_WMI_CAPDATA
> +=09tristate
> +=09depends on ACPI_WMI
> +=09depends on LENOVO_WMI_HELPERS
> +
> +config LENOVO_WMI_HOTKEY_UTILITIES
> +=09tristate "Lenovo Hotkey Utility WMI extras driver"
> +=09depends on ACPI_WMI
> +=09select NEW_LEDS
> +=09select LEDS_CLASS
> +=09imply IDEAPAD_LAPTOP
> +=09help
> +=09  This driver provides WMI support for Lenovo customized hotkeys func=
tion,
> +=09  such as LED control for audio/mic mute event for Ideapad, YOGA, Xia=
oXin,
> +=09  Gaming, ThinkBook and so on.
> +
> +config LENOVO_WMI_CAMERA
> +=09tristate "Lenovo WMI Camera Button driver"
> +=09depends on ACPI_WMI
> +=09depends on INPUT
> +=09help
> +=09  This driver provides support for Lenovo camera button. The Camera
> +=09  button is a GPIO device. This driver receives ACPI notifications wh=
en
> +=09  the camera button is switched on/off.
> +
> +=09  To compile this driver as a module, choose M here: the module
> +=09  will be called lenovo-wmi-camera.
> +
> +config LENOVO_WMI_GAMEZONE
> +=09tristate "Lenovo GameZone WMI Driver"
> +=09depends on ACPI_WMI
> +=09depends on DMI
> +=09select ACPI_PLATFORM_PROFILE
> +=09select LENOVO_WMI_EVENTS
> +=09select LENOVO_WMI_HELPERS
> +=09help
> +=09  Say Y here if you have a WMI aware Lenovo Legion device and would l=
ike to use the
> +=09  platform-profile firmware interface to manage power usage.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called lenovo-wmi-gamezone.
> +
> +config LENOVO_WMI_TUNING
> +=09tristate "Lenovo Other Mode WMI Driver"
> +=09depends on ACPI_WMI
> +=09depends on ACPI_BATTERY
> +=09select HWMON
> +=09select FW_ATTR_CLASS
> +=09select LENOVO_WMI_CAPDATA
> +=09select LENOVO_WMI_EVENTS
> +=09select LENOVO_WMI_HELPERS
> +=09help
> +=09  Say Y here if you have a WMI aware Lenovo Legion device and would l=
ike to use the
> +=09  firmware_attributes API to control various tunable settings typical=
ly exposed by
> +=09  Lenovo software in Windows.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called lenovo-wmi-other.
> +
> +endif # LENOVO_PLATFORMS
> diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/M=
akefile
> new file mode 100644
> index 000000000000..1cac115dd735
> --- /dev/null
> +++ b/drivers/platform/lenovo/Makefile
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/lenovo
> +# Lenovo Platform Specific Drivers (architecture independent)
> +#
> +
> +lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)=09+=3D wmi-helpers.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)=09+=3D wmi-events.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)=09+=3D wmi-capdata.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)=09+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)=09+=3D wmi-camera.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)=09+=3D wmi-gamezone.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)=09+=3D wmi-other.o
> +
> +# Add 'lenovo' prefix to each module listed in lenovo-target-*
> +define LENOVO_OBJ_TARGET
> +lenovo-$(1)-y :=3D $(1).o
> +obj-$(2) +=3D lenovo-$(1).o
> +endef
> +
> +$(foreach target, $(basename $(lenovo-target-y)), $(eval $(call LENOVO_O=
BJ_TARGET,$(target),y)))
> +$(foreach target, $(basename $(lenovo-target-m)), $(eval $(call LENOVO_O=
BJ_TARGET,$(target),m)))
> diff --git a/drivers/platform/x86/lenovo/wmi-camera.c b/drivers/platform/=
lenovo/wmi-camera.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-camera.c
> rename to drivers/platform/lenovo/wmi-camera.c
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform=
/lenovo/wmi-capdata.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-capdata.c
> rename to drivers/platform/lenovo/wmi-capdata.c
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/lenovo/wmi-capdata.h
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-capdata.h
> rename to drivers/platform/lenovo/wmi-capdata.h
> diff --git a/drivers/platform/x86/lenovo/wmi-events.c b/drivers/platform/=
lenovo/wmi-events.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-events.c
> rename to drivers/platform/lenovo/wmi-events.c
> diff --git a/drivers/platform/x86/lenovo/wmi-events.h b/drivers/platform/=
lenovo/wmi-events.h
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-events.h
> rename to drivers/platform/lenovo/wmi-events.h
> diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platfor=
m/lenovo/wmi-gamezone.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-gamezone.c
> rename to drivers/platform/lenovo/wmi-gamezone.c
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform=
/lenovo/wmi-helpers.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-helpers.c
> rename to drivers/platform/lenovo/wmi-helpers.c
> diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform=
/lenovo/wmi-helpers.h
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-helpers.h
> rename to drivers/platform/lenovo/wmi-helpers.h
> diff --git a/drivers/platform/x86/lenovo/wmi-hotkey-utilities.c b/drivers=
/platform/lenovo/wmi-hotkey-utilities.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
> rename to drivers/platform/lenovo/wmi-hotkey-utilities.c
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/l=
enovo/wmi-other.c
> similarity index 100%
> rename from drivers/platform/x86/lenovo/wmi-other.c
> rename to drivers/platform/lenovo/wmi-other.c
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index f16b09bab082..4d9a25d0e3b5 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -20,29 +20,6 @@ config IDEAPAD_LAPTOP
>  =09  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>  =09  rfkill switch, hotkey, fan control and backlight control.
> =20
> -config LENOVO_WMI_HOTKEY_UTILITIES
> -=09tristate "Lenovo Hotkey Utility WMI extras driver"
> -=09depends on ACPI_WMI
> -=09select NEW_LEDS
> -=09select LEDS_CLASS
> -=09imply IDEAPAD_LAPTOP
> -=09help
> -=09  This driver provides WMI support for Lenovo customized hotkeys func=
tion,
> -=09  such as LED control for audio/mic mute event for Ideapad, YOGA, Xia=
oXin,
> -=09  Gaming, ThinkBook and so on.
> -
> -config LENOVO_WMI_CAMERA
> -=09tristate "Lenovo WMI Camera Button driver"
> -=09depends on ACPI_WMI
> -=09depends on INPUT
> -=09help
> -=09  This driver provides support for Lenovo camera button. The Camera
> -=09  button is a GPIO device. This driver receives ACPI notifications wh=
en
> -=09  the camera button is switched on/off.
> -
> -=09  To compile this driver as a module, choose M here: the module
> -=09  will be called lenovo-wmi-camera.
> -
>  config LENOVO_YB9_KBDOCK
>  =09tristate "Lenovo Yoga Book 9 keyboard dock detection"
>  =09depends on ACPI_WMI
> @@ -248,47 +225,3 @@ config YT2_1380
> =20
>  =09  To compile this driver as a module, choose M here: the module will
>  =09  be called lenovo-yogabook.
> -
> -config LENOVO_WMI_CAPDATA
> -=09tristate
> -=09depends on ACPI_WMI
> -=09depends on LENOVO_WMI_HELPERS
> -
> -config LENOVO_WMI_EVENTS
> -=09tristate
> -=09depends on ACPI_WMI
> -
> -config LENOVO_WMI_HELPERS
> -=09tristate
> -=09depends on ACPI_WMI
> -
> -config LENOVO_WMI_GAMEZONE
> -=09tristate "Lenovo GameZone WMI Driver"
> -=09depends on ACPI_WMI
> -=09depends on DMI
> -=09select ACPI_PLATFORM_PROFILE
> -=09select LENOVO_WMI_EVENTS
> -=09select LENOVO_WMI_HELPERS
> -=09help
> -=09  Say Y here if you have a WMI aware Lenovo Legion device and would l=
ike to use the
> -=09  platform-profile firmware interface to manage power usage.
> -
> -=09  To compile this driver as a module, choose M here: the module will
> -=09  be called lenovo-wmi-gamezone.
> -
> -config LENOVO_WMI_TUNING
> -=09tristate "Lenovo Other Mode WMI Driver"
> -=09depends on ACPI_WMI
> -=09depends on ACPI_BATTERY
> -=09select HWMON
> -=09select FW_ATTR_CLASS
> -=09select LENOVO_WMI_CAPDATA
> -=09select LENOVO_WMI_EVENTS
> -=09select LENOVO_WMI_HELPERS
> -=09help
> -=09  Say Y here if you have a WMI aware Lenovo Legion device and would l=
ike to use the
> -=09  firmware_attributes API to control various tunable settings typical=
ly exposed by
> -=09  Lenovo software in Windows.
> -
> -=09  To compile this driver as a module, choose M here: the module will
> -=09  be called lenovo-wmi-other.
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/=
lenovo/Makefile
> index 12816d8d5e24..758c36cedee8 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -7,17 +7,10 @@ obj-$(CONFIG_IDEAPAD_LAPTOP)=09+=3D ideapad-laptop.o
>  obj-$(CONFIG_THINKPAD_LMI)=09+=3D think-lmi.o
>  obj-$(CONFIG_THINKPAD_ACPI)=09+=3D thinkpad_acpi.o
> =20
> -lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)=09+=3D wmi-hotkey-ut=
ilities.o
>  lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)=09+=3D yb9-kbdock.o
>  lenovo-target-$(CONFIG_LENOVO_YMC)=09+=3D ymc.o
>  lenovo-target-$(CONFIG_YOGABOOK)=09+=3D yogabook.o
>  lenovo-target-$(CONFIG_YT2_1380)=09+=3D yoga-tab2-pro-1380-fastcharger.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)=09+=3D wmi-camera.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)=09+=3D wmi-capdata.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)=09+=3D wmi-events.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)=09+=3D wmi-helpers.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)=09+=3D wmi-gamezone.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)=09+=3D wmi-other.o
> =20
>  # Add 'lenovo' prefix to each module listed in lenovo-target-*
>  define LENOVO_OBJ_TARGET
