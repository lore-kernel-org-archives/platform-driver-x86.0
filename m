Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F89C48BCF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:22:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8CD76136D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 14:22:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhFIOYd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 10:24:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24682 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237948AbhFIOY3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 10:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623248554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g5ldgdL4oevbJpGhiyzWJtU/uw/xXI5crD+GIdVCm0s=;
        b=LwmbYf1U/ltnCIn9WDqD8yIlj3OM2UWtYmvC5OG8Ywa5CU6N70oHPgFmgcEvbEo0OpfJnt
        SfAZ04p5/ZQrfB72BDe6lY/Da3EBmid5LdGpESY32p9RZmvUQoAUrwEdbNdB18FBTByINp
        pI/7lnKRR1X3/LydaxE260WmuzPiGEE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-Fqv6XE9IN4agS3m0gKfgrQ-1; Wed, 09 Jun 2021 10:22:33 -0400
X-MC-Unique: Fqv6XE9IN4agS3m0gKfgrQ-1
Received: by mail-ed1-f71.google.com with SMTP id dd28-20020a056402313cb029038fc9850034so12490374edb.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2021 07:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g5ldgdL4oevbJpGhiyzWJtU/uw/xXI5crD+GIdVCm0s=;
        b=s3cBBJbcOTrJGlfQkoNvwSLbb8jPXkSP/cuC+u9obSDuUprX4u6FeLZHcyIe/TjJb6
         VDbCsp8R60zBFmcVgMLn/qgguJQqjRmDV0FGOo3zCm/lLGzxzdfydYgxNhvLFDAyCcCZ
         KoOti2WfSyvNuLv3giAVNt1ErjHXj3kBSis8eB0+gROUVl+dQvZaDrLnDe62zVGKbGjG
         0YsKxjVB9NhIqZZY4vp0mZYC3QQMJ/S/vaNF56V2spXz6CFrTMdmbEjhWG3thoIHzQre
         Ehc8mldLZ2SRwhCOY/0L7cG8Wdvh/4xmFXVGUUw4uIZ/Lhspm9riN1f9s21v9BteHzo2
         nfLw==
X-Gm-Message-State: AOAM531UOQrukZ2ZgXFpiFUjxGo6YafMIixSuOj57DyFhcGVqpDADkOp
        H83C6h174zKY1Hz4VeyrDaRCG7p0rmkorkVA9qIxGzrNJMybrDDxXKryx/PyI0fL6NYyYBcQJ+C
        AGNhhYl5XyG5avmSpV2D5idFz8sFkSvSpIw==
X-Received: by 2002:a05:6402:b5a:: with SMTP id bx26mr18821821edb.81.1623248551882;
        Wed, 09 Jun 2021 07:22:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx11VXiqLbrpgaiXY0p+/cIwMtuO441HX5rKo0DbOlN0/EysED/CirhOcdAkzYCw9skKMFqfw==
X-Received: by 2002:a05:6402:b5a:: with SMTP id bx26mr18821799edb.81.1623248551706;
        Wed, 09 Jun 2021 07:22:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id y15sm1203116edd.55.2021.06.09.07.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 07:22:31 -0700 (PDT)
Subject: Re: [PATCH 0/2] platform/surface: aggregator: Fixes for user-space
 interface extension series
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210604210907.25738-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8c006308-4e0d-d6a8-fade-f6025bd28256@redhat.com>
Date:   Wed, 9 Jun 2021 16:22:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604210907.25738-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/4/21 11:09 PM, Maximilian Luz wrote:
> Small fixes for "platform/surface: aggregator: Extend user-space
> interface for events".
> 
> Specifically, prevent use of an uniniitalized variable and drop an
> unnecessary initialization.
> 
> Maximilian Luz (2):
>   platform/surface: aggregator: Do not return uninitialized value
>   platform/surface: aggregator: Drop unnecessary variable initialization

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

