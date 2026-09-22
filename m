Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5244A6CD4;
	Tue, 22 Sep 2026 19:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106902; cv=none; b=j5bevIWPgu70n0Ar8rmMFtmKKKhejxxW9pkvrGVN8IMF5+lyqyF90ADYCGMQDxcCKJruFIPXHQzOQwyAdRm9XGiWMNxwQKTmvg2IKZbKmoOkddt5Sv86R41Sydz8wGeYDiYi3xpSsG4ft015wDv74O7gu7t+QzTlP1rQNhaUCH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106902; c=relaxed/simple;
	bh=ufBMvIgdqLrOUQ6lbrSaf7PWlvvqVxHqUtDs7rns+jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OblWiBAvs4om3KG0gN4FEQsF0Mbs1kGwev6S6oTv1nvljgAzxyY2Cdm/MXJ7wxjmeXMrzHiB4nN5/nshLjGCPCUp96Ky7LscmGnwHGs9jQIBRRamEobRDfavwJYgYxl1MIS3TEDDSkvaiogiKtchLCNvZBqRdxwwp1w6K+ZGR/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=NgRZs9j7; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="NgRZs9j7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1790106868; x=1790711668; i=w_armin@gmx.de;
	bh=AU9VlnKBv17qB9XzXj9ZrtQZ10FyGswWTOycJVL/zlg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=NgRZs9j7LgyDajdIH/VExB3WgcYTLf12PhjtRzcxgjdctLqzbWHk1KfCYncItiGd
	 QTeuqNpAB1GxikkG3RgRYfy1BmgxizMZx6U+MDUzUuwR7mG6VrTgZuhg8AXeb/0oY
	 6RTu2jsLya9pgYvfzn+5OYZdGTMWBCBrM26iQ0yQYZ8LM+dscioPjSzgrW8G1RZw4
	 zL9nYNeFRX6bB8pxRCfrekJsKKGq0w/cJx4n8QZf6VbOXaUX3GleWqkJWH2qqPdtl
	 wq0HuYNo+6eQfTu198M48GjG/T8ldoxitTuTisMwNKzOexljB4/f++lOV/5/jrWWZ
	 uZN6PxrG7NtOE3FWGQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9nxn-1x63lJ2hhF-0082ii; Tue, 22
 Sep 2026 21:54:28 +0200
Message-ID: <a66138d0-31d5-4dcf-bab6-2948d9cd68d4@gmx.de>
Date: Tue, 22 Sep 2026 21:54:25 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to
 wmi/asus
To: chipang_kao <prozac2734@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
 scardracs@disroot.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, chipang_kao <chipang_kao@asus.com>
References: <2384d8f5-106c-4cbd-a119-62d923725bf7@kernel.org>
 <20260922032157.120188-1-chipang_kao@asus.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260922032157.120188-1-chipang_kao@asus.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7QYp6PvXE8dsk8Ia9EuJlk/EitEWBJgmZXDR/2mEKkTf4neONzP
 FB85u7Gl2XdIShLDDaXRl5XpPPX6yvOWpWby5jPvlu2SVHqepx2m2jUGubAN7XwX08LfeVt
 0501lbN1niPTDcAgqRwxX3X5b2mexMXxTj9ff/FN8N99lzNIyxmyyYq0X/uFxc6TR+aPLcK
 /0dAfo0/U8Frea/NgJdDw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:aoOWQCgjpus=;5BHmKs6eLgCAc8DB0BRes37AZc5
 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
 NmCst2095v+DowkhKF8TmM440g==

Am 22.09.26 um 05:21 schrieb chipang_kao:

> ASUS WMI and related platform drivers currently reside under
> drivers/platform/x86/. However, with ARM64 devices utilizing ACPI WMI
> interfaces, maintaining these drivers exclusively under x86 creates
> unnecessary architectural restrictions and Kconfig duplications.
>
> To allow ARM64 architectures to build and utilize ASUS WMI drivers
> cleanly:
> 1. Relocate all ASUS WMI-based drivers and headers from
>     drivers/platform/x86/ to drivers/platform/wmi/asus/.
> 2. Create dedicated Kconfig and Makefile under
>     drivers/platform/wmi/asus/ and source them in
>     drivers/platform/wmi/Kconfig and Makefile.
> 3. Update drivers/platform/x86/Kconfig to remove duplicated entries
>     and source the unified WMI-based ASUS configuration.
>
> No functional code logic changes are introduced in this patch; this is
> a pure code relocation and build infrastructure refactoring.

Hi,

i am two minds about moving the Asus WMI drivers to drivers/platform/wmi/a=
sus,
because in my mind drivers/platform/wmi contains only code necessary for p=
roviding
access to ACPI-WMI objects. AFAIK the Asus WMI drivers are client drivers =
using the
WMI APIs to access WMI objects, not host drivers providing WMI objects.

Maybe moving the drivers to drivers/platform/asus would be better?

Thanks,
Armin Wolf

> Signed-off-by: chipang_kao <chipang_kao@asus.com>
> ---
>
> Changes in v3:
> - Refined the file relocation scope to target ONLY pure WMI-based
>    platform drivers (asus-wmi, asus-nb-wmi, and asus-armoury).
> - Retained non-WMI x86 platform drivers (such as asus-laptop,
>    asus-wireless, and asus-tf103c-dock) under drivers/platform/x86/.
> - Updated drivers/platform/wmi/asus/Kconfig and Makefile to only build
>    and export the relocated WMI components.
> - Dropped patch 1/2 from the original series as CONFIG_ACPI_WMI
>    dependency updates are handled by Armin's WMI refactoring series.
>
> Changes in v2:
> - Relocated ASUS platform drivers from drivers/platform/x86/ to
>    drivers/platform/wmi/asus/ to eliminate Kconfig duplication and
>    architectural restrictions for ARM64 platforms.
> - Updated MAINTAINERS file to reflect the new path.
>
>   MAINTAINERS                                   |  1 +
>   drivers/platform/wmi/Kconfig                  |  1 +
>   drivers/platform/wmi/Makefile                 |  1 +
>   drivers/platform/wmi/asus/Kconfig             | 64 +++++++++++++++++++
>   drivers/platform/wmi/asus/Makefile            |  9 +++
>   .../platform/{x86 =3D> wmi/asus}/asus-armoury.c |  0
>   .../platform/{x86 =3D> wmi/asus}/asus-armoury.h |  0
>   .../platform/{x86 =3D> wmi/asus}/asus-nb-wmi.c  |  0
>   drivers/platform/{x86 =3D> wmi/asus}/asus-wmi.c |  0
>   drivers/platform/{x86 =3D> wmi/asus}/asus-wmi.h |  0
>   drivers/platform/x86/Kconfig                  | 58 -----------------
>   drivers/platform/x86/Makefile                 |  3 -
>   12 files changed, 76 insertions(+), 61 deletions(-)
>   create mode 100644 drivers/platform/wmi/asus/Kconfig
>   create mode 100644 drivers/platform/wmi/asus/Makefile
>   rename drivers/platform/{x86 =3D> wmi/asus}/asus-armoury.c (100%)
>   rename drivers/platform/{x86 =3D> wmi/asus}/asus-armoury.h (100%)
>   rename drivers/platform/{x86 =3D> wmi/asus}/asus-nb-wmi.c (100%)
>   rename drivers/platform/{x86 =3D> wmi/asus}/asus-wmi.c (100%)
>   rename drivers/platform/{x86 =3D> wmi/asus}/asus-wmi.h (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cc3cae2e378b..2e4fa6812093 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4124,6 +4124,7 @@ M:	Denis Benato <denis.benato@linux.dev>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   W:	https://asus-linux.org/
> +F:	drivers/platform/wmi/asus/asus*.c
>   F:	drivers/platform/x86/asus*.c
>   F:	drivers/platform/x86/eeepc*.c
>  =20
> diff --git a/drivers/platform/wmi/Kconfig b/drivers/platform/wmi/Kconfig
> index d62f51ff3b7f..acce8e9b7264 100644
> --- a/drivers/platform/wmi/Kconfig
> +++ b/drivers/platform/wmi/Kconfig
> @@ -33,5 +33,6 @@ config ACPI_WMI_LEGACY_DEVICE_NAMES
>   	  the same GUID to fail in some corner cases.
>  =20
>   source "drivers/platform/wmi/tests/Kconfig"
> +source "drivers/platform/wmi/asus/Kconfig"
>  =20
>   endif # ACPI_WMI
> diff --git a/drivers/platform/wmi/Makefile b/drivers/platform/wmi/Makefi=
le
> index 2feff94a5594..305f4688324f 100644
> --- a/drivers/platform/wmi/Makefile
> +++ b/drivers/platform/wmi/Makefile
> @@ -6,6 +6,7 @@
>  =20
>   wmi-y			:=3D core.o marshalling.o string.o
>   obj-$(CONFIG_ACPI_WMI)	+=3D wmi.o
> +obj-$(CONFIG_ASUS_WMI) +=3D asus/
>  =20
>   # Unit tests
>   obj-y			+=3D tests/
> diff --git a/drivers/platform/wmi/asus/Kconfig b/drivers/platform/wmi/as=
us/Kconfig
> new file mode 100644
> index 000000000000..75b6dd45af66
> --- /dev/null
> +++ b/drivers/platform/wmi/asus/Kconfig
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Asus Platform Specific Drivers
> +#
> +
> +config ASUS_ARMOURY
> +	tristate "ASUS Armoury driver"
> +	depends on ASUS_WMI
> +	select FW_ATTR_CLASS
> +	help
> +	  Say Y here if you have a WMI aware Asus machine and would like to us=
e the
> +	  firmware_attributes API to control various settings typically expose=
d in
> +	  the ASUS Armoury Crate application available on Windows.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called asus-armoury.
> +
> +config ASUS_WMI
> +	tristate "ASUS WMI Driver"
> +	depends on ACPI_WMI
> +	depends on ACPI_BATTERY
> +	depends on INPUT
> +	depends on HWMON
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on RFKILL || RFKILL =3D n
> +	depends on HOTPLUG_PCI
> +	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> +	depends on SERIO_I8042 || SERIO_I8042 =3D n
> +	select INPUT_SPARSEKMAP
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	select ACPI_PLATFORM_PROFILE
> +	help
> +	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
> +	  Asus Notebooks).
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called asus-wmi.
> +
> +config ASUS_WMI_DEPRECATED_ATTRS
> +	bool "BIOS option support in WMI platform (DEPRECATED)"
> +	depends on ASUS_WMI
> +	default y
> +	help
> +	  Say Y to expose the configurable BIOS options through the asus-wmi
> +	  driver.
> +
> +	  This can be used with or without the asus-armoury driver which
> +	  has the same attributes, but more, and better features.
> +
> +config ASUS_NB_WMI
> +	tristate "Asus Notebook WMI Driver"
> +	depends on ASUS_WMI
> +	help
> +	  This is a driver for newer Asus notebooks. It adds extra features
> +	  like wireless radio and bluetooth control, leds, hotkeys, backlight.=
..
> +
> +	  For more information, see
> +	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
> +
> +	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
> +	  here.
> +
> +
> diff --git a/drivers/platform/wmi/asus/Makefile b/drivers/platform/wmi/a=
sus/Makefile
> new file mode 100644
> index 000000000000..8daa5ebff89f
> --- /dev/null
> +++ b/drivers/platform/wmi/asus/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for linux/drivers/platform/wmi/asus
> +# Asus Platform-Specific Drivers
> +#
> +
> +obj-$(CONFIG_ASUS_ARMOURY)	+=3D asus-armoury.o
> +obj-$(CONFIG_ASUS_WMI)		+=3D asus-wmi.o
> +obj-$(CONFIG_ASUS_NB_WMI)	+=3D asus-nb-wmi.o
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/wmi/=
asus/asus-armoury.c
> similarity index 100%
> rename from drivers/platform/x86/asus-armoury.c
> rename to drivers/platform/wmi/asus/asus-armoury.c
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/wmi/=
asus/asus-armoury.h
> similarity index 100%
> rename from drivers/platform/x86/asus-armoury.h
> rename to drivers/platform/wmi/asus/asus-armoury.h
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/wmi/a=
sus/asus-nb-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/asus-nb-wmi.c
> rename to drivers/platform/wmi/asus/asus-nb-wmi.c
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/wmi/asus=
/asus-wmi.c
> similarity index 100%
> rename from drivers/platform/x86/asus-wmi.c
> rename to drivers/platform/wmi/asus/asus-wmi.c
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/wmi/asus=
/asus-wmi.h
> similarity index 100%
> rename from drivers/platform/x86/asus-wmi.h
> rename to drivers/platform/wmi/asus/asus-wmi.h
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 957034f39e4e..68cf99de415d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -253,64 +253,6 @@ config ASUS_WIRELESS
>   	  If you choose to compile this driver as a module the module will be
>   	  called asus-wireless.
>  =20
> -config ASUS_ARMOURY
> -	tristate "ASUS Armoury driver"
> -	depends on ASUS_WMI
> -	select FW_ATTR_CLASS
> -	help
> -	  Say Y here if you have a WMI aware Asus machine and would like to us=
e the
> -	  firmware_attributes API to control various settings typically expose=
d in
> -	  the ASUS Armoury Crate application available on Windows.
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called asus-armoury.
> -
> -config ASUS_WMI
> -	tristate "ASUS WMI Driver"
> -	depends on ACPI_WMI
> -	depends on ACPI_BATTERY
> -	depends on INPUT
> -	depends on HWMON
> -	depends on BACKLIGHT_CLASS_DEVICE
> -	depends on RFKILL || RFKILL =3D n
> -	depends on HOTPLUG_PCI
> -	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> -	depends on SERIO_I8042 || SERIO_I8042 =3D n
> -	select INPUT_SPARSEKMAP
> -	select LEDS_CLASS
> -	select NEW_LEDS
> -	select ACPI_PLATFORM_PROFILE
> -	help
> -	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
> -	  Asus Notebooks).
> -
> -	  To compile this driver as a module, choose M here: the module will
> -	  be called asus-wmi.
> -
> -config ASUS_WMI_DEPRECATED_ATTRS
> -	bool "BIOS option support in WMI platform (DEPRECATED)"
> -	depends on ASUS_WMI
> -	default y
> -	help
> -	  Say Y to expose the configurable BIOS options through the asus-wmi
> -	  driver.
> -
> -	  This can be used with or without the asus-armoury driver which
> -	  has the same attributes, but more, and better features.
> -
> -config ASUS_NB_WMI
> -	tristate "Asus Notebook WMI Driver"
> -	depends on ASUS_WMI
> -	help
> -	  This is a driver for newer Asus notebooks. It adds extra features
> -	  like wireless radio and bluetooth control, leds, hotkeys, backlight.=
..
> -
> -	  For more information, see
> -	  <file:Documentation/ABI/testing/sysfs-platform-asus-wmi>
> -
> -	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
> -	  here.
> -
>   config ASUS_TF103C_DOCK
>   	tristate "Asus TF103C 2-in-1 keyboard dock"
>   	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 872ac3842391..0bacd55f2fce 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -33,9 +33,6 @@ obj-$(CONFIG_APPLE_GMUX)	+=3D apple-gmux.o
>   # ASUS
>   obj-$(CONFIG_ASUS_LAPTOP)	+=3D asus-laptop.o
>   obj-$(CONFIG_ASUS_WIRELESS)	+=3D asus-wireless.o
> -obj-$(CONFIG_ASUS_ARMOURY)	+=3D asus-armoury.o
> -obj-$(CONFIG_ASUS_WMI)		+=3D asus-wmi.o
> -obj-$(CONFIG_ASUS_NB_WMI)	+=3D asus-nb-wmi.o
>   obj-$(CONFIG_ASUS_TF103C_DOCK)	+=3D asus-tf103c-dock.o
>   obj-$(CONFIG_EEEPC_LAPTOP)	+=3D eeepc-laptop.o
>   obj-$(CONFIG_EEEPC_WMI)		+=3D eeepc-wmi.o
