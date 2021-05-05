Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 779B4C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 10:30:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3649F61222
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 10:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhEEKbQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 May 2021 06:31:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44123 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232580AbhEEKbQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 May 2021 06:31:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620210619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zE1dVKPK82uToYAi4Qlfa5L92Nao6h848ucJ6GBhOnM=;
        b=KxHvu/fU5J3fZsXCKCtkRbaFCeXVJhKZSWAm2otfdpdXjgsal1bFsfdlXiwxQpodLakqSI
        5piHr39ZXF+YOtZdHuBw5b2/C/Zfb2itpmytvbZw4HFcLRacCZXhYufxhUEBpl4jy5LGTg
        2rqmLYqMFGOywZz06jkGh92a2YfqJoE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-9GP9zKFPMO2HRUr6G_I23w-1; Wed, 05 May 2021 06:30:17 -0400
X-MC-Unique: 9GP9zKFPMO2HRUr6G_I23w-1
Received: by mail-ej1-f69.google.com with SMTP id zo1-20020a170906ff41b02903973107d7b5so276619ejb.21
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 May 2021 03:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zE1dVKPK82uToYAi4Qlfa5L92Nao6h848ucJ6GBhOnM=;
        b=bOlnNtUnuKsQi/mPuyB+e67JnlJixoYoHw6gO1UrqD1f9t1QsLfCE58ctJ/mf5yNTv
         JSAa/MfZ3VCq/Vgk8ysage8Hbl6Snp8rAC47RN7jqyXEav8WaxfT0NIEyrJccvsmGhvM
         O0aZHcE1veCMAUV9esPv0ER8bspU08O9xLVUlVZMy6RWWDEpVnusL/agQhyZgYUwV+rO
         m7eZF0Z7PwoSdBS7RLIwrn78OnBKZfPVn0c+e2IIFq52c7L6CKU4YT7gi/8z/sWXJ/Xq
         IxB2K6obOvBYtGbOqTIsP34NJvidGIy+7k3olFd9HW8M4SZ0kr6H2p8EckxMsgn6tMVA
         ekcQ==
X-Gm-Message-State: AOAM5300g73FuvXC4TTeBeofX068uloCpw/ap0Br7jsoMLphDszUOfHP
        mro7RwiJZedxytGaYVle4SlNJNvrWvz3nL1YZwr/MDnZd5JiaeJnQulhgcYrPuddbwkpK7dgcTC
        zAcJ8mJIAdw7XdgGWUuz+ASP7xwHOsIVtqg==
X-Received: by 2002:a17:906:3e42:: with SMTP id t2mr26203540eji.508.1620210616747;
        Wed, 05 May 2021 03:30:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwORVYcTi6Wi6NDO0GOpSEZ0NUK0+6R4wrD+Ub3k6LyrPH/SxZE8FmOv9YyY07/ujKwC3W5Vg==
X-Received: by 2002:a17:906:3e42:: with SMTP id t2mr26203515eji.508.1620210616512;
        Wed, 05 May 2021 03:30:16 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t20sm2658262ejc.61.2021.05.05.03.30.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 May 2021 03:30:16 -0700 (PDT)
Subject: Re: [PATCH 5/9] drm/i915: Associate ACPI connector nodes with
 connector entries
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 <ffb46bb6-3548-4ec2-f176-99f3674e7f6d@redhat.com>
 <CAHp75VcHEMaZ67yy7TD8f8Nk=+oiLT-vRCt9A6fT9K6LeR78Ew@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <adb9be8a-70c7-b515-48c3-7e372e5d8801@redhat.com>
Date:   Wed, 5 May 2021 12:30:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcHEMaZ67yy7TD8f8Nk=+oiLT-vRCt9A6fT9K6LeR78Ew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/5/21 12:02 PM, Andy Shevchenko wrote:
> On Wed, May 5, 2021 at 12:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 5/5/21 11:17 AM, Andy Shevchenko wrote:
>>> On Wed, May 5, 2021 at 12:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> On 5/4/21 9:52 AM, Andy Shevchenko wrote:
>>>>> On Monday, May 3, 2021, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
>>>
>>> ...
>>>
>>>>>     +               fwnode = device_get_next_child_node(kdev, fwnode);
>>>
>>>>> Who is dropping reference counting on fwnode ?
>>>>
>>>> We are dealing with ACPI fwnode-s here and those are not ref-counted, they
>>>> are embedded inside a struct acpi_device and their lifetime is tied to
>>>> that struct. They should probably still be ref-counted (with the count
>>>> never dropping to 0) so that the generic fwnode functions behave the same
>>>> anywhere but atm the ACPI nodes are not refcounted, see: acpi_get_next_subnode()
>>>> in drivers/acpi/property.c which is the get_next_child_node() implementation
>>>> for ACPI fwnode-s.
>>>
>>> Yes, ACPI currently is exceptional, but fwnode API is not.
>>> If you may guarantee that this case won't ever be outside of ACPI
>>
>> Yes I can guarantee that currently this code (which is for the i915
>> driver only) only deals with ACPI fwnodes.
>>
>>> and
>>> even though if ACPI won't ever gain a reference counting for fwnodes,
>>> we can leave it as is.
>>
>> Would it not be better to add fake ref-counting to the ACPI fwnode
>> next_child_node() op though. I believe just getting a reference
>> on the return value there should work fine; and then all fwnode
>> implementations would be consistent ?
> 
> But it's already there by absent put/get callbacks.

Ah, I completely missed that the put/get-s are actually done
through function pointers in fwnode_operations. I assumed that there
was a kref embedded inside the fwnode_handle struct and that they
operated directly on that.

So this whole discussion is entirely based on that misunderstanding,
my bad, sorry.

So yes you are right, things are already consistent thanks to the
absent put/get callbacks.

But we do really need to document the behavior better here
in the kdoc for fwnode_get_next_child_node() and
device_get_next_child_node().

of_get_next_child has this bit, which applies to those too:

 *      Returns a node pointer with refcount incremented, use of_node_put() on
 *      it when done. Returns NULL when prev is the last child. Decrements the
 *      refcount of prev.

I'll prepare a patch to add this to the kdoc for fwnode_get_next_child_node()
and device_get_next_child_node() once I'm done with readying v3 of this series.

Regards,

Hans

