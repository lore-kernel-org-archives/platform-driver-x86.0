Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123CA1CF87
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2023 15:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YECVzRNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703000998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NeCfUGBpqUtSZNjnibtvb8BtdlSt7X3JViDBCU6n/KM=;
	b=YECVzRNiCXgF/lzDt8IJLGZE/dbeUXaO5koNDeON+hd7gkSCXM1sLyQVFdNhChdDpidGPc
	ZM5LpWidM3hn2/iKUY7gKMzyPKfpe3UdI3n6/fotsp5FbaT+W5dcLirCxBpG5W4lkQTbcp
	kGpU4YzDGuJKc8nYuDfeKg24K8BBddY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-k3jDcmIINh-d5CLhCtG9Pw-1; Tue, 19 Dec 2023 10:49:56 -0500
X-MC-Unique: k3jDcmIINh-d5CLhCtG9Pw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-553728e5365so938610a12.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2023 07:49:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703000995; x=1703605795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeCfUGBpqUtSZNjnibtvb8BtdlSt7X3JViDBCU6n/KM=;
        b=hHbD/mo+8PLhB1+eTkZgm/pGamZ801pnJtsY2RxBHcNlKtN9jPRZEKlCa1MMIw15RY
         TPe2MyzlXbl9jCBkYsqYlKEgILIYfQv42IQhLHqLFRewu4eJkBKjryoi1zAmCiMuH/KU
         JKfQq+BvCW4tgFvIFcV73ZccF+kYHb0Ju+L++uf02RCxYKCAuwhApt1NMVkoCBV2uYtm
         /Q5N+TdPkP9hls8xFHCfqiZNiEjSINNQ8b/TnF6jNoMPksb3CupzjyW26NzGQZcA/J05
         +2ZzjQAw5dNSW1XgdH40TsNPVMH7CKQxwzzB+TssgT+1QmTxbqe1lwLc7KyYv97+rGB+
         z7iA==
X-Gm-Message-State: AOJu0YxwZE+oZ5BaYDmhFKzTM/V/uVDgg2I+ybRkrWrpvQA3YK7hPYiR
	y3boecZvELYr4nfjlt/1Nz7BVg7hyRnKQ0lb9UQnYAKAygRXuuflCPjKOiaKhmwxiE9/7CMxxi6
	nnUbefWNI1C2fUh5I5UH2/Lof/S/+A17LLQ==
X-Received: by 2002:a50:d788:0:b0:548:4b54:31ff with SMTP id w8-20020a50d788000000b005484b5431ffmr5291438edi.30.1703000995045;
        Tue, 19 Dec 2023 07:49:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjfvygGGKMVYh8/Gt2P23z4AP/xm5uq1LmDuou7vgyIncCGVllYSA6bQZQCGc9TFmlSyNDEg==
X-Received: by 2002:a50:d788:0:b0:548:4b54:31ff with SMTP id w8-20020a50d788000000b005484b5431ffmr5291430edi.30.1703000994709;
        Tue, 19 Dec 2023 07:49:54 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k13-20020a50cb8d000000b0054cc7a4dc4csm11551052edi.13.2023.12.19.07.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 07:49:54 -0800 (PST)
Message-ID: <ce6c3a2e-0500-4246-a331-17148622c886@redhat.com>
Date: Tue, 19 Dec 2023 16:49:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] platform/x86/intel/pmc: Fix in mtl_punit_pmt_init()
Content-Language: en-US, nl
To: rjingar <rajvi.jingar@linux.intel.com>, irenic.rajneesh@gmail.com,
 david.e.box@intel.com, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David E . Box" <david.e.box@linux.intel.com>
References: <20231219042216.2592029-1-rajvi.jingar@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231219042216.2592029-1-rajvi.jingar@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/19/23 05:22, rjingar wrote:
> From: Rajvi Jingar <rajvi.jingar@linux.intel.com>
> 
> pci_get_domain_bus_and_slot() increases the reference count on the pci
> device that is used to register the endpoint. In case of failure in
> registration, decrease reference count using pci_dev_put(pcidev) before
> returning.
> 
> Fixes: 6e7964855381 ("platform/x86/intel/pmc: Show Die C6 counter on Meteor Lake")
> Signed-off-by: Rajvi Jingar <rajvi.jingar@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans





> ---
>  drivers/platform/x86/intel/pmc/mtl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
> index 38c2f946ec23..fb59dffccf28 100644
> --- a/drivers/platform/x86/intel/pmc/mtl.c
> +++ b/drivers/platform/x86/intel/pmc/mtl.c
> @@ -985,6 +985,7 @@ static void mtl_punit_pmt_init(struct pmc_dev *pmcdev)
>  	}
>  
>  	ep = pmt_telem_find_and_register_endpoint(pcidev, MTL_PMT_DMU_GUID, 0);
> +	pci_dev_put(pcidev);
>  	if (IS_ERR(ep)) {
>  		dev_err(&pmcdev->pdev->dev,
>  			"pmc_core: couldn't get DMU telem endpoint, %ld\n",
> @@ -992,7 +993,6 @@ static void mtl_punit_pmt_init(struct pmc_dev *pmcdev)
>  		return;
>  	}
>  
> -	pci_dev_put(pcidev);
>  	pmcdev->punit_ep = ep;
>  
>  	pmcdev->has_die_c6 = true;

