Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE56F53D
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712581470; cv=none; b=UInZjwVcYMcQpdAtPavNfQ7q7sB5AA1RjejV/SqzzhXW/Sscn9RYya2OdP8vCTkgBf9aUPPWuOLR/iDpOQHBxGbLRvB10eQdCjeb2nOGcxrkvtmsOCLFWfJR5iDOBF3u3LZ7Xg7G+f8gsvCp7I/rawhcFBf3f6Bm/X3dyCaWjO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712581470; c=relaxed/simple;
	bh=yMYg0GAX8ig5QTjA2q7Q+0ralBaGGpY5ED1olsise54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMzqrdVtDNQsEnJDwZfH+Qe/edLq1I+4CLCjeG/8m2OTSoUXoLexxK2ks2UqqEqKEXHw2JwB0GGFPSVv4bHRWK8aFVG9hw1SDqo147GNn8FSNhXIx705Bt/193Fm6sdlZYrq1cYJVtXI3x7VFy2+rHrPVsRbK13GscSdyMLymn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NrBF0g0r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NrBF0g0r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712581467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eYsEbh/lFBGC7LmhffRxYV+mBnuUn8I4RfVy+AtiIJ0=;
	b=NrBF0g0rS9eGuRHaoJB/7DKtOCMqoXPlVbFm0FnFYvEKRG67f26rgu+6KXUNuocqoOmns4
	yIulvMeY1zoEBRSKO/B6esFjyxeX1ETOoZLcBNQit7sKHLT0CThs7SGhRIEFPiUI5H1R6G
	/ToCZY3ABmOwAGj7dxOiUFOjltf3wGM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-J3ebAa5XMiq0Kl3Gkxw6AQ-1; Mon, 08 Apr 2024 09:04:25 -0400
X-MC-Unique: J3ebAa5XMiq0Kl3Gkxw6AQ-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-516ddd6d66fso1459472e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 06:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712581463; x=1713186263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYsEbh/lFBGC7LmhffRxYV+mBnuUn8I4RfVy+AtiIJ0=;
        b=EwbWKS7czPgvgJZ/7EjgBaAMGPpLwo6hieKy3FhTpRv8aDBh+wlN+6FaoaRd7mZI0Z
         bB37mMRxi7RI7X7phGBtE/TMte4lMbSSA1SUlJZU3G+LkYj0/6O1Lz2H/etqAHSS6DXe
         5oLjzh3X7SK5BAZ1j/4epwx1gWgkogeCKobDlCcy7U3RCY+Jo/k/bedlkv0xY3Fu9AbR
         sgx6wKx//H/rciIM5qWHwq4w7llVt51hoSsyfGRmHfkXPKTgCtG6I6y4Xfif/TGSSZDY
         2u4nAT967bZZXkCpgvRzd7Zx45dRnbpZY1/cXspwV72si+Jl/zvYptoa190GBLCL3nod
         +4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+RfxK9Vjv2TuLeujcccgR/eOdpWLrjcTAQRR+0NVJzIE/z9QX47Q1kzpWPERg34wZvxCUl1zbEaSUAtKi6NRzkgMgGnIOSbCbjKtPNjDnIF7c5g==
X-Gm-Message-State: AOJu0Yx/RKz7NNmOo/whQ4+Q5RpUnCisRaxtwiOJyjic9ewSfWmOEuvr
	7u++tNENZoIJptNbFnCf3nRjCcd57ryMkiWFopH+GhZJw3kFquxrLapkdDnEwIPqzcTFsRYPD9d
	+w9SWGyrpy6s+hf71XgUWzYjyKAFdn7RSHTkeiBTF+YPx4XqrTCcfmCYHuhWeiQLASA25uBI=
X-Received: by 2002:a05:6512:285:b0:516:d18b:eaea with SMTP id j5-20020a056512028500b00516d18beaeamr5852672lfp.33.1712581463107;
        Mon, 08 Apr 2024 06:04:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVbN23MbRWpoFmVMF8qzJBUpAHXZlNsgr5ChUftbP9Us3ZW5wqEVHzzpFcU5atACDir8I7+g==
X-Received: by 2002:a05:6512:285:b0:516:d18b:eaea with SMTP id j5-20020a056512028500b00516d18beaeamr5852651lfp.33.1712581462739;
        Mon, 08 Apr 2024 06:04:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id di19-20020a056402319300b0056b7ed75a46sm4178873edb.27.2024.04.08.06.04.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 06:04:16 -0700 (PDT)
Message-ID: <e1ccf281-5c77-4447-a6c7-5b0b008c7c56@redhat.com>
Date: Mon, 8 Apr 2024 15:04:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86: thinkpad_acpi: Support for trackpoint
 doubletap
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: ilpo.jarvinen@linux.intel.com, hmh@hmh.eng.br, dmitry.torokhov@gmail.com,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 njoshi1@lenovo.com, vsankar@lenovo.com, peter.hutterer@redhat.com
References: <mpearson-lenovo@squebb.ca>
 <20240324210817.192033-1-mpearson-lenovo@squebb.ca>
 <20240324210817.192033-3-mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240324210817.192033-3-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mark,

On 3/24/24 10:07 PM, Mark Pearson wrote:
> Lenovo trackpoints are adding the ability to generate a doubletap event.
> This handles the doubletap event and sends the KEY_DOUBLECLICK event to
> userspace.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Vishnu Sankar <vsankar@lenovo.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 82429e59999d..2bbb32c898e9 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -232,6 +232,7 @@ enum tpacpi_hkey_event_t {
>  
>  	/* Misc */
>  	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
> +	TP_HKEY_EV_TRACKPOINT_DOUBLETAP = 0x8036, /* doubletap on Trackpoint*/
>  };
>  
>  /****************************************************************************
> @@ -4081,6 +4082,22 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
>  				break;
>  			}
>  			fallthrough;	/* to default */

This now no longer fallsthrough to default. IMHO the best thing to do
here is add a new preparation patch which initializes known_ev to false
inside the while before the switch-case (together with the send_acpi_ev
and ignore_acpi_ev init). and then change this fallthrough to a break
in the preparation patch. You can then also remove the default case
altogether in this prep patch.

> +		case 8:
> +			/* 0x8036: Trackpoint doubletaps */
> +			if (hkey == TP_HKEY_EV_TRACKPOINT_DOUBLETAP) {
> +				send_acpi_ev = true;
> +				ignore_acpi_ev = false;

These 2 values are set as the default above the switch-case, please
drop these 2 lines.

> +				known_ev = true;
> +				/* Send to user space */
> +				mutex_lock(&tpacpi_inputdev_send_mutex);
> +				input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 1);
> +				input_sync(tpacpi_inputdev);
> +				input_report_key(tpacpi_inputdev, KEY_DOUBLECLICK, 0);
> +				input_sync(tpacpi_inputdev);
> +				mutex_unlock(&tpacpi_inputdev_send_mutex);

This code duplicates tpacpi_input_send_key(), what you want to do here
is define a hotkey_keycode_map scancode range for new 0x8xxx codes like how this
was done when extended scancodes where added to deal with the new 0x13xx hotkey
event codes for the 2017+ models.

See commit 696c6523ec8f ("platform/x86: thinkpad_acpi: add mapping for new hotkeys")

Despite re-using tpacpi_input_send_key() there are 2 reasons why we want
scancodes for these new "keys".

1. By adding the keys to the hotkey_keycode_map they automatically
also get input_set_capability(tpacpi_inputdev, EV_KEY, hotkey_keycode_map[i]);
called on them advertising to userspace that tpacpi_inputdev can actually
generate these keypresses. Something which is currently lacking from your
patch. Related to this did you test this with evtest? I think that the input
core will suppress the events when you do not set the capability ?

2. This allows remapping scancodes to different KEY_foo values with hwdb
entries.

Regards,

Hans








> +				break;
> +			}
> +			fallthrough;	/* to default */
>  		default:
>  			known_ev = false;
>  		}

