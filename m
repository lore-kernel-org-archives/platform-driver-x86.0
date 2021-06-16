Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26119C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 16:39:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0022561359
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 16:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhFPQlw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 12:41:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22358 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229693AbhFPQlw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 12:41:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623861585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LCqzujIKp4dNpob3+QQ+wvYYX2YCQs+AyIAQq2jAt0Q=;
        b=G06cGlnOmI/Q8Pdnzh+BhLtIbbL6C57gzpb3YykqmSId0JQvBcKtTgwiM6mIs64dwPOPMv
        /EexkTwiOzV4aQE934wY2qfJf6cyanurzPuFB2qDTYIh2350P04Gdua27NO/lTjMb4o3Lr
        Azk83Leam++SyuXSAF8mv0YwZIRygKM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-PwOaF91YMnSa0aW7GKGWSw-1; Wed, 16 Jun 2021 12:39:43 -0400
X-MC-Unique: PwOaF91YMnSa0aW7GKGWSw-1
Received: by mail-ej1-f72.google.com with SMTP id n8-20020a1709067b48b02904171dc68f87so1167308ejo.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 09:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LCqzujIKp4dNpob3+QQ+wvYYX2YCQs+AyIAQq2jAt0Q=;
        b=JWHvK6YcuW9WcB4AcuSFQdVi6QmL+DVdwnIiSeE1T6puvkv4Y66K1fzUkI5g1/f/Wj
         NhYlczSnL1WzuPvbT02DrdyAuuL5zO2E1CWrJXP89kOkmBt1wUIvg3ipCxQ8Zq82UpDf
         wDBcLvTVoLa2sTNN3kewEh49tOlWXoLG7GmrziU0AGuoV4V4f1zYsjXg6QKjTh9lVGEf
         xinBEtA50wh/It0eSZCwtCs12kXTCEXgs51bx/4UqSu6jpH4gMajlc/PWsLWY0q0QORt
         aSEy+TNtA7oDE7b49E4SPUUZuoBxtvjW0/sM62RrN8TGnNs30qBKJEEd3pn60sG0mjea
         dpqg==
X-Gm-Message-State: AOAM532BatpdKxtbto6mYBW5loACS9DIpIPFdMLvPRVsfzAYBU/X8D2M
        uil64Eheqly5HJkMNjSkjfUSf6cuBBhw+/hYCFGRlyYWOqJjbMoeXijTHNRyQHK7r463I2UhsaM
        DrNWZnPH4MSaQzlxGGVTJGX50zpJNLBMnJg==
X-Received: by 2002:a17:907:263d:: with SMTP id aq29mr423043ejc.464.1623861582461;
        Wed, 16 Jun 2021 09:39:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLxurgWUzF1W8Ds0rw0hnpwYnStsVrO5+Hg4YN054O/NFB67YrIV/Lz2WyaDWRaELW78terw==
X-Received: by 2002:a17:907:263d:: with SMTP id aq29mr423032ejc.464.1623861582332;
        Wed, 16 Jun 2021 09:39:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ch17sm2209961edb.42.2021.06.16.09.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 09:39:41 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     leo60228 <leo@60228.dev>, platform-driver-x86@vger.kernel.org,
        Jafar Akhondali <jafar.akhoondali@gmail.com>
References: <20210615221931.18148-1-leo@60228.dev>
 <2731fa44-7727-df4a-9214-91a5311ef3cc@redhat.com>
 <2b18b417-6c2b-4edf-de4c-42a04dc5882a@60228.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <03ed17f3-60e1-f88f-d9e3-7fd388fa8ad9@redhat.com>
Date:   Wed, 16 Jun 2021 18:39:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <2b18b417-6c2b-4edf-de4c-42a04dc5882a@60228.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/16/21 6:16 PM, leo60228 wrote:
>> We only accept contributions under real-names, so you need to
>> use your real first + lastname here.
> 
> I'm thinking about what to do here. I generally don't use my real name online.

Ok, I'm afraid that using your real-name is a hard requirements for kernel
contributions.

>> Also the GUID you are using:
>>
>> #define ACER_LED_METHOD_GUID "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
>>
>> Is the same one as used by another recent patch for adding
>> keyboard LED zones support for Acer laptops:
>>
>> https://lore.kernel.org/platform-driver-x86/CAMW3L+24ZGowtpURUbjoCoA+eZMF0wDae1izxS+HM2uz1L9Rig@mail.gmail.com/
>>
>> I've added Jafar to the Cc here.
>>
>> So it looks like we have 2 people working on the same driver,
>> please coordinate between the 2 of you to submit a single driver.
> 
> I looked at that driver and our hardware seems very different (mine doesn't have any support for the special effects, for example).

Hmm, but you do have both 4 RGB LED zones which are addressable per zone, are you saying that the code for supporting that basic functionality is also different ? Note Jafar's driver did not use the LED API sofar, it was simply forwarding an array of bytes from userspace to a WMI call.

> I agree that we should likely collaborate, even if that's just to ensure this driver works on more hardware.

Ack.

>> All these lines can be replaced by a single:
>>
>> module_wmi_driver(acer_led_driver);
>>
>> statement.
> I already submitted a V2 fixing this among other things, sorry abou
>> module_wmi_driver(acer_led_driver);
>>
>> statement.
> 
> I already submitted a V2 fixing this among other things, sorry about that. Do you know if there's anything I could've done to make it more discoverable?

My bad, I did see the v2, but I accidentally replied to the v1.

Regards,

Hans

