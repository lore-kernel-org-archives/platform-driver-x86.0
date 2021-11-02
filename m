Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD0E0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 16:36:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D92C61101
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 16:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234934AbhKBQjb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 12:39:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43533 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235043AbhKBQir (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 12:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635870936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zq/1+DwBXNQ+10dXmUih1iaLiLYP5xeOcEC+C1MZoN8=;
        b=JD/p/8OhjQMWQrlfBz3aSYilpNVjCACmG6nFGvBbqhFcScrKKPC5H3Tquk0daUofsQxSq+
        C9kQYufueHZIjsk1p0esI3hTfFEGpEJLXfsQ1SHAxQCvLA+K8oPxPEJnYCrwUB9amcyXDm
        CN5o9VEOhlxH1eU0YEDYwrLk4SPeI50=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-Dx_n_sFYOMKDDRgWVai8tg-1; Tue, 02 Nov 2021 12:35:35 -0400
X-MC-Unique: Dx_n_sFYOMKDDRgWVai8tg-1
Received: by mail-ed1-f70.google.com with SMTP id w12-20020a056402268c00b003e2ab5a3370so1544410edd.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Nov 2021 09:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Zq/1+DwBXNQ+10dXmUih1iaLiLYP5xeOcEC+C1MZoN8=;
        b=HeOFc2RYnUr5O8RoTrsWl6mXJZPec+Pxdz3UuFGB3tZgwyZkjK+/atC4qSAXhat+ST
         8sodfwG5IJzJR4QrTQ+a0UXfTyEynUdZWWL1SIGCSDyTpylKr1ns4iYZAKsu8JTngHq+
         CQG4eTmc4DOTkudMzr8ZReDxPPy+7SX9b0oOxHAuaBKZBuCjWz7RXMZh9SpalLjYMpkQ
         I05j9nPOs/wmgPWhWB3AjBj/ozn44U75RvJSfRHKxFYAyAp4UR5Mjr50nXwddZZ4OKDp
         dTECR5rVBCzLFusl6B16rkh1mes341M/xyQVZgZelIfkvjmBk8v4t1s3RLb0F2gW5S+5
         Z7ww==
X-Gm-Message-State: AOAM532FzgfUHjrPOuGQEwPFy+1NoNKOThsVZ6OTNVNIPkMf7VnecMbU
        RTi9WO+RPqf1k2piu8Gb6ElK65tZau1FHNJVGDvs0w1naVHCLlzZ0ehb8XGekXOReD2XVO7Oylk
        KfCY07Anzsre2ztCh/eN4HVi+yO6KflMPiw==
X-Received: by 2002:a05:6402:42ce:: with SMTP id i14mr51371770edc.276.1635870934123;
        Tue, 02 Nov 2021 09:35:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ3/uj2tKBojwj8TODwyc/o2fUAP67S0ubiS8nI4mwEt6KxH9DG1zYZPSLje6xVryW/hO80w==
X-Received: by 2002:a05:6402:42ce:: with SMTP id i14mr51371745edc.276.1635870933972;
        Tue, 02 Nov 2021 09:35:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r18sm29563eje.90.2021.11.02.09.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 09:35:33 -0700 (PDT)
Message-ID: <8d0821c9-b9d2-66de-ca2b-25525e26c67a@redhat.com>
Date:   Tue, 2 Nov 2021 17:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 10/11] platform/x86: int3472: Pass
 tps68470_regulator_platform_data to the tps68470-regulator MFD-cell
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211102094907.31271-1-hdegoede@redhat.com>
 <20211102094907.31271-11-hdegoede@redhat.com>
 <CAHp75Vd-xY43H8jPOUqJp55Rq3Wuhsdzctfhqq300S0vAKTzpw@mail.gmail.com>
 <1f4377bb-2902-05e9-95c7-ad924477b543@redhat.com>
 <YYFkqlGkd7Jftcdk@paasikivi.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YYFkqlGkd7Jftcdk@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/2/21 17:17, Sakari Ailus wrote:
> On Tue, Nov 02, 2021 at 03:59:41PM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 11/2/21 15:34, Andy Shevchenko wrote:
>>> On Tue, Nov 2, 2021 at 11:50 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> Pass tps68470_regulator_platform_data to the tps68470-regulator
>>>> MFD-cell, specifying the voltages of the various regulators and
>>>> tying the regulators to the sensor supplies so that sensors which use
>>>> the TPS68470 can find their regulators.
>>>>
>>>> Since the voltages and supply connections are board-specific, this
>>>> introduces a DMI matches int3472_tps68470_board_data struct which
>>>> contains the necessary per-board info.
>>>>
>>>> This per-board info also includes GPIO lookup information for the
>>>> sensor IO lines which may be connected to the tps68470 GPIOs.
>>>
>>> ...
>>>
>>>> +               board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
>>>> +               if (!board_data) {
>>>> +                       dev_err(&client->dev, "No board-data found for this laptop/tablet model\n");
>>>> +                       return -ENODEV;
>>>
>>> It's fine to use dev_err_probe() for known error codes.
>>>
>>>> +               }
>>>
>>> ...
>>>
>>>> +               cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>>>
>>> Do we need casting?
>>
>> Yes, the cast casts away a "const", the const is correct
>> since the data only ever gets read by the regulator driver,
>> but platform_data pointers are normally not const, so it
>> is either the cast, or loose the const on the definition
>> of the struct to which board_data->tps68470_regulator_pdata
>> points...
>>
>> So not good choice here really, only chosing between bad
>> options and I picked the lets do the cast "least worse"
>> option (at least to me). I'm open to changing this.
> 
> Maybe a comment explaining this briefly?

Yes, I was thinking the same myself, I'll add this for the
next version (which I expect to be the final version).

Regards,

Hans

