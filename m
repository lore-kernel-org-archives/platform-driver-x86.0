Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC1B629
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 08:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713256488; cv=none; b=X8Ajv0TjlTl7LHCtkdKEQoAdyVfkNgCylyGhMDaOLfPxXRULeejb8MVZOBkMR4sgxZbQXhig9Rl9crHBqd0X+kMx/RD5TyeH5i9QobQwkEb2o/rj1xli2D/DNu/gtQvFgVu8WdIlvvsSAzOq4ucnOQELsV1E3fXQDyjxSTnPhyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713256488; c=relaxed/simple;
	bh=qxXsroAJGpeEBKiHAHlPIyLqQG5T6UcMccyF6VW+7+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5Z/TlxW16yTPXk+/9q2Bb3zTeKxl+r1MS2gdU9QSFvN9WvuEdh0tP/v4W3Gwxs11Th2bmV6i28T4zeXOJ6gRkjOIr1ATZVaq2o+gXCdOZ1GTRHkw8bocimjkUjsOv2moIHdRf26lsCTm+71m0c8rmT5proHNa/DjXjXCbvGxFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I3r+K0ca; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I3r+K0ca"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713256485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/KHowR0qQFTJqDQyLsRAj+Hrplz2AfFo23h4u9OCXQ=;
	b=I3r+K0ca/OYQ/8GsxFV1mtJu4H9+T6byGds+jxYpEsplM2/sLR3lkE73/5y/VomkDPB7a3
	Nk6fqKzuPd1bz1pjaDG+nADVVKAwVcmHQZ6GwAscFrrOqD91tVYA+oYvcPe3tkyAI3VNHx
	ALfiYkI126pADNQuKEFSNbtk7jMCJlk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-367-YNy3d3n8OQuF5s7v2s0U9A-1; Tue, 16 Apr 2024 04:34:44 -0400
X-MC-Unique: YNy3d3n8OQuF5s7v2s0U9A-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a52539e4970so151823966b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 01:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713256483; x=1713861283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/KHowR0qQFTJqDQyLsRAj+Hrplz2AfFo23h4u9OCXQ=;
        b=f2hBOEG8MzJRXDzj7Wlq4jCD5bKfrf0wHhx8yRJIgY87d9iT9x6GKKchKZwLW41vRV
         0cAm3X1nH7Lj6vwt3J9JGuY7eFBttJbQTcVrlMh1jhA4FKqZcREKz2IYSuNqFUIG8Z0+
         uF0VKyCKJM7nhL0cqYdUo414eIGEY+Y4Y5qauWtjXkl9LLdyqEDBPp13MbASP5rlq6DC
         sZNqcPEg5P81BylwfEAKfkjwF7jBNktU2WiK7ISn/QPgg8iz+19AjGRnZhi1G3c8ZoBb
         TyLQ0Cuw1Hkk7u18eMG9fhl/wI/Ec6mGIzUikF8ekdPiAOc0LNOuMJXyzK3i/4rEcE13
         mrRg==
X-Forwarded-Encrypted: i=1; AJvYcCVKexn1qQtV5TWjbN0Kc2pfsh1kVPXUcOgwH/9IAmSIMQ0Fk+pojp+r5YVfi/DdXOv4WKlKe8iIS4z+LtNLqwrPCY0mW+WfGsxmRb8MM9gczuTdzQ==
X-Gm-Message-State: AOJu0Yyifp0RfQusNtjqF5LV7fhmgDMBkpnHbXw74OoMaoNx5CnGkRxl
	DaXFYH6bTa+GzM++gjGwmInl7g7cIyQz54ckYUtqZZuvY6HRcsRAstIJYzQFe9py7QViE4TyaPj
	zjNnbsemaVxk18SXkdtu99D9cE4if6vC5N+tELBSsyQVXyJtDZkyYpIMmY6qND2XEc3W6dOQ=
X-Received: by 2002:a50:8d50:0:b0:570:3b4:53ff with SMTP id t16-20020a508d50000000b0057003b453ffmr7123913edt.6.1713256483195;
        Tue, 16 Apr 2024 01:34:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/6d26QnVwnkQBKgmx3rDQlQYUhTRipXycXmB2M2tI88jb4hma0Pi8rrKc8VkIpGdCyslXrw==
X-Received: by 2002:a50:8d50:0:b0:570:3b4:53ff with SMTP id t16-20020a508d50000000b0057003b453ffmr7123897edt.6.1713256482874;
        Tue, 16 Apr 2024 01:34:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e14-20020a50fb8e000000b0056e2198192fsm5720330edq.92.2024.04.16.01.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 01:34:42 -0700 (PDT)
Message-ID: <ec9e0414-7a26-480c-84fe-0ab9208718b1@redhat.com>
Date: Tue, 16 Apr 2024 10:34:41 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] platform/x86/amd/pmc: Fix implicit declaration
 error on i386
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 andriy.shevchenko@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 Shyam-sundar.S-k@amd.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 platform-driver-x86@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20240416025312.731809-1-Basavaraj.Natikar@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240416025312.731809-1-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/16/24 4:53 AM, Basavaraj Natikar wrote:
> Add depended header file to fix error on i386 due to implicit declaration
> of function ‘writeq’.
> 
> Fixes: 2dc77993cb5e ("platform/x86/amd/pmc: Add AMD MP2 STB functionality")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404160320.QAHyZ0c3-lkp@intel.com/
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

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
>  drivers/platform/x86/amd/pmc/mp2_stb.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd/pmc/mp2_stb.c b/drivers/platform/x86/amd/pmc/mp2_stb.c
> index dfa55327e5f1..9775ddc1b27a 100644
> --- a/drivers/platform/x86/amd/pmc/mp2_stb.c
> +++ b/drivers/platform/x86/amd/pmc/mp2_stb.c
> @@ -11,6 +11,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/iopoll.h>
>  #include <linux/pci.h>
>  #include <linux/sizes.h>

