Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687C5C388F7
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 13:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2185A206B2
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 13:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PZGpyXqF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731733AbgKINn2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 08:43:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27364 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732416AbgKINn1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 08:43:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604929406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Vce1Gg489mZi+X0b9BvAN5GDGA26gvP3AGrUiBkCWqo=;
        b=PZGpyXqFBq/+gywAz1Pca0BhYy6YcsvJwrz3F/KPA7yH5pPLhrykzRRxsbXymUQLtrM66S
        NYi067WvDNrrWB0uuRTQk7ldDL6MYouzw0YJhVxA5EBj2nfDQqu1PZMCMMaljxfGaex8cm
        +twcHkLCiPDuvFSGTwQMLMOfvlbWiv4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-N_H25WjOMIualLZU-Aqf5w-1; Mon, 09 Nov 2020 08:43:20 -0500
X-MC-Unique: N_H25WjOMIualLZU-Aqf5w-1
Received: by mail-ej1-f71.google.com with SMTP id 27so3412404ejy.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 05:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vce1Gg489mZi+X0b9BvAN5GDGA26gvP3AGrUiBkCWqo=;
        b=Ex9bAxUOs9/B87WYp2BOWbmheiyePdxcUVm4j9S/UFYV9QzDVmgj/Hmh8v8QzQTYmH
         ubDrk0lRj079NbSikmKjjFXgVAB36T9/oXozTqUl/8U0BmyDosJ/+vnOCanKHwiqRl83
         BJopL1T67lKw797zQr+o7syfpNfc5w3++5icKhpCt8eUWYOguluClxTApQaeKu9fMgqj
         R3p86ykQIPnlizr7hC/PTAHmZyiWG5ckDm5Lv8MAQ9Th0WXmMp3/odEEuunRkq7hyQSs
         hTukFhauWRmZMfFZD58c18pMTVgeHYTjLNSBKFSbZ5yQaKv6NUeTM2/5tF37wUW958FG
         ATFQ==
X-Gm-Message-State: AOAM533fRCB6irlpAposBlHQ8KMBstfFOtRDCBXwHgz5ZPwPHI8l560P
        BFeA23+qf6QdghiRy2zFwbBQsUaGtYwN+IR2ag7ch+8BQay1gZRbmAIaB5Oz8KHumq3W7krvnat
        vSo2LXJH98GlJjj0JYjIT+/kGwUz4UpgOKw==
X-Received: by 2002:a17:907:2175:: with SMTP id rl21mr14934412ejb.59.1604929399637;
        Mon, 09 Nov 2020 05:43:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxbClbzRC4BJ7kWwDqqu5hv6m/I/QHanvigGc0lLGxwEyos+9Ojp8IiRMnzkthgpBWz5fTRRQ==
X-Received: by 2002:a17:907:2175:: with SMTP id rl21mr14934397ejb.59.1604929399478;
        Mon, 09 Nov 2020 05:43:19 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id b1sm8720967edw.27.2020.11.09.05.43.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 05:43:18 -0800 (PST)
Subject: Re: Brightness hotkeys on HP laptop
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Gmail <rhysperry111@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>
References: <2UUF9Q.RGK6EP27Y6W73@gmail.com>
 <CAHp75VdKMsPuDOappFTqY6FqX+7zcQqrvdYMGSZZo1ZG6-cM+g@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9963d333-37c7-8eae-3512-b170debce07e@redhat.com>
Date:   Mon, 9 Nov 2020 14:43:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdKMsPuDOappFTqY6FqX+7zcQqrvdYMGSZZo1ZG6-cM+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/5/20 5:45 PM, Andy Shevchenko wrote:
> +Cc: subsystem maintainers
> 
> On Mon, Apr 27, 2020 at 11:44 AM Gmail <rhysperry111@gmail.com> wrote:
>>
>> Hi, I am using a HP Pavillion 15-cx0598na.
>>
>> I am having trouble getting my brightness keys to be registered. It
>> should also be noted that my wireless toggle key does not work either -
>> I assume that is a seperate issue as it is handled by a different
>> module.
>>
>> Nothing is detected through acpi_listen, xev or showkey. However, in
>> the journal I get this error (same when pressing both keys):
>> ```
>> Apr 26 15:50:05 archlinux-laptop kernel: atkbd serio0: Unknown key
>> pressed (translated set 2, code 0xab on isa0060/serio0).
>> Apr 26 15:50:05 archlinux-laptop kernel: atkbd serio0: Use 'setkeycodes
>> e02b <keycode>' to make it known.
>> ```
>> Here is a link to acpidump: https://termbin.com/2l2x
>>
>> I have already tried to contact the author of `hp_wmi` (the module for
>> handling some hotkeys) but he could not solve the issue so suggested
>> contacting this email.

So for the archives, this has already been discussed in another thread.

It seems that we need to make some special WMI calls for this, either
to figure out which key is actually pressed when receiving the
PS/2 scancode which is shared between multiple keys. Or to get the
device to send different scancodes.

This will require someone with some knowledge of ACPI/WMI as well
as of writing kernel code to get physical access to an affected HP
laptop to figure out what is going on and write some code to deal with
this special setup.

Regards,

Hans

