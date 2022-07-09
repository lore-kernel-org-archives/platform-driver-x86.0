Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C613BC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 14:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiGIO4X (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 10:56:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiGIO4W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 10:56:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE6CA1AD89
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 07:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657378581;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lhe0MLtyoBkpahosVrejSAhtzTQ5suZXiUqbUoZC8Os=;
        b=J1KtBXJ6wgoKFqZekhwZ3UI0o3kzdj9WTNTcv5ACtJ53u9aro45uJJg3xi9QzAIgKgPX5A
        8UqLOB4gVkz6EMptU5oKhQa5o0Q9piFa1IKtkPtK53auzb897xAsdog22LKlW4YW2pw4kC
        +pTV9+uqQBTkhIns5sQ1+2uCzkKblEU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-46-xhlc9ETFOkOFBWhjdzvgHw-1; Sat, 09 Jul 2022 10:56:17 -0400
X-MC-Unique: xhlc9ETFOkOFBWhjdzvgHw-1
Received: by mail-ed1-f71.google.com with SMTP id y18-20020a056402441200b0043564cdf765so1126992eda.11
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 Jul 2022 07:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lhe0MLtyoBkpahosVrejSAhtzTQ5suZXiUqbUoZC8Os=;
        b=OoS8KuRFU/AxqAeTbROavtpcxlj9U+zk9C5v+vtilzkd/GUkZa8oBPCR4GD3hiaEg0
         IF7W1XuCo8d/QyqdAqr/M3lafAXfb8XyGSitE9r6/uy4VKWsUG8QJmQHizmPEjomCJ2s
         eCxFRMNkywr8WkU09vMwkVedFbCnfF/nFk0M6SPY5io23R+pZt0sfQAHKOvPyEeU8oLw
         hjDTAWg/ME+HlTyKZzWExpHI+OsAEGWTtzcwo6fF8Hfz0yhm/xL2aWdxqVzY6W0oE04q
         0/bV9qF1Yz6x3DYFB+deqH1UVcH3NeIsNi7JG201EGkj6z9KLrpmTgLN6geRZLxUq7dQ
         7xSA==
X-Gm-Message-State: AJIora/NXQak2IFRJf3E6TUbS+ocbSjE9j6xx/Une8D8jYnJMt68Ik4X
        Hz5hLZAE3ta5mHUmjRGOKhSv/jxMS6dZeBWT0daJrmjlNtD7LEx9ytCvA451iNV0n5d2BY5Uomv
        4RrimElIyvrj2cpeKwTgKdb8A4fBCuFNHug==
X-Received: by 2002:a17:907:7ba8:b0:72b:1491:c73c with SMTP id ne40-20020a1709077ba800b0072b1491c73cmr8995982ejc.415.1657378576733;
        Sat, 09 Jul 2022 07:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tk8xtQIGFQOcmJKQJrfW5RgVDZYVRGPl9aPcP2hAw6MPO4bXHTwfaYbxpxXXpa5cElXNVuzQ==
X-Received: by 2002:a17:907:7ba8:b0:72b:1491:c73c with SMTP id ne40-20020a1709077ba800b0072b1491c73cmr8995961ejc.415.1657378576545;
        Sat, 09 Jul 2022 07:56:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id ch15-20020a0564021bcf00b0043a71c376a2sm1087446edb.33.2022.07.09.07.56.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jul 2022 07:56:16 -0700 (PDT)
Message-ID: <8b893c42-e514-bcef-0513-070b3723cdcc@redhat.com>
Date:   Sat, 9 Jul 2022 16:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: input/i8042: Malfunctioning brightness keys on HP Elite Dragonfly
 G2
Content-Language: en-US
To:     Alex Dewar <alex.dewar@gmx.co.uk>, dmitry.torokhov@gmail.com,
        tiwai@suse.de, markgross@kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20220629094314.b7xmfb3xccj7vs6v@ic-alex-elitebook>
 <3fedf676645bfa638c9a6c656121083abc2c98ea.camel@gmx.co.uk>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3fedf676645bfa638c9a6c656121083abc2c98ea.camel@gmx.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/5/22 19:25, Alex Dewar wrote:
> Friendly ping? 🙂
> 
> I'm also CC'ing the x86 platform people into this, as I'm not sure
> whether this problem is something more within their remit.

Please test the atbkd device with "sudo evemu-record" or "sudo evtest"
and if the brightness keys generate events there, write down the
raw event codes (MSC events).

Assuming the brightness keys indeed send events here, then:

After that you need to create an update to:
/lib/udev/hwdb.d/60-keyboard.hwdb to fix the mapping for your laptop.
See the "To update this file, create a new file ..." section.

You can find the DMI match pattern used in this file by doing:

cat /sys/class/dmi/id/modalias

Once you have things working, please submit a pull-req to upstream
systemd to get these quirk included in the offical hwdb. Or send
me a copy of the local 70-keyboard.hwdb override you have created
and I can submit it upstream for you.

Regards,

Hans



> 
> Best,
> Alex
> 
> On Wed, 2022-06-29 at 10:43 +0100, Alex Dewar wrote:
>> Hi,
>>
>> I'm running Linux 5.18.7 on an HP Elite Dragonfly G2 laptop, which
>> seems
>> to use the i8042 driver. Mostly things seem to work (including
>> hotkeys)
>> except that the increase/decrease brightness keys instead send the
>> "mic
>> mute" keycode. (The *actual* mic mute key works fine.)
>>
>> Any ideas? Do we need to add a quirk?
>>
>> Best,
>> Alex
> 

