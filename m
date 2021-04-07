Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFFE4C43460
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:50:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD35D6121E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:50:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbhDGOuy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:50:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30515 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348763AbhDGOut (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 10:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617807039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J7Zj/q4NY57Kp0s5iCtVo4YzI3svMHdAEVBKj45mo0A=;
        b=aCaqHDgKg7++rogykJIU3ehtaRPtu67JNA0JR+iDTalIaJji2Eb62GhoHAmIoy0MDaIkJq
        faMMLeiaJsO5dfuAVK85dcs8uUu1JUrvsFP5j2A+6san/zyhQHuDkzPHzUPgZre9Ya8zI4
        7+jG67N6id8nmLGto8QVnlHM3gWoB+Y=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-biXSdYvoPLmHCLHpzCvUXA-1; Wed, 07 Apr 2021 10:50:37 -0400
X-MC-Unique: biXSdYvoPLmHCLHpzCvUXA-1
Received: by mail-ed1-f72.google.com with SMTP id h9so5263706edb.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 07:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J7Zj/q4NY57Kp0s5iCtVo4YzI3svMHdAEVBKj45mo0A=;
        b=iJUtshK5Zl3wBqfj8kCspVslXbxlL3fxKfR0jvjJIt6drFVUH4IjZlmiUZ53GtYtT1
         ZzHr6jEGHv0F7wmrrR/VZSpr1Qa6l+PamWTgbP6J+iSJTWC9pgVV/WUv4NXSkHzeskOH
         Vofu7i/2/4sy1AsYc0X4Ye87GPqXhyWTrNs6KTLGgdi9gpEV2BWmMLa2U7xF8cgZvFG+
         8mghjB0CvUvPhisOSae9Npl5kr30KAnLJRY/rpjCXS4ARFN7BCZx7fUUi35+90RHEkrC
         dOv+oLmK6Oenux8kodYpASOG75hQScQjQNG1UKZj/4acYx2dZKSD5jddNHXAy2/17YgF
         gEfQ==
X-Gm-Message-State: AOAM530a5pHdXvlM7sM1EN0CZkyrqe9HWWQq3YN27vRFhpH5XAPfd69M
        TVLYlq3t/DNdW0EYowKUSH8IxN1n8tSgoCgatQu44Fp/AR7Fbhko5RZH7Fo38qTiaCyUCOrZQrV
        oOJ/QEfq5U3kAa5r0g79MI6C5WGItNFmT2g==
X-Received: by 2002:a17:906:552:: with SMTP id k18mr4017364eja.508.1617807036417;
        Wed, 07 Apr 2021 07:50:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzR5/BTM3EP66yAOAAmCEbnre/FdjtHTJa0BeTiTT8eDyHwNkFaP2WwUy9wT7oQgCA+O1sgMQ==
X-Received: by 2002:a17:906:552:: with SMTP id k18mr4017353eja.508.1617807036285;
        Wed, 07 Apr 2021 07:50:36 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id lt22sm9069321ejb.115.2021.04.07.07.50.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:50:35 -0700 (PDT)
Subject: Re: [PATCH 0/3] Adjust contacts for Dell drivers
To:     Mario Limonciello <mario.limonciello@dell.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@outlook.com>
References: <20210401162206.26901-1-mario.limonciello@dell.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4f0c222b-1d9f-20e3-9f92-97ef5072f720@redhat.com>
Date:   Wed, 7 Apr 2021 16:50:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401162206.26901-1-mario.limonciello@dell.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/21 6:22 PM, Mario Limonciello wrote:
> The Dell drivers I'm involved with all have me as an author and/or
> maintainer.  In the future these will be maintained as a team effort.
> Adjust the contact addresses accordingly.
> 
> Mario Limonciello (3):
>   MAINTAINERS: Adjust Dell drivers to email alias
>   MAINTAINERS: Add missing section for alienware-wmi driver
>   platform/x86: Adjust Dell drivers to a personal email address

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
>  MAINTAINERS                                     | 17 +++++++++++------
>  drivers/platform/x86/dell/alienware-wmi.c       |  4 ++--
>  drivers/platform/x86/dell/dell-smbios-base.c    |  2 +-
>  drivers/platform/x86/dell/dell-wmi-descriptor.c |  2 +-
>  .../platform/x86/dell/dell-wmi-sysman/sysman.c  |  2 +-
>  5 files changed, 16 insertions(+), 11 deletions(-)
> 

