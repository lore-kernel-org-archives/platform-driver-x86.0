Return-Path: <SRS0=yw7w=DJ=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF04C4363D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Oct 2020 19:24:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 960F8206DB
	for <platform-driver-x86@archiver.kernel.org>; Fri,  2 Oct 2020 19:24:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VF4TqyXK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726215AbgJBTYu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 2 Oct 2020 15:24:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25203 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726224AbgJBTYu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Oct 2020 15:24:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601666688;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2fBN5eOMNBGk7qMMDmLX3n2uIw8lIyVgxRGr++CO1gA=;
        b=VF4TqyXKfSUoMNbe+EDGhgj8sVZqp9M1/+ToUpNdldKioCYouO0R/1J+gpOnMO5hPKu0Qc
        d/mv/V06MaTmoAxaiUzsBvwSbFGuYXTEYPAjFKbaS2rPurS1J8ZR1Kr2S+9QvtFs7i9h0h
        cW+YjO8byvJYTWAVllFVPrPoNhyYfCk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-ymKF88dHMWS9uh6L-lbh1A-1; Fri, 02 Oct 2020 15:24:46 -0400
X-MC-Unique: ymKF88dHMWS9uh6L-lbh1A-1
Received: by mail-ed1-f72.google.com with SMTP id f16so1089518edm.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2020 12:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2fBN5eOMNBGk7qMMDmLX3n2uIw8lIyVgxRGr++CO1gA=;
        b=dVhuSfRdZr+pD2HPx5Ri4/yW7RgECVxxBicMRuM9rmyMiV1IU/Opp0IuhHCWgus2M0
         W+XLrvjPxMcuOpvVMWgfMxYgmSpjD2s5QPHnVyEhnXK+3UwR1DWG2xCzTem1jQSmcrip
         g/SrOgvK/RLsZfblX9lPNz+CSAO1vWa57uc4Z/IqrOmyjhQuhgkTVJQWFQ3H28NwKmtJ
         o5rV2XJ5tjbg/aesCwZ2thfxeTmF325ggihWQZ+iQa2ocUf9AIEOB7megjtmtJL0SKYv
         EIIh6opBeiIG+wcSLfoRpTobpxD7oSR4DO59cw72TY7ybWvmLbZ8J25BTmUsmCULrnCd
         JAxQ==
X-Gm-Message-State: AOAM530D+6CRFdJH3kfq+1WS2/CDiqTM4uiHyN601OZsCjXq0hyX0CZ1
        sZqTYwDP6qk+Rh2xt6fD7WwHdE6ZIW6PskACB/bFBKMLYj/wR6hmDXN83shLFXvZkIzIJRP6ndC
        avioyLS3e9ByrjMXt8K4bFHnrYJwEQ2hs2g==
X-Received: by 2002:a17:906:95d1:: with SMTP id n17mr3949300ejy.324.1601666685303;
        Fri, 02 Oct 2020 12:24:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylFBvEYgb6mOXdaca4n0ID4sM8V01K59nI4wO8lpfnezjWsmCV85AiBfW8NmbSdogFk4TyJQ==
X-Received: by 2002:a17:906:95d1:: with SMTP id n17mr3949288ejy.324.1601666685108;
        Fri, 02 Oct 2020 12:24:45 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t23sm1876654edi.81.2020.10.02.12.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 12:24:44 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel-vbtn: Switch to an allow-list for
 SW_TABLET_MODE reporting
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Takashi Iwai <tiwai@suse.de>
References: <20200930131905.48924-1-hdegoede@redhat.com>
 <CAHp75VcoyvpvfpfpcNa_j4oTRQV2Cyue+RJ33AdYz+q8uyCFag@mail.gmail.com>
 <_GDJXv2BrCsSZ77bLZXvXW2bz0MslNNwgXGiPib5cvCYWleijYXNMnTikDp3Lj1IP6bcQES3tC243dn_h6teAe0_3OVVeOotRtS60MB4WD8=@protonmail.com>
 <CAHp75VdghsmeqtjvA6LqHxXQqvHcwm1ECjTvjDKe+3B8NrQKKQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <04afae47-dc2c-8a67-f34c-db4f3ec2d4bd@redhat.com>
Date:   Fri, 2 Oct 2020 21:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdghsmeqtjvA6LqHxXQqvHcwm1ECjTvjDKe+3B8NrQKKQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/2/20 5:07 PM, Andy Shevchenko wrote:
> On Fri, Oct 2, 2020 at 6:01 PM Barnabás Pőcze <pobrn@protonmail.com> wrote:
>>> I have reverted previous attempts and applied this one, but...
>>>
>>>> Fixes: cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Laptop" chasis-type")
>>>> BugLink: https://forum.manjaro.org/t/keyboard-and-touchpad-only-work-on-kernel-5-6/22668
>>>> BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1175599
>>>
>>>> Cc: Barnab1s PY1cze pobrn@protonmail.com
>>>
>>> ...seems like a broken name to me. I'll try to fix this.
> 
>> Yes, it is. :-(
>> Maybe I shouldn't have used accented characters, sorry. I thought UTF-8
>> was reasonably well-supported in 2020.
> 
> Sorry for that. I agree that UTF-8 must be supported well. I think
> Hans can check what happened and act accordingly.

Ugh, no idea what happened there, it is already broken in my
local git tree. IIRC just copy and pasted it out of thunderbird.
I just did that again and this time it is fine ...  Maybe I picked
the wrong email as source and it got mangled by some email system
on the way.

Anyways I've just send out a v2 with this fixed.

Regards,

Hans

