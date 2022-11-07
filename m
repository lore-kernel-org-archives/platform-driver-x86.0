Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D42C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 14:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbiKGO0O (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 09:26:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231667AbiKGOZs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 09:25:48 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4636424967
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 06:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667830743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U68CLR334kyZoY8qCweNZexBFdDOPZAvKMDK2Ti7NZQ=;
        b=asNR77Y6zU1VIRyqqaGu0iagp1x6OLN3FJR3NqlXzWWjlpkXcydyqgyq+PuRcfr4d86qQu
        r9yYD0FnBz3pxGCX3l8jjkgR31s9IiZByTa22larLbQ4I+iOntEuuqG3qK23NIdXfWiMjC
        hxEm3KRB42hr8nUnW3qx6jKUr7Yf+Kg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-320-6uwUUOMtMQuD_wakDBkSpA-1; Mon, 07 Nov 2022 09:19:02 -0500
X-MC-Unique: 6uwUUOMtMQuD_wakDBkSpA-1
Received: by mail-ej1-f71.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso6439021ejb.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Nov 2022 06:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U68CLR334kyZoY8qCweNZexBFdDOPZAvKMDK2Ti7NZQ=;
        b=f/c6j/90Ic/GjO+CGeCRxlAmp0RCjm+Y2tTO9G+6+el2caKZIHUqVWAn+XRI2dQNrj
         TEe6ZNiTMIZiMv4BZWUt7ocqcNiUu7E++Eh7nkPPORxqBME7aSzdbIrR+/WVccjRm3AQ
         fJjTbQg27VIlgDN9JbcmPJTy7KXWU96YNKQPaoIq0dQNTle27QArH2rj2eHE3BK6TV8r
         Tnck6dGo+RPCszz31nJsHrkhNPEDm8jIrFCNO+bPAxEs6DzZXFckVD376GEKGXgp3tFs
         XH5XkNNWI5gYXvktoR9UssoIA2eWKqVqmK0vqDp5c11x6ZhyZebmxaQ5wSn9MLl8NDHD
         7jAg==
X-Gm-Message-State: ACrzQf3O2npQQJ1hEDPHUa8ahDc/fp3X1fUB4Lp/fXmtyjhVSPmU2y4X
        snLp9K08Z4xmJj6BhaVwJeFmJJITnvUtQdzRjjlhsKmL20DgBAcDd0X9G0pTgw0ieJqrLT3aVoD
        N8GnnSSbfzxSY8etC1f7PAOLKj5b/YBFw9g==
X-Received: by 2002:a17:907:c24:b0:7ae:41b3:6a67 with SMTP id ga36-20020a1709070c2400b007ae41b36a67mr14385390ejc.254.1667830740695;
        Mon, 07 Nov 2022 06:19:00 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4BZOozD31Eg06Ce5Ylz6+N24tE2cVlXVTsExCcd7iPfGAYKjSORYml+179Jw5jY4rCmf4dCQ==
X-Received: by 2002:a17:907:c24:b0:7ae:41b3:6a67 with SMTP id ga36-20020a1709070c2400b007ae41b36a67mr14385371ejc.254.1667830740499;
        Mon, 07 Nov 2022 06:19:00 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id e18-20020a170906249200b0073d9a0d0cbcsm3487097ejb.72.2022.11.07.06.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 06:19:00 -0800 (PST)
Message-ID: <b10a7c4d-43a7-98f2-db65-8f907d4159da@redhat.com>
Date:   Mon, 7 Nov 2022 15:18:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 0/9] Extend Intel On Demand (SDSi) support
Content-Language: en-US
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com, srinivas.pandruvada@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101191023.4150315-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221101191023.4150315-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

On 11/1/22 20:10, David E. Box wrote:
> Intel Software Defined Silicon (SDSi) is now known as Intel On Demand. The
> following patches do the following:
> 
> 1. Identify the driver/tools as Intel On Demand. Only text descriptions are
> changed. Kconfig and filenames remain the same.
> 2. Perform some attribute cleanup by preventing the showing of files when
> features are not supported.
> 3. Adds support for a new GUID. GUIDs are used to identify the layout of
> the On Demand registers in sysfs. Layouts are described in the
> documentation on github [1].
> 4. Add support for reading On Demand meter certificates in sysfs.
> 5. The rest of the patches modify the existing tool to support discovery
> and reading of On Demand registers and the meter certificate.
> 
> [1] https://github.com/intel/intel-sdsi/blob/master/os-interface.rst

Sorry for the long silence, I have not done any pdx86 patch review
the last 2 weeks due to personal circumstances.

I will try to get this reviewed at the end of this week or the beginning
of next week.

Regards,

Hans




> 
> David E. Box (9):
>   platform/x86/intel/sdsi: Add Intel On Demand text
>   platform/x86/intel/sdsi: Hide attributes if hardware doesn't support
>   platform/x86/intel/sdsi: Support different GUIDs
>   platform/x86/intel/sdsi: Add meter certificate support
>   tools/arch/x86: intel_sdsi: Add support for reading state certificates
>   tools/arch/x86: intel_sdsi: Add Intel On Demand text
>   tools/arch/x86: intel_sdsi: Read more On Demand registers
>   tools/arch/x86: intel_sdsi: Add support for new GUID
>   tools/arch/x86: intel_sdsi: Add support for reading meter certificates
> 
>  .../ABI/testing/sysfs-driver-intel_sdsi       |  47 +-
>  drivers/platform/x86/intel/Kconfig            |   8 +-
>  drivers/platform/x86/intel/sdsi.c             | 134 ++++-
>  tools/arch/x86/intel_sdsi/intel_sdsi.c        | 458 ++++++++++++++----
>  4 files changed, 513 insertions(+), 134 deletions(-)
> 
> 
> base-commit: 225469d4acbcb873358d7618bad6e0203b67b964

