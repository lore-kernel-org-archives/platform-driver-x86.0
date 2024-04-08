Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FA17FBBC
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 13:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712581994; cv=none; b=ESM7DKm+jyxU3XR7c8Lw8K5QAgVvOLtZj292pvLV4uhjk4YDqtq0/sbzQLGBIeFFHOaRNWmxew79/1/ZWCjppcRZ2Yh+SxK2cQKsVYZ/49zFZnINJs9d6y9qgGiGW9dDYyhztlCOAHYWS9lREP5g9Krgk2hBlj2F6jWz2qeYR9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712581994; c=relaxed/simple;
	bh=cws8BVNEPRn5vqjkb25rCS0YNKXfJAj1B9nMxiEmNto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUDTX8jjGPHpE4jWKHfllQlctnI/XsyEBT0/4nBABeY7z9aSqekpBlclOgsNPx6FXzVgxTtrut6Ze2vDg8NG4b4t49vfoHGXL2aWxRG6hS70MnIZiNpUxdFQmPP31O3mUMbKZcWDCENTNf6npK8mq7OlXJFh7BfNfcB6igTY5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SCRTpu2Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SCRTpu2Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712581991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ck6h7oGqY5cwfuLDZYTXRLzHj6mfJjTZhLoQldbd3c=;
	b=SCRTpu2ZDXw7jlcHr3c/dfsMxoKp1+Jjc7YDkIFkuk+UPx6cYA6t/f6NmFQyTdkVjUfalY
	No0N7uaCNQZIySb1bixosB6xB61yFnNGoA6VCKdJFk4PyNu6Js6osMF0Z8IA/9RgkzdgFO
	vPCTNOaak5ISiISHokmb6+d/pVmmjqI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158--ohfTBDWOoy5-aDRHOzwYA-1; Mon, 08 Apr 2024 09:13:08 -0400
X-MC-Unique: -ohfTBDWOoy5-aDRHOzwYA-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-78a6dd7a9e7so556341385a.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 06:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712581988; x=1713186788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ck6h7oGqY5cwfuLDZYTXRLzHj6mfJjTZhLoQldbd3c=;
        b=Hc5vReDRLikFLb8oPRj1/s5TmhLURPM/SmTd1C5vrDCbwKfjBk9RQKn/fHJwRxJSF8
         6utA+90cctzB7MvoFtXnIYUGJY6cmoh+jKM+8fjxlQiGGZUkcRoZPzGjJjCVSKVvF0vH
         ucevlV3xNmHb7xjdatu+cM0EICAWkhNHoeExKV1sWAFqrUbj78Dlojz6fv4m0I8pF9dc
         +4PzJFhavAVAaSr+W/SJiLhWDWsN71gUUtR5+pFoTzIMcGobQ0aPfaJbT67jtSqSx34x
         3zRSjUkKKO2hZA0qk6gEXcm18OWkU0QHo1BrAA6JXAif1Kja0GS+h4ADCdPuwLMOEve3
         tpcQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8k/DJD1xp1oeQ+mdcTHhtzn00kDabIJMV/wJQNPmt1WeeVSpBrC5gGpKzNSi256whhBsFp7YuF5/JjDE4//ftLHYulPKxuZ9E9OtWkBTNseEo+g==
X-Gm-Message-State: AOJu0Yxx9weWyxUD180sjlmzqa0hgB7ku1KSdQ3WQQjeUy/Vr9CvA+u3
	7fFkyvVHJ6ZeNnISKPql31qNNGdqkzOlU1DbPYsBd4nxlnnZ3pcJOA6lBlLS9qy0Eb6+yYkBYVd
	axIQjMr7/Tg8g1Mg0E9CKl3gDTxKI2y+01G7R7TUoWOkg+TYdcVvT1kt1FOKiDiCBBH1mIFk=
X-Received: by 2002:a05:620a:4d14:b0:78d:6b3d:9a34 with SMTP id wa20-20020a05620a4d1400b0078d6b3d9a34mr314385qkn.43.1712581987915;
        Mon, 08 Apr 2024 06:13:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaaNdf0+aehQaiEaOUOB91zwM2iwnImBi5etNoZRMALgRd/jitUy/yEBySE/LqXxJmVF3lrQ==
X-Received: by 2002:a05:620a:4d14:b0:78d:6b3d:9a34 with SMTP id wa20-20020a05620a4d1400b0078d6b3d9a34mr314361qkn.43.1712581987632;
        Mon, 08 Apr 2024 06:13:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y27-20020a05620a09db00b0078d623428c5sm1471784qky.88.2024.04.08.06.13.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 06:13:07 -0700 (PDT)
Message-ID: <3f49d41e-649d-4a07-9a1a-301a2f52613c@redhat.com>
Date: Mon, 8 Apr 2024 15:13:05 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] platform/x86: thinkpad_acpi: Support hotkey to
 disable trackpoint doubletap
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hmh@hmh.eng.br, dmitry.torokhov@gmail.com,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, vsankar@lenovo.com, peter.hutterer@redhat.com
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-5-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240324210817.192033-5-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/24/24 10:08 PM, Mark Pearson wrote:
> The hotkey combination FN+G can be used to disable the trackpoint
> doubletap feature on Windows.
> Add matching functionality for Linux.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 24 +++++++++++++++++-------
>  1 file changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 854ce971bde2..21756aa3d28d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -167,6 +167,7 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
>  	TP_HKEY_EV_PRIVACYGUARD_TOGGLE	= 0x130f, /* Toggle priv.guard on/off */
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
> +	TP_HKEY_EV_DOUBLETAP_TOGGLE	= 0x131c, /* Toggle trackpoint doubletap on/off */
>  	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile */
>  
>  	/* Reasons for waking up from S3/S4 */
> @@ -354,6 +355,7 @@ static struct {
>  	u32 hotkey_poll_active:1;
>  	u32 has_adaptive_kbd:1;
>  	u32 kbd_lang:1;
> +	u32 trackpoint_doubletap:1;
>  	struct quirk_entry *quirks;
>  } tp_features;
>  
> @@ -3598,6 +3600,9 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  
>  	hotkey_poll_setup_safe(true);
>  
> +	/* Enable doubletap by default */
> +	tp_features.trackpoint_doubletap = 1;
> +
>  	return 0;
>  }
>  
> @@ -3739,6 +3744,7 @@ static bool hotkey_notify_extended_hotkey(const u32 hkey)
>  	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
>  	case TP_HKEY_EV_AMT_TOGGLE:
>  	case TP_HKEY_EV_PROFILE_TOGGLE:
> +	case TP_HKEY_EV_DOUBLETAP_TOGGLE:
>  		tpacpi_driver_event(hkey);
>  		return true;
>  	}
> @@ -4092,13 +4098,15 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>  				send_acpi_ev = true;
>  				ignore_acpi_ev = false;
>  				known_ev = true;
> -				/* Send to user space */
> -				mutex_lock(&tpacpi_inputdev_send_mutex);
> -				input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 1);
> -				input_sync(tpacpi_inputdev);
> -				input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 0);
> -				input_sync(tpacpi_inputdev);
> -				mutex_unlock(&tpacpi_inputdev_send_mutex);
> +				if (tp_features.trackpoint_doubletap) {
> +					/* Send to user space */
> +					mutex_lock(&tpacpi_inputdev_send_mutex);
> +					input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 1);
> +					input_sync(tpacpi_inputdev);
> +					input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 0);
> +					input_sync(tpacpi_inputdev);
> +					mutex_unlock(&tpacpi_inputdev_send_mutex);
> +				}
>  				break;
>  			}
>  			fallthrough;	/* to default */

This chunk will need to change after incorporating my review comments into
patch 2/4. With that said this looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> @@ -11228,6 +11236,8 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>  		/* Notify user space the profile changed */
>  		platform_profile_notify();
>  	}
> +	if (hkey_event == TP_HKEY_EV_DOUBLETAP_TOGGLE)
> +		tp_features.trackpoint_doubletap = !tp_features.trackpoint_doubletap;
>  }
>  
>  static void hotkey_driver_event(const unsigned int scancode)

