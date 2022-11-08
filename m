Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AE7C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Nov 2022 15:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbiKHPAa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Nov 2022 10:00:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233500AbiKHPA3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2022 10:00:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2490310B7D
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Nov 2022 06:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667919569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fdYoJUtgTUxnYrukYc9p7hbQdOdGOdRMetFx2HBQGkY=;
        b=gmdvU8ZoL5EQo3f9zqmb4se2CalJUGBPXBFD+vZf9oQWKLGQTsNqHoebgqyo/OdBIKnoSN
        5GjZSYwB01fJuH9C+QX/YtGJ7JEJJPbNFAAETNXrK7/Aahw9Km4zwmwHSbuCXtqx/izNuT
        7ghmhgJxeVOu9l6PzCv7LwTj2i5mRys=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-220-L9tYEwU_PxymDJZmydkmxA-1; Tue, 08 Nov 2022 09:59:28 -0500
X-MC-Unique: L9tYEwU_PxymDJZmydkmxA-1
Received: by mail-ej1-f71.google.com with SMTP id xc12-20020a170907074c00b007416699ea14so8529185ejb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Nov 2022 06:59:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdYoJUtgTUxnYrukYc9p7hbQdOdGOdRMetFx2HBQGkY=;
        b=smeIfF20+ziQvD15SV2QA9Ncu2Ipdha7jDn1P6XDJoUjhIaWBfSBG8YMHcFnZ+aaED
         bkdxSmaRQSgYs4q7q5bzBOlJ3EM/LEuVoCG7OgQoMf+9UIiXSlMaH8gsQ8vOQhdXd3RR
         hLBksx34UToNnbnc5IeSgsrr/jeqESqqmq8u8g3Iuegh0rIkaPotZj1+eYoHl/iPm6XD
         q7UORADNaVkpZfLYbXRtPXlfw5wE2wYvfzvfBITia/kyBRNUbMR3hihKopiDULquCnYZ
         smQgfPXL+tRzOxauOLa8cKUTUarw3CfudAJukbUsqo+HTxiKPTBK4jYFllLrd8qMYmAb
         zjYQ==
X-Gm-Message-State: ACrzQf0aY+O+hwPKYoapfdCujJHz771YY0TXpbGrj8Acvon2duKZ1ujk
        p9D+4zK+3WznVypu1npboqhaG/vxfgLvMetAvgY4WLw58CCDDSqU51lz+4MghZiqaSagaG3Wvl4
        DE7rb+OzmwDQLb8qUmbGnFVYCoBzP5A2RUQ==
X-Received: by 2002:a17:907:1de0:b0:7a7:6a8:1e61 with SMTP id og32-20020a1709071de000b007a706a81e61mr52661641ejc.468.1667919566510;
        Tue, 08 Nov 2022 06:59:26 -0800 (PST)
X-Google-Smtp-Source: AMsMyM71Qfmpbr3ExvxJ8g22YkO/fvbruHyrsKrDYMElBmVZhqj41nttZBU2FnzLQyx0+RqThfN44w==
X-Received: by 2002:a17:907:1de0:b0:7a7:6a8:1e61 with SMTP id og32-20020a1709071de000b007a706a81e61mr52661627ejc.468.1667919566308;
        Tue, 08 Nov 2022 06:59:26 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id en6-20020a056402528600b0044e937ddcabsm5659929edb.77.2022.11.08.06.59.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 06:59:25 -0800 (PST)
Message-ID: <4a7d3347-4eff-1a56-5703-ff8bfe91981e@redhat.com>
Date:   Tue, 8 Nov 2022 15:59:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 0/6] Introduction of HP-BIOSCFG driver
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20221020201033.12790-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221020201033.12790-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 10/20/22 22:10, Jorge Lopez wrote:
> Version 4 restructures the patches submitted in previous versions.
> Earlier hp-bioscfg patches were squashed together before creating
> the new split.
> 
> Version 4.0 breaks down the changes as follows:
> 
> 1. Moving existing HP drivers to a central location

I have merged this patch, so you can drop this for version 5
of the patchset.

> The driver files were broken down in 5 patches of 3 files each
> with exception of patch 6/6
> 
> 2. Introduction of HP-BIOSCFG driver - Set 1

I've done a detailed review of this single patches. This has
found quite a few things to improve. Note that many of the
remarks and especially the remarks about enum-attributes.c
also apply to the other files (to the other *-attributes.c
files).

Please prepare a version 5 taking all remarks into account
for all files of the driver and then I will continue the
review from there.

One thing which I did already notice for the last patch
in the series, please drop the "depends on DMI" from the
Kconfig bits and drop "include/dmi.h", you are not using
any DMI functions so these are not necessary.

And please add a:

L:      platform-driver-x86@vger.kernel.org

line to the MAINTAINERS entry.

Regards,

Hans





> 3. HP BIOSCFG driver - set 2
> 4. HP BIOSCFG driver - set 3
> 5. HP BIOSCFG driver - set 4
> 6. HP BIOSCFG driver - remaining components
> 
> --
> 
> 
> Jorge Lopez (6):
>   Moving existing HP drivers to a central location
>   Introduction of HP-BIOSCFG driver
>   HP BIOSCFG driver - set 2
>   HP BIOSCFG driver - set 3
>   HP BIOSCFG driver - set 4
>   HP BIOSCFG driver - remaining components
> 
>  .../testing/sysfs-class-firmware-attributes   |  181 ++-
>  MAINTAINERS                                   |   15 +-
>  drivers/platform/x86/Kconfig                  |   80 +-
>  drivers/platform/x86/Makefile                 |    4 +-
>  drivers/platform/x86/hp/Kconfig               |   81 ++
>  drivers/platform/x86/hp/Makefile              |   11 +
>  drivers/platform/x86/hp/hp-bioscfg/Makefile   |   19 +
>  .../x86/hp/hp-bioscfg/biosattr-interface.c    |  285 +++++
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 1064 +++++++++++++++++
>  drivers/platform/x86/hp/hp-bioscfg/bioscfg.h  |  671 +++++++++++
>  .../x86/hp/hp-bioscfg/enum-attributes.c       |  521 ++++++++
>  .../x86/hp/hp-bioscfg/int-attributes.c        |  478 ++++++++
>  .../x86/hp/hp-bioscfg/ordered-attributes.c    |  586 +++++++++
>  .../x86/hp/hp-bioscfg/passwdattr-interface.c  |   50 +
>  .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  647 ++++++++++
>  .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  408 +++++++
>  .../x86/hp/hp-bioscfg/string-attributes.c     |  457 +++++++
>  .../x86/hp/hp-bioscfg/sureadmin-attributes.c  | 1014 ++++++++++++++++
>  .../x86/hp/hp-bioscfg/surestart-attributes.c  |  145 +++
>  drivers/platform/x86/{ => hp}/hp-wmi.c        |    0
>  drivers/platform/x86/{ => hp}/hp_accel.c      |    0
>  drivers/platform/x86/{ => hp}/tc1100-wmi.c    |    0
>  22 files changed, 6647 insertions(+), 70 deletions(-)
>  create mode 100644 drivers/platform/x86/hp/Kconfig
>  create mode 100644 drivers/platform/x86/hp/Makefile
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/Makefile
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/bioscfg.h
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/ordered-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdattr-interface.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/sureadmin-attributes.c
>  create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
>  rename drivers/platform/x86/{ => hp}/hp-wmi.c (100%)
>  rename drivers/platform/x86/{ => hp}/hp_accel.c (100%)
>  rename drivers/platform/x86/{ => hp}/tc1100-wmi.c (100%)
> 
> --
> 2.34.1
> 

