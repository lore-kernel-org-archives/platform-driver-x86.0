Return-Path: <SRS0=isCl=DO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF84C4727E
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 17:30:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE91A217BA
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Oct 2020 17:30:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NSnIZBEX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgJGRa2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:30:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44694 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728560AbgJGRaZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 13:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602091823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mn8qhkF/UQEJzqV3x7unCgeZITrfss35bxaFGr6YI30=;
        b=NSnIZBEXyM7zk18aKmuVbfnE3eR6wqqp5g/clxxc3jvfRAzLEetJ4LUvBt/mOUoF0yNl4i
        UawIuEfs+ulGMBGVrIKbcc6cKLkj67SuzwTkL7p99h++RkoweAm1b+/Dbt9Fkf8+GOy2Fk
        ler4SV7I7topmRnVN5mVMlxpzK7yNi0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-VLJd6QRVNU6nz-qmEelZ3w-1; Wed, 07 Oct 2020 13:30:19 -0400
X-MC-Unique: VLJd6QRVNU6nz-qmEelZ3w-1
Received: by mail-ej1-f69.google.com with SMTP id c20so1069391ejs.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2020 10:30:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mn8qhkF/UQEJzqV3x7unCgeZITrfss35bxaFGr6YI30=;
        b=oOTeX/bqLUtAGCJDOzk0+RXqUw7/BgsLQaaUvgh1P5DyAIMgba5ZOhRD8PbJzwfzZk
         bfrYnkZ6D2TkmxlU+mxFqK2ZZ/jaxrde+v+k00nsLB7xdTcNMmqwYEOAd1H9h9JDYgsh
         8ttrAsh168cZPXNpOodE58EuCG1uynQKouuojhKYj5j1pbU+7zHTvvs5EfBfPM3Qwdoy
         ghCobgcR9DuL8l4dwZ/Ox+ybxCRfhn+CI/hu2uF2LZFB86AE7QuYJovODJjocJpvZhJO
         XzVdwr5gh1rPtKzGXss1rJnlax6zi60uLKKmJ8oSBsfooGnz9Mko3njYwnRyJfTVyI3e
         H4Fw==
X-Gm-Message-State: AOAM531QwUz5fmdk763DjycxdiW4B234JBa0KbDSBm50VAtpl4iFA+da
        HDpxZtOBX1Rc5iTH3IJW7OsjJZyiQ9+ItaV8F1t/NndU3d22UrxBmT9JsEDPRuQrfMGcSE0UXar
        1esSre+pJRDbmQD2K5KwaYb5Vn9PDRO0nEA==
X-Received: by 2002:a05:6402:2073:: with SMTP id bd19mr4618273edb.127.1602091818265;
        Wed, 07 Oct 2020 10:30:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjJHPa3INkuheoMTk446PsJmwdW/gSEDi1ZRRxEU+gBCBe4Nr92QxJI6odQucdV4YA52cmPg==
X-Received: by 2002:a05:6402:2073:: with SMTP id bd19mr4618253edb.127.1602091818075;
        Wed, 07 Oct 2020 10:30:18 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id bt16sm1950049ejb.89.2020.10.07.10.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 10:30:16 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: hp-wmi: add support for thermal policy
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200917214957.GD29136@mtg-dev.jf.intel.com>
 <20201004211305.11628-1-eliadevito@gmail.com>
 <CAHp75VfbK226a-SsNj=Bnpfc3wWyT9K_D4XzAMOu9of1_g+8-A@mail.gmail.com>
 <5d60709b-e3cb-685f-2b3e-07381b9855e5@redhat.com>
 <zm1oBveg0S9L-MagzWnleGj5ZfQg8cV95Ugbzz6WZbnv-nzpF8_9Fghwj8P8V-ZAmVF6kRBWF-blVcOFirhSN3xxmE_8cOUycONWZMJP5xE=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <37a0a8b8-6792-8ed7-2e66-da0fa1d6302a@redhat.com>
Date:   Wed, 7 Oct 2020 19:30:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <zm1oBveg0S9L-MagzWnleGj5ZfQg8cV95Ugbzz6WZbnv-nzpF8_9Fghwj8P8V-ZAmVF6kRBWF-blVcOFirhSN3xxmE_8cOUycONWZMJP5xE=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/7/20 6:21 PM, Barnabás Pőcze wrote:
> Hi
> 
> 2020. október 7., szerda 16:02 keltezéssel, Hans de Goede írta:
>> [...]
>> Elia, Thank you for your patch, I've applied this patch to me review-hans branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>> [...]
> 
> I don't know if the problem is on my end, but opening that url
> results in an "Invalid branch: review-hans" error.

Since I'm just getting up2speed in my new role today, I have never pushed
that branch out yet, hence the error.

I've pushed it out now, the mirrors which actually serve
the http interface can lag a bit, so give it 10 minutes and
then it should be there.

Regards,

Hans

