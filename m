Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864014F86
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jan 2024 12:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QubxQ2GF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705322475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RN4+60YEcn4PqEDlBqzvGVSUMG+gaLHq8yCyKiNki8Q=;
	b=QubxQ2GFrgGzic+um9kMNOAXvjnyLFE9rRcASzRQlOKoB8Ye8GHpVx5hP9OvLrtPl15NQq
	pnjMjWUE+P8eHACggmMvANd6XUvdgXU2Fe6D6yOLtEx62CrgqFGPGigL5CfU9VS/toSAtF
	hvbLmGEII32Odzdg2wHUA+YaOEtyc2I=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-246-e0i9iKdpOeCXUlAEVYj4WQ-1; Mon, 15 Jan 2024 07:41:13 -0500
X-MC-Unique: e0i9iKdpOeCXUlAEVYj4WQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ccc7c01bd7so69826881fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jan 2024 04:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705322472; x=1705927272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RN4+60YEcn4PqEDlBqzvGVSUMG+gaLHq8yCyKiNki8Q=;
        b=LgrCrRqJvgRnA0aFF2FZdWiI0dg71uiZgOVjYxhr1k+5gOJrDQMBnju2tMPIBLk3N2
         9KwcNJGJmNjMw4Q4MmxvqSwx0s7VVrlvGhvzycEZe6rZmur7JkCBbkJCT0xclUaO4RrF
         1iSNKycVSvg2Jq2wajyO8RtuwKK4nrPPdRYsWPNO6pY7hUPSd1HcI3t4g85Bj7aqC93/
         eiMrSK9t/glne/CqCn2gg4omI4Ct2jQ2lvcivwkLVyM85jbPzIzDHa3vUk87kmtwT5vJ
         sXlCNRYpNvvg7kHySf6EzYK9SZS5gYbVkyGy7V1WhhkHCQUqlyfeSDPPL8Q3QvysDr26
         JfwA==
X-Gm-Message-State: AOJu0YzZgkfKwuKVcXZ8pUw+eCAmx6y8a4sJpyzlYcDMRdWgWiB0Bcwh
	DsdccswcyoaWrNz8LRNER4y/qzCcbAWwoAqN/ItAiNchb77IgWDEDTwvr19ohTBy/WLg8fN/Im1
	VY0OQLAqjhTWi3WGYSaof5/cemlD5hLBSTC323GHJAEqHzzS5Mg==
X-Received: by 2002:a05:651c:2db:b0:2cd:a311:6aec with SMTP id f27-20020a05651c02db00b002cda3116aecmr1663450ljo.21.1705322472108;
        Mon, 15 Jan 2024 04:41:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh6MV8S/jx25nu+KhW6rqjE6D8TB8SMynj16U5CkhQTGS1xGRgDM7SBJi6joRz0znwNa158w==
X-Received: by 2002:a05:651c:2db:b0:2cd:a311:6aec with SMTP id f27-20020a05651c02db00b002cda3116aecmr1663446ljo.21.1705322471809;
        Mon, 15 Jan 2024 04:41:11 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id n7-20020a056402434700b0055915dc8e74sm2574816edc.81.2024.01.15.04.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 04:41:11 -0800 (PST)
Message-ID: <fe0d8cc6-8217-4fa6-bf37-6ce76ae51192@redhat.com>
Date: Mon, 15 Jan 2024 13:41:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-wmi-sbl-fw-update: Fix function name
 in error message
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>, jithu.joseph@intel.com
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240106224126.13803-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240106224126.13803-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/6/24 23:41, Armin Wolf wrote:
> Since when the driver was converted to use the bus-based WMI
> interface, the old GUID-based WMI functions are not used anymore.
> Update the error message to avoid confusing users.
> 
> Compile-tested only.
> 
> Fixes: 75c487fcb69c ("platform/x86: intel-wmi-sbl-fw-update: Use bus-based WMI interface")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

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
>  drivers/platform/x86/intel/wmi/sbl-fw-update.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> index 9cf5ed0f8dc2..040153ad67c1 100644
> --- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> +++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> @@ -32,7 +32,7 @@ static int get_fwu_request(struct device *dev, u32 *out)
>  		return -ENODEV;
> 
>  	if (obj->type != ACPI_TYPE_INTEGER) {
> -		dev_warn(dev, "wmi_query_block returned invalid value\n");
> +		dev_warn(dev, "wmidev_block_query returned invalid value\n");
>  		kfree(obj);
>  		return -EINVAL;
>  	}
> @@ -55,7 +55,7 @@ static int set_fwu_request(struct device *dev, u32 in)
> 
>  	status = wmidev_block_set(to_wmi_device(dev), 0, &input);
>  	if (ACPI_FAILURE(status)) {
> -		dev_err(dev, "wmi_set_block failed\n");
> +		dev_err(dev, "wmidev_block_set failed\n");
>  		return -ENODEV;
>  	}
> 
> --
> 2.39.2
> 

