Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1D9ECAAD1
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Sep 2022 12:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233286AbiIAMq1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Sep 2022 08:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbiIAMqR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 08:46:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A73D642F4
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662036374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=m0rl2MUzYAn5ufsn3eFoAWq4yL+epIZWrtI/gs1ZE/I=;
        b=BQRfMWdGgeqL44g6XvqswseN0l7UHaY20WUNa36uUp7uehQFcCYt4XT0B9EF46pJVRNarI
        RLGofJeTILoxAsO5H5mLMxuEUAocznYcDfjXcu4kDVjArrxEuWLKMV9wzAqm2ppxwcKs2I
        aBoUkWLCB4OiE/YRnBq9mSwgoRHNniY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-323-7_YhqbzAO3CmjPmqG9IyVg-1; Thu, 01 Sep 2022 08:46:13 -0400
X-MC-Unique: 7_YhqbzAO3CmjPmqG9IyVg-1
Received: by mail-ed1-f71.google.com with SMTP id y14-20020a056402440e00b0044301c7ccd9so11622560eda.19
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 05:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=m0rl2MUzYAn5ufsn3eFoAWq4yL+epIZWrtI/gs1ZE/I=;
        b=fA8qrNlOzU3iRDDQU1ndCmcvUeTSE+hbC5ByEM75ELadUlXC/iUHicWx1A4k1j6CqR
         toRcUPk07MGS3GmrOEGVnBb61Jj8VqhLZFuvkOphHceEKnK+soARIogFlX5ZxVXBZPgt
         dvW6OnHgh3Yd+8ZPdm+DB7roJn1GdxYjisamX1PIlCr7gPfrqPS1e8P0Y2HZbKovR81e
         FITE2O7z+Q3xxxa2tQ+1f1dKqQUE6HM/X1TJhJnikcEgEMLXmDjApcy1xrMCRKipMQQZ
         wWVcqELyOCoMXoGPOaGkb16J48fpT5YM1u/KzqpKqaiTnHzJ87c85TfDNQZxPmofNfz0
         yEfQ==
X-Gm-Message-State: ACgBeo1hpH+5bqVYb48PsXVfngWHP8VTYrcblWdroiVKFPSSfhBg4HtX
        kXq3kLcjD7IL950tvZ5rCrvrinNpSRT497lGDAVM4Mld5xyEsHsN7eNaKJnHqS45ni98hxx1Ann
        f6hj1T/gUsHc85sW71tPG8bjcpoK4KtXRdg==
X-Received: by 2002:a17:907:1691:b0:738:3754:f0a1 with SMTP id hc17-20020a170907169100b007383754f0a1mr23886888ejc.117.1662036371930;
        Thu, 01 Sep 2022 05:46:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5EMDz8NQQYHF6LBZRQJw0VLb7Ap/nazeHudoHfkHpFrREKKL+49GGBjeS2kgQ+3dYdZrstZA==
X-Received: by 2002:a17:907:1691:b0:738:3754:f0a1 with SMTP id hc17-20020a170907169100b007383754f0a1mr23886877ejc.117.1662036371724;
        Thu, 01 Sep 2022 05:46:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906201100b00731747c3107sm8354469ejo.73.2022.09.01.05.46.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 05:46:11 -0700 (PDT)
Message-ID: <c6607aca-9e7d-08e6-f5ea-675cdd31584d@redhat.com>
Date:   Thu, 1 Sep 2022 14:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH platform 0/4] Fixes for issues with coverity, locking,
 redundant checks
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     dan.carpenter@oracle.comq, platform-driver-x86@vger.kernel.org
References: <20220823201937.46855-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220823201937.46855-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 8/23/22 22:19, Vadim Pasternak wrote:
> The patch set includes fixes for several issues:
> Patch #1: fixes coverity issue.
> Patch #2: fixes locking dependency issue.
> Patches #3-#4: remove unnecessary code.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also send this out as part of my next fixes
pull-req for 6.0-rc#.

Note I do have one code-style remark to patch 2/4,
since I want to add this to my fixes pull-req I've
taken 2/4 as is. Please send a follow-up (incremental)
patch addressing the code-style issue. See my reply
to patch 2/4.

Regards,

Hans


> 
> Vadim Pasternak (4):
>   platform/mellanox: mlxreg-lc: Fix coverity warning
>   platform/mellanox: mlxreg-lc: Fix locking issue
>   platform/mellanox: Remove unnecessary code
>   platform/mellanox: Remove redundant 'NULL' check
> 
>  drivers/platform/mellanox/mlxreg-lc.c | 53 ++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 22 deletions(-)
> 

