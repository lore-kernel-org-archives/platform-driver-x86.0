Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8171F3FC8
	for <platform-driver-x86@vger.kernel.org>; Fri, 11 Apr 2025 14:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382076; cv=none; b=cDgRoUq6i72S4HN54Rpn83yUSLiJny9rx9RvRpxSkRK6wQohjAqL1AhhGlnsC51SbX2Kdmue/b0Zo+pIfJYAjIpyytmbH+Dgd1NEI9nj7sNbFdwCGKkytLFaWQ1s3nGofqzK8JxbRLlFgm/sFl2F20GMs+4Vt5SjUnJB8PcASdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382076; c=relaxed/simple;
	bh=+JX5U0EjJREG9HSMHYCRyXVbgB+tK+mvxRwn25oBnj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFGbut+s7MYUvltmXwM6BYU3AcLM0LO2pbEdD8sWUGntOtrua7O3KRdbzLT1yEjDHtkls0n8bolQQYXaJGyqyKna4Wqs8RHs1uj86T3E1DNQcuAPMLKnp5c4wYyLGS1+HxYMNsh8Vd0psBIY/QC3uhBiWXgGH5efNTPHjiMYpW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mn67MesD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mn67MesD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744382073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vf0r7l4Ywoar8pkovwpvugRV/uWgMLgm0xBNpY+jCXE=;
	b=Mn67MesDyA3MiA4Z3EUZ1jJRKGew5hpf+UteXWX24xapmQ7Mzw7dbtguaOzJds4LNb1od3
	KQegwJpDKyepBqvPVc3h2xYOCBFdJZmCubR+0xCvU3sbz+RFfQKzjD5qbqG7gedcg7Y5lZ
	lmZbQJ0liSpxnoosMbend1GfmxIwApc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-O1WvukbaOhiO3dl9HpSG-w-1; Fri, 11 Apr 2025 10:34:31 -0400
X-MC-Unique: O1WvukbaOhiO3dl9HpSG-w-1
X-Mimecast-MFC-AGG-ID: O1WvukbaOhiO3dl9HpSG-w_1744382070
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac287f28514so183492366b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Apr 2025 07:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382070; x=1744986870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vf0r7l4Ywoar8pkovwpvugRV/uWgMLgm0xBNpY+jCXE=;
        b=omLq4HPR0aaT04PzVlI+uM8BNk3Ey1dH1hiooNM2546+ZEVjlUBlG/xG/zXQIqlBz9
         YEnscWUsynMsffFVBQLIaC29iwT+AWs912xWWEsjkU+vmxqBj48wZyYfJwchlB1RIHjQ
         IHZVjbTPVuiJQJz1T6AosaxhxUHDGclO6tdOIt+XpOW43wrWo+tUnuOQCwYMph86BDdz
         RdNQpMPXasW1a/dZF9CWjC+qm8PbwFzFTkD+eqHi1+7JXuy7WO96n0JRUaBoYftFq5Vd
         dsni+Kq9sOlI8thJbaGk/Fh0UfMA0b4/ODTAvY5BsDp27lybHyUHGfL6Ns0fnHvNGfoj
         /ADw==
X-Forwarded-Encrypted: i=1; AJvYcCV8N0VglTHD7wh1qKZi74lUQ0xPIxqII6OLLxeGCQNVeLqPp4NAwUMailYzvmiZchNwVF21e5SJY8al5ouuZlyGpo3v@vger.kernel.org
X-Gm-Message-State: AOJu0YzcY7nBuLl29gZM2jVXdo1mZbS8/dHMrw9q+tiuCObRG0do6Fsp
	iyD/dS5aT8ma5iHkZJ6gLkXkqL1Rw2NYj89FPPqqQGw5lwrZHCG6sO8tBfAw1/CHAJ+LNtbVig6
	N1z9jgS5oD8UP+FRA6B33DFRhDA4lZD7LlF26z0Hoc4uHeJ0Srf32aMRrvEJi0UGCncSCV0o=
X-Gm-Gg: ASbGncsrHlpIwPTEccrIWjwUp5RxF8jChcIhTKotlQQG82ziGK+F7QlvwnoBT22AqjY
	tsoaw7NTjmIsFPB3kafqgi89kdEGNZVRwpbTLoYja5gl1cQ2oQ/sp08qohMjZakFbv8yMk7meWU
	3WIDt0Y7xuXeG3RizDKJTS7R2KRxN4QOFSunx/UsFGxvMxNnZpV0BUZOyx6cUD0BH5RWHFAbPKl
	UYcl4zhyIuLHWxBWQhOCsDOlSWD9ssfXuaWkY3TgIwM9DkJz3LtNG+4K5QFEefZpmo0ahh3FJ7M
	A/LpkEleFkbcCijNSr6ew4RGnTrIZ+ZdXGAkPsH9W6rr1G2PbYfKrPrj7pgVYa7Zyno6fGajYS4
	/b8zuAK3vZIm5uVcP7KtMrzPya8V2dtsJI7zBXFISn71UFYf+w/oVi4LSjnnjiw==
X-Received: by 2002:a05:6402:350d:b0:5e4:be64:b562 with SMTP id 4fb4d7f45d1cf-5f36f525f8emr2157742a12.1.1744382070352;
        Fri, 11 Apr 2025 07:34:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsyMGRP3aENMWxFEhPPQZuAAVo/qXO98QCyQRyDjgRoGmFZl6CSgQGNG1R6VKsu1/p4Nf+hw==
X-Received: by 2002:a05:6402:350d:b0:5e4:be64:b562 with SMTP id 4fb4d7f45d1cf-5f36f525f8emr2157726a12.1.1744382069836;
        Fri, 11 Apr 2025 07:34:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f50567esm1070601a12.61.2025.04.11.07.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:34:29 -0700 (PDT)
Message-ID: <347b59ca-e655-4064-aefd-a8355d426962@redhat.com>
Date: Fri, 11 Apr 2025 16:34:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4] platform/x86: ideapad-laptop: added support for some
 new buttons
To: =?UTF-8?Q?Ga=C5=A1per_Nemgar?= <gasper.nemgar@gmail.com>,
 ikepanhc@gmail.com
Cc: ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250410212937.28772-1-gasper.nemgar@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250410212937.28772-1-gasper.nemgar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Gašper,

On 10-Apr-25 11:29 PM, Gašper Nemgar wrote:
> Added entries to unsuported wmi codes in ideapad_keymap[]
> and one check in wmi_nofify in order to get wmi code 0x13d to trigger platform_profile_cycle
> 
> Signed-off-by: Gašper Nemgar <gasper.nemgar@gmail.com>"
> ---
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
> index 17a09b778..72d3306ef 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -1294,6 +1294,16 @@ static const struct key_entry ideapad_keymap[] = {
>  	/* Specific to some newer models */
>  	{ KE_KEY,	0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
>  	{ KE_KEY,	0x3f | IDEAPAD_WMI_KEY, { KEY_RFKILL } },
> +	/* Star- (User Asignable Key) */
> +	{ KE_KEY,	0x44 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
> +	/* Eye */
> +	{ KE_KEY,	0x45 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
> +	/* Performance toggle also Fn+Q, handled inside ideapad_wmi_notify() */
> +	{ KE_IGNORE,	0x3d | IDEAPAD_WMI_KEY, { KEY_PROG4 } },

I missed that below there is a "if (priv->dytc)" conditional,
this means that it would still be good to send KEY_PROG4
when a keycode of 0x3d is received on laptops where
DYTC platform-profile support is lacking.

For v5, please change this back to KE_KEY so that KEY_PROG4 will
be send when the "if (priv->dytc)" check fails. Sorry about this.

Note please also address Alok's review remarks for version 5.

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
> +		/* performance button triggered by 0x3d  */
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

