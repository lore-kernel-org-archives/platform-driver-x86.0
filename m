Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9C65A867
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 14:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GZuUb8D0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702908036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=801k8/cpcdJNojr//CVmwN6MefVG1M2oNgg9WBA1ID0=;
	b=GZuUb8D0xGaT/D8qAHqbENEPDq1wFm16s7MdVb1hFamxH6OeEF4niKTAoN74jTI8R48q06
	WZ7xm7YpQWRb8v7C5NB6i+DG7QIlzMc9tKGjdeb11RwjTuLKjDHqWuxeEvPkP0PJItlhF0
	6JvL7+BGu13h7clTf/H6V25PEZ503lk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-2dfRvVV8PW6HPT2CmOoTRQ-1; Mon, 18 Dec 2023 09:00:34 -0500
X-MC-Unique: 2dfRvVV8PW6HPT2CmOoTRQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a22f129e5acso170914366b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 06:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702908033; x=1703512833;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=801k8/cpcdJNojr//CVmwN6MefVG1M2oNgg9WBA1ID0=;
        b=fTPC5twYB+/COZfzE7Pt+U5hx5LRWlkl2Nf2v2CpsaraKO2KYZv+r+ZMXeFpDL5isZ
         3mI9clc9XCykB6/lgz6QHfCpNFE3/Hc5dfWtZ5nXGgimpUCTGoaz4XlxzLfAyXToiDz6
         r2Y4hn7Ojvx+CacjHo1rOmDeA0wYDSCOXk6Bc/HwL83GlIO+IN2LcT6hfXwJVfC5m0BP
         0SI5ORjkS1y6W6048ISjA+2oQOABWOwH1dEb4bzfI0M2b7hwbZ3VRshDw0/PUJGpZIN+
         BxLQJB8sGGIMB70KQ4Ipvc78ScBfrrqVOK7vg4U6Rw9atr6QXbMnDauDiDpBwCjzdT3l
         E/hg==
X-Gm-Message-State: AOJu0YzoALr6tpJPgrmG2Upi8Gmfozonantn/PQG/5k0uwl1zqQZOr3Y
	O9gpORZe8nGry5cq/t5IoKFvBnlkkpMAayQahGNGJWwllpPz+kz1DkHgWPXPTn/AOBgONLyIH42
	GfyIxU+fKHYdUuP5DNkmzP0D1VasTt5bhAQ==
X-Received: by 2002:a17:907:72c1:b0:a23:6462:4d66 with SMTP id du1-20020a17090772c100b00a2364624d66mr609507ejc.85.1702908032998;
        Mon, 18 Dec 2023 06:00:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9+GoUVX1KOJ9u+Z9HHUrJNCXqBOR7ke57fYj2st3f8W6rORSA+AVr3wXuR25QoUgRdzMQyA==
X-Received: by 2002:a17:907:72c1:b0:a23:6462:4d66 with SMTP id du1-20020a17090772c100b00a2364624d66mr609498ejc.85.1702908032679;
        Mon, 18 Dec 2023 06:00:32 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cx7-20020a170907168700b009fc576e26e6sm14059747ejd.80.2023.12.18.06.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 06:00:31 -0800 (PST)
Message-ID: <9234691b-5667-4c6c-a1d0-0bea386cf31e@redhat.com>
Date: Mon, 18 Dec 2023 15:00:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/intel/pmc: Fix in
 pmc_core_ssram_get_pmc()
Content-Language: en-US
To: rjingar <rajvi.jingar@linux.intel.com>, irenic.rajneesh@gmail.com,
 david.e.box@intel.com, ilpo.jarvinen@linux.intel.com, markgross@kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231216011702.1976408-1-rajvi.jingar@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231216011702.1976408-1-rajvi.jingar@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/16/23 02:17, rjingar wrote:
> From: Rajvi Jingar <rajvi.jingar@linux.intel.com>
> 
> Passing PMC_IDX_MAIN in pmc_core_pmc_add() adds only primary pmc to pmcdev.
> Use pmc_idx instead to add all available pmcs.
> 
> Fixes: a01486dc4bb1 ("platform/x86/intel/pmc: Cleanup SSRAM discovery")
> Signed-off-by: Rajvi Jingar <rajvi.jingar@linux.intel.com>

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
>  drivers/platform/x86/intel/pmc/core_ssram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
> index 3501c7bd6b33..55e54207987c 100644
> --- a/drivers/platform/x86/intel/pmc/core_ssram.c
> +++ b/drivers/platform/x86/intel/pmc/core_ssram.c
> @@ -287,7 +287,7 @@ pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)
>  	if (!map)
>  		return -ENODEV;
>  
> -	return pmc_core_pmc_add(pmcdev, pwrm_base, map, PMC_IDX_MAIN);
> +	return pmc_core_pmc_add(pmcdev, pwrm_base, map, pmc_idx);
>  }
>  
>  int pmc_core_ssram_init(struct pmc_dev *pmcdev)

