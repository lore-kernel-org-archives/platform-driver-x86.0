Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85098C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Nov 2022 13:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240275AbiKQNx4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Nov 2022 08:53:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240225AbiKQNxv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 08:53:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D80140902
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668693172;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=O3NFJ14cOnexLb0XvshSqblKsvxT0T4qoUE9znoObQ4=;
        b=ffLA9WnjBTEN+ETNAAJ5d/niuDgFd/5R+tqcfsW1x3JBk7oWS+9dlMeWArZx7nDOX/RkMg
        MBVFwA0orHHEA87U6KRZm9yWkZJX6+AAI+hTfz3DSq+Su60kEX0JvAC/iF/tMxHQunXPdH
        VmWwRqtsEtoCPmk/KTJTfodW586GiFs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-131-1pbikNBMPkqH6jgOUQP4cQ-1; Thu, 17 Nov 2022 08:52:51 -0500
X-MC-Unique: 1pbikNBMPkqH6jgOUQP4cQ-1
Received: by mail-ej1-f69.google.com with SMTP id qw20-20020a1709066a1400b007af13652c92so1146054ejc.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 05:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3NFJ14cOnexLb0XvshSqblKsvxT0T4qoUE9znoObQ4=;
        b=j1J0l0RSW9UH5S8K6gkqdNM3GSVEewmP5DiGkxK3dFPnc9nkSTJWBxe3ii5iMjeSGT
         bixqpzWxNOb92Tl5L91EpDdOkoa+FVQWivdCrW6eixig475QhUfdu6dJds682VpBF9SO
         BPBXTKAdRhzTUGyZl6MrnGokE97Ep5bI0NMqm2bRcaUTkBFG0VC4NDXi6UslFDyq/pTw
         a235vR3ZbhIea9BwQoQB8fpJBA7G/PpSSzuH1cwDkYfQuOxtOOSgy2PLHSdqVYWvPm0v
         OcGvuveUY3Nmf4QgcqZZFxAnYfJaPOYr0YH5Iry4ylaJ/+hOT2mfsLNuGTaKetUIfgOJ
         OKWw==
X-Gm-Message-State: ANoB5plXsgYTlpcTFUSBh0ENOrkaqMq6mJKU81LE629Cwz8xh/HLrs2k
        NTFJjLmoCBlYXb8SfwMYy5qjWy1rgWMLWy6J5sXO+WKzazjLIeyLq5o8pWFT/pFtuHmd+6U05WN
        XpRNaqGPRM4wSGo0CxsmbhpdBzEREUAesAg==
X-Received: by 2002:a05:6402:150:b0:468:fdc3:6b44 with SMTP id s16-20020a056402015000b00468fdc36b44mr51406edu.388.1668693170176;
        Thu, 17 Nov 2022 05:52:50 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5Voom2AzZyJRs13uuMx9ot0J31BZ/uqFUlQIAA3yL3In4EkbbyX26sFHXltVhDIB9CMBn2eA==
X-Received: by 2002:a05:6402:150:b0:468:fdc3:6b44 with SMTP id s16-20020a056402015000b00468fdc36b44mr51397edu.388.1668693170012;
        Thu, 17 Nov 2022 05:52:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k9-20020a17090632c900b0079e11b8e891sm392717ejk.125.2022.11.17.05.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 05:52:49 -0800 (PST)
Message-ID: <b7a935ab-9ef9-2823-64ef-af5b91dfa4b9@redhat.com>
Date:   Thu, 17 Nov 2022 14:52:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 7/9] tools/arch/x86: intel_sdsi: Read more On Demand
 registers
Content-Language: en-US, nl
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com, srinivas.pandruvada@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101191023.4150315-1-david.e.box@linux.intel.com>
 <20221101191023.4150315-8-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221101191023.4150315-8-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/1/22 20:10, David E. Box wrote:
> Add decoding of the following On Demand register fields:
> 
> 1. NVRAM content authorization error status
> 2. Enabled features: telemetry and attestation
> 3. Key provisioning status
> 4. NVRAM update limit
> 5. PCU_CR3_CAPID_CFG
> 
> Link: https://github.com/intel/intel-sdsi/blob/master/state-certificate-encoding.rst
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  tools/arch/x86/intel_sdsi/intel_sdsi.c | 50 +++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/arch/x86/intel_sdsi/intel_sdsi.c b/tools/arch/x86/intel_sdsi/intel_sdsi.c
> index 3718bd0c05cb..01b5f9994e11 100644
> --- a/tools/arch/x86/intel_sdsi/intel_sdsi.c
> +++ b/tools/arch/x86/intel_sdsi/intel_sdsi.c
> @@ -44,10 +44,28 @@
>  #define __round_mask(x, y) ((__typeof__(x))((y) - 1))
>  #define round_up(x, y) ((((x) - 1) | __round_mask(x, y)) + 1)
>  
> +struct nvram_content_auth_err_sts {
> +	uint64_t reserved:3;
> +	uint64_t sdsi_content_auth_err:1;
> +	uint64_t reserved1:1;
> +	uint64_t sdsi_metering_auth_err:1;
> +	uint64_t reserved2:58;
> +};
> +
>  struct enabled_features {
>  	uint64_t reserved:3;
>  	uint64_t sdsi:1;
> -	uint64_t reserved1:60;
> +	uint64_t reserved1:8;
> +	uint64_t attestation:1;
> +	uint64_t reserved2:13;
> +	uint64_t metering:1;
> +	uint64_t reserved3:37;
> +};
> +
> +struct key_provision_status {
> +	uint64_t reserved:1;
> +	uint64_t license_key_provisioned:1;
> +	uint64_t reserved2:62;
>  };
>  
>  struct auth_fail_count {
> @@ -65,15 +83,23 @@ struct availability {
>  	uint64_t reserved2:10;
>  };
>  
> +struct nvram_update_limit {
> +	uint64_t reserved:12;
> +	uint64_t sdsi_50_pct:1;
> +	uint64_t sdsi_75_pct:1;
> +	uint64_t sdsi_90_pct:1;
> +	uint64_t reserved2:49;
> +};
> +
>  struct sdsi_regs {
>  	uint64_t ppin;
> -	uint64_t reserved;
> +	struct nvram_content_auth_err_sts auth_err_sts;
>  	struct enabled_features en_features;
> -	uint64_t reserved1;
> +	struct key_provision_status key_prov_sts;
>  	struct auth_fail_count auth_fail_count;
>  	struct availability prov_avail;
> -	uint64_t reserved2;
> -	uint64_t reserved3;
> +	struct nvram_update_limit limits;
> +	uint64_t pcu_cr3_capid_cfg;
>  	uint64_t socket_id;
>  };
>  
> @@ -205,8 +231,18 @@ static int sdsi_read_reg(struct sdsi_dev *s)
>  	printf("Socket information for device %s\n", s->dev_name);
>  	printf("\n");
>  	printf("PPIN:                           0x%lx\n", s->regs.ppin);
> +	printf("NVRAM Content Authorization Error Status\n");
> +	printf("    SDSi Auth Err Sts:          %s\n", !!s->regs.auth_err_sts.sdsi_content_auth_err ? "Error" : "Okay");
> +
> +	if (!!s->regs.en_features.metering)
> +		printf("    Metering Auth Err Sts:      %s\n", !!s->regs.auth_err_sts.sdsi_metering_auth_err ? "Error" : "Okay");
> +
>  	printf("Enabled Features\n");
>  	printf("    On Demand:                  %s\n", !!s->regs.en_features.sdsi ? "Enabled" : "Disabled");
> +	printf("    Attestation:                %s\n", !!s->regs.en_features.attestation ? "Enabled" : "Disabled");
> +	printf("    On Demand:                  %s\n", !!s->regs.en_features.sdsi ? "Enabled" : "Disabled");
> +	printf("    Metering:                   %s\n", !!s->regs.en_features.metering ? "Enabled" : "Disabled");
> +	printf("License Key (AKC) Provisioned:  %s\n", !!s->regs.key_prov_sts.license_key_provisioned ? "Yes" : "No");
>  	printf("Authorization Failure Count\n");
>  	printf("    AKC Failure Count:          %d\n", s->regs.auth_fail_count.key_failure_count);
>  	printf("    AKC Failure Threshold:      %d\n", s->regs.auth_fail_count.key_failure_threshold);
> @@ -215,6 +251,10 @@ static int sdsi_read_reg(struct sdsi_dev *s)
>  	printf("Provisioning Availability\n");
>  	printf("    Updates Available:          %d\n", s->regs.prov_avail.available);
>  	printf("    Updates Threshold:          %d\n", s->regs.prov_avail.threshold);
> +	printf("NVRAM Udate Limit\n");
> +	printf("    50%% Limit Reached:         %s\n", !!s->regs.limits.sdsi_50_pct ? "Yes" : "No");
> +	printf("    75%% Limit Reached:         %s\n", !!s->regs.limits.sdsi_75_pct ? "Yes" : "No");
> +	printf("    90%% Limit Reached:         %s\n", !!s->regs.limits.sdsi_90_pct ? "Yes" : "No");
>  	printf("Socket ID:                      %ld\n", s->regs.socket_id & 0xF);
>  
>  	return 0;

