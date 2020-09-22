Return-Path: <SRS0=i/bP=C7=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEBAC2D0E2
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 10:43:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28C4C2073A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Sep 2020 10:43:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SIlhVJlI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgIVKn2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Sep 2020 06:43:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38783 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726423AbgIVKn2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Sep 2020 06:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600771405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tt12pKYR26UHqN23lWySPLAioUputovQDTrs/r1QFlE=;
        b=SIlhVJlINKwQPnpw4xiWGfcQKTlheEy05MHB2biF0FLGt8LYCMMLVufJyiyX6P2Jed/nFu
        2WnzyiF1o4C5AQnzWTTYSzef9dxE4qnYHPn32IBdJY3dd3NYeZdoIBZjSHcT1YycshXCZr
        fF494MRUvxs6yLGaOt7u/SE9+3bjlg4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-ErzRRiL6PzGRBtdS8r6Bjw-1; Tue, 22 Sep 2020 06:43:14 -0400
X-MC-Unique: ErzRRiL6PzGRBtdS8r6Bjw-1
Received: by mail-ej1-f71.google.com with SMTP id lx11so6066849ejb.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2020 03:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tt12pKYR26UHqN23lWySPLAioUputovQDTrs/r1QFlE=;
        b=hv4n3oF6Eu+tSQoefA0TRyeOq0B2e/aVy9z2dSMtp45Cxoepb6Zjq0dcbGFQlVOB9Z
         zPDv0tkudAx0GmeQhPgRyux2UXQv8PGzGquKEaXuY6kyUkMez+7oj7OPmBnsZj1EBFx4
         W9rFsmgHHRUGOZ4Ukw7e+XbVxMlxPXVnCxDi4g6Ezp8YlpF9BwFV/ehsZrWLY8D7qrTV
         veEmYpFHgyKl3gmyQl+CrHDKzsbgdbmdEqqdcSxUVDuAkcLW44BK70jv9ViHscip+4uY
         AUEwJM10e0YXskOz1wiX6cUdXzGNYZxkzhMnMT6U3sgl+RfgGLUfTvpWYnCxmuPHFu3C
         En+A==
X-Gm-Message-State: AOAM533S6FupVjsixoJQOA7MLdEf7sL4SuMTGOsTw6b/dWVTJ32QFljQ
        EwJ+gwZdlkk+9bwzcKvxiXr3rIB7GbqFMHU5wFALKVZaZ6FGLy613jKDHJ/oIKIcPrm71olBD9C
        T4uDg1OU6qNRhi4OKaFUk+4vSAAAjG0gvRw==
X-Received: by 2002:a50:c8cd:: with SMTP id k13mr3258885edh.387.1600771393405;
        Tue, 22 Sep 2020 03:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQYkSIaynM1eaOVtPvx2fl++OnihJ+y7ouxwqeqAYcM80QsNSmyNaEEq3fYGUSId3ulLsN/w==
X-Received: by 2002:a50:c8cd:: with SMTP id k13mr3258861edh.387.1600771393123;
        Tue, 22 Sep 2020 03:43:13 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q10sm11043651eja.107.2020.09.22.03.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 03:43:12 -0700 (PDT)
Subject: Re: [External] Re: RFC: offering a standardized (/sys/class)
 userspace API for selecting system/laptop performance-profiles
To:     Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Bastien Nocera <hadess@hadess.net>,
        Mark Pearson <mpearson@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>
Cc:     Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
 <3ed9ac0a-2e24-7d3a-f264-c3bb03b846d9@lenovo.com>
 <261328975238951d0412727220a1b7d915cebb99.camel@redhat.com>
 <9766663.nUPlyArG6x@pce>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <79735e10-6dfc-ffff-5b42-b78e19e24d9b@redhat.com>
Date:   Tue, 22 Sep 2020 12:43:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9766663.nUPlyArG6x@pce>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/20 11:03 AM, Elia Devito wrote:
> Hi all, sorry for response delay I'm very busy at work this period

No problem.

> A common interface is surely the best solution, especially because it allows
> to standardize the user-space tools and maybe to integrate its with desktop,
> like Bastien is doing with gnome-power-profiles-daemon or like the similar tool
> plasma-pstate.
> 
> I think we should keep separate performance and thermal profiles thus leaving
> the possibility of setting a thermal profile independently of the performance
> profile and vice versa.
> 
> Hp implements up to 4 thermal profiles (apparently the same ones that implement
> dell), my patch implements the first 3 profiles which are the ones supported by
> my hardware.
> 
> 1. HP Recommended -> fan stay off and start at low~medium speed when necessary
> 2. Performance    -> fan stay off and start at medium~hight speed when
> necessary
> 3. Cool           -> fan stay off and start at medium~hight speed when
> necessary
> 4. Quiet          -> fan should stay off and start at very low speed if
> necessary
> 
> for each profile the firmware set also a OEM variable to select DPTF profile
> with the adeguate power limit.
> 
> combining these profiles with the performance profiles it is possible to obtain
> the desired performance according to the needs of the moment
> 
> e.g.
> 
> For gaming purpose when the CPU and GPU share the thermal budget, in this case
> the best solution is to set thermal profile to performance to maximize the heat
> dissipation and the p-state profile to powersave, in this way during loadings
> the cpu gain a performance boost that allow to reduce loading time, instead,
> during gameplay the cpu performance will be limited in favor of the GPU
> allowing the maximum framerate to be reached.
> (feral had to handle it for its gamemode tool:
> https://github.com/FeralInteractive/gamemode/pull/179)
> 
> Another opposed particular case could be thermal profile set to quiet and
> p-state set to performance, usefull for example to maximizze cpu performance
> in silent ambient room like a library, obviously for CPU-only intesive tasks
> the best solution is to set either thermal and performance profile to
> performance.
> 
> Basically there are infinite combinations that can be made to obtain the best
> configuration for each situation, to allow this a common interface should offer
> a possibility to:
> 
> - Define the list of thermal profiles separately from the performance ones
> - Eventually define a list of on/off attributes (useful for lenovo lap_mode?)
> - Provide a description of them
> - Switching between thermal profiles regardless of the performance profile
> 
> A possible solution could be a "slider like" interface for performance level
> and a list of thermal profile.

So I have been thinking about this and performance level and thermal profile
are really inherently couple to each other. Telling the CPU it can use
25W TPD instead of the default 15W, without also ramping up the cooling is
just going to lead to a whole bunch of thermal throttling.

In a desktop machine with a discrete GPU it is sorta easy, in essence you have
a GPU performance profile, controlling GPU TPD/turbo behavior and the GPU
fans too match, and a CPU performance profile which likewise controls
the CPU fan profile too match the CPU performance profile.

With laptops with a discrete GPU things become harder because there is a
single shared cooling mechanism. But there you could simply say that
performance-profile = max(gpu-profile, cpu-profile).

I mean telling the GPU and CPU that they can burn a gazillion watts and
then telling the cooling setup to be as quiet as possible, is clearly
not going to end well.

This all assumes that we have some nice way to tell the hardware about
the 3 separate (gpu / cpu / cooling) profiles we want.

But that is not always the case; and often when using a CPU with
integrated GPU they are all tied together.

So my proposal is to have a :

/sys/class/performance-profile

Underneath we can have one or more entries (performance-profile providers)
each one with a performance_level file on the previously suggested 0-100 scale
and a performance_mappings file listing the supported discrete values on that
scale and some descriptions of those discrete values purely for informational
purposes.

Besides the performance_level and performance_mappings files I would also like
to add a "type" sysfs attribute, which can have 1 of 3 values:
"system", "cpu" and "gpu".

So something like the thinkpad_acpi performance levels will be "system", and
the intel_pstate driver could maybe also register itself here as a "cpu"
type performance-profile provider.

This will allow userspace (if / when it wants to) to do things like put the
CPU in medium/balanced mode while telling the GPU to go full-throttle for when
playing a game which is clearly GPU limited.

This game scenario of course assumes that we then actually will have a
performance-profile driver for both the CPU and the GPU.

Note I'm still just brainstorming here, but I think that having the
0-100 scale + the type thing should cover all the use-cases we want
to cover.

As always feedback or alternative API proposals are very much welcome.

Regards,

Hans

