Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F4E1D86D6
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Apr 2025 07:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960702; cv=none; b=XvbkuwSNZ7t1K9xl6ExG6+CrASzS4vOvMq7hJ76crBHmfturVL2xUbK4LuzEr7MDhGGXqNejjW7R6TiVoNUSLlqZgyRkErto1a7UA/14TghJVrVBO4GE6bc+vQkvJicyRkXz7WffEf7BJ/hpUjsRLY19OQDLQYGOdlwhnr8vsaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960702; c=relaxed/simple;
	bh=UxxJbI70WFUZO2h44e3ERkdZpKJKIdNmQ8xjFJN5Aq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tx++Dx86a5OIL7KB7Q00jxXr3TjfS8iv345vzFCUfhm5mEzjky4FDWDZp0O0+QSJBYiSJCP0+hJI4zFMH2lBtpGbusIp2R0J2xcAH83BN6OaGnUIXL2EnJ0hjjihh8Gx65vL5EHwg3yt4ahnPnu6xsr4jnyFAb4MzcMuC5PIkQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CgbAIxTi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CgbAIxTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744960699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SBvOY+KIVYCWmz8ChQpOOnAPgtwHKhjsmW1X1/QP+K8=;
	b=CgbAIxTiQZNNirhaNzEyDZx98m3yH6tar/7HfzLo8nLRCuVuLzVNHyz9oaWS0u8nQsUAqg
	wROcYcTakITVCj+HCyXyxwoxHesU4c1uEgFTk1B0Rccr4rLvwyfR0S0jWiV4trYOP3CiRf
	bQxUbj2ynt3d/1Cw3nBI6qUIjL4EgtM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-Thyc5lFgPqKAo4bWWVDy-w-1; Fri, 18 Apr 2025 03:18:17 -0400
X-MC-Unique: Thyc5lFgPqKAo4bWWVDy-w-1
X-Mimecast-MFC-AGG-ID: Thyc5lFgPqKAo4bWWVDy-w_1744960696
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e5d9682f6eso1454981a12.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Apr 2025 00:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744960696; x=1745565496;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SBvOY+KIVYCWmz8ChQpOOnAPgtwHKhjsmW1X1/QP+K8=;
        b=VT30P86cl/yQWx0Rh0+5D3JYFrrtfQ+w7miMH0k9rP986LljOCTh6gpFJiI44Wrrb1
         sPM7cJBFqAZPh24jgn2MWkzlRPv4JA6qt/lxIUJlN9+pUKxS9SIqAPkCcq4tRt98SBX7
         TWi18/D5W4Dy32IhEif0E4Iv+cZSo14RHGeWBXTDobg/66fGBJ/PN8rat3louaRhsWEc
         Lh1JOeEptmmaNVRv4hl2+uKDWGVi/iLG4KvgrTdaRTaO3JFVkcymg/GcZ3X7Z1nOVE9H
         DgwM/o11yOXl55H7oAOZW/uziSN53DadZTFAjLeRJ6ZarV3aclx3OtUOvpc8UplIn0Vy
         84OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvhgbQ3ic50mHB+UCPqWuOR7LJO6S+smDuVDcQZIh2yykKbyw9SgpA3A56exqGYmdfDq9N4Si0Hl8PK6AozUKJnddQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZhEvC8BAYwWuVgP+veBctDcHFAqGFElXV9RbPlxJkSOYnASzD
	F1+AYHExDBzyARmWegKXEJoCr4Wyzc8++1cQS1v6+F0HgRXYKQezBECun8nlbxGGifROCoH/RA5
	OsuGfYZK3f86V0v5DrWE3M49hLITkybGbSwl+qzKQPLCcm0zoY7FVslMWEoBwsuA0McOTNkI=
X-Gm-Gg: ASbGncsTdRhdKAPkXjyzzAOUborEU1T6bS6aZbIUa2XYAUPbuhA6NGXc6NJ7Hlo3iPX
	9JdSBNH6G84UA88NhJsUyhILtgGTZgVrhP/WCBJ12qCnKfAKMZR5ZnbR5fFsa67rzJjIxEzzmEo
	dwz4shDuX0f92sKVpr1eCNP/qVfJEtkdLOVLXaBD7L/VE2ac3y7ye3sPMNup0XUjfvCsp/Txo+F
	iXY+YTHjTMjjT9NbYCBZqR1bXNTXYaMc2zVlS2PmOyPHJivGsbHGONLwKu6JOB34g447d7/E625
	i2slczdBPlcNYhTyjVU0oxijiRv5rQGRJ+Zzx26nl/CqNRGfkGGdEYwWoC+KO4iElYg/5xr1C63
	d1qaNAz06Aq9luoM+i7ce8kXhtt3HxoQVh3nUvkS09LhrkS80Q3R73R18q30dtA==
X-Received: by 2002:a17:907:868f:b0:ac7:33d0:db1 with SMTP id a640c23a62f3a-acb74b360cbmr157295766b.13.1744960696279;
        Fri, 18 Apr 2025 00:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtrkvjZyXXYQsQnfrUeZMnIU+8sJdRtJSwGgDibzeN+FprjKwSINxCeKLSZg8mXKUc2RXXIg==
X-Received: by 2002:a17:907:868f:b0:ac7:33d0:db1 with SMTP id a640c23a62f3a-acb74b360cbmr157292866b.13.1744960695878;
        Fri, 18 Apr 2025 00:18:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efadd68sm85263766b.185.2025.04.18.00.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 00:18:15 -0700 (PDT)
Message-ID: <1d6d1ff1-7290-4c41-8f2d-6fb07f8d7efb@redhat.com>
Date: Fri, 18 Apr 2025 09:18:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6] platform/x86: ideapad-laptop: added support for some
 new buttons
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
 ikepanhc@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250418070738.7171-1-gasper.nemgar@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250418070738.7171-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 18-Apr-25 9:07 AM, Gašper Nemgar wrote:
> Added entries to unsupported wmi codes in ideapad_keymap[]
> and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle
> 
> Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
> Changes in v6:
>  - Minor changes like typos
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
> index 17a09b778..532efb9d1 100644
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
> +	{ KE_KEY,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },
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

