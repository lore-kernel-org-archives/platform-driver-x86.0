Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B1DC47089
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Dec 2022 17:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiLGRi6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Dec 2022 12:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbiLGRib (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Dec 2022 12:38:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5229FB8F
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Dec 2022 09:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670434653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IHCZeVT8+tsyQCQ4HzhOkGSB0d3Ym2pm84+wyQjhgMo=;
        b=Q4tzzzSi8B4DzBVXFBDQHUVJyjh6RXJlUcSNvp883XswRhCBu4Zdc432rcF8zmfRCcw1jB
        mR45XJgnAnJVFiCgeRbcryIX8PTHXPwhNUuBT0glvGiNIAxDVCnf93QQdrssAMqPvjrXjG
        6yhR+6jqUHBXWgANr93gd1LFizlaCQQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-275-XCU4hUTeNimQUtLUSXyf9Q-1; Wed, 07 Dec 2022 12:37:32 -0500
X-MC-Unique: XCU4hUTeNimQUtLUSXyf9Q-1
Received: by mail-ej1-f69.google.com with SMTP id sb2-20020a1709076d8200b007bdea97e799so3851100ejc.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Dec 2022 09:37:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IHCZeVT8+tsyQCQ4HzhOkGSB0d3Ym2pm84+wyQjhgMo=;
        b=iqCElNUiWPnbBnqYg/pMQrPKdZOMaCtDIhdv2gye90IRaivQrnBka9vPf/dPzS0Vyj
         URkG9Xfde2dBGnTjFe0txwiQvKyZqxjq/xiISQVVtKovWTrKgEpSNGNmqWEB5ZPsV5Ak
         CfKJFrelhqowkciH56sYEtp2SQcO0cDUTeILAKFED0ZL4lqJS5bnxN+rJxS/wovFuDzc
         tDZbRt5Ke5pxfgOGwBu8jPmo/m4zuWm98RCjJJZbKW1+G21trc6P9jV+U2/QZME+OX7U
         kbVbE7iG7EbitqjiB+Odvhj2qr/eMb0qSwyxpwHBsAQElTOCcfIMrSm9c0ZYyhdPHIXq
         bRnQ==
X-Gm-Message-State: ANoB5pmvD3UkjIgdQUGecfJ7CHgIVJKJgBB7vVKpjJbb+rHsVBKZINsq
        Zan3VF8VgvQyZR/LOk+0E7SIejwLrivX3Rm33nzI3G21k3ZXJRCKaRpwg5LiY42EOLsaGdIxp29
        wl/0EDJDPiNJgm5QknUiWm9h93X6ONkDbxg==
X-Received: by 2002:a17:906:3087:b0:7bd:bb10:b5f8 with SMTP id 7-20020a170906308700b007bdbb10b5f8mr45759203ejv.659.1670434650968;
        Wed, 07 Dec 2022 09:37:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6PlsUKNSNbCOlaFF0rdvHPTS80VsiKj/692+pl3GkMvCPpogDwKwhNgBi/LzrwvpWAfBbatg==
X-Received: by 2002:a17:906:3087:b0:7bd:bb10:b5f8 with SMTP id 7-20020a170906308700b007bdbb10b5f8mr45759193ejv.659.1670434650817;
        Wed, 07 Dec 2022 09:37:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id h6-20020aa7de06000000b0046b531fcf9fsm2486222edv.59.2022.12.07.09.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 09:37:30 -0800 (PST)
Message-ID: <0e5b2a63-7fa5-43db-6e4c-d58a047aa452@redhat.com>
Date:   Wed, 7 Dec 2022 18:37:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/5] gpio/media/int3472: Add support for tps68470
 privacy-LED output
Content-Language: en-US, nl
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221128214408.165726-1-hdegoede@redhat.com>
 <CACRpkda+3e6jLq4WkyiCFcvL_rO1tAf_TvO5B9kikkii+6vSnA@mail.gmail.com>
 <f79b9397-64af-894a-411c-5595fa136008@redhat.com>
 <e04eaaa0-1a5d-7f8f-9cd9-4a2117f83aab@redhat.com>
 <CACRpkdZZ01gTeWaU5GybiafDM3EnyEhyuEMTenusfV2s1NdfXQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACRpkdZZ01gTeWaU5GybiafDM3EnyEhyuEMTenusfV2s1NdfXQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/7/22 01:25, Linus Walleij wrote:
> On Mon, Dec 5, 2022 at 4:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> An alternative approach, would be to add support for LED
>> lookup tables to the LED class code (like we already have
>> for GPIOs) and use this to allow tying a LED classdev to
>> a struct device on non devicetree platforms.
>>
>> Given the problems with the swnode approach from above
>> I believe that this would actually be better then
>> the swnode approach.
>>
>> Lookup tables like this use device-names, so we don't need
>> to have swnode-s ready for both the provider and the consumer
>> at the time of adding the lookup table entry. Instead all
>> that is necessary is to know the device-names of both
>> the provider and the consumer which are both known in
>> advance.
> 
> I think this looks like a good idea.
> 
> We attach other resources such as clocks, regulators,
> DMA channels, GPIOs exactly this way. So why not LEDs?
> 
> As GPIO maintainer I every now and then get a suggestion
> like this to "just let this pass as a GPIO because it makes
> my life so much easier", but it is the same curse as the
> input subsystem has: it is versatile and well engineered so
> it starts to look like a golden hammer (everything start to
> look like nails).
> 
> But we are two GPIO maintainers and right now Bartosz
> does the majority of the work, and if he thinks it's the best
> idea ever I will certainly reconsider.

Ok, I will give the LED lookup table approach a go and
post a new series replacing this one when its ready.

Feel free to drop this series from your queue.

(Note given that that is going to be a whole new approach
I plan to start the new series at v1 again).

Regards,

Hans

