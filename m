Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6251AC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 13:59:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4504061C75
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 13:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbhF1OBb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 10:01:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37920 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232185AbhF1OBa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 10:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624888744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mph3hvt6ZBrJV1P+++XDfxBqr4/dELhdFdRkQHdxCu8=;
        b=bT2y/5J6crdaLlN7xNdcq+ToiZtGTRxsdNPJhIF4zfsNFx1+vBeqbry3tHcjr/+3JMekDh
        BnClrL3vZtxceJd+UiyI9Q7MmZ4cPu2ghuWD1u70IAGYfB9feaACWu7JYN3g4hK1e4h31l
        /OkOvSICOOK1o8oi9JU/3qYfSzHHX5I=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-GgSCeU8VNmSgj8gu5oBvOg-1; Mon, 28 Jun 2021 09:59:03 -0400
X-MC-Unique: GgSCeU8VNmSgj8gu5oBvOg-1
Received: by mail-ej1-f71.google.com with SMTP id c13-20020a17090603cdb029049617c6be8eso4326490eja.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 06:59:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Mph3hvt6ZBrJV1P+++XDfxBqr4/dELhdFdRkQHdxCu8=;
        b=f4UwDXb38dd/otYHR4GCOMRRF/vgGQoA68dwEWnD7PjcvQE94eZjpJGEZDsntwYr06
         p+lDJncBCVlMYVUg54nhVtXEDxH+lPb+wRnnVwP4aJEqg6iH+td9WAi98bud59Op+QTt
         SElKcbDVsJS4LgXA6EcxVV5fDuiuChN3TTQcI1QoUzIYpVhH86WZt64tA6qyjYhoLNiI
         OW7d9bIjyz7TxkP5FG09q3CMYc3oCcMqfBjUWWMeMvBwMGX6m5otZp88U8cHG9ULDPpo
         nj4IrYNczw1MwHG3Ri+vqifmXKv9K+B8BY6ioWOXxxziW+XPQrIh1R7ofq6HunwnlbNK
         Tkkg==
X-Gm-Message-State: AOAM533TOtLMnLeQiot3yKo2DmyDunx7sU2aT3XUmOC5bSkv7B3XXldP
        xfOgx31eNc8stCm4P5N1FA3G6gVQdTjQw2v2npIoUVCFLjbVxnKO73T6TN1n03ZL0Xk1+Avx6yf
        mG7W58cL7mkKlzAKTVn7qQxmrDkgJu/Ew4Gjz3aM+G2sLzhFHLvoqh//705J6AdoymYFya5jsbr
        Dzo2GyTG4TxQ==
X-Received: by 2002:a05:6402:2710:: with SMTP id y16mr3318539edd.276.1624888741709;
        Mon, 28 Jun 2021 06:59:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxniVR2Dgio7IQQBsh5TwpDPsx20lQBDP6Ho99t6yrKv19S8FSk1giYR32pT7xQWb/n3RbyLg==
X-Received: by 2002:a05:6402:2710:: with SMTP id y16mr3318510edd.276.1624888741487;
        Mon, 28 Jun 2021 06:59:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jx1sm5859861ejc.101.2021.06.28.06.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 06:59:01 -0700 (PDT)
Subject: Re: [PATCH v3 1/7] platform/x86: amd-pmc: Fix command completion code
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, rrangel@chromium.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20210628110451.4047142-1-Shyam-sundar.S-k@amd.com>
 <20210628110451.4047142-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8ff4fcb8-36c9-f9e4-d05f-730e5379ec9c@redhat.com>
Date:   Mon, 28 Jun 2021 15:59:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628110451.4047142-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 6/28/21 1:04 PM, Shyam Sundar S K wrote:
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
> ---
> v2: no change
> v3:
>  - use mutex to protect multiple calls to SMU
>  - add a switch-case to handle smu responses.

I'm sorry, but this still needs a bit more work, see below.

>  drivers/platform/x86/amd-pmc.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b9da58ee9b1e..f3f5f754f75c 100644
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
> @@ -156,7 +158,28 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>  	/* Write message ID to message ID register */
>  	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
>  	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> -	return 0;
> +	/* Wait until we get a valid response */
> +	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +				val, val != 0, PMC_MSG_DELAY_MIN_US,
> +				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
> +	if (rc)
> +		dev_err(dev->dev, "SMU response timed out\n");

If rc != 0 then val will still be 0, so this function will end up
returning 0 while it should return an error.

Please add a rc = -ETIME; or rc = -ETIMEDOUT + goto out_unlock here.


> +
> +	switch (val) {
> +	case AMD_PMC_RESULT_OK:
> +		break;
> +	case AMD_PMC_RESULT_CMD_REJECT_BUSY:
> +	case AMD_PMC_RESULT_CMD_REJECT_PREREQ:
> +	case AMD_PMC_RESULT_CMD_UNKNOWN:
> +	case AMD_PMC_RESULT_FAILED:
> +		dev_err(dev->dev, "SMU not ready. err: 0x%x\n", val);
> +		rc = -EBUSY;
> +		goto out_unlock;

The rc should different for different val values, e.g.
CMD_REJECT_BUSY -> -EBUSY, CMD_UNKNOWN -> EINVAL
and map the others to -EIO.

Also you should have a default case to handle the case where the hw
returns some other value (and also map that to -EIO.

Regards,

Hans



> +	}
> +
> +out_unlock:
> +	mutex_unlock(&dev->lock);
> +	return rc;
>  }
>  
>  static int __maybe_unused amd_pmc_suspend(struct device *dev)
> @@ -259,6 +282,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	amd_pmc_dump_registers(dev);
>  
> +	mutex_init(&dev->lock);
>  	platform_set_drvdata(pdev, dev);
>  	amd_pmc_dbgfs_register(dev);
>  	return 0;
> @@ -269,6 +293,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
>  	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
>  
>  	amd_pmc_dbgfs_unregister(dev);
> +	mutex_destroy(&dev->lock);
>  	return 0;
>  }
>  
> 

