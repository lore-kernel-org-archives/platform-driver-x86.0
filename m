Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B551D3A1CB
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 13:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WULgJHAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702907997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Z08qTo4VHKqBvQdQYFQ7T86lFpxtYJXk00pxEYx2D4=;
	b=WULgJHAQdSa7GYK8cIkkyJEE54fAv28Js8sxsd4/QEDCiUDG8wp8rAUO/kn6Fxe2RkHwMD
	FaKoFUh9B7J9gkowAd5bybYZBvdi1u1LGrh2JJgQkrUSa9ohbOLB58vBKATafGQYN8Uy88
	Jv+eP/c/9maLAWpGmiSb1w2c7dU56uU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-ptA3Qe3BPg-Zi_FBvw12_A-1; Mon, 18 Dec 2023 08:59:56 -0500
X-MC-Unique: ptA3Qe3BPg-Zi_FBvw12_A-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-40c495a9c7cso25929585e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 05:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907995; x=1703512795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Z08qTo4VHKqBvQdQYFQ7T86lFpxtYJXk00pxEYx2D4=;
        b=pt4gjRdjHlee2m2OGfZCDHjE6IV5zlKunsxjKh8bzrD/NKoDVSDVzCCvYrB+PKKRsp
         FGaJTy1M2NOidrOEvnehtZePmzO7H7Jm4QJJdPEQXK0UHxLcHG3wo4PyIKKdfUmEL2Ys
         SOSjOvr1KW5pCFih2rhmTqnWIx6tM7i+krB3IHUdZWj8Z5Dlx+GCIn1ZLVRjtrls5drH
         UgyJX36nGLyZDY90g7mhu33x/Z7ujzu045H8/vKG+dOZHhWP47KIL7cx0pzJ4W6IvE4R
         ybUDi032xjJ6nRjaiepRCRO7MiyE6mWmZei9rCSMfK4ByRnt+hiHC5rfenGfa4oyPqZ4
         0CUg==
X-Gm-Message-State: AOJu0YzcSVJ7xUFQ0QfSV2Iwfg5TfpgkYAHrwNA8ndQyEh4Idw6ydMXN
	nDYZf6LMsSCPDxIkdXHMGOTGOcpFuzrdo39occy9d8ftE9lNcKoQIdTTk5t+2A+7UmC+NTc/UXU
	0qyK8JuzvhIyrGTclNHVG4GgoH8osOZAqxxe3pA3j4g==
X-Received: by 2002:a7b:c385:0:b0:40c:24e1:b6bb with SMTP id s5-20020a7bc385000000b0040c24e1b6bbmr8131729wmj.128.1702907995006;
        Mon, 18 Dec 2023 05:59:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcdBLo/fPLob8CR9UlEPNAiidKYcTuOaD1IcTPhjmqGj7oGakg4oZsc8hPpVkW4btXSQMQCQ==
X-Received: by 2002:a7b:c385:0:b0:40c:24e1:b6bb with SMTP id s5-20020a7bc385000000b0040c24e1b6bbmr8131722wmj.128.1702907994622;
        Mon, 18 Dec 2023 05:59:54 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cx7-20020a170907168700b009fc576e26e6sm14059747ejd.80.2023.12.18.05.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 05:59:54 -0800 (PST)
Message-ID: <011c6ff1-e9ce-400d-bc34-a08ce880f6e6@redhat.com>
Date: Mon, 18 Dec 2023 14:59:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] platform/x86: silicom-platform: Fix spelling
 mistake "platfomr" -> "platform"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Henry Shi <henryshi2018@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231215112746.13752-1-colin.i.king@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231215112746.13752-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/15/23 12:27, Colin Ian King wrote:
> There is a spelling mistake in a literal string. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/silicom-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/silicom-platform.c b/drivers/platform/x86/silicom-platform.c
> index 84b92b3f9f4b..6ce43ccb3112 100644
> --- a/drivers/platform/x86/silicom-platform.c
> +++ b/drivers/platform/x86/silicom-platform.c
> @@ -866,7 +866,7 @@ static int silicom_fan_control_read_labels(struct device *dev,
>  {
>  	switch (type) {
>  	case hwmon_fan:
> -		*str = "Silicom_platfomr: Fan Speed";
> +		*str = "Silicom_platform: Fan Speed";
>  		return 0;
>  	case hwmon_temp:
>  		*str = "Silicom_platform: Thermostat Sensor";

