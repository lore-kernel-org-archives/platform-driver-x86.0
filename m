Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC495C43217
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Nov 2022 11:29:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiK1L33 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Nov 2022 06:29:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiK1L31 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Nov 2022 06:29:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941E7115A
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 03:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669634912;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/7MySPxfWRhKCAy6L+JYq3epC62mBperdDn509xL1Vw=;
        b=Oozhk3ZQGsEj0HILjlgcqFvy3J+FI0fYhKrLPofk6R9uScsfWeVw2KPZ/VOaRDYpRhSEHf
        zQlA4/Qs1QokOsT4xy5rtjp659SpybF9LvSUCTzWmCUXy0pu+dWnMecN5UsFFO7JbZvaOJ
        Xb6dsXk36hS9JaxGtuIqhmaLeq0ioow=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-261-BW5RzWdaPiqpBUgXKH0Ydw-1; Mon, 28 Nov 2022 06:28:31 -0500
X-MC-Unique: BW5RzWdaPiqpBUgXKH0Ydw-1
Received: by mail-ej1-f72.google.com with SMTP id jg27-20020a170907971b00b007ad9892f5f6so4145917ejc.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 03:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7MySPxfWRhKCAy6L+JYq3epC62mBperdDn509xL1Vw=;
        b=FshBrQSwcyn1kE1YAggg0wd0KaQCbZ+sg7t5Tf8+6LakTVk1Nh6OEDtmF9KVJ4xOGT
         ZtRycAqvixg3HVDWH84y0fxu31YG878OD/P9alq0HcQ5I3nT4KULWzS3gEzo58yGoHC7
         CZXGu7duHfJflFzaC+tz/Hb99I3AV7RKc7FCvTzn9qJb7TcCrKY5XeBVU1Fks46DG0o4
         OSoA0ae/5oGI2qpGWYsVXh/u9viaLXMQYM2HkaGHByBo+SBf4v5DPaaJ7BdS7alSUnLW
         u6mN7kJ6eDYSYUDuDnY4EFgRGRn9EY5HhFfxrgYm1a9oz28nTJte3goyu7WBCmiU4xk9
         lH/g==
X-Gm-Message-State: ANoB5pnHyQPsyQ5LPrA7tmp2wGeADaP+DzpCocQDN59ld8DcP0UWkv+x
        NBnGlld+EceiWOJiZayk4RkY/AIXhPNDfiytMWKyNwhYT6PgTopVJlFDS0ySH1ldd2MUAxgwYs4
        excjLXrk1IDSfpIaSx9CgPOADyHQbb8pKjQ==
X-Received: by 2002:a17:907:1df2:b0:7ae:8411:112c with SMTP id og50-20020a1709071df200b007ae8411112cmr40613903ejc.97.1669634910343;
        Mon, 28 Nov 2022 03:28:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4EozmQhAikXbysdfaXIEphfNhPq7AAiRrBsCCsuA355SFjl7TuyhFyhyWb5rxNJcCp0SqThg==
X-Received: by 2002:a17:907:1df2:b0:7ae:8411:112c with SMTP id og50-20020a1709071df200b007ae8411112cmr40613886ejc.97.1669634910141;
        Mon, 28 Nov 2022 03:28:30 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id gk5-20020a17090790c500b007be301a1d51sm2548411ejb.211.2022.11.28.03.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 03:28:29 -0800 (PST)
Message-ID: <f863bbad-2b8a-2089-d39c-bf57cfc53b05@redhat.com>
Date:   Mon, 28 Nov 2022 12:28:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <Y4DT1ovvIR4NB5qm@pendragon.ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4DT1ovvIR4NB5qm@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/22 15:40, Laurent Pinchart wrote:
> On Thu, Nov 24, 2022 at 09:00:04PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> Here is a small set of patches to make the int3472/discrete code
>> work with the sensor drivers bundled with the (unfortunately out of tree)
>> IPU6 driver.
>>
>> There are parts of the out of tree IPU6 code, like the sensor drivers,
>> which can be moved to the mainline and I do plan to work on this at some
>> point and then some of this might need to change. But for now the goal is
>> to make the out of tree driver work with standard mainline distro kernels
>> through e.g. dkms. Otherwise users need to run a patched kernel just for
>> a couple of small differences.
>>
>> This is basically a rewrite of this patch:
>> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
>>
>> Wich users who want to use the IPU6 driver so far have had to manually
>> apply to their kernels which is quite inconvenient.
>>
>> This rewrite makes 2 significant changes:
>>
>> 1. Don't break things on IPU3 platforms
>>
>> 2. Instead of extending the int3472_sensor_configs[] quirks table for each
>> model which needs "clken" and "pled" GPIOs, do this based on matching
>> the ACPI HID of the ACPI device describing the sensor.
> 
> How can we be sure that a given sensor model will always be wired to the
> same GPIOs on all platforms that integrate it with an IPU6 (or IPU3) ?

This is not about which GPIOs are actually there, this is about what the
driver expects. Specifically about if the driver expects the clock to
be modelled with the clk framework or as a clk-en GPIO which is
a property of the driver, not of the board design.

But as already mentioned I agree with Dan and you that modelling it
through the clk framework is correct and what needs to happen here is to
patch the IPU6 sensor drivers to move them to the clk framework.

so this is all mute.

Regards,

Hans

