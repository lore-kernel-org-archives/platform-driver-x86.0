Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0CBC7618D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Apr 2023 10:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237415AbjDFK7M (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Apr 2023 06:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237419AbjDFK7L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 06:59:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAB31703
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680778704;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sMJGZ0wM6SmRKKSmXFuC9u44rhIR7nr561NDFm1Xz2g=;
        b=CLIx2w8r1ApkdKolo4g+G+4S8Nkx1GTDsQu2sDOvYd5PE9jkIJz+JjEBw7NyzdXApaV40f
        dtMILOAPCBmWv/NzgSoG5F/NFLRfBO7TY/ROrDQSXSogd8XFD1s5x0dFLG+jhnR8Cu5rin
        m4RGP9VNDpKJ+dHiHNn457dJU4qrFIY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-8lqfrBC3Mw-tLquUDZHBEg-1; Thu, 06 Apr 2023 06:58:23 -0400
X-MC-Unique: 8lqfrBC3Mw-tLquUDZHBEg-1
Received: by mail-ed1-f72.google.com with SMTP id x35-20020a50baa6000000b005021d1b1e9eso53003822ede.13
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Apr 2023 03:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680778702; x=1683370702;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMJGZ0wM6SmRKKSmXFuC9u44rhIR7nr561NDFm1Xz2g=;
        b=Xz0IWC2+fNsfmJfi1BCZdl6qWqOnS37T2RyHtoOmLwNsTSrJj900Pm8kJWf3gTWr2Y
         S9mUVpiEWJXJ9p8rRiuVwAyUNenhYZc6J8ABZs/u2Mym58D/Z79yu2ypMtPySVfCGuP2
         tQadj5Jzg6kiRJZ6XVboQc9cOWaW4RxXHDpA8rjd4T1crkPxRqAyJysZjBHKHmeKVEAK
         3W0ILu1ubbfA//SKd4RUCQrp3L9sGO+WtW4LlgFu7kTV/vk3oLlvdT4X7hq0KEV5oMr/
         s1hCJe/YN/fGvM42vGEReaWLzicZ59oFPjamVP1uL6Oes1JJoV/42r5jb7Robvo/6auf
         GFWQ==
X-Gm-Message-State: AAQBX9cnG7oatyfdd0QRJP76y3nFJR4UX6d7hn8JjFFxIP5QizAjMpjD
        V89J6Fj7ToLVzbwS2UiCtscfEo/7Lt2L5IMi7savfWpohJZPitbKbYOsYEdTC5bwhbUDPbLfcFG
        5LCXkkBYkgjvJgOUPhYvuf2OdgrleAiSO2w==
X-Received: by 2002:a17:906:804b:b0:930:e3a0:8636 with SMTP id x11-20020a170906804b00b00930e3a08636mr5988397ejw.57.1680778701997;
        Thu, 06 Apr 2023 03:58:21 -0700 (PDT)
X-Google-Smtp-Source: AKy350aoETtwoyere+ZTuvC9Y59fWPxWtLXznfKvZL7UpexVQFUpgNMKCuF81n0tTrFw+RdIw1B20w==
X-Received: by 2002:a17:906:804b:b0:930:e3a0:8636 with SMTP id x11-20020a170906804b00b00930e3a08636mr5988389ejw.57.1680778701721;
        Thu, 06 Apr 2023 03:58:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090671d100b0092973e209f2sm660173ejk.109.2023.04.06.03.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 03:58:21 -0700 (PDT)
Message-ID: <efcdc3fe-de74-0f0d-d9d5-3249fc1d5d53@redhat.com>
Date:   Thu, 6 Apr 2023 12:58:20 +0200
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

Hi Srinivas,

On 3/30/23 16:59, Srinivas Pandruvada wrote:
> Make Intel uncore frequency driver support to client processor starting
> from Alder Lake.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

I assume that this is independent from the
"[PATCH] platform/x86/intel-uncore-freq: Uncore frequency control via TPMI"
changes ?

(just double checking before I merge this).

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

