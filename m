Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD951C4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 11:45:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4BB36054F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Aug 2021 11:45:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235525AbhHWLqi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Aug 2021 07:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52391 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235337AbhHWLqg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Aug 2021 07:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629719153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=14znBkLtAjiyi6UaHmrKrHuYMVExy7PDUZAMCT69QdI=;
        b=GPjJQRazYQJD5+3FqLO2TKgjLnyKBiYEBCV+8ymdhumxc5L0WJRKi8Cltvv3gBggrEAcaY
        +ahskoeaCf9DbsbTChnahpSDOf69dtoxm7oKOeT6JzK3elAxDUBdbg9LDUjt50lOWf6Q/r
        sIFjGwb+W6BD8nxRBNPmBhtSADXUCDE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-ffkcdfi4NCOXyhcXRWH2FQ-1; Mon, 23 Aug 2021 07:45:52 -0400
X-MC-Unique: ffkcdfi4NCOXyhcXRWH2FQ-1
Received: by mail-ed1-f71.google.com with SMTP id di3-20020a056402318300b003bebf0828a2so8675080edb.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Aug 2021 04:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=14znBkLtAjiyi6UaHmrKrHuYMVExy7PDUZAMCT69QdI=;
        b=DNm/5/xBJt5C2Eqf5+Nrn6YyOe+mOTfNE9wzC3AIpCm5z8dnd+jFGZc9px6c8AWOjm
         j73SeYSPK0xpedFCW+xqm3wf06uGhVjg3rUjSuunhi8R+ZTVgpIzUcSGuBnlsRk5laA4
         4kAtGuNNyy4bFjPJAOwApil9HR9xAPVeTfhP/ts1rDqCCF4537sbi4eCa74RogUx1TPm
         w6Q/K6btWaRdZRHuYqeNroAp4CEopvzxfk8rLT8yN6HhM/VEGzZ5apS9MKn4W4/yHoK9
         PMADhpnz1HwxyV6hQf9jDMGK7S+mwkLvRQi/AomiL2DCfqOMOYj0DRTVpcVZFoqO2C15
         sbRw==
X-Gm-Message-State: AOAM532+Ph/aoOj9IAIqnGBmflNqdg/1UP37IC7MyvXlq/dK3o9UaAvP
        PoV2W7LUXY58Cn3nfKeKCruqrCr/yZz7dnIrUAoEP4LfQgZuaufEMml4x9J+tvyn4/3g4c+R75i
        kZoNXbd1XBVEvOQTWlHff14WybCMEzYuPC0de0iUDCXXElehM0tdVQJVipReF4OpjLt+O31GdZB
        aMea85oBlIKQ==
X-Received: by 2002:a50:fc8e:: with SMTP id f14mr37126024edq.349.1629719150877;
        Mon, 23 Aug 2021 04:45:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhyEZxyMYKl8tc+0N3VjfxSymLLOruRlc0AMYWB54fymq73eFwc5jIvuPYS7NizC/7n4S8Fw==
X-Received: by 2002:a50:fc8e:: with SMTP id f14mr37125998edq.349.1629719150635;
        Mon, 23 Aug 2021 04:45:50 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id m15sm9261459eds.92.2021.08.23.04.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Aug 2021 04:45:50 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] asus-wmi: Add support for custom fan curves
To:     Luke Jones <luke@ljones.dev>, Bastien Nocera <hadess@hadess.net>
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20210820095726.14131-1-luke@ljones.dev>
 <20210820095726.14131-2-luke@ljones.dev>
 <321afe1a293be3a623a9be53feea3a008e044b31.camel@hadess.net>
 <L0W4YQ.ZVWQDLFJE8NR2@ljones.dev>
 <e7fbcf85f61b5c727a93df07b3bfe1624547067f.camel@hadess.net>
 <c19dfdde11754c234ca8a45c4af2187699498ee8.camel@hadess.net>
 <U8X4YQ.79I8GZJ1LDW02@ljones.dev>
 <b20a879dce98f27dfc68b86aaf486be9e623eacf.camel@hadess.net>
 <1EQ5YQ.6O8MNIPTU6V4@ljones.dev>
 <7a8a8d56c4e6addfc41b5dd5262968bd169f538f.camel@hadess.net>
 <GGIAYQ.PS5EB67PH64N@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <65260602-a1f4-fc8a-a823-ca5a6e4fca60@redhat.com>
Date:   Mon, 23 Aug 2021 13:45:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <GGIAYQ.PS5EB67PH64N@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/23/21 1:26 PM, Luke Jones wrote:
> 
> 
> On Mon, Aug 23 2021 at 12:28:21 +0200, Bastien Nocera <hadess@hadess.net> wrote:
>> On Sat, 2021-08-21 at 09:30 +1200, Luke Jones wrote:
>>>
>>>
>>>  On Fri, Aug 20 2021 at 13:39:02 +0200, Bastien Nocera
>>>  <hadess@hadess.net> wrote:
>>>  > On Fri, 2021-08-20 at 23:00 +1200, Luke Jones wrote:
>>>  > >
>>>  > >
>>>  > >  On Fri, Aug 20 2021 at 12:51:08 +0200, Bastien Nocera
>>>  > >  <hadess@hadess.net> wrote:
>>>  > >  > On Fri, 2021-08-20 at 12:43 +0200, Bastien Nocera wrote:
>>>  > >  > >  On Fri, 2021-08-20 at 22:33 +1200, Luke Jones wrote:
>>>  > >  > >  > > Am I going to get bug reports from Asus users that will
>>>  > >  > > complain
>>>  > >  > >  > > that
>>>  > >  > >  > > power-profiles-daemon doesn't work correctly, where I
>>>  > > will
>>>  > >  > > have
>>>  > >  > >  > > to
>>>  > >  > >  > > wearily ask if they're using an Asus Rog laptop?
>>>  > >  > >  >
>>>  > >  > >  > No. Definitely not. The changes to fan curves per-profile
>>>  > > need
>>>  > >  > > to
>>>  > >  > >  > be
>>>  > >  > >  > explicitly enabled and set. So a new user will be unaware
>>>  > > that
>>>  > >  > > this
>>>  > >  > >  > control exists (until they look for it) and their laptop
>>>  > > will
>>>  > >  > >  > behave
>>>  > >  > >  > exactly as default.
>>>  > >  > >
>>>  > >  > >  "The user will need to change the fan curves manually so
>>>  > > will
>>>  > >  > >  definitely remember to mention it in bug reports" is a very
>>>  > >  > > different
>>>  > >  > >  thing to "the user can't change the fan curves to be
>>>  > > nonsensical
>>>  > >  > > and
>>>  > >  > >  mean opposite things".
>>>  > >  > >
>>>  > >  > >  I can assure you that I will eventually get bug reports
>>>  > > from
>>>  > >  > > "power
>>>  > >  > >  users" who break their setup and wonder why things don't
>>>  > > work
>>>  > >  > >  properly,
>>>  > >  > >  without ever mentioning the changes they made changes to
>>>  > > the
>>>  > > fan
>>>  > >  > >  curves, or anything else they might have changed.
>>>  > >  >
>>>  > >  > A way to taint the settings that power-profiles-daemon could
>>>  > > catch
>>>  > >  > would be fine by me. I absolutely don't want to have to
>>>  > > support
>>>  > >  > somebody's tweaks until they undo them.
>>>  > >
>>>  > >  Definitely understood. Do you have something in mind?
>>>  >
>>>  > A sysfs attribute with boolean data that shows whether custom fan
>>>  > curves are used would be enough.
>>>
>>>  The path /sys/devices/platform/asus-nb-wmi/active_fan_curve_profiles
>>>  should be usable like this? I added this as the method for
>>>  controlling
>>>  which fan curves for which profiles are active.
>>>
>>>  If empty, then no custom fan curves are active at all. If it contains
>>>  any combination of strings "quiet, balanced, performance" then those
>>>  associated (named) platform_profiles have an active fan curve and you
>>>  can throw up a general warning, maybe add the contents of that file
>>>  too?
>>
>> That works for me, although I would probably have preferred a way that
>> wasn't specific to the asus-wmi module, I'm sure I can made do with
>> that.
> 
> Oh I see, you were looking to get a more general solution implemented? Maybe something like "/sys/devices/platform/asus-nb-wmi/platform_profile_tainted"? This could be an opportunity to maybe make a standardised naming scheme for it.

That would standardize the name, but not the location (path to the name);
so I'm not sure how helpful that would be. I think that for now
going with /sys/devices/platform/asus-nb-wmi/active_fan_curve_profiles is fine
and if we hit the same situation with a 2nd driver then maybe do
something under the /sys/firmware/acpi/platform_profile* namespace.

Maybe something like:

/sys/firmware/acpi/platform_profile_flags or something which can
communicate a bunch of 0 (keyword not present) / 1 values
by containing a list of space separated keywords like:
"custom-fan-profiles", where "custom-fan-profiles" would only
show up when they are activated ?

Regards,

Hans



