Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CE2C001B2
	for <platform-driver-x86@archiver.kernel.org>; Fri, 16 Dec 2022 15:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbiLPPXA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 16 Dec 2022 10:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbiLPPWw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Dec 2022 10:22:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD5853EC3
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Dec 2022 07:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671204130;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XLjDVQMOaQDf9kCy2gWjQIFoZeoTcfdAcAIX6l6ffTc=;
        b=IhjvQojXygza1z6Vlagp6KKoKluULMhzm9zlOEnv6QIVzD8mjbiI2GsA7OV7sL9F3FJLfL
        Pv57gzmxqw3bqNm06rWUgl0lkZBpqy6TD67MBbyeaeKzwQgkbldQ4JazSDBZ3BPN/4i3cI
        5y0bV6g0FnAKNTpv9QE6FjhvWZ2lHSM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-IE5-cLA2PdCPNldeVG_2UQ-1; Fri, 16 Dec 2022 10:22:09 -0500
X-MC-Unique: IE5-cLA2PdCPNldeVG_2UQ-1
Received: by mail-ed1-f72.google.com with SMTP id e14-20020a056402190e00b0047005d4c3e9so2106624edz.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Dec 2022 07:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLjDVQMOaQDf9kCy2gWjQIFoZeoTcfdAcAIX6l6ffTc=;
        b=xHyZa8T+84Rxz6NW68ORrKIaB6Z+6P4Zq9g6ZxQ1/1zd5G2F4noNHfQ8rpxKtWBeiY
         tFnR3t7u29LPysIqb7GtoMW9gVr4l7npDdFt3rqh3a/bGDitHMCTtWdBC0RoGpjdSDB6
         hdd4ltcHh00Y05EUpnwvAA2TpFcF4Jm7fOm09CGbuSSCBIYPCjfQV/jGlOl2owb5Tmqc
         I81F1wF3Qg+ht5RwgoIBW5cYJLGZlrrxdwaRf0/iF4A9736zJV/eE4d+WL4exOSin5m2
         pP0DUWbJG4ukWm+GRdHO2QW8ggUyCPlVowrQAAtfWGbU3GS9TUbXwSyqAiR8YJ8DI+5b
         wt4Q==
X-Gm-Message-State: ANoB5pmLXcoRyeg8/gNxyNOU9aKq/WRnxS7jmRe39wL3+6bhqmEa793U
        exY5HM1NezJ+pvp4mbgsoLoduFv3AuR2fD2tomdqfy1x/qN73tFyoO1BF4BkZ/b7l2C7fX9pj3Q
        rElbxQXozRMDZVKsEYaL3ab1pD1JNopVo2Q==
X-Received: by 2002:a17:906:3890:b0:7b2:8a6d:e946 with SMTP id q16-20020a170906389000b007b28a6de946mr28045631ejd.30.1671204128012;
        Fri, 16 Dec 2022 07:22:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7YYX/dyJtVTWTDIjqC/iuZkmA+xylzHt6PG1KRCEos6AnmV3ZVyXX7leNzo2uc0QR61mFheQ==
X-Received: by 2002:a17:906:3890:b0:7b2:8a6d:e946 with SMTP id q16-20020a170906389000b007b28a6de946mr28045612ejd.30.1671204127847;
        Fri, 16 Dec 2022 07:22:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id kv5-20020a17090778c500b007b29eb8a4dbsm987367ejc.13.2022.12.16.07.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 07:22:07 -0800 (PST)
Message-ID: <1f784f94-cbb1-79db-3796-ec5c21c9e8e2@redhat.com>
Date:   Fri, 16 Dec 2022 16:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 01/11] leds: led-class: Add missing put_device() to
 led_put()
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
 <20221216113013.126881-2-hdegoede@redhat.com>
 <Y5x0IdXiczdc73qV@smile.fi.intel.com> <Y5x4z6N5ZjdomP4c@smile.fi.intel.com>
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y5x4z6N5ZjdomP4c@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/16/22 14:55, Andy Shevchenko wrote:
> On Fri, Dec 16, 2022 at 03:35:29PM +0200, Andy Shevchenko wrote:
>> On Fri, Dec 16, 2022 at 12:30:03PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>>  	led_cdev = dev_get_drvdata(led_dev);
>>>  
>>> -	if (!try_module_get(led_cdev->dev->parent->driver->owner))
>>> +	if (!try_module_get(led_cdev->dev->parent->driver->owner)) {
>>> +		put_device(led_cdev->dev);
>>>  		return ERR_PTR(-ENODEV);
>>> +	}
>>>  
>>>  	return led_cdev;
>>
>> ...
>>
>>>  void led_put(struct led_classdev *led_cdev)
>>>  {
>>>  	module_put(led_cdev->dev->parent->driver->owner);
>>> +	put_device(led_cdev->dev);
>>
>> Hmm... It was in the original submission.
>>
>> https://lore.kernel.org/linux-leds/1443605522-1118-2-git-send-email-tomi.valkeinen@ti.com/
> 
> ...
> 
>> Nevertheless, shouldn't you put device before putting module? (It may need to
>> save the owner of the driver, I think.)
> 
> I think this is wrong, the symmetry is kept correct in your patch.

Right, the line above dereferences led_cdev->dev, so the put()
must be done after that line.

Regards,

Hans

