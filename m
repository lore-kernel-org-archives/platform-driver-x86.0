Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D87C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Nov 2022 10:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiK1Kpm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Nov 2022 05:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbiK1Kpk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Nov 2022 05:45:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1205FDE97
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 02:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669632281;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Bt7OiEjK1VQXFk7k6ihVJjVjUzZK8p7n2i61oTRo808=;
        b=Ka39i7A946DgbSE2HLYtNSUE9kqRVZk4EWTxmbaQyZSAtDtdEzLkPHPUyDgrZlyaZENuwn
        9hKUJ37IGI6YmW0uGji5a3RtVTGn0HbZqGsKU9ctggz9ofNuW/hBWk4jph3CQ3mML9qzay
        xHpEN+6iGitDwlw5Avlv+3F2Naw9FzA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-634-f5o2NdsgNpSm9K5cZWKb_Q-1; Mon, 28 Nov 2022 05:44:39 -0500
X-MC-Unique: f5o2NdsgNpSm9K5cZWKb_Q-1
Received: by mail-ed1-f71.google.com with SMTP id b13-20020a056402350d00b00464175c3f1eso6319671edd.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 02:44:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bt7OiEjK1VQXFk7k6ihVJjVjUzZK8p7n2i61oTRo808=;
        b=F4VI/G831C091D1dwk/UGuqZHY1v68tF627hMDrRH49yA3Y2y1YGdJZJCsFLRMmVlG
         T8QSKxMThefziujhAnsIl/hph8gajM9+GB0zDxh6o6mBo8kPP3NAcUZ/RigiqT0H1c6U
         6474z3XbZpWbT6hPlG++RFdf/Wb7cQ2kIOUFqRjzU/WVWsEfLhrU8gRoT3M3TcQGeAn1
         SazdKDNZp6I4ywjr2pUqxKR4ABa4oPNC29xatinnB/zKpX+4GDqMk5CtcMjAp1pq61zf
         6qLnmyxX9py98WNn329HUEAkuwxcUbpiwKcC2Yg7Ab37DCXdf/sEhPrMgc0X48J9WIfy
         bV5A==
X-Gm-Message-State: ANoB5pmVU3SzoIXhZaXYaIXLfU9wGliUZ0C8/FbtjZPyMY4km7B5mq0f
        EYzIBETAffDe2EZjh7FE27zvczCwu5+QYBQOWMFMp30GZz2iJwIkb5yCnRvuRqxOX0mjaZ+RNF8
        g3mUTWAHhR9viZA8RryW0eNbiXuTvk9iRlA==
X-Received: by 2002:a17:906:d9b:b0:7bc:c85f:bbde with SMTP id m27-20020a1709060d9b00b007bcc85fbbdemr12972504eji.271.1669632278273;
        Mon, 28 Nov 2022 02:44:38 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5uJ0JDvBDM6dQylTL/3TbHjy/LYeN2wP09LmCD/yY0zDOnj7s3VRuufgbVORIEnGJPxICnUQ==
X-Received: by 2002:a17:906:d9b:b0:7bc:c85f:bbde with SMTP id m27-20020a1709060d9b00b007bcc85fbbdemr12972488eji.271.1669632278023;
        Mon, 28 Nov 2022 02:44:38 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cw14-20020a056402228e00b00467481df198sm5080642edb.48.2022.11.28.02.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 02:44:37 -0800 (PST)
Message-ID: <58a7f20d-dd47-1ffc-f7b2-f1d30a0a7d69@redhat.com>
Date:   Mon, 28 Nov 2022 11:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Add Lenovo Yoga Tab 3
 (YT3-X90F) charger + fuel-gauge data
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
References: <20221127182458.104528-1-hdegoede@redhat.com>
 <Y4SLhlW1t5epgamh@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4SLhlW1t5epgamh@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On 11/28/22 11:20, Andy Shevchenko wrote:
> On Sun, Nov 27, 2022 at 07:24:58PM +0100, Hans de Goede wrote:
>> The Lenovo Yoga Tab 3 (YT3-X90F) is an Intel Cherry Trail based tablet
>> which ships with Android as Factory OS. Its DSDT contains a bunch of I2C
>> devices which are not actually there, causing various resource conflicts.
>> Use acpi_quirk_skip_i2c_client_enumeration() to not enumerate these.
>>
>> The YT3-X90F has quite a bit of exotic hardware, this adds initial
>> support by manually instantiating the i2c-clients for the 2 charger +
>> 2 fuel-gauge chips used for the 2 batteries.
>>
>> Support for other parts of the hw will be added by follow-up patches.
> 
> ...
> 
>> +	/*
>> +	 * The "bq25892_0" charger IC has its /CE (Charge-Enable) and OTG pins
>> +	 * connected to GPIOs, rather then having them hardwired to the correct
>> +	 * values as is normally done.
>> +	 *
>> +	 * The bq25890_charger driver controls these through I2C, but this only
>> +	 * works if not overridden by the pins. Set these pins here:
>> +	 * 1. Set /CE to 0 to allow charging.
> 
> If I read this correctly then the /CE is an active low pin and setting to 0
> means active state

Correct.

> which...
> 
>> +	 * 2. Set OTG to 0 disable V5 boost output since the 5V boost output of
>> +	 *    the main "bq25892_1" charger is used when necessary.
>> +	 */
>> +
>> +	/* /CE pin */
>> +	ret = x86_android_tablet_get_gpiod("INT33FF:02", 22, &gpiod);
>> +	if (ret < 0)
>> +		return ret;
> 
>> +	gpiod_set_value(gpiod, 0);
> 
> ...contradicts with the virtual state here. Perhaps you missed the
> corresponding flag to enable negation?

x86_android_tablet_get_gpiod() gets the GPIO directly from
the gpio-chip using gpiochip_get_desc() since these GPIOs are
not described in ACPI. There is no option to pass a gpio_lookup_flags
flag like GPIO_ACTIVE_LOW this way since we are not doing an actual lookup.

Regards,

Hans




> 
>> +	/* OTG pin */
>> +	ret = x86_android_tablet_get_gpiod("INT33FF:03", 19, &gpiod);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	gpiod_set_value(gpiod, 0);
> 

