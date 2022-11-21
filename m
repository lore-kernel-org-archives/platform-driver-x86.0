Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30721C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Nov 2022 10:00:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbiKUKAu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Nov 2022 05:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbiKUKAr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Nov 2022 05:00:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F032790A
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 01:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669024796;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dZZ6zgpefATpze9WYlIRp9zJc0FqIuf4c5sQsXmR1+M=;
        b=CtLN7J/s3nb6dPnVh5zmX6WXisgBIoOLbaGaOOjRHB0dAItZcj4DLxFXw+vy+bW+yMZdga
        PBnVclBeiwz0aHlsPcyoLWAEhqchmXlArfXPs6IdSKkJ2/q1ljzYUYpxCIMXVc6Ht/8cOs
        MnrIs88xZQTjdrV7N1yWnjO25piKl6s=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-146-8vuKCxsdP-yKLUx_H8-vPw-1; Mon, 21 Nov 2022 04:59:52 -0500
X-MC-Unique: 8vuKCxsdP-yKLUx_H8-vPw-1
Received: by mail-ej1-f69.google.com with SMTP id nb1-20020a1709071c8100b007ae4083d6f5so6308291ejc.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Nov 2022 01:59:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZZ6zgpefATpze9WYlIRp9zJc0FqIuf4c5sQsXmR1+M=;
        b=ePjm86Kp1xZ+GNhrgLVeJLHKGHX9gUnCkl8x9JcLI1GMsM+VTNyB+3wh8DzMxobbDB
         WaQpvQzeiSW/LGrOdAJqZGseycSAUA4yRTLsXkHdYn12p8dhBwp7OP95XZBW+HfBbUZb
         jNiYuk0o5QQuY83WmstkA5h1itTwCWskaQhh1KElB89shVh12HOvoBawlBbbVeHxxDfD
         RDgFgeGIDZSiZmk3pRT0cP17CSk6vAojoMhE7UbA1NRz0FgEHnt8DDaqLrDX79Yxs0CI
         rV/SBDU4WbcrA9gBECcxtRK4jZXFuEu6K+fhaKTxNJfrHqfigreUgngfxuDdKMrQwGd3
         1ZMA==
X-Gm-Message-State: ANoB5pnXRqeLHNXHfXzw/6kn8lfkpEpdiotj1Ac3MMhnpHEmS7y2S5K0
        ljD9CdY41FhicN4eLyVrUorK4uXHNNVM8n317ekPfJqoYrlZZ9bhBMSB9bTLonFzoaLIJAteg2S
        22/Zn4K9jdOEMaAA0ILnEzfvYfy5P8p8I0g==
X-Received: by 2002:a05:6402:b8c:b0:463:b8dc:893f with SMTP id cf12-20020a0564020b8c00b00463b8dc893fmr15951397edb.28.1669024791252;
        Mon, 21 Nov 2022 01:59:51 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6JN0bg6YWzIrI4NnUXEaKbK3Bu8IDRyO6VBRpl+3DEoIZv/T0KL9yZoyPQvsGmRXIoOscybQ==
X-Received: by 2002:a05:6402:b8c:b0:463:b8dc:893f with SMTP id cf12-20020a0564020b8c00b00463b8dc893fmr15951384edb.28.1669024791077;
        Mon, 21 Nov 2022 01:59:51 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id kx18-20020a170907775200b0078135401b9csm4857209ejc.130.2022.11.21.01.59.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:59:50 -0800 (PST)
Message-ID: <494ebac4-27f4-c240-688b-072b8083136e@redhat.com>
Date:   Mon, 21 Nov 2022 10:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH V2 0/9] Extend Intel On Demand (SDSi) support
Content-Language: en-US
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221119002343.1281885-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221119002343.1281885-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/19/22 01:23, David E. Box wrote:
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
> Link: https://github.com/intel/intel-sdsi/blob/master/os-interface.rst [1]

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

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
>  drivers/platform/x86/intel/sdsi.c             | 136 +++++-
>  tools/arch/x86/intel_sdsi/intel_sdsi.c        | 462 ++++++++++++++----
>  4 files changed, 516 insertions(+), 137 deletions(-)
> 
> 
> base-commit: 260ad3de718301ed8c22e28558e3a31c99f54cf6

