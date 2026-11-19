Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795068991;
	b=HcfpZYzi4Jfj4XXxpMjIAU8i6sXkyqTn1u+TZGZXh7E3R6sToqUOU6C/BA5AY1WnW2xr
	 gwbsNYIL8xYmPzklzBI2H2YGzUNGMAuh8OYu7rAy1GljpvAoMR0z8So9fgzRdKuw2TYDL
	 C3B6X7nZ7WiAPQDrJCwHgzNScxk4d6/rd7PVmbWXohdG5oNM9aaitmD+ya9GNt5PdA/TF
	 pBJf3pZDrQJYCNnOYKI2efHnD0lPK2MGuywi/5BO801LgiCWrxSimfzL9EnBEuZpL3vNm
	 7LBzpItDwyQjRolaNNEQ3bacJC0Ip6+U9Dp8GUhLEsqqPn8j3LYjZOH8rjGdxnnJ4hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795068991;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=CVOrRRuiD90diC1/WMj8+JwojnBmKcf3PhtWmatz21o=;
	b=FY6LsxParOaZZji/Os81T1nyvShIx8UJB3y3O1H4tasm4atgo4ZLD9YiCJF+J1g3Kq5e
	 SjR9LSKAJR/sAp4hdyskLtU625sBASQFDLCpnHc0+KTjdiI4s5+UZk0S6xswmyR2ny3Qf
	 L5KVr/yhtLLCXRbXCjWVCr9uC4HPurk/LA2OwWF8DLOp+uJK6+q6zi5VC3HaYAhnqjB4Y
	 QZq+BCkJX5Cg00FDnSw/abXTgWVYaNDECfMxLW3x6MqesojwpFYu2U04vGJaLv5J7WNCC
	 0mcO3PFPtaF04kdjnEYSgdRXf1Li1a9MD5aBuwYXhuwiZGJeSv9bS+b8rRtrCNInWCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="nQl5//Gq";
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FCB606A325
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Nov 2026 06:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81FCB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=nQl5//Gq
DKIM2-Signature:  i=1; m=1; t=1795068987;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:E9vR2ahW9/ZOBuePQmgNtrmah53n
   3pOwJ29kTxwhD4KIOeoYuiv5gBFwDJj7K29bUV+ehMa/p/i1krTLzyJIMtCVnZNCDnkNetqhgmM
   DSiM2aZwbYAKxDhZNMZWO1fLk9EpYhy3z95h2pqdnRDJQGFuYKgE1DQqJS3wO/TuR9vB0PhC1BT
   xMBK1sG+6L69xbCaQxqCPzYnHGw3XiwDRFtI15JsN3QuBpRA9iVmG05rSYprL4wk8iEAM6cpRE7
   RJJ0LlNvK8IS/iQv2HVuOOz6Mo0B7h69JntRP81+gsFD5xBv6h3y59qP2AObxXCUdaQNOn0VJf4
   SGXSmVknrwV2Cg==;
Message-Instance:  m=1;
 h=sha256:
   07d0lxSihfGwT8+Qu1u0S8Y9G1oBXq73B+8hTqm5FnU=:
   xAjVstDK/ppLLTzQJJ+7GHQWgNGeG/B3z848vj85PSM=,
  sha512:
   nASaIwO4KoeTH6U5UI0Qp7LJvZhtChHIY0wSXJEZ+4GWbWTKWBM/3yD/Q2UhJo4798tU0/OEZ9025U1UHqdCXQ==:
   9guKzBqRzt8NfBAIJsRK9a77aUKoJEAl3TdLsW1v0tjssgMsnfBKv0CkSGLZo5QXWgC5pTLqG/lwT/nZP01rCA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795068970; x=1795673770; i=w_armin@gmx.de;
	bh=CVOrRRuiD90diC1/WMj8+JwojnBmKcf3PhtWmatz21o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nQl5//GqIYtnBG+IgM+FsVYOdtjOqy5R22qBO6znN6bRzoo93Vb0KBppcoF+xFL+
	 tRgjUtbCfk65M9+nXoUANZWgUorO+uH6Ab0du587OAk7CDgia0wuTm1X0bFraOz8/
	 8Tozo8HVJ8D/XUzUiHof6IvS4kCWeZL7T/mgkYG5riQghYrxcdvdYaGuwltvKEGW/
	 7Y/gl55cd3zMOC+0KT+jji1eTtEbxtE6cXroHEOIpZnkxVepcKf3YURZID327svUH
	 8vVC7C7hYZTGw3qaTnETI7cHGu2sctZ/meW5Zr8WpAwqSh/sOh97zQV90nZbJNMKB
	 GoDRMjoV9MP8NfWyPw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MUXtY-1x3d9737I0-00S2a6; Thu, 19
 Nov 2026 07:16:09 +0100
Message-ID: <fd00719e-930e-4f6d-b642-ec3430491fb7@gmx.de>
Date: Thu, 19 Nov 2026 07:16:07 +0100
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
Subject: Re: [PATCH v2 3/3] platform/x86: ideapad-laptop: consume the Fn key
 events from the WMI hotkeys driver
To: David Cemin <dcemin@nvidia.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca, derekjohn.clark@gmail.com, xy-jackie@139.com,
 ikepanhc@gmail.com, i@rong.moe, marco_giunta@outlook.it,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 ldemarchi@nvidia.com
References: <20261113222755.1696567-1-dcemin@nvidia.com>
 <20261119022719.3089229-1-dcemin@nvidia.com>
 <20261119022719.3089229-4-dcemin@nvidia.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261119022719.3089229-4-dcemin@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3KN0k0iAfpfHDzR5+mx0fw1ffVqMtceB9aZx/AUXN1HKf4h9O6b
 MFKU1oHkvLdZkFeXydFMXkx5AhRkfw7m598NO4da0JRpiSXTxP7B2v1tKsigisNOnRqK2+8
 MNLE9Dkv3p1QJPf9T/K1NMXEwn3ekc+qtFM+6cL23HArkP+eDsE3ECJx9gMUF3Y7WfYcJBs
 uEO5ugB/QL3PPLHkyxwkg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:H+7F/VnHuQ4=;gEsBPOa/rXmnjayWUYByz4+0XjH
 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
 TxSglm/2ugLrg8Ba

Am 19.11.26 um 03:27 schrieb David Cemin:

> ideapad-laptop binds the Fn key and Fn+Esc WMI event GUIDs itself and
> reports the keys through its own keymap, but the arm64 Lenovo laptops
> expose the Fn key GUID without the VPC device this driver is built on,
> and now have the lenovo-wmi-hotkeys driver reporting those keys on every
> architecture.
>
> Drop the WMI event driver from ideapad-laptop and subscribe to the
> lenovo-wmi-hotkeys notifier instead. The notifier callback keeps the two
> platform specific behaviours: it refreshes the Fn lock LED from the EC
> on every event, and on the performance button (0x3d) it cycles the
> platform profile through DYTC and returns NOTIFY_STOP so that no key is
> reported, as before. All other key codes, the Fn+Esc events and the
> camera lens cover switch are reported by lenovo-wmi-hotkeys with the
> same key codes this driver used, so the WMI entries of the keymap are
> dropped and ideapad-laptop no longer registers any WMI driver.
>
> ideapad-laptop now depends on LENOVO_WMI_HOTKEYS being enabled or
> disabled consistently; without it the Fn keys are not reported, as on a
> kernel without ACPI_WMI.
>
> Signed-off-by: David Cemin <dcemin@nvidia.com>
> ---
>   drivers/platform/x86/lenovo/Kconfig          |   1 +
>   drivers/platform/x86/lenovo/ideapad-laptop.c | 225 ++++---------------
>   2 files changed, 39 insertions(+), 187 deletions(-)
>
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/=
lenovo/Kconfig
> index 4d9a25d0e3b5..25817e2f0e1a 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -12,6 +12,7 @@ config IDEAPAD_LAPTOP
>   	depends on BACKLIGHT_CLASS_DEVICE
>   	depends on ACPI_VIDEO || ACPI_VIDEO =3D n
>   	depends on ACPI_WMI || ACPI_WMI =3D n

Hi,

i think you can drop the dependency on ACPI_WMI here now, because
LENOVO_WMI_HOTKEYS already takes care of that.

With this being addressed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +	depends on LENOVO_WMI_HOTKEYS || LENOVO_WMI_HOTKEYS =3D n
>   	select ACPI_PLATFORM_PROFILE
>   	select INPUT_SPARSEKMAP
>   	select NEW_LEDS
> diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/plat=
form/x86/lenovo/ideapad-laptop.c
> index f9453de6df76..7461f4a59347 100644
> --- a/drivers/platform/x86/lenovo/ideapad-laptop.c
> +++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
> @@ -34,7 +34,7 @@
>   #include <linux/string_choices.h>
>   #include <linux/sysfs.h>
>   #include <linux/types.h>
> -#include <linux/wmi.h>
> +#include <linux/platform_data/x86/lenovo-wmi-hotkeys.h>
>   #include "ideapad-laptop.h"
>  =20
>   #include <acpi/battery.h>
> @@ -185,6 +185,7 @@ struct ideapad_private {
>   	struct input_dev *inputdev;
>   	struct backlight_device *blightdev;
>   	struct ideapad_dytc_priv *dytc;
> +	struct notifier_block hotkeys_nb;
>   	struct dentry *debug;
>   	struct acpi_battery_hook battery_hook;
>   	const struct power_supply_ext *battery_ext;
> @@ -1317,8 +1318,6 @@ static void ideapad_unregister_rfkill(struct ideap=
ad_private *priv, int dev)
>   /*
>    * input device
>    */
> -#define IDEAPAD_WMI_KEY 0x100
> -
>   static const struct key_entry ideapad_keymap[] =3D {
>   	{ KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
>   	{ KE_KEY,   7, { KEY_CAMERA } },
> @@ -1331,65 +1330,6 @@ static const struct key_entry ideapad_keymap[] =
=3D {
>   	{ KE_KEY,  65, { KEY_PROG4 } },
>   	{ KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
>   	{ KE_KEY,  67, { KEY_TOUCHPAD_ON } },
> -	{ KE_KEY, 128, { KEY_ESC } },
> -
> -	/*
> -	 * WMI keys
> -	 */
> -
> -	/* FnLock (handled by the firmware) */
> -	{ KE_IGNORE,	0x02 | IDEAPAD_WMI_KEY },
> -	/* Esc (handled by the firmware) */
> -	{ KE_IGNORE,	0x03 | IDEAPAD_WMI_KEY },
> -	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> -	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
> -	{ KE_KEY,	0x04 | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> -	/* Lenovo Support */
> -	{ KE_KEY,	0x07 | IDEAPAD_WMI_KEY, { KEY_HELP } },
> -	{ KE_KEY,	0x0e | IDEAPAD_WMI_KEY, { KEY_PICKUP_PHONE } },
> -	{ KE_KEY,	0x0f | IDEAPAD_WMI_KEY, { KEY_HANGUP_PHONE } },
> -	/* Refresh Rate Toggle (Fn+R) */
> -	{ KE_KEY,	0x10 | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> -	/* Dark mode toggle */
> -	{ KE_KEY,	0x13 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> -	/* Sound profile switch */
> -	{ KE_KEY,	0x12 | IDEAPAD_WMI_KEY, { KEY_PROG2 } },
> -	/* Lenovo Virtual Background application */
> -	{ KE_KEY,	0x28 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> -	/* Lenovo Support */
> -	{ KE_KEY,	0x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
> -	/* Refresh Rate Toggle */
> -	{ KE_KEY,	0x0a | IDEAPAD_WMI_KEY, { KEY_REFRESH_RATE_TOGGLE } },
> -	/* Specific to some newer models */
> -	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
> -	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> -	/* Star- (User Assignable Key) */
> -	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> -	/* Eye */
> -	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> -	/* Lenovo Smart Connect */
> -	{ KE_KEY,	0x48 | IDEAPAD_WMI_KEY, { KEY_LINK_PHONE } },
> -	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() *=
/
> -	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> -	/* Mode, opens a profile chooser; the Fn+Q button cycles the profile *=
/
> -	{ KE_KEY,	0x46 | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
> -	/* shift + prtsc */
> -	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
> -	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> -	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
> -
> -	/*
> -	 * WMI switches
> -	 *
> -	 * Some devices come with physical switches. Whenever a switch is
> -	 * toggled, an WMI event is emitted to inform the software about the
> -	 * switch's latest state.
> -	 */
> -
> -	/* Camera switch */
> -	{ KE_SW,	0x0c | IDEAPAD_WMI_KEY, .sw =3D { SW_CAMERA_LENS_COVER, 0 } }=
,
> -	{ KE_SW,	0x0d | IDEAPAD_WMI_KEY, .sw =3D { SW_CAMERA_LENS_COVER, 1 } }=
,
> -
>   	{ KE_END },
>   };
>  =20
> @@ -2297,123 +2237,52 @@ static int ideapad_check_features(struct ideapa=
d_private *priv)
>   	return 0;
>   }
>  =20
> -#if IS_ENABLED(CONFIG_ACPI_WMI)
> +#if IS_ENABLED(CONFIG_LENOVO_WMI_HOTKEYS)
>   /*
> - * WMI driver
> + * The vendor specific Fn keys arrive as WMI events owned by the Lenovo=
 WMI
> + * hotkeys driver, which reports them as input events. Subscribe to act=
 on the
> + * ones that touch the VPC state: the Fn lock LED and the performance m=
ode
> + * button, which cycles the platform profile through DYTC instead of
> + * reporting a key.
>    */
> -enum ideapad_wmi_event_type {
> -	IDEAPAD_WMI_EVENT_ESC,
> -	IDEAPAD_WMI_EVENT_FN_KEYS,
> -};
> -
> -struct ideapad_wmi_private {
> -	enum ideapad_wmi_event_type event;
> -};
> -
> -static int ideapad_wmi_probe(struct wmi_device *wdev, const void *conte=
xt)
> -{
> -	struct ideapad_wmi_private *wpriv;
> -
> -	wpriv =3D devm_kzalloc_obj(&wdev->dev, *wpriv);
> -	if (!wpriv)
> -		return -ENOMEM;
> -
> -	*wpriv =3D *(const struct ideapad_wmi_private *)context;
> -
> -	dev_set_drvdata(&wdev->dev, wpriv);
> -	return 0;
> -}
> -
> -static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_obje=
ct *data)
> +static int ideapad_hotkeys_notify(struct notifier_block *nb, unsigned l=
ong code,
> +				  void *data)
>   {
> -	struct ideapad_wmi_private *wpriv =3D dev_get_drvdata(&wdev->dev);
> -	struct ideapad_private *priv;
> -
> -	guard(mutex)(&ideapad_shared_mutex);
> -
> -	priv =3D ideapad_shared;
> -	if (!priv)
> -		return;
> +	struct ideapad_private *priv =3D container_of(nb, struct ideapad_priva=
te, hotkeys_nb);
>  =20
> -	switch (wpriv->event) {
> -	case IDEAPAD_WMI_EVENT_ESC:
> -		ideapad_input_report(priv, 128);
> -		break;
> -	case IDEAPAD_WMI_EVENT_FN_KEYS:
> -		if (priv->features.set_fn_lock_led) {
> -			int brightness =3D ideapad_fn_lock_get(priv);
> +	if (priv->features.set_fn_lock_led) {
> +		int brightness =3D ideapad_fn_lock_get(priv);
>  =20
> -			if (brightness >=3D 0) {
> -				ideapad_fn_lock_set(priv, brightness);
> -				ideapad_fn_lock_led_notify(priv, brightness);
> -			}
> +		if (brightness >=3D 0) {
> +			ideapad_fn_lock_set(priv, brightness);
> +			ideapad_fn_lock_led_notify(priv, brightness);
>   		}
> -
> -		if (data->type !=3D ACPI_TYPE_INTEGER) {
> -			dev_warn(&wdev->dev,
> -				 "WMI event data is not an integer\n");
> -			break;
> -		}
> -
> -		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
> -			data->integer.value);
> -
> -		/* performance button triggered by 0x3d */
> -		if (data->integer.value =3D=3D 0x3d && priv->dytc) {
> -			platform_profile_cycle();
> -			break;
> -		}
> -
> -		/* 0x02 FnLock, 0x03 Esc */
> -		if (data->integer.value =3D=3D 0x02 || data->integer.value =3D=3D 0x0=
3)
> -			ideapad_fn_lock_led_notify(priv, data->integer.value =3D=3D 0x02);
> -
> -		ideapad_input_report(priv,
> -				     data->integer.value | IDEAPAD_WMI_KEY);
> -
> -		break;
>   	}
> -}
> -
> -static const struct ideapad_wmi_private ideapad_wmi_context_esc =3D {
> -	.event =3D IDEAPAD_WMI_EVENT_ESC
> -};
>  =20
> -static const struct ideapad_wmi_private ideapad_wmi_context_fn_keys =3D=
 {
> -	.event =3D IDEAPAD_WMI_EVENT_FN_KEYS
> -};
> +	dev_dbg(&priv->platform_device->dev, "WMI fn-key event: 0x%lx\n", code=
);
>  =20
> -static const struct wmi_device_id ideapad_wmi_ids[] =3D {
> -	{ "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_context_esc }, =
/* Yoga 3 */
> -	{ "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_context_esc }, =
/* Yoga 700 */
> -	{ "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_context_fn_keys=
 }, /* Legion 5 */
> -	{},
> -};
> -MODULE_DEVICE_TABLE(wmi, ideapad_wmi_ids);
> +	/* performance button triggered by 0x3d */
> +	if (code =3D=3D 0x3d && priv->dytc) {
> +		platform_profile_cycle();
> +		return NOTIFY_STOP;
> +	}
>  =20
> -static struct wmi_driver ideapad_wmi_driver =3D {
> -	.driver =3D {
> -		.name =3D "ideapad_wmi",
> -	},
> -	.id_table =3D ideapad_wmi_ids,
> -	.min_event_size =3D sizeof(u32),
> -	.probe =3D ideapad_wmi_probe,
> -	.notify =3D ideapad_wmi_notify,
> -};
> +	/* 0x02 FnLock, 0x03 Esc */
> +	if (code =3D=3D 0x02 || code =3D=3D 0x03)
> +		ideapad_fn_lock_led_notify(priv, code =3D=3D 0x02);
>  =20
> -static int ideapad_wmi_driver_register(void)
> -{
> -	return wmi_driver_register(&ideapad_wmi_driver);
> +	return NOTIFY_OK;
>   }
>  =20
> -static void ideapad_wmi_driver_unregister(void)
> +static int ideapad_hotkeys_register(struct ideapad_private *priv)
>   {
> -	return wmi_driver_unregister(&ideapad_wmi_driver);
> -}
> +	priv->hotkeys_nb.notifier_call =3D ideapad_hotkeys_notify;
>  =20
> +	return devm_lenovo_wmi_hotkeys_register_notifier(&priv->platform_devic=
e->dev,
> +							 &priv->hotkeys_nb);
> +}
>   #else
> -static inline int ideapad_wmi_driver_register(void) { return 0; }
> -static inline void ideapad_wmi_driver_unregister(void) { }
> +static inline int ideapad_hotkeys_register(struct ideapad_private *priv=
) { return 0; }
>   #endif
>  =20
>   /*
> @@ -2496,6 +2365,10 @@ static int ideapad_acpi_add(struct platform_devic=
e *pdev)
>   			dev_info(&pdev->dev, "DYTC interface is not available\n");
>   	}
>  =20
> +	err =3D ideapad_hotkeys_register(priv);
> +	if (err)
> +		dev_warn(&pdev->dev, "Could not subscribe to the WMI hotkey events: %=
d\n", err);
> +
>   	if (acpi_video_get_backlight_type() =3D=3D acpi_backlight_vendor) {
>   		err =3D ideapad_backlight_init(priv);
>   		if (err && err !=3D -ENODEV)
> @@ -2600,31 +2473,9 @@ static struct platform_driver ideapad_acpi_driver=
 =3D {
>   	},
>   };
>  =20
> -static int __init ideapad_laptop_init(void)
> -{
> -	int err;
> -
> -	err =3D ideapad_wmi_driver_register();
> -	if (err)
> -		return err;
> -
> -	err =3D platform_driver_register(&ideapad_acpi_driver);
> -	if (err) {
> -		ideapad_wmi_driver_unregister();
> -		return err;
> -	}
> -
> -	return 0;
> -}
> -module_init(ideapad_laptop_init)
> -
> -static void __exit ideapad_laptop_exit(void)
> -{
> -	platform_driver_unregister(&ideapad_acpi_driver);
> -	ideapad_wmi_driver_unregister();
> -}
> -module_exit(ideapad_laptop_exit)
> +module_platform_driver(ideapad_acpi_driver);
>  =20
>   MODULE_AUTHOR("David Woodhouse <dwmw2@infradead.org>");
>   MODULE_DESCRIPTION("IdeaPad ACPI Extras");
> +MODULE_IMPORT_NS("LENOVO_WMI_HOTKEYS");
>   MODULE_LICENSE("GPL");
