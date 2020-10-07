Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EFFC4363C
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:12:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FE3D2083B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 21:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TUnMsCVf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728509AbgJGVMQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 17:12:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41709 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbgJGVMP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 17:12:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602105134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SDK3Gt9aT4einF5OjoqPRMgVOrOe8nFuHhFEtB2s2qQ=;
        b=TUnMsCVfe4iM+eFMVc1WikcR5P0Gk69yhUJQkQlXcl3zXoLoPpbD5COpKxfesR+73QWjkI
        DcNKtR0FvGhwJUIv/NbYTS8mAUvkehLzJ2HQpBFhNqU+vW3/PyIrC9vtlKLXKnVKY1UfVC
        8CUhiTKddHaxn8wDFH97CYJfCKA8ieA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-Y7c3V7GMOK-36Vp1Ep9r1g-1; Wed, 07 Oct 2020 17:12:12 -0400
X-MC-Unique: Y7c3V7GMOK-36Vp1Ep9r1g-1
Received: by mail-ej1-f70.google.com with SMTP id j2so1277144ejm.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 14:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SDK3Gt9aT4einF5OjoqPRMgVOrOe8nFuHhFEtB2s2qQ=;
        b=PF29nufTTXDD0Hna2UX3DIPSjlAXXUAnvYBW82SjE5y1BwVZzeabPJsy7ea4JZKtex
         qezsUkABU4gtAX9KPKA1267oOKlnVA+KTyKx36A30TbPP/bDmIDal+mqZ7JEPsXh10qw
         uFW+S8dvYS8kNL6rotHhjDG4krK8050COUu14+b9eBGbB1a0qNtS/LGE2qFOua2DdOmB
         nfdsxmPW+ro3+zRST1+9lq3lmv2hsIoZriihG92rLdX7EkUKC/dbls/qfDyeL4MiMFiS
         w9DdDJOKExxoR763d5eIJao6kroRjplAND5KKYnVUOGst+14okn8dGAMJu5ZqRSICV6G
         78/Q==
X-Gm-Message-State: AOAM530CBDZAl7LqnWW2qXK2X/Vtcggdc9BCjLOdOlqGaVFjLqv50bQL
        0Fqe0+5CrjGAlQEbNxwCQjBsgIdXZG1ZhWEW/GQTtpU8lWLKFcejKXELf+5MYKgkMc4x/fC8TG+
        MD9JyTaAw4eAgFepUyyf7OCb2OiEMBx1Y9A==
X-Received: by 2002:aa7:c90a:: with SMTP id b10mr5800428edt.163.1602105131327;
        Wed, 07 Oct 2020 14:12:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjvdi7t9Ou7H9+JvHcCbilja8b5Sc3ql4mlKCyEKyXLa6QzXgT8fPdMx4sgqSar2mUADDCFg==
X-Received: by 2002:aa7:c90a:: with SMTP id b10mr5800409edt.163.1602105131083;
        Wed, 07 Oct 2020 14:12:11 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f20sm2232254ejc.90.2020.10.07.14.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 14:12:09 -0700 (PDT)
Subject: Re: [PATCH 0/3] Tiger Lake PMC core driver fixes
To:     "David E. Box" <david.e.box@linux.intel.com>, dvhart@infradead.org,
        andy@infradead.org, gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201006224702.12697-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ad5c6d7c-351f-c1ee-7cab-6d3f083a10a1@redhat.com>
Date:   Wed, 7 Oct 2020 23:12:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006224702.12697-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/7/20 12:46 AM, David E. Box wrote:
> This patch set adds several critical fixes for intel_pmc_core driver.
> 
> Patch 1: Uses descriptive register names for the TigerLake low power
> 	 mode registers. Not critical, but was requested in review of
> 	 Patch 2.
> 
> Patch 2: Fixes the register mapping to the correct IPs in the power
> 	 gating status register for TigerLake.
> 
> Patch 3: Fixes the slps0 residency multiplier to use the correct, platform
> 	 specific values.
> 
> David E. Box (1):
>    platform/x86: pmc_core: Use descriptive names for LPM registers
> 
> Gayatri Kammela (2):
>    platform/x86: intel_pmc_core: Fix TigerLake power gating status map
>    platform/x86: intel_pmc_core: Fix the slp_s0 counter displayed value

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up there once I've pushed my local branch there,
which might take a while.

Once I've run some tests on this branch the patches there will be added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

