Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABA4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Apr 2022 14:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238083AbiD0OhY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Apr 2022 10:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238276AbiD0OhX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Apr 2022 10:37:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8EAF224F16
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651070047;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3DkvX0ilKmOtfRv4yBSGmcFhCLPyNBAdFDkeCqkWI38=;
        b=gViF8qZ4BuunV03Brw9YK8lBCp+3Ywot/LyAAOvvSShYlg2zfcxQTxrG3vPp5Fw4KLlhlY
        xcLxj5yT5LFmdaywyBnQjzAolG/NVVrI+HhS6/dwYHt0KxvCdUmzqhED55tJWMeLLwu6st
        AG23AHxQJnbTVXoEnxj7AZ458mRgQfY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-M56rlOF5MMaWKOzwVxKRCQ-1; Wed, 27 Apr 2022 10:34:06 -0400
X-MC-Unique: M56rlOF5MMaWKOzwVxKRCQ-1
Received: by mail-ej1-f70.google.com with SMTP id mp18-20020a1709071b1200b006e7f314ecb3so1257424ejc.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Apr 2022 07:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3DkvX0ilKmOtfRv4yBSGmcFhCLPyNBAdFDkeCqkWI38=;
        b=UiVugaJJS+WGMrLlRISENWzCCO0BzSE2sTUP08++9DNpuM53ZuIqZZKEKVFqHXaxdQ
         wyGHxJQ9MsBkmFzMGwgUzkihH2lyWsvpQIyIqHexXMCCgsy1wjzT02KVRYPZQPHirCBv
         GoJ+HLFTUjvMTxFdDTaf0PwMyJTTThlG8crajxjI/keNUTfl90H9fCx+pLX3ELVmaAv2
         L69GexJvkHzf/NzZlT1/GUrYDrH9BfegXBKOo9w8uzqW+ymbWHVelX614GAW0UPopEOU
         tTIBUnU5WEvxd3yxOhJ9SWMwYwNL1jCBNBjIxC2mIHJJONGJLOfmbvs3Nc4LlKW9Jao7
         UZBw==
X-Gm-Message-State: AOAM532kbrb6ALPdJRCmllkE7W/RLKP9kZfJz7ozJGCF1HcuDQKw2Dqy
        o8bduQwEsRRXRwlVq82vzj54qAqPYZy4oVdxPTLcHWQsdKsz2Xd0ExMfaqt02r+lC8yXovUjrQH
        6zP2lSSblg1RnM060qdiPBXQsx1jabacDuw==
X-Received: by 2002:a05:6402:34d2:b0:423:e6c4:3e9 with SMTP id w18-20020a05640234d200b00423e6c403e9mr31369770edc.372.1651070044872;
        Wed, 27 Apr 2022 07:34:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQdK7t3/Kg/gpQ+TC6NEm38u6Mm3Kc3AdoHzfvlT7n/SWMPjPngOiwuCqfcoL3rT9E65Gm0Q==
X-Received: by 2002:a05:6402:34d2:b0:423:e6c4:3e9 with SMTP id w18-20020a05640234d200b00423e6c403e9mr31369739edc.372.1651070044658;
        Wed, 27 Apr 2022 07:34:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o14-20020a170906774e00b006d5b915f27dsm6814823ejn.169.2022.04.27.07.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 07:34:04 -0700 (PDT)
Message-ID: <25fbfb63-3540-2752-6070-37a69a21eba1@redhat.com>
Date:   Wed, 27 Apr 2022 16:34:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/3] platform/x86/intel/sdsi: Fixes for 5.18
Content-Language: en-US
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220420155622.1763633-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220420155622.1763633-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/20/22 17:56, David E. Box wrote:
> The following patches provide fixes for the Intel SDSi driver based on
> firmware updates and for one driver bug.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans






> 
> David E. Box (3):
>   platform/x86/intel/sdsi: Handle leaky bucket
>   platform/x86/intel/sdsi: Poll on ready bit for writes
>   platform/x86/intel/sdsi: Fix bug in multi packet reads
> 
>  drivers/platform/x86/intel/sdsi.c | 44 +++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 
> 
> base-commit: b2d229d4ddb17db541098b83524d901257e93845

