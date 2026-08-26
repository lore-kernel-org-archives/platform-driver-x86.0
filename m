Received: from mta1.migadu.com (out-12.mta1.migadu.com [95.215.58.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC27A21ABD7
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 20:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787777154; cv=none; b=YFTcfFaxAWse6PE7whZCrlvjC1hILhuwYWatdi0YWT/svWUp1pt+yHazfwT+gfgsKQsyjRMmKE0MUuJSp2GADVokxMKCWviAt6xeXmAIyS1u/YZdLOU0O4hZnfrCaG1BrEJHU76qAB32ZZ2WX6Nzasm6Y3OBdtdGDNp5/UQc7tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787777154; c=relaxed/simple;
	bh=opkMbCowtGRJIKWDtznrnAR6Udb84HiEcQuLn82R/UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imfWCRoFYuQgPtR9ZK/WcAXMMvDGZjvAMlXn0dZYEdf4bec+/CIonrrTj/TFaoxCDvjFExvpPS0Vc+i5KXUvwmp1tISwtvzr162OnV7mRDgTB1Z+1PloYqg2EIGPVRtwvrJoQBYpshnFNhaNY3E1Zu+/hCs6B5fm6X78u86czvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Y/G4xRB7; arc=none smtp.client-ip=95.215.58.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Y/G4xRB7"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=opkMbCowtGRJIKWDtznrnAR6Udb84HiEcQuLn82R/UA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787777149; v=1; x=1788381949;
 b=Y/G4xRB7IkCzS7XR1ecG7QQWRrIPL1cYlor+ob5D+GqtKvmtLfoBF3B83p/Ij/ZB7dQerCO/
 2itai4IFh8PhBiVIBn1KQP6deBc+XegQKyvXR0tM5T8LxPynoSU8ai0w03tN7GTnWqH1AQme+NT
 4HRUy1zxMz8qZHyK2uC/cALE=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: from [10.8.1.6] (107.189.15.163)
	by smtp.migadu.com with ESMTPS id 544a8b63d04562fd;
	Wed, 26 Aug 2026 20:45:49 +0000
X-Mizu-Trace-ID: 544a8b63d04562fd
X-Migadu-Flow: FLOW_OUT
Message-ID: <bb3bc2e6-c27d-4660-82b8-b22557cc8101@linux.dev>
Date: Wed, 26 Aug 2026 23:45:41 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] platform/x86: bitland-mifs-wmi: Merge the function
 of redmi-wmi into the bitland driver
To: Mingyou Chen <qby140326@gmail.com>
Cc: W_Armin@gmx.de, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, nika@nikableh.moe,
 platform-driver-x86@vger.kernel.org, vlku.milos.fun@gmail.com, i@rsplwe.com,
 wolf109909@outlook.com, rahulbheda131313@gmail.com
References: <20260816100813.300450-1-qby140326@gmail.com>
 <20260816100813.300450-3-qby140326@gmail.com>
Content-Language: en-US
From: Ilya Gladyshev <ilya.gladyshev@linux.dev>
In-Reply-To: <20260816100813.300450-3-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for your patch. I have tested it on my Redmi Book Pro 15 2022, 
and everything works as expected, so

Tested-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>

On 8/16/26 13:08, Mingyou Chen wrote:
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
> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>   drivers/platform/x86/bitland-mifs-wmi.c | 139 ++++++++++++++++--------
>   1 file changed, 96 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index b0d06a80e89e..8b6476881de6 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -34,6 +34,11 @@
>   #include <linux/units.h>
>   #include <linux/wmi.h>
>   
> +#define BI_HOTKEY_CODE(id, low, high) \
> +	(((u32)(high) << 24) | ((u32)(low) << 16) | ((u32)(id) << 8) | WMI_EVENT_TYPE_HOTKEY)
> +
 > ...> +
> +	/* AI button has code for each position */
> +	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
> +
> +	{ KE_KEY, BI_HOTKEY_CODE(0x19, 1, 0), { KEY_ASSISTANT } },

Why empty line between two KEY_ASSISTANT mappings?

>   static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>   				    const struct wmi_buffer *buffer)
>   {
> -	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
>   	const struct bitland_mifs_event *event = buffer->data;
>   	struct bitland_fan_notify_data fan_data;
> +	u32 payload;
>   	u8 brightness;
>   
>   	/* Validate event type */
> @@ -752,24 +821,13 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>   		blocking_notifier_call_chain(&bitland_notifier_list,
>   					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
>   					     &brightness);
> -		break;
> +		return;
>   
>   	case WMI_EVENT_PERFORMANCE_PLAN:
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
>   
>   	/*
>   	 * The device has 3 fans (CPU, GPU, SYS),
> @@ -777,6 +835,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>   	 */
>   	case WMI_EVENT_CPU_FAN_SPEED:
>   	case WMI_EVENT_GPU_FAN_SPEED:
> +		/* Redmi refresh rate toggle quirk */
> +		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED &&
> +		    event->value_low == 0 && event->value_high == 0) {
> +			payload = BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0);
> +			bitland_mifs_wmi_report_key(wdev, payload);
> +			return;
> +		}
> +
>   		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED)
>   			fan_data.channel = 0;
>   		else
> @@ -787,27 +853,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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
> -		dev_dbg(&wdev->dev, "State change event: id=%d value=%d\n",
> -			event->event_id, event->value_low);
> -		break;
> +		return;
>   
>   	default:
> -		dev_dbg(&wdev->dev, "Unknown event: id=0x%02x value=0x%02x\n",
> -			event->event_id, event->value_low);
>   		break;
>   	}
> +
> +	payload = get_unaligned_le32(buffer->data);
> +	bitland_mifs_wmi_report_key(wdev, payload);
>   }

[nitpick]
Would it make sense to place this inside the `default` case? That might 
make the control flow simpler (no break->return changes, everything 
still happens in the switch).

>   static const struct wmi_device_id bitland_mifs_wmi_id_table[] = {

---
Ilya Gladyshev // foxido.dev
