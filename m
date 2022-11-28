Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F7F4C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Nov 2022 16:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbiK1QNB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Nov 2022 11:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232553AbiK1QMz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Nov 2022 11:12:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6714562DF
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 08:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669651916;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=R3QggCtp5P01IPJZr6nB2FiLsZrt0x1fsSxs097foeg=;
        b=jIOfkQOUy9clOP5kpgcemWYNnF/noZH65LVgYTYfL5nwKSuJ/Blz90WL9tmtkFPJUcpJC8
        c0XOd8CYX9lPY9PtKTdZD9GhVoNohVfoxacQt/XsNGsk3zFMkckZHEwGQ7dOpbz5Mrrj1a
        FQ7xdsEIt2s/tBQVS7tr+543XmsPAoA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-zH-PrYk0Pzu-mc_JhGjxSQ-1; Mon, 28 Nov 2022 11:11:55 -0500
X-MC-Unique: zH-PrYk0Pzu-mc_JhGjxSQ-1
Received: by mail-ed1-f70.google.com with SMTP id y2-20020a056402440200b00469c41d5367so6794434eda.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 28 Nov 2022 08:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3QggCtp5P01IPJZr6nB2FiLsZrt0x1fsSxs097foeg=;
        b=QbmkvDQ5LaMNFJHnR1oA48dnGMosxdcoL5TaXhZgtEtN3bomj35iE6kpk4CFq0sJSW
         Xyv/r+oa4HuYn2SJkhptOhzW202OGlSQW/vXNptAFs5+vbVeeyeeAqQJoSL8RpFmCFtV
         bemat/UJdw3pcRWaVtUbMnM9oNsLi07qvhmcPPAEVCyuXTR/XQyPEGcEJFgskPzurJft
         Iijalui+/lfN1RIIsNooUgMA05BNTSyoxuAz3Uyh7ziMPKh0Jc5auhBMk9Z9ub8V+s5C
         /L0JwiO9tTy3uOvT1oa9MhwJ0WBDIKxmAGQEqtegXxGixqHWQePoQn3psQLl+zVtqVWc
         m+Ag==
X-Gm-Message-State: ANoB5pmX/oMrnPKU/04PRjaEL97fPBHY2vuQd2x67A81eipIjUC/B4qx
        jePkhimYuL0xlkUv74vxNvKzrfGZ0wGxc7NlTPC5A5+ZOcF0h2y/4M9/MI1VVCOw553LoBQsHA3
        B88KeC6p5euPRecyppr46cNOZ4lG/CFf2LA==
X-Received: by 2002:a17:906:ca2:b0:7b9:eef3:4435 with SMTP id k2-20020a1709060ca200b007b9eef34435mr21844842ejh.696.1669651913980;
        Mon, 28 Nov 2022 08:11:53 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7SH1MoysQD+vLwBbbAaxl7lZ3cTJbTYOyqwHN/LVyAwefqT18nt3/lE2m8AY74P3shT4FLEA==
X-Received: by 2002:a17:906:ca2:b0:7b9:eef3:4435 with SMTP id k2-20020a1709060ca200b007b9eef34435mr21844806ejh.696.1669651913699;
        Mon, 28 Nov 2022 08:11:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id x22-20020a1709064bd600b0078d3f96d293sm5163240ejv.30.2022.11.28.08.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 08:11:53 -0800 (PST)
Message-ID: <27b71261-ac9b-c103-88af-2ca53477317a@redhat.com>
Date:   Mon, 28 Nov 2022 17:11:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
 <636c471d-d7ee-d184-7a9d-fbfd0545059c@redhat.com>
 <Y4DVXT2TlTYkUHEr@pendragon.ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y4DVXT2TlTYkUHEr@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Laurent,

On 11/25/22 15:46, Laurent Pinchart wrote:

<snip>

>> There seems to be a bunch of GPIO/clk/regulator boilerplate duplicated
>> in all the sensor drivers. I think a little helper-library  for this might
>> be in order. E.g. Something like this (in the .h file)
> 
> I fully agree that camera sensor helpers would be good to have.
> 
>> struct camera_sensor_pwr_helper {
>> 	// bunch of stuff here, this should be fixed size so that the
>> 	// sensor drivers can embed it into their driver-data struct
>> };
>>
>> int camera_sensor_pwr_helper_init(struct camera_sensor_pwr_helper *helper,
>> 				  const char *supply_names, int supply_count,
>> 				  const char* clk_name.
>> 				  /* other stuff which I'm probably forgetting right now */);
> 
> There are all kind of constraints on the power on/off sequences, I don't
> think we would be able to model this in a generic way without making it
> so complicated that it would outweight the benefits.

I know that for some ICs the power sequence can be quite complicated,
but I think that for most this order should work fine:

0. Force enable/reset GPIOs to disabled / reset-asserted (do this at GPIO request time ?)
1. Enable clk(s)
2. Enable regulators (using the bulk API, with supply-names passed
in by the sensor drivers, 
3. Set enable/reset GPIOs to enabled / reset de-asserted

I guess on some models we may need to swap 1 and 2, there could be
a flag for that.

Anything more complicated should just be coded out in the driver, but
I think just supporting this common pattern will already save us
quite a bit of code duplication.

> What I think could help is moving all camera sensor drivers to runtime
> PM, and having helpers to properly enable runtime PM in probe() in a way
> that works on both ACPI and DT systems, with or without CONFIG_PM
> enabled. It's way more complicated than it sounds.

I agree that we should move to runtime-pm and put the power-sequence
in the suspend/resume callback. This will be necessary for any sensors
used on atomisp2 devices, where there are actually ACPI _PS0 and _PS3
methods and/or ACPI power-resources doing the PM for us.

Note for some reason the current staging atomisp driver does not use this,
likely because it was developed for Android boards with broken ACPI
tables. But after having sampled the ACPI tables of a bunch of atomisp
windows devices I believe this should work fine for those.

Regards,

Hans




> 
>> // turn_on_privacy_led should be false when called from probe(), must be true when
>> // called on stream_on().
>> int camera_sensor_pwr_helper_on(struct camera_sensor_pwr_helper *helper, bool turn_on_privacy_led);
>> int camera_sensor_pwr_helper_off(struct camera_sensor_pwr_helper *helper);
>>
>> // maybe, or make everything devm managed? :
>> int camera_sensor_pwr_helper_exit(struct camera_sensor_pwr_helper *helper);
>>
>> Just is just a really really quick n dirty design. For one I could use
>> suggestions for a better name for the thing :)
>>
>> I think something like this will be helpfull to reduce a whole bunch
>> of boilerplate code related to powering on/off the sensor in all
>> the drivers; and it would give us a central place to drive an
>> (optional) privacy-led GPIO.
>>
>>>>> And likewise (eventually) completely drop the "clken" GPIO this
>>>>> patch series introduces (with some sensors) and instead always model
>>>>> this through the clk-framework.
>>>>>
>>>>> Hans de Goede (3):
>>>>>    platform/x86: int3472/discrete: Refactor GPIO to sensor mapping
>>>>>    platform/x86: int3472/discrete: Get the polarity from the _DSM entry
>>>>>    platform/x86: int3472/discrete: Add support for sensor-drivers which
>>>>>      expect clken + pled GPIOs
>>>>>
>>>>>   drivers/platform/x86/intel/int3472/common.h   |  2 +-
>>>>>   drivers/platform/x86/intel/int3472/discrete.c | 92 ++++++++++++++++---
>>>>>   2 files changed, 78 insertions(+), 16 deletions(-)
> 

