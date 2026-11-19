Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068657;
	b=b5oxqPcbnkQKDfPRw1pCboe4CYPLKtFKj4W1VU2yG8ZTpKcaCAe9L/47mahOo5nGODLb
	 2d6XVRsxXRBvH6TbQdVEtdP97rM6vrWnHB7aEbt4CBdwaRqPv+wSYqqp4uTCzYp+OPUV7
	 d4oXnjBcDdVd+jpqqAnrP4dvDR733/L3rmq75h3X2mv4VyjtbDFPtWm8GJMF1I+OQoJPj
	 cIolvxHxvXsNTrnA3NRp02qCWBbNcjQ/zk7HUTuatBc+XzCNgloVXa/SiL3Cz7L4fvFvp
	 Nv/Fg0EgbGbz2Q4RF+AXTqk96Vc1Ye0K/uXor6+B7QUHmdFaWGHvKwvkSKloE48PrqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068657;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=LVayetwvBdjCid3milUZu8gE/Xa9+JvwtNmwQVAFWPE=;
	b=DqBHFEMNamL41yShK0YMS2Topl68ojTy4BX1IAXqmHzr4OvL4Y0QTwNwN9+v0LzpcOxj
	 1DY9qJcgtwNY6fYqXwFMBPjjFgUjOHkfNQ/9UDqiqeqFdTpiCsk0JIwbCS3ZfIDB6TV5I
	 U2vuThJzwJGiR25oyGKnpDgfQlqKRnc6FW4ZkZECbM1eesOneCl6Cusk0GG8fe8EqYWJc
	 nKTUCIvh6neQUw0MrOsYzQ/5j68j2tpuGz8R5wOq/FoyOcl7VIjzAIPouTkdmIBkgoY0V
	 KzDspMpEKZbN51bl4I3S+xAWRYz1bSjeoA2i4ZYgpnZ/a/3x5W02aiEb7pGJysWGM8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=mTrnBQ1j;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2C8606A333
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 06:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD2C8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=mTrnBQ1j
DKIM2-Signature:  i=1; m=1; t=1795068654;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:O6D3rUthTtQUVxUvP6/y1YV0I4vg
   BZ/dNCtT+LvMWLbtVw0Z7xMAdl8Xdqx5GIV1tM8f71up3eDLzjJg+Txs+vqKn6jIR8uz/y9QCng
   RLSpuZ5b6xwHEeM+ZU6D36LdjWlo59XMFOQ/d45vp7roxELuI/XBRkg6bOiwHTwa+AEtmeilBwo
   rZGPsPn8FAYxqKUzFhV6QXbEYYj3lVGqVBwJaSHLrqHZx91jKjr/EqpLkkOGX/a2ST5JEOQ/Uyw
   iUY3GCf5TxK3gVgazyzYuEO9sWisd8TTMBEcKMAqkOVNMEafoxZwQkRYOBoqia0/db3NX7uTvcU
   MFFqmidX59Th5Q==;
Message-Instance:  m=1;
 h=sha256:
   xlux87mzfl1UimEm0OZArWXwB6Gb4oZ8N9WksUFe8Uw=:
   2iVhFLHjGoxdsS9Xbc10pK29TxkHSEGrVxf33oT1NRk=,
  sha512:
   PR9eAQDxHgYP6mZKfIsn13KnnYzr7yoiv29gAraRvdv0osnHc+HPn091zCehAD3Dd2kSyT0b6pDn0uGmxX73PQ==:
   pbPgxNoZLk9efYn/ENCsFpfNiwuD+vtygU5HJDWS3hGSPsU8xcnwY2nvA1MU00FukDGgG5KEirw6BDYoScrwEQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795068642; x=1795673442; i=w_armin@gmx.de;
	bh=LVayetwvBdjCid3milUZu8gE/Xa9+JvwtNmwQVAFWPE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mTrnBQ1j4JRbVBFR0kC4HGSsOfE8eqKoMn9o9A01VyRmpk4/WxnxUbw6ccnaYUA0
	 czD7Px39w5LYQFB0ZPvBE0M/WUTyM+/s5FmZyowLF9kToYJkNCrYsCbmfQ4vhIjO+
	 3mOWnHgsl+htiQz9kWIB1HhNZnJyySDUfyv/U9Q29mIPX+QNYNQQ9QnDJBeSzkgZI
	 KY0fvpfv2vxjzT3cOIimBDe2+wHG8yGhBgqt10PpvGb5Y/twPbN3oBIrM+NgAtqMB
	 z4IJAqndHWWYsL2qSwQVVNrycfJeYOP6E+/NfunOCd1byph8q2HJxLLcNcwPrvzDK
	 HF7Ll5kQI3+ipHS0Jg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU4y-1wtUbm1wF2-00ZUyF; Thu, 19
 Nov 2026 07:10:42 +0100
Message-ID: <5a959dbd-b8a9-41e9-b829-5ce3a425988d@gmx.de>
Date: Thu, 19 Nov 2026 07:10:39 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform: lenovo: add WMI hotkeys driver
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, xy-jackie@139.com,
 ikepanhc@gmail.com, i@rong.moe, marco_giunta@outlook.it,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 ldemarchi@nvidia.com
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <20261119022719.3089229-1-dcemin@nvidia.com>
 <20261119022719.3089229-3-dcemin@nvidia.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261119022719.3089229-3-dcemin@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WeYj8ER1jo7bVE5T262bMyI/morW3SIFK4QIpWCOSLIUNhWKFPj
 Ynre78Vx6y/10p8s94QhNh+T3ri1/cDg/17+Kw6zkGy1oHiQwLbbr/lT2m21aFUVOPtyMIW
 7X6K9RzEFMHDmzMrdQ+RXp0i3voCxSLzSRwG14fLbunOFNF8WPiiE4hmtrZFYUuuTrhbyoa
 OUzUj4zX7XIRRozuHG50Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2eool+DTm88=;qWg+CsiUxeWYt4Z+ccUJbp72Lcx
 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
 vBIPEQQZVeZLk+kxaPWsrEaFUcMBv0=

Am 19.11.26 um 03:27 schrieb David Cemin:

> Lenovo consumer laptops deliver their vendor specific Fn keys (microphon=
e
> mute, airplane mode, performance mode, the Smart Key, Smart Connect and
> others) as WMI events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294
> instead of keyboard usages, and the Yoga 3 and Yoga 700 generations
> report Fn+Esc on two dedicated event GUIDs that carry no data. On x86
> ideapad-laptop consumes these events together with the IdeaPad VPC
> device; that driver depends on i8042 and the VPC, neither of which exist
> on the ACPI based arm64 models, so the keys do nothing there.
>
> Add a small WMI driver that owns these event GUIDs on every architecture
> and reports the keys through a sparse keymap, using the key codes
> ideapad-laptop has used for them, including code 128 for the Fn+Esc
> events. The input device keeps the ideapad-laptop name so that the
> existing hwdb mappings for these keys continue to apply.
>
> Drivers with platform knowledge can subscribe to a notifier chain that
> is called with the event code before the key is reported; a subscriber
> that handles the event itself returns NOTIFY_STOP and no key is
> reported. ideapad-laptop uses this for the Fn lock LED and the
> performance mode button, which cycles the platform profile instead of
> producing a key.
>
> The camera lens cover switch (events 0x0c and 0x0d) is reported as
> SW_CAMERA_LENS_COVER, as ideapad-laptop does today.
>
> Tested on a Lenovo Yoga 9 2-in-1 16 (arm64): microphone mute, airplane
> mode, the Smart Key, the Smart Connect key and the Fn+Q performance key
> report input events. The Esc event GUIDs are not exposed by that
> firmware, so that path is compile tested only.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: David Cemin <dcemin@nvidia.com>
> ---
>   MAINTAINERS                                   |   7 +
>   drivers/platform/lenovo/Kconfig               |  14 +
>   drivers/platform/lenovo/Makefile              |   1 +
>   drivers/platform/lenovo/wmi-hotkeys.c         | 244 ++++++++++++++++++
>   .../platform_data/x86/lenovo-wmi-hotkeys.h    |  28 ++
>   5 files changed, 294 insertions(+)
>   create mode 100644 drivers/platform/lenovo/wmi-hotkeys.c
>   create mode 100644 include/linux/platform_data/x86/lenovo-wmi-hotkeys.=
h
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3b0ad5a3debe..1d5b08c033b1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15173,6 +15173,13 @@ F:	Documentation/wmi/devices/lenovo-wmi-other.r=
st
>   F:	drivers/platform/lenovo/
>   F:	drivers/platform/x86/lenovo/*
>  =20
> +LENOVO WMI HOTKEYS DRIVER
> +M:	David Cemin <dcemin@nvidia.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/lenovo/wmi-hotkeys.c
> +F:	include/linux/platform_data/x86/lenovo-wmi-hotkeys.h
> +
>   LENOVO WMI HOTKEY UTILITIES DRIVER
>   M:	Jackie Dong <xy-jackie@139.com>
>   L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/lenovo/Kconfig b/drivers/platform/lenovo/K=
config
> index 8222322ca671..2810c995ee8c 100644
> --- a/drivers/platform/lenovo/Kconfig
> +++ b/drivers/platform/lenovo/Kconfig
> @@ -41,6 +41,20 @@ config LENOVO_WMI_HOTKEY_UTILITIES
>   	  such as LED control for audio/mic mute event for Ideapad, YOGA, Xia=
oXin,
>   	  Gaming, ThinkBook and so on.
>  =20
> +config LENOVO_WMI_HOTKEYS
> +	tristate "Lenovo WMI hotkeys driver"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	help
> +	  Say Y or M here to enable the vendor specific Fn keys (microphone
> +	  mute, airplane mode, performance mode, star key, Fn+Esc) on Lenovo
> +	  laptops that deliver them as WMI events. ideapad-laptop subscribes
> +	  to this driver for its Fn lock LED and performance mode handling.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called lenovo-wmi-hotkeys.
> +
>   config LENOVO_WMI_CAMERA
>   	tristate "Lenovo WMI Camera Button driver"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/lenovo/Makefile b/drivers/platform/lenovo/=
Makefile
> index 1cac115dd735..d3f5e3ac14c2 100644
> --- a/drivers/platform/lenovo/Makefile
> +++ b/drivers/platform/lenovo/Makefile
> @@ -8,6 +8,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+=3D wmi-help=
ers.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+=3D wmi-events.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_CAPDATA)	+=3D wmi-capdata.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)	+=3D wmi-hotkey-ut=
ilities.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_HOTKEYS)	+=3D wmi-hotkeys.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+=3D wmi-camera.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+=3D wmi-gamezone.o
>   lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)	+=3D wmi-other.o
> diff --git a/drivers/platform/lenovo/wmi-hotkeys.c b/drivers/platform/le=
novo/wmi-hotkeys.c
> new file mode 100644
> index 000000000000..f412652e9f72
> --- /dev/null
> +++ b/drivers/platform/lenovo/wmi-hotkeys.c
> @@ -0,0 +1,244 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Lenovo WMI hotkeys driver
> + *
> + * Lenovo consumer laptops deliver their vendor specific Fn keys (micro=
phone
> + * mute, airplane mode, performance mode, the star key and others) as W=
MI
> + * events on GUID 8FC0DE0C-B4E4-43FD-B0F3-8871711C1294 instead of keybo=
ard
> + * usages, and the older Yoga models report Fn+Esc on two dedicated eve=
nt
> + * GUIDs that carry no data. This driver owns these event GUIDs on ever=
y
> + * architecture and reports the keys through a sparse keymap. Drivers w=
ith
> + * platform knowledge, such as ideapad-laptop, subscribe to the notifie=
r chain
> + * to act on an event and may stop the key from being reported.
> + *
> + * The key codes follow the mapping historically used by ideapad-laptop=
.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/export.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_data/x86/lenovo-wmi-hotkeys.h>
> +#include <linux/types.h>
> +#include <linux/wmi.h>
> +
> +#include <asm/byteorder.h>
> +
> +#define LENOVO_FN_KEYS_WMI_GUID	"8FC0DE0C-B4E4-43FD-B0F3-8871711C1294"
> +/* Fn+Esc on the Yoga 3 and Yoga 700 generations, no event data */
> +#define LENOVO_ESC_WMI_GUID_YOGA3	"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6=
"
> +#define LENOVO_ESC_WMI_GUID_YOGA700	"56322276-8493-4CE8-A783-98C991274F=
5E"
> +
> +/*
> + * The Esc event GUIDs carry no key code; they are reported under
> + * LENOVO_WMI_HOTKEYS_ESC_CODE, the code ideapad-laptop has always used=
 for
> + * them, so the existing hwdb mappings keep applying. The Fn key GUID c=
odes
> + * are all below 0x80.
> + */
> +
> +enum lenovo_wmi_hotkeys_type {
> +	LENOVO_WMI_HOTKEYS_FN_KEYS,
> +	LENOVO_WMI_HOTKEYS_ESC,
> +};
> +
> +static const enum lenovo_wmi_hotkeys_type lenovo_wmi_hotkeys_fn_keys =
=3D LENOVO_WMI_HOTKEYS_FN_KEYS;
> +static const enum lenovo_wmi_hotkeys_type lenovo_wmi_hotkeys_esc =3D LE=
NOVO_WMI_HOTKEYS_ESC;
> +
> +static BLOCKING_NOTIFIER_HEAD(lenovo_wmi_hotkeys_chain);
> +
> +static const struct key_entry lenovo_wmi_hotkeys_keymap[] =3D {
> +	/* Fn+Esc from the Esc event GUIDs */
> +	{ KE_KEY, LENOVO_WMI_HOTKEYS_ESC_CODE, { KEY_ESC } },
> +	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> +	{ KE_KEY, 0x01, { KEY_FAVORITES } },
> +	/* Fn lock toggled on / off, handled by the firmware */
> +	{ KE_IGNORE, 0x02 },
> +	/* Esc, handled by the firmware */
> +	{ KE_IGNORE, 0x03 },
> +	{ KE_KEY, 0x04, { KEY_SELECTIVE_SCREENSHOT } },
> +	/* Lenovo Support */
> +	{ KE_KEY, 0x07, { KEY_HELP } },
> +	/* Refresh Rate Toggle */
> +	{ KE_KEY, 0x0a, { KEY_REFRESH_RATE_TOGGLE } },
> +	/* Camera lens cover closed / opened */
> +	{ KE_SW, 0x0c, .sw =3D { SW_CAMERA_LENS_COVER, 0 } },
> +	{ KE_SW, 0x0d, .sw =3D { SW_CAMERA_LENS_COVER, 1 } },
> +	{ KE_KEY, 0x0e, { KEY_PICKUP_PHONE } },
> +	{ KE_KEY, 0x0f, { KEY_HANGUP_PHONE } },
> +	/* Refresh Rate Toggle (Fn+R) */
> +	{ KE_KEY, 0x10, { KEY_REFRESH_RATE_TOGGLE } },
> +	/* Sound profile switch */
> +	{ KE_KEY, 0x12, { KEY_PROG2 } },
> +	/* Dark mode toggle */
> +	{ KE_KEY, 0x13, { KEY_PROG1 } },
> +	/* Lenovo Support */
> +	{ KE_KEY, 0x27, { KEY_HELP } },
> +	/* Lenovo Virtual Background application */
> +	{ KE_KEY, 0x28, { KEY_PROG3 } },
> +	{ KE_KEY, 0x29, { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY, 0x2a, { KEY_ROOT_MENU } },
> +	/* Shift + PrtSc */
> +	{ KE_KEY, 0x2d, { KEY_SELECTIVE_SCREENSHOT } },
> +	/* Performance mode toggle, Fn+Q */
> +	{ KE_KEY, 0x3d, { KEY_PERFORMANCE } },
> +	{ KE_KEY, 0x3e, { KEY_MICMUTE } },
> +	{ KE_KEY, 0x3f, { KEY_RFKILL } },
> +	/*
> +	 * Keyboard backlight level after Fn+Space, handled by the firmware:
> +	 * 0x40 off, 0x41 low, 0x42 high, 0x43 also seen
> +	 */
> +	{ KE_IGNORE, 0x40 },
> +	{ KE_IGNORE, 0x41 },
> +	{ KE_IGNORE, 0x42 },
> +	{ KE_IGNORE, 0x43 },
> +	/* Star, user assignable key */
> +	{ KE_KEY, 0x44, { KEY_PROG1 } },
> +	/* Eye care */
> +	{ KE_KEY, 0x45, { KEY_PROG3 } },
> +	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile *=
/
> +	{ KE_KEY, 0x46, { KEY_PROG4 } },
> +	/* Lenovo Smart Connect */
> +	{ KE_KEY, 0x48, { KEY_LINK_PHONE } },
> +	{ KE_END },
> +};
> +
> +struct lenovo_wmi_hotkeys {
> +	struct input_dev *input;
> +	enum lenovo_wmi_hotkeys_type type;
> +};
> +
> +/**
> + * lenovo_wmi_hotkeys_register_notifier() - Subscribe to the hotkey eve=
nts.
> + * @nb: The notifier_block to register.
> + *
> + * The callback runs in process context with the WMI event code as the
> + * action. Return NOTIFY_STOP from the callback to consume the event.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int lenovo_wmi_hotkeys_register_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_register(&lenovo_wmi_hotkeys_chain, nb)=
;
> +}
> +EXPORT_SYMBOL_NS_GPL(lenovo_wmi_hotkeys_register_notifier, "LENOVO_WMI_=
HOTKEYS");
> +
> +/**
> + * lenovo_wmi_hotkeys_unregister_notifier() - Unsubscribe from the hotk=
ey events.
> + * @nb: The notifier_block to unregister.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int lenovo_wmi_hotkeys_unregister_notifier(struct notifier_block *nb)
> +{
> +	return blocking_notifier_chain_unregister(&lenovo_wmi_hotkeys_chain, n=
b);
> +}
> +EXPORT_SYMBOL_NS_GPL(lenovo_wmi_hotkeys_unregister_notifier, "LENOVO_WM=
I_HOTKEYS");
>
> +static void devm_lenovo_wmi_hotkeys_unregister_notifier(void *data)
> +{
> +	lenovo_wmi_hotkeys_unregister_notifier(data);
> +}
> +
> +/**
> + * devm_lenovo_wmi_hotkeys_register_notifier() - Device managed subscri=
ption.
> + * @dev: The device whose lifetime bounds the subscription.
> + * @nb: The notifier_block to register.
> + *
> + * Return: 0 on success, or a negative error code.
> + */
> +int devm_lenovo_wmi_hotkeys_register_notifier(struct device *dev,
> +					      struct notifier_block *nb)
> +{
> +	int ret;
> +
> +	ret =3D lenovo_wmi_hotkeys_register_notifier(nb);
> +	if (ret)
> +		return ret;
> +
> +	return devm_add_action_or_reset(dev, devm_lenovo_wmi_hotkeys_unregiste=
r_notifier, nb);
> +}
> +EXPORT_SYMBOL_NS_GPL(devm_lenovo_wmi_hotkeys_register_notifier, "LENOVO=
_WMI_HOTKEYS");
> +
> +static int lenovo_wmi_hotkeys_probe(struct wmi_device *wdev, const void=
 *context)
> +{
> +	struct lenovo_wmi_hotkeys *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc_obj(&wdev->dev, *priv);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->type =3D *(const enum lenovo_wmi_hotkeys_type *)context;
> +
> +	priv->input =3D devm_input_allocate_device(&wdev->dev);
> +	if (!priv->input)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Same name as the ideapad-laptop input device so that the existing
> +	 * hwdb keyboard mappings for these keys keep applying.
> +	 */
> +	priv->input->name =3D "Ideapad extra buttons";
> +	priv->input->phys =3D priv->type =3D=3D LENOVO_WMI_HOTKEYS_ESC ? "wmi/=
input1" : "wmi/input0";
> +	priv->input->id.bustype =3D BUS_HOST;
> +	priv->input->dev.parent =3D &wdev->dev;
> +
> +	ret =3D sparse_keymap_setup(priv->input, lenovo_wmi_hotkeys_keymap, NU=
LL);
> +	if (ret)
> +		return ret;
> +
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	return input_register_device(priv->input);
> +}
> +
> +static void lenovo_wmi_hotkeys_notify(struct wmi_device *wdev, const st=
ruct wmi_buffer *buf)
> +{
> +	struct lenovo_wmi_hotkeys *priv =3D dev_get_drvdata(&wdev->dev);
> +	u32 code;
> +	int ret;
> +
> +	if (priv->type =3D=3D LENOVO_WMI_HOTKEYS_ESC) {
> +		code =3D LENOVO_WMI_HOTKEYS_ESC_CODE;
> +	} else {
> +		if (buf->length < sizeof(u32)) {
> +			dev_dbg(&wdev->dev, "short hotkey event (%zu bytes)\n", buf->length)=
;
> +			return;
> +		}
> +		code =3D le32_to_cpup(buf->data);
> +	}
> +
> +	dev_dbg(&wdev->dev, "hotkey event 0x%x\n", code);
> +
> +	ret =3D blocking_notifier_call_chain(&lenovo_wmi_hotkeys_chain, code, =
NULL);
> +	if (ret & NOTIFY_STOP_MASK)
> +		return;
> +
> +	if (!sparse_keymap_report_event(priv->input, code, 1, true))
> +		dev_info_ratelimited(&wdev->dev, "unknown hotkey event 0x%x\n", code)=
;
> +}
> +
> +static const struct wmi_device_id lenovo_wmi_hotkeys_id_table[] =3D {
> +	{ LENOVO_FN_KEYS_WMI_GUID, &lenovo_wmi_hotkeys_fn_keys },
> +	{ LENOVO_ESC_WMI_GUID_YOGA3, &lenovo_wmi_hotkeys_esc },
> +	{ LENOVO_ESC_WMI_GUID_YOGA700, &lenovo_wmi_hotkeys_esc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_hotkeys_id_table);
> +
> +static struct wmi_driver lenovo_wmi_hotkeys_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo-wmi-hotkeys",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D lenovo_wmi_hotkeys_id_table,
> +	.probe =3D lenovo_wmi_hotkeys_probe,
> +	.notify_new =3D lenovo_wmi_hotkeys_notify,
> +	.no_singleton =3D true,
> +};
> +module_wmi_driver(lenovo_wmi_hotkeys_driver);
> +
> +MODULE_DESCRIPTION("Lenovo WMI hotkeys driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/platform_data/x86/lenovo-wmi-hotkeys.h b/incl=
ude/linux/platform_data/x86/lenovo-wmi-hotkeys.h
> new file mode 100644
> index 000000000000..cf07eb00f3bb
> --- /dev/null
> +++ b/include/linux/platform_data/x86/lenovo-wmi-hotkeys.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Lenovo WMI hotkeys driver, notifier interface for drivers that want =
to act
> + * on the vendor specific Fn key events before a key is reported.
> + */
> +
> +#ifndef _LENOVO_WMI_HOTKEYS_H_
> +#define _LENOVO_WMI_HOTKEYS_H_
> +
> +struct device;
> +struct notifier_block;
> +
> +/* Code reported for the Fn+Esc event GUIDs, as ideapad-laptop always d=
id */
> +#define LENOVO_WMI_HOTKEYS_ESC_CODE	128
> +
> +/*
> + * Notifier callbacks receive the WMI event code as the action and no d=
ata:
> + * the Fn key code from the Fn key event GUID, or LENOVO_WMI_HOTKEYS_ES=
C_CODE
> + * for the Fn+Esc event GUIDs, which carry none. A callback that handle=
s the
> + * event itself returns NOTIFY_STOP to suppress the input report; NOTIF=
Y_OK or
> + * NOTIFY_DONE let it through.
> + */
> +int lenovo_wmi_hotkeys_register_notifier(struct notifier_block *nb);
> +int lenovo_wmi_hotkeys_unregister_notifier(struct notifier_block *nb);
> +int devm_lenovo_wmi_hotkeys_register_notifier(struct device *dev,
> +					      struct notifier_block *nb);
> +
> +#endif /* _LENOVO_WMI_HOTKEYS_H_ */
