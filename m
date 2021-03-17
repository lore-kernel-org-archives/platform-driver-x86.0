Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDB3C433E9
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:47:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D847064EF6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Mar 2021 17:47:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhCQRrI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Mar 2021 13:47:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38055 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232730AbhCQRqh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 13:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616003196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CCabCEQRGnAeS704us1uXD1jP2HpK0cYd8RXwLYid7A=;
        b=YlXhZYu9+IHxs2ZjB4UdWamAlh5cLm5YF1QVO0//txRj7ANDdBqi/L1wKiVifkgiHf2aVp
        UFK8Omtb5foZlEVrMZIBvE4uLAchY8WUiEmV1ZUx805waNJxl1Om3aXu9C96LSbGVr7SPm
        KD0oS7WMfHuG8D2ZBcxhWjDFzkBgMjQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-yW35ZhCoO0yH1UkbnB-heg-1; Wed, 17 Mar 2021 13:46:34 -0400
X-MC-Unique: yW35ZhCoO0yH1UkbnB-heg-1
Received: by mail-ed1-f72.google.com with SMTP id h5so19825806edf.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Mar 2021 10:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CCabCEQRGnAeS704us1uXD1jP2HpK0cYd8RXwLYid7A=;
        b=oK3rlnohSWhlCZXCqHdaBds3aWsj/1USkncb+zWqrGBYBxlpymkAAomY1XDHyzjndf
         8+QXd0crpW9lj6dFHusRXPW+vOjDSWft5nljEMfmHiqkzcJgyq7fnERm+DZa+jdEnOvT
         4q8q5xoR7uDGdMLnl2GDMqsqtIY31of8PR++Ph5y09q4KSN29eukMZlgunR5TdvdbaEm
         saGUFpSxbPyE/+GFEDXiTFXiTW21ztR3aYwSM5g89mensxeYmDfFSeWldMq8hw3bsKAT
         kE4udIay4KhrHU9cxt/xh+Z/IaEI+t7hZ37w+RQgA/9Sf3nfgXOj64qBAbiG45qIu+nu
         LqIw==
X-Gm-Message-State: AOAM5334K9XRnS0StxYYXS8icq2xyCOvVBmUcxZSzEk36cb/uSNMphPv
        QmjoduodglIKFe78kC6O2YKCakHP2B0tvQ1GrUvY0uIexr7dk5Yk22PHNxk9k7qUIwzuZkkNjxf
        D099umhdekxXpjw0zcFXXru8fd/ESoiJ3Iw==
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr45305575eds.199.1616003193604;
        Wed, 17 Mar 2021 10:46:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp4yZL5VrLC7bAoOuQZjKzl5EnsmLDm5qQ7XMulkiUdoT/Ubg/stLn9EqfZZid0vw42GVFbQ==
X-Received: by 2002:aa7:d74d:: with SMTP id a13mr45305562eds.199.1616003193469;
        Wed, 17 Mar 2021 10:46:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f9sm13450007eds.41.2021.03.17.10.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 10:46:33 -0700 (PDT)
Subject: Re: [PATCH 0/3] platform/surface: Add DTX detachment system driver
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-api@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210308184819.437438-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <600b5161-e754-f363-b774-0cb020b7e439@redhat.com>
Date:   Wed, 17 Mar 2021 18:46:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308184819.437438-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/8/21 7:48 PM, Maximilian Luz wrote:
> The Microsoft Surface Book series devices consist of a so-called
> clipboard part (containing the CPU, touchscreen, and primary battery)
> and a base part (containing keyboard, secondary battery, and optional
> discrete GPU). These parts can be separated, i.e. the clipboard can be
> detached and used as tablet.
> 
> This detachment process is managed by a subsystem of the Surface System
> Aggregator Module (SSAM). As that process is a bit more complex, i.e.
> can involve user interaction, it seems the best way to implement this is
> to provide a somewhat cleaned-up version of this interface to userspace.
> 
> This series adds a driver (and documentation) for the detachment system
> which provides such an interface. See the commit message of the first
> patch for more details and a link to a user-space daemon using this
> interface. Support for the Surface Book 3 is added in patch 2,
> user-space API documentation in patch 3.

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
> Regards,
> Max
> 
> Maximilian Luz (3):
>   platform/surface: Add DTX driver
>   platform/surface: dtx: Add support for native SSAM devices
>   docs: driver-api: Add Surface DTX driver documentation
> 
>  .../surface_aggregator/clients/dtx.rst        |  718 +++++++++
>  .../surface_aggregator/clients/index.rst      |    1 +
>  .../userspace-api/ioctl/ioctl-number.rst      |    2 +
>  MAINTAINERS                                   |    8 +
>  drivers/platform/surface/Kconfig              |   20 +
>  drivers/platform/surface/Makefile             |    1 +
>  drivers/platform/surface/surface_dtx.c        | 1289 +++++++++++++++++
>  include/uapi/linux/surface_aggregator/dtx.h   |  146 ++
>  8 files changed, 2185 insertions(+)
>  create mode 100644 Documentation/driver-api/surface_aggregator/clients/dtx.rst
>  create mode 100644 drivers/platform/surface/surface_dtx.c
>  create mode 100644 include/uapi/linux/surface_aggregator/dtx.h
> 

