Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003A4C11F64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:20:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D653861C7B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 18:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234439AbhF1SWg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53489 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235956AbhF1SWf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 14:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1624904409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Tsg+g87KEhkUmU5nazBOtf6jN/bfdKdQeWq+uzYH32E=;
        b=UBmOaIKiUas8UXC9ZsVjm+gTtaQUEIdVRnX1xntav+BkkQethesdIOPnJ7t/KhJbzINgGT
        WHvl5f6c5/Vf5cRLzTRyufgVA5gfffC+xJVbLVjgihNMUSvVQcb0kwQRbHYTBkb6s651LJ
        l6pUwCAcNMJTTYPNwhKcBiy2U4yJHYo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-RmnS3pbDNqWgnC-n4g0LtQ-1; Mon, 28 Jun 2021 14:20:06 -0400
X-MC-Unique: RmnS3pbDNqWgnC-n4g0LtQ-1
Received: by mail-ej1-f71.google.com with SMTP id u4-20020a1709061244b02904648b302151so4714560eja.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Jun 2021 11:20:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tsg+g87KEhkUmU5nazBOtf6jN/bfdKdQeWq+uzYH32E=;
        b=D5/4t/ampK7pR0fxs7CyJY/XkdMPWgYc1ZxyxRUO+eDL0CQd7nhANR+X+gVin/AIWt
         9erhFuMb6aetGV+DlX+Qre5tN8vEGBTcNs0L19zHxwBeJUGi2Wm49lOM1mn8wJvP9eW+
         6ANh/aGNbpMuQjsuze3LtyVXGrgzWU5zxJbKQ9nmduDWXSQPSr6MZv7Yw4GLikyfBcgf
         lDSLf2SL8BwF/5oSMcfpYOiX5ElkrCe/4MDcBHvr8+yQp1SxRoBuHIZau+HH9OOkR9V+
         2rOZc/U/Txrgec7xsbcx6/mFhytmhtyse0WfJ8GEpq5+j3kBt1wsWWUmu50hfirmXXc9
         /wkw==
X-Gm-Message-State: AOAM532eTtTUTanFxPFLCZ6bXpbkeJgYzuS6UkulvJKLkd0X4dNELJy0
        XHbK3G67U025q0th9eV9NiGwgGPGep630c0Um1pvZjJV900iSZNUaWlW90RKDdFHdN6GrIwDhq1
        Q4FO2OLfGPvYpX2wabX19hro2C3F64hvFaA==
X-Received: by 2002:aa7:db94:: with SMTP id u20mr34606002edt.381.1624904404873;
        Mon, 28 Jun 2021 11:20:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsXP36MDE6r9XiKrMz03HVj2ulNai/7AJoxhivFyNkx5yhYdibTlkTD6z4ZxX5/AzZ6Uki5g==
X-Received: by 2002:aa7:db94:: with SMTP id u20mr34605985edt.381.1624904404738;
        Mon, 28 Jun 2021 11:20:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id x2sm1704493edv.61.2021.06.28.11.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 11:20:04 -0700 (PDT)
Subject: Re: [PATCH V2 1/1] [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shravan S <s.shravan@intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
References: <20210510074016.31627-1-s.shravan@intel.com>
 <20210510074016.31627-2-s.shravan@intel.com>
 <CAHp75Ve_=mv5MbLvqxGwu8GAuxAjBLpRHE9KNua-yvmzUNKuKw@mail.gmail.com>
 <79bd7236-dec1-ffde-8c23-3a500e04eedd@redhat.com>
 <f9e0a2b8-6e30-0b85-34d0-16a101da4686@metux.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5bcc0591-8b9c-b7c4-cbcd-7b209c4c1b69@redhat.com>
Date:   Mon, 28 Jun 2021 20:20:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f9e0a2b8-6e30-0b85-34d0-16a101da4686@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Enrico,

On 6/28/21 7:47 PM, Enrico Weigelt, metux IT consult wrote:
> On 28.06.21 17:12, Hans de Goede wrote:
> 
> Hi,
> 
>> I'm not in favor of internal reviews, esp. not when new userspace
>> API is involved. I would greatly prefer for the discussions surrounding
>> this to be kept public.
> 
> ACK. Please do that in open public. There're still lots of things to
> discuss that should be discussed in wide public, instead of comittee
> behind closed doors.
> 
>> I agree that ideally we should have some generic userspace API for this,
>> but I'm afraid that ATM that simply is not possible. 
> 
> Why not ? Lets collect the actual requirements and talk about some
> viable solutions (I've already got a few ideas ...)

Because we don't know the actual requirements yet. This is a very
young technology and still evolving fast. Also whether we like it
or not, we don't get to dictate what the involved firmware and
hardware interfaces get to look like. So any API which we come
up with must be capable of working with the existing fw and
hw interfaces as shipped in actual devices.

>> This whole notion of maximum tx power being controlled based on various sensors because of SAR reasons is pretty new (at least in the PC/laptop space) and I know of a couple of vendors who are slapping some adhoc firmware
>> interface on the sensor readings for some modem related userspace
>> process to consume.
> 
> We should bring them here onboard, public discussion. And at the same
> time we should make it crystally clear to them that weird adhoc hacks
> won't be accepted and just give them very bad reputation and
> shitstorming. Seriously, I believe we should go that route, in order
> to prevent even more damage by insane firmware interfaces.

<sigh> we are in no place to make demands here "standard" (non
chrome-os / android) Linux laptop-os usage is a tiny fraction of the
market. So new features like this are primarily developed on other OS-es
and typically we either take the firmware interfaces as is, or we don't
support the feature.

You seem to believe in an utopia where we fully control all the layers
and can design and implement everything to be just perfect, but the
reality is quite different from this.

You also seem to forget that perfect is the enemy of good. This case is
an excellent example of a case where we cannot design anything close to
the "perfect" API in one go because we don't have the necessary
problem-domain information / experience yet.

> Such stuff really doesn't belong into firmware, at least not the way its
> done now. Instead there just should be a clear description of the actual
> hardware.

Yes you've made your opinion on this abundantly clear and I must say
that the whole tone of your emails in this thread and the
"I know better then everyone else" attitude in this thread seriously
rubs me the wrong way.

Don't be surprised if I do not answer any further emails from you in
this thread. That won't be because I don't read them, but that will be
because I deliberately choose to not answer them because IMHO your
strong opinion on how everyone must bow to your vision of how exactly
this all must be implemented adds very little of value to this thread.

Regards,

Hans

