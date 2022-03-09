Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DFFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Mar 2022 15:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231963AbiCIPuV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Mar 2022 10:50:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234031AbiCIPuU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 10:50:20 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5448F12CC07
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Mar 2022 07:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646840959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4X7wXtfSRuyEMTqfUYHOILUHI+BxaM6b75T1O/wSi10=;
        b=Wj5c+Zj+sz5Fnzwsh1piP44QEP1w+KoPiKcMJwDvSWZ5VMF0sRnicMHiqRS844Waf9aUfb
        b3C7x4Yhz1EyIveNWhWAMthKcAjysfKyHYBoj4iPfpW+HCbyYjssVGWLVJ4Qlyw4JiCQbC
        L1aBq6waHHtdW+EISreXKjI6Jen7Rn0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-7-cgnB7NO1agQkDfWrCxZA-1; Wed, 09 Mar 2022 10:49:18 -0500
X-MC-Unique: 7-cgnB7NO1agQkDfWrCxZA-1
Received: by mail-ed1-f71.google.com with SMTP id r8-20020aa7d588000000b00416438ed9a2so1490792edq.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Mar 2022 07:49:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4X7wXtfSRuyEMTqfUYHOILUHI+BxaM6b75T1O/wSi10=;
        b=ib4Ij0w4fm3mI6lJXoAhZL/FVif26sks+kB+/M/YSW9H9xga+FllC+8m40K4EBhRKX
         gJhBzMVhQapsGkrTki+mr/uodZNRRiWqmihUL3B+DzE580+BW7MNwh4+7xYOATsPCZOF
         ad/KpKzCF2kliEgR1QYALCHuSiU5II1AQRzPgvRonFUjkg14LyQDgYLUZTA2UdJ0RSj8
         I4oObliB2lE72fpPYJY8FB+CNyaii4afcDrKb6rbHIUI3/xesBfCIOYp6HDWL4OLz956
         DtfUY/fOs2qjePz53+BxIzAVqcF8d4lWfnkF2zLoNllfJiA7jNk3QTv4snfYm1VLkWLU
         V92A==
X-Gm-Message-State: AOAM533XxsSISYElPSt3SYD3NN16vhJVYgiPJI8fGheb5GqYiz/Lzi5o
        0eFaXy/q5Zyg1RamlcHPPQaxSCKgMFMgEECjrSvezIP7H7lGcxjrZ8iMJWDTGlJoykLdlKvVe+j
        2vBoIIT3gYTaBN4XKOSb529lYRnV6IuVTXA==
X-Received: by 2002:a05:6402:183:b0:410:fde:887a with SMTP id r3-20020a056402018300b004100fde887amr24620edv.243.1646840956995;
        Wed, 09 Mar 2022 07:49:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHLhE2SlQFon4sY6OPjn8PbUTNiVVjRrS1RHetLnjtEZiJa014RXrZWyT+QZ2Kh5QzWJIjwg==
X-Received: by 2002:a05:6402:183:b0:410:fde:887a with SMTP id r3-20020a056402018300b004100fde887amr24607edv.243.1646840956776;
        Wed, 09 Mar 2022 07:49:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:cdb2:2781:c55:5db0? (2001-1c00-0c1e-bf00-cdb2-2781-0c55-5db0.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:cdb2:2781:c55:5db0])
        by smtp.gmail.com with ESMTPSA id r14-20020a1709067fce00b006db0edb8a80sm876284ejs.225.2022.03.09.07.49.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 07:49:16 -0800 (PST)
Message-ID: <9e6f2b59-22ec-568b-6b30-8f739d241098@redhat.com>
Date:   Wed, 9 Mar 2022 16:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] platform/x86: amd-pmc: Validate entry into the deepest
 state on resume
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>
References: <20220309144403.213756-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220309144403.213756-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/22 15:44, Mario Limonciello wrote:
> Currently the only way to discover if a system went into the deepest sleep
> state is to read from sysfs after you finished suspend.
> 
> To better illustrate to users that problems have occurred, check as part
> of resume and display a warning.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Has this also been tested on system which use S3 suspend rather
then s2idle ?

Regards,

Hans



> ---
>  drivers/platform/x86/amd-pmc.c | 29 ++++++++++++++++++++++++++---
>  1 file changed, 26 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 05b4bac38920..e117404e1bb1 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -171,6 +171,28 @@ struct smu_metrics {
>  	u64 timecondition_notmet_totaltime[SOC_SUBSYSTEM_IP_MAX];
>  } __packed;
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
> @@ -178,11 +200,9 @@ static int smu_fw_info_show(struct seq_file *s, void *unused)
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
> @@ -571,6 +591,9 @@ static int __maybe_unused amd_pmc_resume(struct device *dev)
>  	if (enable_stb)
>  		amd_pmc_write_stb(pdev, AMD_PMC_STB_PREDEF + 1);
>  
> +	/* Notify on failed entry */
> +	amd_pmc_validate_deepest(pdev);
> +
>  	return 0;
>  }
>  

