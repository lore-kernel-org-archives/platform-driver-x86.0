Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF3F2AD02
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 18:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725474689; cv=none; b=AEXbZIzpWIp3JYQbcc7nobT7s/ZT5mDVbom3IsaTuFdGMBaUf/8m6rjG12+zvJyIhH7OL8C/zZd8OEViDmaM9EuOte/GH+7KNtd6MIplYtc6IaZjDnuuQ9EmFI0WD56bFj2WYhieqqyxX5pjhgM+PjXgNkTK/TczT4R4yAsQcXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725474689; c=relaxed/simple;
	bh=dCFHjYy2rxPVoOVF6xozo8cBeg+hYhHg8U+lT0eESAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PdKr9CfJEzNWwc29oCOuyvaNGbmbLNXL/Y/fJ7yqkrFAkjgqQiLFlP9JUlWqF/9ggzNDAK9TVKQRcwufT040tuqSTaMPFFoZ1eBj+fimbtIcrR+/QQzuEzw0wSU2Xb8rVo0i2homemy8zKlYLZYVfo5UVeO7Lbzakavt6rTNa5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A+wB1e69; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A+wB1e69"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725474686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aRSp1v5PZIdxAQeHR9DcZAxUHCkfQs5kyuYnxD2c5HI=;
	b=A+wB1e69iJ2QnZW9YQoemqTV7BMvcROIS1zrTRSC6IJhVZ9SNm1Cj0a9uCB8TXLbvH+Yye
	IDEGlkCP1fY+VXCBn0whYoWZuJpiWDROM0H28mm8oO9wzWPEL7v+rwSY2hwerCg0oLJNr0
	i1d4ksV1vUh8aWAXCUOm3jTx4WmqHvk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-211-tTalXhZpMLq5SXyzGMHWGA-1; Wed, 04 Sep 2024 14:31:25 -0400
X-MC-Unique: tTalXhZpMLq5SXyzGMHWGA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a86884df270so505879466b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 11:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725474684; x=1726079484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aRSp1v5PZIdxAQeHR9DcZAxUHCkfQs5kyuYnxD2c5HI=;
        b=ZpDgXeKPEZtAdzmO193W8XXyGrZVwwm29w0cc3CU5g0yFMc8a0ldBYsXhTmH4Xirun
         +ujYlyPEaGLMEN3Bx1WuZ3LPQXSwQBFoYdwZYb2iOML1idCd66uisYGyqV1UPcBWPPEj
         JzNX/93H/V9N2Y1tLA1dCI3xEN9UFMyln8ERHkAMA0gASkUvh4uPEIIvYpJvWovlv5lV
         SB0e7Ce4WYEpUveKluPijfdR2mEUdG1R9iHZpa9qHnF5rW54tCmB0P73PaOKsoBV/WeY
         6l1SIagrKlZT6wiivsSirhjDJjq7lflpwnW8Ztl1991lJbpVhuEc2RzxVGoqQJCZH+2P
         59rw==
X-Forwarded-Encrypted: i=1; AJvYcCWbB0XJGGSTwV79THfh1WvPYvQJEALPbJOWbqO0xHMiW95poL8Jsds91biHanZKxFU2jGTh2C5lhtOg0carv0fYAMOB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/FMD90E39qDwARXSM7x6/nqq77RA0UZe1q74NlszMqLCzBVLL
	XTe5A4oerU1jAWAXEq8xNdO2daP/DomXhFeu3Dx7l/7rehPqqkfcGghLGx+g2dQE1t9ZRrU8VlL
	muv8mOX67AroZ14+Bcjqs8W33jS2xCjukIl8vKSg86puf2yW575IFv/r6pyhh4SDFzljrEdM=
X-Received: by 2002:a17:907:7e84:b0:a86:8953:e1fe with SMTP id a640c23a62f3a-a89d8849241mr883948166b.47.1725474683913;
        Wed, 04 Sep 2024 11:31:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsikd3mhZk9gwltRUrA+sywi3kpqEM45M7eSD6hruJJ+6cnxhPclwmJluFYskGKkTOx/tLyQ==
X-Received: by 2002:a17:907:7e84:b0:a86:8953:e1fe with SMTP id a640c23a62f3a-a89d8849241mr883944966b.47.1725474683332;
        Wed, 04 Sep 2024 11:31:23 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a620455d1sm22325966b.67.2024.09.04.11.31.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 11:31:22 -0700 (PDT)
Message-ID: <05d4e489-c081-4edb-b203-88701b135b74@redhat.com>
Date: Wed, 4 Sep 2024 20:31:22 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix uninitialized symbol
To: Matthias Fetzer <kontakt@matthias-fetzer.de>, hmh@hmh.eng.br,
 ilpo.jarvinen@linux.intel.com, ibm-acpi-devel@lists.sourceforge.net,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20240903172756.19235-1-kontakt@matthias-fetzer.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240903172756.19235-1-kontakt@matthias-fetzer.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/3/24 7:27 PM, Matthias Fetzer wrote:
> When the TPACPI_FAN_WR_ACPI_FANW branch is taken s stays uninitialized
> and would be later used in a debug print.
> 
> Since the registers are always set to the same two static values inside the
> branch s is initialized to 0.
> 
> Signed-off-by: Matthias Fetzer <kontakt@matthias-fetzer.de>

Thank you.

I've applied this with the following tags added to the commit message:

Fixes: 57d0557dfa49 ("platform/x86: thinkpad_acpi: Add Thinkpad Edge E531 fan support")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/platform-driver-x86/f99e558d-c62a-41eb-93b3-cf00c016d907@stanley.mountain/

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
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 8f7053920884..4c1b0553f872 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8318,7 +8318,7 @@ static int fan_set_level_safe(int level)
>  
>  static int fan_set_enable(void)
>  {
> -	u8 s;
> +	u8 s = 0;
>  	int rc;
>  
>  	if (!fan_control_allowed)

