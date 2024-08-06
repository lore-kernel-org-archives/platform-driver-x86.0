Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722CD166F21
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Aug 2024 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722937260; cv=none; b=DH6C4MRmQvTkHa3Hf1xdg1KFUsHgs1XpLNgvaM8mUN76VpklUx6QPJQThCRB3fMYvbloveJLyoDtrPtz7/wNrMjgrxRlpXxMK7hSmy3ARiuNlaX4W93MpNfU42WBTvRle/sbtYKxLT+bYfsB6GGx3+d73cA2RZ2jyk/zCYplGlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722937260; c=relaxed/simple;
	bh=aYqDvoRDf3JMHhB71lW27cCe/hn8Rs9fJHHNmSZv8NA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7e/nz32CLAneKwwhBAn+py3Vt/iSsLjSVIVTtmnP1LZrkPgeO4ce5CxdMfCV6wuXPfdbxnIFdvJP7lLfAe9uyd8M8M9FlNEPX0qC6PLnquLBLN5ZxFkPWMkR9O0YoOvLpd1qLoUCTmWh4hzk8rjBojDe4O05Aqlc8+GZ7RO2b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AXVzTkNX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AXVzTkNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722937258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4sH0fBYcEAsNCLPYwHilfAXVbxQ9T0LtTAmwUlVDpSk=;
	b=AXVzTkNXuP69qjvxMdXEfJOi96CiZLHuu9gm8J1S9pieLccvk+m1XSyDK25niv408971Pg
	R7jou7Zd09Qz2T/JMXsThMoQCa/FB8VU2Lj/VvSbOGdtatWXEa12MELJuR0gxrfaiVmdew
	7eTp/Fpj+bxIohPKOS5r6B7MCuoub0s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-BZXmTTqaNwy4ye5I2aiNow-1; Tue, 06 Aug 2024 05:40:57 -0400
X-MC-Unique: BZXmTTqaNwy4ye5I2aiNow-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a77f0eca75bso49343066b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Aug 2024 02:40:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722937256; x=1723542056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4sH0fBYcEAsNCLPYwHilfAXVbxQ9T0LtTAmwUlVDpSk=;
        b=M6P4UZdDNby7exqLx/rCnOaQ+fVv2pd7wEtBaD9oiVQ5xjziwyGPhi3XYJZ5717VVm
         3QNjUDB1eCGQvjeHaLY0tyVZoUL4q85up/FkQQjec8SSrx18Fo4WiVVIrV/HlGYb2spa
         8BEvzLfEbiSLWzapGaSmyz9NrfgrroBvxYsJHj/SBDElRxmnHevHYQK6c0TUC0gG0ew0
         DfW7bZ8v1aVmNpyXMv4DRCHLfs4Hg0UBoTAeRd+3BgmsblI5XsarqgI00mpyZguXbgx1
         zeNHlh6xdhRA4OCCjVH1Nz2nIpKx/lpRCJsAjm33qWiQwgaVrzbwPR67ohgAD+b9EgOD
         V4yQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTgCSC3pXWODA9RdQHGSkhUU6Ilu1DLHrcTUrcIQ9jyFOplyH7sRmyR/HNuNLaH2xo+IONaLe/c2mn4HINq5i0eZmWQWDNMt6pl6P1did0Q7zleQ==
X-Gm-Message-State: AOJu0YxB7PW7tGSELY14g8Z+Q/6Uzi8Jr4PJQnUAI8r3PFYTzA4QdX1C
	1VB0xsIWyWuqgvi8licbeItC42RRNyYKjLeFn3Ig8AM0g7PwkaVeGUmESXT/Nq2Xeyeg3o4zbPF
	yYCg/mOBLf0qMCVK5AUKISOYdqzjEWqCfGgK5tWlq5zWtFzTDCzYBGADcPgldBtcYsIQZjAitjz
	AwbW0=
X-Received: by 2002:a17:906:7956:b0:a7d:48e3:4117 with SMTP id a640c23a62f3a-a7dc518febbmr1078836766b.68.1722937255608;
        Tue, 06 Aug 2024 02:40:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ4vqsfgihejS6Eyz1CA5H5YmIQyoyLuL/W83qs6hOkpfbll5bE6UOZ182BaMjIPOSgaczJw==
X-Received: by 2002:a17:906:7956:b0:a7d:48e3:4117 with SMTP id a640c23a62f3a-a7dc518febbmr1078834766b.68.1722937255187;
        Tue, 06 Aug 2024 02:40:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e83e93sm525913066b.166.2024.08.06.02.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 02:40:54 -0700 (PDT)
Message-ID: <53e1e46c-b75e-4f64-bd7d-c56cad1981e8@redhat.com>
Date: Tue, 6 Aug 2024 11:40:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: asus-wmi: don't fail if platform_profile
 already registered
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 corentin.chary@gmail.com
References: <20240805235808.40944-1-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240805235808.40944-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Luke,

On 8/6/24 1:58 AM, Luke D. Jones wrote:
> On some newer laptops it appears that an AMD driver can register a
> platform_profile handler. If this happens then the asus_wmi driver would
> error with -EEXIST when trying to register its own handler leaving the
> user with a possibly unusable system - this is especially true for
> laptops with an MCU that emit a stream of HID packets, some of which can
> be misinterpreted as shutdown signals.
> 
> We can safely continue loading the driver instead of bombing out.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index cc5dc296fb2d..2fdfa84f7efb 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3897,8 +3897,13 @@ static int platform_profile_setup(struct asus_wmi *asus)
>  		asus->platform_profile_handler.choices);
>  
>  	err = platform_profile_register(&asus->platform_profile_handler);
> -	if (err)
> +	if (err == -EEXIST) {
> +		pr_warn("A platform_profile handler is already registered, this may be a driver conflict.\n");
> +		return 0;
> +	} else if (err) {
> +		pr_err("Failed to register platform_profile: %d\n", err);
>  		return err;
> +	}
>  
>  	asus->platform_profile_support = true;
>  	return 0;
> @@ -4773,7 +4778,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  		goto fail_fan_boost_mode;
>  
>  	err = platform_profile_setup(asus);
> -	if (err)
> +	if (err && err != -EEXIST)
>  		goto fail_platform_profile_setup;

Since you already do "return 0" on EEXIST in platform_profile_setup() there
is no need for this part of the patch.

Regards,

Hans



>  
>  	err = asus_wmi_sysfs_init(asus->platform_device);

