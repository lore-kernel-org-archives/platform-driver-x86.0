Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F79C63798
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 13:33:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1748D205ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 13:33:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WvsZEAbV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388288AbgKXNdc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 08:33:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25204 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388279AbgKXNdc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 08:33:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606224810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r5nMdcBzU/W2BMh3YXcT9Lf5eWQWNS9alB41K4E+Lz4=;
        b=WvsZEAbV3f96E8m5uwQeiwgRs8bd1XkjfN6bd5NE4cgTeuU13ZXuLieYbqN/xbztxNbnoj
        19bUDlf851zFHfN2kEW95ppXJzaZekDx8l4LyFD8rLoHeMoRGPbqmkXqU9IiZimNtyF+/X
        N0dqjUyl5snbMBDm/4lKeXhvAlLLaxE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-elJr-vWzNbuA58L9jA92CA-1; Tue, 24 Nov 2020 08:33:27 -0500
X-MC-Unique: elJr-vWzNbuA58L9jA92CA-1
Received: by mail-ej1-f69.google.com with SMTP id k2so5051949eji.21
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 05:33:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r5nMdcBzU/W2BMh3YXcT9Lf5eWQWNS9alB41K4E+Lz4=;
        b=jB5yUcW1WfalA7qFyUL/s+llGAthsVcwzBqSHqXoMBx49iBIr2G6JiPVfncKb8JKmN
         BInEE/wc0w701ri2C3NCLbGt2aGDr+udHsZdMieGuB/3UG9PcefFvXIEHmFph/or67Uv
         3xJLZ929Ucu3KnuXm7BGsIhfTeXOVFW0yQ084C7RORYrscfMDR4WMu3AtCg+Op+Nhc4g
         3SKhgF1LVDeHlF4i3EVGNhiMuN8pyW37BRLxoxSCR0IGGqf2Z+O9Qio3qNY8BnM1prKB
         +RWnZet73FD6s7kXpxUAxXWiVxa5TsWfQfcB/1PozPj3MrhyQoDvNqAqujiFPuNUGWym
         DGuw==
X-Gm-Message-State: AOAM5339urpaEqagkXtif6I8UJQKoo3+LUDykR5TXlZrW580GsuZIYrY
        BnDkjdQS4F8SoJXGazZCD7J0uEvxhsXZSAegaTIPHBUHGOBXJH97Vr37uhxghRgl3OH3j6f1qGU
        bcAhmKbCneR0HUsaYsx0M7jgGJAFbLAi2BNWYW8H3l13t2tTMtZEdJWhvkFYuejHcPRRwTq11Jn
        c6fv12U7zI3Q==
X-Received: by 2002:a50:d617:: with SMTP id x23mr3907115edi.361.1606224806028;
        Tue, 24 Nov 2020 05:33:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykwzzc1MHv334jydxvJM5WY4WnC5JA3+Mvg/yVhFTw8g0Vmg6JinZKQjdu44ammMMD0Q8gcg==
X-Received: by 2002:a50:d617:: with SMTP id x23mr3907095edi.361.1606224805788;
        Tue, 24 Nov 2020 05:33:25 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id t11sm6722991ejx.68.2020.11.24.05.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 05:33:24 -0800 (PST)
Subject: Re: [hp_wmi] Recieving same keycode from two keys
To:     Rhys Perry <rhysperry111@gmail.com>
Cc:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <Q5ZWCQ.DX8TK304ORAI@gmail.com>
 <CAGTBY+sgwYrDPtQgJV=TcXJ73n8TGf9Nw=arCfWMUrVFzAsEVQ@mail.gmail.com>
 <HTSPI6-Ba3MfCgVG7q_YbRF6mUqskmyRdtSb_7eE2G7oCi_rSo5UP1ZKRK-qVfzSZ1zm_5sNp5hUorvgRz3VF8RM8b8361CLzbq4X5z59hw=@protonmail.com>
 <CAGTBY+vQ+UMPqFCwKMS0L5=F3eqQ21UtGETgmE+Le=SXcaWS2w@mail.gmail.com>
 <bjucdDbwHvavLvYVkhboo_jhvKC6ccqAslFPuuYO0ZZcgTZZaICda3WMFZhw_zS1o1m7VanyCmaJ4HZMqgyXwsCfqJFDGxb_1A4pdNCe8Bw=@protonmail.com>
 <CAGTBY+tso9BKJwe5F5bBU_RAo0yrwtYf=kGm1UvMpTJurS00MQ@mail.gmail.com>
 <A3oiTx-vaeJfCMZHt3dL_jvvIWiEDWGcOZxpZCVSzWYHr94r7jmHVKP01ApdKc1mZdcKsmwrr0O4e_L5MBSgU_LcsyOpGLx9xbZjX1q900Y=@protonmail.com>
 <CAGTBY+t9fh6P-iCcvKNm4S2==SgGMCrQL5kh00n=_G4WpzFNOw@mail.gmail.com>
 <f7786f2f-b770-4875-26be-9e48b4cb914c@redhat.com>
 <CAGTBY+t+QpPTeW9NnEnRP1eF==AEdKAcCAmtWfCmnjK1ZOgL3A@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <11193213-8f83-4946-767a-a89347164393@redhat.com>
Date:   Tue, 24 Nov 2020 14:33:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAGTBY+t+QpPTeW9NnEnRP1eF==AEdKAcCAmtWfCmnjK1ZOgL3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/20 2:28 PM, Rhys Perry wrote:
>>
>> Hi Rhys,
>>
>> I just heard from another HP user that updating his BIOS fixed this for him,
>> are you at the latest BIOS for your machine?
>>
> 
> Thanks for notifing me, I just checked the HP website and there *is* a
> bios update available for my laptop (released on Jul 7th). However, as
> HP does not provide BIOS updates for my model through the LVFS
> (desptite being a member), I am going to have to reinstall Windows -
> which, as I am sure you can appreciate, is not an enjoyable task.

Yeah I've been there myself and I did not like it much either.
Tip if you have not installed Windows 10 for a while, do not
give Windows network access during installation! Otherwise it will
force you to create a Microsoft online account.

> Especially trying to stop it messing with my pure Linux install.

This webpages lists some other options which you can try:
https://wiki.archlinux.org/index.php/Flashing_BIOS_from_Linux

Note the results with this might vary, you might be better of just
biting the bullet and re-installing Windows...

Regards,

Hans

