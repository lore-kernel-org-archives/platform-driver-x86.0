Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04167C00140
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Aug 2022 08:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235448AbiHXIib (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Aug 2022 04:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235794AbiHXIi1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 04:38:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C848E6E2C0
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 01:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661330298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fRRqQQTvaTM5MPKagBjtemEscg8NIzg/XDx14VqBtBM=;
        b=duYwpVkyszLXQmqMhx4MQGybUVU2IMs9QFw7CS8ESXiCr22lT5vyZcZoPLRu1PpeFrwn4T
        Xcov3J8XcjE7vj6Dl6t+4hy02mffduyX+x9RPj1aC6cuM/p62gnPfoawOc9ZhNW11IwNN4
        oVElp6xwiHcvo696PQ5ezLoW/Q8WS4c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-5-nDc0X98MNvSt_ZmdAhb-qA-1; Wed, 24 Aug 2022 04:38:17 -0400
X-MC-Unique: nDc0X98MNvSt_ZmdAhb-qA-1
Received: by mail-ej1-f69.google.com with SMTP id sb14-20020a1709076d8e00b0073d48a10e10so3816263ejc.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 01:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=fRRqQQTvaTM5MPKagBjtemEscg8NIzg/XDx14VqBtBM=;
        b=hWPa+524aHtCqw8T3xd3ltWgzrk8NBJUM7S7/HsBTsiS93AyZmhNMGvmsx94Zva6tp
         Zyz9UdtYcfQA+7Ps+G3E8bpQGaIT1nvKTWO2Ohh4YZakoOqoCHutH/ma4S2SgtZUYSgK
         +rCQP9mvGw1+BwIW+WzHDx06eVVbiSS/meLZAgfUQAsAgjX4OYGekaZiltKT32DnU5VN
         DtG0FbDTJF05ZeVio1H9Xus2E7xshBoCJLno+08t9DZRqd3w9y51Ft7MEmTINqngic2v
         UfsUcu/nnb0qocr9r2cS6eDbaLT4spkWjsjaIpV62gL9Omwakjmxvig2TgdqZQ2dzACj
         bZCQ==
X-Gm-Message-State: ACgBeo3EuexokXSjygUtJ0N4rZJEcNpMTXzg6X9tNxE3SHyP64Y6z9Dt
        BY8e5JB0rY8pU/mGDgKshcwVTwu2ELv+cOcA+2OqV4Rmzixpv7rB14CiC1t3NiVIxUHDLVv37YF
        MmkgmEo4sLIx6toc39s9mxUpCk0NGo/Vw2A==
X-Received: by 2002:a17:907:761a:b0:73d:8662:3a00 with SMTP id jx26-20020a170907761a00b0073d86623a00mr2203035ejc.550.1661330296607;
        Wed, 24 Aug 2022 01:38:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6XvkArqr0kKSPTTbJFQskCFrT7EWcUlk81BciCJL3t0YUInlF0QTMeBX85jjPw3iIVTsxUEw==
X-Received: by 2002:a17:907:761a:b0:73d:8662:3a00 with SMTP id jx26-20020a170907761a00b0073d86623a00mr2203024ejc.550.1661330296357;
        Wed, 24 Aug 2022 01:38:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b3-20020a17090630c300b0073d84a321c8sm824063ejb.166.2022.08.24.01.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 01:38:15 -0700 (PDT)
Message-ID: <a9b5123a-997f-7405-06f0-fa597da79612@redhat.com>
Date:   Wed, 24 Aug 2022 10:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] platform/x86/amd/pmf: Fix clang unused variable
 warning
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        Nathan Chancellor <nathan@kernel.org>
References: <20220822062917.4061503-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220822062917.4061503-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/22/22 08:29, Shyam Sundar S K wrote:
> variable 'mode' is used uninitialized whenever switch default is taken
> in sps.c which leads to the following clang warning.
> 
> ---
> drivers/platform/x86/amd/pmf/sps.c:96:2: error: variable 'mode' is used uninitialized whenever switch default is taken [-Werror,-Wsometimes-uninitialized]
>           default:
>           ^~~~~~~
>   drivers/platform/x86/amd/pmf/sps.c:101:9: note: uninitialized use occurs here
>           return mode;
>                  ^~~~
>   drivers/platform/x86/amd/pmf/sps.c:84:9: note: initialize the variable 'mode' to silence this warning
>           u8 mode;
>                  ^
>                   = '\0'
>   1 error generated.
> ---
> 
> Fix it by returning -EOPNOTSUPP in default case and also change the return
> type of the function amd_pmf_get_pprof_modes() to keep it similar like
> other drivers which implement platform_profile.
> 
> Fixes: 4c71ae414474 ("platform/x86/amd/pmf: Add support SPS PMF feature")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to
the platform-drivers-x86-amd-pmf branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=platform-drivers-x86-amd-pmf

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> v2:
> - Handle return codes for all amd_pmf_get_pprof_modes() callers.
> 
>  drivers/platform/x86/amd/pmf/auto-mode.c |  8 ++++++--
>  drivers/platform/x86/amd/pmf/core.c      |  3 +++
>  drivers/platform/x86/amd/pmf/pmf.h       |  4 ++--
>  drivers/platform/x86/amd/pmf/sps.c       | 11 +++++++----
>  4 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/auto-mode.c b/drivers/platform/x86/amd/pmf/auto-mode.c
> index 368964d885a2..644af42e07cf 100644
> --- a/drivers/platform/x86/amd/pmf/auto-mode.c
> +++ b/drivers/platform/x86/amd/pmf/auto-mode.c
> @@ -264,7 +264,7 @@ static void amd_pmf_load_defaults_auto_mode(struct amd_pmf_dev *dev)
>  	dev->socket_power_history_idx = -1;
>  }
>  
> -void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
> +int amd_pmf_reset_amt(struct amd_pmf_dev *dev)
>  {
>  	/*
>  	 * OEM BIOS implementation guide says that if the auto mode is enabled
> @@ -275,11 +275,15 @@ void amd_pmf_reset_amt(struct amd_pmf_dev *dev)
>  	 */
>  
>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> -		u8 mode = amd_pmf_get_pprof_modes(dev);
> +		int mode = amd_pmf_get_pprof_modes(dev);
> +
> +		if (mode < 0)
> +			return mode;
>  
>  		dev_dbg(dev->dev, "resetting AMT thermals\n");
>  		amd_pmf_update_slider(dev, SLIDER_OP_SET, mode, NULL);
>  	}
> +	return 0;
>  }
>  
>  void amd_pmf_handle_amt(struct amd_pmf_dev *dev)
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index e46d63aa51b8..a675ca969331 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -65,6 +65,9 @@ static int current_power_limits_show(struct seq_file *seq, void *unused)
>  	int mode, src = 0;
>  
>  	mode = amd_pmf_get_pprof_modes(dev);
> +	if (mode < 0)
> +		return mode;
> +
>  	src = amd_pmf_get_power_source();
>  	amd_pmf_update_slider(dev, SLIDER_OP_GET, mode, &table);
>  	seq_printf(seq, "spl:%u fppt:%u sppt:%u sppt_apu_only:%u stt_min:%u stt[APU]:%u stt[HS2]: %u\n",
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 7613ed2ef6e3..0a72a395c2ef 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -303,7 +303,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
>  int amd_pmf_get_power_source(void);
>  
>  /* SPS Layer */
> -u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
> +int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
>  void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
>  			   struct amd_pmf_static_slider_granular *table);
>  int amd_pmf_init_sps(struct amd_pmf_dev *dev);
> @@ -322,6 +322,6 @@ void amd_pmf_trans_automode(struct amd_pmf_dev *dev, int socket_power, ktime_t t
>  int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req);
>  
>  void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
> -void amd_pmf_reset_amt(struct amd_pmf_dev *dev);
> +int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
>  void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
>  #endif /* PMF_H */
> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
> index 8923e29cc6ca..dba7e36962dc 100644
> --- a/drivers/platform/x86/amd/pmf/sps.c
> +++ b/drivers/platform/x86/amd/pmf/sps.c
> @@ -79,9 +79,9 @@ static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
>  	return 0;
>  }
>  
> -u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
> +int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>  {
> -	u8 mode;
> +	int mode;
>  
>  	switch (pmf->current_profile) {
>  	case PLATFORM_PROFILE_PERFORMANCE:
> @@ -95,7 +95,7 @@ u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>  		break;
>  	default:
>  		dev_err(pmf->dev, "Unknown Platform Profile.\n");
> -		break;
> +		return -EOPNOTSUPP;
>  	}
>  
>  	return mode;
> @@ -105,10 +105,13 @@ static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
>  			       enum platform_profile_option profile)
>  {
>  	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
> -	u8 mode;
> +	int mode;
>  
>  	pmf->current_profile = profile;
>  	mode = amd_pmf_get_pprof_modes(pmf);
> +	if (mode < 0)
> +		return mode;
> +
>  	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
>  	return 0;
>  }

