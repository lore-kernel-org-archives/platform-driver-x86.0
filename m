Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795093309;
	b=MyCsnABkTbkcSaNuw6pqtTeI8sgt5tyd32Y6gDPkokRafNv1goBcVJwhwn9yh/dFI7TU
	 35on+r2XEJOm8rkvuXQmL6QbeFix0e+WQ5a9LfbZQAuPm/ehhgaCEgrpFaUxb95P/Aygy
	 QEXWRqAsQU+4nRfq2zUyT2Y036GfnWEXRwFmcAqgSdE4Dj/GN+YNavYpvTF2kEgIzycAv
	 /ONFbQPGqe8ORtnLFuQBBWZgjYFMuS7Ih7N5t0nNS5O/0XW6663D/hOxOozPI0dKIN25B
	 Ui0aFwwkrmA+1jYA1XPNU3Ox64zDuDdh3CMJSVijQ5AWU4/F1CwIY8rORAfH7DlijqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093309;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=FU7Rz/BhIY5cLG26tLNwIV1E3z8OXduEjlK2bF4MPjg=;
	b=z+bmTTl60ulC5F+OQUXJz+QoUMeEkSK9PlwSD1bHd06aEZjCK0/g/Vow6XItBm3IqSti
	 NXntNkNqtoFOg399fZIGgkN4VLIVdT3jA9zQUQ5I3cXNOIclUhVbTXV46CjRrNZ6o0imD
	 KPofYJNoak3o7w6MILYJz+OQCgBc+yErybeyW5LgmJFTbv37YOJZYx9cp4liECwX3WJEO
	 V4P8vt6RRNwgCoGkM0uZBy+AA46HEQQcYL0r1jrmOncbbT5s/E4osRPEnUfwUGPjrbb6D
	 9fnzZuDvD75hXjUwB/6MyVkHd00SSYftlKCR05gr7f0GBSY4aGtNtoR6TlKcxZ6ibIQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kBlD05ah;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032D4606A320;
	Thu, 19 Nov 2026 13:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 032D4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kBlD05ah
ARC-Seal: i=1; a=rsa-sha256; t=1795093293; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HijXmPWtD1zSMRJAONdk8dYam+2Gs2aSDA27/VD8/pnb5TDcJPQ8fed7613O2J1qfJHIiDeKij6E6H6AtCL5j/mora18Xb6vDGn6sduEgua0XNFglto0XfLhJe5W9jqX1UrC9+oM4R48X4tGjrrQ2ad+3ZLH6BB9tVAuaSq/NI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795093293; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FU7Rz/BhIY5cLG26tLNwIV1E3z8OXduEjlK2bF4MPjg=; 
	b=P8XD5ZlypwtgsClcEB0ZguYp/YyIXWKjPtLtGaH0Bn0jgoKDVxgsMvtj1LXmf5kBkYvfUib78aEtAEX8fZNYAkiai3MFq8v7Fy8t2iBadaQ3vCBYa61DHESeeAP1+uenaSEcfBaJtOxejl0Qy5kjKeaqZM88A3GiID5OnyMQA1k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=kBlD05ahAIAyar0DYoo8rS2SiDQFqkkQyibVN0YOUhqJ37BA9A3W5TcbQaFqFtpCMb5GgwxpH8/lbGoFhPzE8nfFqiZRUOCH4fjjPPZm9omRBSUZZVBJyDaVI3qBhXsEP4ZrwVeUy5GTZqMaYeAG180LAnK8R/Lrpj56Bxe+Wj0PAUkuJbaXtCzvQjAooscf0XtIXiFaSBstHk9jSPiQLV5hqYrKl9t8kXAeX3BWhTeLJ5CGL6eYnFo3frZW/5NQVyBR/Trf67ybwbGKPzM9poqfFVinLQzt8/aGaMKKNKWTYqXzok1zZgL8J8Qvs4iXw3F5yhBBGQBYbyF9qi6gKw==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=FU7Rz/BhIY5cLG26tLNwIV1E3z8OXduEjlK2bF4MPjg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795093291506560.8090301555615;
	Thu, 19 Nov 2026 05:01:31 -0800 (PST)
Message-ID: <4def1752e7a0a7d4bba0e89adf440985fef56845.camel@rong.moe>
Subject: Re: [PATCH v2 2/3] platform: lenovo: add WMI hotkeys driver
From: Rong Zhang <i@rong.moe>
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 xy-jackie@139.com, 	ikepanhc@gmail.com, marco_giunta@outlook.it,
 platform-driver-x86@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 ldemarchi@nvidia.com
In-Reply-To: <20261119022719.3089229-3-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
	 <20261119022719.3089229-1-dcemin@nvidia.com>
	 <20261119022719.3089229-3-dcemin@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 20:56:21 +0800
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
> Lenovo consumer laptops deliver their vendor specific Fn keys (microphone
> mute, airplane mode, performance mode, the Smart Key, Smart Connect and
> others) as WMI events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294
> instead of keyboard usages, and the Yoga 3 and Yoga 700 generations
> report Fn+Esc on two dedicated event GUIDs that carry no data. On x86
> ideapad-laptop consumes these events together with the IdeaPad VPC
> device; that driver depends on i8042 and the VPC, neither of which exist
> on the ACPI based arm64 models, so the keys do nothing there.
>=20
> Add a small WMI driver that owns these event GUIDs on every architecture
> and reports the keys through a sparse keymap, using the key codes
> ideapad-laptop has used for them, including code 128 for the Fn+Esc
> events. The input device keeps the ideapad-laptop name so that the
> existing hwdb mappings for these keys continue to apply.
>=20
> Drivers with platform knowledge can subscribe to a notifier chain that
> is called with the event code before the key is reported; a subscriber
> that handles the event itself returns NOTIFY_STOP and no key is
> reported. ideapad-laptop uses this for the Fn lock LED and the
> performance mode button, which cycles the platform profile instead of
> producing a key.
>=20
> The camera lens cover switch (events 0x0c and 0x0d) is reported as
> SW_CAMERA_LENS_COVER, as ideapad-laptop does today.
>=20
> Tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone mute, airplane
> mode, the Smart Key, the Smart Connect key and the Fn+Q performance key
> report input events. The Esc event GUIDs are not exposed by that
> firmware, so that path is compile tested only.

Overall, I like the methodology of factoring out the WMI hotkeys driver
from ideapad-laptop, though I still have some comments on the
implementation.

>=20
> Signed-off-by: David Cemin <dcemin@nvidia.com>
> ---
>  MAINTAINERS                                   |   7 +
>  drivers/platform/lenovo/Kconfig               |  14 +
>  drivers/platform/lenovo/Makefile              |   1 +
>  drivers/platform/lenovo/wmi-hotkeys.c         | 244 ++++++++++++++++++
>  .../platform_data/x86/lenovo-wmi-hotkeys.h    |  28 ++
>  5 files changed, 294 insertions(+)
>  create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c
>  create mode 100644 include/linux/platform_data/x86/lenovo-wmi-hotkeys.h

Please merge PATCH 2 and 3 into a monolithic patch, as they are mostly
code movement and refactoring. Otherwise, applying PATCH 2 without PATCH
3 allows both drivers to contend for the same WMI devices IIUC.

>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b0ad5a3debe..1d5b08c033b1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15173,6 +15173,13 @@ F:=09Documentation/wmi/devices/lenovo-wmi-other.=
rst
>  F:=09drivers/platform/lenovo/
>  F:=09drivers/platform/x86/lenovo/*
> =20
> +LENOVO WMI HOTKEYS DRIVER
> +M:=09David Cemin <dcemin@nvidia.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Maintained
> +F:=09drivers/platform/lenovo/wmi-hotkeys.c
> +F:=09include/linux/platform_data/x86/lenovo-wmi-hotkeys.h

The driver is mostly factored out from ideapad-laptop, so I am not sure
if this driver should belong to IDEAPAD LAPTOP EXTRAS DRIVER. Besides,
ideapad-laptop is still he most important in-kernel user of the new
driver.

I don't have a strong preference, so I will defer the question to others.

Meanwhile, I am glad to co-maintain the driver if you decided to keep a
dedicated MAINTAINERS entry. My daily device has the WMI hotkeys device
and I have the experience of working on both the ACPI and WMI parts of
ideapad-laptop.

> +
>  LENOVO WMI HOTKEY UTILITIES DRIVER
>  M:=09Jackie Dong <xy-jackie@139.com>
>  L:=09platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/Kc=
onfig
> index 8222322ca671..2810c995ee8c 100644
> --- a/drivers/platform/lenovo/Kconfig
> +++ b/drivers/platform/lenovo/Kconfig
> @@ -41,6 +41,20 @@ config LENOVO_WMI_HOTKEY_UTILITIES
>  =09  such as LED control for audio/mic mute event for Ideapad, YOGA, Xia=
oXin,
>  =09  Gaming, ThinkBook and so on.
> =20
> +config LENOVO_WMI_HOTKEYS
> +=09tristate "Lenovo WMI hotkeys driver"
> +=09depends on ACPI_WMI
> +=09depends on INPUT
> +=09select INPUT_SPARSEKMAP
> +=09help
> +=09  Say Y or M here to enable the vendor specific Fn keys (microphone
> +=09  mute, airplane mode, performance mode, star key, Fn+Esc
>=20

, etc

> ) on Lenovo
> +=09  laptops that deliver them as WMI events. ideapad-laptop subscribes
> +=09  to this driver for its Fn lock LED and performance mode handling.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called lenovo-wmi-hotkeys.
> +
>  config LENOVO_WMI_CAMERA
>  =09tristate "Lenovo WMI Camera Button driver"
>  =09depends on ACPI_WMI
> diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/M=
akefile
> index 1cac115dd735..d3f5e3ac14c2 100644
> --- a/drivers/platform/lenovo/Makefile
> +++ b/drivers/platform/lenovo/Makefile
> @@ -8,6 +8,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)=09+=3D wmi-hel=
pers.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)=09+=3D wmi-events.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)=09+=3D wmi-capdata.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)=09+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEYS)=09+=3D wmi-hotkeys.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)=09+=3D wmi-camera.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)=09+=3D wmi-gamezone.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)=09+=3D wmi-other.o
> diff --git a/drivers/platform/lenovo/wmi-hotkeys.c b/drivers/platform/len=
ovo/wmi-hotkeys.c
> new file mode 100644
> index 000000000000..f412652e9f72
> --- /dev/null
> +++ b/drivers/platform/lenovo/wmi-hotkeys.c
> @@ -0,0 +1,244 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Lenovo WMI hotkeys driver
> + *
> + * Lenovo consumer laptops deliver their vendor specific Fn keys (microp=
hone
> + * mute, airplane mode, performance mode, the star key and others) as WM=
I
> + * events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 instead of keyboa=
rd
> + * usages, and the older Yoga models report Fn+Esc on two dedicated even=
t
> + * GUIDs that carry no data. This driver owns these event GUIDs on every
> + * architecture and reports the keys through a sparse keymap. Drivers wi=
th
> + * platform knowledge, such as ideapad-laptop, subscribe to the notifier=
 chain
> + * to act on an event and may stop the key from being reported.
> + *
> + * The key codes follow the mapping historically used by ideapad-laptop.

I don't believe this is the case...

> + */
> +
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_data/x86/lenovo-wmi-hotkeys.h>

I found the path confusing. The driver is intended to function on both
ARM64 and x86 based Lenovo devices according to your cover letter.=20

> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include <asm/byteorder.h>
> +
> +#define LENOVO_FN_KEYS_WMI_GUID=09"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
> +/* Fn+Esc on the Yoga 3 and Yoga 700 generations, no event data */

Isn't the comment redundant? The macros' names and the next comment below
have said the same things.

> +#define LENOVO_ESC_WMI_GUID_YOGA3=09"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E=
6"
> +#define LENOVO_ESC_WMI_GUID_YOGA700=09"56322276-8493-4CE8-A783-98C991274=
F5E"
> +
> +/*
> + * The Esc event GUIDs carry no key code; they are reported under
> + * LENOVO_WMI_HOTKEYS_ESC_CODE, the code ideapad-laptop has always used =
for
> + * them, so the existing hwdb mappings keep applying. The Fn key GUID co=
des
> + * are all below 0x80.
> + */
> +
> +enum lenovo_wmi_hotkeys_type {

Most Lenovo WMI drivers use "lwmi_*_" as their prefixes. Could you use
"lwmi_hotkeys_" in all types and methods to make them more brief and
unified?

> +=09LENOVO_WMI_HOTKEYS_FN_KEYS,
> +=09LENOVO_WMI_HOTKEYS_ESC,
> +};
> +
> +static const enum lenovo_wmi_hotkeys_type lenovo_wmi_hotkeys_fn_keys =3D=
 LENOVO_WMI_HOTKEYS_FN_KEYS;
> +static const enum lenovo_wmi_hotkeys_type lenovo_wmi_hotkeys_esc =3D LEN=
OVO_WMI_HOTKEYS_ESC;

Could you=C2=A0declare a struct (say, lwmi_hotkeys_info) to store these sta=
tic
allocated metadata? In this manner it's tidier and makes future additions
much easier. Please refer to lwmi_cd_info.

> +
> +static BLOCKING_NOTIFIER_HEAD(lenovo_wmi_hotkeys_chain);
> +
> +static const struct key_entry lenovo_wmi_hotkeys_keymap[] =3D {
> +=09/* Fn+Esc from the Esc event GUIDs */
> +=09{ KE_KEY, LENOVO_WMI_HOTKEYS_ESC_CODE, { KEY_ESC } },

I'd prefer using a dedicated keymap for Esc. In this manner we can save
some memory (note that sparse_keymap_setup() calls devm_kmemdup_array()
to make a RW copy of the keymap).

> +=09/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> +=09{ KE_KEY, 0x01, { KEY_FAVORITES } },
> +=09/* Fn lock toggled on / off, handled by the firmware */

Could you preserve all these comments as they are instead of adding the
trimmings?

> +=09{ KE_IGNORE, 0x02 },
> +=09/* Esc, handled by the firmware */
> +=09{ KE_IGNORE, 0x03 },

I'd prefer collecting entries of the same type together, i.e., a
collection of KE_IGNORE, then KE_KEY, and then KE_SW. In this manner, all
entries in a collection is also aligned, improving the readability.

> +=09{ KE_KEY, 0x04, { KEY_SELECTIVE_SCREENSHOT } },
> +=09/* Lenovo Support */
> +=09{ KE_KEY, 0x07, { KEY_HELP } },
> +=09/* Refresh Rate Toggle */
> +=09{ KE_KEY, 0x0a, { KEY_REFRESH_RATE_TOGGLE } },
> +=09/* Camera lens cover closed / opened */
> +=09{ KE_SW, 0x0c, .sw =3D { SW_CAMERA_LENS_COVER, 0 } },
> +=09{ KE_SW, 0x0d, .sw =3D { SW_CAMERA_LENS_COVER, 1 } },

The comment is mistaken. 0x0c means cover opened (uncovered) and 0x0d
means the opposite. So, please don't add the trimmings.

This also drops the comment about how WMI switches work. Please preserve
it for better documentation.

> +=09{ KE_KEY, 0x0e, { KEY_PICKUP_PHONE } },
> +=09{ KE_KEY, 0x0f, { KEY_HANGUP_PHONE } },
> +=09/* Refresh Rate Toggle (Fn+R) */
> +=09{ KE_KEY, 0x10, { KEY_REFRESH_RATE_TOGGLE } },
> +=09/* Sound profile switch */
> +=09{ KE_KEY, 0x12, { KEY_PROG2 } },
> +=09/* Dark mode toggle */
> +=09{ KE_KEY, 0x13, { KEY_PROG1 } },
> +=09/* Lenovo Support */
> +=09{ KE_KEY, 0x27, { KEY_HELP } },
> +=09/* Lenovo Virtual Background application */
> +=09{ KE_KEY, 0x28, { KEY_PROG3 } },
> +=09{ KE_KEY, 0x29, { KEY_TOUCHPAD_TOGGLE } },
> +=09{ KE_KEY, 0x2a, { KEY_ROOT_MENU } },
> +=09/* Shift + PrtSc */
> +=09{ KE_KEY, 0x2d, { KEY_SELECTIVE_SCREENSHOT } },
> +=09/* Performance mode toggle, Fn+Q */
> +=09{ KE_KEY, 0x3d, { KEY_PERFORMANCE } },

...because this is changed.

> +=09{ KE_KEY, 0x3e, { KEY_MICMUTE } },
> +=09{ KE_KEY, 0x3f, { KEY_RFKILL } },
> +=09/*
> +=09 * Keyboard backlight level after Fn+Space, handled by the firmware:
> +=09 * 0x40 off, 0x41 low, 0x42 high, 0x43 also seen
> +=09 */
> +=09{ KE_IGNORE, 0x40 },
> +=09{ KE_IGNORE, 0x41 },
> +=09{ KE_IGNORE, 0x42 },
> +=09{ KE_IGNORE, 0x43 },

These entries are new. Please factor out additions into a dedicated
patch.

> +=09/* Star, user assignable key */
> +=09{ KE_KEY, 0x44, { KEY_PROG1 } },
> +=09/* Eye care */

The original comment has no "care". How did you conclude that?=20

> +=09{ KE_KEY, 0x45, { KEY_PROG3 } },
> +=09/* Mode, opens a profile chooser; the Fn+Q button cycles the profile =
*/
> +=09{ KE_KEY, 0x46, { KEY_PROG4 } },
> +=09/* Lenovo Smart Connect */
> +=09{ KE_KEY, 0x48, { KEY_LINK_PHONE } },
> +=09{ KE_END },

Drop the comma after the terminator item.

> +};
> +
> +struct lenovo_wmi_hotkeys {
> +=09struct input_dev *input;
> +=09enum lenovo_wmi_hotkeys_type type;
> +};
> +
> +/**
> + * lenovo_wmi_hotkeys_register_notifier() - Subscribe to the hotkey even=
ts.
> + * @nb: The notifier_block to register.
> + *
> + * The callback runs in process context with the WMI event code as the
> + * action. Return NOTIFY_STOP from the callback to consume the event.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int lenovo_wmi_hotkeys_register_notifier(struct notifier_block *nb)
> +{
> +=09return blocking_notifier_chain_register(&lenovo_wmi_hotkeys_chain, nb=
);
> +}
> +EXPORT_SYMBOL_NS_GPL(lenovo_wmi_hotkeys_register_notifier, "LENOVO_WMI_H=
OTKEYS");
> +
> +/**
> + * lenovo_wmi_hotkeys_unregister_notifier() - Unsubscribe from the hotke=
y events.
> + * @nb: The notifier_block to unregister.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int lenovo_wmi_hotkeys_unregister_notifier(struct notifier_block *nb)
> +{
> +=09return blocking_notifier_chain_unregister(&lenovo_wmi_hotkeys_chain, =
nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lenovo_wmi_hotkeys_unregister_notifier, "LENOVO_WMI=
_HOTKEYS");
> +
> +static void devm_lenovo_wmi_hotkeys_unregister_notifier(void *data)
> +{
> +=09lenovo_wmi_hotkeys_unregister_notifier(data);
> +}
> +
> +/**
> + * devm_lenovo_wmi_hotkeys_register_notifier() - Device managed subscrip=
tion.
> + * @dev: The device whose lifetime bounds the subscription.
> + * @nb: The notifier_block to register.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int devm_lenovo_wmi_hotkeys_register_notifier(struct device *dev,
> +=09=09=09=09=09      struct notifier_block *nb)
> +{
> +=09int ret;
> +
> +=09ret =3D lenovo_wmi_hotkeys_register_notifier(nb);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return devm_add_action_or_reset(dev, devm_lenovo_wmi_hotkeys_unregist=
er_notifier, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_lenovo_wmi_hotkeys_register_notifier, "LENOVO_=
WMI_HOTKEYS");
> +
> +static int lenovo_wmi_hotkeys_probe(struct wmi_device *wdev, const void =
*context)
> +{
> +=09struct lenovo_wmi_hotkeys *priv;
> +=09int ret;
> +
> +=09priv =3D devm_kzalloc_obj(&wdev->dev, *priv);
> +=09if (!priv)
> +=09=09return -ENOMEM;
> +
> +=09priv->type =3D *(const enum lenovo_wmi_hotkeys_type *)context;
> +
> +=09priv->input =3D devm_input_allocate_device(&wdev->dev);
> +=09if (!priv->input)
> +=09=09return -ENOMEM;
> +
> +=09/*
> +=09 * Same name as the ideapad-laptop input device so that the existing
> +=09 * hwdb keyboard mappings for these keys keep applying.
> +=09 */
> +=09priv->input->name =3D "Ideapad extra buttons";
> +=09priv->input->phys =3D priv->type =3D=3D LENOVO_WMI_HOTKEYS_ESC ? "wmi=
/input1" : "wmi/input0";

The strings can be stored in the suggested struct lwmi_hotkeys_info to
get rid of the ternary.

> +=09priv->input->id.bustype =3D BUS_HOST;
> +=09priv->input->dev.parent =3D &wdev->dev;
> +
> +=09ret =3D sparse_keymap_setup(priv->input, lenovo_wmi_hotkeys_keymap, N=
ULL);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09dev_set_drvdata(&wdev->dev, priv);
> +
> +=09return input_register_device(priv->input);
> +}
> +
> +static void lenovo_wmi_hotkeys_notify(struct wmi_device *wdev, const str=
uct wmi_buffer *buf)
> +{
> +=09struct lenovo_wmi_hotkeys *priv =3D dev_get_drvdata(&wdev->dev);
> +=09u32 code;
> +=09int ret;
> +
> +=09if (priv->type =3D=3D LENOVO_WMI_HOTKEYS_ESC) {
> +=09=09code =3D LENOVO_WMI_HOTKEYS_ESC_CODE;
> +=09} else {
> +=09=09if (buf->length < sizeof(u32)) {

Event sizes can be stored in the suggested struct wmi_hotkeys_info.

The same applies to LENOVO_WMI_HOTKEYS_ESC_CODE (let's rename it to
LWMI_HOTKEYS_ESC, too).

For example:

static const struct lwmi_hotkeys_info lwmi_hotkeys_esc =3D {
=09.type =3D LWMI_HOTKEYS_ESC,
=09.phys =3D "wmi/input1",
=09.event_size =3D 0,
=09.code =3D LWMI_HOTKEYS_ESC_CODE, /* Used only when !event_size */
=09.keymap =3D lwmi_hotkeys_esc_keymap,
}

> +=09=09=09dev_dbg(&wdev->dev, "short hotkey event (%zu bytes)\n", buf->le=
ngth);
> +=09=09=09return;
> +=09=09}
> +=09=09code =3D le32_to_cpup(buf->data);
> +=09}
> +
> +=09dev_dbg(&wdev->dev, "hotkey event 0x%x\n", code);
> +
> +=09ret =3D blocking_notifier_call_chain(&lenovo_wmi_hotkeys_chain, code,=
 NULL);
> +=09if (ret & NOTIFY_STOP_MASK)
> +=09=09return;
> +
> +=09if (!sparse_keymap_report_event(priv->input, code, 1, true))
> +=09=09dev_info_ratelimited(&wdev->dev, "unknown hotkey event 0x%x\n", co=
de);
> +}
> +
> +static const struct wmi_device_id lenovo_wmi_hotkeys_id_table[] =3D {
> +=09{ LENOVO_FN_KEYS_WMI_GUID, &lenovo_wmi_hotkeys_fn_keys },
> +=09{ LENOVO_ESC_WMI_GUID_YOGA3, &lenovo_wmi_hotkeys_esc },
> +=09{ LENOVO_ESC_WMI_GUID_YOGA700, &lenovo_wmi_hotkeys_esc },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_hotkeys_id_table);
> +
> +static struct wmi_driver lenovo_wmi_hotkeys_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "lenovo-wmi-hotkeys",
> +=09=09.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +=09},
> +=09.id_table =3D lenovo_wmi_hotkeys_id_table,
> +=09.probe =3D lenovo_wmi_hotkeys_probe,
> +=09.notify_new =3D lenovo_wmi_hotkeys_notify,
> +=09.no_singleton =3D true,
> +};
> +module_wmi_driver(lenovo_wmi_hotkeys_driver);
> +
> +MODULE_DESCRIPTION("Lenovo WMI hotkeys driver");
> +MODULE_LICENSE("GPL");

MODULE_AUTHOR()?

> diff --git a/include/linux/platform_data/x86/lenovo-wmi-hotkeys.h b/inclu=
de/linux/platform_data/x86/lenovo-wmi-hotkeys.h
> new file mode 100644
> index 000000000000..cf07eb00f3bb
> --- /dev/null
> +++ b/include/linux/platform_data/x86/lenovo-wmi-hotkeys.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Lenovo WMI hotkeys driver, notifier interface for drivers that want t=
o act
> + * on the vendor specific Fn key events before a key is reported.
> + */
> +
> +#ifndef _LENOVO_WMI_HOTKEYS_H_
> +#define _LENOVO_WMI_HOTKEYS_H_
> +
> +struct device;
> +struct notifier_block;
> +
> +/* Code reported for the Fn+Esc event GUIDs, as ideapad-laptop always di=
d */
> +#define LENOVO_WMI_HOTKEYS_ESC_CODE=09128

If you need the scan codes to be stable, it seemed that you've forgot Fn
Keys. They are no longer OR'd with IDEAPAD_WMI_KEY.

If you decide to preserve the scan code of Fn Keys, the offset can be
stored in the suggested struct wmi_hotkeys_info, too. The keymap can be
modified on the fly by passing a callback to sparse_keymap_setup().


I guess there may also be some useful review comments on sashiko.dev,
though I haven't checked it yet.

Thanks,
Rong

> +
> +/*
> + * Notifier callbacks receive the WMI event code as the action and no da=
ta:
> + * the Fn key code from the Fn key event GUID, or LENOVO_WMI_HOTKEYS_ESC=
_CODE
> + * for the Fn+Esc event GUIDs, which carry none. A callback that handles=
 the
> + * event itself returns NOTIFY_STOP to suppress the input report; NOTIFY=
_OK or
> + * NOTIFY_DONE let it through.
> + */
> +int lenovo_wmi_hotkeys_register_notifier(struct notifier_block *nb);
> +int lenovo_wmi_hotkeys_unregister_notifier(struct notifier_block *nb);
> +int devm_lenovo_wmi_hotkeys_register_notifier(struct device *dev,
> +=09=09=09=09=09      struct notifier_block *nb);
> +
> +#endif /* _LENOVO_WMI_HOTKEYS_H_ */
