Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795294415;
	b=SinE0/uDhO3w6x/FqrrkrUCCeltmx81RyYYKm2H36erLLCcaY/BUZGMJCMhnQSyiy9ox
	 EBFURYTHjSwEDXyGZNqypzzC9qcpBiBumFB4YID6tQtTue6Na/CUH2JMUMF8wWiTR+kJb
	 RaUMMdVH+i2Y3OMKLgzYQJhAgUW++CKvdrYtyVwVt0/N7dvm+3xiPO64txGwUj1RuU9ft
	 VhvvQeyFT+se2K5490MDyGdvg99bk21p3QgM1gH2zIMAdLwxPdjnbQz++VyUKOq2o2Y8p
	 NbywDkI2CPYrJsvovFnZUUmKRNztpTMwadPvIeTsPvRfRWOCxrD6P8EPpDYT0+yOeiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294415;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:CC:Subject:
	 User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=HlM4jF/x6hA6V8OkLoDIBG0Rm2clXsT/0jFcnlaxhLM=;
	b=1sktvmKDzxUc5FDjIj55g7TNws4sVBYS23trs+tkhCKTMXfOMCOg2S+0L3oc+qU842D7
	 +0uHafEYwd0z31Yo+4YP6aeoGdUvFWnQmiLY1G9MatoVTmReCM+viFRV+rqh7ZXY05CrV
	 xxh4+p5PXOB7S3CDWEhZleQehvQUQEHhfpMRjv/KEnC3b2Y8w+ozbnGrbgbvbrRPJwcep
	 GQ6VUeksIDBSNwXTwC9Ycd8i5N9oYMranHWufn1ztdPeXiP4Nq3ZIeRnb0XR0BUqHaT5U
	 8GGCB8aaJ1UswN9bSn9ov+3FVB75kUfLmb5B0A2g9VfEBnh8nSEEvKaaPneYjJWCZWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ScoQPHsY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC13606A320;
	Sat, 21 Nov 2026 20:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BC13606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ScoQPHsY
ARC-Seal: i=1; a=rsa-sha256; t=1795294399; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oBXhIVx1/rvITpt4jkAos/Fm8aZJwy8C5uY+CghzcWD2JS54/6qyPZDp9BE3+gx902J5rPMU6LIIEKOa+K7RyY+iJFqrfIrnCSxqm2ZftBaFkb+bYTd7NvfuWDHxmorrXXBgj2SzqwumPYAl7tzmmVJd0J4u03qU+Co96tnpPMM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795294399; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HlM4jF/x6hA6V8OkLoDIBG0Rm2clXsT/0jFcnlaxhLM=; 
	b=ke+1BeHFdQZaj5UI1t9ie9LuUKMDbfIp2Wggj4PqsB811pHAGlr2BQKBE0JtaFbCX70IgoliFQP7OuHd8pV26iNslTA0zdII/4wV0X+TP9rzGdUfXWoTl0lhdOlKYBg+jKKPfz/Gd5ODnuBw+GjQfnsUsylobB4EOIehkTj7cGw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=ScoQPHsYEUqBLvlugJpnVKViTi9EcG4PUh3Phv7sx13GStKFQAtBm06cGHXdIANMydQZOHJ4mRppQY8V+ZwRaRwiP6u9ENADENTZZEAfatyV1suhrmw7kxrlloEKk6pRweh9X4Bogc8EIJDInrGCwu0IGlRdgkPZBNarPawBsl62OTVM6l/OAbVCmtNsA4fSHBF8oQI88fgEC65d15X+foP3q5uF7Tttr3MRkJAfbJ3fezfZcmuj0iPJ7L9R18StkOb8VG496xD7ZXFqZ+hl7AHHalMLco/kMhW0qmCgMfiaNUl+O/P8e/0D7sFej0mjyhqNydV4cVk/HgdH+pdTIQ==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=HlM4jF/x6hA6V8OkLoDIBG0Rm2clXsT/0jFcnlaxhLM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795294396594399.64373154139935;
	Sat, 21 Nov 2026 12:53:16 -0800 (PST)
Date: Sun, 22 Nov 2026 04:53:08 +0800
From: Rong Zhang <i@rong.moe>
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
CC: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, xy-jackie@139.com,
 marco_giunta@outlook.it, ldemarchi@nvidia.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/3=5D_platform=3A_lenovo=3A_add_WMI_?=
 =?US-ASCII?Q?Fn_keys_driver_and_use_it_from_ideapad-laptop?=
User-Agent: Thunderbird for Android
In-Reply-To: <20ef843b4703e265482f7ea339d72217ce48158e.camel@rong.moe>
References: <20261119022719.3089229-1-dcemin@nvidia.com> <20261121033322.974635-1-dcemin@nvidia.com> <20261121033322.974635-3-dcemin@nvidia.com> <20ef843b4703e265482f7ea339d72217ce48158e.camel@rong.moe>
Message-ID: <B2ADF337-6C2B-43C9-971A-F17378B24DA9@rong.moe>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Hi David,

=E4=BA=8E 2026=E5=B9=B411=E6=9C=8821=E6=97=A5 GMT+08:00 18:42:04=EF=BC=8CR=
ong Zhang <i@rong=2Emoe> =E5=86=99=E9=81=93=EF=BC=9A
> Hi David,
>=20
> Thanks for your work=2E
>=20
> On Fri, 2026-11-20 at 19:33 -0800, David Cemin wrote:
> > Lenovo consumer laptops deliver their vendor specific Fn keys
> > (microphone mute, airplane mode, performance mode, the star key and
> > others) as WMI events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294, an=
d
> > the older Yoga models report Fn+Esc on two event GUIDs that carry no
> > data=2E ideapad-laptop handles all of them today, but it is an x86 onl=
y
> > driver built on the VPC ACPI device and the i8042 controller, and the
> > new arm64 Lenovo laptops expose the Fn key GUID without any of that=2E
> >=20
> > Add a Lenovo WMI Fn keys driver that owns the three event GUIDs on
> > every architecture and reports the keys through a sparse keymap=2E The
> > keymap, the scan codes (the Fn key codes offset by 0x100, Fn+Esc as
> > 128) and the input device name are taken over from ideapad-laptop, so
> > the events userspace sees do not change and the existing hwdb mappings
> > keep applying=2E The one difference is 0x3d, which now reports
> > KEY_PERFORMANCE instead of KEY_PROG4=2E A notifier chain lets drivers
> > with platform knowledge act on an event before the key is reported and
> > suppress it with NOTIFY_STOP=2E
> >=20
> > Make ideapad-laptop drop its WMI event driver and keymap entries and
> > subscribe to that notifier instead=2E The callback keeps the two platf=
orm
> > specific behaviours: it refreshes the Fn lock LED from the EC on every
> > Fn key event, and on the performance button it cycles the platform
> > profile through DYTC and consumes the event, as before=2E The notifier=
 is
> > unregistered before the DYTC and LED teardown in remove() and on the
> > probe error paths=2E Both changes land in one patch because with the n=
ew
> > driver present but ideapad-laptop unchanged, both drivers would bind
> > the same WMI devices=2E
> >=20
> > ideapad-laptop implies LENOVO_WMI_FN_KEYS so that existing
> > configurations keep the Fn keys on a config update, and uses
> > IS_REACHABLE() to tolerate the driver being a module while
> > ideapad-laptop is built in, in which case the keys are still reported
> > by the Fn keys driver and only the VPC specific handling is lost=2E
> >=20
> > Tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone mute, airplane
> > mode, the Smart Key, the Smart Connect key and the Fn+Q performance ke=
y
> > report input events=2E The Esc event GUIDs are not exposed by that
> > firmware, so that path is compile tested only, as is ideapad-laptop=2E
> >=20
> > Signed-off-by: David Cemin <dcemin@nvidia=2Ecom>
>=20
> The patch now looks quite good to me, except for some minor issues=2E Se=
e
> below=2E
>=20
> > ---
> >  MAINTAINERS                                   |   8 +
> >  drivers/platform/lenovo/Kconfig               |  15 +
> >  drivers/platform/lenovo/Makefile              |   1 +
> >  drivers/platform/lenovo/wmi-fn-keys=2Ec         | 280 +++++++++++++++=
+++
> >  drivers/platform/x86/lenovo/Kconfig           |   2 +-
> >  drivers/platform/x86/lenovo/ideapad-laptop=2Ec  | 227 +++-----------
> >  =2E=2E=2E/linux/platform_data/lenovo-wmi-fn-keys=2Eh  |  32 ++
> >  7 files changed, 386 insertions(+), 179 deletions(-)
> >  create mode 100644 drivers/platform/lenovo/wmi-fn-keys=2Ec
> >  create mode 100644 include/linux/platform_data/lenovo-wmi-fn-keys=2Eh
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3b0ad5a3debe=2E=2Ee2be0b7debeb 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15173,6 +15173,14 @@ F:	Documentation/wmi/devices/lenovo-wmi-other=
=2Erst
> >  F:	drivers/platform/lenovo/
> >  F:	drivers/platform/x86/lenovo/*
> > =20
> > +LENOVO WMI FN KEYS DRIVER
> > +M:	David Cemin <dcemin@nvidia=2Ecom>
> > +M:	Rong Zhang <i@rong=2Emoe>
> > +L:	platform-driver-x86@vger=2Ekernel=2Eorg
> > +S:	Maintained
> > +F:	drivers/platform/lenovo/wmi-fn-keys=2Ec
> > +F:	include/linux/platform_data/lenovo-wmi-fn-keys=2Eh
> > +
> >  LENOVO WMI HOTKEY UTILITIES DRIVER
> >  M:	Jackie Dong <xy-jackie@139=2Ecom>
> >  L:	platform-driver-x86@vger=2Ekernel=2Eorg
> > diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo=
/Kconfig
> > index 8222322ca671=2E=2Ef67f7c811214 100644
> > --- a/drivers/platform/lenovo/Kconfig
> > +++ b/drivers/platform/lenovo/Kconfig
> > @@ -41,6 +41,21 @@ config LENOVO_WMI_HOTKEY_UTILITIES
> >  	  such as LED control for audio/mic mute event for Ideapad, YOGA, Xi=
aoXin,
> >  	  Gaming, ThinkBook and so on=2E
> > =20
> > +config LENOVO_WMI_FN_KEYS
> > +	tristate "Lenovo WMI Fn keys driver"
> > +	depends on ACPI_WMI
> > +	depends on INPUT
> > +	select INPUT_SPARSEKMAP
> > +	help
> > +	  Say Y or M here to enable the vendor specific Fn keys (microphone
> > +	  mute, airplane mode, performance mode, star key, Fn+Esc, etc=2E) o=
n
> > +	  Lenovo laptops that deliver them as WMI events=2E ideapad-laptop
> > +	  subscribes to this driver for its Fn lock LED and performance mode
> > +	  handling=2E
> > +
> > +	  To compile this driver as a module, choose M here: the module will
> > +	  be called lenovo-wmi-fn-keys=2E
> > +
> >  config LENOVO_WMI_CAMERA
> >  	tristate "Lenovo WMI Camera Button driver"
> >  	depends on ACPI_WMI
> > diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenov=
o/Makefile
> > index 1cac115dd735=2E=2E8ea207e79a43 100644
> > --- a/drivers/platform/lenovo/Makefile
> > +++ b/drivers/platform/lenovo/Makefile
> > @@ -8,6 +8,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D wmi-he=
lpers=2Eo
> >  lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D wmi-events=2Eo
> >  lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+=3D wmi-capdata=2Eo
> >  lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D wmi-hotkey-u=
tilities=2Eo
> > +lenovo-target-$(CONFIG_LENOVO_WMI_FN_KEYS)	+=3D wmi-fn-keys=2Eo
> >  lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D wmi-camera=2Eo
> >  lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D wmi-gamezone=2Eo
> >  lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+=3D wmi-other=2Eo
> > diff --git a/drivers/platform/lenovo/wmi-fn-keys=2Ec b/drivers/platfor=
m/lenovo/wmi-fn-keys=2Ec
> > new file mode 100644
> > index 000000000000=2E=2E330de9529a87
> > --- /dev/null
> > +++ b/drivers/platform/lenovo/wmi-fn-keys=2Ec
> > @@ -0,0 +1,280 @@
> > +// SPDX-License-Identifier: GPL-2=2E0-only
> > +/*
> > + * Lenovo WMI Fn keys driver
> > + *
> > + * Lenovo consumer laptops deliver their vendor specific Fn keys (mic=
rophone
> > + * mute, airplane mode, performance mode, the star key and others) as=
 WMI
> > + * events on a dedicated GUID instead of keyboard usages, and the old=
er Yoga
> > + * models report Fn+Esc on two event GUIDs that carry no data=2E This=
 driver
> > + * owns these event GUIDs on every architecture and reports the keys =
through
> > + * a sparse keymap=2E Drivers with platform knowledge, such as ideapa=
d-laptop,
> > + * subscribe to the notifier chain to act on an event and may stop th=
e key
> > + * from being reported=2E
> > + *
> > + * The keymap and the scan codes were moved here from ideapad-laptop,=
 so the
> > + * input events are the same as before for userspace=2E
> > + */
> > +
> > +#include <linux/device=2Eh>
> > +#include <linux/export=2Eh>
> > +#include <linux/input=2Eh>
> > +#include <linux/input/sparse-keymap=2Eh>
> > +#include <linux/module=2Eh>
> > +#include <linux/notifier=2Eh>
> > +#include <linux/platform_data/lenovo-wmi-fn-keys=2Eh>
> > +#include <linux/types=2Eh>
> > +#include <linux/wmi=2Eh>
> > +
> > +#include <asm/byteorder=2Eh>
> > +
> > +#define LWMI_FN_KEYS_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
> > +#define LWMI_ESC_GUID_YOGA3	"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6"
> > +#define LWMI_ESC_GUID_YOGA700	"56322276-8493-4CE8-A783-98C991274F5E"
> > +
> > +/*
> > + * Scan codes as ideapad-laptop reported them: the Fn key event codes=
 are
> > + * offset by LWMI_FN_KEY so they do not collide with the ACPI hotkeys=
 of that
> > + * driver, and the Fn+Esc events, which carry no data, use scan code =
128=2E
> > + */
> > +#define LWMI_FN_KEY		0x100
> > +#define LWMI_ESC_SCANCODE	128
> > +
> > +/**
> > + * struct lwmi_fn_keys_info - per event GUID description
> > + * @event: event type passed to the notifier chain
> > + * @phys: physical path of the input device
> > + * @event_size: size of the WMI event data, 0 when the GUID carries n=
one
> > + * @code: scan code base: the offset added to the event data, or the =
whole
> > + *        scan code for GUIDs without event data
> > + * @keymap: sparse keymap for the input device
> > + */
> > +struct lwmi_fn_keys_info {
> > +	enum lwmi_fn_keys_event event;
> > +	const char *phys;
> > +	size_t event_size;
> > +	u32 code;
> > +	const struct key_entry *keymap;
> > +};
> > +
> > +struct lwmi_fn_keys {
> > +	struct input_dev *input;
> > +	const struct lwmi_fn_keys_info *info;
> > +};
> > +
> > +static BLOCKING_NOTIFIER_HEAD(lwmi_fn_keys_chain);
> > +
> > +static const struct key_entry lwmi_fn_keys_keymap[] =3D {
>=20
> Let's add a separator here, like:
>=20
>    /*
>     * WMI ignored events
>     */
>=20
> > +	/* FnLock (handled by the firmware) */
> > +	{ KE_IGNORE,	0x02 | LWMI_FN_KEY },
> > +	/* Esc (handled by the firmware) */
> > +	{ KE_IGNORE,	0x03 | LWMI_FN_KEY },
>=20
> Ditto, like ideapad-laptop originally did:
>=20
>    /*
>     * WMI keys
>     */
>=20
> > +
> > +	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> > +	{ KE_KEY,	0x01 | LWMI_FN_KEY, { KEY_FAVORITES } },
> > +	{ KE_KEY,	0x04 | LWMI_FN_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> > +	/* Lenovo Support */
> > +	{ KE_KEY,	0x07 | LWMI_FN_KEY, { KEY_HELP } },
> > +	{ KE_KEY,	0x0e | LWMI_FN_KEY, { KEY_PICKUP_PHONE } },
> > +	{ KE_KEY,	0x0f | LWMI_FN_KEY, { KEY_HANGUP_PHONE } },
> > +	/* Refresh Rate Toggle (Fn+R) */
> > +	{ KE_KEY,	0x10 | LWMI_FN_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> > +	/* Dark mode toggle */
> > +	{ KE_KEY,	0x13 | LWMI_FN_KEY, { KEY_PROG1 } },
> > +	/* Sound profile switch */
> > +	{ KE_KEY,	0x12 | LWMI_FN_KEY, { KEY_PROG2 } },
> > +	/* Lenovo Virtual Background application */
> > +	{ KE_KEY,	0x28 | LWMI_FN_KEY, { KEY_PROG3 } },
> > +	/* Lenovo Support */
> > +	{ KE_KEY,	0x27 | LWMI_FN_KEY, { KEY_HELP } },
> > +	/* Refresh Rate Toggle */
> > +	{ KE_KEY,	0x0a | LWMI_FN_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> > +	/* Specific to some newer models */
> > +	{ KE_KEY,	0x3e | LWMI_FN_KEY, { KEY_MICMUTE } },
> > +	{ KE_KEY,	0x3f | LWMI_FN_KEY, { KEY_RFKILL } },
> > +	/* Star- (User Assignable Key) */
> > +	{ KE_KEY,	0x44 | LWMI_FN_KEY, { KEY_PROG1 } },
> > +	/* Eye */
> > +	{ KE_KEY,	0x45 | LWMI_FN_KEY, { KEY_PROG3 } },
> > +	/* Lenovo Smart Connect */
> > +	{ KE_KEY,	0x48 | LWMI_FN_KEY, { KEY_LINK_PHONE } },
> > +	/*
> > +	 * Performance toggle also Fn+Q, consumed by ideapad-laptop through =
the
> > +	 * notifier chain on machines where it cycles the platform profile
> > +	 */
> > +	{ KE_KEY,	0x3d | LWMI_FN_KEY, { KEY_PERFORMANCE } },
> > +	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile=
 */
> > +	{ KE_KEY,	0x46 | LWMI_FN_KEY, { KEY_PROG4 } },
> > +	/* shift + prtsc */
> > +	{ KE_KEY,	0x2d | LWMI_FN_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> > +	{ KE_KEY,	0x29 | LWMI_FN_KEY, { KEY_TOUCHPAD_TOGGLE } },
> > +	{ KE_KEY,	0x2a | LWMI_FN_KEY, { KEY_ROOT_MENU } },
> > +
> > +	/*
> > +	 * WMI switches
> > +	 *
> > +	 * Some devices come with physical switches=2E Whenever a switch is
> > +	 * toggled, an WMI event is emitted to inform the software about the
> > +	 * switch's latest state=2E
> > +	 */
> > +
> > +	/* Camera switch */
> > +	{ KE_SW,	0x0c | LWMI_FN_KEY, =2Esw =3D { SW_CAMERA_LENS_COVER, 0 } }=
,
> > +	{ KE_SW,	0x0d | LWMI_FN_KEY, =2Esw =3D { SW_CAMERA_LENS_COVER, 1 } }=
,
> > +
> > +	{ KE_END }
> > +};
> > +
> > +static const struct key_entry lwmi_esc_keymap[] =3D {
> > +	{ KE_KEY,	LWMI_ESC_SCANCODE, { KEY_ESC } },
> > +	{ KE_END }
> > +};
> > +
> > +static const struct lwmi_fn_keys_info lwmi_fn_keys_info_fn_keys =3D {
> > +	=2Eevent =3D LWMI_FN_KEYS_EVENT_FN_KEY,
> > +	=2Ephys =3D "wmi/input0",
> > +	=2Eevent_size =3D sizeof(u32),
> > +	=2Ecode =3D LWMI_FN_KEY,
> > +	=2Ekeymap =3D lwmi_fn_keys_keymap,
> > +};
> > +
> > +static const struct lwmi_fn_keys_info lwmi_fn_keys_info_esc =3D {
> > +	=2Eevent =3D LWMI_FN_KEYS_EVENT_ESC,
> > +	=2Ephys =3D "wmi/input1",
> > +	=2Ecode =3D LWMI_ESC_SCANCODE,
> > +	=2Ekeymap =3D lwmi_esc_keymap,
> > +};
> > +
> > +/**
> > + * lwmi_fn_keys_register_notifier() - Subscribe to the Fn key events=
=2E
> > + * @nb: The notifier_block to register=2E
> > + *
> > + * The callback runs in process context with the &enum lwmi_fn_keys_e=
vent as
> > + * the action and, for LWMI_FN_KEYS_EVENT_FN_KEY, a pointer to the u3=
2 key
> > + * code as the data=2E Return NOTIFY_STOP from the callback to consum=
e the event
> > + * so that no key is reported=2E
> > + *
> > + * Return: 0 on success, or a negative error code=2E
> > + */
> > +int lwmi_fn_keys_register_notifier(struct notifier_block *nb)
> > +{
> > +	return blocking_notifier_chain_register(&lwmi_fn_keys_chain, nb);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_fn_keys_register_notifier, "LENOVO_WMI_FN_K=
EYS");
> > +
> > +/**
> > + * lwmi_fn_keys_unregister_notifier() - Unsubscribe from the Fn key e=
vents=2E
> > + * @nb: The notifier_block to unregister=2E
> > + *
> > + * Return: 0 on success, or a negative error code=2E
> > + */
> > +int lwmi_fn_keys_unregister_notifier(struct notifier_block *nb)
> > +{
> > +	return blocking_notifier_chain_unregister(&lwmi_fn_keys_chain, nb);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(lwmi_fn_keys_unregister_notifier, "LENOVO_WMI_FN=
_KEYS");
> > +
> > +static void devm_lwmi_fn_keys_unregister_notifier(void *data)
> > +{
> > +	lwmi_fn_keys_unregister_notifier(data);
> > +}
> > +
> > +/**
> > + * devm_lwmi_fn_keys_register_notifier() - Device managed subscriptio=
n=2E
> > + * @dev: The device whose lifetime bounds the subscription=2E
> > + * @nb: The notifier_block to register=2E
> > + *
> > + * Return: 0 on success, or a negative error code=2E
> > + */
> > +int devm_lwmi_fn_keys_register_notifier(struct device *dev, struct no=
tifier_block *nb)
> > +{
> > +	int ret;
> > +
> > +	ret =3D lwmi_fn_keys_register_notifier(nb);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return devm_add_action_or_reset(dev, devm_lwmi_fn_keys_unregister_no=
tifier, nb);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(devm_lwmi_fn_keys_register_notifier, "LENOVO_WMI=
_FN_KEYS");
> > +
> > +static int lwmi_fn_keys_probe(struct wmi_device *wdev, const void *co=
ntext)
> > +{
> > +	struct lwmi_fn_keys *priv;
> > +	int ret;
> > +
> > +	priv =3D devm_kzalloc_obj(&wdev->dev, *priv);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->info =3D context;
> > +
> > +	priv->input =3D devm_input_allocate_device(&wdev->dev);
> > +	if (!priv->input)
> > +		return -ENOMEM;
> > +
> > +	/*
> > +	 * Same name as the ideapad-laptop input device so that the existing
> > +	 * hwdb keyboard mappings for these keys keep applying=2E
> > +	 */
> > +	priv->input->name =3D "Ideapad extra buttons";
> > +	priv->input->phys =3D priv->info->phys;
> > +	priv->input->id=2Ebustype =3D BUS_HOST;
> > +	priv->input->dev=2Eparent =3D &wdev->dev;
> > +
> > +	ret =3D sparse_keymap_setup(priv->input, priv->info->keymap, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	dev_set_drvdata(&wdev->dev, priv);
> > +
> > +	return input_register_device(priv->input);
> > +}
> > +
> > +static void lwmi_fn_keys_notify(struct wmi_device *wdev, const struct=
 wmi_buffer *buf)
> > +{
> > +	struct lwmi_fn_keys *priv =3D dev_get_drvdata(&wdev->dev);
> > +	const struct lwmi_fn_keys_info *info =3D priv->info;
> > +	u32 code =3D 0;
> > +	int ret;
> > +
> > +	if (buf->length < info->event_size) {
> > +		dev_dbg(&wdev->dev, "short event (%zu bytes)\n", buf->length);
> > +		return;
> > +	}
> > +
> > +	if (info->event_size)
> > +		code =3D le32_to_cpup(buf->data);
> > +
> > +	dev_dbg(&wdev->dev, "event %d code 0x%x\n", info->event, code);
> > +
> > +	ret =3D blocking_notifier_call_chain(&lwmi_fn_keys_chain, info->even=
t, &code);
> > +	if (ret & NOTIFY_STOP_MASK)
> > +		return;
> > +
> > +	if (!sparse_keymap_report_event(priv->input, info->code | code, 1, t=
rue))
> > +		dev_info_ratelimited(&wdev->dev, "unknown key code 0x%x\n", code);
> > +}
> > +
> > +static const struct wmi_device_id lwmi_fn_keys_id_table[] =3D {
> > +	{ LWMI_FN_KEYS_GUID, &lwmi_fn_keys_info_fn_keys },
> > +	{ LWMI_ESC_GUID_YOGA3, &lwmi_fn_keys_info_esc },
> > +	{ LWMI_ESC_GUID_YOGA700, &lwmi_fn_keys_info_esc },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(wmi, lwmi_fn_keys_id_table);
> > +
> > +static struct wmi_driver lwmi_fn_keys_driver =3D {
> > +	=2Edriver =3D {
> > +		=2Ename =3D "lenovo-wmi-fn-keys",
> > +		=2Eprobe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +	},
> > +	=2Eid_table =3D lwmi_fn_keys_id_table,
> > +	=2Eprobe =3D lwmi_fn_keys_probe,
> > +	=2Enotify_new =3D lwmi_fn_keys_notify,
> > +	=2Eno_singleton =3D true,
> > +};
> > +module_wmi_driver(lwmi_fn_keys_driver);
> > +
> > +MODULE_AUTHOR("David Cemin <dcemin@nvidia=2Ecom>");
> > +MODULE_DESCRIPTION("Lenovo WMI Fn keys driver");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x8=
6/lenovo/Kconfig
> > index 4d9a25d0e3b5=2E=2E8a11c981241c 100644
> > --- a/drivers/platform/x86/lenovo/Kconfig
> > +++ b/drivers/platform/x86/lenovo/Kconfig
> > @@ -11,7 +11,7 @@ config IDEAPAD_LAPTOP
> >  	depends on SERIO_I8042
> >  	depends on BACKLIGHT_CLASS_DEVICE
> >  	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> > -	depends on ACPI_WMI || ACPI_WMI =3D n
> > +	imply LENOVO_WMI_FN_KEYS
>=20
> Unconditionally implying LENOVO_WMI_FN_KEYS is broken=2E See
> Documentation/kbuild/kconfig-language=2Erst:
>=20
> 	select should be used with care=2E select will force
> 	a symbol to a value without visiting the dependencies=2E
> 	By abusing select you are able to select a symbol FOO even
> 	if FOO depends on BAR that is not set=2E
>=20
> (which also applies to `imply')
>=20
> In general, you can only select or imply a symbol when you've collected
> all its dependencies=2E That's why I suggested
>=20
>    imply LENOVO_WMI_FN_KEYS if ACPI_WMI
>=20
> in my previous reply=2E

Please ignore this=2E I must have lost my mind when I wrote this=2E Sorry =
for
the confusion=2E

Other suggestions still apply=2E

Thanks,
Rong

>=20
> >  	select ACPI_PLATFORM_PROFILE
> >  	select INPUT_SPARSEKMAP
> >  	select NEW_LEDS
> > diff --git a/drivers/platform/x86/lenovo/ideapad-laptop=2Ec b/drivers/=
platform/x86/lenovo/ideapad-laptop=2Ec
> > index f9453de6df76=2E=2E92d05470dee9 100644
> > --- a/drivers/platform/x86/lenovo/ideapad-laptop=2Ec
> > +++ b/drivers/platform/x86/lenovo/ideapad-laptop=2Ec
> > @@ -34,7 +34,7 @@
> >  #include <linux/string_choices=2Eh>
> >  #include <linux/sysfs=2Eh>
> >  #include <linux/types=2Eh>
> > -#include <linux/wmi=2Eh>
> > +#include <linux/platform_data/lenovo-wmi-fn-keys=2Eh>
> >  #include "ideapad-laptop=2Eh"
> > =20
> >  #include <acpi/battery=2Eh>
> > @@ -185,6 +185,7 @@ struct ideapad_private {
> >  	struct input_dev *inputdev;
> >  	struct backlight_device *blightdev;
> >  	struct ideapad_dytc_priv *dytc;
> > +	struct notifier_block fn_keys_nb;
> >  	struct dentry *debug;
> >  	struct acpi_battery_hook battery_hook;
> >  	const struct power_supply_ext *battery_ext;
> > @@ -1317,8 +1318,6 @@ static void ideapad_unregister_rfkill(struct ide=
apad_private *priv, int dev)
> >  /*
> >   * input device
> >   */
> > -#define IDEAPAD_WMI_KEY 0x100
> > -
> >  static const struct key_entry ideapad_keymap[] =3D {
> >  	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
> >  	{ KE_KEY,   7, { KEY_CAMERA } },
> > @@ -1331,65 +1330,6 @@ static const struct key_entry ideapad_keymap[] =
=3D {
> >  	{ KE_KEY,  65, { KEY_PROG4 } },
> >  	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
> >  	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
> > -	{ KE_KEY, 128, { KEY_ESC } },
> > -
> > -	/*
> > -	 * WMI keys
> > -	 */
> > -
> > -	/* FnLock (handled by the firmware) */
> > -	{ KE_IGNORE,	0x02 | IDEAPAD_WMI_KEY },
> > -	/* Esc (handled by the firmware) */
> > -	{ KE_IGNORE,	0x03 | IDEAPAD_WMI_KEY },
> > -	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> > -	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
> > -	{ KE_KEY,	0x04 | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> > -	/* Lenovo Support */
> > -	{ KE_KEY,	0x07 | IDEAPAD_WMI_KEY, { KEY_HELP } },
> > -	{ KE_KEY,	0x0e | IDEAPAD_WMI_KEY, { KEY_PICKUP_PHONE } },
> > -	{ KE_KEY,	0x0f | IDEAPAD_WMI_KEY, { KEY_HANGUP_PHONE } },
> > -	/* Refresh Rate Toggle (Fn+R) */
> > -	{ KE_KEY,	0x10 | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> > -	/* Dark mode toggle */
> > -	{ KE_KEY,	0x13 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> > -	/* Sound profile switch */
> > -	{ KE_KEY,	0x12 | IDEAPAD_WMI_KEY, { KEY_PROG2 } },
> > -	/* Lenovo Virtual Background application */
> > -	{ KE_KEY,	0x28 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> > -	/* Lenovo Support */
> > -	{ KE_KEY,	0x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
> > -	/* Refresh Rate Toggle */
> > -	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> > -	/* Specific to some newer models */
> > -	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
> > -	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> > -	/* Star- (User Assignable Key) */
> > -	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> > -	/* Eye */
> > -	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> > -	/* Lenovo Smart Connect */
> > -	{ KE_KEY,	0x48 | IDEAPAD_WMI_KEY, { KEY_LINK_PHONE } },
> > -	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify()=
 */
> > -	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> > -	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile=
 */
> > -	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> > -	/* shift + prtsc */
> > -	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> > -	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> > -	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
> > -
> > -	/*
> > -	 * WMI switches
> > -	 *
> > -	 * Some devices come with physical switches=2E Whenever a switch is
> > -	 * toggled, an WMI event is emitted to inform the software about the
> > -	 * switch's latest state=2E
> > -	 */
> > -
> > -	/* Camera switch */
> > -	{ KE_SW,	0x0c | IDEAPAD_WMI_KEY, =2Esw =3D { SW_CAMERA_LENS_COVER, 0=
 } },
> > -	{ KE_SW,	0x0d | IDEAPAD_WMI_KEY, =2Esw =3D { SW_CAMERA_LENS_COVER, 1=
 } },
> > -
> >  	{ KE_END },
> >  };
> > =20
> > @@ -2297,49 +2237,24 @@ static int ideapad_check_features(struct ideap=
ad_private *priv)
> >  	return 0;
> >  }
> > =20
> > -#if IS_ENABLED(CONFIG_ACPI_WMI)
> > +#if IS_REACHABLE(CONFIG_LENOVO_WMI_FN_KEYS)
> >  /*
> > - * WMI driver
> > + * The vendor specific Fn keys arrive as WMI events owned by the Leno=
vo WMI
> > + * Fn keys driver, which reports them as input events=2E Subscribe to=
 act on the
> > + * ones that touch the VPC state: the Fn lock LED and the performance=
 mode
> > + * button, which cycles the platform profile through DYTC instead of
> > + * reporting a key=2E
> >   */
> > -enum ideapad_wmi_event_type {
> > -	IDEAPAD_WMI_EVENT_ESC,
> > -	IDEAPAD_WMI_EVENT_FN_KEYS,
> > -};
> > -
> > -struct ideapad_wmi_private {
> > -	enum ideapad_wmi_event_type event;
> > -};
> > -
> > -static int ideapad_wmi_probe(struct wmi_device *wdev, const void *con=
text)
> > +static int ideapad_fn_keys_notify(struct notifier_block *nb, unsigned=
 long event,
> > +				  void *data)
> >  {
> > -	struct ideapad_wmi_private *wpriv;
> > +	struct ideapad_private *priv =3D container_of(nb, struct ideapad_pri=
vate, fn_keys_nb);
> > +	u32 code;
> > =20
> > -	wpriv =3D devm_kzalloc_obj(&wdev->dev, *wpriv);
> > -	if (!wpriv)
> > -		return -ENOMEM;
> > -
> > -	*wpriv =3D *(const struct ideapad_wmi_private *)context;
> > -
> > -	dev_set_drvdata(&wdev->dev, wpriv);
> > -	return 0;
> > -}
> > -
> > -static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_ob=
ject *data)
> > -{
> > -	struct ideapad_wmi_private *wpriv =3D dev_get_drvdata(&wdev->dev);
> > -	struct ideapad_private *priv;
> > -
> > -	guard(mutex)(&ideapad_shared_mutex);
> > -
> > -	priv =3D ideapad_shared;
> > -	if (!priv)
> > -		return;
> > -
> > -	switch (wpriv->event) {
> > -	case IDEAPAD_WMI_EVENT_ESC:
> > -		ideapad_input_report(priv, 128);
> > +	switch (event) {
> > +	case LWMI_FN_KEYS_EVENT_ESC:
> >  		break;
> > -	case IDEAPAD_WMI_EVENT_FN_KEYS:
> > +	case LWMI_FN_KEYS_EVENT_FN_KEY:
> >  		if (priv->features=2Eset_fn_lock_led) {
> >  			int brightness =3D ideapad_fn_lock_get(priv);
> > =20
> > @@ -2349,72 +2264,44 @@ static void ideapad_wmi_notify(struct wmi_devi=
ce *wdev, union acpi_object *data)
> >  			}
> >  		}
> > =20
> > -		if (data->type !=3D ACPI_TYPE_INTEGER) {
> > -			dev_warn(&wdev->dev,
> > -				 "WMI event data is not an integer\n");
> > -			break;
> > -		}
> > -
> > -		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
> > -			data->integer=2Evalue);
> > +		code =3D *(u32 *)data;
> > +		dev_dbg(&priv->platform_device->dev, "WMI fn-key event: 0x%x\n", co=
de);
>=20
> Let's drop the dev_dbg() as there is already a dev_dbg() in
> lwmi_fn_keys_notify()=2E
>=20
> With all these issues fixed:
>=20
> Reviewed-by: Rong Zhang <i@rong=2Emoe>
>=20
> Thanks,
> Rong
>=20
> > =20
> > -		/* performance button triggered by 0x3d */
> > -		if (data->integer=2Evalue =3D=3D 0x3d && priv->dytc) {
> > -			platform_profile_cycle();
> > +		switch (code) {
> > +		case 0x3d:
> > +			/* performance button */
> > +			if (priv->dytc) {
> > +				platform_profile_cycle();
> > +				return NOTIFY_STOP;
> > +			}
> > +			break;
> > +		case 0x02:
> > +		case 0x03:
> > +			/* 0x02 FnLock, 0x03 Esc */
> > +			ideapad_fn_lock_led_notify(priv, code =3D=3D 0x02);
> >  			break;
> >  		}
> > -
> > -		/* 0x02 FnLock, 0x03 Esc */
> > -		if (data->integer=2Evalue =3D=3D 0x02 || data->integer=2Evalue =3D=
=3D 0x03)
> > -			ideapad_fn_lock_led_notify(priv, data->integer=2Evalue =3D=3D 0x02=
);
> > -
> > -		ideapad_input_report(priv,
> > -				     data->integer=2Evalue | IDEAPAD_WMI_KEY);
> > -
> >  		break;
> >  	}
> > -}
> > =20
> > -static const struct ideapad_wmi_private ideapad_wmi_context_esc =3D {
> > -	=2Eevent =3D IDEAPAD_WMI_EVENT_ESC
> > -};
> > -
> > -static const struct ideapad_wmi_private ideapad_wmi_context_fn_keys =
=3D {
> > -	=2Eevent =3D IDEAPAD_WMI_EVENT_FN_KEYS
> > -};
> > -
> > -static const struct wmi_device_id ideapad_wmi_ids[] =3D {
> > -	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc }=
, /* Yoga 3 */
> > -	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc }=
, /* Yoga 700 */
> > -	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_ke=
ys }, /* Legion 5 */
> > -	{},
> > -};
> > -MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
> > -
> > -static struct wmi_driver ideapad_wmi_driver =3D {
> > -	=2Edriver =3D {
> > -		=2Ename =3D "ideapad_wmi",
> > -	},
> > -	=2Eid_table =3D ideapad_wmi_ids,
> > -	=2Emin_event_size =3D sizeof(u32),
> > -	=2Eprobe =3D ideapad_wmi_probe,
> > -	=2Enotify =3D ideapad_wmi_notify,
> > -};
> > +	return NOTIFY_OK;
> > +}
> > =20
> > -static int ideapad_wmi_driver_register(void)
> > +static int ideapad_fn_keys_register(struct ideapad_private *priv)
> >  {
> > -	return wmi_driver_register(&ideapad_wmi_driver);
> > +	priv->fn_keys_nb=2Enotifier_call =3D ideapad_fn_keys_notify;
> > +
> > +	return lwmi_fn_keys_register_notifier(&priv->fn_keys_nb);
> >  }
> > =20
> > -static void ideapad_wmi_driver_unregister(void)
> > +static void ideapad_fn_keys_unregister(struct ideapad_private *priv)
> >  {
> > -	return wmi_driver_unregister(&ideapad_wmi_driver);
> > +	lwmi_fn_keys_unregister_notifier(&priv->fn_keys_nb);
> >  }
> > -
> > -#else
> > -static inline int ideapad_wmi_driver_register(void) { return 0; }
> > -static inline void ideapad_wmi_driver_unregister(void) { }
> > -#endif
> > +#else /* CONFIG_LENOVO_WMI_FN_KEYS */
> > +static inline int ideapad_fn_keys_register(struct ideapad_private *pr=
iv) { return 0; }
> > +static inline void ideapad_fn_keys_unregister(struct ideapad_private =
*priv) { }
> > +#endif /* CONFIG_LENOVO_WMI_FN_KEYS */
> > =20
> >  /*
> >   * ACPI driver
> > @@ -2496,6 +2383,10 @@ static int ideapad_acpi_add(struct platform_dev=
ice *pdev)
> >  			dev_info(&pdev->dev, "DYTC interface is not available\n");
> >  	}
> > =20
> > +	err =3D ideapad_fn_keys_register(priv);
> > +	if (err)
> > +		dev_warn(&pdev->dev, "Could not subscribe to the WMI Fn key events:=
 %d\n", err);
> > +
> >  	if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_vendor) {
> >  		err =3D ideapad_backlight_init(priv);
> >  		if (err && err !=3D -ENODEV)
> > @@ -2527,6 +2418,7 @@ static int ideapad_acpi_add(struct platform_devi=
ce *pdev)
> >  	ideapad_backlight_exit(priv);
> > =20
> >  backlight_failed:
> > +	ideapad_fn_keys_unregister(priv);
> >  	ideapad_dytc_profile_exit(priv);
> > =20
> >  	for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
> > @@ -2556,6 +2448,7 @@ static void ideapad_acpi_remove(struct platform_=
device *pdev)
> >  				   ideapad_acpi_notify);
> > =20
> >  	ideapad_backlight_exit(priv);
> > +	ideapad_fn_keys_unregister(priv);
> >  	ideapad_dytc_profile_exit(priv);
> > =20
> >  	for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
> > @@ -2600,31 +2493,9 @@ static struct platform_driver ideapad_acpi_driv=
er =3D {
> >  	},
> >  };
> > =20
> > -static int __init ideapad_laptop_init(void)
> > -{
> > -	int err;
> > -
> > -	err =3D ideapad_wmi_driver_register();
> > -	if (err)
> > -		return err;
> > -
> > -	err =3D platform_driver_register(&ideapad_acpi_driver);
> > -	if (err) {
> > -		ideapad_wmi_driver_unregister();
> > -		return err;
> > -	}
> > -
> > -	return 0;
> > -}
> > -module_init(ideapad_laptop_init)
> > -
> > -static void __exit ideapad_laptop_exit(void)
> > -{
> > -	platform_driver_unregister(&ideapad_acpi_driver);
> > -	ideapad_wmi_driver_unregister();
> > -}
> > -module_exit(ideapad_laptop_exit)
> > +module_platform_driver(ideapad_acpi_driver);
> > =20
> >  MODULE_AUTHOR("David Woodhouse <dwmw2@infradead=2Eorg>");
> >  MODULE_DESCRIPTION("IdeaPad ACPI Extras");
> > +MODULE_IMPORT_NS("LENOVO_WMI_FN_KEYS");
> >  MODULE_LICENSE("GPL");
> > diff --git a/include/linux/platform_data/lenovo-wmi-fn-keys=2Eh b/incl=
ude/linux/platform_data/lenovo-wmi-fn-keys=2Eh
> > new file mode 100644
> > index 000000000000=2E=2E4a737990b184
> > --- /dev/null
> > +++ b/include/linux/platform_data/lenovo-wmi-fn-keys=2Eh
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2=2E0-only */
> > +/*
> > + * Lenovo WMI Fn keys driver, notifier interface for drivers that wan=
t to act
> > + * on the vendor specific Fn key events before a key is reported=2E
> > + */
> > +
> > +#ifndef _LENOVO_WMI_FN_KEYS_H_
> > +#define _LENOVO_WMI_FN_KEYS_H_
> > +
> > +struct device;
> > +struct notifier_block;
> > +
> > +/**
> > + * enum lwmi_fn_keys_event - notifier chain actions
> > + * @LWMI_FN_KEYS_EVENT_ESC: Fn+Esc from one of the Esc event GUIDs, w=
hich
> > + *                          carry no event data
> > + * @LWMI_FN_KEYS_EVENT_FN_KEY: a key from the Fn key event GUID, the =
notifier
> > + *                             data points to the u32 key code
> > + *
> > + * A callback that handles the event itself returns NOTIFY_STOP to su=
ppress
> > + * the input report; NOTIFY_OK or NOTIFY_DONE let it through=2E
> > + */
> > +enum lwmi_fn_keys_event {
> > +	LWMI_FN_KEYS_EVENT_ESC,
> > +	LWMI_FN_KEYS_EVENT_FN_KEY,
> > +};
> > +
> > +int lwmi_fn_keys_register_notifier(struct notifier_block *nb);
> > +int lwmi_fn_keys_unregister_notifier(struct notifier_block *nb);
> > +int devm_lwmi_fn_keys_register_notifier(struct device *dev, struct no=
tifier_block *nb);
> > +
> > +#endif /* _LENOVO_WMI_FN_KEYS_H_ */
