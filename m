Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90EF405C5D;
	Fri, 10 Jul 2026 10:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678848; cv=none; b=uKwrRb+2WZKTTCVObvTyphdqo8nCo3/aA1TDKD/RSt+mZKTLCo0IARp7vPH9yUuQsHLNIH3dV/ezR1TXNMi3BHC9+Tl4GQ1d/yDfQS3+pHBxRip9QND9dsuMlg+3ntl7Ds468Kq265pP0dal2q57aQcqTOSrdtl6svYPnlkBbpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678848; c=relaxed/simple;
	bh=FnKM2DhIQzz08qstztrl6T2iFsMlMkEFvcbkwviROQQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GPh98ODfWgIhG+Rt+aFwU8FmmanNQrZ4s2UUIFiqKcKqgq/YYO8qVZCD/OAN3A9snaDw8uisG2Pw26UteeCEIk6bDMA/dpS1yl/qjo+oaD/EtWLAwyqKFDwdb/glpciQb4m0talpkr5BKb6X9+rK7Fz1Cv+QNM/CexhbJP7wRBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HF3nboyl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HF3nboyl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783678847; x=1815214847;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=FnKM2DhIQzz08qstztrl6T2iFsMlMkEFvcbkwviROQQ=;
  b=HF3nboyl0ZVAuCzoILiC+BJTJZy1iXvx0q3oPJ0OkTwFJ7p7CagHVkco
   H1bW6usZgh5TotQzCVPS9roKdCbuxe4b5tgejYAgxTG6cvnHYRVwTKB3Z
   zaXyTlY7JoKk/qS2oQujZ09hwYcsMc5f8CFn7wlBw0hg8MsB/1s/KefYY
   vAVyxEKeYNTiMBWYkLTbgRndfJCsQZqyaylIbJqOB01hW6z+Py5q1WKCB
   ipKuni9kF6oS2Xo8TwHt0yZDryk8WwW/lZfq8gAbCbgWHnbFNf9TY1mc/
   X62xZDH7IjbEbEPY9vm1Fl3X/fFe5gJweMhU0E9tERKtsh42P2kGR2R8G
   Q==;
X-CSE-ConnectionGUID: dnbk9xBrSZCmO8gVuTb7nw==
X-CSE-MsgGUID: MhdgP4uySAycLMHKAbFlVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95019960"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95019960"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:20:46 -0700
X-CSE-ConnectionGUID: 9oqh9q9tTx6GrrycK2h2TQ==
X-CSE-MsgGUID: l6enTpMOT+OiG7KypNyj+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="259161346"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.169])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 03:20:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 10 Jul 2026 13:20:38 +0300 (EEST)
To: Mingyou Chen <qby140326@gmail.com>
cc: W_Armin@gmx.de, foxido@foxido.dev, Hans de Goede <hansg@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, nika@nikableh.moe, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v1 2/4] platform/x86: bitland-mifs-wmi: Merge the function
 of redmi-wmi into the bitland driver
In-Reply-To: <20260709122337.17417-3-qby140326@gmail.com>
Message-ID: <9ef7475c-f513-61f5-cfaa-5cba932bed02@linux.intel.com>
References: <20260709122337.17417-1-qby140326@gmail.com> <20260709122337.17417-3-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Jul 2026, Mingyou Chen wrote:

> The bitland-mifs-wmi and legacy redmi-wmi drivers both attempt to bind
> to
> the same WMI GUID (46C93E13-EE9B-4262-8488-563BCA757FEF). This overlap
> causes a device
> registration conflict, preventing one of the drivers from loading
> properly depending on the module initialization order.
> 
> Merge the event handling logic from redmi-wmi into
> bitland-mifs-wmi. By handling both device layouts within a single
> driver,
> we eliminate the GUID ownership conflict.

Please reflow the paragraphs to properly fill every line.

> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 203 +++++++++++++++---------
>  1 file changed, 127 insertions(+), 76 deletions(-)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index b0d06a80e89e..cbe118bbe428 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -34,6 +34,11 @@
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
> @@ -74,34 +79,34 @@ enum bitland_mifs_power_profile {
>  };
>  
>  enum bitland_mifs_event_id {
> -	WMI_EVENT_RESERVED_1		= 1,
> -	WMI_EVENT_RESERVED_2		= 2,
> -	WMI_EVENT_RESERVED_3		= 3,
> -	WMI_EVENT_AIRPLANE_MODE		= 4,
> -	WMI_EVENT_KBD_BRIGHTNESS	= 5,
> -	WMI_EVENT_TOUCHPAD_STATE	= 6,
> -	WMI_EVENT_FNLOCK_STATE		= 7,
> -	WMI_EVENT_KBD_MODE		= 8,
> -	WMI_EVENT_CAPSLOCK_STATE	= 9,
> -	WMI_EVENT_CALCULATOR_START	= 11,
> -	WMI_EVENT_BROWSER_START		= 12,
> -	WMI_EVENT_NUMLOCK_STATE		= 13,
> -	WMI_EVENT_SCROLLLOCK_STATE	= 14,
> -	WMI_EVENT_PERFORMANCE_PLAN	= 15,
> -	WMI_EVENT_FN_J			= 16,
> -	WMI_EVENT_FN_F			= 17,
> -	WMI_EVENT_FN_0			= 18,
> -	WMI_EVENT_FN_1			= 19,
> -	WMI_EVENT_FN_2			= 20,
> -	WMI_EVENT_FN_3			= 21,
> -	WMI_EVENT_FN_4			= 22,
> -	WMI_EVENT_FN_5			= 24,
> -	WMI_EVENT_REFRESH_RATE		= 25,
> -	WMI_EVENT_CPU_FAN_SPEED		= 26,
> -	WMI_EVENT_GPU_FAN_SPEED		= 32,
> -	WMI_EVENT_WIN_KEY_LOCK		= 33,
> -	WMI_EVENT_RESERVED_23		= 34,
> -	WMI_EVENT_OPEN_APP		= 35,
> +	WMI_EVENT_RESERVED_1        = 1,
> +	WMI_EVENT_RESERVED_2        = 2,
> +	WMI_EVENT_RESERVED_3        = 3,
> +	WMI_EVENT_AIRPLANE_MODE     = 4,
> +	WMI_EVENT_KBD_BRIGHTNESS    = 5,
> +	WMI_EVENT_TOUCHPAD_STATE    = 6,
> +	WMI_EVENT_FNLOCK_STATE      = 7,
> +	WMI_EVENT_KBD_MODE          = 8,
> +	WMI_EVENT_CAPSLOCK_STATE    = 9,
> +	WMI_EVENT_CALCULATOR_START  = 11,
> +	WMI_EVENT_BROWSER_START     = 12,
> +	WMI_EVENT_NUMLOCK_STATE     = 13,
> +	WMI_EVENT_SCROLLLOCK_STATE  = 14,
> +	WMI_EVENT_PERFORMANCE_PLAN  = 15,
> +	WMI_EVENT_FN_J              = 16,
> +	WMI_EVENT_FN_F              = 17,
> +	WMI_EVENT_FN_0              = 18,
> +	WMI_EVENT_FN_1              = 19,
> +	WMI_EVENT_FN_2              = 20,
> +	WMI_EVENT_FN_3              = 21,
> +	WMI_EVENT_FN_4              = 22,
> +	WMI_EVENT_FN_5              = 24,
> +	WMI_EVENT_REFRESH_RATE      = 25,
> +	WMI_EVENT_CPU_FAN_SPEED     = 26,
> +	WMI_EVENT_GPU_FAN_SPEED     = 32,
> +	WMI_EVENT_WIN_KEY_LOCK      = 33,
> +	WMI_EVENT_RESERVED_23       = 34,
> +	WMI_EVENT_OPEN_APP          = 35,

Since you're moving these to left, please do it in a separate patch (or 
not at all). In this patch, only add/change what you have to retaining the 
existing alignment.

>  };
>  
>  enum bitland_mifs_event_type {
> @@ -601,18 +606,67 @@ static const struct attribute *const laptop_attrs[] = {
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
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0),
> +	{ KEY_PROG1 } },

Don't ever do misleading indentations like this please.

You're allowed to use 100 chars so these can fit to single line.

If you still want multilines, you need to indent the members of the struct 
by one tab (and leave only { on the first line).

> +
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CALCULATOR_START, 1, 0),
> +	{ KEY_CALC } },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_BROWSER_START, 1, 0),
> +	{ KEY_WWW } },
> +
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_J, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_1, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_2, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 0, 0), {} },
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 0, 0), {} },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_2, 0, 0),
> +	{ KEY_SELECTIVE_SCREENSHOT } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_3, 0, 0),
> +	{ KEY_ALL_APPLICATIONS } },
> +	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 0, 0), { KEY_CONFIG } },
> +	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 1, 0), { KEY_CONFIG } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0),
> +	{ KEY_SWITCHVIDEOMODE } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0),
> +	{ KEY_REFRESH_RATE_TOGGLE } },
> +
> +	/* AI button has code for each position */
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0),
> +	{ KEY_ASSISTANT } },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(0x19, 1, 0),
> +	{ KEY_ASSISTANT } },
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
>  };
>  
>  static void bitland_notifier_unregister(void *data)
> @@ -736,9 +790,12 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>  	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
>  	const struct bitland_mifs_event *event = buffer->data;
>  	struct bitland_fan_notify_data fan_data;
> +	struct key_entry *entry;
> +	bool autorelease = true;
> +	int value = 1;
> +	u32 payload;
>  	u8 brightness;
>  
> -	/* Validate event type */

Why is this removed? How is it related to the change.

>  	if (event->event_type != WMI_EVENT_TYPE_HOTKEY)
>  		return;
>  
> @@ -752,62 +809,56 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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
> -	/*
> -	 * The device has 3 fans (CPU, GPU, SYS),
> -	 * but there are only the CPU and GPU fan has events
> -	 */
>  	case WMI_EVENT_CPU_FAN_SPEED:
>  	case WMI_EVENT_GPU_FAN_SPEED:
> +		/* Redmi refresh rate toggle quirk */
> +		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED &&
> +		    event->value_low == 0 && event->value_high == 0) {
> +			payload = BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0);
> +			goto report_key;
> +		}
> +
>  		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED)
>  			fan_data.channel = 0;
>  		else
>  			fan_data.channel = 1;
>  
> -		/* Fan speed is 16-bit value (value_low is LSB, value_high is MSB) */

Is this related to your change?

>  		fan_data.speed = (event->value_high << 8) | event->value_low;
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
> +
> +report_key:
> +	entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
> +
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

How about moving this report_key part into own function so you can avoid 
adding the label and complicated break/return arrangements.


-- 
 i.

