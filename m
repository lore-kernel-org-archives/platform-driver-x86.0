Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94EFFC0A
	for <platform-driver-x86@vger.kernel.org>; Tue,  2 Jan 2024 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SijWjnbw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704198300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u8Q/H5j5Lwchf7COe52r0epRoB65ZeKVWfFb4Y2HcpU=;
	b=SijWjnbw0+bqQ7cMWOzYfYMAVxxdmo6/pMmyv/ASg6L+7J9soalHDLoE7JOtXhT2ps1sgo
	18uhcgr0EjBEUzsO38xyOhcAzU0CYVVSLlAYC+ymSnLub2bzBCbvPlepFXxdqmgxxY+wXJ
	xJNiPVdvCdXPH99pekbRvh+OKzrgGbs=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-geMyE_LIOMGV3QqQOAKK4A-1; Tue, 02 Jan 2024 07:24:59 -0500
X-MC-Unique: geMyE_LIOMGV3QqQOAKK4A-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2cd09301673so6657911fa.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jan 2024 04:24:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704198297; x=1704803097;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8Q/H5j5Lwchf7COe52r0epRoB65ZeKVWfFb4Y2HcpU=;
        b=EzvSMhoq3oy6j/Qij2RSgSLx69U9cC9oUoIL+MCBFXe5BZYPaDEVVklr8U9QINV54/
         dnXCTy3x2Z4xT+NKzggBHncqvU0G9qmSrQnZCt8UXiIQHHApfAF2zvXLwq7uGPupchOZ
         FFTXYgujxaTIfvXkwh8GG42PL+OZZT7XXz+J34IFWje3pk0EXg22iHJUMG6AVdoR0tkK
         9BkoG8McIyKLwwTa53TfviQXos8bOQ/rDzOq4eaO3YCc4587Fij8sn01HBGb+9qL9T5D
         ccPmkCsTnTknftZE5OvIMNmR/M9b5W4Lo52buUtMSfNTwwhnaVQ6LL07uC2kUtflAEIc
         bKKg==
X-Gm-Message-State: AOJu0Yzj0Gk17q5QjYXy7AXsOwI0nuNEt+YZYuQlJFa3c25erruzHgIq
	hgLLmJ+o2JBZIncrk4P8yDI2+eNjKHvSa5t5SErMboux6Jm6nXxZ87MpJTLdYGgQRdw2FOzVI1Z
	N5mdE6hBE4mSoXQjAq06hkbt2vV9+3M7I0ZR32/FfJA==
X-Received: by 2002:a2e:b894:0:b0:2cc:e878:43db with SMTP id r20-20020a2eb894000000b002cce87843dbmr3981661ljp.62.1704198297760;
        Tue, 02 Jan 2024 04:24:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi5EJ/K95BWnL3W0ozAignv8PmEqsCUmC2xj78+7q5lh6tLSOY5PwL+hCIxFE8OmtU27ZVqw==
X-Received: by 2002:a2e:b894:0:b0:2cc:e878:43db with SMTP id r20-20020a2eb894000000b002cce87843dbmr3981657ljp.62.1704198297449;
        Tue, 02 Jan 2024 04:24:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ez9-20020a056402450900b0055504002a5fsm9824333edb.72.2024.01.02.04.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:24:56 -0800 (PST)
Message-ID: <6d80562e-167e-45f0-a2be-07e00544d87e@redhat.com>
Date: Tue, 2 Jan 2024 13:24:56 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] platform/x86/intel/pmc: Add missing extern
Content-Language: en-US, nl
To: "David E. Box" <david.e.box@linux.intel.com>,
 ilpo.jarvinen@linux.intel.com, rajvi.jingar@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231223032548.1680738-1-david.e.box@linux.intel.com>
 <20231223032548.1680738-9-david.e.box@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223032548.1680738-9-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 04:25, David E. Box wrote:
> Add missing extern for tgl_h_reg_map. Fixes sparse warning:
> 
>   drivers/platform/x86/intel/pmc/tgl.c:213:26: warning: symbol 'tgl_h_reg_map' was not declared. Should it be static?
> 
> Fixes: 544f7b7f651c ("platform/x86/intel/pmc: Add regmap for Tiger Lake H PCH")
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

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
>  drivers/platform/x86/intel/pmc/core.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index ce7b1cd2b194..2a797fccf5e6 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -452,6 +452,7 @@ extern const struct pmc_bit_map tgl_vnn_misc_status_map[];
>  extern const struct pmc_bit_map tgl_signal_status_map[];
>  extern const struct pmc_bit_map *tgl_lpm_maps[];
>  extern const struct pmc_reg_map tgl_reg_map;
> +extern const struct pmc_reg_map tgl_h_reg_map;
>  extern const struct pmc_bit_map adl_pfear_map[];
>  extern const struct pmc_bit_map *ext_adl_pfear_map[];
>  extern const struct pmc_bit_map adl_ltr_show_map[];

