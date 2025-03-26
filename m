Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6503719ADBA
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Mar 2025 09:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742981046; cv=none; b=D/axNNyi6HQLM4a1najCNazJOs3g606dLfbo5y6gws5hst+6ApihhlA1EcHDpNT9dXCSc0mFBedLhOXYCN8X49/mqER3TDl51NsFx9sjpHYcmxm+hL+1rRGwITRpczienzkAJd+DXPg2O2bqAn042MN39iaiPsVlinDUC/RHgdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742981046; c=relaxed/simple;
	bh=qf/sgisAQcKaZRDABaj+IQx31SpuvMLofAX/b03cC9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXbpVE7dLTfKUgu8AyCFltMozKPSbpUlhs/0R+mA8heuwwvLZ8I5Is7uxuzUTOYoDO9agd8b9+cNMArIoHoEGUsGL0xS/jIitCKvfzj1h6Wsj74NWUSbB/8Ma5zMcm0etn4Yb9LRloqvL+RngB8xuwrkybLm7FFN+i7mfeMPjtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkrzIMnF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkrzIMnF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742981044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wQ6QhNnfLYXbZdIZx/vDMwupBr33SbF8nWAPHqeeQvg=;
	b=dkrzIMnFmVl2uXomenud9h6oMdx+Oz4ncblqyQ/27yskpU+2BKNCTm0WBBvKse8GZ7Q1Vf
	OcPsNXgmeEiocnl+IijcnMb25NaD9SowVUD9NyKUTyEUnCItjjctzKTAmnSK9eu7XVlAzC
	CexmQbwuwHU8vtZx3UYKyB9oOHrlAJc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-mCfF0gn-OtaiErAQdM74EA-1; Wed, 26 Mar 2025 05:24:02 -0400
X-MC-Unique: mCfF0gn-OtaiErAQdM74EA-1
X-Mimecast-MFC-AGG-ID: mCfF0gn-OtaiErAQdM74EA_1742981041
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3db5469fbso533797766b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Mar 2025 02:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981040; x=1743585840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ6QhNnfLYXbZdIZx/vDMwupBr33SbF8nWAPHqeeQvg=;
        b=cyu2HyOcQQCDxX3J3x6n994e9JnJR7X28Bf8u4JY1qBQMcgbUHhXnDTNmDfoxvac6x
         Af2i3Bgf96+d796F6iwiJ391va19SCwuSDLz9YH+er3rwHZY4k/trkiauz+AiM4q6XaY
         NBBIqeWGSoflVoftHE9kqrB1pdEJqCVTmX++Xp5u42ZU4/HbV9kIaRY4sYDLZcBbML6m
         Od2Yw7mvBA9H4lMfDvxhDYbyWmjEsPdWyieif619SOvP/P9wop9qqMUyI4t1dH9kmuGT
         IiQgWwIRFysXgMC67pkRSM0PcIwht4smasEV0gJjntCRXcxxJvhzTCNF2hRt3C735F/9
         4U9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXrvIp2sVYwvNjBufwsW8RdOFPIOeKjQ1tUheAxYZbQYw7a4B753Vd6yST2t83yT174cjj087TI7i6WHZJT9afXNHup@vger.kernel.org
X-Gm-Message-State: AOJu0YxsKURDtTMjzrb0xt90BFtRTBDivOLlY0RF9jh2M4f2bn4ekSDU
	Me0pQFqIztkxEJkVYBkkJW37P5KWjxvDZIQllxTDzvcA7IYKpg2uB65mfKV4P9LjOl90jNiEIdW
	oopBxypbiut+Hr83wnFe7Ue0zYoqgxDrjOzhbXST0T0/iHRLGvjLoPtUttxLtgWXgaVvNjipkTa
	v18+A=
X-Gm-Gg: ASbGncvOY2t7aVQHLkBkCF0Dqg69prX2u5kIqbMWIZ0qwxHJfrvBBfjmkVT+5a9ZOOQ
	/6GE3TFbCdLy27iVP354nLNY3lWuy6Z0fYvuRzEewZC8lAdyTMQQPTM39jRDBbpaw1Rv0u6jGd3
	7fTBmCa4GSTvRtOcfTJWCRzmaILV15CgxTKZZ4SgB+1GECIdL9pX3b0bLcwgNd6bffNZcwnOKpQ
	L6iFf7vA603hlxiXuuEEnNpgh9HhmaRaXVkiQ9Gklo02IGvwiVdeLqiVVAvJ6MdakXgBvX7xwfx
	41G9kS18LSXuYcC77twT+iR9wCdMb/L6+EIQUk03kKTgc4xx5CIhX5c7c5v0IM9jo9aGxo1PAuv
	WzY6vZWPAE0ZhG30+xyVc1juQIYeW31CmM6rDPLzpxL5dEM78IJ5bk2TTifoUAz6MCA==
X-Received: by 2002:a17:907:3d92:b0:ac6:ef94:3d9a with SMTP id a640c23a62f3a-ac6ef946332mr54918466b.4.1742981040469;
        Wed, 26 Mar 2025 02:24:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgfGOSw/fuBqgO1O4PO8WqGxGVs32QYzEOSqRxo/94jTXehX2juoFoGt/m3XlXvnmLeU9OWQ==
X-Received: by 2002:a17:907:3d92:b0:ac6:ef94:3d9a with SMTP id a640c23a62f3a-ac6ef946332mr54916466b.4.1742981039951;
        Wed, 26 Mar 2025 02:23:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efb658e4sm995169166b.87.2025.03.26.02.23.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 02:23:59 -0700 (PDT)
Message-ID: <c487c00c-2900-42cf-b83b-08c5e1b866e1@redhat.com>
Date: Wed, 26 Mar 2025 10:23:58 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Added support for a some new buttons in ideapad-laptop
 driver
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
 ikepanhc@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250326091632.23644-1-gasper.nemgar@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250326091632.23644-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gašper,

On 26-Mar-25 10:16 AM, Gašper Nemgar wrote:
> Added entries to unsuported wmi codes in ideapad_keymap[]
> and one check in wmi_nofify() in order to get wmi code 0x13d to trigger platform_profile_cycle() but only if dytc exists.
> 
> Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"

Thank you for the new version.

> ---
>  drivers/platform/x86/ideapad-laptop.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 30bd366d7..cd8c38dc8 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1308,6 +1308,16 @@ static const struct key_entry ideapad_keymap[] = {
>  	/* Specific to some newer models */
>  	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>  	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +	/* Star- (User Asignable Key) */
> +	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> +	/* Eye */
> +	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },

> +	/* Performance toggle also Fn+Q */
> +	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },

The above 2 lines should be:

	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
	{ KE_IGNORE,	0x3d | IDEAPAD_WMI_KEY },

otherwise this version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> +	/* shift + prtsc */
> +	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> +	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
>  
>  	{ KE_END },
>  };
> @@ -2094,6 +2104,14 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>  		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
>  			data->integer.value);
>  
> +		/* performance button triggered by  ...  */
> +		if (data->integer.value == 0x3d) {
> +			if (priv->dytc) {
> +				platform_profile_cycle();
> +				break;
> +			}
> +		}
> +
>  		/* 0x02 FnLock, 0x03 Esc */
>  		if (data->integer.value == 0x02 || data->integer.value == 0x03)
>  			ideapad_fn_lock_led_notify(priv, data->integer.value == 0x02);

