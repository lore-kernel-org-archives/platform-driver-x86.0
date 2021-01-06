Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5796FC433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 21:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 252DD2313B
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 21:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbhAFVJb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 16:09:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23749 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725922AbhAFVJb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 16:09:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609967284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wjdvx1byGsS25UTbB7hPdv++FygQg2vDPz/Au7xS9qk=;
        b=PA1o4f+q3j7dqsDe1mXeGpZD11A0AarsUpz3Uz518vTuXA9jTnQ9X5+JrcSiz7tZ0grERP
        7cuLQN6ForJ104BM/uEMJCHz8idVoy3+t5DaAiGKMFJ+wPOO2RTB1kfQw8dQIIF34zukd+
        oipwbYeU0YmTr0/+pni/GbvGgiSBbus=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-X1yXG8pzMfeZKTynuOMzPw-1; Wed, 06 Jan 2021 16:08:02 -0500
X-MC-Unique: X1yXG8pzMfeZKTynuOMzPw-1
Received: by mail-ej1-f72.google.com with SMTP id he8so1787218ejc.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jan 2021 13:08:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wjdvx1byGsS25UTbB7hPdv++FygQg2vDPz/Au7xS9qk=;
        b=tvKTs3K8sNdo33bzAgIkcLK53lwmC8jlsWDqODY/ryNrhxeky3iTwScDk3yh6+VDIi
         n9ez2BBMJkyCWBzRpI4Hxy5VQa7l6Ypez2hpIQNVc1xVQw8Vy1itqstFYthj/Y2IMONt
         qXfXWoxnWf5ag5MiBLLNMxy027S2y2fLQkWOzLZLvHm6ejWu95D/EcLViS3zJOGn05Ih
         pVlix6BZ8KaVoz+rIa9rOGwOKJZK8ge8E+twx0jmN0XONZaGB1DJ0ErSJ8J5/bvT/wXh
         1EkZV7KXIDi6ok/jO/EDOxiTNJMgdzFVgYDtbkUookTFq2qicQO04Pzi+WHsYzRjE6/N
         tHuw==
X-Gm-Message-State: AOAM531S+avQ3KK+gQLoxZEebbNipGhTZFJ2Xe3pw56wEZ++kCdCj6CE
        v2BCbP5ZE2hBJArIo19YkLEWAmE/PQvcwDylutaQ51xRCg3ImMlKDudi5G428dr83o77xw35Qsc
        T8aLaOBXs7LvpiPjMLpUewJ/fP3YMXk+NZw==
X-Received: by 2002:a05:6402:1d0f:: with SMTP id dg15mr5189424edb.1.1609967281722;
        Wed, 06 Jan 2021 13:08:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwWDpbilXHmjvGdTM09+rW7IW1lvr5svW8jK84ZpC/JslZTj6icuJH2r7jAu9i5p5t+EJ2gMA==
X-Received: by 2002:a05:6402:1d0f:: with SMTP id dg15mr5189411edb.1.1609967281529;
        Wed, 06 Jan 2021 13:08:01 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id oq27sm1674341ejb.108.2021.01.06.13.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 13:08:01 -0800 (PST)
Subject: Re: [PATCH 00/24] platform/x86: ideapad-laptop: cleanup, keyboard
 backlight and "always on USB charging" control support, reenable touchpad
 control
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
 <d7fbc7ed-801e-0cc2-7433-a829e48f4ec8@redhat.com>
 <J3-J89FbEfOIFJXsEo9jy23l2lFJ1QIe_VecEe_Z5v24gd3SgLAyAhxgJ0gq2IB0dFc1OSCuV2-O3YFMEgqkn_katLZqCJ2_YBNaegDgjOU=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c9a8f27c-04f0-462a-971a-2970513643e9@redhat.com>
Date:   Wed, 6 Jan 2021 22:08:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <J3-J89FbEfOIFJXsEo9jy23l2lFJ1QIe_VecEe_Z5v24gd3SgLAyAhxgJ0gq2IB0dFc1OSCuV2-O3YFMEgqkn_katLZqCJ2_YBNaegDgjOU=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/6/21 9:49 PM, Barnabás Pőcze wrote:
> 2021. január 6., szerda 19:23 keltezéssel, Hans de Goede írta:
> 
>> [...]
>> Thank you for this series, it is good to see all the
>> cleanups, as well as to see the new functionality.
>>
>> Patches 1-20 and 22-24 look good to me and you may add my:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> To them for v2 of this patch-set.
>>
> 
> Thanks for the review.
> 
> 
>> I have some remarks about patch 21 I will reply to that one
>> separately.
>>
>> One minor remark about patch 3/24, normally we put all
>> the #include <linux/foo.h> includes first (sorted
>> alphabetically as you already do in the patch) and then
>> follow up by other / subsys specific include such as
>> acpi/video.h. Again sorted alphabetically for the file-names
>> after the subsys dir. I don't think there really is any
>> preferred order for which subsys headers to include first,
>> but typically the generic linux/foo.h headers are included
>> first.
>>
> 
> I will change the order as requested.
> 
> 
>> Regards,
>>
>> Hans
>>
>> p.s.
>>
>> About merging this series vs other outstanding ideapad-laptop
>> changes. The other outstanding changes are quite small, so easy
>> to rebase. As such I would actually prefer to merge this series
>> first. So if you can send out a v2 soon-ish, then that would be
>> great.
> 
> That would make it harder to backport, no? As far as I remember, the patch[1] was
> sent to stable@kernel.org as well.
> 
> [1]: https://lore.kernel.org/platform-driver-x86/20210103033651.47580-1-jiaxun.yang@flygoat.com/#t

That is true. So lets get that patch merged first, and then you can base your v2 on top of that.

Jiaxun, can you send out a v4 of your "[PATCH fixes v3] platform/x86: ideapad-laptop: Disable touchpad_switch for ELAN0634"
patch addressing my review remark on v3 ?

Regards,

Hans

