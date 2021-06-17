Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B308CC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 15:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 884E6613CB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Jun 2021 15:00:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232267AbhFQPCM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Jun 2021 11:02:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33763 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230507AbhFQPCL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Jun 2021 11:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623942003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sXIoWfedQ9MYeJgaL6RlM/c1eZELqTzyswtSVtON7p0=;
        b=R0GkBlIHTawa+sWuti/zZ/HN87/5ITZUH0D/LyyK6aL754zpKXKd9POH3LDH6wssvoRG/y
        YZ+8tYmx8bKp+6oL6L6hi3y3D4o+xikeLM/uefmAJFXIn48s+awD4RsiLIC5Iwh0PhWSyi
        dDNlI37MA2EErDn34lj0UJTTxo7MQ/M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-iZf1agXvMnyM65wuzwEUmw-1; Thu, 17 Jun 2021 11:00:00 -0400
X-MC-Unique: iZf1agXvMnyM65wuzwEUmw-1
Received: by mail-ej1-f69.google.com with SMTP id w13-20020a170906384db02903d9ad6b26d8so2394944ejc.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Jun 2021 08:00:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sXIoWfedQ9MYeJgaL6RlM/c1eZELqTzyswtSVtON7p0=;
        b=JoZpCUKUUhW51ZKnMHxqbx7jYs5/7CJJelfS2k4tZwjZx32n+8erAPBeb5ROzYMK9r
         zLaFdYwQ4HcwAbLCTndyDrR1gtlKpvVX/APszYJBBi5lK9rD1lJ7/5o5W2+YgTAUZRR8
         d0CEcVjXIo+WsEUUl5/8e5WKbNS7KseDHkF29UhGORaOR7XpUWN3sMQeousOWNErTdhX
         UVuPKopfa1j9gTED6FF7nDf0srKU7dOdEY9mqsiVppm3Ze0dPXeknElPwp+s8y3oZRCp
         vqwuQonE7aZ73eZl+qmbDpo+Z97N5Xs5WqzzNZi+quV0ItkqTgot5QACWFSZAUqKX0pT
         PDsA==
X-Gm-Message-State: AOAM5338+TxhtuayZCUnO5pYfquwqYjHs/QLaOgy185gUES2nW9aK82o
        HbwXIOpV32bLVIpo+7Q9j2mS1elvGj+1K1YZanKoFWozuqVynpKERWrC090iFsStOKsIKcU0n8F
        ooQBXAxilBd/WCAhbFez1MU1NFKqAuKvgIVL1lbbNdR4KMoV+CeQhHRsE4UdWjkaCzzBtfDbOEF
        FC37W9Gm5YRA==
X-Received: by 2002:a17:906:25db:: with SMTP id n27mr5585796ejb.170.1623941999141;
        Thu, 17 Jun 2021 07:59:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyenn6n3uuVWFMejWkgKWL25nCuBM7g/IjEvt2Mb20tSNKuvWkAGDc/+nfmOpViK4WOmmAtQ==
X-Received: by 2002:a17:906:25db:: with SMTP id n27mr5585775ejb.170.1623941998946;
        Thu, 17 Jun 2021 07:59:58 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u12sm3895254eje.40.2021.06.17.07.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jun 2021 07:59:58 -0700 (PDT)
Subject: Re: [PATCH 1/6] platform/x86: amd-pmc: Fix command completion code
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210617113040.1603970-1-Shyam-sundar.S-k@amd.com>
 <20210617113040.1603970-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <18c193be-cfea-9730-7ab2-031ff9195625@redhat.com>
Date:   Thu, 17 Jun 2021 16:59:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210617113040.1603970-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/17/21 1:30 PM, Shyam Sundar S K wrote:
> The protocol to submit a job request to SMU is to wait for
> AMD_PMC_REGISTER_RESPONSE to return 1,meaning SMU is ready to take
> requests. PMC driver has to make sure that the response code is always
> AMD_PMC_RESULT_OK before making any command submissions.
> 
> Also, when we submit a message to SMU, we have to wait until it processes
> the request. Adding a read_poll_timeout() check as this was missing in
> the existing code.
> 
> Fixes: 156ec4731cb2 ("platform/x86: amd-pmc: Add AMD platform support for S2Idle")
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/amd-pmc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b9da58ee9b1e..9c8a53120767 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -140,7 +140,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>  
>  	/* Wait until we get a valid response */
>  	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> -				val, val > 0, PMC_MSG_DELAY_MIN_US,
> +				val, val == AMD_PMC_RESULT_OK, PMC_MSG_DELAY_MIN_US,
>  				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
>  	if (rc) {
>  		dev_err(dev->dev, "failed to talk to SMU\n");
> @@ -156,6 +156,14 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
>  	/* Write message ID to message ID register */
>  	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
>  	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> +	/* Wait until we get a valid response */
> +	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +				val, val == AMD_PMC_RESULT_OK, PMC_MSG_DELAY_MIN_US,
> +				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
> +	if (rc) {
> +		dev_err(dev->dev, "SMU response timed out\n");
> +		return rc;
> +	}
>  	return 0;
>  }
>  
> 

