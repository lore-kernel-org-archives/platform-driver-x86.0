Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795258058;
	b=kTlseY1gJ+SFn0giHzTjpfQiIHUHgsNTaE26zGWFDfCoMOuD8hmL5YDwZmUM4ZiWYFSh
	 oLDJ2zQiV2WfpRBwa8JlmhSD7nD9+0cMVD1JkFKVEtkhSQby3lRHxvWU5xatXlcoqYUPc
	 btpmlt+uiWY1WAsSJ0ONz6gWIApbfLv3RXENXFtvMyWlRYPGMayLUV9ylKO9tOo7sHj9u
	 l2iR+ftb6FZUOJ9oPqwYaXK7EtTXZZTW7+niDYFvS1Vx0ngrUcmr/BDxecunBf+hAk7nH
	 UA/1qOH3p6BxEAjYpMT4ihp7nKH8o4hY13kziESy3LURSVszNH6luXANhYxpVYpbyFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795258058;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=PxUGinclVvCYUL1pinsANFEnbM8gY3wu0c6DidtEPqg=;
	b=W5wiKJ1aO1KbEE83DLg1QvDu3DoJQP5VncnJFocfHuD2f8IFQD2AbyiPE8Hu8xKuIv/M
	 j4zIp4v6l4JR51CR/bxS1sDND4Odew/C7NsGRon6OwyY2nRFor6mHE2i7MgpkmBPxfRGh
	 oF+O2JKZ+YeH1IaqFpFNunoHKYh4pwvUCpjpe8AGhTzMcGJ/qIfNgFqMdzEkM7ZfCrtxv
	 L8PxdlBCH7LUmeBE41Nivc4WT26gndtvSgyvt74OewNA7SV3dn8OeKOhtVqDCYk2zQARf
	 o+wYl7LmJTV2t0Gdb8ZVmJyLqWkZoMpES57tFI4P1wkRhkwW31Gjb1ZiZENWytw32PA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=U7qAL7cb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12BB606A320;
	Sat, 21 Nov 2026 10:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E12BB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=U7qAL7cb
ARC-Seal: i=1; a=rsa-sha256; t=1795258041; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X7uqrYVO5WhHUlR7XUU4PYXzwSJ9a+qsQAZ4ZMf8qsp2ehUhjBa0ktc9CwlNT+DXV8Nw3k1xZDYOVy73XeNqM7LzupFxxzF8mebcbe/TI/Kb79TeXNqV+edJnmF28KMBBmkL4XHRZwCTOAoODrs/N2ZCY63F75oceMd+WTEEuks=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795258041; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PxUGinclVvCYUL1pinsANFEnbM8gY3wu0c6DidtEPqg=; 
	b=QpE+5VSIZEIzoy1dip6qRwyanKSRWTreED2AGWdf/0V7ya6+yD25EL+UuTptvqG8a7SijwCgnH/lgVRYHTfF10MPEoTMXWUMCrItQLYkI5kFBzMNysKPBVjxr6tadt26jH1/VZ2xsKRzn75Kjr8NyJfgO0FQCj2a5fVbgtlqlkg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=U7qAL7cbNPFcwwKA2vlGFRyYL6jfClXGR2WFgLOrGlGEz82C04UHD6ZqgpNyCuZaTg5CcwhTa30823e0hwpfNYM/IMswQEftQdw/KkNDKg74dcCnnECOhjR8BUg6mnpCTTfhTdS1cCj9+uukC5yI8zZr87mOEShSv/58G+/L3pVizsGGyEm9Tn/T6FuKgaa+P/L8Tn2NuBbAD2h4HiSVnmmGXhK1aMGt/f2+kEBEW+jzVwO8cprWK5feeOD+RHgJ34ihPoAJqcg9Sb+cIi+g3z0R/6PzBLCL2xyHCiFNsQZFjcWGyR1G98ezdskmRa3o4QtIrjkv5VntOfpVK5hOVA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=PxUGinclVvCYUL1pinsANFEnbM8gY3wu0c6DidtEPqg=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795258037988652.5338087955405;
	Sat, 21 Nov 2026 02:47:17 -0800 (PST)
Message-ID: <20ef843b4703e265482f7ea339d72217ce48158e.camel@rong.moe>
Subject: Re: [PATCH v3 2/3] platform: lenovo: add WMI Fn keys driver and
 use it from ideapad-laptop
From: Rong Zhang <i@rong.moe>
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 xy-jackie@139.com, 	marco_giunta@outlook.it, ldemarchi@nvidia.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261121033322.974635-3-dcemin@nvidia.com>
References: <20261119022719.3089229-1-dcemin@nvidia.com>
		 <20261121033322.974635-1-dcemin@nvidia.com>
		 <20261121033322.974635-3-dcemin@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 18:42:04 +0800
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

Thanks for your work.

On Fri, 2026-11-20 at 19:33 -0800, David Cemin wrote:
> Lenovo consumer laptops deliver their vendor specific Fn keys
> (microphone mute, airplane mode, performance mode, the star key and
> others) as WMI events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294, and
> the older Yoga models report Fn+Esc on two event GUIDs that carry no
> data. ideapad-laptop handles all of them today, but it is an x86 only
> driver built on the VPC ACPI device and the i8042 controller, and the
> new arm64 Lenovo laptops expose the Fn key GUID without any of that.
>=20
> Add a Lenovo WMI Fn keys driver that owns the three event GUIDs on
> every architecture and reports the keys through a sparse keymap. The
> keymap, the scan codes (the Fn key codes offset by 0x100, Fn+Esc as
> 128) and the input device name are taken over from ideapad-laptop, so
> the events userspace sees do not change and the existing hwdb mappings
> keep applying. The one difference is 0x3d, which now reports
> KEY_PERFORMANCE instead of KEY_PROG4. A notifier chain lets drivers
> with platform knowledge act on an event before the key is reported and
> suppress it with NOTIFY_STOP.
>=20
> Make ideapad-laptop drop its WMI event driver and keymap entries and
> subscribe to that notifier instead. The callback keeps the two platform
> specific behaviours: it refreshes the Fn lock LED from the EC on every
> Fn key event, and on the performance button it cycles the platform
> profile through DYTC and consumes the event, as before. The notifier is
> unregistered before the DYTC and LED teardown in remove() and on the
> probe error paths. Both changes land in one patch because with the new
> driver present but ideapad-laptop unchanged, both drivers would bind
> the same WMI devices.
>=20
> ideapad-laptop implies LENOVO_WMI_FN_KEYS so that existing
> configurations keep the Fn keys on a config update, and uses
> IS_REACHABLE() to tolerate the driver being a module while
> ideapad-laptop is built in, in which case the keys are still reported
> by the Fn keys driver and only the VPC specific handling is lost.
>=20
> Tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone mute, airplane
> mode, the Smart Key, the Smart Connect key and the Fn+Q performance key
> report input events. The Esc event GUIDs are not exposed by that
> firmware, so that path is compile tested only, as is ideapad-laptop.
>=20
> Signed-off-by: David Cemin <dcemin@nvidia.com>

The patch now looks quite good to me, except for some minor issues. See
below.

> ---
>  MAINTAINERS                                   |   8 +
>  drivers/platform/lenovo/Kconfig               |  15 +
>  drivers/platform/lenovo/Makefile              |   1 +
>  drivers/platform/lenovo/wmi-fn-keys.c         | 280 ++++++++++++++++++
>  drivers/platform/x86/lenovo/Kconfig           |   2 +-
>  drivers/platform/x86/lenovo/ideapad-laptop.c  | 227 +++-----------
>  .../linux/platform_data/lenovo-wmi-fn-keys.h  |  32 ++
>  7 files changed, 386 insertions(+), 179 deletions(-)
>  create mode 100644 drivers/platform/lenovo/wmi-fn-keys.c
>  create mode 100644 include/linux/platform_data/lenovo-wmi-fn-keys.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b0ad5a3debe..e2be0b7debeb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15173,6 +15173,14 @@ F:=09Documentation/wmi/devices/lenovo-wmi-other.=
rst
>  F:=09drivers/platform/lenovo/
>  F:=09drivers/platform/x86/lenovo/*
> =20
> +LENOVO WMI FN KEYS DRIVER
> +M:=09David Cemin <dcemin@nvidia.com>
> +M:=09Rong Zhang <i@rong.moe>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Maintained
> +F:=09drivers/platform/lenovo/wmi-fn-keys.c
> +F:=09include/linux/platform_data/lenovo-wmi-fn-keys.h
> +
>  LENOVO WMI HOTKEY UTILITIES DRIVER
>  M:=09Jackie Dong <xy-jackie@139.com>
>  L:=09platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/Kc=
onfig
> index 8222322ca671..f67f7c811214 100644
> --- a/drivers/platform/lenovo/Kconfig
> +++ b/drivers/platform/lenovo/Kconfig
> @@ -41,6 +41,21 @@ config LENOVO_WMI_HOTKEY_UTILITIES
>  =09  such as LED control for audio/mic mute event for Ideapad, YOGA, Xia=
oXin,
>  =09  Gaming, ThinkBook and so on.
> =20
> +config LENOVO_WMI_FN_KEYS
> +=09tristate "Lenovo WMI Fn keys driver"
> +=09depends on ACPI_WMI
> +=09depends on INPUT
> +=09select INPUT_SPARSEKMAP
> +=09help
> +=09  Say Y or M here to enable the vendor specific Fn keys (microphone
> +=09  mute, airplane mode, performance mode, star key, Fn+Esc, etc.) on
> +=09  Lenovo laptops that deliver them as WMI events. ideapad-laptop
> +=09  subscribes to this driver for its Fn lock LED and performance mode
> +=09  handling.
> +
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called lenovo-wmi-fn-keys.
> +
>  config LENOVO_WMI_CAMERA
>  =09tristate "Lenovo WMI Camera Button driver"
>  =09depends on ACPI_WMI
> diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/M=
akefile
> index 1cac115dd735..8ea207e79a43 100644
> --- a/drivers/platform/lenovo/Makefile
> +++ b/drivers/platform/lenovo/Makefile
> @@ -8,6 +8,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)=09+=3D wmi-hel=
pers.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)=09+=3D wmi-events.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)=09+=3D wmi-capdata.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)=09+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_FN_KEYS)=09+=3D wmi-fn-keys.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)=09+=3D wmi-camera.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)=09+=3D wmi-gamezone.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)=09+=3D wmi-other.o
> diff --git a/drivers/platform/lenovo/wmi-fn-keys.c b/drivers/platform/len=
ovo/wmi-fn-keys.c
> new file mode 100644
> index 000000000000..330de9529a87
> --- /dev/null
> +++ b/drivers/platform/lenovo/wmi-fn-keys.c
> @@ -0,0 +1,280 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Lenovo WMI Fn keys driver
> + *
> + * Lenovo consumer laptops deliver their vendor specific Fn keys (microp=
hone
> + * mute, airplane mode, performance mode, the star key and others) as WM=
I
> + * events on a dedicated GUID instead of keyboard usages, and the older =
Yoga
> + * models report Fn+Esc on two event GUIDs that carry no data. This driv=
er
> + * owns these event GUIDs on every architecture and reports the keys thr=
ough
> + * a sparse keymap. Drivers with platform knowledge, such as ideapad-lap=
top,
> + * subscribe to the notifier chain to act on an event and may stop the k=
ey
> + * from being reported.
> + *
> + * The keymap and the scan codes were moved here from ideapad-laptop, so=
 the
> + * input events are the same as before for userspace.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_data/lenovo-wmi-fn-keys.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include <asm/byteorder.h>
> +
> +#define LWMI_FN_KEYS_GUID=09"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
> +#define LWMI_ESC_GUID_YOGA3=09"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6"
> +#define LWMI_ESC_GUID_YOGA700=09"56322276-8493-4CE8-A783-98C991274F5E"
> +
> +/*
> + * Scan codes as ideapad-laptop reported them: the Fn key event codes ar=
e
> + * offset by LWMI_FN_KEY so they do not collide with the ACPI hotkeys of=
 that
> + * driver, and the Fn+Esc events, which carry no data, use scan code 128=
.
> + */
> +#define LWMI_FN_KEY=09=090x100
> +#define LWMI_ESC_SCANCODE=09128
> +
> +/**
> + * struct lwmi_fn_keys_info - per event GUID description
> + * @event: event type passed to the notifier chain
> + * @phys: physical path of the input device
> + * @event_size: size of the WMI event data, 0 when the GUID carries none
> + * @code: scan code base: the offset added to the event data, or the who=
le
> + *        scan code for GUIDs without event data
> + * @keymap: sparse keymap for the input device
> + */
> +struct lwmi_fn_keys_info {
> +=09enum lwmi_fn_keys_event event;
> +=09const char *phys;
> +=09size_t event_size;
> +=09u32 code;
> +=09const struct key_entry *keymap;
> +};
> +
> +struct lwmi_fn_keys {
> +=09struct input_dev *input;
> +=09const struct lwmi_fn_keys_info *info;
> +};
> +
> +static BLOCKING_NOTIFIER_HEAD(lwmi_fn_keys_chain);
> +
> +static const struct key_entry lwmi_fn_keys_keymap[] =3D {

Let's add a separator here, like:

   /*
    * WMI ignored events
    */

> +=09/* FnLock (handled by the firmware) */
> +=09{ KE_IGNORE,=090x02 | LWMI_FN_KEY },
> +=09/* Esc (handled by the firmware) */
> +=09{ KE_IGNORE,=090x03 | LWMI_FN_KEY },

Ditto, like ideapad-laptop originally did:

   /*
    * WMI keys
    */

> +
> +=09/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> +=09{ KE_KEY,=090x01 | LWMI_FN_KEY, { KEY_FAVORITES } },
> +=09{ KE_KEY,=090x04 | LWMI_FN_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> +=09/* Lenovo Support */
> +=09{ KE_KEY,=090x07 | LWMI_FN_KEY, { KEY_HELP } },
> +=09{ KE_KEY,=090x0e | LWMI_FN_KEY, { KEY_PICKUP_PHONE } },
> +=09{ KE_KEY,=090x0f | LWMI_FN_KEY, { KEY_HANGUP_PHONE } },
> +=09/* Refresh Rate Toggle (Fn+R) */
> +=09{ KE_KEY,=090x10 | LWMI_FN_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> +=09/* Dark mode toggle */
> +=09{ KE_KEY,=090x13 | LWMI_FN_KEY, { KEY_PROG1 } },
> +=09/* Sound profile switch */
> +=09{ KE_KEY,=090x12 | LWMI_FN_KEY, { KEY_PROG2 } },
> +=09/* Lenovo Virtual Background application */
> +=09{ KE_KEY,=090x28 | LWMI_FN_KEY, { KEY_PROG3 } },
> +=09/* Lenovo Support */
> +=09{ KE_KEY,=090x27 | LWMI_FN_KEY, { KEY_HELP } },
> +=09/* Refresh Rate Toggle */
> +=09{ KE_KEY,=090x0a | LWMI_FN_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> +=09/* Specific to some newer models */
> +=09{ KE_KEY,=090x3e | LWMI_FN_KEY, { KEY_MICMUTE } },
> +=09{ KE_KEY,=090x3f | LWMI_FN_KEY, { KEY_RFKILL } },
> +=09/* Star- (User Assignable Key) */
> +=09{ KE_KEY,=090x44 | LWMI_FN_KEY, { KEY_PROG1 } },
> +=09/* Eye */
> +=09{ KE_KEY,=090x45 | LWMI_FN_KEY, { KEY_PROG3 } },
> +=09/* Lenovo Smart Connect */
> +=09{ KE_KEY,=090x48 | LWMI_FN_KEY, { KEY_LINK_PHONE } },
> +=09/*
> +=09 * Performance toggle also Fn+Q, consumed by ideapad-laptop through t=
he
> +=09 * notifier chain on machines where it cycles the platform profile
> +=09 */
> +=09{ KE_KEY,=090x3d | LWMI_FN_KEY, { KEY_PERFORMANCE } },
> +=09/* Mode, opens a profile chooser; the Fn+Q button cycles the profile =
*/
> +=09{ KE_KEY,=090x46 | LWMI_FN_KEY, { KEY_PROG4 } },
> +=09/* shift + prtsc */
> +=09{ KE_KEY,=090x2d | LWMI_FN_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> +=09{ KE_KEY,=090x29 | LWMI_FN_KEY, { KEY_TOUCHPAD_TOGGLE } },
> +=09{ KE_KEY,=090x2a | LWMI_FN_KEY, { KEY_ROOT_MENU } },
> +
> +=09/*
> +=09 * WMI switches
> +=09 *
> +=09 * Some devices come with physical switches. Whenever a switch is
> +=09 * toggled, an WMI event is emitted to inform the software about the
> +=09 * switch's latest state.
> +=09 */
> +
> +=09/* Camera switch */
> +=09{ KE_SW,=090x0c | LWMI_FN_KEY, .sw =3D { SW_CAMERA_LENS_COVER, 0 } },
> +=09{ KE_SW,=090x0d | LWMI_FN_KEY, .sw =3D { SW_CAMERA_LENS_COVER, 1 } },
> +
> +=09{ KE_END }
> +};
> +
> +static const struct key_entry lwmi_esc_keymap[] =3D {
> +=09{ KE_KEY,=09LWMI_ESC_SCANCODE, { KEY_ESC } },
> +=09{ KE_END }
> +};
> +
> +static const struct lwmi_fn_keys_info lwmi_fn_keys_info_fn_keys =3D {
> +=09.event =3D LWMI_FN_KEYS_EVENT_FN_KEY,
> +=09.phys =3D "wmi/input0",
> +=09.event_size =3D sizeof(u32),
> +=09.code =3D LWMI_FN_KEY,
> +=09.keymap =3D lwmi_fn_keys_keymap,
> +};
> +
> +static const struct lwmi_fn_keys_info lwmi_fn_keys_info_esc =3D {
> +=09.event =3D LWMI_FN_KEYS_EVENT_ESC,
> +=09.phys =3D "wmi/input1",
> +=09.code =3D LWMI_ESC_SCANCODE,
> +=09.keymap =3D lwmi_esc_keymap,
> +};
> +
> +/**
> + * lwmi_fn_keys_register_notifier() - Subscribe to the Fn key events.
> + * @nb: The notifier_block to register.
> + *
> + * The callback runs in process context with the &enum lwmi_fn_keys_even=
t as
> + * the action and, for LWMI_FN_KEYS_EVENT_FN_KEY, a pointer to the u32 k=
ey
> + * code as the data. Return NOTIFY_STOP from the callback to consume the=
 event
> + * so that no key is reported.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int lwmi_fn_keys_register_notifier(struct notifier_block *nb)
> +{
> +=09return blocking_notifier_chain_register(&lwmi_fn_keys_chain, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_fn_keys_register_notifier, "LENOVO_WMI_FN_KEYS=
");
> +
> +/**
> + * lwmi_fn_keys_unregister_notifier() - Unsubscribe from the Fn key even=
ts.
> + * @nb: The notifier_block to unregister.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int lwmi_fn_keys_unregister_notifier(struct notifier_block *nb)
> +{
> +=09return blocking_notifier_chain_unregister(&lwmi_fn_keys_chain, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(lwmi_fn_keys_unregister_notifier, "LENOVO_WMI_FN_KE=
YS");
> +
> +static void devm_lwmi_fn_keys_unregister_notifier(void *data)
> +{
> +=09lwmi_fn_keys_unregister_notifier(data);
> +}
> +
> +/**
> + * devm_lwmi_fn_keys_register_notifier() - Device managed subscription.
> + * @dev: The device whose lifetime bounds the subscription.
> + * @nb: The notifier_block to register.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int devm_lwmi_fn_keys_register_notifier(struct device *dev, struct notif=
ier_block *nb)
> +{
> +=09int ret;
> +
> +=09ret =3D lwmi_fn_keys_register_notifier(nb);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return devm_add_action_or_reset(dev, devm_lwmi_fn_keys_unregister_not=
ifier, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_fn_keys_register_notifier, "LENOVO_WMI_FN=
_KEYS");
> +
> +static int lwmi_fn_keys_probe(struct wmi_device *wdev, const void *conte=
xt)
> +{
> +=09struct lwmi_fn_keys *priv;
> +=09int ret;
> +
> +=09priv =3D devm_kzalloc_obj(&wdev->dev, *priv);
> +=09if (!priv)
> +=09=09return -ENOMEM;
> +
> +=09priv->info =3D context;
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
> +=09priv->input->phys =3D priv->info->phys;
> +=09priv->input->id.bustype =3D BUS_HOST;
> +=09priv->input->dev.parent =3D &wdev->dev;
> +
> +=09ret =3D sparse_keymap_setup(priv->input, priv->info->keymap, NULL);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09dev_set_drvdata(&wdev->dev, priv);
> +
> +=09return input_register_device(priv->input);
> +}
> +
> +static void lwmi_fn_keys_notify(struct wmi_device *wdev, const struct wm=
i_buffer *buf)
> +{
> +=09struct lwmi_fn_keys *priv =3D dev_get_drvdata(&wdev->dev);
> +=09const struct lwmi_fn_keys_info *info =3D priv->info;
> +=09u32 code =3D 0;
> +=09int ret;
> +
> +=09if (buf->length < info->event_size) {
> +=09=09dev_dbg(&wdev->dev, "short event (%zu bytes)\n", buf->length);
> +=09=09return;
> +=09}
> +
> +=09if (info->event_size)
> +=09=09code =3D le32_to_cpup(buf->data);
> +
> +=09dev_dbg(&wdev->dev, "event %d code 0x%x\n", info->event, code);
> +
> +=09ret =3D blocking_notifier_call_chain(&lwmi_fn_keys_chain, info->event=
, &code);
> +=09if (ret & NOTIFY_STOP_MASK)
> +=09=09return;
> +
> +=09if (!sparse_keymap_report_event(priv->input, info->code | code, 1, tr=
ue))
> +=09=09dev_info_ratelimited(&wdev->dev, "unknown key code 0x%x\n", code);
> +}
> +
> +static const struct wmi_device_id lwmi_fn_keys_id_table[] =3D {
> +=09{ LWMI_FN_KEYS_GUID, &lwmi_fn_keys_info_fn_keys },
> +=09{ LWMI_ESC_GUID_YOGA3, &lwmi_fn_keys_info_esc },
> +=09{ LWMI_ESC_GUID_YOGA700, &lwmi_fn_keys_info_esc },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, lwmi_fn_keys_id_table);
> +
> +static struct wmi_driver lwmi_fn_keys_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "lenovo-wmi-fn-keys",
> +=09=09.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +=09},
> +=09.id_table =3D lwmi_fn_keys_id_table,
> +=09.probe =3D lwmi_fn_keys_probe,
> +=09.notify_new =3D lwmi_fn_keys_notify,
> +=09.no_singleton =3D true,
> +};
> +module_wmi_driver(lwmi_fn_keys_driver);
> +
> +MODULE_AUTHOR("David Cemin <dcemin@nvidia.com>");
> +MODULE_DESCRIPTION("Lenovo WMI Fn keys driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index 4d9a25d0e3b5..8a11c981241c 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -11,7 +11,7 @@ config IDEAPAD_LAPTOP
>  =09depends on SERIO_I8042
>  =09depends on BACKLIGHT_CLASS_DEVICE
>  =09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
> -=09depends on ACPI_WMI || ACPI_WMI =3D n
> +=09imply LENOVO_WMI_FN_KEYS

Unconditionally implying LENOVO_WMI_FN_KEYS is broken. See
Documentation/kbuild/kconfig-language.rst:

=09select should be used with care. select will force
=09a symbol to a value without visiting the dependencies.
=09By abusing select you are able to select a symbol FOO even
=09if FOO depends on BAR that is not set.

(which also applies to `imply')

In general, you can only select or imply a symbol when you've collected
all its dependencies. That's why I suggested

   imply LENOVO_WMI_FN_KEYS if ACPI_WMI

in my previous reply.

>  =09select ACPI_PLATFORM_PROFILE
>  =09select INPUT_SPARSEKMAP
>  =09select NEW_LEDS
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index f9453de6df76..92d05470dee9 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -34,7 +34,7 @@
>  #include <linux/string_choices.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> -#include <linux/wmi.h>
> +#include <linux/platform_data/lenovo-wmi-fn-keys.h>
>  #include "ideapad-laptop.h"
> =20
>  #include <acpi/battery.h>
> @@ -185,6 +185,7 @@ struct ideapad_private {
>  =09struct input_dev *inputdev;
>  =09struct backlight_device *blightdev;
>  =09struct ideapad_dytc_priv *dytc;
> +=09struct notifier_block fn_keys_nb;
>  =09struct dentry *debug;
>  =09struct acpi_battery_hook battery_hook;
>  =09const struct power_supply_ext *battery_ext;
> @@ -1317,8 +1318,6 @@ static void ideapad_unregister_rfkill(struct ideapa=
d_private *priv, int dev)
>  /*
>   * input device
>   */
> -#define IDEAPAD_WMI_KEY 0x100
> -
>  static const struct key_entry ideapad_keymap[] =3D {
>  =09{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
>  =09{ KE_KEY,   7, { KEY_CAMERA } },
> @@ -1331,65 +1330,6 @@ static const struct key_entry ideapad_keymap[] =3D=
 {
>  =09{ KE_KEY,  65, { KEY_PROG4 } },
>  =09{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
>  =09{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
> -=09{ KE_KEY, 128, { KEY_ESC } },
> -
> -=09/*
> -=09 * WMI keys
> -=09 */
> -
> -=09/* FnLock (handled by the firmware) */
> -=09{ KE_IGNORE,=090x02 | IDEAPAD_WMI_KEY },
> -=09/* Esc (handled by the firmware) */
> -=09{ KE_IGNORE,=090x03 | IDEAPAD_WMI_KEY },
> -=09/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> -=09{ KE_KEY,=090x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
> -=09{ KE_KEY,=090x04 | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> -=09/* Lenovo Support */
> -=09{ KE_KEY,=090x07 | IDEAPAD_WMI_KEY, { KEY_HELP } },
> -=09{ KE_KEY,=090x0e | IDEAPAD_WMI_KEY, { KEY_PICKUP_PHONE } },
> -=09{ KE_KEY,=090x0f | IDEAPAD_WMI_KEY, { KEY_HANGUP_PHONE } },
> -=09/* Refresh Rate Toggle (Fn+R) */
> -=09{ KE_KEY,=090x10 | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> -=09/* Dark mode toggle */
> -=09{ KE_KEY,=090x13 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> -=09/* Sound profile switch */
> -=09{ KE_KEY,=090x12 | IDEAPAD_WMI_KEY, { KEY_PROG2 } },
> -=09/* Lenovo Virtual Background application */
> -=09{ KE_KEY,=090x28 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> -=09/* Lenovo Support */
> -=09{ KE_KEY,=090x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
> -=09/* Refresh Rate Toggle */
> -=09{ KE_KEY,=090x0a | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> -=09/* Specific to some newer models */
> -=09{ KE_KEY,=090x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
> -=09{ KE_KEY,=090x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> -=09/* Star- (User Assignable Key) */
> -=09{ KE_KEY,=090x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> -=09/* Eye */
> -=09{ KE_KEY,=090x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> -=09/* Lenovo Smart Connect */
> -=09{ KE_KEY,=090x48 | IDEAPAD_WMI_KEY, { KEY_LINK_PHONE } },
> -=09/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() =
*/
> -=09{ KE_KEY,=090x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> -=09/* Mode, opens a profile chooser; the Fn+Q button cycles the profile =
*/
> -=09{ KE_KEY,=090x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> -=09/* shift + prtsc */
> -=09{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> -=09{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> -=09{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
> -
> -=09/*
> -=09 * WMI switches
> -=09 *
> -=09 * Some devices come with physical switches. Whenever a switch is
> -=09 * toggled, an WMI event is emitted to inform the software about the
> -=09 * switch's latest state.
> -=09 */
> -
> -=09/* Camera switch */
> -=09{ KE_SW,=090x0c | IDEAPAD_WMI_KEY, .sw =3D { SW_CAMERA_LENS_COVER, 0 =
} },
> -=09{ KE_SW,=090x0d | IDEAPAD_WMI_KEY, .sw =3D { SW_CAMERA_LENS_COVER, 1 =
} },
> -
>  =09{ KE_END },
>  };
> =20
> @@ -2297,49 +2237,24 @@ static int ideapad_check_features(struct ideapad_=
private *priv)
>  =09return 0;
>  }
> =20
> -#if IS_ENABLED(CONFIG_ACPI_WMI)
> +#if IS_REACHABLE(CONFIG_LENOVO_WMI_FN_KEYS)
>  /*
> - * WMI driver
> + * The vendor specific Fn keys arrive as WMI events owned by the Lenovo =
WMI
> + * Fn keys driver, which reports them as input events. Subscribe to act =
on the
> + * ones that touch the VPC state: the Fn lock LED and the performance mo=
de
> + * button, which cycles the platform profile through DYTC instead of
> + * reporting a key.
>   */
> -enum ideapad_wmi_event_type {
> -=09IDEAPAD_WMI_EVENT_ESC,
> -=09IDEAPAD_WMI_EVENT_FN_KEYS,
> -};
> -
> -struct ideapad_wmi_private {
> -=09enum ideapad_wmi_event_type event;
> -};
> -
> -static int ideapad_wmi_probe(struct wmi_device *wdev, const void *contex=
t)
> +static int ideapad_fn_keys_notify(struct notifier_block *nb, unsigned lo=
ng event,
> +=09=09=09=09  void *data)
>  {
> -=09struct ideapad_wmi_private *wpriv;
> +=09struct ideapad_private *priv =3D container_of(nb, struct ideapad_priv=
ate, fn_keys_nb);
> +=09u32 code;
> =20
> -=09wpriv =3D devm_kzalloc_obj(&wdev->dev, *wpriv);
> -=09if (!wpriv)
> -=09=09return -ENOMEM;
> -
> -=09*wpriv =3D *(const struct ideapad_wmi_private *)context;
> -
> -=09dev_set_drvdata(&wdev->dev, wpriv);
> -=09return 0;
> -}
> -
> -static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_objec=
t *data)
> -{
> -=09struct ideapad_wmi_private *wpriv =3D dev_get_drvdata(&wdev->dev);
> -=09struct ideapad_private *priv;
> -
> -=09guard(mutex)(&ideapad_shared_mutex);
> -
> -=09priv =3D ideapad_shared;
> -=09if (!priv)
> -=09=09return;
> -
> -=09switch (wpriv->event) {
> -=09case IDEAPAD_WMI_EVENT_ESC:
> -=09=09ideapad_input_report(priv, 128);
> +=09switch (event) {
> +=09case LWMI_FN_KEYS_EVENT_ESC:
>  =09=09break;
> -=09case IDEAPAD_WMI_EVENT_FN_KEYS:
> +=09case LWMI_FN_KEYS_EVENT_FN_KEY:
>  =09=09if (priv->features.set_fn_lock_led) {
>  =09=09=09int brightness =3D ideapad_fn_lock_get(priv);
> =20
> @@ -2349,72 +2264,44 @@ static void ideapad_wmi_notify(struct wmi_device =
*wdev, union acpi_object *data)
>  =09=09=09}
>  =09=09}
> =20
> -=09=09if (data->type !=3D ACPI_TYPE_INTEGER) {
> -=09=09=09dev_warn(&wdev->dev,
> -=09=09=09=09 "WMI event data is not an integer\n");
> -=09=09=09break;
> -=09=09}
> -
> -=09=09dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
> -=09=09=09data->integer.value);
> +=09=09code =3D *(u32 *)data;
> +=09=09dev_dbg(&priv->platform_device->dev, "WMI fn-key event: 0x%x\n", c=
ode);

Let's drop the dev_dbg() as there is already a dev_dbg() in
lwmi_fn_keys_notify().

With all these issues fixed:

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> =20
> -=09=09/* performance button triggered by 0x3d */
> -=09=09if (data->integer.value =3D=3D 0x3d && priv->dytc) {
> -=09=09=09platform_profile_cycle();
> +=09=09switch (code) {
> +=09=09case 0x3d:
> +=09=09=09/* performance button */
> +=09=09=09if (priv->dytc) {
> +=09=09=09=09platform_profile_cycle();
> +=09=09=09=09return NOTIFY_STOP;
> +=09=09=09}
> +=09=09=09break;
> +=09=09case 0x02:
> +=09=09case 0x03:
> +=09=09=09/* 0x02 FnLock, 0x03 Esc */
> +=09=09=09ideapad_fn_lock_led_notify(priv, code =3D=3D 0x02);
>  =09=09=09break;
>  =09=09}
> -
> -=09=09/* 0x02 FnLock, 0x03 Esc */
> -=09=09if (data->integer.value =3D=3D 0x02 || data->integer.value =3D=3D =
0x03)
> -=09=09=09ideapad_fn_lock_led_notify(priv, data->integer.value =3D=3D 0x0=
2);
> -
> -=09=09ideapad_input_report(priv,
> -=09=09=09=09     data->integer.value | IDEAPAD_WMI_KEY);
> -
>  =09=09break;
>  =09}
> -}
> =20
> -static const struct ideapad_wmi_private ideapad_wmi_context_esc =3D {
> -=09.event =3D IDEAPAD_WMI_EVENT_ESC
> -};
> -
> -static const struct ideapad_wmi_private ideapad_wmi_context_fn_keys =3D =
{
> -=09.event =3D IDEAPAD_WMI_EVENT_FN_KEYS
> -};
> -
> -static const struct wmi_device_id ideapad_wmi_ids[] =3D {
> -=09{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc },=
 /* Yoga 3 */
> -=09{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc },=
 /* Yoga 700 */
> -=09{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_key=
s }, /* Legion 5 */
> -=09{},
> -};
> -MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
> -
> -static struct wmi_driver ideapad_wmi_driver =3D {
> -=09.driver =3D {
> -=09=09.name =3D "ideapad_wmi",
> -=09},
> -=09.id_table =3D ideapad_wmi_ids,
> -=09.min_event_size =3D sizeof(u32),
> -=09.probe =3D ideapad_wmi_probe,
> -=09.notify =3D ideapad_wmi_notify,
> -};
> +=09return NOTIFY_OK;
> +}
> =20
> -static int ideapad_wmi_driver_register(void)
> +static int ideapad_fn_keys_register(struct ideapad_private *priv)
>  {
> -=09return wmi_driver_register(&ideapad_wmi_driver);
> +=09priv->fn_keys_nb.notifier_call =3D ideapad_fn_keys_notify;
> +
> +=09return lwmi_fn_keys_register_notifier(&priv->fn_keys_nb);
>  }
> =20
> -static void ideapad_wmi_driver_unregister(void)
> +static void ideapad_fn_keys_unregister(struct ideapad_private *priv)
>  {
> -=09return wmi_driver_unregister(&ideapad_wmi_driver);
> +=09lwmi_fn_keys_unregister_notifier(&priv->fn_keys_nb);
>  }
> -
> -#else
> -static inline int ideapad_wmi_driver_register(void) { return 0; }
> -static inline void ideapad_wmi_driver_unregister(void) { }
> -#endif
> +#else /* CONFIG_LENOVO_WMI_FN_KEYS */
> +static inline int ideapad_fn_keys_register(struct ideapad_private *priv)=
 { return 0; }
> +static inline void ideapad_fn_keys_unregister(struct ideapad_private *pr=
iv) { }
> +#endif /* CONFIG_LENOVO_WMI_FN_KEYS */
> =20
>  /*
>   * ACPI driver
> @@ -2496,6 +2383,10 @@ static int ideapad_acpi_add(struct platform_device=
 *pdev)
>  =09=09=09dev_info(&pdev->dev, "DYTC interface is not available\n");
>  =09}
> =20
> +=09err =3D ideapad_fn_keys_register(priv);
> +=09if (err)
> +=09=09dev_warn(&pdev->dev, "Could not subscribe to the WMI Fn key events=
: %d\n", err);
> +
>  =09if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_vendor) {
>  =09=09err =3D ideapad_backlight_init(priv);
>  =09=09if (err && err !=3D -ENODEV)
> @@ -2527,6 +2418,7 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
>  =09ideapad_backlight_exit(priv);
> =20
>  backlight_failed:
> +=09ideapad_fn_keys_unregister(priv);
>  =09ideapad_dytc_profile_exit(priv);
> =20
>  =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
> @@ -2556,6 +2448,7 @@ static void ideapad_acpi_remove(struct platform_dev=
ice *pdev)
>  =09=09=09=09   ideapad_acpi_notify);
> =20
>  =09ideapad_backlight_exit(priv);
> +=09ideapad_fn_keys_unregister(priv);
>  =09ideapad_dytc_profile_exit(priv);
> =20
>  =09for (i =3D 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
> @@ -2600,31 +2493,9 @@ static struct platform_driver ideapad_acpi_driver =
=3D {
>  =09},
>  };
> =20
> -static int __init ideapad_laptop_init(void)
> -{
> -=09int err;
> -
> -=09err =3D ideapad_wmi_driver_register();
> -=09if (err)
> -=09=09return err;
> -
> -=09err =3D platform_driver_register(&ideapad_acpi_driver);
> -=09if (err) {
> -=09=09ideapad_wmi_driver_unregister();
> -=09=09return err;
> -=09}
> -
> -=09return 0;
> -}
> -module_init(ideapad_laptop_init)
> -
> -static void __exit ideapad_laptop_exit(void)
> -{
> -=09platform_driver_unregister(&ideapad_acpi_driver);
> -=09ideapad_wmi_driver_unregister();
> -}
> -module_exit(ideapad_laptop_exit)
> +module_platform_driver(ideapad_acpi_driver);
> =20
>  MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
>  MODULE_DESCRIPTION("IdeaPad ACPI Extras");
> +MODULE_IMPORT_NS("LENOVO_WMI_FN_KEYS");
>  MODULE_LICENSE("GPL");
> diff --git a/include/linux/platform_data/lenovo-wmi-fn-keys.h b/include/l=
inux/platform_data/lenovo-wmi-fn-keys.h
> new file mode 100644
> index 000000000000..4a737990b184
> --- /dev/null
> +++ b/include/linux/platform_data/lenovo-wmi-fn-keys.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Lenovo WMI Fn keys driver, notifier interface for drivers that want t=
o act
> + * on the vendor specific Fn key events before a key is reported.
> + */
> +
> +#ifndef _LENOVO_WMI_FN_KEYS_H_
> +#define _LENOVO_WMI_FN_KEYS_H_
> +
> +struct device;
> +struct notifier_block;
> +
> +/**
> + * enum lwmi_fn_keys_event - notifier chain actions
> + * @LWMI_FN_KEYS_EVENT_ESC: Fn+Esc from one of the Esc event GUIDs, whic=
h
> + *                          carry no event data
> + * @LWMI_FN_KEYS_EVENT_FN_KEY: a key from the Fn key event GUID, the not=
ifier
> + *                             data points to the u32 key code
> + *
> + * A callback that handles the event itself returns NOTIFY_STOP to suppr=
ess
> + * the input report; NOTIFY_OK or NOTIFY_DONE let it through.
> + */
> +enum lwmi_fn_keys_event {
> +=09LWMI_FN_KEYS_EVENT_ESC,
> +=09LWMI_FN_KEYS_EVENT_FN_KEY,
> +};
> +
> +int lwmi_fn_keys_register_notifier(struct notifier_block *nb);
> +int lwmi_fn_keys_unregister_notifier(struct notifier_block *nb);
> +int devm_lwmi_fn_keys_register_notifier(struct device *dev, struct notif=
ier_block *nb);
> +
> +#endif /* _LENOVO_WMI_FN_KEYS_H_ */
