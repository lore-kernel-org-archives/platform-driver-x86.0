Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13C12E652
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708346714; cv=none; b=A6Kwjj3huAjEbd39Zu/6ce44KlcWHWhQjrtVM4ZxqA7DL5+w6v1Tpje/MjclvGshbM3e02NPf18YlJ+fqogxNoMBkgY/epj5rdTdhmSne+Odhbqhug7EZgUZ+PSDWPw1FKWiLfZJlWy7OcP2QYLtjLA7pZoEvsHmrCyyj99SxGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708346714; c=relaxed/simple;
	bh=pc3T/42JhMz8aKBzOmZF1zWZoySVvEaWB6269yJWCrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f9jI8vbRHiYWY6HcQi/wJrDNpyiHeIcKo0Xf1QjFfCKd8fgL97hTv92xG2M9zsJZiOsdDFCyOmtlLtuIf3YFFkwedc2vJMU3zJb/GcbVZ9yE2Ns8wvL3bZHaCwPMXru7rCZIEB2ut7wlq7yMxLxAcbVswuZU5huIVxxaGUo/cao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G7kGOA/g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G7kGOA/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708346711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/eE8uEDM4sAZt2wLuF0+kZfJYbZUs+rEeMw2o2KYwjk=;
	b=G7kGOA/gjYM8scBeJ2QeCxENb9giJXkLNt7SA8LF6mvaYFgc7AnNs4WaSek/PDhmm0b9Hu
	27btAURiVXzfYxmsoqbnLcf2SWGPsTVs7KBnP8LII1PnnqtohrdVELc2wO/yQj3MRMdXOb
	6mD0B1NJQhkCF1nwFncjGUpf/ZP68oI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-kVUWeHD6P1WEKOGPlBTCeg-1; Mon, 19 Feb 2024 07:45:09 -0500
X-MC-Unique: kVUWeHD6P1WEKOGPlBTCeg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a3d7b6e42b9so204337066b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 04:45:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708346708; x=1708951508;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/eE8uEDM4sAZt2wLuF0+kZfJYbZUs+rEeMw2o2KYwjk=;
        b=Fg38UgSUuSWj74mH4bCI+oqrltJr3DbWbrhkzN9ab0wwCZJPGRCVcwXN5e2bebstFs
         iX6dm9s0eypIQ1d8nQGqxFLn1mD+s0Fo1NrZJVZDhwxp9tW8CbTGB0kM7w8qUcnvbxQh
         B+DShI0T7n/uE2LS0hc2w/v3WRo35nVJIGwAXviqiE7PWBJEEosmqHhrI/x4u5zFXQ3I
         juN60iy/k532mqz4pYNjCNU38cACYCnoCk1WkTsw638J1xUaM/Wb41XHy66a+o6I1q56
         9NOnz0sVUiENW1m2O/CsSTfwsqqER4vl22sPiySp8Jr5djCFM98VW4HFlUk8CEhmlzmv
         blPA==
X-Forwarded-Encrypted: i=1; AJvYcCW81Da5tRF636RBfMtUayU68lbZVZzoxHGrfAXpa3JqHSnKRi7D9KgPoW5hVEAUMq598ZSDfz8upUeLMRtV5dBbjyIzhBHKX2zhXgITSG+U51OI+A==
X-Gm-Message-State: AOJu0YybrLJQmRzrJvUpSK+4UvQb2Q1FZ4dK6NYjAX1ChlM6QbfZOivb
	ZxWz1Hs5YZCfAQkJhATezbEbeP6CeLFCitJKPfCOnJA+LsWmJic10gnGuIuH/H7CWXcVMyDCs04
	gJVubse2NeGP8iW/slb32nV/1IXwDq65AvqkuysS0ptDsCa9mwKADjhMt/rzwlBz9xqJtUEU=
X-Received: by 2002:a17:906:407:b0:a3e:a3dc:45c9 with SMTP id d7-20020a170906040700b00a3ea3dc45c9mr1311536eja.72.1708346708675;
        Mon, 19 Feb 2024 04:45:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGCNQbU6oFkowRvLRnBAZSh6NexCEi/EiTxlmxZKjZORjsKDsGrLTPim24MihJlF6MhlhQMBQ==
X-Received: by 2002:a17:906:407:b0:a3e:a3dc:45c9 with SMTP id d7-20020a170906040700b00a3ea3dc45c9mr1311523eja.72.1708346708306;
        Mon, 19 Feb 2024 04:45:08 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id xo24-20020a170907bb9800b00a3ec3390eacsm456801ejc.126.2024.02.19.04.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:45:07 -0800 (PST)
Message-ID: <297e679c-a05e-4d02-bde4-53697ff9f4a7@redhat.com>
Date: Mon, 19 Feb 2024 13:45:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/hsmp: Add CONFIG_ACPI dependency
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, kernel test robot <lkp@intel.com>,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20240130073415.3391685-1-suma.hegde@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240130073415.3391685-1-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/30/24 08:34, Suma Hegde wrote:
> HSMP interface is only supported on x86 based AMD EPYC line of
> processors. Driver uses ACPI APIs, so make it dependent on CONFIG_ACPI.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202401281437.aus91srb-lkp@intel.com/
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

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
> Changes since v1:
> Correct the email id for Naveen Krishna Chatradhi and change it as
> Reviewed-by.
> 
>  drivers/platform/x86/amd/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/Kconfig b/drivers/platform/x86/amd/Kconfig
> index 54753213cc61..f88682d36447 100644
> --- a/drivers/platform/x86/amd/Kconfig
> +++ b/drivers/platform/x86/amd/Kconfig
> @@ -8,7 +8,7 @@ source "drivers/platform/x86/amd/pmc/Kconfig"
>  
>  config AMD_HSMP
>  	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64
> +	depends on AMD_NB && X86_64 && ACPI
>  	help
>  	  The driver provides a way for user space tools to monitor and manage
>  	  system management functionality on EPYC server CPUs from AMD.

