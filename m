Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9028C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 10:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344240AbiEFKkt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 06:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245559AbiEFKks (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 06:40:48 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3501638780
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651833424;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cv6Um2mNgqN77rJjF7DdFteH1AUkMIP/GRKLYfSGdLs=;
        b=Y0KpX+TMDyHZL5TRv8oIMZ/dPZ1gsY5sRfHmFqD+6q5MY/iuNFHZVSzhRh4+HdkOaLm7v2
        TBMBLao+obN0jzPQTuBUK+IRdZAYZwn5ZJ4jzWOdZaheR8FcU155QbBknVHSeolleP74Jf
        /8QQOaA7pyTcfrMt+Vs7LyiMQBsxoRk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-8qomETBWMHCSUVmkxZ3fmQ-1; Fri, 06 May 2022 06:37:03 -0400
X-MC-Unique: 8qomETBWMHCSUVmkxZ3fmQ-1
Received: by mail-ej1-f72.google.com with SMTP id gs8-20020a1709072d0800b006f42d47382fso4115893ejc.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 May 2022 03:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cv6Um2mNgqN77rJjF7DdFteH1AUkMIP/GRKLYfSGdLs=;
        b=XnAuoC6FoSszqGS9nQEQBvJVrsQnKGqb9hoYjaggQsrhK3UqgbbRQcIpQLQ2rb0ziM
         jqW6Fx4zqXRkB/7ls1FMGFkWCUAxbv0MTk2n1uWEZV6gCDPLKDfxqzqEYk/RdkpTa+88
         t3+6OBucde54lMyCV0cm5l9cKeB8RGmVrkExXgfEDBZP8mvdwgoKJNQ5HK1XLQo+IaWq
         f7bOIV3xlpS9xG9F8fzGLRKbxI/PAez9d/hobaSb8JQ7fMwn8iBVRyQ6OE+phyD11urf
         PJgxVJiDGWwVe1xOdSGoMaS+flRorpNDhUnF/62ZOx8v1niUuDirqP962eBawC8r6phG
         pgyA==
X-Gm-Message-State: AOAM532zCK/69sv9eRbhIFWrOoMylCz7SbbaBXuEHCgVrq2ZxRVMmk3+
        OaQzZ3TdBuitu8vcGQYEQvCSeKr+gryJEmHxa1eIiyJqv2F8MtRYDSaWdWFVXU6schwOy9+KcXx
        N/MXUpmUTUQFF3JMNkqr3e3DX8CJ1WGPtGw==
X-Received: by 2002:a17:906:544e:b0:6f3:bd59:1a93 with SMTP id d14-20020a170906544e00b006f3bd591a93mr2298265ejp.421.1651833421544;
        Fri, 06 May 2022 03:37:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRZuobLIG2hExUdnsLH7VTyOALMwM2hx+csjBKvRIcgESKMGA5D5X+qrb3QIJJDbrRqu6Dtg==
X-Received: by 2002:a17:906:544e:b0:6f3:bd59:1a93 with SMTP id d14-20020a170906544e00b006f3bd591a93mr2298237ejp.421.1651833421287;
        Fri, 06 May 2022 03:37:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7d88a000000b0042617ba638csm2090816edq.22.2022.05.06.03.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 03:37:00 -0700 (PDT)
Message-ID: <f73836d2-913a-87c1-af44-56429ffcb963@redhat.com>
Date:   Fri, 6 May 2022 12:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next] platform/x86: amd-pmc: Fix build error
 unused-function
Content-Language: en-US
To:     Ren Zhijie <renzhijie2@huawei.com>, Shyam-sundar.S-k@amd.com,
        markgross@kernel.org
Cc:     weiyongjun1@huawei.com, yuehaibing@huawei.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220505121958.138905-1-renzhijie2@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220505121958.138905-1-renzhijie2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/5/22 14:19, Ren Zhijie wrote:
> If CONFIG_SUSPEND and CONFIG_DEBUG_FS are not set.
> 
> compile error:
> drivers/platform/x86/amd-pmc.c:323:12: error: ‘get_metrics_table’ defined but not used [-Werror=unused-function]
>  static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table)
>             ^~~~~~~~~~~~~~~~~
> drivers/platform/x86/amd-pmc.c:298:12: error: ‘amd_pmc_idlemask_read’ defined but not used [-Werror=unused-function]
>  static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>             ^~~~~~~~~~~~~~~~~~~~~
> drivers/platform/x86/amd-pmc.c:196:12: error: ‘amd_pmc_get_smu_version’ defined but not used [-Werror=unused-function]
>  static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>             ^~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> To fix building warning, wrap all related code with CONFIG_SUSPEND or CONFIG_DEBUG_FS.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ren Zhijie <renzhijie2@huawei.com>

Thanks for the patch, the issue with amd_pmc_get_smu_version() not being
wrapped in #ifdef CONFIG_DEBUG_FS was already fixed by:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=for-next&id=acd51562e07d17aaf4ac652f1dc55c743685bf41

Moving amd_pmc_setup_smu_logging + amd_pmc_idlemask_read +
get_metrics_table under:

#if defined(CONFIG_SUSPEND) || defined(CONFIG_DEBUG_FS)

is still necessary though, so I've merged that part of your patch:

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
>  drivers/platform/x86/amd-pmc.c | 72 ++++++++++++++++++----------------
>  1 file changed, 39 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 668a1d6c11ee..8f004673b23f 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -164,7 +164,6 @@ static int amd_pmc_read_stb(struct amd_pmc_dev *dev, u32 *buf);
>  #ifdef CONFIG_SUSPEND
>  static int amd_pmc_write_stb(struct amd_pmc_dev *dev, u32 data);
>  #endif
> -static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev);
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>  {
> @@ -193,6 +192,7 @@ struct smu_metrics {
>  	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
>  } __packed;
>  
> +#ifdef CONFIG_DEBUG_FS
>  static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>  {
>  	int rc;
> @@ -212,6 +212,7 @@ static int amd_pmc_get_smu_version(struct amd_pmc_dev *dev)
>  
>  	return 0;
>  }
> +#endif /* CONFIG_DEBUG_FS */
>  
>  static int amd_pmc_stb_debugfs_open(struct inode *inode, struct file *filp)
>  {
> @@ -295,6 +296,9 @@ static const struct file_operations amd_pmc_stb_debugfs_fops_v2 = {
>  	.release = amd_pmc_stb_debugfs_release_v2,
>  };
>  
> +#if defined(CONFIG_SUSPEND) || defined(CONFIG_DEBUG_FS)
> +static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev);
> +
>  static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  				 struct seq_file *s)
>  {
> @@ -335,6 +339,40 @@ static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table
>  	return 0;
>  }
>  
> +static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
> +{
> +	if (dev->cpu_id == AMD_CPU_ID_PCO) {
> +		dev_warn_once(dev->dev, "SMU debugging info not supported on this platform\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Get Active devices list from SMU */
> +	if (!dev->active_ips)
> +		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
> +
> +	/* Get dram address */
> +	if (!dev->smu_virt_addr) {
> +		u32 phys_addr_low, phys_addr_hi;
> +		u64 smu_phys_addr;
> +
> +		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
> +		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
> +		smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> +
> +		dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr,
> +						  sizeof(struct smu_metrics));
> +		if (!dev->smu_virt_addr)
> +			return -ENOMEM;
> +	}
> +
> +	/* Start the logging */
> +	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, 0);
> +	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
> +
> +	return 0;
> +}
> +#endif /* CONFIG_SUSPEND || CONFIG_DEBUG_FS */
> +
>  #ifdef CONFIG_SUSPEND
>  static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)
>  {
> @@ -475,38 +513,6 @@ static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
>  }
>  #endif /* CONFIG_DEBUG_FS */
>  
> -static int amd_pmc_setup_smu_logging(struct amd_pmc_dev *dev)
> -{
> -	if (dev->cpu_id == AMD_CPU_ID_PCO) {
> -		dev_warn_once(dev->dev, "SMU debugging info not supported on this platform\n");
> -		return -EINVAL;
> -	}
> -
> -	/* Get Active devices list from SMU */
> -	if (!dev->active_ips)
> -		amd_pmc_send_cmd(dev, 0, &dev->active_ips, SMU_MSG_GET_SUP_CONSTRAINTS, 1);
> -
> -	/* Get dram address */
> -	if (!dev->smu_virt_addr) {
> -		u32 phys_addr_low, phys_addr_hi;
> -		u64 smu_phys_addr;
> -
> -		amd_pmc_send_cmd(dev, 0, &phys_addr_low, SMU_MSG_LOG_GETDRAM_ADDR_LO, 1);
> -		amd_pmc_send_cmd(dev, 0, &phys_addr_hi, SMU_MSG_LOG_GETDRAM_ADDR_HI, 1);
> -		smu_phys_addr = ((u64)phys_addr_hi << 32 | phys_addr_low);
> -
> -		dev->smu_virt_addr = devm_ioremap(dev->dev, smu_phys_addr,
> -						  sizeof(struct smu_metrics));
> -		if (!dev->smu_virt_addr)
> -			return -ENOMEM;
> -	}
> -
> -	/* Start the logging */
> -	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_RESET, 0);
> -	amd_pmc_send_cmd(dev, 0, NULL, SMU_MSG_LOG_START, 0);
> -
> -	return 0;
> -}
>  
>  static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  {

