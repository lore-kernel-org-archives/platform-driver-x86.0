Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3243C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 19:13:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237516AbiFJTNz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 15:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiFJTNy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 15:13:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A80437654
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 12:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654888432;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xuSLX1JTtdpAX4DYqdYpSG+yP23REGXs72HpqSK69v4=;
        b=bOohtI4TLehz4pthuwMpmkBecyOIDYzRRQAviyUK9VQHjoMffeSyMQCfOgxa33kXA0saLP
        a0OpZ72bqhH9YviLMsTQV0gFJcQKrIdTDpIzc2SyxO4OvA+PBPpSsNOXx3fXpHB8BefEN1
        OvW0zZr279JKBUA/o/JQlnKsF35e/4s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-w_sgtNI_M2Cd-XkvqB671Q-1; Fri, 10 Jun 2022 15:13:51 -0400
X-MC-Unique: w_sgtNI_M2Cd-XkvqB671Q-1
Received: by mail-ej1-f70.google.com with SMTP id a9-20020a17090682c900b0070b513b9dc4so11159432ejy.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 12:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xuSLX1JTtdpAX4DYqdYpSG+yP23REGXs72HpqSK69v4=;
        b=1nQ9heA8P03RphqwHI0BBWyy8Lq9N8jPzWtJfLUlxCWkHGstwCSd/7LBwWI+cIr79l
         wmCvy38333ni/t+cbGuLCH7rbMWUTG28guw8LLI6FzB9kw3yKoDIsUrJYjJF0p4LuT2H
         85FLTnsIfEXTJiuYj9dH/qI3QtanEuzmxkaHxQh5yb0ounOot/d++Pa4SweYLXcjsjmr
         sxq81aU+7AKy+kDAtE00BB9WS8RJqXwvw2FfyzDAmrZzoZ+g5OALGEP0LJSC35Br9ba/
         T4NqKbN0zSx0trmhbiPXhzUV8I6apz5v9UnCb+UVWhWPJ4L4rDb3cEC1PqXXngel8b1Q
         w6mQ==
X-Gm-Message-State: AOAM532hvzcsVtMT3kVm4+cPThybd5MUr9tOF9tKhprY3Qb672yijT+O
        SFdJZmdsR6MLWoEBxFlTpAKMaiY4DGhz9YP+ww04v9/2n0T1lKEKgxH1pgzEl10LyH3qL7rA8RJ
        40v3BFZsisH769ywSCRh7/UiJziG8eeDgVQ==
X-Received: by 2002:a17:907:2b06:b0:711:e8cc:363e with SMTP id gc6-20020a1709072b0600b00711e8cc363emr16788173ejc.393.1654888430076;
        Fri, 10 Jun 2022 12:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdSO29aMwG+8vYqqhAdApIiUIVQ7e/lPvMNN7Y7ISYSe25wwLhEENxzhblvmQkWp18PthAug==
X-Received: by 2002:a17:907:2b06:b0:711:e8cc:363e with SMTP id gc6-20020a1709072b0600b00711e8cc363emr16788165ejc.393.1654888429902;
        Fri, 10 Jun 2022 12:13:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id s16-20020a50d490000000b004329ec63c42sm42205edi.25.2022.06.10.12.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 12:13:49 -0700 (PDT)
Message-ID: <5de67ae1-29f4-5538-1623-ea1d3bfd1ed1@redhat.com>
Date:   Fri, 10 Jun 2022 21:13:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/x86/intel: pmc: Support Intel Raptorlake P
Content-Language: en-US
To:     george.d.sworo@intel.com, david.e.box@intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20220602012617.20100-1-george.d.sworo@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220602012617.20100-1-george.d.sworo@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/2/22 03:26, george.d.sworo@intel.com wrote:
> From: George D Sworo <george.d.sworo@intel.com>
> 
> Add Raptorlake P to the list of the platforms that intel_pmc_core driver
> supports for pmc_core device. Raptorlake P PCH is based on Alderlake P
> PCH.
> 
> Signed-off-by: George D Sworo <george.d.sworo@intel.com>

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
>  drivers/platform/x86/intel/pmc/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index edaf22e5ae98..40183bda7894 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1912,6 +1912,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(ROCKETLAKE,		&tgl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L,		&tgl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE,		&adl_reg_map),
> +	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_P,        &tgl_reg_map),
>  	{}
>  };
>  

