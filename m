Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80734CA0ECD
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:07:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355865AbjIKWCO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236712AbjIKLPf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 07:15:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E80F4CF0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694430889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=duojBTZHxop0mRaPLS+9K2syH9Dx5s0nx5WCTjNJRpo=;
        b=TUUAawT96L67SjvxVvXYp7nSd8SBOVijSOMJDjBwz559bJYhNeVAuB0ufBypMDF6j7sA8Q
        c698sLL7DqPMdfQWOCXtcWCOVQPWJQzvpkBPUBskV6vE2Tyh+IMSomNJwYyDd7hXzZs2mX
        AS53KvzKwYBrjFfdQF6MAH6wdFVKsq0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-ygXGX16pPoGRbLgqabsrRg-1; Mon, 11 Sep 2023 07:14:47 -0400
X-MC-Unique: ygXGX16pPoGRbLgqabsrRg-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9aa20a75780so90334266b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 04:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694430886; x=1695035686;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=duojBTZHxop0mRaPLS+9K2syH9Dx5s0nx5WCTjNJRpo=;
        b=s5mzwffOaUeDnOTPPmaEhxtz5t4jOhXQZ4hBnTSWwTJ03efNwu+xog5YGY0ttms5wb
         kPMjJ8kKdh0a+7PRM4s2crdlRCvi83ET4O+3BLkituTv2fXKXb1TNDRicQXEL+Djlf9X
         YAQ9FEcbMD7GkYI9ERPU4g3uM1M+GOVCV5f9+grZ73zSnOfrlTpLxMlinA0fcCpXxqWH
         YRnMpiu3su3zE3/Od8+5Mmhxzb9djLFleu1sp93EY43ccTT+wzLWjcNdfhOTRKfZBuen
         ChS8biAhsTT35ESBRes+5ptdv9BMsl7npT67TcRhK2vb7+vy4II7mLFd19VSLRXN/lEJ
         FYow==
X-Gm-Message-State: AOJu0YyV4j6VOg5ACh07mhXmXE2AKDiqj3brOym2W6B0F0gSDwgnMoSa
        CQut9P8es2JC9t0SNtyy2VnCOpk24FO24NouvLDny/QYYb9IMt8z5OV5xNxxKBi03C6EzJ60k1a
        TEoJS7Xc+lvgke/VmmtuqnYppFWHHP3foiA==
X-Received: by 2002:a17:906:b08d:b0:99b:ead0:2733 with SMTP id x13-20020a170906b08d00b0099bead02733mr6555437ejy.72.1694430886706;
        Mon, 11 Sep 2023 04:14:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgLspzlfyck43uGvgiNYpQdq8tv4OxSuw9s66Frsw+DpaJXREHPBvRX5b057L6YUcDbnR7/g==
X-Received: by 2002:a17:906:b08d:b0:99b:ead0:2733 with SMTP id x13-20020a170906b08d00b0099bead02733mr6555422ejy.72.1694430886468;
        Mon, 11 Sep 2023 04:14:46 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id kd27-20020a17090798db00b009a57d30df89sm5202167ejc.132.2023.09.11.04.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Sep 2023 04:14:45 -0700 (PDT)
Message-ID: <a685b317-8b35-ffad-8f7f-2da9a5f6a491@redhat.com>
Date:   Mon, 11 Sep 2023 13:14:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/3] platform/mellanox: mlxbf-pmc: Fix reading of
 unprogrammed events
Content-Language: en-US
To:     Shravan Kumar Ramani <shravankr@nvidia.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        David Thompson <davthompson@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1693917738.git.shravankr@nvidia.com>
 <04d0213932d32681de1c716b54320ed894e52425.1693917738.git.shravankr@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <04d0213932d32681de1c716b54320ed894e52425.1693917738.git.shravankr@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/5/23 14:49, Shravan Kumar Ramani wrote:
> This fix involves 2 changes:
>  - All event regs have a reset value of 0, which is not a valid
>    event_number as per the event_list for most blocks and hence seen
>    as an error. Add a "disable" event with event_number 0 for all blocks.
> 
>  - The enable bit for each counter need not be checked before
>    reading the event info, and hence removed.
> 
> Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField PMC driver")
> Signed-off-by: Shravan Kumar Ramani <shravankr@nvidia.com>
> Reviewed-by: Vadim Pasternak <vadimp@nvidia.com>
> Reviewed-by: David Thompson <davthompson@nvidia.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 27 +++++++--------------------
>  1 file changed, 7 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index 95afcae7b9fa..2d4bbe99959e 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -191,6 +191,7 @@ static const struct mlxbf_pmc_events mlxbf_pmc_smgen_events[] = {
>  };
>  
>  static const struct mlxbf_pmc_events mlxbf_pmc_trio_events_1[] = {
> +	{ 0x0, "DISABLE" },
>  	{ 0xa0, "TPIO_DATA_BEAT" },
>  	{ 0xa1, "TDMA_DATA_BEAT" },
>  	{ 0xa2, "MAP_DATA_BEAT" },
> @@ -214,6 +215,7 @@ static const struct mlxbf_pmc_events mlxbf_pmc_trio_events_1[] = {
>  };
>  
>  static const struct mlxbf_pmc_events mlxbf_pmc_trio_events_2[] = {
> +	{ 0x0, "DISABLE" },
>  	{ 0xa0, "TPIO_DATA_BEAT" },
>  	{ 0xa1, "TDMA_DATA_BEAT" },
>  	{ 0xa2, "MAP_DATA_BEAT" },
> @@ -246,6 +248,7 @@ static const struct mlxbf_pmc_events mlxbf_pmc_trio_events_2[] = {
>  };
>  
>  static const struct mlxbf_pmc_events mlxbf_pmc_ecc_events[] = {
> +	{ 0x0, "DISABLE" },
>  	{ 0x100, "ECC_SINGLE_ERROR_CNT" },
>  	{ 0x104, "ECC_DOUBLE_ERROR_CNT" },
>  	{ 0x114, "SERR_INJ" },
> @@ -258,6 +261,7 @@ static const struct mlxbf_pmc_events mlxbf_pmc_ecc_events[] = {
>  };
>  
>  static const struct mlxbf_pmc_events mlxbf_pmc_mss_events[] = {
> +	{ 0x0, "DISABLE" },
>  	{ 0xc0, "RXREQ_MSS" },
>  	{ 0xc1, "RXDAT_MSS" },
>  	{ 0xc2, "TXRSP_MSS" },
> @@ -265,6 +269,7 @@ static const struct mlxbf_pmc_events mlxbf_pmc_mss_events[] = {
>  };
>  
>  static const struct mlxbf_pmc_events mlxbf_pmc_hnf_events[] = {
> +	{ 0x0, "DISABLE" },
>  	{ 0x45, "HNF_REQUESTS" },
>  	{ 0x46, "HNF_REJECTS" },
>  	{ 0x47, "ALL_BUSY" },
> @@ -323,6 +328,7 @@ static const struct mlxbf_pmc_events mlxbf_pmc_hnf_events[] = {
>  };
>  
>  static const struct mlxbf_pmc_events mlxbf_pmc_hnfnet_events[] = {
> +	{ 0x0, "DISABLE" },
>  	{ 0x12, "CDN_REQ" },
>  	{ 0x13, "DDN_REQ" },
>  	{ 0x14, "NDN_REQ" },
> @@ -892,7 +898,7 @@ static int mlxbf_pmc_read_event(int blk_num, uint32_t cnt_num, bool is_l3,
>  				uint64_t *result)
>  {
>  	uint32_t perfcfg_offset, perfval_offset;
> -	uint64_t perfmon_cfg, perfevt, perfctl;
> +	uint64_t perfmon_cfg, perfevt;
>  
>  	if (cnt_num >= pmc->block[blk_num].counters)
>  		return -EINVAL;
> @@ -904,25 +910,6 @@ static int mlxbf_pmc_read_event(int blk_num, uint32_t cnt_num, bool is_l3,
>  	perfval_offset = perfcfg_offset +
>  			 pmc->block[blk_num].counters * MLXBF_PMC_REG_SIZE;
>  
> -	/* Set counter in "read" mode */
> -	perfmon_cfg = FIELD_PREP(MLXBF_PMC_PERFMON_CONFIG_ADDR,
> -				 MLXBF_PMC_PERFCTL);
> -	perfmon_cfg |= FIELD_PREP(MLXBF_PMC_PERFMON_CONFIG_STROBE, 1);
> -	perfmon_cfg |= FIELD_PREP(MLXBF_PMC_PERFMON_CONFIG_WR_R_B, 0);
> -
> -	if (mlxbf_pmc_write(pmc->block[blk_num].mmio_base + perfcfg_offset,
> -			    MLXBF_PMC_WRITE_REG_64, perfmon_cfg))
> -		return -EFAULT;
> -
> -	/* Check if the counter is enabled */
> -
> -	if (mlxbf_pmc_read(pmc->block[blk_num].mmio_base + perfval_offset,
> -			   MLXBF_PMC_READ_REG_64, &perfctl))
> -		return -EFAULT;
> -
> -	if (!FIELD_GET(MLXBF_PMC_PERFCTL_EN0, perfctl))
> -		return -EINVAL;
> -
>  	/* Set counter in "read" mode */
>  	perfmon_cfg = FIELD_PREP(MLXBF_PMC_PERFMON_CONFIG_ADDR,
>  				 MLXBF_PMC_PERFEVT);

