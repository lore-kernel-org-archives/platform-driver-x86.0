Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAD31C47076
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 16:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7253613D9
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 May 2021 16:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235768AbhEUQ7e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 May 2021 12:59:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33697 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231917AbhEUQ7d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 May 2021 12:59:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621616290;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VojTeZKFK9PJGOUd3X9HN/meFrWzT9f62q8BuQnov1w=;
        b=AgQaOxE2kvp5/DMA0YpN/3ghIYdxONnlQm91FXzXZI5BAWlZa7ywvk0tGidMqOs349en8x
        q+vbrZn4NQAyM9KqUUt/0hFA228hPY2gw5x4shN9OXI3Yamq5nfxB8hF/UGa4y8MgCCJpE
        4YWrhrRIqFlTc+Bcb4B1o3ZZ/1UVCHg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-71bG1vGMOPOi4E_NBoUkQQ-1; Fri, 21 May 2021 12:58:08 -0400
X-MC-Unique: 71bG1vGMOPOi4E_NBoUkQQ-1
Received: by mail-ej1-f70.google.com with SMTP id x20-20020a1709061354b02903cff4894505so6429106ejb.14
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 May 2021 09:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VojTeZKFK9PJGOUd3X9HN/meFrWzT9f62q8BuQnov1w=;
        b=f8dOUiytXdgay/SGuCRXtHwYVYU7i2/a6Axxm5hF/G151Q5Paahgdy1RpC1S23MT6Q
         oHV41dTWhjm8fNmTK1zHEe4Zt2tvH/DiLrdMflvyaOfn9XiU7GVSIftK8zE+L3Yqyc25
         l+ojnKcb8n4ROAvYd4FFjE0RaLLbTdf2QMFyS0WAaQ6E59SWDJmW1dZLcQQhWpl7iYpg
         pogGHgrWvuD3ISI5m93RoalKDMWK1M43NoXmdIsHazXA70P3AkqRfG4NLDUIYdIBNHxs
         BMt2ves7x9Rcx084nE9S6wqgbZFqDgFV2S5wC9gAbg8PoVS+kM12vCNDLiRzliEBHHIe
         J/AA==
X-Gm-Message-State: AOAM531xEiEDutzlxrL4Fln4LtUPbZCa2qB+Nqtz7sxobqMkikDHp5b8
        We1ul7/ToSMLxXTt78nqcOr849na+CITy3chDFxBR/G7omOS4gjHo2zoyAXePX30VbkTvv6F+5F
        W8b7xYH9R9gXoc+6pisRPxqWI6wkeZ6yHnA==
X-Received: by 2002:a05:6402:17d9:: with SMTP id s25mr12139966edy.337.1621616287428;
        Fri, 21 May 2021 09:58:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy98pEvLlP1FzPi912wf+uy7l7QAd8jCgg1bs5C8GAUzcIzy3jEbDdR6gOp1ZH05CFh139jaA==
X-Received: by 2002:a05:6402:17d9:: with SMTP id s25mr12139954edy.337.1621616287262;
        Fri, 21 May 2021 09:58:07 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a21sm3947276ejy.85.2021.05.21.09.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 09:58:06 -0700 (PDT)
Subject: Re: [PATCH 0/2] Remove GA14/15 quirks to acpi/video_detect
To:     Luke Jones <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210419074915.393433-1-luke@ljones.dev>
 <3559f449-7d43-bf6f-0047-3138fd303db8@redhat.com>
 <HEDGTQ.IHJJLIVNVMJ21@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1e25d42c-005b-dcc5-a016-06f0d698de73@redhat.com>
Date:   Fri, 21 May 2021 18:58:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <HEDGTQ.IHJJLIVNVMJ21@ljones.dev>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/21/21 12:35 PM, Luke Jones wrote:
> Oh, thanks Hans. I wasn't sure how a git revert was meant to work and assumed that
> whatever git did was fine.
> 
> I am absolutely happy for you to take care of those issues and push ahead.

Ok, I've pushed these 2 patches to pdx86/for-next now.

Regards,

Hans


> On Fri, May 21 2021 at 12:24:13 +0200, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi Luke, On 4/19/21 9:49 AM, Luke D. Jones wrote:
>>
>>     Revert two commits to allow a patch to acpi/video_detect to correctly set the backlight control as native. Luke D. Jones (2): Revert "platform/x86: asus-nb-wmi: Drop duplicate DMI quirk structures" Revert "platform/x86: asus-nb-wmi: add support for ASUS ROG Zephyrus G14 and G15" 
>>
>> Thank you, since the matching drivers/acpi/video_detect.c have been merged by Rafael, I've added these to my review-hans branch now. But there is one problem, these miss a: Signed-off-by: Luke D. Jones <luke@ljones.dev <mailto:luke@ljones.dev>> In their commit message, I assume this was an oversight, so I've added this. If you can let me know if this is ok, then I can push these to for-next. I've also rewritten the commit messages to explain why things are being reverted, see: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans <https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans> Regards, Hans 

