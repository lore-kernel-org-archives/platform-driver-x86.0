Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795618C020
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 10:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730715690; cv=none; b=qvTX5sFiCkKHOkomivgskz8uUiUhlt6tPZ4FwyxErNJHRRp7wKkDOrf8mmJDeOyW9Ab/8FnxrQid7eZ4vN5TE/QmsGPbQbo/17aL2WJcgcs2OaP3yUCxDdAJAriS+X0QqZxsHiCWm8dyu2JQtwgGasi8goUh9OJXwYL1q9IYBIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730715690; c=relaxed/simple;
	bh=UBuAZc7lvSOKWc2Aw39GtxyVFtirlrAc/LU3HRXj5oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kp9oX2Tbm7BHIpy+BywSokGuAdIN1BToeZCM8qo7okRJVsNvoixtKbpn6qRiND5P2XTw4B9vMKXZneHctWKLwExRywEIn1wsDBcBcJXhEuJTIgurtqzQYyB1TCtwiqgVx8C5Y5JpBDIoaEr+1uu8O2KxN1Nu3JSfUzyrQFHicMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OkwUSANE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OkwUSANE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730715686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LMKyM8xARU8YRllg8nXRblil1bB0Qh3JD/4vJ1jmHuw=;
	b=OkwUSANEjGKlB+BxFYwYIjx0HpL9G9pG04oyaRMKbvBsnwTs00Y+wQF7ZZRCruq9jQg2NB
	zxd8sTLRmAfjbmFRXRyBBbyEHajDL3L9JaxY18m+OPyPuUeekCVSdLzrnSu983ScWYlMZA
	yITQYWFVMG9x2Iei6Urac7NiRy/I05U=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-tKQgTseMMM6eXmA9HwMD9A-1; Mon, 04 Nov 2024 05:21:25 -0500
X-MC-Unique: tKQgTseMMM6eXmA9HwMD9A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a99fa9f0c25so302143866b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Nov 2024 02:21:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730715684; x=1731320484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMKyM8xARU8YRllg8nXRblil1bB0Qh3JD/4vJ1jmHuw=;
        b=SWLXbUBaO523bkt3a+p7+WSg9RsVsfIpmsvS9ONTQqtENJCeeTQBjJxwfqcI5zZDGq
         nDHdufexlK012XLhlCLEN4z2ce3t5wAZt//zmyohKHJ13pZe7upLdoE0zKsiGXxatRzo
         3NJmzeOuQK3odpc8QHRid4EjO0bQ1/Vvjf6dpcCCAilgIgQ3gTyRcPqc5EkiXmfUyj8S
         euk0b24Co9JfmfplF01BZnWgLDfOxu9Gz8hV/RsC8KGE2x6IggjO5OHSVFAmip5SWc8g
         5FcrPtrNYKZQBZ/Tq0RpxqnzzPf1S4cd+lPWcIJKMHGu2MAnGJAzK2tjawxxtV74aY0P
         an9g==
X-Forwarded-Encrypted: i=1; AJvYcCUJkW7+SpK0MCzC3FczJOdu5yPRcpiYw3aVfn4AjKmUhafPjnV7QaE4tOrTOvhvo2kJ5vQlQ8Ilbhdt0VDN16QQ4nln@vger.kernel.org
X-Gm-Message-State: AOJu0YxAK+ROITlyG867z9M996u5YnqJiTvKlhDYCR+13Cofg+mOyz+d
	IMddl4vkqa020zCton7LeTn9a4+NZeW5aUpB7qRAlW2dq/GE4KKZdt+Q6loy0wU+rKpUXqhSYah
	9EjwEExGqlXPzBI6GRKJNeubxBk+hq/7RMB0ZdaioEPuPRDIn0MsYcBYlWqEG4ElW4e+wIPc=
X-Received: by 2002:a17:907:9413:b0:a9a:1f8:6c9b with SMTP id a640c23a62f3a-a9de5fe7455mr3146036166b.37.1730715683870;
        Mon, 04 Nov 2024 02:21:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSpJBgMw284kSK39TlB/IgYOGucr7r+6e0rqpP0mMYv+K2nqmoPWz9yzmu4LKkr6r6pxWBAw==
X-Received: by 2002:a17:907:9413:b0:a9a:1f8:6c9b with SMTP id a640c23a62f3a-a9de5fe7455mr3146033366b.37.1730715683316;
        Mon, 04 Nov 2024 02:21:23 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e566812eesm533747666b.194.2024.11.04.02.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 02:21:22 -0800 (PST)
Message-ID: <91c96f4b-ad90-477e-83e6-5232b069af85@redhat.com>
Date: Mon, 4 Nov 2024 11:21:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86/amd/pmc: Detect when STB is not available
To: Corey Hickey <bugfood-ml@fatooh.org>,
 platform-driver-x86@vger.kernel.org,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20241025051141.924760-1-bugfood-ml@fatooh.org>
 <20241028180241.1341624-1-bugfood-ml@fatooh.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241028180241.1341624-1-bugfood-ml@fatooh.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 28-Oct-24 7:02 PM, Corey Hickey wrote:
> From: Corey Hickey <bugfood-c@fatooh.org>
> 
> Loading the amd_pmc module as:
> 
>     amd_pmc enable_stb=1
> 
> ...can result in the following messages in the kernel ring buffer:
> 
>     amd_pmc AMDI0009:00: SMU cmd failed. err: 0xff
>     ioremap on RAM at 0x0000000000000000 - 0x0000000000ffffff
>     WARNING: CPU: 10 PID: 2151 at arch/x86/mm/ioremap.c:217 __ioremap_caller+0x2cd/0x340
> 
> Further debugging reveals that this occurs when the requests for
> S2D_PHYS_ADDR_LOW and S2D_PHYS_ADDR_HIGH return a value of 0,
> indicating that the STB is inaccessible. To prevent the ioremap
> warning and provide clarity to the user, handle the invalid address
> and display an error message.
> 
> Link: https://lore.kernel.org/platform-driver-x86/c588ff5d-3e04-4549-9a86-284b9b4419ba@amd.com
> Fixes: 3d7d407dfb05 ("platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature")
> Acked-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/amd/pmc/pmc.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
> index bbb8edb62e00..5669f94c3d06 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -998,6 +998,11 @@ static int amd_pmc_s2d_init(struct amd_pmc_dev *dev)
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_LOW, &phys_addr_low, dev->s2d_msg_id, true);
>  	amd_pmc_send_cmd(dev, S2D_PHYS_ADDR_HIGH, &phys_addr_hi, dev->s2d_msg_id, true);
>  
> +	if (!phys_addr_hi && !phys_addr_low) {
> +		dev_err(dev->dev, "STB is not enabled on the system; disable enable_stb or contact system vendor\n");
> +		return -EINVAL;
> +	}
> +
>  	stb_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
>  
>  	/* Clear msg_port for other SMU operation */

