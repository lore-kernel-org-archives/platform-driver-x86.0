Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD57FC43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Apr 2021 12:33:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA82C61400
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Apr 2021 12:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhD2MeL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Apr 2021 08:34:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39231 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237075AbhD2MeJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Apr 2021 08:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619699602;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GrKq3UC4OJTuxJrBqTBTU6T4d2IlYMcI0WkWfsWdexI=;
        b=BY3NK6K/lBjsl+5wAtZE5UH0yVWILhLEY8T2wWmRz7tI0j7z7iCdmU03ZJVdtK8vBFKmBJ
        jxzgoC+9AF7gDePK0z2VfxxUtWAD0wvpDThZphwwaAeYOFhalu4YfD19r9d5k2Eq6yrB40
        xDQkUgZyG0kYSFnykS4L8/7Skb5IWuI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-iQBCQezlOxCHpWxFLd5fOw-1; Thu, 29 Apr 2021 08:33:20 -0400
X-MC-Unique: iQBCQezlOxCHpWxFLd5fOw-1
Received: by mail-ed1-f71.google.com with SMTP id o4-20020a0564024384b0290378d45ecf57so28873098edc.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Apr 2021 05:33:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GrKq3UC4OJTuxJrBqTBTU6T4d2IlYMcI0WkWfsWdexI=;
        b=aPv/jU7bMrmJOOApZlL0RQyMEETXH07lAyCgt9uWRvD+SqvEjSVFSgVU2YuOY52gnE
         twawxb4O7sUF1wuF4nRox9bCfOoT0YlUIRgKF3dbEm7hTVPeHYi5NAwQMzI1zC4Fqn5e
         Z4LZZ9Vst/zn5hlM7vT3fSqX55NFyhbiFI+qRnAhZg/aiF2obrbMGF+y8h7z2//027Qv
         g5lUq6dlSPDCk+buxwiS2r0EyuUZnJjdDyzCvRs6+BcN/Uh/exw3KNVI0jUChsoJXJyZ
         B5a49V7OlJDHUiaVinCIMmowo13e5ORLhPzNjT0S8HGZqPwy/2SeTKRR4oRu1KbjZ5q3
         o+Dg==
X-Gm-Message-State: AOAM53360iGwFUfAWyK3newWNXlG41XMZFQAnGrDIC4SOgaqnciodlZ/
        WJ4s5G6iPwECFZiaFSlQGJ4eGfGHgVCilTanTMt+epEz/HQSY5F3ABSzdSnGGXHTNLn+bh/RNrX
        HvVUJjgTHpyhOWgpREm1Z4H7wtbrJc/D4cg==
X-Received: by 2002:a17:907:75f6:: with SMTP id jz22mr24635651ejc.504.1619699599298;
        Thu, 29 Apr 2021 05:33:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6XSSTtlaPBL2Al2wSDZ5kLm8eA5zhcM5X1CoKpafjS9IMvkP05RefygrrVGfqccP4YWJw7A==
X-Received: by 2002:a17:907:75f6:: with SMTP id jz22mr24635628ejc.504.1619699599119;
        Thu, 29 Apr 2021 05:33:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t15sm2296998edr.55.2021.04.29.05.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 05:33:18 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To:     Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
References: <20210428215257.500088-1-hdegoede@redhat.com>
 <20210428215257.500088-2-hdegoede@redhat.com>
 <YIqbLDIeGXNSjSTS@phenom.ffwll.local> <YIqehmw+kG53LF3t@kroah.com>
 <YIqg59yageIUwiwy@phenom.ffwll.local>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
Date:   Thu, 29 Apr 2021 14:33:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIqg59yageIUwiwy@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/29/21 2:04 PM, Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
>> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
>>> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
>>>> Userspace could hold open a reference to the connector->kdev device,
>>>> through e.g. holding a sysfs-atrtribute open after
>>>> drm_sysfs_connector_remove() has been called. In this case the connector
>>>> could be free-ed while the connector->kdev device's drvdata is still
>>>> pointing to it.
>>>>
>>>> Give drm_connector devices there own device type, which allows
>>>> us to specify our own release function and make drm_sysfs_connector_add()
>>>> take a reference on the connector object, and have the new release
>>>> function put the reference when the device is released.
>>>>
>>>> Giving drm_connector devices there own device type, will also allow
>>>> checking if a device is a drm_connector device with a
>>>> "if (device->type == &drm_sysfs_device_connector)" check.
>>>>
>>>> Note that the setting of the name member of the device_type struct will
>>>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
>>>> as extra info. So this extends the uevent part of the userspace API.
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Are you sure? I thought sysfs is supposed to flush out any pending
>>> operations (they complete fast) and handle open fd internally?
>>
>> Yes, it "should" :)
> 
> Thanks for confirming my vague memories :-)
> 
> Hans, pls drop this one.

Please see my earlier reply to your review of this patch, it is
still needed but for a different reason:

"""
We still need this change though to make sure that the 
"drm/connector: Add drm_connector_find_by_fwnode() function"
does not end up following a dangling drvdat pointer from one
if the drm_connector kdev-s.

The class_dev_iter_init() in drm_connector_find_by_fwnode() gets
a reference on all devices and between getting that reference
and it calling drm_connector_get() - drm_connector_unregister()
may run and drop the possibly last reference to the
drm_connector object, freeing it and leaving the kdev's
drvdata as a dangling pointer.
"""

This is actually why I added it initially, and while adding it
I came up with this wrong theory of why it was necessary independently
of the drm_connector_find_by_fwnode() addition, sorry about that.

Regards,

Hans


