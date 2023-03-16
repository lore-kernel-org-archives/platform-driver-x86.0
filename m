Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBE9C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 13:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjCPNsl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 09:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbjCPNsj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 09:48:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1124BD3099
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 06:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678974456;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZZo2YFcaNKaM3gZrAXPBzwFxyoNjSK9TD7bMUQJR6d4=;
        b=Vq9aYlhtr6QatDGxUYQLbRK1xAc8UD7czqsY+tuMg3yNb/YqgmM9CYrmZtDmn6MP0Kz5iA
        A94DmmqHduUM6r/+X4PQK8G+wEdskQ4lfmVAlOw5HbHSTZI4yhJkm4GuF5maFXqHmWZeuz
        E3tyi+7xKJ1voGjpuJJiHwYbufWCmA4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-_S17E1CpMUaBDQNM_wa57A-1; Thu, 16 Mar 2023 09:47:35 -0400
X-MC-Unique: _S17E1CpMUaBDQNM_wa57A-1
Received: by mail-ed1-f69.google.com with SMTP id er23-20020a056402449700b004fed949f808so3130062edb.20
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 06:47:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678974453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZZo2YFcaNKaM3gZrAXPBzwFxyoNjSK9TD7bMUQJR6d4=;
        b=jT+jOlCmI69hcDhhV41eBGPP7jbRZlLVczRSCHqWhOW4ki6U375KuaSqvohbFMQVj3
         HemGmw6ygUKNjrZzdQOfHNbmn3n6abPuZrl52yzmKTIjePRxB1WA3MRa8rkmyE/dAu6H
         HW3taF/71mKpGcNZAMJq99WhbydrmUcTO6GJOztSrnMX83jeoKeQ7sdqXHsiDY0j8QHK
         JJ59TTUAVKsb+V10v3kDECcvlpd7Q4k20ISTXZZzqFjWwXLwcliVISBcs06zZgYpRUvc
         Y3rXjooSb+wkJE7UzzjU/F4IdqVKAi+/MG6EoT8O+V+Y+hAtnbPovH9lAHGwnc5k/+Nx
         2zLg==
X-Gm-Message-State: AO0yUKXNGH/B9z66Sd3JIUEBshl37yRZwrHE+rrOXfS6t5nKRozB4Oab
        tWXHLsMXg2lgjCG9WYKq5lHbO11+xFfk4/nWiAG1xu2gR1VHnwY9TDliXVqb3aSOBwQqgonO44X
        7Td2ZfoDgVozUpnzwqRCHW7bPWTvAHGavK3hfCzNaJA==
X-Received: by 2002:aa7:d841:0:b0:4fd:206c:dc73 with SMTP id f1-20020aa7d841000000b004fd206cdc73mr6250679eds.32.1678974453510;
        Thu, 16 Mar 2023 06:47:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set9AjZdi2q5FlJKKiuPwSZEOgDIgyPaa2iMdMMt5OdPjBU4QSsen92vQppfn5GamFbN51fx38g==
X-Received: by 2002:aa7:d841:0:b0:4fd:206c:dc73 with SMTP id f1-20020aa7d841000000b004fd206cdc73mr6250662eds.32.1678974453247;
        Thu, 16 Mar 2023 06:47:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u11-20020a1709060b0b00b008e22978b98bsm3860930ejg.61.2023.03.16.06.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 06:47:32 -0700 (PDT)
Message-ID: <b98cec03-d775-e13e-8255-c602d0c155f4@redhat.com>
Date:   Thu, 16 Mar 2023 14:47:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/3] platform/surface: Add support for tablet-mode switch
 on Surface Pro 9
Content-Language: en-US, nl
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230304194611.87770-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230304194611.87770-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/4/23 20:46, Maximilian Luz wrote:
> This series adds support for the tablet-mode switch on the Surface Pro
> 9. On that device, the posture subsystem (POS) can be used to query the
> state of the Type-Cover (detached, laptop-mode, flipped-back, ...) and
> receive notifications when it changes. We can use this to implement a
> tablet mode switch, extending the driver already in use on the Surface
> Laptop Studio.
> 
> More specifically, the posture subsystem allows for different posture
> sources, identified by a numerical ID, each of which can have different
> states. At the moment, however, the tablet-mode switch driver using the
> POS subsystem only supports the Surface Laptop Studio, and support for
> that is hard-coded.
> 
> To support the Surface Pro 9, we therefore need to adapt the driver to
> properly disambiguate between different posture sources (patch 1) and
> then implement the respective functions for the source ID representing
> the Type-Cover (patch 2). Finally, we also need to add the respective
> device to the Surface Pro 9 entry in the aggregator registry, to allow
> the driver to load (patch 3). 
> 
> Maximilian Luz (3):
>   platform/surface: aggregator_tabletsw: Properly handle different
>     posture source IDs
>   platform/surface: aggregator_tabletsw: Add support for Type-Cover
>     posture source
>   platform/surface: aggregator_registry: Add support for tablet-mode
>     switch on Surface Pro 9
> 
>  .../surface/surface_aggregator_registry.c     |   2 +-
>  .../surface/surface_aggregator_tabletsw.c     | 180 ++++++++++++++----
>  2 files changed, 142 insertions(+), 40 deletions(-)


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


