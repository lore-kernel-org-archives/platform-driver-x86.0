Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED46CC433B4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Apr 2021 11:28:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF259613F0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Apr 2021 11:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhD3L3N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 30 Apr 2021 07:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41631 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229874AbhD3L3N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Apr 2021 07:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619782104;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3JFK72s4WgeXjVN5drGeID+sVQaIvMBZBVHsbJFKuQM=;
        b=T8QPIHVv5sJrSIzpiHF/qTMEmEZBGkvd6qNd+oDZ3dxxZFwTo2j/ERy1WBbMpdZJ9BP3rI
        biwUoMAj4mL1c/Z+vSwJmCR2gMDOyjBcsvAeFLcCus+naG/O1vpi+Q6Os6nnpRoqpPxwXZ
        PR63KVi69lJYF4k8xvhWJHhqMHncr0U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-J3-rZ826NbGt6gj9rR3l-w-1; Fri, 30 Apr 2021 07:28:23 -0400
X-MC-Unique: J3-rZ826NbGt6gj9rR3l-w-1
Received: by mail-ej1-f71.google.com with SMTP id r14-20020a1709062cceb0290373a80b4002so14810744ejr.20
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Apr 2021 04:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3JFK72s4WgeXjVN5drGeID+sVQaIvMBZBVHsbJFKuQM=;
        b=COr1YANz2RerPVBJ6QDdLLOqL0aSoE/EwBz+cyXsrRuqmnCKDv/SlVB1YKMCv8L/iK
         kpFbG74i87mmt5bCW7SScn1tcGPd7ADyspN5/20eePYQbaEi0HhyDUFEaxVjh7/BtiRX
         ntF69jCBLNGA1CJN4kLjM7J8X8NBiCGGhJ+QBF+t7q9NCnVN/K1FizlHFa6q2joZTCje
         muf1JK4naZzEwVB2piB8AV+nQPJpICOYweHB3l6AQ+9wX5RjmDahRd8TzAb5KhfoYj6/
         ImPqgMeZUxxIwFEPZNaOr19EWQb4A8vEpHRbGp8gsrebPHJuPk2jmG++DmHzAHnaV5TG
         B+Bw==
X-Gm-Message-State: AOAM530q31+5bdktgwiNLFjSzhE3chlWd190TkjGRPQDG9K64hgnVFjQ
        S9CXbxtOe2I5k+9qU1PxOamdu4jfA/wuY7Ay8uDepPQNFGK7J7sF80jJv3STpvMqTPI+uN+SjEY
        y5ZOtlxaz6rdGMJf6EL0tV8/0IFl6zOQC8g==
X-Received: by 2002:a05:6402:17ca:: with SMTP id s10mr5400551edy.198.1619782101754;
        Fri, 30 Apr 2021 04:28:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfriSPaxv9UxvbfohsO7UTlieySCqCsfHiHvrzZKh1PX0V5hf98r7px+MwLMq3tT8LQ09Orw==
X-Received: by 2002:a05:6402:17ca:: with SMTP id s10mr5400531edy.198.1619782101508;
        Fri, 30 Apr 2021 04:28:21 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k9sm1841855eje.102.2021.04.30.04.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Apr 2021 04:28:21 -0700 (PDT)
Subject: Re: [PATCH 1/9] drm/connector: Make the drm_sysfs connector->kdev
 device hold a reference to the connector
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 <4e78d188-f257-ad33-e703-bcbc54a30c31@redhat.com>
 <YIsEfAjFthAyHxUi@phenom.ffwll.local>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <43ee221e-7151-c0c2-cc52-37b191778221@redhat.com>
Date:   Fri, 30 Apr 2021 13:28:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIsEfAjFthAyHxUi@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/29/21 9:09 PM, Daniel Vetter wrote:
> On Thu, Apr 29, 2021 at 02:33:17PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 4/29/21 2:04 PM, Daniel Vetter wrote:
>>> On Thu, Apr 29, 2021 at 01:54:46PM +0200, Greg Kroah-Hartman wrote:
>>>> On Thu, Apr 29, 2021 at 01:40:28PM +0200, Daniel Vetter wrote:
>>>>> On Wed, Apr 28, 2021 at 11:52:49PM +0200, Hans de Goede wrote:
>>>>>> Userspace could hold open a reference to the connector->kdev device,
>>>>>> through e.g. holding a sysfs-atrtribute open after
>>>>>> drm_sysfs_connector_remove() has been called. In this case the connector
>>>>>> could be free-ed while the connector->kdev device's drvdata is still
>>>>>> pointing to it.
>>>>>>
>>>>>> Give drm_connector devices there own device type, which allows
>>>>>> us to specify our own release function and make drm_sysfs_connector_add()
>>>>>> take a reference on the connector object, and have the new release
>>>>>> function put the reference when the device is released.
>>>>>>
>>>>>> Giving drm_connector devices there own device type, will also allow
>>>>>> checking if a device is a drm_connector device with a
>>>>>> "if (device->type == &drm_sysfs_device_connector)" check.
>>>>>>
>>>>>> Note that the setting of the name member of the device_type struct will
>>>>>> cause udev events for drm_connector-s to now contain DEVTYPE=drm_connector
>>>>>> as extra info. So this extends the uevent part of the userspace API.
>>>>>>
>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>>
>>>>> Are you sure? I thought sysfs is supposed to flush out any pending
>>>>> operations (they complete fast) and handle open fd internally?
>>>>
>>>> Yes, it "should" :)
>>>
>>> Thanks for confirming my vague memories :-)
>>>
>>> Hans, pls drop this one.
>>
>> Please see my earlier reply to your review of this patch, it is
>> still needed but for a different reason:
>>
>> """
>> We still need this change though to make sure that the 
>> "drm/connector: Add drm_connector_find_by_fwnode() function"
>> does not end up following a dangling drvdat pointer from one
>> if the drm_connector kdev-s.
>>
>> The class_dev_iter_init() in drm_connector_find_by_fwnode() gets
>> a reference on all devices and between getting that reference
>> and it calling drm_connector_get() - drm_connector_unregister()
>> may run and drop the possibly last reference to the
>> drm_connector object, freeing it and leaving the kdev's
>> drvdata as a dangling pointer.
>> """
>>
>> This is actually why I added it initially, and while adding it
>> I came up with this wrong theory of why it was necessary independently
>> of the drm_connector_find_by_fwnode() addition, sorry about that.
> 
> Generally that's handled by a kref_get_unless_zero under the protection of
> the lock which protects the weak reference. Which I think is the right
> model here (at a glance at least) since this is a lookup function.

I'm afraid that things are a bit more complicated here. The idea here
is that we have a subsystem outside of the DRM subsystem which received
a hotplug event for a drm-connector.  The only info which this subsystem
has is a reference on the fwnode level (either through device-tree or
to platform-code instantiating software-fwnode-s + links for this).

So in order to deliver the hotplug event to the connector we need
to lookup the connector by fwnode.

I've chosen to implement this by iterating over all drm_class
devices with a dev_type of drm_connector using class_dev_iter_init()
and friends. This makes sure that we either get a reference to
the device, or that we skip the device if it is being deleted.

But this just gives us a reference to the connector->kdev, not
to the connector itself. A pointer to the connector itself is stored
as drvdata inside the device, but without taking a reference as
this patch does, there is no guarantee that that pointer does not
point to possibly free-ed mem.

We could set drvdata to 0 from drm_sysfs_connector_remove()
Before calling device_unregister(connector->kdev) and then do
something like this inside drm_connector_find_by_fwnode():

/*
 * Lock the device to ensure we either see the drvdata == NULL
 * set by drm_sysfs_connector_remove(); or we block the removal
 * from continuing until we are done with the device.
 */
device_lock(dev);
connector = dev_get_drvdata(dev);
if (connector && connector->fwnode == fwnode) {
	drm_connector_get(connector);
	found = connector;
}
device_unlock(dev);

With the device_lock() synchronizing against the device_lock()
in device_unregister(connector->kdev). So that we either see
drvdata == NULL if we race with unregistering; or we get
a reference on the drm_connector obj before its ref-count can
drop to 0.

There might be places though where we call code take the device_lock
while holding a lock necessary for the drm_connector_get() , so
this approach might lead to an AB BA deadlock. As such I think
my original approach is better (also see below).

> Lookup tables holding full references tends to lead to all kinds of bad
> side effects.

The proposed reference is not part of a lookup list, it is a
reference from the kdev on the drm_connector object which gets
dropped as soon as the kdev's refcount hits 0, which normally
happens directly after drm_connector_unregister() has run.

In many other places in the kernel problems like this are
solved by embedding the device struct inside the containing
data struct (so the drm_connector struct) and using the
device_struct's refcounting for all refcounting and using
the device struct's release callback as the release callback for
the entire object.

That is not doable here since the drm_object code has its own
refcounting going on. What this patch is in essence doing is
simulating having only 1 refcount, by making sure the
main-object release callback does not get run until
the drm_objects' refcount and the device's refcount have
both reached 0 (by keeping the drm_object's refcount at
a minimum of 1 as long as there are references to the
device).

Regards,

Hans

