Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC6FC001B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 14:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbjGZO3y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 10:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbjGZO3w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 10:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEFEE7E
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 07:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690381733;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iFI15BErMUMYozQzCLDVmnaZDqYBA9U7yWV7ZJN6KOE=;
        b=KxKtRV1KgvR3enyXSAOZ0tHfYNBdiOyuP5czfFbd4AdN7EL6eJ8HIH67dJG+/ENgA8uekQ
        +Dshyz5mjINCBeyVUa3rNHVKxB+SUn/r0I5ndq0/6rnHxyDOq2JXtIJPvPb9L8K4TGKpuk
        +x07QaFJz9etHoaxHSWZiE78rkwW8b0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-ZevE2hEQMTymEGUvacEXqA-1; Wed, 26 Jul 2023 10:28:51 -0400
X-MC-Unique: ZevE2hEQMTymEGUvacEXqA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-993c24f3246so116537166b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 07:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690381730; x=1690986530;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFI15BErMUMYozQzCLDVmnaZDqYBA9U7yWV7ZJN6KOE=;
        b=boo4Ps4cbjGWgb0xubC9aKl+yeA/7QAGBoetBWUxgApSQY2MGNBPADSXP7aZdWKLnx
         pnIlhop8L8og4LdkXCTpoxEoK/+jizW/GwPMo/QrvSmIjUrsmcgevt8kiTL6l7+NNlCp
         fyD4j3c/Xzjrs5vQBXTbhiICW3uvyM2SuupWGtm4D0Bmxs3qIIp5tPHmdXtj4VQ9eAB0
         qMWVjo94jFWThkvKnu68YZAA752ijgmCdCQwH6muuUwjDK/6htkNB+1XHIiIJCKgB7A0
         wc1s8Rz40xoxqh7D1FMRk1VyIGRYVKXZ4rDoto2WYck55/UWgUh4CpkomuPoURRfgixz
         UQ8g==
X-Gm-Message-State: ABy/qLb8aQS06AW59c2vAPo8qFIxshC7vnuGKskhEUCaFDw83pXlxAnG
        MljNqSj0ES2pQCwnG2/Q7z7vUo95Gi3mkwPIGssW/cnSeonDQl2SZFSyASNf90lziRCvLOdL3AZ
        kyZlA/GG6S0NQN7tUngm2+j9my0mg30E4GSgha+Bj5w==
X-Received: by 2002:a17:907:96a2:b0:96f:9cea:a34d with SMTP id hd34-20020a17090796a200b0096f9ceaa34dmr6196766ejc.21.1690381730538;
        Wed, 26 Jul 2023 07:28:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlECesgJHGpkINCxNmWn//tbKLvydmg+M/mAbr5aJJLMlb8wj3zr6vjMVp1A0jXNigpG3bvGTA==
X-Received: by 2002:a17:907:96a2:b0:96f:9cea:a34d with SMTP id hd34-20020a17090796a200b0096f9ceaa34dmr6196753ejc.21.1690381730199;
        Wed, 26 Jul 2023 07:28:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y25-20020a1709064b1900b00992e265495csm9695197eju.212.2023.07.26.07.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 07:28:49 -0700 (PDT)
Message-ID: <79f81c1c-3ec2-dc0f-56ee-2946987be8b3@redhat.com>
Date:   Wed, 26 Jul 2023 16:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/5] hp-bioscfg: Address memory leaks and uninitialized
 variable errors
Content-Language: en-US, nl
To:     Jorge Lopez <jorgealtxwork@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        thomas@t-8ch.de, ilpo.jarvinen@linux.intel.com,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <20230725220056.25560-1-jorge.lopez2@hp.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230725220056.25560-1-jorge.lopez2@hp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Jorge,

On 7/26/23 00:00, Jorge Lopez wrote:
> Submit individual patches to address memory leaks and uninitialized 
> variable errors for each source file listed below.
> 
> - hp_populate_string_elements_from_package()
> drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
> 
> - hp_populate_ordered_list_elements_from_package()
> drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
> 
> - hp_populate_integer_elements_from_package()
> drivers/platform/x86/hp/hp-bioscfg/int-attributes.c
> 
> - hp_populate_enumeration_elements_from_package()
> drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
> 
> - hp_populate_password_elements_from_package()
> drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
> 
> Changes were tested with a HP EliteBook x360 1030 G3

Thank you for the patches fixing this.

I'm going to wait a bit with applying these to give other people who have looked at these issues a chance to review these patches (added Dan Carpenter and Christophe JAILLET to the To: list).

For future patches please write one patch for each issue you are addressing instead of one patch per file. Since the fixes are the same for all 5 files in this case that would have meant doing 2 patches:

1. To fix the memory leak errors in all 5 files
2. To fix the uninitialized variable in all 5 files.

There is no need to send a new version unless changes are requested by one of the reviewers, I'll just squash all these 5 patches into 1 patch when merging this (and keep the uninitialized variable changes as part of the same patch).

Also these patches should have something like this as part of the commit msg (directly above your Signed-off-by:) :

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/platform-driver-x86/176e14a2-41f8-41b2-854e-77319ec2416d@moroto.mountain/

Regards,

Hans








> 
> 
> Jorge Lopez (5):
>   hp-bioscfg: Fix memory leaks in string_elements_from_package()
>   hp-bioscfg: Fix memory leaks in ordered_list_elements_from_package
>   hp-bioscfg: Fix memory leaks in integer_elements_from_package
>   hp-bioscfg: Fix memory leaks in enumeration_elements_from_package()
>   hp-bioscfg: Fix memory leaks in password_elements_from_package()
> 
>  drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c   |  8 +++++++-
>  drivers/platform/x86/hp/hp-bioscfg/int-attributes.c    |  7 ++++++-
>  .../platform/x86/hp/hp-bioscfg/order-list-attributes.c | 10 ++++++++--
>  .../platform/x86/hp/hp-bioscfg/passwdobj-attributes.c  | 10 +++++++++-
>  drivers/platform/x86/hp/hp-bioscfg/string-attributes.c |  5 ++++-
>  5 files changed, 34 insertions(+), 6 deletions(-)
> 

