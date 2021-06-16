Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050F3C48BE5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 17:50:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DACFD610EA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Jun 2021 17:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbhFPRwT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28115 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230350AbhFPRwS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Jun 2021 13:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623865812;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9vFsoaVhirzwZutCLqdeJ5X6zDH2UXTDC/gHzEnPo6M=;
        b=RvXdClXZO+hP9zcWHRxAf3hgV8o+YQCQfRGkbdrSHjQeyimzPKBmaaZCAmANRKEsIGbAO/
        Ws/nEnF/Lv8s4bPBtAZWp9gN9PoItCiWZCUjCr+n2ctXdlbWIhbw1BSM2IaCdpx9uWEE/H
        HvaBPjCoLgilAHPuqMDP/ncgzVwz+cU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-ENI9fIcBO2qi3L92-DbtdA-1; Wed, 16 Jun 2021 13:50:09 -0400
X-MC-Unique: ENI9fIcBO2qi3L92-DbtdA-1
Received: by mail-ed1-f70.google.com with SMTP id z5-20020a05640235c5b0290393974bcf7eso120694edc.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Jun 2021 10:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9vFsoaVhirzwZutCLqdeJ5X6zDH2UXTDC/gHzEnPo6M=;
        b=b8lXgFlrx0h5ZcbV0SGthYrQkAYIsQOC4pXkMU07jp0+UBO1m4gri3S7j3gZa4/MD6
         IxE8JtoH7GZIB6Iyw+jrKZbnvbQKmuuwl7J7IrmGJoqDRNpajA2NSaSEzvbxnFLHdk1l
         KD6OJyFnIR1CtIeMUfZjvDjsdLa51xD/prmMZDORXBegChEsOaO2zOsqjdScYhPfDn43
         7/sEFATygp8X8GVemA7gIMUU+kNvf6HphGF2OCBdrJkk8w1MZBUnvD0S0l+MUB4aeLKq
         7OYcWF4W6xGtnheLGSJQKTeW+pwXKMHKmOnZ+Ntw09nTFRAA7dCavfpxfTsSIj2cgr48
         7DSw==
X-Gm-Message-State: AOAM531N2eRGrR2CIT7MTL2M89WKJvKP3eD7g+w3YA4nLT8FzQiDLFvS
        ryntJEg7tk2fKzl/2S4OIE4vSIZFJY5IfVTb4P9QtJmNa7tfrNqEGj5/YkAVE7NV9HaaXFOgcfD
        yLwQXq7PhwJ0QhB6Hs/j1sODHqCGVS2uqag==
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr1057025edw.217.1623865808754;
        Wed, 16 Jun 2021 10:50:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPVQRfLVZ6xrhMEJJgDbjLbUmkGN3zjTjUbkoi+Hf7VGNx/AgCRErmc8Bbn1LonQqtQfB8hg==
X-Received: by 2002:aa7:cdc5:: with SMTP id h5mr1057007edw.217.1623865808581;
        Wed, 16 Jun 2021 10:50:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id au11sm2089496ejc.88.2021.06.16.10.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 10:50:08 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: add support for Acer Predator LEDs
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        leo60228 <leo@60228.dev>, platform-driver-x86@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-input@vger.kernel.org
References: <20210615221931.18148-1-leo@60228.dev>
 <20210616005147.26212-1-leo@60228.dev>
 <87e6f17f-3d82-ac63-b5eb-e7f3205f59e8@metux.net>
 <ae4e7db3-ffc5-b8f3-c08c-bba6882d44ad@60228.dev>
 <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0148a2e3-c91e-7422-df3d-6942c38334ed@redhat.com>
Date:   Wed, 16 Jun 2021 19:50:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <62d2de8d-e539-5b4f-447a-5e6116844992@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/16/21 7:20 PM, Enrico Weigelt, metux IT consult wrote:
> On 16.06.21 17:56, leo60228 wrote:
>>> Can you please tell a bit more what these LEDs are actually used for ?
>>> Do they have some names or symbols ? Are they also controlled by
>>> something else (e.g. numlock or shiftlock leds)
>>
>> They're used for the keyboard backlight. This functionality is pretty common on gaming laptops.
> 
> hmm, keyboard backlight ... don't we already have something for that
> in input subsys ? I believe that some lone LEDs aren't the right subsys
> for those stuff.

Actually the standardized userspace API for exporting keyboard backlights
is using the LED class sysfs API, e.g.:

cat /sys/class/leds/tpacpi\:\:kbd_backlight/brightnes

And the same for Dell and other kbd backlights, also the upower
daemon even has code for dealing with kbd-backlights:
https://gitlab.freedesktop.org/upower/upower/-/blob/master/src/up-kbd-backlight.c
exporting them over its dbus API so that non-root users can
control them.

Basically using the LED class for kbd-backlight functionality
basically is the defacto standard under Linux, so exposing this
through the LED class is definitely the right thing to do.

Since these are zones however, we probably wat to avoid the
kbd_backlight suffix of the name, otherwise upower will
pick the first device it enumerates and control that, while
leaving the other zones alone, which is not what we want.

Regards,

Hans

