Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56076C48BE6
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 16:16:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B841610CA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 16:16:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbhFPQTA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 12:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbhFPQTA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 12:19:00 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D848AC061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 09:16:53 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id k11so3246300qkk.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 09:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=60228.dev; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Dab3+E5shEgN2Lqnh6ChlHTwvuTupBI2Oa5+eY8Sykc=;
        b=MY5bRPltJoKVA99JafYZw76tC7UjFCu3ibP8T72DXgCMEFjW7qFDtYasFNPZr4xTuE
         QYmQsDQ1fcPCHBsyn+EMgAiuWiK/8fSRWx+8NSErql0+8GY0Gkw32XcXIU4yQ5zoGVqZ
         W/01vxJngtcvap1ep5xIgaySb3IH6WwALPMBEU7g3XA1jI+aBGByBUUooQaPeo50cMTf
         10Dub7A7AYbIn9VKxraI54IM2XYN7V+uyTeezR+fsLaSRS8Q4Au5okhYMFPqevjjy2/E
         eFcccuAK1lT0Qo4ECcNX7rPV6/423Euk/3zZ19z8o6O85FZZqZks28CbZi/oIABdyTPg
         B/nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Dab3+E5shEgN2Lqnh6ChlHTwvuTupBI2Oa5+eY8Sykc=;
        b=ILdEzvPREppQ0lYVvGYg6jAR1RpjAVlJgo2OjlKJ1IvbfyIqF5MkKv9mIwGARs2DAt
         WEiaEhL/Qybkirnko4DXKXTADIyYJmS8js7hHm4T4T0S+HKyBE9JWNigRLGnW5JTkl9g
         ukgqXQPwwOKsTDv7I4pQ0dVgK2cXJVcrerXnH35l8yLex9B8FFGUA0N/CcwVopLtDfrZ
         N5BGwRyrNGWZdNOXTVm9cGEbLgiT5kjdjcmahJV68zURKlMALvuUcqnpgIbN4AHo3wiw
         2J7KopgUkdf86h6nv7ybKaddwfwKHbSNfONGMkH4vJK4YJ2FbKNyCfcqvKTZXYcH5Bid
         RU0g==
X-Gm-Message-State: AOAM530EVKJAUlJE1/esFG5D9fJXZBsOG7dJTkHmTYj3TvscsTH38o2o
        nZc2so1Of/yBG05RZr1r7dMEFqmkmZb5LGiWbpIuFg==
X-Google-Smtp-Source: ABdhPJwVrD8fzmmCQTwVf+yiyNIe0+pADUR5xWPauw1x41gawoOjpyPSnfsBa54LQZhqXdS0+lVXpg==
X-Received: by 2002:ae9:f107:: with SMTP id k7mr868312qkg.152.1623860213101;
        Wed, 16 Jun 2021 09:16:53 -0700 (PDT)
Received: from [192.168.1.107] (cpe-158-222-150-74.nyc.res.rr.com. [158.222.150.74])
        by smtp.gmail.com with ESMTPSA id w28sm1565682qtt.88.2021.06.16.09.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 09:16:52 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
To:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Jafar Akhondali <jafar.akhoondali@gmail.com>
References: <20210615221931.18148-1-leo@60228.dev>
 <2731fa44-7727-df4a-9214-91a5311ef3cc@redhat.com>
From:   leo60228 <leo@60228.dev>
Message-ID: <2b18b417-6c2b-4edf-de4c-42a04dc5882a@60228.dev>
Date:   Wed, 16 Jun 2021 12:16:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <2731fa44-7727-df4a-9214-91a5311ef3cc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> We only accept contributions under real-names, so you need to
> use your real first + lastname here.

I'm thinking about what to do here. I generally don't use my real name 
online.

> Also the GUID you are using:
> 
> #define ACER_LED_METHOD_GUID "7A4DDFE7-5B5D-40B4-8595-4408E0CC7F56"
> 
> Is the same one as used by another recent patch for adding
> keyboard LED zones support for Acer laptops:
> 
> https://lore.kernel.org/platform-driver-x86/CAMW3L+24ZGowtpURUbjoCoA+eZMF0wDae1izxS+HM2uz1L9Rig@mail.gmail.com/
> 
> I've added Jafar to the Cc here.
> 
> So it looks like we have 2 people working on the same driver,
> please coordinate between the 2 of you to submit a single driver.

I looked at that driver and our hardware seems very different (mine 
doesn't have any support for the special effects, for example). I agree 
that we should likely collaborate, even if that's just to ensure this 
driver works on more hardware.

> All these lines can be replaced by a single:
> 
> module_wmi_driver(acer_led_driver);
> 
> statement.
I already submitted a V2 fixing this among other things, sorry abou
> module_wmi_driver(acer_led_driver);
> 
> statement.

I already submitted a V2 fixing this among other things, sorry about 
that. Do you know if there's anything I could've done to make it more 
discoverable?
