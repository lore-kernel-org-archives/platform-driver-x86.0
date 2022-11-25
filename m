Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3E4C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Nov 2022 11:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbiKYLY2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Nov 2022 06:24:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiKYLY1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Nov 2022 06:24:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4871CB28
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Nov 2022 03:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669375402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1W54hcOYwQvNSGU/DWgYShiQT5PFWJLNqLmIUjt2ABk=;
        b=aSNWXT85hAkLsbHGySjECM5MyLlJeCXjA5oOJKGLUd0hO+Hb8uBQT+MHcfAdQXV4AsJaDb
        wfXYjMwz27AQ2oeVkVNlJD/NR2LGlDm876LG/urWCHXPkhRrNDnTGWD0l9uWvjwe5ZxjM3
        6DIPQt5XD1lGlw/jpOtpskmBYNiURis=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-426-x2SZ6J5MMPiK0PJrvlJkfg-1; Fri, 25 Nov 2022 06:23:21 -0500
X-MC-Unique: x2SZ6J5MMPiK0PJrvlJkfg-1
Received: by mail-ej1-f70.google.com with SMTP id sb4-20020a1709076d8400b007ae596eac08so2184575ejc.22
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Nov 2022 03:23:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1W54hcOYwQvNSGU/DWgYShiQT5PFWJLNqLmIUjt2ABk=;
        b=sWjLv6XAwRa3ugghyxrjc5vg1O6PCbGAFClMNs7fzjZcoPQDbdicEWoOVn7aLQY0gt
         di3qG+BjEYfYrXFb03rGoEIGsVE29QKstRJKk9141jSn9cf9f71MAyFivV4fLaZTn/la
         7izOd1GwManXsvmdGz7BVRwLf6sVqE0U0iEhfdrPXzEAUR6VT1yM9hVhu/wKay4mI4fl
         oWTNrLSwje9TUL5qryEGV36xBVY02C4naiBvZpGY37zmATk/atAhbMAinsT+GpqdNhaA
         Rm1qUWw5CB+ibr53atbV3OzXl4HOSB8Dgsjye193z/632IAy3t0nl4/ShgYIYg8of+0D
         SPfA==
X-Gm-Message-State: ANoB5pkvSL4j/rQUTyYDAwiqlwHfZIBtMK/R/UojBd8aMfj0KtmrUceH
        03u2azoVeYeY/sApmwWo+H0WzTnosZGtPbXEqjWIxB2KZInQ1DTJPQ7nCRTmk0bJNlF3Jft570L
        U/H+z3sYNV5HUkq1ifs0S8SH2NFIXYtG73Q==
X-Received: by 2002:a05:6402:3892:b0:454:cbef:c161 with SMTP id fd18-20020a056402389200b00454cbefc161mr16652370edb.365.1669375400029;
        Fri, 25 Nov 2022 03:23:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5McVwAstzhvJ1cpuDCSrLzZrwl4wuQujsxFXM04i7QwYi0yysUnKXOmFMQ9RSj1UxGFQ82iA==
X-Received: by 2002:a05:6402:3892:b0:454:cbef:c161 with SMTP id fd18-20020a056402389200b00454cbefc161mr16652353edb.365.1669375399857;
        Fri, 25 Nov 2022 03:23:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id o5-20020a170906768500b007ad96726c42sm1461842ejm.91.2022.11.25.03.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:23:19 -0800 (PST)
Message-ID: <8f736a26-9942-4fda-0237-313da5bf9c6b@redhat.com>
Date:   Fri, 25 Nov 2022 12:23:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
Content-Language: en-US, nl
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
 <Y4Cf5tLWsBDTndei@pendragon.ideasonboard.com>
 <Y4ChnCHkV9RufccT@smile.fi.intel.com>
 <aa42a60b-fe34-a418-3ada-af55f260592e@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <aa42a60b-fe34-a418-3ada-af55f260592e@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/22 12:11, Dan Scally wrote:
> 
> On 25/11/2022 11:06, Andy Shevchenko wrote:
>> On Fri, Nov 25, 2022 at 12:58:46PM +0200, Laurent Pinchart wrote:
>>> On Fri, Nov 25, 2022 at 10:17:17AM +0000, Dan Scally wrote:
>> ...
>>
>>> Can the LED framework be used without having the LED exposed to
>>> userspace ?
>> I believe the correct question here is "can the states of some leds be
>> read-only from user perspective" (this way any changes into led subsystems
>> looks less intrusive, esp. taking into account that subsystem is de facto
>> unmaintained).
>>
> 
> I think the answer to that is yes:
> 
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/leds/led-class.c#L47

Interesting, I did not know that. But what is the added value of
using the LED subsytem then for a simple only on/off LED driven
by a GPIO?

One of the challenges with using LED triggers for the privacy led,
is that we need at least 2 triggers: "camera-front" and "camera-back"
and then somehow to let what ever code sets the triggers know if
it is dealing with the front or back sensor.

Where as with GPIO-s we *bind* them to the sensor i2c_client so if
we just have the sensor-driver look for an optional GPIO called
"privacy-led" then we don't have this how to we bind the LED to
the sensor problem; and if we drop the sysfs interface I fail to
see the value in using the LED subsystem for GPIO a driven LED.

Also see my other reply for a proposal to be able to share the
code dealing with this between sensor drivers (and also remove
some other gpio/clk/regulator boilerplate from sensor drivers).

Regards,

Hans


