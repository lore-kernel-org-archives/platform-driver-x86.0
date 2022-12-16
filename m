Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B0EC46467
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Dec 2022 15:57:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbiLPP4z (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Dec 2022 10:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231613AbiLPP4c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Dec 2022 10:56:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74B86F0DC
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Dec 2022 07:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671206105;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l1QGKShqesb195W0tX6sBqmv6YRitL8LGR0dkY2RdTU=;
        b=Bt7KqSHVh60eWFdKvM2Wee6jtkYe/A3ELnK6SOlYIjUz+LaF1vQPcp06Za12bYIPzNCqh1
        kDu0SeX4/yrYLXLPmWDzpSjhREKDUeqBSL8KLQOVbMfYax+Gco05ZL3+w5PirEhHKn442C
        oa8R8BacXpQBxmBIU2pMejMxd6LQ7wo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-H2-LZ5HgMjC5RnerENynzA-1; Fri, 16 Dec 2022 10:55:02 -0500
X-MC-Unique: H2-LZ5HgMjC5RnerENynzA-1
Received: by mail-ej1-f70.google.com with SMTP id xj11-20020a170906db0b00b0077b6ecb23fcso2115536ejb.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Dec 2022 07:55:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l1QGKShqesb195W0tX6sBqmv6YRitL8LGR0dkY2RdTU=;
        b=RQhhFo9P62DJU9RsQQC9zBZPu41WabCaOh5w9taBvdxTO8ZcC6RHZ3mJVKh6s11W+p
         1KjekJLnNp9uhrls30ksLjsm9I4CRb4P97hceKxC3zVtmyAsHz84gxFpHEv1zEE84qhk
         FCuJB2KoKpydwG59zvpWAfQrlgSM3fp8LxM1QXH3v6DXFKcCUnDnImnDRWiCVMwrCvPd
         SPYAtOUmiTh/+4qhBbd+vF6m0u/yv30hP8Dd3rlg//HbMZeeqp9UisAT5fxV0ZsnUxDP
         9O66EG2LNqxPXG/hr06Zbe54telcxyk4YpmSVJciBXdp4cgyAyaPFeon79lslEQdzQlD
         qN6Q==
X-Gm-Message-State: ANoB5pn59QCFh3WBFt7QmJ/HLGqn11Q0m5at7dasY2e/XlQZScYS7eDg
        JuymlTJXk5LMb/kaLFX1wqyYQ7WYMkhVYA8GeyIj3qOARsAo1/nSy3PY31+CgWbMBxAlNctM9++
        Tp2aJSypEcUaJ7wCwPFN5p2bfdKgYxsCkew==
X-Received: by 2002:a05:6402:5289:b0:461:d042:80db with SMTP id en9-20020a056402528900b00461d04280dbmr27070807edb.0.1671206101545;
        Fri, 16 Dec 2022 07:55:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7QbDhbO4XcaW+bgU1aN5jMBlXLtn9msxNPRATAilH/NuUh97gK5a1eQUyRItPBH/8WHTI47g==
X-Received: by 2002:a05:6402:5289:b0:461:d042:80db with SMTP id en9-20020a056402528900b00461d04280dbmr27070785edb.0.1671206101319;
        Fri, 16 Dec 2022 07:55:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id w6-20020a50fa86000000b004616b006871sm982387edr.82.2022.12.16.07.55.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:55:00 -0800 (PST)
Message-ID: <d329fa91-a913-a0ab-a7a9-50069c1c834c@redhat.com>
Date:   Fri, 16 Dec 2022 16:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 05/11] leds: led-class: Add generic [devm_]led_get()
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
        linux-media@vger.kernel.org
References: <20221216113013.126881-1-hdegoede@redhat.com>
 <20221216113013.126881-6-hdegoede@redhat.com>
 <Y5x17PKiPnMLMfMg@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x17PKiPnMLMfMg@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/16/22 14:43, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 12:30:07PM +0100, Hans de Goede wrote:
>> Add a generic [devm_]led_get() method which can be used on both devicetree
>> and non devicetree platforms to get a LED classdev associated with
>> a specific function on a specific device, e.g. the privacy LED associated
>> with a specific camera sensor.
>>
>> Note unlike of_led_get() this takes a string describing the function
>> rather then an index. This is done because e.g. camera sensors might
>> have a privacy LED, or a flash LED, or both and using an index
>> approach leaves it unclear what the function of index 0 is if there is
>> only 1 LED. The existing of support is extended to also support
>> getting a LED by function-name using the standard devicetree pattern
>> of adding a -names string array to map names to the indexes.
>>
>> For non devicetree platforms a lookup-table mechanism is added to
>> allow the platform code to map specific LED class_dev-s to specific
>> device,function combinations this way.
> 
> ...
> 
>> +	list_for_each_entry(lookup, &leds_lookup_list, list) {
>> +		if (!strcmp(lookup->consumer_dev_name, dev_name(dev)) &&
>> +		    !strcmp(lookup->consumer_function, function)) {
>> +			led_name = kstrdup(lookup->led_name, GFP_KERNEL);
> 
> kstrdup_const() ?

Ack.

> 
>> +			break;
>> +		}
>> +	}
> 
>> +	if (!led_name)
>> +		return ERR_PTR(-ENOENT);
>> +
>> +	led_dev = class_find_device_by_name(leds_class, led_name);
>> +	kfree(led_name);
> 
> kfree_const() ?

Ack, will change for v4.

> 
>> +	return __led_get(led_dev);
>> +}
> 
> ...
> 
>> +EXPORT_SYMBOL_GPL(led_add_lookup);
> 
>> +EXPORT_SYMBOL_GPL(led_remove_lookup);
> 
> Wondering why we can't make at least those two to be namespaced from day 1,

switching the LED subsystem code to use module namespaces is
a RFE which is independent of / orthogonal to this patchset.

Regards,

Hans

