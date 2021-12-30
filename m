Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF48C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 30 Dec 2021 18:40:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241632AbhL3Ske (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 30 Dec 2021 13:40:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24751 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240159AbhL3Ske (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Dec 2021 13:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640889633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MbQ6UTaZ+JchUIz8NAwbybt8i/nP+nB2Nzcb91Lig9Y=;
        b=h0JACVYQS2xiOzphT5DupU03WWtt5qYwNVxDyj0vT3cFlI6oeXNRDHPa3ICYxBZfpicY8m
        5ZqNUOOn7kkzhtCE3iEK0Okv5hDlz9E0lRdu8YNKg70FYLWe4a5y7e2SfBzeK5CKKd4Gy6
        /XumNuY9zKs9RLQo03wV3IX7COhw6MU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-387-_9gy8e7oPxOlW4cq-AJExA-1; Thu, 30 Dec 2021 13:40:32 -0500
X-MC-Unique: _9gy8e7oPxOlW4cq-AJExA-1
Received: by mail-ed1-f72.google.com with SMTP id z10-20020a05640235ca00b003f8efab3342so10516141edc.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Dec 2021 10:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MbQ6UTaZ+JchUIz8NAwbybt8i/nP+nB2Nzcb91Lig9Y=;
        b=iReadAvwJHgAqvDY8dSoEwVqUl1JsYdI93q7RejNzw/xgILKmNJ88ebAnN1z5VI1Ev
         LlU6NyKhaQMjNnSr6ELVQyS/zi5jWNF5JFqH8EGoKLPv5395c3cuSVM9OdNtezyT3nwq
         XnqVMhxyWQt4pNj4aN6BhXm1fWVCnu53qQGG6U8JdlJD7vdphViqNz1tW4nMMUy8QkHO
         2o8vUSEy3UrvC4OxklnzeLtG42VdFeN4UtqiEYjL/Gy4BrtU80Bq6M3uwm/TypCuBvI4
         Mv3COi33I2ScuY0hVsUDlxaagFoQa/X68aJRy9a6Y0N8bDr+8UdLDx12m7b1CNybASrE
         iQUw==
X-Gm-Message-State: AOAM533cFQxPgiMfKGVYE9cdMZtlZDtMLzXtMhZBKc6xm0omhxdrzdpC
        VHcYEoB0RfDWsVpPd+nxCsawFItZv3XslbFmG66gXsJZo3CAEfq6Dz9iBnNZvOkf6QuJ8U4+uP1
        lD+hrN2aPMU4i1preio1t4ummec3Mg13Bhw==
X-Received: by 2002:a50:fc93:: with SMTP id f19mr12870670edq.180.1640889631035;
        Thu, 30 Dec 2021 10:40:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/sv+BexySX7FvaFv581MzQ3yHBjt1kF9Bju+nrFgYmhFaGX7ob1HlciOK3TfSeDh3YWWYvQ==
X-Received: by 2002:a50:fc93:: with SMTP id f19mr12870655edq.180.1640889630836;
        Thu, 30 Dec 2021 10:40:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id nb20sm7761809ejc.25.2021.12.30.10.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Dec 2021 10:40:30 -0800 (PST)
Message-ID: <980d3895-b9c1-6f3c-3b7e-b5fc208769ad@redhat.com>
Date:   Thu, 30 Dec 2021 19:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 4/4] platform/x86: Add crystal_cove_charger driver
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lee Jones <lee.jones@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211225115509.94891-1-hdegoede@redhat.com>
 <20211225115509.94891-5-hdegoede@redhat.com>
 <CAHp75VcnPJvprayX+B_nHEahbrSyvAORyD9dAuMJ9zEP+Jq3hw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VcnPJvprayX+B_nHEahbrSyvAORyD9dAuMJ9zEP+Jq3hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/25/21 15:37, Andy Shevchenko wrote:
> On Sat, Dec 25, 2021 at 1:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Driver for the external-charger IRQ pass-through function of the
>> Bay Trail Crystal Cove PMIC.
> 
> Intel Bay Trail (same in the code)

Ack will fix before merging.

>> Note this is NOT a power_supply class driver, it just deals with IRQ
>> pass-through, this requires this separate driver because the PMIC's
>> level 2 interrupt for this must be explicitly acked.
>>
>> This new driver gets enabled by the existing X86_ANDROID_TABLETS Kconfig
>> option because the x86-android-tablets module is the only user of the
>> exported external-charger IRQ.
> 
> ...
> 
>>  drivers/platform/x86/crystal_cove_charger.c | 153 ++++++++++++++++++++
> 
> I'm wondering why it's not under the intel/ subfolder. Do we expect to
> have the same PMIC used on other x86 vendors?

I was wondering about doing this myself before submitting this upstream,
since you have the same idea, lets go for it. I'll move this before
merging it.

> 
> ...
> 
>> +static int crystal_cove_charger_probe(struct platform_device *pdev)
>> +{
> 
> Adding
> 
>   struct device *dev = &pdev->dev;
> 
> may increase readability a bit and perhaps reduce the amount of LOCs.

Normally I'm a fan of doing that myself, but it doesn't really help
here since there are only a few references and those fit in 1 line.

Regards,

Hans

