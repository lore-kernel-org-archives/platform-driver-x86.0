Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC19A1FECD1
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 11:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173756; cv=none; b=rOYTSQumhWd5AUZ0kgDaqPMun1tL2MwCLNTefgaoti25CcYQ29dTwng1iRX6gll3Uk7JoinQWzYv6crNi7pqq1sxDZZ66IhNbonmew8e/O4bXJu2oUxe76mBz1vtTOxqOgfoi8DBEsXjgZB/9v1GpRxshicCUHt78sNN7c19YMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173756; c=relaxed/simple;
	bh=/+L0wAOKozUodZ9tTzm3767cEww8MplolxX07nvX9VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Uy0VFu3aodLbhH9glgyXK0t+muoWqn08rCZmwK/i3LGgbtsgHJn7YgFQpmKNwoA3wOe8wU7E16an4AuPs06N9wcEGyRk3JPa0LvN1OC/HgqO54M3reZExmVvOsB1KC76vSt20BYfxgkX97ngGEY5AF+GPf6R9rcRCieXTZGD7Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WMSTyuZm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WMSTyuZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741173753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r0gZVE/AeQPIxGT3xE3l9BJh5bFLtI7lvrK9jIYDx2s=;
	b=WMSTyuZmkSbr49raXMQpFUJ21MH7Nr1jxB4IRUIs8jZsofUzaLj4VBpUp//bdxZ0O51Y9p
	9PCJdUyfI/kwvZEUZ+Ddsjy3NWXlPtUvxznUns810zJr9AR7sY5eEFv+iNXhbzsaHtIQes
	IkU1GnO/Viq586S9lsgXVloLUbHvEi0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-qM5ddXZANU2jTATic74I1g-1; Wed, 05 Mar 2025 06:22:32 -0500
X-MC-Unique: qM5ddXZANU2jTATic74I1g-1
X-Mimecast-MFC-AGG-ID: qM5ddXZANU2jTATic74I1g_1741173751
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac1ea5c94adso273897966b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Mar 2025 03:22:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173751; x=1741778551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0gZVE/AeQPIxGT3xE3l9BJh5bFLtI7lvrK9jIYDx2s=;
        b=TXd82gEotfQGEQagQ2sn3xLqeEDzkuPRtdlLCTpPg7DsDlnwOhhM3jZ5kRfDWS0NBP
         +eJK1CTuCuphG8pHC2ndX6IB9J/Z+42XV6Be9Jifa/i6n7KH31H0Of64OLYi5hYRJyTW
         +YRsfaQ6FKJo+q/wpShjteMK9NRhuuySt5n20fteJwVFRCzFfFrItnMtekeyE3OgDKK+
         LWHzIV2i7hqls/CIxlvEH2xwsxqGk3TPXB6ysuLJwq1ggak+iVN05alFARXaJ3yJ8Z8R
         86nY8jJjrvlItJU53sCnWcyCyzH5S/ozgv3h5Bbi9X9WT3eXuVN+bhg0q8oEvbvmUIwi
         ZNkA==
X-Forwarded-Encrypted: i=1; AJvYcCXR2RdUyLeJIVklyayjxrPDpeYpenh5Rk3dBuU5iQVpMSjqUDh919iHb5T19QO/s5N9sJ6ePLAcJfKmS9q47AaReU+q@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8X39EHJRmPdVRR6/+1ZRi4nVjB7+I+JVjAW1fp6wkH2fNZ94b
	AU/DeVLMktwv3LUg/Nfbc5V+0dgIqGlYh6/ESmXm7xUdJgeoM2k9T1HV6cBAfOJhDrfzsvqLJFh
	lsBlhlp7ebss6lM/AAghzt21emGo7U9VSB4dqYz7pvlz2efvUowE6lk0+vC8Lkp870kZZDLIhKf
	WW7CE=
X-Gm-Gg: ASbGncsvQj1YqBr93C67JoIVHC+pt/LFw9A31hcZub+IFXNrzbEHjPA15UtmXQZLfUS
	Hopqo5uGOVmfQVTXRa32lBaVXSOUS0IM6TE1ZDVQELuqH1wrsAlA0K2PJajOKZwu2AzGhnr/B45
	Atrnlo3OLiojod0+epuVxXBYMj3xwr3nDsFwhbfLwr+Oi+2CsQFnI0+N+IWqGDNgLHhJG1SWTCS
	LiM+oNNpRBpRUOUfop7OlFnsR5+xi3FbzRXenSega1QvCaLvPYk/mciIHct1MFqP+5iwItN1Gy9
	BJMuPpy4iBoxAr9ZJWfwoVBP8knTa5iK2pjquSaIwCUbczonF0qLZuVlasnAmofM2/5qfVlvEPr
	OFcZy8xGrGVg54qu7hc1JdRv26d/1AT39nh7T5gLa8upRY9DsVPwfYlPefq0visOm6g==
X-Received: by 2002:a17:907:c283:b0:abf:67de:2f21 with SMTP id a640c23a62f3a-ac20d9f39bamr225421666b.22.1741173750835;
        Wed, 05 Mar 2025 03:22:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEwTypJN88Dnlriv+HlSev8Xp7KW80Pj6JYPkkT/a/MYDOAa511GjrMO140U8EH2tn8E3w1g==
X-Received: by 2002:a17:907:c283:b0:abf:67de:2f21 with SMTP id a640c23a62f3a-ac20d9f39bamr225419766b.22.1741173750414;
        Wed, 05 Mar 2025 03:22:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0b9956sm1131748466b.16.2025.03.05.03.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 03:22:29 -0800 (PST)
Message-ID: <ecb132a7-40e9-4f31-9a03-4abcd6d0b1a1@redhat.com>
Date: Wed, 5 Mar 2025 12:22:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: dell-uart-backlight: Make
 dell_uart_bl_serdev_driver static
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250304160639.4295-1-ilpo.jarvinen@linux.intel.com>
 <20250304160639.4295-2-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250304160639.4295-2-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On 4-Mar-25 5:06 PM, Ilpo Järvinen wrote:
> Sparse reports:
> 
> dell-uart-backlight.c:328:29: warning: symbol
> 'dell_uart_bl_serdev_driver' was not declared. Should it be static?
> 
> Fix it by making the symbol static.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  drivers/platform/x86/dell/dell-uart-backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
> index 50002ef13d5d..8f868f845350 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -325,7 +325,7 @@ static int dell_uart_bl_serdev_probe(struct serdev_device *serdev)
>  	return PTR_ERR_OR_ZERO(dell_bl->bl);
>  }
>  
> -struct serdev_device_driver dell_uart_bl_serdev_driver = {
> +static struct serdev_device_driver dell_uart_bl_serdev_driver = {
>  	.probe = dell_uart_bl_serdev_probe,
>  	.driver = {
>  		.name = KBUILD_MODNAME,

