Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=120.232.169.110
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794882470;
	b=L0c5Ht125sWm8aLrNwhNHz515vO1IqrDtJDHBSx47rsBnYL8MxsH0eZn9w3J2192dU0n
	 prDPujiRkFx/FeRGdwtSqVJsbbclZGUcbs2FSYCfdshOoabEkvc8fphPck8CP3aMWlgmU
	 ivDVeH7GM+pqAI6G7JFgCXS5YNTixqfKOLJ7BgkIkJOn0r+m3nKXNtCtGumcRm5iXgnqR
	 oD52vrgHK6kYPjrBANPXDyrcfgaoxoJzkLU08iMLFVQjVFjNvVbghSXdhxomwP6iTkE1p
	 RSRzBKJq5O4AGSa1YiG1CXcKWQBbkiDXH1jubUgR+dCXihmGN3ZQJXxtW8P7XiDBszQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882470;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM:X-RM-SPAM-FLAG:
	 Received:X-RM-TRANSID:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:User-Agent:
	 MIME-Version;
	bh=AfTrkNR+KCynuBEvMj8k7eszWy2SUx2l0W3MzS7+vpA=;
	b=X3nUzHPecAnSuHUkNaRYzeXO5EaivSnCo+aClN/GBIjvlL2t8wUbd1R8c59N4SgA0V3Z
	 SeYapEs4EAdjPKrLmd3+juoqxu4fu5ZL7v5bamJKfIzfW5DLmVtlxniRN8Tq8ZfKA+8J/
	 ytbq3WN+aHNSbNKdS9KdZhIXR4U5OhTHxPh4jHLozP70FKEf3JFb7L1gb+y/Lhh6ULSDY
	 oZWTMI1Vfzxr6DpV3to+8YPTWrpi4ySqOO+0YPx+QZEs+5L2hLFdTyUb71/gVZk10NOVZ
	 +97JFymbd1bhAy94uqSL3+4t1klEWbIvwS8Cv46eNNgRrz/n0cU0CkV2sMjkQeIAr3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=139.com;
	spf=pass smtp.mailfrom=139.com;
	dkim=pass header.d=139.com header.i=@139.com header.a=rsa-sha256 header.s=dkim header.b=RX5E07pz;
	arc=none smtp.remote-ip=120.232.169.110
Received: from n169-110.mail.139.com (n169-110.mail.139.com [120.232.169.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217E6606A31C;
	Tue, 17 Nov 2026 02:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 217E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=139.com header.i=@139.com header.a=rsa-sha256 header.s=dkim header.b=RX5E07pz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=RX5E07pzaBwUiC6/Kup2Axyvr+VNYOczB4xHd/R8PMrGUep2Oy20byrI4HtOnyJhpAftjlczyWAu5
	 z1x/DtWHVBwyWlWgmSbcarCWhxe3YJHov8QyW/k+co4Y+J2owvEKNyKZ3MjrU5tqNP5MLEfZDfaUqA
	 QxgEw2OjTMXoNLc8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [10.103.151.114] (unknown[36.110.60.243])
	by rmsmtp-lg-appmail-08-12086 (RichMail) with SMTP id 2f366afbbb94156-061d3;
	Tue, 17 Nov 2026 10:27:36 +0800 (CST)
X-RM-TRANSID:2f366afbbb94156-061d3
Message-ID: <720a92441bb441ec1774c19a62610e3d32234911.camel@139.com>
Subject: Re: [RFC PATCH 1/3] platform: lenovo: move the architecture
 independent WMI drivers out of x86
From: Jackie Dong <xy-jackie@139.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, David Cemin
 <dcemin@nvidia.com>,  Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Armin Wolf
 <W_Armin@gmx.de>
Cc: "Derek J . Clark" <derekjohn.clark@gmail.com>, Ike Panhc
	 <ikepanhc@gmail.com>, "platform-driver-x86@vger.kernel.org"
	 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	ldemarchi@nvidia.com
Date: Tue, 17 Nov 2026 10:27:35 +0800
In-Reply-To: <cbaf1595-05e3-46cd-b2aa-7bec1315cf8f@app.fastmail.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
	 <20261113222755.1696567-2-dcemin@nvidia.com>
	 <cbaf1595-05e3-46cd-b2aa-7bec1315cf8f@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 2026-11-15 at 16:50 -0500, Mark Pearson wrote:
>=20
>=20
> On Fri, Nov 13, 2026, at 5:27 PM, David Cemin wrote:
> > The Lenovo WMI drivers (events, helpers, capability data, GameZone,
> > Other Mode, hotkey utilities and camera button) contain no x86
> > specific
> > code: they talk to firmware through the ACPI-WMI core only. They
> > live
> > under drivers/platform/x86 because that is where Lenovo drivers
> > were
> > collected, and X86_PLATFORM_DEVICES keeps them off every other
> > architecture.
> >=20
> > Lenovo now ships ACPI based arm64 laptops whose firmware exposes
> > the
> > same WMI GUIDs (the Fn key events, the mic mute LED method,
> > GameZone and
> > Other Mode). Give these drivers an architecture independent home,
> > drivers/platform/lenovo, following the layout of
> > drivers/platform/surface
> > which exists for the same reason, so they can be built wherever the
> > WMI
> > core is available. ideapad-laptop, thinkpad_acpi, think-lmi,
> > yogabook and
> > the Yoga Tablet drivers stay under x86: they depend on i8042, port
> > I/O or
> > x86 only ACPI devices.
> >=20
> > Pure code motion: the files, their Kconfig entries and the module
> > naming
> > scheme are unchanged. MAINTAINERS entries are updated for the new
> > paths.
> >=20
> > Signed-off-by: David Cemin <dcemin@nvidia.com>
> > ---
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 3 +-
> > =C2=A0drivers/platform/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 +
> > =C2=A0drivers/platform/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 1 +
> > =C2=A0drivers/platform/lenovo/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 87
> > +++++++++++++++++++
> > =C2=A0drivers/platform/lenovo/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 22 +++++
> > =C2=A0.../platform/{x86 =3D> }/lenovo/wmi-camera.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 0
> > =C2=A0.../platform/{x86 =3D> }/lenovo/wmi-capdata.c=C2=A0=C2=A0 |=C2=A0=
 0
> > =C2=A0.../platform/{x86 =3D> }/lenovo/wmi-capdata.h=C2=A0=C2=A0 |=C2=A0=
 0
> > =C2=A0.../platform/{x86 =3D> }/lenovo/wmi-events.c=C2=A0=C2=A0=C2=A0 |=
=C2=A0 0
> > =C2=A0.../platform/{x86 =3D> }/lenovo/wmi-events.h=C2=A0=C2=A0=C2=A0 |=
=C2=A0 0
> > =C2=A0.../platform/{x86 =3D> }/lenovo/wmi-gamezone.c=C2=A0 |=C2=A0 0
> > =C2=A0.../platform/{x86 =3D> }/lenovo/wmi-helpers.c=C2=A0=C2=A0 |=C2=A0=
 0
> > =C2=A0.../platform/{x86 =3D> }/lenovo/wmi-helpers.h=C2=A0=C2=A0 |=C2=A0=
 0
> > =C2=A0.../{x86 =3D> }/lenovo/wmi-hotkey-utilities.c=C2=A0=C2=A0 |=C2=A0=
 0
> > =C2=A0drivers/platform/{x86 =3D> }/lenovo/wmi-other.c |=C2=A0 0
> > =C2=A0drivers/platform/x86/lenovo/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 67 --------------
> > =C2=A0drivers/platform/x86/lenovo/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 --
> > =C2=A017 files changed, 114 insertions(+), 75 deletions(-)
> > =C2=A0create mode 100644 drivers/platform/lenovo/Kconfig
> > =C2=A0create mode 100644 drivers/platform/lenovo/Makefile
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-camera.c (100%)
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-capdata.c (100%)
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-capdata.h (100%)
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-events.c (100%)
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-events.h (100%)
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-gamezone.c (100%)
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-helpers.c (100%)
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-helpers.h (100%)
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-hotkey-utilities.c
> > (100%)
> > =C2=A0rename drivers/platform/{x86 =3D> }/lenovo/wmi-other.c (100%)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 056408bc086e..3b0ad5a3debe 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15170,13 +15170,14 @@
> > L:	platform-driver-x86@vger.kernel.org
> > =C2=A0S:	Maintained
> > =C2=A0F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
> > =C2=A0F:	Documentation/wmi/devices/lenovo-wmi-other.rst
> > +F:	drivers/platform/lenovo/
> > =C2=A0F:	drivers/platform/x86/lenovo/*
> >=20
> > =C2=A0LENOVO WMI HOTKEY UTILITIES DRIVER
> > =C2=A0M:	Jackie Dong <xy-jackie@139.com>
> > =C2=A0L:	platform-driver-x86@vger.kernel.org
> > =C2=A0S:	Maintained
> > -F:	drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
> > +F:	drivers/platform/lenovo/wmi-hotkey-utilities.c
> >=20
> > =C2=A0LENOVO HID drivers
> > =C2=A0M:	Derek J. Clark <derekjohn.clark@gmail.com>
> > diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> > index 312788f249c9..80b2b83b69e5 100644
> > --- a/drivers/platform/Kconfig
> > +++ b/drivers/platform/Kconfig
> > @@ -15,6 +15,8 @@ source "drivers/platform/olpc/Kconfig"
> >=20
> > =C2=A0source "drivers/platform/surface/Kconfig"
> >=20
> > +source "drivers/platform/lenovo/Kconfig"
> > +
> > =C2=A0source "drivers/platform/x86/Kconfig"
> >=20
> > =C2=A0source "drivers/platform/arm64/Kconfig"
> > diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
> > index fa322e7f8716..0144f88ff6db 100644
> > --- a/drivers/platform/Makefile
> > +++ b/drivers/platform/Makefile
> > @@ -12,6 +12,7 @@ obj-$(CONFIG_GOLDFISH)		+=3D
> > goldfish/
> > =C2=A0obj-$(CONFIG_CHROME_PLATFORMS)	+=3D chrome/
> > =C2=A0obj-$(CONFIG_CZNIC_PLATFORMS)	+=3D cznic/
> > =C2=A0obj-$(CONFIG_SURFACE_PLATFORMS)	+=3D surface/
> > +obj-$(CONFIG_LENOVO_PLATFORMS)	+=3D lenovo/
> > =C2=A0obj-$(CONFIG_ARM64_PLATFORM_DEVICES)	+=3D arm64/
> > =C2=A0obj-$(CONFIG_BCM2835_VCHIQ)	+=3D raspberrypi/
> > =C2=A0obj-$(CONFIG_ACPI_WMI)		+=3D wmi/
> > diff --git a/drivers/platform/lenovo/Kconfig=20
> > b/drivers/platform/lenovo/Kconfig
> > new file mode 100644
> > index 000000000000..8222322ca671
> > --- /dev/null
> > +++ b/drivers/platform/lenovo/Kconfig
> > @@ -0,0 +1,87 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +#
> > +# Lenovo Platform-Specific Drivers
> > +#
> > +
> > +menuconfig LENOVO_PLATFORMS
> > +	bool "Lenovo Platform-Specific Device Drivers"
> > +	depends on ARM64 || X86 || COMPILE_TEST
> > +	default y if ARM64 || X86
> > +	help
> > +	=C2=A0 Say Y here to get to see options for platform-specific
> > device=20
> > drivers
> > +	=C2=A0 for Lenovo devices that do not depend on the CPU
> > architecture, such
> > +	=C2=A0 as the ACPI-WMI based drivers used on both x86 and arm64
> > laptops.
> > +	=C2=A0 This option alone does not add any kernel code.
> > +
> > +	=C2=A0 If you say N, all options in this submenu will be
> > skipped and=20
> > disabled.
> > +
> > +if LENOVO_PLATFORMS
> > +
> > +config LENOVO_WMI_HELPERS
> > +	tristate
> > +	depends on ACPI_WMI
> > +
> > +config LENOVO_WMI_EVENTS
> > +	tristate
> > +	depends on ACPI_WMI
> > +
> > +config LENOVO_WMI_CAPDATA
> > +	tristate
> > +	depends on ACPI_WMI
> > +	depends on LENOVO_WMI_HELPERS
> > +
> > +config LENOVO_WMI_HOTKEY_UTILITIES
> > +	tristate "Lenovo Hotkey Utility WMI extras driver"
> > +	depends on ACPI_WMI
> > +	select NEW_LEDS
> > +	select LEDS_CLASS
> > +	imply IDEAPAD_LAPTOP
> > +	help
> > +	=C2=A0 This driver provides WMI support for Lenovo customized
> > hotkeys=20
> > function,
> > +	=C2=A0 such as LED control for audio/mic mute event for
> > Ideapad, YOGA,
> > XiaoXin,
> > +	=C2=A0 Gaming, ThinkBook and so on.
> > +
> > +config LENOVO_WMI_CAMERA
> > +	tristate "Lenovo WMI Camera Button driver"
> > +	depends on ACPI_WMI
> > +	depends on INPUT
> > +	help
> > +	=C2=A0 This driver provides support for Lenovo camera button.
> > The Camera
> > +	=C2=A0 button is a GPIO device. This driver receives ACPI
> > notifications=20
> > when
> > +	=C2=A0 the camera button is switched on/off.
> > +
> > +	=C2=A0 To compile this driver as a module, choose M here: the
> > module
> > +	=C2=A0 will be called lenovo-wmi-camera.
> > +
> > +config LENOVO_WMI_GAMEZONE
> > +	tristate "Lenovo GameZone WMI Driver"
> > +	depends on ACPI_WMI
> > +	depends on DMI
> > +	select ACPI_PLATFORM_PROFILE
> > +	select LENOVO_WMI_EVENTS
> > +	select LENOVO_WMI_HELPERS
> > +	help
> > +	=C2=A0 Say Y here if you have a WMI aware Lenovo Legion device
> > and would=20
> > like to use the
> > +	=C2=A0 platform-profile firmware interface to manage power
> > usage.
> > +
> > +	=C2=A0 To compile this driver as a module, choose M here: the
> > module will
> > +	=C2=A0 be called lenovo-wmi-gamezone.
> > +
> > +config LENOVO_WMI_TUNING
> > +	tristate "Lenovo Other Mode WMI Driver"
> > +	depends on ACPI_WMI
> > +	depends on ACPI_BATTERY
> > +	select HWMON
> > +	select FW_ATTR_CLASS
> > +	select LENOVO_WMI_CAPDATA
> > +	select LENOVO_WMI_EVENTS
> > +	select LENOVO_WMI_HELPERS
> > +	help
> > +	=C2=A0 Say Y here if you have a WMI aware Lenovo Legion device
> > and would=20
> > like to use the
> > +	=C2=A0 firmware_attributes API to control various tunable
> > settings=20
> > typically exposed by
> > +	=C2=A0 Lenovo software in Windows.
> > +
> > +	=C2=A0 To compile this driver as a module, choose M here: the
> > module will
> > +	=C2=A0 be called lenovo-wmi-other.
> > +
> > +endif # LENOVO_PLATFORMS
> > diff --git a/drivers/platform/lenovo/Makefile=20
> > b/drivers/platform/lenovo/Makefile
> > new file mode 100644
> > index 000000000000..1cac115dd735
> > --- /dev/null
> > +++ b/drivers/platform/lenovo/Makefile
> > @@ -0,0 +1,22 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +#
> > +# Makefile for linux/drivers/platform/lenovo
> > +# Lenovo Platform Specific Drivers (architecture independent)
> > +#
> > +
> > +lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D wmi-helpers.o
> > +lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D wmi-events.o
> > +lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+=3D wmi-capdata.o
> > +lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D=20
> > wmi-hotkey-utilities.o
> > +lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D wmi-camera.o
> > +lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D wmi-gamezone.o
> > +lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+=3D wmi-other.o
> > +
> > +# Add 'lenovo' prefix to each module listed in lenovo-target-*
> > +define LENOVO_OBJ_TARGET
> > +lenovo-$(1)-y :=3D $(1).o
> > +obj-$(2) +=3D lenovo-$(1).o
> > +endef
> > +
> > +$(foreach target, $(basename $(lenovo-target-y)), $(eval $(call=20
> > LENOVO_OBJ_TARGET,$(target),y)))
> > +$(foreach target, $(basename $(lenovo-target-m)), $(eval $(call=20
> > LENOVO_OBJ_TARGET,$(target),m)))
> > diff --git a/drivers/platform/x86/lenovo/wmi-camera.c=20
> > b/drivers/platform/lenovo/wmi-camera.c
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-camera.c
> > rename to drivers/platform/lenovo/wmi-camera.c
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c=20
> > b/drivers/platform/lenovo/wmi-capdata.c
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-capdata.c
> > rename to drivers/platform/lenovo/wmi-capdata.c
> > diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h=20
> > b/drivers/platform/lenovo/wmi-capdata.h
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-capdata.h
> > rename to drivers/platform/lenovo/wmi-capdata.h
> > diff --git a/drivers/platform/x86/lenovo/wmi-events.c=20
> > b/drivers/platform/lenovo/wmi-events.c
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-events.c
> > rename to drivers/platform/lenovo/wmi-events.c
> > diff --git a/drivers/platform/x86/lenovo/wmi-events.h=20
> > b/drivers/platform/lenovo/wmi-events.h
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-events.h
> > rename to drivers/platform/lenovo/wmi-events.h
> > diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c=20
> > b/drivers/platform/lenovo/wmi-gamezone.c
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-gamezone.c
> > rename to drivers/platform/lenovo/wmi-gamezone.c
> > diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c=20
> > b/drivers/platform/lenovo/wmi-helpers.c
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-helpers.c
> > rename to drivers/platform/lenovo/wmi-helpers.c
> > diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h=20
> > b/drivers/platform/lenovo/wmi-helpers.h
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-helpers.h
> > rename to drivers/platform/lenovo/wmi-helpers.h
> > diff --git a/drivers/platform/x86/lenovo/wmi-hotkey-utilities.c=20
> > b/drivers/platform/lenovo/wmi-hotkey-utilities.c
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-hotkey-utilities.c
> > rename to drivers/platform/lenovo/wmi-hotkey-utilities.c
> > diff --git a/drivers/platform/x86/lenovo/wmi-other.c=20
> > b/drivers/platform/lenovo/wmi-other.c
> > similarity index 100%
> > rename from drivers/platform/x86/lenovo/wmi-other.c
> > rename to drivers/platform/lenovo/wmi-other.c
> > diff --git a/drivers/platform/x86/lenovo/Kconfig=20
> > b/drivers/platform/x86/lenovo/Kconfig
> > index 516594993073..36bcefb61805 100644
> > --- a/drivers/platform/x86/lenovo/Kconfig
> > +++ b/drivers/platform/x86/lenovo/Kconfig
> > @@ -20,29 +20,6 @@ config IDEAPAD_LAPTOP
> > =C2=A0	=C2=A0 This is a driver for Lenovo IdeaPad netbooks contains
> > drivers for
> > =C2=A0	=C2=A0 rfkill switch, hotkey, fan control and backlight
> > control.
> >=20
> > -config LENOVO_WMI_HOTKEY_UTILITIES
> > -	tristate "Lenovo Hotkey Utility WMI extras driver"
> > -	depends on ACPI_WMI
> > -	select NEW_LEDS
> > -	select LEDS_CLASS
> > -	imply IDEAPAD_LAPTOP
> > -	help
> > -	=C2=A0 This driver provides WMI support for Lenovo customized
> > hotkeys function,
> > -	=C2=A0 such as LED control for audio/mic mute event for
> > Ideapad, YOGA, XiaoXin,
> > -	=C2=A0 Gaming, ThinkBook and so on.
> > -
> > -config LENOVO_WMI_CAMERA
> > -	tristate "Lenovo WMI Camera Button driver"
> > -	depends on ACPI_WMI
> > -	depends on INPUT
> > -	help
> > -	=C2=A0 This driver provides support for Lenovo camera button.
> > The Camera
> > -	=C2=A0 button is a GPIO device. This driver receives ACPI
> > notifications when
> > -	=C2=A0 the camera button is switched on/off.
> > -
> > -	=C2=A0 To compile this driver as a module, choose M here: the
> > module
> > -	=C2=A0 will be called lenovo-wmi-camera.
> > -
> > =C2=A0config LENOVO_YB9_KBDOCK
> > =C2=A0	tristate "Lenovo Yoga Book 9 keyboard dock detection"
> > =C2=A0	depends on ACPI_WMI
> > @@ -246,47 +223,3 @@ config YT2_1380
> >=20
> > =C2=A0	=C2=A0 To compile this driver as a module, choose M here: the
> > module will
> > =C2=A0	=C2=A0 be called lenovo-yogabook.
> > -
> > -config LENOVO_WMI_CAPDATA
> > -	tristate
> > -	depends on ACPI_WMI
> > -	depends on LENOVO_WMI_HELPERS
> > -
> > -config LENOVO_WMI_EVENTS
> > -	tristate
> > -	depends on ACPI_WMI
> > -
> > -config LENOVO_WMI_HELPERS
> > -	tristate
> > -	depends on ACPI_WMI
> > -
> > -config LENOVO_WMI_GAMEZONE
> > -	tristate "Lenovo GameZone WMI Driver"
> > -	depends on ACPI_WMI
> > -	depends on DMI
> > -	select ACPI_PLATFORM_PROFILE
> > -	select LENOVO_WMI_EVENTS
> > -	select LENOVO_WMI_HELPERS
> > -	help
> > -	=C2=A0 Say Y here if you have a WMI aware Lenovo Legion device
> > and would=20
> > like to use the
> > -	=C2=A0 platform-profile firmware interface to manage power
> > usage.
> > -
> > -	=C2=A0 To compile this driver as a module, choose M here: the
> > module will
> > -	=C2=A0 be called lenovo-wmi-gamezone.
> > -
> > -config LENOVO_WMI_TUNING
> > -	tristate "Lenovo Other Mode WMI Driver"
> > -	depends on ACPI_WMI
> > -	depends on ACPI_BATTERY
> > -	select HWMON
> > -	select FW_ATTR_CLASS
> > -	select LENOVO_WMI_CAPDATA
> > -	select LENOVO_WMI_EVENTS
> > -	select LENOVO_WMI_HELPERS
> > -	help
> > -	=C2=A0 Say Y here if you have a WMI aware Lenovo Legion device
> > and would=20
> > like to use the
> > -	=C2=A0 firmware_attributes API to control various tunable
> > settings=20
> > typically exposed by
> > -	=C2=A0 Lenovo software in Windows.
> > -
> > -	=C2=A0 To compile this driver as a module, choose M here: the
> > module will
> > -	=C2=A0 be called lenovo-wmi-other.
> > diff --git a/drivers/platform/x86/lenovo/Makefile=20
> > b/drivers/platform/x86/lenovo/Makefile
> > index 12816d8d5e24..758c36cedee8 100644
> > --- a/drivers/platform/x86/lenovo/Makefile
> > +++ b/drivers/platform/x86/lenovo/Makefile
> > @@ -7,17 +7,10 @@ obj-$(CONFIG_IDEAPAD_LAPTOP)	+=3D ideapad-
> > laptop.o
> > =C2=A0obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
> > =C2=A0obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
> >=20
> > -lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D wmi-
> > hotkey-utilities.o
> > =C2=A0lenovo-target-$(CONFIG_LENOVO_YB9_KBDOCK)	+=3D yb9-kbdock.o
> > =C2=A0lenovo-target-$(CONFIG_LENOVO_YMC)	+=3D ymc.o
> > =C2=A0lenovo-target-$(CONFIG_YOGABOOK)	+=3D yogabook.o
> > =C2=A0lenovo-target-$(CONFIG_YT2_1380)	+=3D yoga-tab2-pro-1380-
> > fastcharger.o
> > -lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D wmi-camera.o
> > -lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+=3D wmi-capdata.o
> > -lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D wmi-events.o
> > -lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D wmi-helpers.o
> > -lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D wmi-gamezone.o
> > -lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+=3D wmi-other.o
> >=20
> > =C2=A0# Add 'lenovo' prefix to each module listed in lenovo-target-*
> > =C2=A0define LENOVO_OBJ_TARGET
> > --=20
> > 2.56.1
>=20
> Looks good to me.
> Will the MAINTAINERS file need updating?
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Mark

It's a good idea that the Lenovo WMI drivers codes are in one lenovo
directory for different architecture.
It's OK for me.
Reviewed-by: Jackie Dong <xy-jackie@139.com>
Jackie


