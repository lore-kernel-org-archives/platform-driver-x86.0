Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7284C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 19:47:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234792AbiD0Tui (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 15:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233454AbiD0Tu2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 15:50:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2576A24BE5
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651088833;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XlSYqSRD54p7hpjfYnokCdhEh+mSyhJpJZDaQHSx+Vw=;
        b=R0W5cUJYGsLECzT4Yn5ZWLybNze7ko4G1hzHCKaiIc7f95WN0v14lCb3CGWBmV5Xx6YMJ8
        WJuyLVDFnPInbY5vdTxnd2y8O6IdHgwXidqYMcFyrASD8nVekqHSuVN6nJgUVL1EWaS6ej
        cU/0aqcQ44W4l4WPOJu4dW80QW1bemU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-QRzKRePZMjqi2oRniHoxtQ-1; Wed, 27 Apr 2022 15:47:12 -0400
X-MC-Unique: QRzKRePZMjqi2oRniHoxtQ-1
Received: by mail-ej1-f70.google.com with SMTP id nc20-20020a1709071c1400b006f3726da7d3so1706001ejc.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 12:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XlSYqSRD54p7hpjfYnokCdhEh+mSyhJpJZDaQHSx+Vw=;
        b=J+P+iQORkzRzFwpkHkt54xj7ORc5MdQ0do0iAtAHWFGz/Cvnm9lCdgrefIqy99Ob39
         ILPrWibZeUT88YbYl3hDXv7kyr/sq2X5l2uFm31tiuVPIrpj3oBlh8fwDb0Ta9ZUqCBd
         HueuFPz7wQj9Xf5O8ogekKjKJnu7/vMOoJsgZl9Ok7ET1QcuDf+rLrN2jeun1dCDeyEC
         a+19QWf2dTvb+pgcNShO2o6z0l1Qr7kqI4uzjEGqq/e4ZVE7FHTV6EtxwAstvDjbz3y7
         YirzhYiy/v44Prp6RpAMDyBxQcn2+VvoMqFcWhenpP+fypE1fQXu4sAjt7utMRV0SHSh
         ojVA==
X-Gm-Message-State: AOAM533LPUuYox1s9C2OIk4BxhjSTP/tBwLzrfq49kpkY6rVR0A9gXcV
        rPBMU6u6jvsnPLe0i4dlGYDoNclt+t+6hN2dnXHcW17Ijogiwp/o9TRtcWOs0aInqtLZEBTFt+6
        w5HUkGdu+usXwBWMCY1occ1eObq4EqdDdCw==
X-Received: by 2002:a17:907:d09:b0:6e8:3eef:3192 with SMTP id gn9-20020a1709070d0900b006e83eef3192mr27354290ejc.122.1651088831255;
        Wed, 27 Apr 2022 12:47:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9YqdGAi7H8X0ZJ7DVbPwiDBn9JU/7EAY/SlKo/6s7eQSjYrE/BNtWVqdLyRjQ9SNT21OKoA==
X-Received: by 2002:a17:907:d09:b0:6e8:3eef:3192 with SMTP id gn9-20020a1709070d0900b006e83eef3192mr27354281ejc.122.1651088831042;
        Wed, 27 Apr 2022 12:47:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o18-20020a1709064f9200b006e7f229b332sm7161534eju.36.2022.04.27.12.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 12:47:10 -0700 (PDT)
Message-ID: <8182130c-e368-1b84-dca7-754688bcb30f@redhat.com>
Date:   Wed, 27 Apr 2022 21:47:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3] amd_hsmp: Add HSMP protocol version 5 messages
Content-Language: en-US
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org
Cc:     carlos.bilbao@amd.com, siva.sathappan@amd.com, song@kernel.org,
        Suma Hegde <suma.hegde@amd.com>
References: <20220427152248.25643-1-nchatrad@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220427152248.25643-1-nchatrad@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/27/22 17:22, Naveen Krishna Chatradhi wrote:
> From: Suma Hegde <suma.hegde@amd.com>
> 
> HSMP protocol version 5 is supported on AMD family 19h model 10h
> EPYC processors. This version brings new features such as
> -- DIMM statistics
> -- Bandwidth for IO and xGMI links
> -- Monitor socket and core frequency limits
> -- Configure power efficiency modes, DF pstate range etc
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

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
> changes since v2:
> None, could not find the previous emails in the archives.
> Submitting again.
> 
> changes since v1:
> spell correction in commit message
> 
>  arch/x86/include/uapi/asm/amd_hsmp.h | 114 +++++++++++++++++++++++++--
>  1 file changed, 109 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> index 7ee7ba0d63a3..769b939444ae 100644
> --- a/arch/x86/include/uapi/asm/amd_hsmp.h
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -31,9 +31,22 @@ enum hsmp_message_ids {
>  	HSMP_GET_CCLK_THROTTLE_LIMIT,	/* 10h Get CCLK frequency limit in socket */
>  	HSMP_GET_C0_PERCENT,		/* 11h Get average C0 residency in socket */
>  	HSMP_SET_NBIO_DPM_LEVEL,	/* 12h Set max/min LCLK DPM Level for a given NBIO */
> -					/* 13h Reserved */
> -	HSMP_GET_DDR_BANDWIDTH = 0x14,	/* 14h Get theoretical maximum and current DDR Bandwidth */
> -	HSMP_GET_TEMP_MONITOR,		/* 15h Get per-DIMM temperature and refresh rates */
> +	HSMP_GET_NBIO_DPM_LEVEL,	/* 13h Get LCLK DPM level min and max for a given NBIO */
> +	HSMP_GET_DDR_BANDWIDTH,		/* 14h Get theoretical maximum and current DDR Bandwidth */
> +	HSMP_GET_TEMP_MONITOR,		/* 15h Get socket temperature */
> +	HSMP_GET_DIMM_TEMP_RANGE,	/* 16h Get per-DIMM temperature range and refresh rate */
> +	HSMP_GET_DIMM_POWER,		/* 17h Get per-DIMM power consumption */
> +	HSMP_GET_DIMM_THERMAL,		/* 18h Get per-DIMM thermal sensors */
> +	HSMP_GET_SOCKET_FREQ_LIMIT,	/* 19h Get current active frequency per socket */
> +	HSMP_GET_CCLK_CORE_LIMIT,	/* 1Ah Get CCLK frequency limit per core */
> +	HSMP_GET_RAILS_SVI,		/* 1Bh Get SVI-based Telemetry for all rails */
> +	HSMP_GET_SOCKET_FMAX_FMIN,	/* 1Ch Get Fmax and Fmin per socket */
> +	HSMP_GET_IOLINK_BANDWITH,	/* 1Dh Get current bandwidth on IO Link */
> +	HSMP_GET_XGMI_BANDWITH,		/* 1Eh Get current bandwidth on xGMI Link */
> +	HSMP_SET_GMI3_WIDTH,		/* 1Fh Set max and min GMI3 Link width */
> +	HSMP_SET_PCI_RATE,		/* 20h Control link rate on PCIe devices */
> +	HSMP_SET_POWER_MODE,		/* 21h Select power efficiency profile policy */
> +	HSMP_SET_PSTATE_MAX_MIN,	/* 22h Set the max and min DF P-State  */
>  	HSMP_MSG_ID_MAX,
>  };
>  
> @@ -175,8 +188,12 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
>  	 */
>  	{1, 0, HSMP_SET},
>  
> -	/* RESERVED message */
> -	{0, 0, HSMP_RSVD},
> +	/*
> +	 * HSMP_GET_NBIO_DPM_LEVEL, num_args = 1, response_sz = 1
> +	 * input: args[0] = nbioid[23:16]
> +	 * output: args[0] = max dpm level[15:8] + min dpm level[7:0]
> +	 */
> +	{1, 1, HSMP_GET},
>  
>  	/*
>  	 * HSMP_GET_DDR_BANDWIDTH, num_args = 0, response_sz = 1
> @@ -191,6 +208,93 @@ static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
>  	 * [7:5] fractional part
>  	 */
>  	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_DIMM_TEMP_RANGE, num_args = 1, response_sz = 1
> +	 * input: args[0] = DIMM address[7:0]
> +	 * output: args[0] = refresh rate[3] + temperature range[2:0]
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_DIMM_POWER, num_args = 1, response_sz = 1
> +	 * input: args[0] = DIMM address[7:0]
> +	 * output: args[0] = DIMM power in mW[31:17] + update rate in ms[16:8] +
> +	 * DIMM address[7:0]
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_DIMM_THERMAL, num_args = 1, response_sz = 1
> +	 * input: args[0] = DIMM address[7:0]
> +	 * output: args[0] = temperature in degree celcius[31:21] + update rate in ms[16:8] +
> +	 * DIMM address[7:0]
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_SOCKET_FREQ_LIMIT, num_args = 0, response_sz = 1
> +	 * output: args[0] = frequency in MHz[31:16] + frequency source[15:0]
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_CCLK_CORE_LIMIT, num_args = 1, response_sz = 1
> +	 * input: args[0] = apic id [31:0]
> +	 * output: args[0] = frequency in MHz[31:0]
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_RAILS_SVI, num_args = 0, response_sz = 1
> +	 * output: args[0] = power in mW[31:0]
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_SOCKET_FMAX_FMIN, num_args = 0, response_sz = 1
> +	 * output: args[0] = fmax in MHz[31:16] + fmin in MHz[15:0]
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_IOLINK_BANDWITH, num_args = 1, response_sz = 1
> +	 * input: args[0] = link id[15:8] + bw type[2:0]
> +	 * output: args[0] = io bandwidth in Mbps[31:0]
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_XGMI_BANDWITH, num_args = 1, response_sz = 1
> +	 * input: args[0] = link id[15:8] + bw type[2:0]
> +	 * output: args[0] = xgmi bandwidth in Mbps[31:0]
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_SET_GMI3_WIDTH, num_args = 1, response_sz = 0
> +	 * input: args[0] = min link width[15:8] + max link width[7:0]
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_SET_PCI_RATE, num_args = 1, response_sz = 1
> +	 * input: args[0] = link rate control value
> +	 * output: args[0] = previous link rate control value
> +	 */
> +	{1, 1, HSMP_SET},
> +
> +	/*
> +	 * HSMP_SET_POWER_MODE, num_args = 1, response_sz = 0
> +	 * input: args[0] = power efficiency mode[2:0]
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_SET_PSTATE_MAX_MIN, num_args = 1, response_sz = 0
> +	 * input: args[0] = min df pstate[15:8] + max df pstate[7:0]
> +	 */
> +	{1, 0, HSMP_SET},
>  };
>  
>  /* Reset to default packing */

