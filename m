Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBABAC54EE9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 11:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbiISLlc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 07:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiISLla (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 07:41:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DAA712AEB
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663587689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NYrB5jXka4MSSRtLAagt7tKGvBVemiYpsuNtJkRXpFM=;
        b=eXTwVCHIkifpQd2+ce9mU5f//6gxuI+Rr6Y1A+EUokNkyPDvIBdUU0xWc98sbmJUfjef0t
        b/CcsppZsvFMiyS0074xj9vyXSVUWotyANYD8iw9C12qIaIythe0UX8C5/14kCxvDvpEL3
        lynH+C44btAE/n3Fy41AANBUchPJLJA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-13-0Hs3E_WYMlyRs9StAgTVzg-1; Mon, 19 Sep 2022 07:41:28 -0400
X-MC-Unique: 0Hs3E_WYMlyRs9StAgTVzg-1
Received: by mail-ed1-f72.google.com with SMTP id c6-20020a05640227c600b004521382116dso15142495ede.22
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 04:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=NYrB5jXka4MSSRtLAagt7tKGvBVemiYpsuNtJkRXpFM=;
        b=dpskBGH81ZqYUiFyRrUrjFr6rO9yp5SzEjyWu8KHOUPesTM+hkvKBtYQn+HF2jJLqn
         Hl73Uviz7H7n+oa3rEtHobMu9qvOjZY6Z7JXur0QxEJ7exmUwobtMFRnfyAaD/7Tdcnu
         f75cvVIH2zBgSxSvJibXgQWBniNm7sQ5+Y72BeFmyAyoQCWLGQNN1cFzhdqcWGIJ9bb0
         obHtcXec8MNAVH86PAOdvi50MHNkSXuz4TkwQ9rnpm49iJ7N8sG43EoRT3A0Y/UnAc1p
         aK3CjhmVds9DbLCGeRbNTU67usgG3Dbut1OI1oSFVeLKMZRLmOLLLmCnk78lkqFaJZym
         OsSg==
X-Gm-Message-State: ACrzQf3r21hl4iFzA/sf7DeRMAKym4seHcT5GoL7JSFmAypDO9CpOsJ6
        1nE+FFgkomkGM3ac8s8K7ph+mo7F9ETZxQz8vkdWqMCjQb8NVK4zfOk2V/R9JtV5IvPH2u3tTDB
        k/qCf9h/1kvefxfCjWePQwIYvl4FnTlXZSw==
X-Received: by 2002:a05:6402:e01:b0:442:dd7e:f49d with SMTP id h1-20020a0564020e0100b00442dd7ef49dmr14815592edh.355.1663587686949;
        Mon, 19 Sep 2022 04:41:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6vNL48ciwqGn+vRPvAPI7nBmFGOKzBvaNfpCQGIp249nFnSOGMgIDTjEzjxM51VUfJ1QpeGg==
X-Received: by 2002:a05:6402:e01:b0:442:dd7e:f49d with SMTP id h1-20020a0564020e0100b00442dd7ef49dmr14815584edh.355.1663587686807;
        Mon, 19 Sep 2022 04:41:26 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z15-20020a170906434f00b007413360a48fsm4381702ejm.50.2022.09.19.04.41.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 04:41:26 -0700 (PDT)
Message-ID: <3537fa63-9015-c63d-2321-a77062e24d6f@redhat.com>
Date:   Mon, 19 Sep 2022 12:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] platform/x86/intel: pmc/core: Add Raptor Lake
 support to pmc core driver
Content-Language: en-US
To:     Gayatri Kammela <gayatri.kammela@linux.intel.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, irenic.rajneesh@gmail.com,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
References: <20220912233307.409954-1-gayatri.kammela@linux.intel.com>
 <20220912233307.409954-2-gayatri.kammela@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220912233307.409954-2-gayatri.kammela@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hk,

On 9/13/22 00:33, Gayatri Kammela wrote:
> Add Raptor Lake client parts (both RPL and RPL_S) support to pmc core
> driver. Raptor Lake client parts reuse all the Alder Lake PCH IPs.
> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: David Box <david.e.box@intel.com>
> Acked-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Gayatri Kammela <gayatri.kammela@linux.intel.com>
> ---
> Changes since v1:
> 1) Added a dependency patch- ea902bcc1943f7539200ec464de3f54335588774 :
>  "x86/cpu: Add new Raptor Lake CPU model number".
> 2) Rebased the above patch on v6.0-rc1 with "Acked-by" from Hans and
>  Rajneesh.

I still cannot take this, since patch 1/2 is *already merged* through
another tree, so me cherry-picking it leads to potential conflicts.

As I have already explained twice you need to submit this upstream
throuh the same tree which has the original merge of patch 1/2.

You can tell the maintainer of that tree that I'm ok with merging this
through that maintainers tree and that that is what my Ack is for.

Regards,

Hans


> 
>  drivers/platform/x86/intel/pmc/core.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index a1fe1e0dcf4a..17ec5825d13d 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1914,6 +1914,8 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_N,		&tgl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE,		&adl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P,        &tgl_reg_map),
> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE,		&adl_reg_map),
> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S,	&adl_reg_map),
>  	{}
>  };
>  

