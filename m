Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB78C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 17:01:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E595B6044F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 17:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbhFPRDY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhFPRDW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 13:03:22 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B284C061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 10:01:16 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id g12so48365qvx.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 10:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=60228.dev; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=cS/wwx7VQm5+ibl2JDCDmqqbPdI7yDANJSXZoVn1xj4=;
        b=Xcbco1YzNjD726fNbH/t2wm9GHBW3HmzhvhsUMW7G88h+6jkOWxnzAN0Q8aOg3okZS
         kq0jousA89y+vlI5xQ3O1N7ARNIBqy8nozC/8fPo3v76Tht+w6uummqj9MIHqC9+Ab3U
         5kpJ9rjvRhG6AI1Yz/wXMF8NO2FRJVPmcs3lNalA4NKvfBReQhv9r94K7T0aATclhkcI
         3EOERIIhV0r+UhmRhwL28bIGvKTBgP/9u/T9t7DmQySWnH4NbzRih0FUmyAoGH8cjefH
         0D/boax+lwZStmf2Bh4qKs1BcfibGA3NKJ2V/HFxvNzVBzH7b690yFOpmkNDfIuciFAs
         4dgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cS/wwx7VQm5+ibl2JDCDmqqbPdI7yDANJSXZoVn1xj4=;
        b=j1kR/gnFFvsA2k/2kgsmc9ckUlyIVyQ8AJY75Pi12YHvVIDjut0b9tlQMeaTAgETs5
         Ip8d1Lv3mXHAeUL51MHuHM8KiPCU/mlOPcOHzIZyp4WPhNH3vOhaHpVMFsY790MkJjYF
         EI1FUK2L5Km6zcghA2niIk7JXNQJsWfnkZP5Ny9lVw3QwtM6OBaRK9NeR90EiG+Pag0K
         ZNBLawfMJA24KEczckcRJTfulKkq28rQxi+UkC5lOQ1XNQRvOMe31mQF4ZCwQaPblNIG
         Za8GUExAPwJ9cJa11OORFLBpLRcAfWbK1blijXetAM2aNPtSXIqZAgGlEs6mK9ZW0qNT
         +3Rw==
X-Gm-Message-State: AOAM533Z5DmGmSUIeOtiNYvezbMsUnPIPF0PCQt89DKE0zZEn7uuUyKV
        6r6JPXEmwin/XROutmDT9HXXIA==
X-Google-Smtp-Source: ABdhPJynope5Jkc/WKNC1nJ/2hGIKRvPPEQuW+xtQwpheWzzV9binISPMyhtarK6f72tD666kZg9uA==
X-Received: by 2002:a05:6214:d41:: with SMTP id 1mr949750qvr.6.1623862875284;
        Wed, 16 Jun 2021 10:01:15 -0700 (PDT)
Received: from [192.168.1.107] (cpe-158-222-150-74.nyc.res.rr.com. [158.222.150.74])
        by smtp.gmail.com with ESMTPSA id p12sm1555348qtw.61.2021.06.16.10.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 10:01:15 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Jafar Akhondali <jafar.akhoondali@gmail.com>
References: <20210615221931.18148-1-leo@60228.dev>
 <2731fa44-7727-df4a-9214-91a5311ef3cc@redhat.com>
 <2b18b417-6c2b-4edf-de4c-42a04dc5882a@60228.dev>
 <03ed17f3-60e1-f88f-d9e3-7fd388fa8ad9@redhat.com>
From:   leo60228 <leo@60228.dev>
Message-ID: <3b6e5d63-b1a3-2fa2-06e6-1312e6a1ad2d@60228.dev>
Date:   Wed, 16 Jun 2021 13:01:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <03ed17f3-60e1-f88f-d9e3-7fd388fa8ad9@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> Ok, I'm afraid that using your real-name is a hard requirements for kernel
> contributions.

Okay, thank you.

> Hmm, but you do have both 4 RGB LED zones which are addressable per zone, are you saying that the code for supporting that basic functionality is also different ? Note Jafar's driver did not use the LED API sofar, it was simply forwarding an array of bytes from userspace to a WMI call.

Jafar's patch is for method ID 20 with a 16-byte buffer, while my 
hardware uses method ID 6 with a 4-byte buffer. Method ID 20 doesn't 
seem to do anything on my machine.
