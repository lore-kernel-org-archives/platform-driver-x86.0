Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FE5C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Mar 2022 17:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242681AbiCJRvq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Mar 2022 12:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237937AbiCJRvq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Mar 2022 12:51:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B5CE115696B
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 09:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646934643;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IE8iDtjMPxES1pixTwbm5l65Q9z9YePgh/TVyJi1zQM=;
        b=FRt/UiZOJQUbp70wMk4EwpX6KsmhrMiqor5JTJHxgBbq6vS0eY4fPDrstxHxmyuTauKClg
        T4Fkx4eMzKkrzRVPIKP0wxmo5IJcPYGh8JulS5EKnyV6ltrznczu4rLRQeKhB/ga9qHcck
        5/DM9B1gUhY436pJ/ryhhSak9lHeBt8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-U2UobH1cNf-5W7-53nYO5w-1; Thu, 10 Mar 2022 12:50:42 -0500
X-MC-Unique: U2UobH1cNf-5W7-53nYO5w-1
Received: by mail-ej1-f72.google.com with SMTP id d7-20020a1709061f4700b006bbf73a7becso3508469ejk.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Mar 2022 09:50:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IE8iDtjMPxES1pixTwbm5l65Q9z9YePgh/TVyJi1zQM=;
        b=O9bbi71yGGoNygRUY/SdMsmcc0hC94kh131bzwFmhZUzefHfUTH6/FUGsjb75V7gXK
         2PGmz6cSK2twpBJ1esK6NCYl0unCmEknDndoiLLDxahXBSii9LBe6JGXGW9icrgqy+C5
         cR7CXyhNSEEOGg4i/mIrTBlXxv25D7XN2iAotvgRr0+F7/xim3ayn9XTKm4W4sP35TQw
         jLqY9gH+naHPi5OphYlMDoIfZ4RigWLSpihOMavfMwFJJ/xJb0taitX3ecwhJ9/Alali
         6MSqMuJyEfb7+M6Azq6cRNWYjAgJwyxvkju2X/GPFspjwzgqnBxIdlcC1RDm0Cm3UfYd
         hW+A==
X-Gm-Message-State: AOAM530VNFt12PPpnomi1bLnS47Pcyad22KpT0jSZxEvk1+UOI6dYQwD
        eYR3EUIkd/eJMX4w/qNnrsVJEGNvBW7TvB4eh7KKIYHACKksLPGTKtSYvVNZj+VuHdebsvnQQCm
        1f5fDurGLYfhqLUSUhMvcZBCOmf9yYL4STQ==
X-Received: by 2002:a17:906:eb51:b0:6db:a3d:3a0b with SMTP id mc17-20020a170906eb5100b006db0a3d3a0bmr5250658ejb.140.1646934641461;
        Thu, 10 Mar 2022 09:50:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwu4Mvf/4G3zWfgDaXb0BR2PiGQcdInEOpPjZETJpCRyoeh5v6uub8QzusHoq0zjnDFRwLwuQ==
X-Received: by 2002:a17:906:eb51:b0:6db:a3d:3a0b with SMTP id mc17-20020a170906eb5100b006db0a3d3a0bmr5250639ejb.140.1646934641259;
        Thu, 10 Mar 2022 09:50:41 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id js24-20020a170906ca9800b006c8aeca8fe8sm2024123ejb.58.2022.03.10.09.50.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Mar 2022 09:50:40 -0800 (PST)
Message-ID: <f3a95d3e-a7eb-8a68-b062-d25b8d7d7c98@redhat.com>
Date:   Thu, 10 Mar 2022 18:50:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Validate entry into the deepest
 state on resume
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>
References: <20220310150920.560583-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220310150920.560583-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/10/22 16:09, Mario Limonciello wrote:
> Currently the only way to discover if a system went into the deepest sleep
> state is to read from sysfs after you finished suspend.
> 
> To better illustrate to users that problems have occurred, check as part
> of resume and display a warning.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

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
> changes from v1->v2
>  * rebase on platform-x86.git/review-hans
>  drivers/platform/x86/amd-pmc.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index fc0b4d628dec..971aaabaa9c8 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -322,6 +322,28 @@ static int amd_pmc_idlemask_read(struct amd_pmc_dev *pdev, struct device *dev,
>  	return 0;
>  }
>  
> +static int get_metrics_table(struct amd_pmc_dev *pdev, struct smu_metrics *table)
> +{
> +	if (pdev->cpu_id == AMD_CPU_ID_PCO)
> +		return -ENODEV;
> +	memcpy_fromio(table, pdev->smu_virt_addr, sizeof(struct smu_metrics));
> +	return 0;
> +}
> +
> +static void amd_pmc_validate_deepest(struct amd_pmc_dev *pdev)
> +{
> +	struct smu_metrics table;
> +
> +	if (get_metrics_table(pdev, &table))
> +		return;
> +
> +	if (!table.s0i3_last_entry_status)
> +		dev_warn(pdev->dev, "Last suspend didn't reach deepest state\n");
> +	else
> +		dev_dbg(pdev->dev, "Last suspend in deepest state for %lluus\n",
> +			 table.timein_s0i3_lastcapture);
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int smu_fw_info_show(struct seq_file *s, void *unused)
>  {
> @@ -329,11 +351,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
>  	struct smu_metrics table;
>  	int idx;
>  
> -	if (dev->cpu_id == AMD_CPU_ID_PCO)
> +	if (get_metrics_table(dev, &table))
>  		return -EINVAL;
>  
> -	memcpy_fromio(&table, dev->smu_virt_addr, sizeof(struct smu_metrics));
> -
>  	seq_puts(s, "\n=== SMU Statistics ===\n");
>  	seq_printf(s, "Table Version: %d\n", table.table_version);
>  	seq_printf(s, "Hint Count: %d\n", table.hint_count);
> @@ -689,6 +709,9 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>  		cpu_latency_qos_update_request(&pdev->amd_pmc_pm_qos_req,
>  						PM_QOS_DEFAULT_VALUE);
>  
> +	/* Notify on failed entry */
> +	amd_pmc_validate_deepest(pdev);
> +
>  	return rc;
>  }
>  

