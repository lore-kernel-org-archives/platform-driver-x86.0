Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920EF472064;
	Mon, 12 Oct 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807515; cv=none; b=QE6rYxGonlHCXlbNRLT3LjM5d4n7n3jBM3FkO0xO6V+/Ib+AnOAAG5GTGQkBMUnlIaNGQ+OQQoFsQRqh2vrDF2UOmwlQ1UVb54WIDDHnVyA2SycYqs4YjHziG2djrq5+sYk2WASrBFxrWXqAijarDH4x/CZVqTPdNTgzJiCw1dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807515; c=relaxed/simple;
	bh=l0oKdz2nX/hJcAT339qZ2YcfVbh+sK5UmfylpdCIK/4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SqO+x8P5ESzzisigOKtbGmrktfnzjeeG1TsDEnHWbVGIQDcqaMOsnu6gJmL4J4sVYsykXrR2SgQNlEjbe4eYZ57yHe2+sqSTwzP8Ip1Lrb1Q3No4ssYX5AfmO03ck0+Gel99MjC6B2wzzmNyWeZ4bzdHLVYHslct3m3UTNPCUpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hR0ia8/a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hR0ia8/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791807513; x=1823343513;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=l0oKdz2nX/hJcAT339qZ2YcfVbh+sK5UmfylpdCIK/4=;
  b=hR0ia8/a8ESv4XhMvspxAItwbhOxjb+xJPV02NSC4PW7CWrjq0KKwCSO
   FV/2ooE8YWGI1f8aFjWxfMBT4p9Ej2wdM5O2m+Uaax4BIqe4V2ZBYCInS
   dQocpD4cmSR+4DTTq61fYhIcsu2/B4g7aWgqDjxTRcxHZlx9MzEd0gvLV
   +C/KvrHeqELNvZ+tPObXWDuDehKBTH7ixMN4xB4rnea6WfjcF3jyJLlLA
   mp1tyKkHvONyo87uq/P7aoR/TC8bC7whIEdSB0K9zG2qjas6j/FLjPKco
   /vXMmLUFBf95rCSA9QHtckosDXp1Qj2W66zQ3v3d7DLGyMmM7GFkL4yvN
   Q==;
X-CSE-ConnectionGUID: NWzNoh8NQ8mIWHn0YVoJ/A==
X-CSE-MsgGUID: aviY6gJDSXewpGiXhF1rjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11932"; a="529710"
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="529710"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:18:32 -0700
X-CSE-ConnectionGUID: IL6vdSjOTU6L7k3rc+1X5Q==
X-CSE-MsgGUID: i77UD3qLQ+KqpMPT2Cmn+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,153,1787036400"; 
   d="scan'208";a="1255257"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.202])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2026 05:18:27 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 12 Oct 2026 15:18:23 +0300 (EEST)
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
    Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>, 
    Nika Krasnova <nika@nikableh.moe>
Subject: Re: [PATCH v11 2/6] platform/x86: bitland-mifs-wmi: Merge the function
 of redmi-wmi into the bitland driver
In-Reply-To: <20261012100532.19612-3-qby140326@gmail.com>
Message-ID: <365c0d24-f9c3-f0ac-fd2b-eb29ae2d2fb5@linux.intel.com>
References: <20261012100532.19612-1-qby140326@gmail.com> <20261012100532.19612-3-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Oct 2026, Mingyou Chen wrote:

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

There was comment that redmi features are not properly carried over:

https://lore.kernel.org/all/20261008152647.1510152-1-uselessfire@gmail.com/

--
 i.

> ---
>  drivers/platform/x86/bitland-mifs-wmi.c | 149 ++++++++++++++++--------
>  1 file changed, 102 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index dd1648b7de77..a6978d14b975 100644
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
> @@ -100,10 +105,11 @@ enum bitland_mifs_event_id {
>  	WMI_EVENT_FN_1			= 19,
>  	WMI_EVENT_FN_2			= 20,
>  	WMI_EVENT_FN_3			= 21,
> -	WMI_EVENT_FN_4			= 22,
> +	WMI_EVENT_KEY_PERFORMANCE	= 22,
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
> +	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 0, 0), {} },
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
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {KEY_KBDILLUMTOGGLE} },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {KEY_KBDILLUMTOGGLE} },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {KEY_KBDILLUMTOGGLE} },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {KEY_KBDILLUMTOGGLE} },
> +
> +	/* Xiaomi G Command Center */
> +	{ KE_KEY, BI_HOTKEY_CODE(0x0a, 1, 0), { KEY_VENDOR } },
> +
> +	/* OEM preset power mode */
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 1, 0), { KEY_PERFORMANCE } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 2, 0), { KEY_PERFORMANCE } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 3, 0), { KEY_PERFORMANCE } },
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 4, 0), { KEY_PERFORMANCE } },
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

-- 
 i.

