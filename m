Return-Path: <SRS0=i/bP=C7=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A9DC2D0E2
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 09:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF64D20715
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 09:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g3u7mylb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIVJCf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Sep 2020 05:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52588 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726353AbgIVJCf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Sep 2020 05:02:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600765352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dzkLaWo/xyw4LcSvIgywgKEYti8KlfLpx60weJM3/RQ=;
        b=g3u7mylbEMoDL9SLIcGiIW5TDQk8INF+aBxrHaQOdG65Pcw87EmZVrB1BaES+PQcsyiTJy
        ZzAsfBOQuYiRVyIUMa1w8OpYzGlcohuSlR9JqE/bds/AVls4NzI+YRM6dlfVL/6ZJmbGN8
        0HhhG/JVLoqPaIAY0VGZuq6GuimmuNM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-TTLdXWp-NC-VpuY5FKe3rw-1; Tue, 22 Sep 2020 05:02:31 -0400
X-MC-Unique: TTLdXWp-NC-VpuY5FKe3rw-1
Received: by mail-ej1-f70.google.com with SMTP id md9so5955784ejb.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2020 02:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dzkLaWo/xyw4LcSvIgywgKEYti8KlfLpx60weJM3/RQ=;
        b=SVyO858Qpm7xpTnGmPti0DsYYfp3a8AHEoK4UEVdoo15vc4I4s9jUwQSWOVxJHZ5wY
         3tfKuMHuG469j61xW5oYhxfzcQ82e0APnSCg4dUo0CgVC/8vQJfhZH4O6a/kU8YSCUDl
         YE7A4iqcdYQIrjtFRL6f8/3VAaiyrmhZB+eyDc2AgEBfiCGHfzPtp6FBSGKnLo2rZ1pX
         Dy3xbvya2j2m1C819ASyKChOZJJ03AHaJMRTotmwoPPXFqwZpV19Mwl5zkhenUEFK1Ik
         aSihaviZ0Ojm6nXEs/gYeqfYj62X3IegO/D48VVXv+cXXEQaj7c+5BS8VM/xCMlj3S36
         lECA==
X-Gm-Message-State: AOAM5310qA8F5ceWfUhynRTfJBquWYekMdO+0SfmuyKwwEKrFD+Uo4x6
        KaAJrPCHjnjrR5ZUr3CFQEajMJcV0DgvPTUjxoogVQw6/nq609sBt4Ha9OP50UKAeXRMXraYzGH
        aXPdS37zNZrCDURsIwtK6uEGcfJeIIVt1fQ==
X-Received: by 2002:a05:6402:1819:: with SMTP id g25mr2769587edy.292.1600765348508;
        Tue, 22 Sep 2020 02:02:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvEjLM2FKJLNuWfIEyBTNs48Cv92gS6hXgUVKhvYE34EXPjbHv315cFv9KDkZxXQj7t5D/aQ==
X-Received: by 2002:a05:6402:1819:: with SMTP id g25mr2769558edy.292.1600765348162;
        Tue, 22 Sep 2020 02:02:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q17sm10793786ejd.90.2020.09.22.02.02.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 02:02:27 -0700 (PDT)
Subject: Re: [PATCH] Introduce support for Systems Management Driver over WMI
 for Dell Systems
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>,
        Richard Hughes <rhughes@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>
References: <20200730143122.10237-1-divya_bharathi@dell.com>
 <d3de1d27-25ac-be43-54d8-dcbfffa31e1d@redhat.com>
 <DM6PR19MB26364970D0981212E811E1B0FA2E0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <67ca316a-227f-80f6-ad22-7d08112b2584@redhat.com>
 <DM6PR19MB26368BB2B8C4D7CE58DF7C31FA230@DM6PR19MB2636.namprd19.prod.outlook.com>
 <5847917c-2c34-5d74-b5db-f33bb8fc9e13@redhat.com>
 <DM6PR19MB2636626A94385EDC7C0CACF9FA3E0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <33666ec6-be47-2c33-d4c5-6b23b53f6185@redhat.com>
 <DM6PR19MB263615C1060108E5661AE615FA3A0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a8bf92ca-641a-3006-9876-d57ffa47ecb5@redhat.com>
Date:   Tue, 22 Sep 2020 11:02:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB263615C1060108E5661AE615FA3A0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/20 5:26 PM, Limonciello, Mario wrote:
>>
>> Well if different schemes are supported and each scheme has its own type,
>> then I would expect there to be say / e.g.:
>>
>> /sys/class/firmware-attributes/dell/authentication/admin-password
>> (with a type of "password") and:
>> /sys/class/firmware-attributes/dell/authentication/admin-hotp
>> (with a type of "hotp")
>>
>> And then the user / userspace can choose which one to use,
>> I guess if the kernel knows that only hotp has been setup and
>> there is no standard password set, then it could hide the
>> /sys/class/firmware-attributes/dell/authentication/admin-password
>> password.
> 
> So you're proposing the flow to userspace that would look like this:
> 
> Authentication is off
> ----
> # cat /sys/class/firmware-attributes/dell-wmi-sysman/attributes/Touchscreen/is_authentication_needed
> 0
> # echo "enabled" | sud tee /sys/class/firmware-attributes/dell-wmi-sysman/attributes/Touchscreen/current_value
> 
> 
> 
> Turning on and things that happen using authentication (error examples too):
> ----
> # cat /sys/class/firmware-attributes/dell-wmi-sysman/attributes/Touchscreen/is_authentication_needed
> 0
> # echo "foobar123" | sudo tee /sys/class/firmware-attributes/dell-wmi-sysman/authentication/Admin/new_password
> # cat /sys/class/firmware-attributes/dell-wmi-sysman/attributes/Touchscreen/is_authentication_needed
> 1
> # echo "enabled" | sud tee /sys/class/firmware-attributes/dell-wmi-sysman/attributes/Touchscreen/current_value
> -EOPNOTSUPP

Why would this be -EOPNOTSUPP and not just -EACCESS too ? To in the end both are access denials,
no password being set is really just a variant of the wrong password being set.

> # echo "foobar456" | sudo tee /sys/class/firmware-attributes/dell-wmi-sysman/authentication/Admin/current_password
> # echo "enabled" | sud tee /sys/class/firmware-attributes/dell-wmi-sysman/attributes/Touchscreen/current_value
> -EACCES
> # echo "foobar123" | sudo tee /sys/class/firmware-attributes/dell-wmi-sysman/authentication/Admin/current_password
> # echo "enabled" | sud tee /sys/class/firmware-attributes/dell-wmi-sysman/attributes/Touchscreen/current_value
> # echo "" | sudo tee /sys/class/firmware-attributes/dell-wmi-sysman/authentication/Admin/current_password
> # echo "enabled" | sud tee /sys/class/firmware-attributes/dell-wmi-sysman/attributes/Touchscreen/current_value
> -EOPNOTSUPP
> 
> 
>>
>> TBH I think all these things are (mostly) easily solvable if/when we
>> encounter them. I mean it is definitely good to keep these kind of things
>> in mind. But at some point we might get lost in all the what-ifs we
>> can come up with.
> 
> In trying to come up with a generic interface that scales to everyone's needs
> the what-ifs are critical.  Making assumptions on how authentication works means
> future authentication mechanisms will be painful.

The way I see it the authentication mechanism and the ABI for actually
changing the settings are pretty much orthogonal. So we can add new
authentication mechanisms without that impacting the
ABI for actually changing the settings.

>> If a vendor comes along where authentication is not necessary
>> for *all* attributes, then we could add the "is_authentication_required"
>> as an optional sysfs-attribute for the firmware-attributes and state
>> in the documentation that if that file is lacking that means that
>> authentication is always required. That way the Dell code would not
>> even have to have the "is_authentication_required" sysfs-attribute.
> 
> But it's not true on Dell's systems even right now.  If you don't have
> an Admin password configured then you don't need it set for any attribute.
> If you do have one set you need them for all.  And if you need to know to look for
> /sys/class/firmware-attributes/dell-wmi-sysman/authentication/Admin/is_password_set
> then userspace needs to know to do this differently for Dell and someone else.

You are mixing up authentication and authorization here.

I guess that you are arguing for is an is_authorization_required
attribute, which can return "none" and "admin" (for now).

When no Admin password is set, everyone automatically get admin
level authority and in the Dell case (for now) all firmware-attributes
require admin authorization.

Looking at it this way has the advantage that for the current Dell
scenario the is_authorization_required sysfs-attribute would simply
always return admin.

Which is why I argued that we could omit it for now and add it as
an optional attribute, defaulting to admin when not present, later.

But if you want to we can certainly add it now and have it present
from the get go.

> So you either need to have a top level is_authentication_required
> IE /sys/class/firmware-attributes/dell-wmi-sysman/is_authentication_required
> 
> Or a per attribute one
> IE /sys/class/firmware-attributes/dell-wmi-sysman/attributes/Touchscreen/is_authentication_required

This obviously needs to be a per firmware-attribute setting, because in
the future and/or with other vendors different attributes may require
different levels of authorization.

> And this decision can't be put off because it has an implication that another
> vendor may choose to do their authentication differently than Dell.
> 
>>
>> Since we also seem to have some trouble to get these 2 properly documented
>> (I have not looked at v3 yet), I'm fine with making them dell specific by
>> prefixing them
>> with dell-. I guess that that probably even makes sense.
> 
> They're documented in v3.  The moment that you have a "Dell specific" attribute
> what's the point of a common class?  You're going to end up with Dell expresses
> dependencies this way, Lenovo expresses them that way, and HP expresses them some
> other way and userspace is going to have to sort out the differences.
> 
> So in userspace you end up with logic that is something like this:
> 1) (Generic) Check if authentication is set
> 2) (Dell) Check if you're running on Dell's driver, interpret this dependency or show a message
> 3) (Lenovo) Check if you're running on Lenovo's driver, interpret this dependency or show a message
> 4) (HP) Check if you're running on HP's driver, interpret this dependency or show a message
> 5) (Generic) Check what authentication schemes are supported
> 6) (Dell) Apply Dell's admin password authentication scheme
> 7) (Lenovo Example) Apply Lenovo's admin password authentication scheme or their TOTP authentication scheme
> 8) (Generic) write value into current_value
> 9) (Generic) Disable authentication
> 
> So if userspace is going to have to be different anyway for evaluating dependencies and authentication, why
> go through the trouble to fit everyone into the same class?

Parsing the dependencies is not required for a functional userspace
application. As I explicitly stated in my previous email in many
existing builtin firmware setup UIs the dependencies are not even
shown. As for the authentication for now having a straight forward
admin + system/boot level passwords covers like 99% of the
existing use-cases.  There is no need for separate Dell / Lenovo
admin password schemes as you list above those will work identically
from the sysfs interface pov.

So having a common class interface will allow userspace apps which
work with 99% of the systems currently out there (assuming they ever get
a driver implementing the class).

<snip>

>> Specifying what changing the attributes actually does
>> falls
>> (way) outside of the scope of the sysfs ABI IMHO. That will always be the case
>> of please consult your Laptop's / Workstation's / Server's manual.
>> That is actually not much different from the current builtin
>> firmware setup utility experience where the help text is often,
>> well, not helpful.
>>
>> For all I care there is an enum called "HWvirt" with a description of
>> "Hardware virtualization support" and values of "Enabled" and "Disabled"
>> which controls something somewhat or even totally different from what the
>> name and description suggest. That would be less then ideal, but not a problem
>> from the pov of the sysfs ABI for firmware-attributes. It would be a simple
>> case of the garbage in garbage out principle.
>>
>> So this is one problem which I'm happy to punt to userspace and I guess Dell
>> might do a Dell specific utility, which only works one certain model Dell's,
>> which is a lot fancier then the basic sysfs functionality and e.g. consumes
>> the dell-value_modifier and dell-modifier sysfs-attribures.
> 
> The goal here is that all of the functionality that would otherwise be expressed
> in a proprietary utility could also be expressed in sysfs.  Having to de-feature
> the sysfs interface for the purpose of fitting into what's generic across vendors
> defeats that goal and is why I think it should be a Dell interface in the first
> place.

I have not asked you to de-feature the sysfs interface anywhere in this thread!

Regards,

Hans

