Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B173C77B61
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 Apr 2023 13:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240854AbjDGN3W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 7 Apr 2023 09:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240859AbjDGN3H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2023 09:29:07 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 214D77ED8
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 Apr 2023 06:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680874102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Fb/gXjXq+a+avDKrHo1L2LCNyXQObTnjNH+xOJlnmkU=;
        b=hxFn76CujjXeH2C4uxsDQW8jiprQjMyGCyW1z/6TQGMYoUUeUuy43PurUYJDt2UyuDa4wh
        Wx3IM7lckCE4AWK2QSccnuSOsbKR491pqZcc99HTZ7naxc8soMzHfZ2ppmt+Fq0OwkF8n6
        xr9EXhANMcKApvbdoHbrnWwNX+5/BdQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-IpvV_IOUNUaK2TBozm4-7A-1; Fri, 07 Apr 2023 09:28:20 -0400
X-MC-Unique: IpvV_IOUNUaK2TBozm4-7A-1
Received: by mail-ej1-f72.google.com with SMTP id h20-20020a1709070b1400b009333eaeb2b3so1565464ejl.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Apr 2023 06:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680874099; x=1683466099;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fb/gXjXq+a+avDKrHo1L2LCNyXQObTnjNH+xOJlnmkU=;
        b=R8Grl2NVpLbbyRCXWgnFq9aiEaniNHYSwX5vtOcLj8FWqvusGADDJtpJ1sYmX8eahV
         MrQU9JFhW8nTFxtRQOjJ0w17Uh/AlnhiZprkdsqdhxApDqe2rly458jBGjhSHvV5N3Ij
         sIUekUrVrx+Zb49igoEBmNm/RANu38E1RvttDMrZavEkG7SbjmOXIe2dQi3CwPVcLHr2
         o827BgTKFTrn2DnqipLczgX95KnOmqkPmXFlivNXitHHeNqkQJhQF8fcCL0aiJ2oI11Z
         mKJI+7YLG3kTwGK84q/KJKcyfldqqt68LlFfUKZMM1hQ+bFcN4N7mDrRGg+4MnctbCOa
         sNMA==
X-Gm-Message-State: AAQBX9fq0thhckvcUKxP+Zcc4Jj3GpHyvrTDEQEsfdnZM1MUKH0veSrK
        mXVdFuN9pWsAWPbRp7su+kVXD+9bizf/rdaqfoFSImUwDl7JZFgAu4n6qhTth8pyyVf4ahjgKIp
        NnaAVcEvVApxWZd4hFVvfKYKOS3i2xcmwNA==
X-Received: by 2002:a17:907:2c75:b0:92c:5f1:8288 with SMTP id ib21-20020a1709072c7500b0092c05f18288mr2206372ejc.13.1680874099632;
        Fri, 07 Apr 2023 06:28:19 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ylw9trW6c6Q5GE7em27RpA4qj8eK0s6lHEwkDW+HYX888mkXsEtwuoWLCA18zXUYQR69lvvg==
X-Received: by 2002:a17:907:2c75:b0:92c:5f1:8288 with SMTP id ib21-20020a1709072c7500b0092c05f18288mr2206354ejc.13.1680874099384;
        Fri, 07 Apr 2023 06:28:19 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id hr15-20020a1709073f8f00b009477ba90a85sm2049827ejc.69.2023.04.07.06.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 06:28:18 -0700 (PDT)
Message-ID: <b705ba9b-5002-e884-6527-e45b6a6fa678@redhat.com>
Date:   Fri, 7 Apr 2023 15:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: intel-uncore-freq: Add client processors
Content-Language: en-US, nl
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230330145939.1022261-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230330145939.1022261-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/30/23 16:59, Srinivas Pandruvada wrote:
> Make Intel uncore frequency driver support to client processor starting
> from Alder Lake.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

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
>  .../platform/x86/intel/uncore-frequency/uncore-frequency.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> index 00ac7e381441..32e2515ee366 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> @@ -204,6 +204,13 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_D,	NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(SAPPHIRERAPIDS_X, NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(EMERALDRAPIDS_X, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE, NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE_L, NULL),
>  	{}
>  };
>  MODULE_DEVICE_TABLE(x86cpu, intel_uncore_cpu_ids);

