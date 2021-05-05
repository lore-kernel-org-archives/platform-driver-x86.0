Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88B9C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 09:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97683613F0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 09:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhEEJ3I (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 05:29:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25110 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232160AbhEEJ3H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 05:29:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620206891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X7xKwX6v4PMm4/k0xFSWl0nT4DfqJdoqHqiM6H5M1x4=;
        b=diSH/OkgBjMO3p9091c6s7QYOjpbyh+xCK72AqWwTqUKOauu8VhKn41Xdlf+1mRrFrz5CY
        qFeix+pouFdPTrKJIWjAj1dJxS6mDYXSp3qOOvQTQY9perpVG41JImDMR8BsYHmUzAY2Sj
        Cepy6KvMVi5aAN8GgeA+9PZljKkgckM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-k9FZhnK-N9aKJg6c1_pZSw-1; Wed, 05 May 2021 05:28:09 -0400
X-MC-Unique: k9FZhnK-N9aKJg6c1_pZSw-1
Received: by mail-ed1-f70.google.com with SMTP id d18-20020aa7d6920000b0290388b4c7ee24so555961edr.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 May 2021 02:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X7xKwX6v4PMm4/k0xFSWl0nT4DfqJdoqHqiM6H5M1x4=;
        b=T9Bi30kaand2NOCSne7jRirNoisjwfUys1Wb4hBbP571ugRgZHq76Wjn0EkzIVWah9
         w10LC0kiXKi5Qb4upNbh86pC778UCZEFxuK7pXnDFfgm7XajORHnTyXt9gvUa80AY5Op
         /GciTHlwDwRJkfgCo0YnSMqDWuZGkkFDyqWvVp0aHyKb/WqH1CkiXkdmHYMEuf3+0pNe
         HGZXbnwKw/B7KW81jX3e0w2V//ZfxaS0eg3CzmrzQdjNEfGyPV/tUhgkkFyKhTP0wkBK
         ++Sm7OBMMa3ltY2h7XWQsuuQ5oHku/p4DJ9TjMi6x8mxLnkhPCFC+MyCr/YGLm6l8Ody
         nYYQ==
X-Gm-Message-State: AOAM5325nvPaAoAZy+R9Zal1yIBnlcAmielrmJNqT8ir6dR9uWre65wl
        MWPwf6QNzZb1NyYXb2R5BDDFkb5DXIXrblUT4U/vSbWpKByAzCI/cCo0/E3Y1ue7Tyyta+XDVy9
        Cgnhr3RAoONohR5TZkeegL4Vt93DPuSBw3Q==
X-Received: by 2002:a50:eb0d:: with SMTP id y13mr30642591edp.326.1620206887880;
        Wed, 05 May 2021 02:28:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL8R18B7f6TGeGdHnyj4jzSTwnOyOMPSZu8SztxEcW3w1BfHZ6h5V+WGLd4L2A7kUFD3DMpQ==
X-Received: by 2002:a50:eb0d:: with SMTP id y13mr30642572edp.326.1620206887660;
        Wed, 05 May 2021 02:28:07 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u1sm15344385edv.90.2021.05.05.02.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 02:28:07 -0700 (PDT)
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20210503154647.142551-1-hdegoede@redhat.com>
 <20210503154647.142551-6-hdegoede@redhat.com>
 <CAHp75VcS5nvzBzjbSytqD6qsSURyzdEdmDi934y=5W2SCNyo9A@mail.gmail.com>
 <ee230261-423d-0e2f-16b0-852d264afa2b@redhat.com>
 <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ffb46bb6-3548-4ec2-f176-99f3674e7f6d@redhat.com>
Date:   Wed, 5 May 2021 11:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcfkcaVAu2-8-5he7PN=W_tRHiHAgXYn04gRnLehDVsyQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/5/21 11:17 AM, Andy Shevchenko wrote:
> On Wed, May 5, 2021 at 12:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 5/4/21 9:52 AM, Andy Shevchenko wrote:
>>> On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
> ...
> 
>>>     +               fwnode = device_get_next_child_node(kdev, fwnode);
> 
>>> Who is dropping reference counting on fwnode ?
>>
>> We are dealing with ACPI fwnode-s here and those are not ref-counted, they
>> are embedded inside a struct acpi_device and their lifetime is tied to
>> that struct. They should probably still be ref-counted (with the count
>> never dropping to 0) so that the generic fwnode functions behave the same
>> anywhere but atm the ACPI nodes are not refcounted, see: acpi_get_next_subnode()
>> in drivers/acpi/property.c which is the get_next_child_node() implementation
>> for ACPI fwnode-s.
> 
> Yes, ACPI currently is exceptional, but fwnode API is not.
> If you may guarantee that this case won't ever be outside of ACPI

Yes I can guarantee that currently this code (which is for the i915
driver only) only deals with ACPI fwnodes.

> and
> even though if ACPI won't ever gain a reference counting for fwnodes,
> we can leave it as is.

Would it not be better to add fake ref-counting to the ACPI fwnode
next_child_node() op though. I believe just getting a reference
on the return value there should work fine; and then all fwnode
implementations would be consistent ?

(note I did not check that the of and swnode code do return
a reference but I would assume so).

>>> I’m in the middle of a pile of fixes for fwnode refcounting when for_each_child or get_next_child is used. So, please double check you drop a reference.
>>
>> The kdoc comments on device_get_next_child_node() / fwnode_get_next_child_node()
>> do not mention anything about these functions returning a reference.
> 
> It's possible. I dunno if it had to be done earlier. Sakari?
> 
>> So I think we need to first make up our mind here how we want this all to
>> work and then fix the actual implementation and docs before fixing callers.
> 
> We have already issues, so I prefer not to wait for a documentation
> update, because for old kernels it will still be an issue.

I wonder if we really have issues though, in practice fwnodes are
generated from an devicetree or ACPI tables (or by platform codes
adding swnodes) and then these pretty much stick around for ever.

IOW the initial refcount of 1 is never dropped at least for of-nodes
and ACPI nodes.  I know there are some exceptions like device-tree
overlays which I guess may also be dynamically removed again, but those
exceptions are not widely used.

And if we forget to drop a reference in the worst case we have a small
non-re-occuring (so not growing) memleak. Where as if we start adding
put() calls everywhere we may end up freeing things which are still
in use; or dropping refcounts below 0 triggering WARNs in various
places (IIRC).

So it seems the cure is potentially worse then the disease in this
case.

So if you want to work on this, then IMHO it would be best to first make
sure that all the fwnode implementations behave in the same way wrt
ref-counting, before adding the missing put() calls in various
places.

And once the behavior is consistent then we can also document this
properly making it easier for other people to do the right thing
when using these functions.

Regards,

Hans

