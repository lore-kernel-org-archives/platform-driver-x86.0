Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01111C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 16:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4F9060FBF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 22 Oct 2021 16:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbhJVQDA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 22 Oct 2021 12:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55652 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230187AbhJVQDA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Oct 2021 12:03:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634918442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pYuNMXgdCQrnoJW3Tc5JHi/EFzItvYwLIxSv/GZEn3E=;
        b=elYq6ojWHHDSyAxydDMJjaQeu1PdqBMxZZ430if88bxoGS9vdhUZ2c/L6hw7791ah9zlbB
        v1XFn7PAtIP8E0F2ADOZHXdo5HOMiZjG+pbwJWq2KZWoQxywMrhu4LrQ8Ayf34PMU6enJG
        +xDTe15KhtLzuKLHzyYScXMijldS0hg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-AoV7iYsaOEe_ZqxUjPWE1w-1; Fri, 22 Oct 2021 12:00:40 -0400
X-MC-Unique: AoV7iYsaOEe_ZqxUjPWE1w-1
Received: by mail-ed1-f69.google.com with SMTP id t18-20020a056402021200b003db9e6b0e57so4158098edv.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Oct 2021 09:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pYuNMXgdCQrnoJW3Tc5JHi/EFzItvYwLIxSv/GZEn3E=;
        b=SZZ0r5yxVwo9059+tS7+7WwAO705hn8WUufnsdBW7e4mHF9NLK0wZwTohPeQJpPmZx
         HECvMe1lSqjK8HVyL3aHC13UoW/nlUa3AIfNQCvCrOqSyJeI0Z2qP9ysRHPZV7dGozdk
         bR26u25HJQx4LW9LxME4TnF2B0iFtveOej5uoR0azQ4YECPilaD44rX1BtIGTHadlqXA
         4xeJqyIY1cKsnQqjoIQoIXPpaYdSzP/SIkCaW7g+fXIj3tLD+Zc2OdaX+Z11mPZNuQk4
         3j5ldWGFmwl6D409BOnpnRw7p4j+gyUegxl9/JMWxmSWhwVx7dd3KVm8TbSnbG1Zpe3e
         8sTg==
X-Gm-Message-State: AOAM532QP1vhDfNPijsEzbd9WupZ0yuw0nBtI/8Wa+rYDqP8GTuQH41b
        DweIjUdXiuK2aVvZ9Wzg3MN7aeiw/z4YoeUBTdyKxt5yJYnak+0E980Hyv/9bJMwkmVQOgwjF12
        GRSMNlL5Q3mgJW1mUu3lgKc/0FXTKM1cv+Q==
X-Received: by 2002:a17:906:8252:: with SMTP id f18mr464805ejx.409.1634918438063;
        Fri, 22 Oct 2021 09:00:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyByUYheieVCY7y76Z3xriQnsI5UhTjW3MfTo4LyB38YY3J8MgFN4/IRmgTskGvX/qWNKqIuw==
X-Received: by 2002:a17:906:8252:: with SMTP id f18mr464570ejx.409.1634918435961;
        Fri, 22 Oct 2021 09:00:35 -0700 (PDT)
Received: from ?IPV6:2a0e:5700:4:11:334c:7e36:8d57:40cb? ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id p13sm3821234ejn.12.2021.10.22.09.00.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 09:00:35 -0700 (PDT)
Message-ID: <5e2abf25-3738-c178-d62c-3d8ba7e4474e@redhat.com>
Date:   Fri, 22 Oct 2021 18:00:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: barco-p50-gpio: use KEY_VENDOR for button
 insted of KEY_RESTART
Content-Language: en-US
To:     Peter Korsgaard <peter@korsgaard.com>,
        platform-driver-x86@vger.kernel.org
Cc:     santoshkumar.yadav@barco.com,
        Peter Korsgaard <peter.korsgaard@barco.com>
References: <150f27d2-32b9-403b-01ff-8ab7d971d1d1@redhat.com>
 <20211022124612.19780-1-peter@korsgaard.com>
 <87r1cd5aqv.fsf@dell.be.48ers.dk>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87r1cd5aqv.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/22/21 17:40, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> Ups, s/insted/instead/ in the subject. Do you want me to send a v2 for that?

No need for a v2, I'll fix this up when applying.

Regards,

Hans


> 
>  > From: Peter Korsgaard <peter.korsgaard@barco.com>
>  > It turns out that systemd-logind by default listens for KEY_RESTART input
>  > events and reboots the machine, which isn't great - So use KEY_VENDOR for
>  > the vendor specific identify button instead to not conflict.
> 
>  > Signed-off-by: Peter Korsgaard <peter.korsgaard@barco.com>
>  > ---
>  >  drivers/platform/x86/barco-p50-gpio.c | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
>  > index ca0b2564c407..f5c72e33f9ae 100644
>  > --- a/drivers/platform/x86/barco-p50-gpio.c
>  > +++ b/drivers/platform/x86/barco-p50-gpio.c
>  > @@ -101,7 +101,7 @@ static struct gpio_led_platform_data leds_pdata = {
>  >  /* GPIO keyboard */
>  >  static struct gpio_keys_button buttons[] = {
>  >  	{
>  > -		.code = KEY_RESTART,
>  > +		.code = KEY_VENDOR,
>  >  		.gpio = P50_GPIO_LINE_BTN,
>  >  		.active_low = 1,
>  >  		.type = EV_KEY,
>  > -- 
>  > 2.20.1
> 
> 

