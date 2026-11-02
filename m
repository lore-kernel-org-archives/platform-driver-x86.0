Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617832;
	b=ggA4TwSzT9IEeZAPYhNm0RDNCKaUmTNB44zZyREQcNTXqkzBpTK+89wspQJ3tCSw1cbU
	 rs4zQLkFaJFODl2/8DmYVSwscsmI6QkD1AnWbZcTC16c8OxGB3KDzyCP6P6kX8rP7LwmE
	 aap0ZXOFfqDK+7Au4ALNthSXCjfyzqmHooqgDBY/KRc0y0dPSgI2MmEifHdVuUYYA3cvl
	 jrj0sjZNX4IYRmOK6987YLECWQwCBgk+j00e2nG/Ed9iTHZbWbFftUC9vcBgDcdKyFbL/
	 cjbHk3bxN0Tn1BcJHO9xwEp8/L7jZJVsEgrGW6+nBXeVljZTMsZbTMjqcEFzRXtMaHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ns2jpBxHnJhEeiIoRDQem4m1lY/zadpTOWX0iiIepSI=;
	b=3SRgkT8cWyeZBFHaqBORTSvOhjI5fXfVIrfIxga0XMy0m9p0CDuUP8Ep8rcUVk6P3bug
	 eEqQQM1tj7ZfLlNXflg7VbApbqGesnPng9Zog0sSlH+86lURF0pIOj4pd1thz1FuVKtT5
	 7HmqSfnbQAev22rO42zpD7ORtpTiL0E5UjiPhg4pRlIyxoZW28lWRIS0qHhsgMqWnotXF
	 g2VDjwJmEXIidYlpTF2GdTjnxPCRRINPZfGvzFl6eiK4iax4Wxe6Fi9Ectpe6s50Y7ewv
	 7GEUmPfCbu1AaEOGDTMLyaAVqbvdZ53JO+v2QLCWDJ2A5V5CBy54V5r8WrQ4NNJAhDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8iyQhzx;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BF1606A324
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 11:10:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3BF1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b8iyQhzx
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1728166a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 03:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793617831; x=1794222631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ns2jpBxHnJhEeiIoRDQem4m1lY/zadpTOWX0iiIepSI=;
        b=b8iyQhzx11ExCaz0QiBc1bkRDEIz3whLV2+RdANYY3cnLYbkuPqakPzx7Sgc+W3YR2
         WOUBhqPUlwrJhplfW3XnSc2jUhE4i64nRgEh3CbK6JQzgiP4EVorspSJTh9gV5dJYBXS
         a88g6q9ZFI+a/L1g9FD78W43ZJrCUtQmCbtqG/C43eNcgNZbZq1Cyh4G3sHbKKZx6KKM
         fIFEMq5lwz+MEAKF8iPPp5bPPY4WL9UqXorFU/gtDe2SBGSeOtbnDkosou0FO7ZIdEY5
         UC9sXZ42rxYChxP95o/PBYQFyHXTHh4zUDBVKXi9FmGPjh31Q78y33eAua7wgcKGGV2A
         ezlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617831; x=1794222631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ns2jpBxHnJhEeiIoRDQem4m1lY/zadpTOWX0iiIepSI=;
        b=gVjjSm/AgsUI1YdpSy/q2HWN46M7AkNXdlfVr1SJM3pc8zOocyHT5hHXqhM/zHtubG
         7TX0tN0KzO+P16aZEAhX/qrGSpbxSSKlb1kFmKI5+aoSK0NPg9gNO2r0zDU53WzfBQMl
         xsQ3DumKGwv3a/XwIo2C940lHXsqBX4IQvat7cAVqqyRv8lFcb1k7W60GLjZITZLmjhc
         wBcKJR+6VLTORxxJxLYKD7slFY4Z6038umwGogUJQ8GCgzxOw9+4NgYgR5mkasdKrHIV
         aeDYgj/YK6+efsAxPqDjaK9fTfmxK+VlQbzQ1J7Cva4PIBeGJul0bGPScoaMaC9pbBI4
         CwWg==
X-Gm-Message-State: APuU4Z8yR3u09mXYXkSoRPBOGkUqUAMgy0msOulShMPCz34HLgQ2jz0a
	gZeUh+sKAK5vskr/78vh05mCxBb/4qm5vWo9uvwvv2SUoLhuL6kAo9OJBhnLbQ==
X-Gm-Gg: AYBFou2eyeYwxNckex3iF8lRLNzfjonlLICQHtGAnMSBmI7ZsQXr8VDaITBq6HYQoww
	w3Hlwc6Y3zp1/D4htDMb/1r2Tz/uW2DWJgKcnkbrhkZTigklpNNezHz3qP/UFkidyWI/bQmxTMU
	6XBZtGpnHHAQplZXK9+gtJAowxcx6HazbvIgejvulP3S93dij0NtXQhYjljzrhogzSVO3Uwn93D
	0U1/QMpZBlD0Xcnn3VZUXYk43S5vmJe8M4uSCb+n7Ps1xchjRYCbKP5gk+kCmOBwCQ926zal3IK
	EgkBgkUqV4cXVpkp/Z2vGrcATHSP0qGBcqmYFiE778IX1Fd1YT09wiF7Id8xuvLXyiG+oX/eF9T
	Q794ByEXo0WV2S0uI9vYpVkpuN9StY0mZBMR2YoA/IxJQVnCXXqFyPBR1pGGDmSZmzyM2JC/YbW
	BhEd7Qie+kjCVIERFzXdSaIjD6uBr5yMqz1jmvcgslzv/uO0flb080BisotSsayHi5sfEff2I3E
	UDjPz5GX6pU4RaV1ZxaBEEXHtaBaQ7h4leFJvFrPxgdXJLehVp7IedZD/jRs4FKk2vGg3zpjPnw
	jNoKioRazPTiNUcc2gtWeM+0vlH3DYBngZgChnqOAA9v9GLF+6s7bO3rV1COlXDXkdHJ
X-Received: by 2002:a17:90b:2745:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ae89776d99mr7744624a91.13.1793617831065;
        Mon, 02 Nov 2026 03:10:31 -0800 (PST)
Received: from ?IPV6:2408:8210:2436:950:5bd4:8bc0:479b:e7d0? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae881c5624sm7342277a91.4.2026.11.02.03.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:10:30 -0800 (PST)
Message-ID: <59fe5a60-049f-4e53-bd75-e7b2de3717bd@gmail.com>
Date: Mon, 2 Nov 2026 19:10:26 +0800
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
Subject: Re: [PATCH v3 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform
 profile on Fn+K
To: Chris Taraszka <chris@miget.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 KentoNion <kento@kekto.ru>, Matias Civadda
 <matias.civadda2342001@gmail.com>, 7z0423arsenova <7z0423arsenova@proton.me>
References: <20261101161814.1325847-1-chris@miget.com>
 <20261101161814.1325847-5-chris@miget.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <20261101161814.1325847-5-chris@miget.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 00:18, Chris Taraszka wrote:
> On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
> the firmware does not change SystemPerMode itself. The event is a
> request that the vendor software acts on; without that software Fn+K
> does nothing on Windows either, and on Linux it is currently logged as
> an unknown event.
>
> Add a quirk for this and call platform_profile_cycle() from the control
> device when the event arrives, so Fn+K cycles through the profiles that
> all platform profile handlers support. Models without the quirk keep
> ignoring the event.
>
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Chris Taraszka <chris@miget.com>
> ---
>
> Notes:
>      Sent on its own earlier today [1]. It is now part of the series since
>      it changes the TM2424 quirks entry from patch 1. Retested with v3: three
>      Fn+K presses from balanced step performance (0x04) -> low-power (0x02)
>      -> balanced (0x09).
>      
>      [1] https://lore.kernel.org/all/20261101144100.1043263-1-chris@miget.com/
>
>   drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
> index 4d02cd9e8a6b..84d1223d0ec6 100644
> --- a/drivers/platform/x86/bitland-mifs-wmi.c
> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
> @@ -100,6 +100,9 @@ struct bitland_mifs_quirks {
>   
>   	bool return_code_at_end;
>   	bool skip_ac_type_check;
> +
> +	/* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to the OS */
> +	bool cycle_profile_on_key;
>   };
>   
>   static const struct bitland_profile_entry default_profile_entries[] = {
> @@ -126,6 +129,7 @@ static const struct bitland_mifs_quirks tm2424_quirks = {
>   	.profile_entries = tm2424_profile_entries,
>   	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
>   	.skip_ac_type_check = true,
> +	.cycle_profile_on_key = true,
>   };
>   
>   static const struct dmi_system_id bitland_mifs_dmi_table[] = {
> @@ -169,6 +173,7 @@ enum bitland_mifs_event_id {
>   	WMI_EVENT_MIC_MUTE		= 33,
>   	WMI_EVENT_RESERVED_23		= 34,
>   	WMI_EVENT_OPEN_APP		= 35,
> +	WMI_EVENT_PERFORMANCE_CYCLE	= 40,
>   };
>   
>   enum bitland_mifs_event_type {
> @@ -217,6 +222,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
>   enum bitland_notifier_actions {
>   	BITLAND_NOTIFY_KBD_BRIGHTNESS,
>   	BITLAND_NOTIFY_PLATFORM_PROFILE,
> +	BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
>   	BITLAND_NOTIFY_HWMON,
>   };
>   
> @@ -869,6 +875,10 @@ static int bitland_notifier_callback(struct notifier_block *nb,
>   	case BITLAND_NOTIFY_PLATFORM_PROFILE:
>   		platform_profile_notify(data_ctx->pp_dev);
>   		break;
> +	case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
> +		if (data_ctx->pp_dev)
> +			platform_profile_cycle();
> +		break;
>   	case BITLAND_NOTIFY_HWMON:
>   		fan_info = data;
>   
> @@ -1015,6 +1025,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
>   static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>   				    const struct wmi_buffer *buffer)
>   {
> +	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
>   	const struct bitland_mifs_event *event = buffer->data;
>   	struct bitland_fan_notify_data fan_data;
>   	u8 brightness;
> @@ -1043,6 +1054,15 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
>   					     NULL);
>   		return;
>   
> +	case WMI_EVENT_PERFORMANCE_CYCLE:
> +		if (!data->quirks->cycle_profile_on_key)
> +			break;
> +
> +		blocking_notifier_call_chain(&bitland_notifier_list,
> +					     BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
> +					     NULL);
> +		return;
> +

How about 0x16 (WMI_EVENT_PERFORMANCE_PLAN_ALT)? Some devices report 
this instead of 0x28 (WMI_EVENT_PERFORMANCE_CYCLE).

https://lore.kernel.org/all/BelDdF5woNEBX6dZ3_zJDEbVkifs1pdxEjtQ1yC-aKyZahijFJCllxm0l_SqZ5Hsj61D8wfJNa7uDSuNKmyyxo2S0tZp9QS5yaafeZUxvxE=@proton.me/

>   	/*
>   	 * The device has 3 fans (CPU, GPU, SYS),
>   	 * but there are only the CPU and GPU fan has events
