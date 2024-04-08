Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBA17C6E9
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712581906; cv=none; b=o61tYvBBfztqTwvcyr/gkc/xDSKsQDzXHEPy2o9rB8hC3A6FlOHd2vni7SgC57EhEEwKyGK7VeQOqSvapPeQh4YAmil5RACociX2UCUoS1JOkKAt5vJZ6Kfz21opS6rSlqBgAy6tLJLN5VQmS9wfI0+s54KdrOOlyV/NhgBT78o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712581906; c=relaxed/simple;
	bh=jKN09l4ME8jxncm6SMzselLBpL1cK/PeEvCvqJYEKzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/7FeSlrN0fNoXi43bp0bnRmt/AAxHD631SOD2qQ9aQQhy2HoeS6lydGbfMLYujurOi+d7MjHcDQz35iILp37t/7xG0AvukyzFYxMsgGrmI1Ufw3iglQqMHscvu5g6vrCt5F7gAEXSSM1YNdY/zLbIJNwRuZ7aBjPyRD1j+7Yfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q+dzEral; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q+dzEral"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712581903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2QN/ohcVcXOcV74lBRkbnJ3+BIy7aYkesL60FOW5d0Y=;
	b=Q+dzEralDFDkJjpGBDMCy51I64bNo2VVlMHgu4m1kyOGZ2rnhXVKQpXdBCnvIXGrLF1enW
	ZBGLCjaBPzIiamBhNNk488qM+O2y8TrWBRBmtgeaA0bw2h9enxKZs0vb8Kh7xAqG6fum9U
	Y7ifVXztpYbcD2+qMUGt5jqevIU7ENI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-kQn5pzheNGa2paPzaEWmXg-1; Mon, 08 Apr 2024 09:11:42 -0400
X-MC-Unique: kQn5pzheNGa2paPzaEWmXg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a51c6085bf0so56794166b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 06:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712581901; x=1713186701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2QN/ohcVcXOcV74lBRkbnJ3+BIy7aYkesL60FOW5d0Y=;
        b=Vf1jV6LnePWxdBa/xydb8C1tFOqChJwVZ4ArTXwOM1pMd8f840MksHa/aezEkzsFW4
         2GXf/wZf1uMRyAZLx+UttYN0SsuL8ck1N8A3IxUd2tvkTvO072UYsCszMreXxwRYLPIu
         SUvDmqaYu+Fb1+FZn583uSUnlJhhK0s1CMai4vwJR3Hx953QpIm0TEnL0BrocSYWw2hH
         DysvxEQ08x2QAl6JDIkQ40JMsyJi8LCDS0A1PRwIX3QJIXuLQlWGs/aqjGw1FZL5r/ec
         upUpNN/a40cxcCq73xBZ7XzKVUYZSMR/V7h/iXj9V5g0bKwpaVUBMJZaxhPJ/4GyxTr5
         JqhA==
X-Forwarded-Encrypted: i=1; AJvYcCXArQHj1VKOsGrqZeVOxLxlaMnRRBVOjdvkmuqDwMajfGQXfHvYqtVN8M1DaLhZIS4kaKA5XMA2bdFr9evumncHPZ+zWV+yWFBwUPpq5bg5YwltoA==
X-Gm-Message-State: AOJu0YyUpozRkKmKXEyYdjXAOrKhon5FRunQHd6Ows68mYafaBnsEAj+
	XX6BIo3Ju/GPPIkqdhzkLZ/f7K9BFO5GhIKhFay2L63m6MiD0EQEghsqqzehktDBOSZJAPU9+Rl
	kAZyqIopJ7xOvEtmzPHl+qUwJUHAQQZUGemwOuaoRPvquVfwfLSXc3Mql1umctILKCktOBmQ=
X-Received: by 2002:a17:906:cb8c:b0:a51:a2ee:fab8 with SMTP id mf12-20020a170906cb8c00b00a51a2eefab8mr5351215ejb.36.1712581901316;
        Mon, 08 Apr 2024 06:11:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAbKJqhdIPQIyF0+AzW160f/4+tnJqeUF0J5A/eVZBJC9/Yp9ippvZKKTeSJyd/D6okdouDQ==
X-Received: by 2002:a17:906:cb8c:b0:a51:a2ee:fab8 with SMTP id mf12-20020a170906cb8c00b00a51a2eefab8mr5351197ejb.36.1712581900988;
        Mon, 08 Apr 2024 06:11:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bv4-20020a170907934400b00a51ce4710c5sm2010686ejc.19.2024.04.08.06.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 06:11:40 -0700 (PDT)
Message-ID: <a2237f76-dae6-4198-b393-7d0c18224205@redhat.com>
Date: Mon, 8 Apr 2024 15:11:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86: thinkpad_acpi: Support for system debug
 info hotkey
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hmh@hmh.eng.br, dmitry.torokhov@gmail.com,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, vsankar@lenovo.com, peter.hutterer@redhat.com
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-4-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240324210817.192033-4-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/24/24 10:08 PM, Mark Pearson wrote:
> New Lenovo platforms are adding the FN+N key to generate system debug
> details that support can use for collecting important details on any
> customer cases for Windows.
> Add the infrastructure so we can do the same on Linux by generating a
> SYS_DEBUG_INFO keycode to userspace.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 2bbb32c898e9..854ce971bde2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -1787,6 +1787,7 @@ enum {	/* hot key scan codes (derived from ACPI DSDT) */
>  	TP_ACPI_HOTKEYSCAN_NOTIFICATION_CENTER,
>  	TP_ACPI_HOTKEYSCAN_PICKUP_PHONE,
>  	TP_ACPI_HOTKEYSCAN_HANGUP_PHONE,
> +	TP_ACPI_HOTKEYSCAN_SYS_DEBUG_INFO = 81,
>  
>  	/* Hotkey keymap size */
>  	TPACPI_HOTKEY_MAP_LEN
> @@ -3337,6 +3338,9 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
>  		KEY_NOTIFICATION_CENTER,	/* Notification Center */
>  		KEY_PICKUP_PHONE,		/* Answer incoming call */
>  		KEY_HANGUP_PHONE,		/* Decline incoming call */
> +		KEY_UNKNOWN,			/* AMT Toggle (event), 0x31A */
> +		KEY_UNKNOWN, KEY_UNKNOWN,
> +		KEY_SYS_DEBUG_INFO,             /* System debug info, 0x31D */
>  		},
>  	};
>  

Looking at the next patch 0x131c is TP_HKEY_EV_DOUBLETAP_TOGGLE and 0x131a is
TP_HKEY_EV_AMT_TOGGLE based on this please change this to:

  		KEY_NOTIFICATION_CENTER,	/* Notification Center */
  		KEY_PICKUP_PHONE,		/* Answer incoming call */
  		KEY_HANGUP_PHONE,		/* Decline incoming call */
		KEY_UNKNOWN,			/* TP_HKEY_EV_AMT_TOGGLE handled in driver, 0x31a */
		KEY_UNKNOWN,			/* ?, 0X31b */
		KEY_UNKNOWN,			/* TP_HKEY_EV_DOUBLETAP_TOGGLE handled in driver, 0x31c */
		KEY_SYS_DEBUG_INFO,             /* System debug info, 0x31d */
		},

Regards,

Hans



