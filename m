Received: from mta0.migadu.com (out-150.mta0.migadu.com [91.218.175.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EFC2FC011
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 20:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801638; cv=none; b=cMwJx7vVE/158MA4MfHsx8KxI4gfIGXanEUQDVw6AxLpIoaWrNO+XdQGgxpkBk/MtmW9z3TdudAj9aJn7OTK80bsIRr0OdxdewWhOh4utPCn1/6rKGVahDAa9XC8TE3vn9ZID/l1UpGvliAjvvgK99xjIAQtFCHZDkzEmBUmdS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801638; c=relaxed/simple;
	bh=+2mxpLOeCGjtBL39hc0+mlIuGYQtuzRMmmGWZifU0Lw=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=Nz9EYnHusQwH0e3fh9Y4Ont0MLLjQbpbqqubwl0swb+B2+Wd/63ZZSKldQyUH+Sc6mTTtXDUGwAb3gn7vXTn7CJxbMR8o2bKSi0CwhADPrzskk4DyFPbEGfdiC61oSzwDetCweWUOIq+Jx75E33sRccsxCgwTTy2n1j5yR/4ejA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rj8E5gdJ; arc=none smtp.client-ip=91.218.175.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rj8E5gdJ"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+2mxpLOeCGjtBL39hc0+mlIuGYQtuzRMmmGWZifU0Lw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790801633; v=1; x=1791406433;
 b=rj8E5gdJmnojOEDy8/lOOk2qskeIm9z+7s3okP1zEwHjwyZuOSwIzf0ZQrgwzMXp1zsYiiEh
 LHqVZ7i55zdDijyZ6iaghAbflPGfpNSpTgDc4Yd0jRXdISaKgzDFqVwMv9AQxoro3g83wSVD53k
 evJ9RtPEcBdZZVXwt55eD+Ew=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a521b6ec0fd0bec5;
	Wed, 30 Sep 2026 20:53:53 +0000
X-Mizu-Trace-ID: a521b6ec0fd0bec5
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 20:53:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Ilya Gladyshev" <ilya.gladyshev@linux.dev>
Message-ID: <8bed2bb06fa2f6f22f3a07f4e5380710899da05d@linux.dev>
TLS-Required: No
Subject: Re: [PATCH v6 2/5] platform/x86: bitland-mifs-wmi: Merge the
 function  of redmi-wmi into the bitland driver
To: "Mingyou Chen" <qby140326@gmail.com>, "=?utf-8?B?SWxwbyBKw6RydmluZW4=?="
 <ilpo.jarvinen@linux.intel.com>, "Hans de Goede" <hansg@kernel.org>
Cc: "KentoNion" <kento@kekto.ru>, platform-driver-x86@vger.kernel.org, "ted
 eric" <ericted8810@gmail.com>, "Armin Wolf" <W_Armin@gmx.de>,
 linux-kernel@vger.kernel.org, "Chris Taraszka" <chris@miget.com>, "Matias
 Civadda" <matias.civadda2342001@gmail.com>,
 "=?utf-8?B?6auYIOS/iuaWhw==?=" <btx342@gmail.com>, "powerfullz"
 <wleizc7319@gmail.com>, "=?utf-8?B?5a2ZIOiqiemTrQ==?="
 <wolf109909@outlook.com>, "=?utf-8?B?TWlsb8WhIFZsa3U=?="
 <vlku.milos.fun@gmail.com>, "Rsplwe" <i@rsplwe.com>, "Bozhen Peng"
 <bozhenpeng93@gmail.com>, "Nika Krasnova" <nika@nikableh.moe>
In-Reply-To: <20260929134503.17249-3-qby140326@gmail.com>
References: <20260929134503.17249-1-qby140326@gmail.com>
 <20260929134503.17249-3-qby140326@gmail.com>

On 9/29/26 16:45, Mingyou Chen wrote:
> The bitland-mifs-wmi and legacy redmi-wmi drivers both attempt to bind
> to the same WMI GUID (46C93E13-EE9B-4262-8488-563BCA757FEF). This
> overlap causes a device registration conflict, preventing one of the
> drivers from loading properly depending on the module initialization
> order.
> > Merge the event handling logic from redmi-wmi into bitland-mifs-wmi. =
By
> handling both device layouts within a single driver, we eliminate the
> GUID ownership conflict.
> > Tested-by: Nika Krasnova <nika@nikableh.moe>
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>

Tested on my Redmi Book Pro 15 2022
Tested-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>

I have two nitpicks below, but overall lgtm, so with them fixed
Reviewed-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>

> ---
>   drivers/platform/x86/bitland-mifs-wmi.c | 139 ++++++++++++++++-------=
-
>   1 file changed, 96 insertions(+), 43 deletions(-)
> > diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platfo=
rm/x86/bitland-mifs-wmi.c
> index dd1648b7de77..e1a81e89856e 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -35,6 +35,11 @@
>   #include <linux/units.h>
>   #include <linux/wmi.h>
>   > +#define BI_HOTKEY_CODE(id, low, high) \
> +	(((u32)(high) << 24) | ((u32)(low) << 16) | ((u32)(id) << 8) | WMI_EV=
ENT_TYPE_HOTKEY)
> +
> +#define AI_KEY_VALUE_MASK    BIT(8)
> +
>   #define DRV_NAME		"bitland-mifs-wmi"
>   #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
>   #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
> @@ -607,18 +612,59 @@ static const struct attribute *const laptop_attrs=
[] =3D {
>   ATTRIBUTE_GROUPS(laptop);
>   >   static const struct key_entry bitland_mifs_wmi_keymap[] =3D {
> -	{ KE_KEY, WMI_EVENT_OPEN_APP, { KEY_PROG1 } },
> -	{ KE_KEY, WMI_EVENT_CALCULATOR_START, { KEY_CALC } },
> -	{ KE_KEY, WMI_EVENT_BROWSER_START, { KEY_WWW } },
> -	{ KE_IGNORE, WMI_EVENT_FN_J, { KEY_RESERVED } },
> -	{ KE_IGNORE, WMI_EVENT_FN_F, { KEY_RESERVED } },
> -	{ KE_IGNORE, WMI_EVENT_FN_0, { KEY_RESERVED } },
> -	{ KE_IGNORE, WMI_EVENT_FN_1, { KEY_RESERVED } },
> -	{ KE_IGNORE, WMI_EVENT_FN_2, { KEY_RESERVED } },
> -	{ KE_IGNORE, WMI_EVENT_FN_3, { KEY_RESERVED } },
> -	{ KE_IGNORE, WMI_EVENT_FN_4, { KEY_RESERVED } },
> -	{ KE_IGNORE, WMI_EVENT_FN_5, { KEY_RESERVED } },
> -	{ KE_END, 0 }
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0), { KEY_PROG1 } },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CALCULATOR_START, 1, 0), { KEY_CAL=
C } },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_BROWSER_START, 1, 0), { KEY_WWW } =
},
> +
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_J, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_1, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_2, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_4, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 0, 0), {} },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_2, 0, 0), { KEY_SELECTIVE=
_SCREENSHOT } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_3, 0, 0), { KEY_ALL_APPLI=
CATIONS } },
> +	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 0, 0), { KEY_CONFIG } },
> +	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 1, 0), { KEY_CONFIG } },

Using "reserved" and raw values for Redmi bindings seems inconsistent and
slightly confusing. In my opinion, it's better to add Redmi-specific valu=
es
to the bitland_mifs_event_id enum. WMI_EVENT_RESERVED_2 isn't used anywhe=
re
anyway.

> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), { KEY_SWITCHVID=
EOMODE } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH=
_RATE_TOGGLE } },
> +
> +	/* AI button has code for each position */
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(0x19, 1, 0), { KEY_ASSISTANT } },
> +
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0x80), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {} },
> +
> +	/* Xiaomi G Command Center */
> +	{ KE_KEY, BI_HOTKEY_CODE(0x0a, 1, 0), { KEY_VENDOR } },
> +
> +	/* OEM preset power mode */
> +	{ KE_IGNORE, BI_HOTKEY_CODE(0x16, 1, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(0x16, 2, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(0x16, 3, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(0x16, 4, 0), {} },
> +
> +	/* Fn Lock state */
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), {} },
> +
> +	/* Fn+`/1/2/3/4 */
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 1, 0), { KEY_F13 } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 1, 0), { KEY_F14 } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_1, 1, 0), { KEY_F15 } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_2, 1, 0), { KEY_F16 } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 1, 0), { KEY_F17 } },
> +
> +	{ KE_END }
>   };
>   >   static void bitland_notifier_unregister(void *data)
> @@ -736,12 +782,35 @@ static int bitland_mifs_wmi_probe(struct wmi_devi=
ce *wdev, const void *context)
>   				       &drv_data->notifier);
>   }
>   > +static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u=
32 payload)
> +{
> +	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev);
> +	struct key_entry *entry;
> +	bool autorelease =3D true;
> +	int value =3D 1;
> +
> +	entry =3D sparse_keymap_entry_from_scancode(data->input_dev, payload)=
;
> +	if (!entry) {
> +		dev_dbg(&wdev->dev, "Unknown WMI hotkey with payload 0x%08x\n", payl=
oad);
> +		return;
> +	}
> +
> +	/* AI key quirk */
> +	if (entry->keycode =3D=3D KEY_ASSISTANT) {
> +		value =3D !(payload & AI_KEY_VALUE_MASK);
> +		autorelease =3D false;
> +	}
> +
> +	guard(mutex)(&data->lock);
> +	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease=
);
> +}
> +
>   static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>   				    const struct wmi_buffer *buffer)
>   {
> -	struct bitland_mifs_wmi_data *data =3D dev_get_drvdata(&wdev->dev);
>   	const struct bitland_mifs_event *event =3D buffer->data;
>   	struct bitland_fan_notify_data fan_data;
> +	u32 payload;
>   	u8 brightness;

IIRC, reverse Xmas tree order is preferable (the payload should be after
brightness).

>   	/* Validate event type */
> @@ -758,24 +827,13 @@ static void bitland_mifs_wmi_notify(struct wmi_de=
vice *wdev,
>   		blocking_notifier_call_chain(&bitland_notifier_list,
>   					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
>   					     &brightness);
> -		break;
> +		return;
>   >   	case WMI_EVENT_PERFORMANCE_PLAN:
>   		blocking_notifier_call_chain(&bitland_notifier_list,
>   					     BITLAND_NOTIFY_PLATFORM_PROFILE,
>   					     NULL);
> -		break;
> -
> -	case WMI_EVENT_OPEN_APP:
> -	case WMI_EVENT_CALCULATOR_START:
> -	case WMI_EVENT_BROWSER_START: {
> -		guard(mutex)(&data->lock);
> -		if (!sparse_keymap_report_event(data->input_dev,
> -						event->event_id, 1, true))
> -			dev_warn(&wdev->dev, "Unknown key pressed: 0x%02x\n",
> -				 event->event_id);
> -		break;
> -	}
> +		return;
>   >   	/*
>   	 * The device has 3 fans (CPU, GPU, SYS),
> @@ -783,6 +841,14 @@ static void bitland_mifs_wmi_notify(struct wmi_dev=
ice *wdev,
>   	 */
>   	case WMI_EVENT_CPU_FAN_SPEED:
>   	case WMI_EVENT_GPU_FAN_SPEED:
> +		/* Redmi refresh rate toggle quirk */
> +		if (event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED &&
> +		    event->value_low =3D=3D 0 && event->value_high =3D=3D 0) {
> +			payload =3D BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0);
> +			bitland_mifs_wmi_report_key(wdev, payload);
> +			return;
> +		}
> +
>   		if (event->event_id =3D=3D WMI_EVENT_CPU_FAN_SPEED)
>   			fan_data.channel =3D 0;
>   		else
> @@ -793,27 +859,14 @@ static void bitland_mifs_wmi_notify(struct wmi_de=
vice *wdev,
>   		blocking_notifier_call_chain(&bitland_notifier_list,
>   					     BITLAND_NOTIFY_HWMON,
>   					     &fan_data);
> -		break;
> -
> -	case WMI_EVENT_AIRPLANE_MODE:
> -	case WMI_EVENT_TOUCHPAD_STATE:
> -	case WMI_EVENT_FNLOCK_STATE:
> -	case WMI_EVENT_KBD_MODE:
> -	case WMI_EVENT_CAPSLOCK_STATE:
> -	case WMI_EVENT_NUMLOCK_STATE:
> -	case WMI_EVENT_SCROLLLOCK_STATE:
> -	case WMI_EVENT_REFRESH_RATE:
> -	case WMI_EVENT_WIN_KEY_LOCK:
> -		/* These events are informational or handled by firmware */
> -		dev_dbg(&wdev->dev, "State change event: id=3D%d value=3D%d\n",
> -			event->event_id, event->value_low);
> -		break;
> +		return;
>   >   	default:
> -		dev_dbg(&wdev->dev, "Unknown event: id=3D0x%02x value=3D0x%02x\n",
> -			event->event_id, event->value_low);
>   		break;
>   	}
> +
> +	payload =3D get_unaligned_le32(buffer->data);
> +	bitland_mifs_wmi_report_key(wdev, payload);
>   }
>   >   static const struct wmi_device_id bitland_mifs_wmi_id_table[] =3D=
=20{
