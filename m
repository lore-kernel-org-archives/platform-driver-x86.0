Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_NONE,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF21DC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 15:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C24F6610A0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 15:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbhFQPFQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46118 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233108AbhFQPFO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 11:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623942186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rz/OObxv2AnosVmNUFuvJTMtT4VRRg8fvEQd6y30KB4=;
        b=Sq/CLkKSy5PKx9lKwNTJDN7IpALskK/Rl05bkJcZSPdXw/vbisXdMD0Asz6OESWgP/5jTd
        bV0T61mUmIdTg42JPhW1E0v5glXlfcWTab2vzn3i9X7VyjQWlRbccMmVQ+/2Tw5U6uZW/+
        VWeIy5kXQos31WahLHYK7t4i8ePg5bk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-8f7Jc_I4N0SvR2xtK3rlPg-1; Thu, 17 Jun 2021 11:03:04 -0400
X-MC-Unique: 8f7Jc_I4N0SvR2xtK3rlPg-1
Received: by mail-ed1-f71.google.com with SMTP id v8-20020a0564023488b0290393873961f6so1729580edc.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Jun 2021 08:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rz/OObxv2AnosVmNUFuvJTMtT4VRRg8fvEQd6y30KB4=;
        b=udoN1ui2nH/v6HnuW2Cm80GCtSFztwTI1EJhhivMnGYixAx9udoGlPCPVNLMdxV4ME
         WyA1hkmdH+lCEickHK5n/tnn9ZzOfMIAGFd3ez3ymJ9nyAf2j8CpHB21187fXM5gsBtA
         ioc514DUVclisON8CttXT3M6UGdyvVxXaLA/cfwU0JbR918/JEKStdcAu5jIHma/8X7P
         afmOwJ1Ii5KGjNkmtLwdfdZRXewKPtKOklp6bgqvylEPCbSdygn485MHdWqy7Ev4PG6J
         9Qmvbvmy72SEIw/nINyrK5sEWgNmrf1zkfUnf+ic1Yp7y8/KWGMvdTLv0mdKUx8onSSR
         5RpQ==
X-Gm-Message-State: AOAM53330aKuqLbDI2e8DzxtyVQOaJ8MGEO6dbvqXOxODCET3rATJ9VE
        BC8mvFsaB06S1amM+iFBvsYQErH25Y2dmXiy++Tms6fXisD9N4risflssWjulPgZZu5hC/SvT9n
        ppvRFkDjcI1w4qG5+8FBH3PJsvr64/wprwVjDMmXnx1mC7aKpEfK5Emvdx3+CtZu5PLGOaea74z
        q7BGsM+Yh93w==
X-Received: by 2002:a17:906:6c92:: with SMTP id s18mr5689551ejr.246.1623942180925;
        Thu, 17 Jun 2021 08:03:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkNo7xcPnkdmdBNC5ESDlLqNjAo2rW76GvXIkJxFArjGrJCptksFow+SHQ05bnk1DdKXFSPw==
X-Received: by 2002:a17:906:6c92:: with SMTP id s18mr5689533ejr.246.1623942180685;
        Thu, 17 Jun 2021 08:03:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u21sm3773485ejm.89.2021.06.17.08.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 08:03:00 -0700 (PDT)
Subject: Re: [PATCH 2/6] platform/x86: amd-pmc: Fix SMU firmware reporting
 mechanism
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
 <20210617113040.1603970-3-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <14a37253-e44b-bd1d-8df3-57a127abe5c1@redhat.com>
Date:   Thu, 17 Jun 2021 17:02:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617113040.1603970-3-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/17/21 1:30 PM, Shyam Sundar S K wrote:
> It was lately understood that the current mechanism available in the
> driver to get SMU firmware info works only on internal SMU builds and
> there is a separate way to get all the SMU logging counters (addressed
> in the next patch). Hence remove all the smu info shown via debugfs as it
> is no more useful.
> 
> Also, use dump registers routine only at one place i.e. after the command
> submission to SMU is done.
> 
> Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd-pmc.c | 15 +--------------
>  1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 9c8a53120767..ce0e2ad94d09 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -52,7 +52,6 @@
>  #define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
>  #define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
>  
> -#define AMD_SMU_FW_VERSION		0x0
>  #define PMC_MSG_DELAY_MIN_US		100
>  #define RESPONSE_REGISTER_LOOP_MAX	200
>  
> @@ -88,11 +87,6 @@ static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u3
>  #ifdef CONFIG_DEBUG_FS
>  static int smu_fw_info_show(struct seq_file *s, void *unused)
>  {
> -	struct amd_pmc_dev *dev = s->private;
> -	u32 value;
> -
> -	value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
> -	seq_printf(s, "SMU FW Info: %x\n", value);
>  	return 0;
>  }
>  DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
> @@ -164,6 +158,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>  		dev_err(dev->dev, "SMU response timed out\n");
>  		return rc;
>  	}
> +	amd_pmc_dump_registers(dev);

Is this addition instead of a removal intentional ?  If this is intentional
this really should be done in a separate commit, with a commit message
explaining why this change is being made.

>  	return 0;
>  }
>  
> @@ -176,7 +171,6 @@ static int __maybe_unused amd_pmc_suspend(struct device *dev)
>  	if (rc)
>  		dev_err(pdev->dev, "suspend failed\n");
>  
> -	amd_pmc_dump_registers(pdev);
>  	return 0;
>  }
>  
> @@ -189,7 +183,6 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>  	if (rc)
>  		dev_err(pdev->dev, "resume failed\n");
>  
> -	amd_pmc_dump_registers(pdev);
>  	return 0;
>  }
>  
> @@ -256,17 +249,11 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	pci_dev_put(rdev);
>  	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
>  
> -	dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
> -	if (!dev->smu_base)
> -		return -ENOMEM;
> -

Since you are now no longer setting this, I assume that this is also
not used anywhere anymore? And thus the smu_base variable should also
be removed from the "dev" struct.

>  	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
>  				    AMD_PMC_MAPPING_SIZE);
>  	if (!dev->regbase)
>  		return -ENOMEM;
>  
> -	amd_pmc_dump_registers(dev);
> -
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmc_dbgfs_register(dev);
>  	return 0;


Regards,

Hans


p.s.

I don't have time to review the rest of this series today. I'll continue
reviewing this later (probably on Monday).

