Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25269C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Jul 2022 09:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbiGBJNv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Jul 2022 05:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiGBJNu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Jul 2022 05:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 056DC1B7BF
        for <platform-driver-x86@vger.kernel.org>; Sat,  2 Jul 2022 02:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656753228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wFmB2k60UuW2i0Ht+Cef4lERIPyUH6lPw9UpjnL8iPw=;
        b=BuDUVvTzV6aCIRdEJGQ2wNL/W4QQ/MGW0FDkOSh9blYzf2Mlvb0Y9So8V7E+F0Th36TKqh
        vE3NSLQ5Yn081UnLecs0Bl/x11JwzILZeJ5w+LwZWG0R3VtOKMredAALxzKTmPuD5FJbBD
        btw7p6Ck+qMmTf+LupImiDrVqmkeP7w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-RaPhf5XXNMKtg0T_5oEigg-1; Sat, 02 Jul 2022 05:13:47 -0400
X-MC-Unique: RaPhf5XXNMKtg0T_5oEigg-1
Received: by mail-ed1-f69.google.com with SMTP id i9-20020a05640242c900b004373cd1c4d5so3359422edc.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 02 Jul 2022 02:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wFmB2k60UuW2i0Ht+Cef4lERIPyUH6lPw9UpjnL8iPw=;
        b=Etqu/88h8ApME45CqwjWxX8l6nek2DrOOGeNXOlB4SqgTrE/NEm9uwImZktERx3Goa
         z1mAog8XLNT7m3aKa9N56axou1AvUtx5SepxGTIMHYVMl9doQAlafJtqZ+DSksqIqZwL
         gF1YF5y+IdNMPpAGxnvA3J3HvMXUe6tyh9yE4BkCl6xuF95jxaunAOwwsoIrpmGnVyXL
         fR411Jyp3UjcakKDFHbOTAZfAd0ukvXuq0queSJlgM0tRDGKhxfS2bsoA/6k07eQEzBK
         kpPKdg2kk8+Vd69fvNFZxn+kQ5lu0Y66DnhHbRklfufvVnGCEtSvZTCo0reSIfW8A/1T
         /jmA==
X-Gm-Message-State: AJIora8n5l9lwAgwOoplGWH2ufYDAi4UmKIgSxkobBBwrw3zKDoJEm9M
        pkwy79pNHMEaOhW00qNIN5zFbSEYrWO64mgTD/Qdjo4UXJWYNebNxBpv6WFpqP1UJl/7ncsTcWI
        7SSDfM/VeYbUecFToHlpylFMeshEAAGbY/w==
X-Received: by 2002:a17:906:af12:b0:722:f9f0:cb75 with SMTP id lx18-20020a170906af1200b00722f9f0cb75mr18376893ejb.643.1656753226474;
        Sat, 02 Jul 2022 02:13:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tzOdQ1+rNU4RL6J1uNPu/GPGrF4Z+Slx9/SINFUrbq42gOmhP98HTwRwIETyi1VTR+i837DA==
X-Received: by 2002:a17:906:af12:b0:722:f9f0:cb75 with SMTP id lx18-20020a170906af1200b00722f9f0cb75mr18376888ejb.643.1656753226290;
        Sat, 02 Jul 2022 02:13:46 -0700 (PDT)
Received: from [192.168.43.127] ([109.38.147.70])
        by smtp.gmail.com with ESMTPSA id w14-20020a056402128e00b004356894a3f8sm16463809edv.89.2022.07.02.02.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Jul 2022 02:13:45 -0700 (PDT)
Message-ID: <226acf2e-19a3-6ece-c353-793eb6995549@redhat.com>
Date:   Sat, 2 Jul 2022 11:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/4] platform/surface: Add support for tablet mode switch
 via Surface Aggregator Module
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220624183642.910893-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220624183642.910893-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/24/22 20:36, Maximilian Luz wrote:
> This series adds a driver providing a tablet mode switch on the Surface
> Pro 8, Surface Pro X, and Surface Laptop Studio.
> 
> These devices provide posture information via subsystems of the Surface
> Aggregator Module (SAM; embedded controller). While the specific
> subsystems used for the Pro and Laptop models differ, large parts of the
> respective subsystem drivers would be equal. Therefore, we essentially
> provide a generic framework for tablet-mode switches via the Surface
> Aggregator module and use that to implement specific support for the KIP
> and POS subsystems used on the aforementioned devices.
> 
> In addition, this series first introduces some helper macros for
> synchronous stack-allocated SAM requests used in the subsequent patches,
> extending the already existing ones.
> 
> Further, this series adds the respective firmware nodes to the Surface
> Aggregator Registry.

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
> Maximilian Luz (4):
>   platform/surface: aggregator: Add helper macros for requests with
>     argument and return value
>   platform/surface: Add KIP/POS tablet-mode switch driver
>   platform/surface: aggregator_registry: Add support for tablet mode
>     switch on Surface Pro 8
>   platform/surface: aggregator_registry: Add support for tablet mode
>     switch on Surface Laptop Studio
> 
>  .../sysfs-bus-surface_aggregator-tabletsw     |  57 ++
>  MAINTAINERS                                   |   6 +
>  drivers/platform/surface/Kconfig              |  23 +
>  drivers/platform/surface/Makefile             |   1 +
>  .../surface/surface_aggregator_registry.c     |  15 +-
>  .../surface/surface_aggregator_tabletsw.c     | 533 ++++++++++++++++++
>  include/linux/surface_aggregator/controller.h | 125 ++++
>  include/linux/surface_aggregator/device.h     |  36 ++
>  8 files changed, 795 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-surface_aggregator-tabletsw
>  create mode 100644 drivers/platform/surface/surface_aggregator_tabletsw.c
> 

