Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBD8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 13:30:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD5B961B42
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 13:30:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236724AbhKPNdI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 08:33:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36296 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230471AbhKPNdG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 08:33:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637069409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ST205w2OoqP01qcgeRVfdvxSDu/yZpEMvX7rmjh8V5Q=;
        b=g+x7t7SzKiqmWtKj7/DlsKw3E404Zy5I8pwIo/6gV89Uyk6NQL/oe+47gh5s4nTrioR7rs
        denD4H8cFo5Svt5kbkPagDDROEThH2tTdnaijI1zMYe0ayl/7R3Jv6HZ52nEDPP/CRgspb
        XVtS3tUx+3/uuzcBQDHmeBK5YA7zdWs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-43CKO3JLNYWKDt2k0WqNEQ-1; Tue, 16 Nov 2021 08:30:05 -0500
X-MC-Unique: 43CKO3JLNYWKDt2k0WqNEQ-1
Received: by mail-ed1-f72.google.com with SMTP id k7-20020aa7c387000000b003e7ed87fb31so200778edq.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Nov 2021 05:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ST205w2OoqP01qcgeRVfdvxSDu/yZpEMvX7rmjh8V5Q=;
        b=bM1bTYjoS2mIlcU2GGbN8jNFa1iHWvCYR9mG1Ih90MseMmsprtFQWdxccmbKLYgTlw
         evEITipOzCzt3qnNoPCIQFLnnXz1vuGwC/LKDg65qzMbsqWtQaGOklhw+NuxgudzhWYd
         Hy/BkSm1fKI0O0NZAt3qW1MRWvBz87FYipjT/dksv5KT46VVUNzph9Jdn/VQsjjeGiKi
         cPVqxHBQTvpdteRnepZr2C1jz26qw38toNmxZtfXwLek8viTa4focJ1RByDjCBpcRLbC
         dFX+e1Xp4r0ZOukB8D+7gtbVqIgfEMuev+ATY72oJAopIxjuTfaskD0mH2jG2inJksLw
         lyMg==
X-Gm-Message-State: AOAM53097LGt8gBVX7xMXw11iphGCJV1g2/8f6F/MyPDFlQLKDHGc6ML
        x6ihu7Q5B6o3Y5wrltltXTvKMHIPGINU5+TCjheVjR9aFUZ0RJkMOcmmOHQKAlc/hJggJq20Lza
        fGm77Ha3B+yoz1sapnNPS/b/y2XW6w3Dddw==
X-Received: by 2002:a17:906:1e05:: with SMTP id g5mr10230999ejj.552.1637069404403;
        Tue, 16 Nov 2021 05:30:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweJBnGYiA8ga/2aj8OfLsI5K/keiWLFBw6pZrhh7x/jC//KYbhNKbbgEkvLmb5KjSMFo9cRQ==
X-Received: by 2002:a17:906:1e05:: with SMTP id g5mr10230967ejj.552.1637069404250;
        Tue, 16 Nov 2021 05:30:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hr17sm8373116ejc.57.2021.11.16.05.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 05:30:03 -0800 (PST)
Message-ID: <5546a0cd-7f21-5b54-6a75-613c0009ebdd@redhat.com>
Date:   Tue, 16 Nov 2021 14:30:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/2] Updates to amd-pmc driver
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org
References: <20211116074000.28626-1-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211116074000.28626-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/16/21 08:39, Sanket Goswami wrote:
> This patch series includes:
> - Introduce msg_port argument to amd_pmc_send_cmd() function signature
> - Add support for Spill to DRAM on Smart Trace Buffer feature
> 
> Sanket Goswami (2):
>   platform/x86: amd-pmc: Introduce message port argument in SMU routine
>   platform/x86: amd-pmc: Add support for AMD Spill to DRAM STB feature

I will not look at this series until the issues with the:
"[PATCH v5 0/3] Updates to amd-pmc driver"
series are sorted out.

Please send a new version, rebased on top of the latest
review-hans branch *after* the other series is merged.

Regards,

Hans

