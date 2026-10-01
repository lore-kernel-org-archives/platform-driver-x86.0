Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5D3793DF;
	Thu,  1 Oct 2026 07:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840563; cv=none; b=msugB8hWPqr18H9fqBxxbawokIYjCTH4FNLeDmsymnvUog6HvMPofEUhqHZV4OGaf16dFm4ssQBXfKe1oksyCAv6VcSBbeYjZA5pdSD3EA2wKFUWyvoyusRoxlm7HdO85+vSuA05jUUAh7eYBmrGwO63Yr5UPV1rWuR2LOPf/Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840563; c=relaxed/simple;
	bh=kEbYz9lKtt8SL8bR22g2pgg1XGmY3h47dOpgVtAIoMc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oO4Jf9gXvcK7we9u4dFEJtIl8czT4KAvUio5guQlbTmBO3gF5rij+ftqoOyEarWR5OrCYdQnsthhIkjL0Mh1Ntl/Xxt6TheXb2d6ohLr3nHYN74SuVcGZ3Eu8Md3xB7vOc9G4cYrgLj3lqDb1xWqSiigXFdedjE6zOjngMmRr7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7AdpxLE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7AdpxLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790840561; x=1822376561;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kEbYz9lKtt8SL8bR22g2pgg1XGmY3h47dOpgVtAIoMc=;
  b=C7AdpxLEKfXKzAT6oIE8m3/638vOq7bjr9W+klO2ZJppzve/2PjblW13
   +l4Es4HNiiFwEsaL8d5DETpXJKqGirZY+3qHQ0hI78mLWXSULXIbHL4Gi
   3wXDc3Ks2si8z0CWUT1UJnBYvLua0z0yFfDFFbhyMCvRRWdwthZJarUL6
   moQjzcuci88cmEJR91JPybYmacBrVMi7hyy7FpufHnvrg2Mjqf7ijRLb4
   vZztFsbUlQqI7Ew6y75dgdoH6XDtPXo/9C/zHUhXWgblY6nqFE2iIQVqW
   5sq0V6lBKxPqRlgtCqyTUC30UYiq4CPY1qcWkkDoKyqJfJEHJQdR5m+aC
   A==;
X-CSE-ConnectionGUID: Dy/cE0LETMishfjVLnvo4A==
X-CSE-MsgGUID: 9Ow4pFsvThe9jCVNdyduqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="101750110"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="101750110"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:42:40 -0700
X-CSE-ConnectionGUID: aW5NiRZkSNGs/jcW+GJb3A==
X-CSE-MsgGUID: KXpVgJN/TL+cEyAbPwt/YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275962587"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.34])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:42:34 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 1 Oct 2026 10:42:27 +0300 (EEST)
To: Mingyou Chen <qby140326@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, 
    Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>, 
    platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>, 
    Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>, 
    Chris Taraszka <chris@miget.com>, 
    Matias Civadda <matias.civadda2342001@gmail.com>, 
    =?ISO-2022-JP?Q?=1B$B9b=1B=28J_=1B$B=3DSJ8=1B=28J?= <btx342@gmail.com>, 
    powerfullz <wleizc7319@gmail.com>, 
    =?GB2312?B?y+8g0/7D+g==?= <wolf109909@outlook.com>, 
    =?ISO-8859-15?Q?Milo=A8_Vlku?= <vlku.milos.fun@gmail.com>, 
    Rsplwe <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>, 
    Anton Karasev <uselessfire@gmail.com>, Nika Krasnova <nika@nikableh.moe>
Subject: Re: [PATCH v7 2/5] platform/x86: bitland-mifs-wmi: Merge the function
 of redmi-wmi into the bitland driver
In-Reply-To: <20261001002239.31461-3-qby140326@gmail.com>
Message-ID: <341535eb-4942-48bb-daf4-a3e2817932d2@linux.intel.com>
References: <20261001002239.31461-1-qby140326@gmail.com> <20261001002239.31461-3-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 1 Oct 2026, Mingyou Chen wrote:

> The bitland-mifs-wmi and legacy redmi-wmi drivers both attempt to bind
> to the same WMI GUID (46C93E13-EE9B-4262-8488-563BCA757FEF). This
> overlap causes a device registration conflict, preventing one of the
> drivers from loading properly depending on the module initialization
> order.
> 
> Merge the event handling logic from redmi-wmi into bitland-mifs-wmi. By
> handling both device layouts within a single driver, we eliminate the
> GUID ownership conflict.
> 
> Tested-by: Nika Krasnova <nika@nikableh.moe>
> Tested-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
> Reviewed-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 147 ++++++++++++++++--------
>  1 file changed, 101 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index dd1648b7de77..85683eb116c9 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -35,6 +35,11 @@
>  #include <linux/units.h>
>  #include <linux/wmi.h>
>  
> +#define BI_HOTKEY_CODE(id, low, high) \
> +	(((u32)(high) << 24) | ((u32)(low) << 16) | ((u32)(id) << 8) | WMI_EVENT_TYPE_HOTKEY)
> +
> +#define AI_KEY_VALUE_MASK    BIT(8)
> +
>  #define DRV_NAME		"bitland-mifs-wmi"
>  #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
>  #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
> @@ -80,9 +85,9 @@ enum bitland_mifs_power_profile {
>  };
>  
>  enum bitland_mifs_event_id {
> -	WMI_EVENT_RESERVED_1		= 1,
> -	WMI_EVENT_RESERVED_2		= 2,
> -	WMI_EVENT_RESERVED_3		= 3,
> +	WMI_EVENT_SWITCHVIDEOMODE	= 1,
> +	WMI_EVENT_SELECTIVE_SCREENSHOT	= 2,
> +	WMI_EVENT_ALL_APPLICATIONS	= 3,
>  	WMI_EVENT_AIRPLANE_MODE		= 4,
>  	WMI_EVENT_KBD_BRIGHTNESS	= 5,
>  	WMI_EVENT_TOUCHPAD_STATE	= 6,
> @@ -104,6 +109,7 @@ enum bitland_mifs_event_id {
>  	WMI_EVENT_FN_5			= 24,
>  	WMI_EVENT_REFRESH_RATE		= 25,
>  	WMI_EVENT_CPU_FAN_SPEED		= 26,
> +	WMI_EVENT_CONFIG		= 27,
>  	WMI_EVENT_GPU_FAN_SPEED		= 32,
>  	WMI_EVENT_WIN_KEY_LOCK		= 33,
>  	WMI_EVENT_RESERVED_23		= 34,
> @@ -607,18 +613,60 @@ static const struct attribute *const laptop_attrs[] = {
>  ATTRIBUTE_GROUPS(laptop);
>  
>  static const struct key_entry bitland_mifs_wmi_keymap[] = {
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
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CALCULATOR_START, 1, 0), { KEY_CALC } },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_BROWSER_START, 1, 0), { KEY_WWW } },
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
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SELECTIVE_SCREENSHOT, 0, 0),
> +		{ KEY_SELECTIVE_SCREENSHOT } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_ALL_APPLICATIONS, 0, 0), { KEY_ALL_APPLICATIONS } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CONFIG, 0, 0), { KEY_CONFIG } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CONFIG, 1, 0), { KEY_CONFIG } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
> +
> +	/* AI button has code for each position */
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(0x19, 1, 0), { KEY_ASSISTANT } },
> +
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {} },
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
> +	{ KEY_FN_ESC, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), {} },
> +	{ KEY_FN_ESC, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), {} },
> +
> +	/* Fn+`/1/2/3/4 */
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 1, 0), { KEY_F13 } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 1, 0), { KEY_F14 } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_1, 1, 0), { KEY_F15 } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_2, 1, 0), { KEY_F16 } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 1, 0), { KEY_F17 } },
> +
> +	{ KE_END }

Does this end up dropping handling for the keys added in e0d6312578e1 
("platform/x86: redmi-wmi: report EC state change events").

--
 i.

>  };
>  
>  static void bitland_notifier_unregister(void *data)
> @@ -736,13 +784,36 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
>  				       &drv_data->notifier);
>  }
>  
> +static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
> +{
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
> +	struct key_entry *entry;
> +	bool autorelease = true;
> +	int value = 1;
> +
> +	entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
> +	if (!entry) {
> +		dev_dbg(&wdev->dev, "Unknown WMI hotkey with payload 0x%08x\n", payload);
> +		return;
> +	}
> +
> +	/* AI key quirk */
> +	if (entry->keycode == KEY_ASSISTANT) {
> +		value = !(payload & AI_KEY_VALUE_MASK);
> +		autorelease = false;
> +	}
> +
> +	guard(mutex)(&data->lock);
> +	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
> +}
> +
>  static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>  				    const struct wmi_buffer *buffer)
>  {
> -	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
>  	const struct bitland_mifs_event *event = buffer->data;
>  	struct bitland_fan_notify_data fan_data;
>  	u8 brightness;
> +	u32 payload;
>  
>  	/* Validate event type */
>  	if (event->event_type != WMI_EVENT_TYPE_HOTKEY)
> @@ -758,24 +829,13 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>  		blocking_notifier_call_chain(&bitland_notifier_list,
>  					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
>  					     &brightness);
> -		break;
> +		return;
>  
>  	case WMI_EVENT_PERFORMANCE_PLAN:
>  		blocking_notifier_call_chain(&bitland_notifier_list,
>  					     BITLAND_NOTIFY_PLATFORM_PROFILE,
>  					     NULL);
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
>  
>  	/*
>  	 * The device has 3 fans (CPU, GPU, SYS),
> @@ -783,6 +843,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>  	 */
>  	case WMI_EVENT_CPU_FAN_SPEED:
>  	case WMI_EVENT_GPU_FAN_SPEED:
> +		/* Redmi refresh rate toggle quirk */
> +		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED &&
> +		    event->value_low == 0 && event->value_high == 0) {
> +			payload = BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0);
> +			bitland_mifs_wmi_report_key(wdev, payload);
> +			return;
> +		}
> +
>  		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED)
>  			fan_data.channel = 0;
>  		else
> @@ -793,27 +861,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>  		blocking_notifier_call_chain(&bitland_notifier_list,
>  					     BITLAND_NOTIFY_HWMON,
>  					     &fan_data);
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
> -		dev_dbg(&wdev->dev, "State change event: id=%d value=%d\n",
> -			event->event_id, event->value_low);
> -		break;
> +		return;
>  
>  	default:
> -		dev_dbg(&wdev->dev, "Unknown event: id=0x%02x value=0x%02x\n",
> -			event->event_id, event->value_low);
>  		break;
>  	}
> +
> +	payload = get_unaligned_le32(buffer->data);
> +	bitland_mifs_wmi_report_key(wdev, payload);
>  }
>  
>  static const struct wmi_device_id bitland_mifs_wmi_id_table[] = {
> 
