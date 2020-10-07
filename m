Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D05EC41604
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:14:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C213020872
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HZ/2WlCe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgJGVOn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 17:14:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21485 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728282AbgJGVOm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 17:14:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602105281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UsS4juZFqfcdzrHO2PVDQfEmKbf/j75qDjzNdWA/dp4=;
        b=HZ/2WlCedi+XxnSiqQ1NvmdGablDlmlv95lh/sdeaARUFRv8rAnAvkYtpfQ+NDHw/yLFXo
        05Z/1N2lGl3R4fjFop2USfyyFFMDbGVX9dqqyynLhBEs1SxMfDBrPH6f2H5Ea8Ui8yAx3o
        avs/+6vs3He55clUQuikUMm+PTx0QBE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-rRxPQ2b1PaS9ItE4I3-5bg-1; Wed, 07 Oct 2020 17:14:39 -0400
X-MC-Unique: rRxPQ2b1PaS9ItE4I3-5bg-1
Received: by mail-ed1-f69.google.com with SMTP id e14so1449915edk.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 14:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UsS4juZFqfcdzrHO2PVDQfEmKbf/j75qDjzNdWA/dp4=;
        b=rQW7wsW+pK8I3fGSOshzWwfMoVANcgsIYPt00YSnBjf4LOIbdhAcYb1go9ZKwmlFTn
         Okj8L+XZINbJ5jwtlXmygxPGPPsxFP5+fRC8cjCaBvNfqbCfNhjNpBMMw6nhmfHuucmv
         tmSEIWLBt2RcUFDqJ7cXXcjqBSmo8DqKWY1NXojJqXppe7kCWO2Z2CXRR3bgIPjyoE+z
         OWFjfg7WawPUaxrAYKw8UzxD1YevKuhoIwbPEMTJxwdcD0pERHNQ05YtCJ16kqwFxK6p
         7TVFH/455KlFQvl/gZHcUJpgyf7yGLpCcfFb3ef7qOV8R7ZLui9Zwv4HSf3hXIRTQHw8
         B1DA==
X-Gm-Message-State: AOAM532y/qsEA2n83z4cpoZiaBs0WAzKmayIePygJ1j5mLd9ygEl7ijp
        fiFIJIDYTLJAAeEZ4E3X+WSYZ2kRHl9zotRHKV1KmGVWPut3aRlNWsvc9oB40O/V0tb8JuC7PNN
        uVAfkYYX7/BuNrdMz0IhjPTGpG6YdwKYvlw==
X-Received: by 2002:a17:907:4365:: with SMTP id nd5mr5461680ejb.56.1602105277814;
        Wed, 07 Oct 2020 14:14:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO3AZ/uQr60oWbsGvXQf5H0kkUbwZNu5WCxlnZdO17Gf+feZ0U52eqMaLw6eAyuOOFTA+hQA==
X-Received: by 2002:a17:907:4365:: with SMTP id nd5mr5461667ejb.56.1602105277642;
        Wed, 07 Oct 2020 14:14:37 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id bt16sm2309673ejb.89.2020.10.07.14.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 14:14:37 -0700 (PDT)
Subject: Re: [PATCH 0/4] pmc_core: Add RocketLake and other changes
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, david.e.box@intel.com,
        dvhart@infradead.org, andy@infradead.org, gayatri.kammela@intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20201007035108.31078-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <74b92bc3-2126-a11a-5de3-3f594c6af82c@redhat.com>
Date:   Wed, 7 Oct 2020 23:14:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201007035108.31078-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/7/20 5:51 AM, David E. Box wrote:
> Add RocketLake platform support and other driver maintainance.
> 
> Gayatri Kammela (4):
>    platform/x86: intel_pmc_core: Clean up: Remove the duplicate comments
>      and reorganize
>    platform/x86: intel_pmc_core: Add Intel RocketLake (RKL) support
>    platform/x86: intel_pmc_core: fix: Replace dev_dbg macro with
>      dev_info()
>    MAINTAINERS: Update maintainers for pmc_core driver

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up there once I've pushed my local branch there,
which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

