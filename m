Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075612417F9
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 12:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744891287; cv=none; b=HYxhhDNUvfFNywUHfeb3rWqyx0AATc5U2gn2qMM0q173e4JZkAki+hNLA0JxrjKKJGkMlf9Dqv1w3S9M3SUXLnJgSJ180PiPCbWp+YCVNrPqfnVvAGCrVHq8UaY9Ws1cYjNngya6E1Z5czuq3a1xn5Uecs9TNHN5UyXahy7+NPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744891287; c=relaxed/simple;
	bh=q7I3/RpQmTN6MoNDGV1EavkWMU3XXdQLimSge7zDQMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c0+kpglk3y2Hrscdm6v01QAETlnW6KOK6KNyNnP53Z5P+PjM4X2pVWAtCGrYl78pnCZ/p2naovC5pWWqZCbpd2r3p5DmtOkJGWGtGbHbBIneAlq/gUlCsWcVB4EqMkKIAS2XhU1hYqUXweAq+5VVcEIU9SgABBauxvbLYoWarXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQbGfHJa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQbGfHJa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744891284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+qOPCjuavnB7ezWX43SKhkW55SVINpFnQWoZnioCFjQ=;
	b=KQbGfHJayS6lRhGcNF/wo1y/s2PkKJY7Jri2B4EJSM/W43NJ0U5AVdFTAY/QjRG8ulz5Pc
	mYKK64nfEA05LdjgREQRmI+shajFEOaWxn2SZ8quuk0z6NPix2iWIZG4P/Rh9zVJXSjFC+
	bxBsv/W/27xlrbiH2o6OA4aZm8mICsI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-S5lezKpjNUynqDOHZHYGEw-1; Thu, 17 Apr 2025 08:01:23 -0400
X-MC-Unique: S5lezKpjNUynqDOHZHYGEw-1
X-Mimecast-MFC-AGG-ID: S5lezKpjNUynqDOHZHYGEw_1744891282
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ab397fff5a3so70321566b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Apr 2025 05:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744891282; x=1745496082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+qOPCjuavnB7ezWX43SKhkW55SVINpFnQWoZnioCFjQ=;
        b=sqGeT8xI53RrSWeMmGKRyid4eGtVLp9MV2qQbq2ExAcPzI7s7n/Rl1P74dkYxU+PmO
         /Xqxs0w6n0ZlRvAnP3RdtC7SXVqjgiAW2b0ZUgtPn1c5TMUr88OPNlQVpwujwnl8+52v
         BPcReMCvu0vSypdaPrq71VM3FdVX/ndG00afmUK4kylxgE6+qD37AVwAr+IH8JK33+RK
         Tltsze/Wt1RJaD3Jo6kjEzUzVuUlamBMUc2rbIUpuUJcGr6ig7aqt3r+4xB78nc/JpL9
         e5QhCW7dSVcBr4mwXeFVKcgEWh1HSmuPHE4TmI+H6ucSn10VbAQoZf7FbNfuUQihEGR3
         +PkA==
X-Forwarded-Encrypted: i=1; AJvYcCWdRe3JEGEnNE1cvKnOd1wMi0F+I1WSB6JmGDGWHWRrK9ipMJ8IQ4zBewaX8gXktXJE2JtkhLmspSVxMmqQmuKWDeNA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3yBqsbpAfiRRxrbGiAr3pnhjMH3XeOBQMlpR3fFAzj3Xr9Eb
	0rhh7abhKU5NKK2ah7+E5BAL5iL7d9vUZ0XyRKo269zPWSGWOERE7HcMnkrdOrqoOdrGgfTM9f2
	C4Ld693mR6Ezqwstx6KbKDGbj7mWOWNyRFm3x/whHP/3x4OyabutUZCkBJvslrzDT6YnHzZo=
X-Gm-Gg: ASbGncuyCwBhPsshUeYXeJBZktMAqoCrKS6fChIndO5TRy+iIasZePvgU6HW1RobfH5
	cFgIJeGcwy9S6+VW4xK9Ce4rtvlJCgc3vx5LIcE6jA+IeGHlp2zZdQMF41tFm02NL1+RmswNbQ3
	lnpLcaliZXhmW8ezkDfa9a5M/0R5k8iQ8aSBGAWMKjX1iLoeFH4zS677X/2KqIqQHNccFAsbKut
	ZVKSi4RB71YfL8rsrWD9WyCwlu6j/o/vCTupbmGhnNM/g5ZvLrfPIz9xER6QL4T5NCa8uSJWlYJ
	EMgvlBgZXv4q3NqPx6A5i2u7/lhWHUEHX+xHH31yggYZ1vaE9WfmfYhUAb+18SV+rFnBwZTkX20
	DiGe/PB4ZZcviNijKvjkpBp9DGdfikmbfQKG33SF4QA5elRpxZFrRND4up9MGXQ==
X-Received: by 2002:a17:906:9f91:b0:acb:3acd:2845 with SMTP id a640c23a62f3a-acb5a6d2879mr215184966b.25.1744891280461;
        Thu, 17 Apr 2025 05:01:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCYG+OnjfWgFaSgXL5p8/4dv7JXzoaDKipsv68STYI5zQkFZ02diAwyfVQpcEHlXU5gm1yjQ==
X-Received: by 2002:a17:906:9f91:b0:acb:3acd:2845 with SMTP id a640c23a62f3a-acb5a6d2879mr215177766b.25.1744891279734;
        Thu, 17 Apr 2025 05:01:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdddda0sm282554566b.63.2025.04.17.05.01.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 05:01:19 -0700 (PDT)
Message-ID: <f5577099-d7f7-4f37-b84f-5a57d2e11e79@redhat.com>
Date: Thu, 17 Apr 2025 14:01:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv5] platform/x86: ideapad-laptop: added support for some
 new buttons
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
 ikepanhc@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250417113419.110856-1-gasper.nemgar@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250417113419.110856-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gašper,

On 17-Apr-25 1:34 PM, Gašper Nemgar wrote:
> Added entries to unsupported wmi codes in ideapad_keymap[]
> and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle
> 
> Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
> ---
> Changes in v5:
>  - Changed performance button to KE_KEY 
> Changes in v4:
>  - Changed performace button to KE_IGNORE
> Changes in v3:
>  - Minor changes
> Changes in v2:
>  - Added more codes that trigger with key combos (Fn+N, Fn+M, ...)
>  - Added performence toggle in wmi_notify()
> Changes in v1:
>  - Added codes for buttons on laptop(performance, star, ...)
> ---
>  drivers/platform/x86/ideapad-laptop.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 17a09b778..320ce9d2d 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] = {
>  	/* Specific to some newer models */
>  	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>  	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +	/* Star- (User Assignable Key) */
> +	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> +	/* Eye */
> +	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> +	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
> +	{ KE_IGNORE,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },

Almost there, you still forgot to change this KE_IGNORE back to KE_KEY,
also you forgot to bump the version to 6 for this v6 patch.

Regards,

Hans



> +	/* shift + prtsc */
> +	{ KE_KEY,   0x2d | IDEAPAD_WMI_KEY, { KEY_CUT } },
> +	{ KE_KEY,   0x29 | IDEAPAD_WMI_KEY, { KEY_TOUCHPAD_TOGGLE } },
> +	{ KE_KEY,   0x2a | IDEAPAD_WMI_KEY, { KEY_ROOT_MENU } },
>  
>  	{ KE_END },
>  };
> @@ -2080,6 +2090,14 @@ static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>  		dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
>  			data->integer.value);
>  
> +		/* performance button triggered by 0x3d */
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

