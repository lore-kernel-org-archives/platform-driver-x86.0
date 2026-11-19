Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795093570;
	b=fzVexKJz5uzoYNtMrdvc+GSSoLfk8ayfaqNwRshX0XBkr68vRfojj3Vm4GZQ9BYR4czM
	 XDfwD2gD3Qe5GlFH+d48yjBB9smtZL0xg1vuych9+8i5Mll0Tdu3hwt9b6oDEgE/UbRQM
	 m4FwzxINIhZi5MkVoZ/FCAZ5eLt/1+kHWC9exIixobK4ZuHadEZcH9AwDYKfNWmFBJuM3
	 sy2j+VAGcPjHXTIaoQU1kCGSayKY8EC6BiPU+8DygopijSiaLfpFNV9fD82WvsNirfWIe
	 FXEfQ6UvzHvk/W0DpvqcyJrs9pjai51aUrTr9+p7M3cdUUglMGuZd88fy6tYIcPopvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093570;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=BeIJTDd0GO41hpgbBvOOGbke2MmraRb4X57p0mXGR4U=;
	b=5avJOgsKy0UJpjHcAicqc0OwBjmObt4Annvr/AJ3kvTUZ3p6r5LLuipEkAAqQ/Hg3eXd
	 5FCEEqsBEebBv+IMmskazpb8yq3bKNJzbXYy8t/kKGfIZTPKghlMgzSCST3w85kI0iQVx
	 oLOa2t1sDiK3QqbTgZ1naa/k/FronkxGjfS7kO58xY7bWaQ/TFtPcnAJ2OOfS1lXXTukR
	 aI9xV6Hj+St+7QFraWcJeZKX7H8erAghn0MdVYb202DgzfUE4++Oc1TRgpDCEQVDKwOK+
	 /lKLb302Aktm9NdNtrrmzu+wXmH+HuY9+hAWL4cNIude7aK605OwOLfNTsblUFiVQSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=FniwXGyQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317D4606A320;
	Thu, 19 Nov 2026 13:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 317D4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=FniwXGyQ
ARC-Seal: i=1; a=rsa-sha256; t=1795093555; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aH0MG9Od9iikgcoK9IkWr35uPfGmP+eanLBk/Ht2KjEk76cH28LmSbOv3aVAd3TsZN3zIruENYdfJd6O4LosijX5X+sePgroUl3R4q5YHDx5+5PxMJJu5e74U3jRSC4j8HRT2w/0WCijbuzCeOBhJDs0MY28O4ZMgbP4q/aQQ/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795093555; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BeIJTDd0GO41hpgbBvOOGbke2MmraRb4X57p0mXGR4U=; 
	b=hS2yUSD31Bo/iA1vJG7ZFtb67Bfi14p5kCA2Y7fszMu0YR/IRQ9XXV2R5J/CnVA04XyjS408aMLjNyhPQWyEJiEx1mZv2WDwgIkAddXpYvMAp2CUm6poDTm6BFemLI5C3MakNnKJ01kd8htAptpWrSHUhlA70+7beFfcoXuXEH8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=FniwXGyQzfDL5gldlgOG/xTaIUK0lT0aSX+TiUgh1QVLuOOilaIgaYzm4MNsg1ZKIJkRWP59TKcXSTG6B44jg2KVoPNZcsfxOeRZ9g1hwIXB7bb3nAhF+8LWPb/jhwd7ieANILpUmoApvHP8Q43nY9cwCp14ZHOYEHO7ReJJ/V22UDZ4mmJq3R27cgg8zZ9THkOe8iWDekGS+z9tgZpSI8MDgZD87ZR2n5ItQD0u8KyheuFahZCg34gnAvzG4Ip2smtjtIone4ACCeOe1c0bBgC5c/DZayFtZkYUQLU6KlxAv60hczVqrjp8jIVP9aKXBWs6ZNPpogK1WHxXubdU9A==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=BeIJTDd0GO41hpgbBvOOGbke2MmraRb4X57p0mXGR4U=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795093552544684.5203213532461;
	Thu, 19 Nov 2026 05:05:52 -0800 (PST)
Message-ID: <a142bb381f133100597ea0bc63b5d34db236e085.camel@rong.moe>
Subject: Re: [PATCH v2 3/3] platform/x86: ideapad-laptop: consume the Fn
 key events from the WMI hotkeys driver
From: Rong Zhang <i@rong.moe>
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, W_Armin@gmx.de
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com,
 xy-jackie@139.com, 	ikepanhc@gmail.com, marco_giunta@outlook.it,
 platform-driver-x86@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 ldemarchi@nvidia.com
In-Reply-To: <20261119022719.3089229-4-dcemin@nvidia.com>
References: <20261113222755.1696567-1-dcemin@nvidia.com>
	 <20261119022719.3089229-1-dcemin@nvidia.com>
	 <20261119022719.3089229-4-dcemin@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 21:00:44 +0800
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
> ideapad-laptop binds the Fn key and Fn+Esc WMI event GUIDs itself and
> reports the keys through its own keymap, but the arm64 Lenovo laptops
> expose the Fn key GUID without the VPC device this driver is built on,
> and now have the lenovo-wmi-hotkeys driver reporting those keys on every
> architecture.
>=20
> Drop the WMI event driver from ideapad-laptop and subscribe to the
> lenovo-wmi-hotkeys notifier instead. The notifier callback keeps the two
> platform specific behaviours: it refreshes the Fn lock LED from the EC
> on every event, and on the performance button (0x3d) it cycles the
> platform profile through DYTC and returns NOTIFY_STOP so that no key is
> reported, as before. All other key codes, the Fn+Esc events and the
> camera lens cover switch are reported by lenovo-wmi-hotkeys with the
> same key codes this driver used, so the WMI entries of the keymap are
> dropped and ideapad-laptop no longer registers any WMI driver.
>=20
> ideapad-laptop now depends on LENOVO_WMI_HOTKEYS being enabled or
> disabled consistently; without it the Fn keys are not reported, as on a
> kernel without ACPI_WMI.
>=20
> Signed-off-by: David Cemin <dcemin@nvidia.com>

This should be merge into PATCH 2 as I've said there.

> ---
>  drivers/platform/x86/lenovo/Kconfig          |   1 +
>  drivers/platform/x86/lenovo/ideapad-laptop.c | 225 ++++---------------
>  2 files changed, 39 insertions(+), 187 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index 4d9a25d0e3b5..25817e2f0e1a 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -12,6 +12,7 @@ config IDEAPAD_LAPTOP
>  =09depends on BACKLIGHT_CLASS_DEVICE
>  =09depends on ACPI_VIDEO || ACPI_VIDEO =3D n
>  =09depends on ACPI_WMI || ACPI_WMI =3D n
> +=09depends on LENOVO_WMI_HOTKEYS || LENOVO_WMI_HOTKEYS =3D n

This introduces a migration issue. When updating .config (say, make
olddefconfig), IDEAPAD_LAPTOP=3Dy will not enable LENOVO_WMI_HOTKEYS by
default, breaking users' or distributions' existing setup.

IMO it would be better to use `imply LENOVO_WMI_HOTKEYS if ACPI_WMI'.

>  =09select ACPI_PLATFORM_PROFILE
>  =09select INPUT_SPARSEKMAP
>  =09select NEW_LEDS
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platf=
orm/x86/lenovo/ideapad-laptop.c
> index f9453de6df76..7461f4a59347 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -34,7 +34,7 @@
>  #include <linux/string_choices.h>
>  #include <linux/sysfs.h>
>  #include <linux/types.h>
> -#include <linux/wmi.h>
> +#include <linux/platform_data/x86/lenovo-wmi-hotkeys.h>
>  #include "ideapad-laptop.h"
> =20
>  #include <acpi/battery.h>
> @@ -185,6 +185,7 @@ struct ideapad_private {
>  =09struct input_dev *inputdev;
>  =09struct backlight_device *blightdev;
>  =09struct ideapad_dytc_priv *dytc;
> +=09struct notifier_block hotkeys_nb;
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
> @@ -2297,123 +2237,52 @@ static int ideapad_check_features(struct ideapad=
_private *priv)
>  =09return 0;
>  }
> =20
> -#if IS_ENABLED(CONFIG_ACPI_WMI)
> +#if IS_ENABLED(CONFIG_LENOVO_WMI_HOTKEYS)
>  /*
> - * WMI driver
> + * The vendor specific Fn keys arrive as WMI events owned by the Lenovo =
WMI
> + * hotkeys driver, which reports them as input events. Subscribe to act =
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
> -{
> -=09struct ideapad_wmi_private *wpriv;
> -
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
> +static int ideapad_hotkeys_notify(struct notifier_block *nb, unsigned lo=
ng code,
> +=09=09=09=09  void *data)
>  {
> -=09struct ideapad_wmi_private *wpriv =3D dev_get_drvdata(&wdev->dev);
> -=09struct ideapad_private *priv;
> -
> -=09guard(mutex)(&ideapad_shared_mutex);
> -
> -=09priv =3D ideapad_shared;
> -=09if (!priv)
> -=09=09return;
> +=09struct ideapad_private *priv =3D container_of(nb, struct ideapad_priv=
ate, hotkeys_nb);
> =20
> -=09switch (wpriv->event) {
> -=09case IDEAPAD_WMI_EVENT_ESC:
> -=09=09ideapad_input_report(priv, 128);
> -=09=09break;
> -=09case IDEAPAD_WMI_EVENT_FN_KEYS:

Now all stuff here listen to both Esc and Fn Keys!

Please export enum lwmi_hotkeys_type and pass it as an event code, the
scan code should be passed as event data.  In this manner the switch
statement and indentation are also preserved, which should result in a
much more readable diff set.

> -=09=09if (priv->features.set_fn_lock_led) {
> -=09=09=09int brightness =3D ideapad_fn_lock_get(priv);
> +=09if (priv->features.set_fn_lock_led) {
> +=09=09int brightness =3D ideapad_fn_lock_get(priv);
> =20
> -=09=09=09if (brightness >=3D 0) {
> -=09=09=09=09ideapad_fn_lock_set(priv, brightness);
> -=09=09=09=09ideapad_fn_lock_led_notify(priv, brightness);
> -=09=09=09}
> +=09=09if (brightness >=3D 0) {
> +=09=09=09ideapad_fn_lock_set(priv, brightness);
> +=09=09=09ideapad_fn_lock_led_notify(priv, brightness);
>  =09=09}
> -
> -=09=09if (data->type !=3D ACPI_TYPE_INTEGER) {
> -=09=09=09dev_warn(&wdev->dev,
> -=09=09=09=09 "WMI event data is not an integer\n");
> -=09=09=09break;
> -=09=09}
> -
> -=09=09dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
> -=09=09=09data->integer.value);
> -
> -=09=09/* performance button triggered by 0x3d */
> -=09=09if (data->integer.value =3D=3D 0x3d && priv->dytc) {
> -=09=09=09platform_profile_cycle();
> -=09=09=09break;
> -=09=09}
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
> -=09=09break;
>  =09}
> -}
> -
> -static const struct ideapad_wmi_private ideapad_wmi_context_esc =3D {
> -=09.event =3D IDEAPAD_WMI_EVENT_ESC
> -};
> =20
> -static const struct ideapad_wmi_private ideapad_wmi_context_fn_keys =3D =
{
> -=09.event =3D IDEAPAD_WMI_EVENT_FN_KEYS
> -};
> +=09dev_dbg(&priv->platform_device->dev, "WMI fn-key event: 0x%lx\n", cod=
e);
> =20
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
> +=09/* performance button triggered by 0x3d */
> +=09if (code =3D=3D 0x3d && priv->dytc) {

I am not sure if we should introduce a symbolic enumeration for scan
codes. It may make things tidier, or it may not...

> +=09=09platform_profile_cycle();
> +=09=09return NOTIFY_STOP;
> +=09}
> =20
> -static struct wmi_driver ideapad_wmi_driver =3D {
> -=09.driver =3D {
> -=09=09.name =3D "ideapad_wmi",
> -=09},
> -=09.id_table =3D ideapad_wmi_ids,
> -=09.min_event_size =3D sizeof(u32),
> -=09.probe =3D ideapad_wmi_probe,
> -=09.notify =3D ideapad_wmi_notify,
> -};
> +=09/* 0x02 FnLock, 0x03 Esc */
> +=09if (code =3D=3D 0x02 || code =3D=3D 0x03)
> +=09=09ideapad_fn_lock_led_notify(priv, code =3D=3D 0x02);

I think we can refactor the branches for 0x3d/0x02/0x03 into a switch
statement to improve readability.
> =20
> -static int ideapad_wmi_driver_register(void)
> -{
> -=09return wmi_driver_register(&ideapad_wmi_driver);
> +=09return NOTIFY_OK;
>  }
> =20
> -static void ideapad_wmi_driver_unregister(void)
> +static int ideapad_hotkeys_register(struct ideapad_private *priv)
>  {
> -=09return wmi_driver_unregister(&ideapad_wmi_driver);
> -}
> +=09priv->hotkeys_nb.notifier_call =3D ideapad_hotkeys_notify;
> =20
> +=09return devm_lenovo_wmi_hotkeys_register_notifier(&priv->platform_devi=
ce->dev,
> +=09=09=09=09=09=09=09 &priv->hotkeys_nb);

I haven't examined everything carefully, but is it safe to devm here? It
makes the notifier live longer than dytc and LEDs. Perhaps sashiko.dev
had examined the devm safety, so please check it out.

> +}
>  #else
> -static inline int ideapad_wmi_driver_register(void) { return 0; }
> -static inline void ideapad_wmi_driver_unregister(void) { }
> +static inline int ideapad_hotkeys_register(struct ideapad_private *priv)=
 { return 0; }
>  #endif
>=20

Since you are modifying the context anyway, could you add comments to the
#else and #endif as well?

Thanks,
Rong

> =20
>  /*
> @@ -2496,6 +2365,10 @@ static int ideapad_acpi_add(struct platform_device=
 *pdev)
>  =09=09=09dev_info(&pdev->dev, "DYTC interface is not available\n");
>  =09}
> =20
> +=09err =3D ideapad_hotkeys_register(priv);
> +=09if (err)
> +=09=09dev_warn(&pdev->dev, "Could not subscribe to the WMI hotkey events=
: %d\n", err);
> +
>  =09if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_vendor) {
>  =09=09err =3D ideapad_backlight_init(priv);
>  =09=09if (err && err !=3D -ENODEV)
> @@ -2600,31 +2473,9 @@ static struct platform_driver ideapad_acpi_driver =
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
> +MODULE_IMPORT_NS("LENOVO_WMI_HOTKEYS");
>  MODULE_LICENSE("GPL");
