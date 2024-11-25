Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BD8191F91
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732527608; cv=none; b=JJdftRm2Skwm/qr4Oh+6a7ocFxLxPVJ2R0c8srPWT4y/VgbK/jiIldIulUNNZ+oQLJjjq6S+cEsWkP3+1DPvck8n9/P1eKra1Z052xd8iEezAMfXiI5FhmPgH4XNR3e0u07BqziHoTSkwdKyXCa/CSrfqkk9PA+ODllYpSJvPGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732527608; c=relaxed/simple;
	bh=cOpE0c+LyUVWwbcDeKJBtPbzMortWcCvzht78xT5aFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNeywEZ3D9r8/j8t0ZAvzJLFLeEGKm/2Fo6OCTZ2EfFq9BD5WLsArZ00Je7ZxIK25ClrkyP63gyhSKf7ULYHRlv+PKLqFSDD1x5UZHqcZUEf+HQPr6w3ptax+3s9867Euigu5mk33OxB8aMql87uJh0qCLlhQ89uJnM+xWroKNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJ9P4MKl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJ9P4MKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732527605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eYb0srWcbDisGIXUS7s0SfGyL9DUOFJ4d9y9eJeg7jU=;
	b=PJ9P4MKlIYGezAbgCbAmwPIZgrSQCJ4DUpHvKJcqm5p1ibsSTMar8iqUfqIBxj95Ti4oGC
	F2N6Hd8OYXG4yGEbRCAPcwM0yXA8RgE+LBGdlopb+i0wl26WJ9C2MlyEud0MEcwcUSpKbG
	RmmuoxR0WpP65/O/XY8jMnz9eKos4Jk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213--xj7Y7DkMAymM-1V93ZO2w-1; Mon, 25 Nov 2024 04:40:01 -0500
X-MC-Unique: -xj7Y7DkMAymM-1V93ZO2w-1
X-Mimecast-MFC-AGG-ID: -xj7Y7DkMAymM-1V93ZO2w
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa5449e1d9cso127776666b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Nov 2024 01:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732527600; x=1733132400;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYb0srWcbDisGIXUS7s0SfGyL9DUOFJ4d9y9eJeg7jU=;
        b=kfXX7cF8RVoY276dZJoA168CLE7yShvdJhDwNTKfdJB50KxHiNKc3dZKq/5hV39ffb
         p2mtgRN/kKYLrPh7eEYmaf4FuRxED/FtWldieIhgeV3/GEhVLTaMb4Tl5S7INlfrOm5/
         dWcnHt+Dvp14FLpV97QDZfmg7QhHjU9twfH7Gp0PmCDi7eyXM5VR/0BIvAPUaA1q1Suy
         5CDXlSPvRIFDZlNgFVpH9pqWGhabE++2ngwBDF7o76uEjdZXmir4B+df7pgAjeGYb5Fs
         vUUe+oi+dhRBUb9PLroEnhXv6b0Trpssxs3/lnOcfKXEWXvwp6URhX6xom18MQ1U3Wa9
         i/uA==
X-Forwarded-Encrypted: i=1; AJvYcCWzQ+h3oMare8XTYlCbJUPDwF7eH9ZPGhOFT9Y2ZdEIx2q3OvK9Zsf0JUquPHHGWDBg08YnnRktEnWLrcL147s6fpHb@vger.kernel.org
X-Gm-Message-State: AOJu0YxJaz5aC/gKICBmhp7CtN2r6w4M1lMEEW5iqGU9XIfcrXXArqpm
	HkKQMXTtRPVyBNOOPIXExjWv9+2kKMrHrdLuaCwNUGif+B+cxF4/br7AF1ZF3RjdrWMDatTxa6v
	Z4k8dvZAgsHPO7k2GyNVU6JkY0flHAKb7v7HlKWDOeBTDjLokYxZoOzbTlP54IMkvfkbAMi8=
X-Gm-Gg: ASbGncti0lvgF7TFgpm3Nafbhtz145jl6dRns0T1B/9CgK6uPSsx046wzWWu7GJFk9t
	gU9E1VWlJ+PxnbhhF1XW2pcwkF+yV6ANDfRCCn1kZWzul1UBytM4SO5pDe7XNUYuxFuvy8B7etC
	aDqT4Gg7GUeRVkWOSrE13Kns+IH1Pki4X263ujloiqmWXuM0/HEh9c9dT1/xFzboM40z0A/crV7
	FSHPQCQjQpulGWs3tuClxIWTedbfRILbnktb27b/EH5i8B9m7niIqUjNaruIxN0H4e7mME2gY6O
	eaM8ArESciwseX5vzDdcvhHHuEb9ynR+bxY7pRPyy6/Gdzcr9PDBGzI7UXNf2A+F9JvJ7EDLd1S
	ca3Gaf6DxEr+bq+JbAhOxtUMp
X-Received: by 2002:a17:906:9c2:b0:aa5:297a:429f with SMTP id a640c23a62f3a-aa5297a431cmr756539566b.51.1732527600492;
        Mon, 25 Nov 2024 01:40:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGeiriE0b8Iux0eyUY22xZRptZbW/6+Lgi16hErdHIBckumrlRFBkkEPjGo8VVvQ/rPfvj7g==
X-Received: by 2002:a17:906:9c2:b0:aa5:297a:429f with SMTP id a640c23a62f3a-aa5297a431cmr756538166b.51.1732527600104;
        Mon, 25 Nov 2024 01:40:00 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2f044dsm439226266b.46.2024.11.25.01.39.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 01:39:59 -0800 (PST)
Message-ID: <13590dd6-1529-487c-842a-85b44c577811@redhat.com>
Date: Mon, 25 Nov 2024 10:39:59 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: Ignore return value when writing
 thermal policy
To: Armin Wolf <W_Armin@gmx.de>, auslands-kv@gmx.de,
 corentin.chary@gmail.com, luke@ljones.dev
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241124171941.29789-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241124171941.29789-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 24-Nov-24 6:19 PM, Armin Wolf wrote:
> On some machines like the ASUS Vivobook S14 writing the thermal policy
> returns the currently writen thermal policy instead of an error code.
> 
> Ignore the return code to avoid falsely returning an error when the
> thermal policy was written successfully.
> 
> Reported-by: auslands-kv@gmx.de
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219517
> Fixes: 2daa86e78c49 ("platform/x86: asus_wmi: Support throttle thermal policy")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/asus-wmi.c | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index ba8b6d028f9f..8bd187e8b47f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3696,7 +3696,6 @@ static int asus_wmi_custom_fan_curve_init(struct asus_wmi *asus)
>  /* Throttle thermal policy ****************************************************/
>  static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  {
> -	u32 retval;
>  	u8 value;
>  	int err;
> 
> @@ -3718,8 +3717,8 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  		value = asus->throttle_thermal_policy_mode;
>  	}
> 
> -	err = asus_wmi_set_devstate(asus->throttle_thermal_policy_dev,
> -				    value, &retval);
> +	/* Some machines do not return an error code as a result, so we ignore it */
> +	err = asus_wmi_set_devstate(asus->throttle_thermal_policy_dev, value, NULL);
> 
>  	sysfs_notify(&asus->platform_device->dev.kobj, NULL,
>  			"throttle_thermal_policy");
> @@ -3729,12 +3728,6 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  		return err;
>  	}
> 
> -	if (retval != 1) {
> -		pr_warn("Failed to set throttle thermal policy (retval): 0x%x\n",
> -			retval);
> -		return -EIO;
> -	}
> -
>  	/* Must set to disabled if mode is toggled */
>  	if (asus->cpu_fan_curve_available)
>  		asus->custom_fan_curves[FAN_CURVE_DEV_CPU].enabled = false;
> --
> 2.39.5
> 

