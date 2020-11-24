Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91296C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 21:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39551206E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 21:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XvdJmcGr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732626AbgKXVf3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 16:35:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53287 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731366AbgKXVf2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 16:35:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606253727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Rkctz2It/LN7Uw8BGDVC+OZbVS5mvvHr+t0p7TbnkyU=;
        b=XvdJmcGrs2oU4Y8betS/mUydF7YrtJuwSlOe8oE5jFbomXB07mTFRlozACA1sMqYN7rbGd
        9+ANyFbTQ4U5HAuoA7NMkGpZBGEM22ezQRRtUloOpayPlODCh9pMin6afjQJdgQ1HL+3p7
        LFQpOeUMWfZute7KVN2I+Y9wQQPE5sw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-mxQP4uHzP-G5uBaYAF68gQ-1; Tue, 24 Nov 2020 16:35:24 -0500
X-MC-Unique: mxQP4uHzP-G5uBaYAF68gQ-1
Received: by mail-ed1-f70.google.com with SMTP id y11so168434edv.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 13:35:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Rkctz2It/LN7Uw8BGDVC+OZbVS5mvvHr+t0p7TbnkyU=;
        b=gw95n5oEy9nQCj24vAOKdVtI93s6/6smLK6EOGWpTXMdeMJYOEsB5+MfToEm+RyT8Q
         NAuDPlWempMerKw590fR0BHapjjk9phOg1tZBdJsffbmC6AbfHEREj78fxxRENEUVOy7
         zMojbGqFCrneAb6AjGeo27UaCIThUmvDvZPwj7+hHRzzZc5z+GKwjft1VcD4dASHpqnK
         +nXhhVyidjhFp4w1y+1JoJNgvc4T/78p1w2crJs7DVOg/OKs1fyR1Op+R1gbv/avDsUN
         +s+/rhKT6EbPfGNIyMFJjQZpOnks9TZfV9V4hwG5TwQe0CNtXp+zZwTh6MBIgcEYOHq5
         YdJA==
X-Gm-Message-State: AOAM530hVygGOnjQ54ozL1UQUr7K2UQVVgtJoTmHkKrqrp40uNCVdVmw
        qCnvI3/gsK5Hgbvo+OrASNK1EL8oiXnOXtSZgIbgbuxz6Nz+upu6o6Dxn6mKr2Fg2dBuaA0j+vI
        mAXxize8y41fbLNKgY9qbKMQ++3KA4Ye+7A==
X-Received: by 2002:a50:bc04:: with SMTP id j4mr505749edh.316.1606253722684;
        Tue, 24 Nov 2020 13:35:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqH8hvVEeNPHZ0m+XqragjupNN/2ZNoKAoANhhm/gTM0uSLGL+hEHPlfECuHiTws2AdjpiPQ==
X-Received: by 2002:a50:bc04:: with SMTP id j4mr505734edh.316.1606253722453;
        Tue, 24 Nov 2020 13:35:22 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id z2sm72007edr.47.2020.11.24.13.35.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 13:35:21 -0800 (PST)
Subject: Re: Asus Zephyrus G14 GA401IH-HE003 problem with sound and fan
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mamchyts Dmitry <mamchyts@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     andriy.shevchenko@linux.intel.com
References: <CAC+zXp_w2T5BYvzC+rF+7LGsgn64+9rLt8BT-=X2XE7qKqG=QQ@mail.gmail.com>
 <0c2fd9aa-7af4-5adb-ae6d-923c5eefb0b8@redhat.com>
 <dd32369a-f85e-45f2-dbc3-97721a253de1@redhat.com>
Message-ID: <6b34e486-69bc-4d1d-5217-44936cc57de7@redhat.com>
Date:   Tue, 24 Nov 2020 22:35:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <dd32369a-f85e-45f2-dbc3-97721a253de1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/20 10:34 PM, Hans de Goede wrote:
> Hi,
> 
> On 11/24/20 2:28 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 11/12/20 8:19 PM, Mamchyts Dmitry wrote:
>>> I got an Asus Zephyrus G14 GA401IH-HE003 with AMD Ryzen 7 4800HS and a
>>> NVIDIA GeForce GTX 1650.
>>> I am use 5.9.8-050908-generic kernel from
>>> (kernel.ubuntu.com/~kernel-ppa/mainline/v5.9.8/)
>>>
>>>     dmamchyts@ga401ih:~$ cat /etc/os-release
>>>     NAME="Ubuntu"
>>>     VERSION="20.10 (Groovy Gorilla)"
>>>
>>> I have some problem with sound and fan:
>>> The first problem is a sound from notebook speakers: when I use
>>> headphones via 3.5 jack - all works fine. I can control sound level
>>> (from low to high). But when I try to listen to any sounds from
>>> notebook speakers - volume always has a high level (I think it's a max
>>> level of notebook speakers sound). I am using KDE, and I hear a sound
>>> level of 5% the same as 100%.
>>
>> Next time please try reporting 1 issue per bug report. The
>> platform-driver-x86@vger.kernel.org mailinglist is the right address
>> for the fan issue, but for the sound issue you really should send
>> a separate bug report to the sound/alsa developers.
> 
> I asked the sound devs what they best place is to report a bug for
> this and they told me the best place is:
> 
> https://bugzilla.kernel.org/ - category Sound(ALSA)

p.s. they also said:

> Usually, the first request to reporter is to provide the the output from
> the alsa-info.sh script (in alsa-utils) to see the sound specific information.

So please attach alsa-info.sh output to the bug when you file it.

Regards,

Hans

