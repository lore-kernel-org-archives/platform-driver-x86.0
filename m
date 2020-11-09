Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E79C2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 12:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34C5B20789
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 12:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2nZxUHg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729045AbgKIMn7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 07:43:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56211 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727077AbgKIMn6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 07:43:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604925834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=roGuckojUjKyUrAWkLO97EqWqEYJgMQUYn44G4h1rRY=;
        b=D2nZxUHgPNNhU6c/sm+c9a5qpOSR2iEFQNftyR/KN+wju60pZGaW4nsMBdyCRS71rJ3Gtg
        IO0hecgCdJMtRaiaD9Xz1N2Dut1nerkmAe1pVwChLVdBu1aqO0MalbvHzfQrhbUy1BoiIg
        MWhaZDg4Cal1ZImPNKac0J2WJFlgoJo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-547-W-ku4MyvNlGN7WpoCHLkCQ-1; Mon, 09 Nov 2020 07:43:53 -0500
X-MC-Unique: W-ku4MyvNlGN7WpoCHLkCQ-1
Received: by mail-ej1-f72.google.com with SMTP id g2so1372346ejj.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 04:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=roGuckojUjKyUrAWkLO97EqWqEYJgMQUYn44G4h1rRY=;
        b=FJB5re5aVQoEwviFmG+uUHJ+1Ta0GF5HIiofbXc4Stqp/GT7SbLLTCcbGIeBOYNW3f
         VhoYybFOkF1m0KBdMGuDOTqHl+pw+VzxP9w3vHehlN0jtypXCKaKdXuyrKgD5nve2whY
         WujKCrnIQRyK72BN4DiB6v2JVQN4B4UkQp/bygszgwZYa98hnlWErGs26WrFMDqV155l
         5n3lJS1lGmsA/+zOs1looUJlxTqxnKJVMCVaWeGhJEe7dDgGNUS4VyjUnfDtdPyD5X5p
         c1D56s6nco7oxbUdkfJCq4fhD/BXurEWMF3O7caMw8YEL8wKfAzD2Aa3vJo4TooNPh3G
         4yDQ==
X-Gm-Message-State: AOAM530t2iOvkaCQvv4Pj30S0G7EgI5EJACnC26411NXmILtF49yGmBl
        OBrlejPJpPjdJTTSCtIyswhUSDEVznNW1qbGmrcu76/QFDIWMk7vmC2qWjCI2HOdKcj+hB+a8aN
        vXf0ZV6kj8LOpWh1koCafCZD/m8lhlGPC9w==
X-Received: by 2002:a17:906:4dd4:: with SMTP id f20mr14434555ejw.94.1604925831683;
        Mon, 09 Nov 2020 04:43:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5Ep0EEMMB5kiQrm926+RfDssRZ7cfplTnjXw4/xDdg0IbUARVTLZ1EXkdRT/xVyhoLPKRsQ==
X-Received: by 2002:a17:906:4dd4:: with SMTP id f20mr14434537ejw.94.1604925831462;
        Mon, 09 Nov 2020 04:43:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id cn8sm8702418edb.18.2020.11.09.04.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 04:43:50 -0800 (PST)
Subject: Re: [PATCH v1 3/4] platform/x86: i2c-multi-instantiate: Make number
 of clients unsigned
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20201105110530.27888-1-andriy.shevchenko@linux.intel.com>
 <20201105110530.27888-3-andriy.shevchenko@linux.intel.com>
 <f1ca37a0-85db-0edd-7f4c-14143254ebfe@redhat.com>
 <20201109115316.GA4077@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1abf0d37-9689-cd37-9983-1bec6f7081d0@redhat.com>
Date:   Mon, 9 Nov 2020 13:43:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201109115316.GA4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/9/20 12:53 PM, Andy Shevchenko wrote:
> On Mon, Nov 09, 2020 at 12:39:45PM +0100, Hans de Goede wrote:
>> On 11/5/20 12:05 PM, Andy Shevchenko wrote:
>>> There is no need to use signed type for number of clients. Moreover,
>>> it's cleaner to show that we never go negative there.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> I'm not a big fan of this change, it feels like needless churn to me.
> 
> Feel free to not apply it. I think I don't need to resend w/o it (IIRC the rest
> pretty much independent of this change). But if you need a v2, tell me.

No need for a v2.

>> Integers are signed by default and just because a value cannot become
>> negative is not really a reason to make it unsigned. E.g. your typical
>> "int i" is often used as an array index so it cannot go negative, still
>> it almost always is an "int i" not an "unsigned int i".
>>
>> IMHO good reasons for deviating from the default signedness and
>> making a value unsigned are:
>>
>> 1. Because the value cannot go negative and we need more range.
>> 2. To avoid sign-extension when upcasting it to a larger integer type.
>>
>> Neither is the case here.
> 
> I consider one more, i.e. if we know that value may not be negative the
> unsigned type gives a hint. I always stumbled over signed integers used for
> loop counters since they confuse me (Q in mind: "should I read code carefully
> and check if it may or may not be signed? Why it's signed?").
> 
> That's why I like the idea of be a bit stricter about types.
> 
> Hope this explains my motivation.

It does and I understand your point of view here.

>> I do like the other 3 patches, thank you for those. I'm going to wait
>> a bit with applying them though, to see where things go with the
>> "[RFC 0/4] platform/x86: i2c-multi-instantiate: Pass ACPI fwnode to instantiated i2c-clients"
>>
>> Merging them now may get in the way with merging that series if
>> Wolfram wants to pick up the entire series (since it also involves
>> an i2c-core change).
> 
> Usually I expect that RFC has less priority than normal series> and I wouldn't
> expect any maintainer (with some rare exceptions) to take series marked as RFC.

Right, but you suggested resending it as a non RFC, and then there is some
cross tree coordination which needs to happen to merge it; and since
this series is just cleanups with no functional changes I would prefer to
delay this one a bit to make the cross tree coordination simpler
(iow keeps i2c-multi-instatiate.c unmodified from rc1 for now).

I hope this explains why I'm delaying your cleanups a bit.

> And TBH I was wondering why you marked them as such, to me that was fine to
> send as normal one.

As I tried to explain in my reaction to the RFC cover-letter I'm not sure we
should apply those patches right now as there is no immediate need for
passing the fwnode and a non 0 chance of regressions. But lets discuss that
in that thread. If we decide to not apply that series for now then I'll apply
this series (minus patch 3) right away.

Regards,

Hans

