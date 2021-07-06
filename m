Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9CE2C07E96
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 09:58:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2C19619A1
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 09:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhGFKBe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 06:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39025 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231197AbhGFKBe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 06:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625565535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bYRgebn7PYIgTZFREmOXOgblBinIU0GLGKnvnPvdfvM=;
        b=KIFlQlCCzsrtvbRtlRo9//xIARQ/WmyEnBAbDlAsfTAJHYcOgAzTXD6iTOwqhX9La/XY6+
        bo7QYDlqa4Iz1iVnCV8ORaLF/bQ5IeI8rdeLi+rQ2jD3ATlMOMiPDk0ryCitYbQG6+7BV3
        T2wKybVeMNKYZZ1ykXe4UogYhDAiLdo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-hz6MaFaAME6fLFcMLy1KhA-1; Tue, 06 Jul 2021 05:58:54 -0400
X-MC-Unique: hz6MaFaAME6fLFcMLy1KhA-1
Received: by mail-ed1-f70.google.com with SMTP id y18-20020a0564022712b029038ffac1995eso10596948edd.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jul 2021 02:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bYRgebn7PYIgTZFREmOXOgblBinIU0GLGKnvnPvdfvM=;
        b=gnBCdHRzy4Ya33hR/9IjAMofJYGf+THu59phmvfHGpDQ5agEBOXawvCYep9W6c0528
         nNT0YW2T9mvngmhyouYLx+WyMOEzyf5YHM5jN8Oh6te19z3w/oh0Gq0U9zPO2eaobv9I
         txOFcOOkN/d/e4ov+fsCUU3JIC9vuxCUMPhgmZZv3QI4UGj+WcyQIR6Pq8of+r5Tb+rg
         Tmkv2yMdyQ9GaWnddxcBYctC551OC7VQ43OB8ige22im8CwZHrkBkPidBU2e0ZYgolCa
         LL8WU6r9iyFP679rw1OnDTyGjLxAVkoR033UAaog8oQVzr2m6wB/s6B4I+MB9PWRcZwB
         +tpA==
X-Gm-Message-State: AOAM5323MaCUT4cUbW8A7doUVM4CIg0fEFo3FgOWegFlWJBwfWBqFQKx
        Y2eoQ37ZFwiX2LiUoz2CgsgZ6p5BWSUWRwKP6NzB4XUb36dW0+0UmSux0p9rGx0U+2jTgzfSwQC
        wmBhOrHV5vK4VYPYduzPbOMHzzJz8nFDUtFuSF5PzXnZHcDc8LdbUjIY20aZs9UhqItMTeBOiUX
        reOll6cP3/gA==
X-Received: by 2002:a17:907:3f94:: with SMTP id hr20mr17775709ejc.448.1625565532990;
        Tue, 06 Jul 2021 02:58:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIoD1m8T1n1OAVOCKEqKmn3ormYEvMQKIergTocKOzNnK/KXNQF/PEuMM9KArLa5i4BOLY0w==
X-Received: by 2002:a17:907:3f94:: with SMTP id hr20mr17775692ejc.448.1625565532751;
        Tue, 06 Jul 2021 02:58:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f12sm5348435ejt.96.2021.07.06.02.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 02:58:52 -0700 (PDT)
Subject: Re: [PATCH v5 1/7] platform/x86: amd-pmc: Fix command completion code
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, rrangel@chromium.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20210629084803.248498-1-Shyam-sundar.S-k@amd.com>
 <20210629084803.248498-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b67da325-19fc-d132-8bc7-23c2a4c940db@redhat.com>
Date:   Tue, 6 Jul 2021 11:58:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629084803.248498-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/29/21 10:47 AM, Shyam Sundar S K wrote:
> The protocol to submit a job request to SMU is to wait for
> AMD_PMC_REGISTER_RESPONSE to return 1,meaning SMU is ready to take
> requests. PMC driver has to make sure that the response code is always
> AMD_PMC_RESULT_OK before making any command submissions.
> 
> When we submit a message to SMU, we have to wait until it processes
> the request. Adding a read_poll_timeout() check as this was missing in
> the existing code.
> 
> Also, add a mutex to protect amd_pmc_send_cmd() calls to SMU.
> 
> Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Acked-by: Raul E Rangel <rrangel@chromium.org>
> ---
> v2: no change
> v3:
>  - use mutex to protect multiple calls to SMU
>  - add a switch-case to handle smu responses.
> v4:
>  - Handle different error codes based on smu responses.
> v5:
>  - Remove redundant rc assignment as pointed by Raul

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll apply this to the platform-drivers-x86 tree once 5.14-rc1 out,
since this is just a bunch of fixes + some new hw-ids I'll also
include this series in my next pdx86-fixes for 5.14 pull-req to Linus.

Regards,

Hans





> 
>  drivers/platform/x86/amd-pmc.c | 38 ++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b9da58ee9b1e..1b5f149932c1 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -68,6 +68,7 @@ struct amd_pmc_dev {
>  	u32 base_addr;
>  	u32 cpu_id;
>  	struct device *dev;
> +	struct mutex lock; /* generic mutex lock */
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  	struct dentry *dbgfs_dir;
>  #endif /* CONFIG_DEBUG_FS */
> @@ -138,9 +139,10 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>  	u8 msg;
>  	u32 val;
>  
> +	mutex_lock(&dev->lock);
>  	/* Wait until we get a valid response */
>  	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> -				val, val > 0, PMC_MSG_DELAY_MIN_US,
> +				val, val != 0, PMC_MSG_DELAY_MIN_US,
>  				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>  	if (rc) {
>  		dev_err(dev->dev, "failed to talk to SMU\n");
> @@ -156,7 +158,37 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>  	/* Write message ID to message ID register */
>  	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
>  	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> -	return 0;
> +	/* Wait until we get a valid response */
> +	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +				val, val != 0, PMC_MSG_DELAY_MIN_US,
> +				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
> +	if (rc) {
> +		dev_err(dev->dev, "SMU response timed out\n");
> +		goto out_unlock;
> +	}
> +
> +	switch (val) {
> +	case AMD_PMC_RESULT_OK:
> +		break;
> +	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
> +		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
> +		rc = -EBUSY;
> +		goto out_unlock;
> +	case AMD_PMC_RESULT_CMD_UNKNOWN:
> +		dev_err(dev->dev, "SMU cmd unknown. err: 0x%x\n", val);
> +		rc = -EINVAL;
> +		goto out_unlock;
> +	case AMD_PMC_RESULT_CMD_REJECT_PREREQ:
> +	case AMD_PMC_RESULT_FAILED:
> +	default:
> +		dev_err(dev->dev, "SMU cmd failed. err: 0x%x\n", val);
> +		rc = -EIO;
> +		goto out_unlock;
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&dev->lock);
> +	return rc;
>  }
>  
>  static int __maybe_unused amd_pmc_suspend(struct device *dev)
> @@ -259,6 +291,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	amd_pmc_dump_registers(dev);
>  
> +	mutex_init(&dev->lock);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmc_dbgfs_register(dev);
>  	return 0;
> @@ -269,6 +302,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
>  	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
>  
>  	amd_pmc_dbgfs_unregister(dev);
> +	mutex_destroy(&dev->lock);
>  	return 0;
>  }
>  
> 

