Return-Path: <SRS0=kju6=DU=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5233DC433DF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Oct 2020 08:48:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5AD12137B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 13 Oct 2020 08:48:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d1Wp+q8P"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403985AbgJMIsr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 13 Oct 2020 04:48:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28298 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403976AbgJMIsr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Oct 2020 04:48:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602578926;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=L/QWwyJCZVVi79Fpwwugg94L9LWczQbwfUHt0ZL/p3g=;
        b=d1Wp+q8PTl6yPfn1UQ7Bvc7feEkyfqGDjPnVqpaY0x/ITl8Ayk4b0M2d25lztin6010uzI
        hfvjkwcos1Qq/7IniPc1tTs4jdKOhL5XcNqWHybjkZkQwmWSy1FooThaoS/4WpK1OLFiH/
        NEKV9c3G5BdIpD2oMu1dsLKNtCd+NME=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-djzjL_iWN0ypWraJhO5Bxw-1; Tue, 13 Oct 2020 04:48:44 -0400
X-MC-Unique: djzjL_iWN0ypWraJhO5Bxw-1
Received: by mail-ej1-f71.google.com with SMTP id c10so7379977ejm.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2020 01:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L/QWwyJCZVVi79Fpwwugg94L9LWczQbwfUHt0ZL/p3g=;
        b=US4Fe+IB0CAwSE9C//0KQwSBd5Q134tqmZZQRgcIONPg1Ff2Xdrv3ycNGjgTBR/tKY
         WsiLgjhUB7YBUobQ2FBu1gaHkB+v4fFEOWK/x0ZrZM5elTlcOiFFRmmEufMkM01P+3Hj
         jTdPn8KhtGYzfhTGoue7DZCCeMdbXfZdzceNGq2I0/GKYLyfhuPK0do2iJLVuv4vQpY1
         rygBIh61xBliRKxwRRjfCI9ABul0yMm8l0l8/IDsQFCuCWUHbJiqBqm9CgmV7jGWPBHw
         xoakl4+AKE/APzEKn8rNeaALBkKd2h4NjBiGn5GoUarb4BoNDg3nnw3pPwxYD+8eoMys
         W9rg==
X-Gm-Message-State: AOAM5317pd3PR5WEJRjeC0+BtZAi4o33/sIIsAdxyyTD4aw2NiiCgrpG
        Wdw/0PNqk7D/V32amqo31t8ZB+4N//rMlz/v3ifJ1XPYon1/BW7r280z/iRGuiHr2uk55F7jKy2
        fWX6ibWDtLcTamIsafZJnLYVt12mbAJWLEw==
X-Received: by 2002:aa7:d4d8:: with SMTP id t24mr19434263edr.247.1602578922897;
        Tue, 13 Oct 2020 01:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkImKSu++3puTyZJwJQzVLd6jKat579AuQM33hTsdLksyUK9sskK1mHYSCtX/CgETiRSSYEQ==
X-Received: by 2002:aa7:d4d8:: with SMTP id t24mr19434238edr.247.1602578922662;
        Tue, 13 Oct 2020 01:48:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id m25sm11908739edp.36.2020.10.13.01.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2020 01:48:42 -0700 (PDT)
Subject: Re: [PATCH 1/2] x86: Remove led/gpio setup from pcengines platform
 driver
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Ed W <lists@wildgooses.com>, linux-kernel@vger.kernel.org
Cc:     fe@dev.tdt.de, "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20200921215919.3072-1-lists@wildgooses.com>
 <d4b2045c-769b-4998-64cc-682c01c105fb@wildgooses.com>
 <8058a804-a793-a5f8-d086-0bb0f600aef9@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9fb836bc-7d8a-b6e2-8d73-8e74a8f2e38b@redhat.com>
Date:   Tue, 13 Oct 2020 10:48:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8058a804-a793-a5f8-d086-0bb0f600aef9@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Enrico and Ed W,

Quick self intro: I have take over drivers/platform/x86
maintainership from Andy; and I'm working my way through
the backlog of old patches in patchwork:
https://patchwork.kernel.org/project/platform-driver-x86/list/

On 10/12/20 9:39 PM, Enrico Weigelt, metux IT consult wrote:
> On 22.09.20 00:17, Ed W wrote:
>> Hi, I've been adding support for the PC Engines APU5 board, which is a variant of the APU 2-4 boards
>> with some nice features. The current platform driver for pcengines boards has some redundant
>> features with regards to recent bios/firmware packages for the board as they now set the ACPI tables
>> to indicate GPIOs for keys and leds.
> 
> NAK. Breaks existing userlands in the field (literally field), forcing
> users to fw upgrade is not an option (field roll would be realy expensive).

Thank you Enrico, I was wondering the same (what about userspace breakage)
when I was looking at this patch. It is good to have confirmation that
userspace breakage is a real issue here.

And I completely agree with Enrico, we cannot go and break userspace,
so some other solution will need to be found here.

I'm marking this series as changes requested in patchwork, please submit
a new version which does not break existing userspace.

Regards,

Hans

