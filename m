Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40C0C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 11:37:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DBEA64F73
	for <platform-driver-x86@archiver.kernel.org>; Fri, 19 Mar 2021 11:37:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbhCSLgx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 19 Mar 2021 07:36:53 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:56675 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhCSLgK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Mar 2021 07:36:10 -0400
Received: from [192.168.1.155] ([95.114.29.199]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N6c0W-1lkpsh3zCw-0185kY; Fri, 19 Mar 2021 12:35:50 +0100
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Allow the FnLock LED to
 change state
To:     Nitin Joshi1 <njoshi1@lenovo.com>,
        Mark RH Pearson <markpearson@lenovo.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Esteve Varela Colominas <esteve.varela@gmail.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210315195823.23212-1-esteve.varela@gmail.com>
 <7fcaeb12-35b1-242a-dfd0-02324643c34b@redhat.com>
 <18ee74c0-85d9-6a1a-67f5-82682878001a@lenovo.com>
 <TY2PR03MB36456F1A3EFC9C31A865BF498C689@TY2PR03MB3645.apcprd03.prod.outlook.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
Message-ID: <a7d7b03b-1053-56ed-15eb-44910753e8e3@metux.net>
Date:   Fri, 19 Mar 2021 12:35:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <TY2PR03MB36456F1A3EFC9C31A865BF498C689@TY2PR03MB3645.apcprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cH4HBUtYztyQ+0CLgeeIMUjGixGMEmDd0gPyjOiSeZx0Suq8M84
 lkZpBhYPIvaF2xvlVlKJ4HGUK4rPLw8nLwuaxcDndp0ySN05Q6IUI+UFGF75I9BReO9enVk
 zi7ov3OoHoKEiOxnkxU4we5aXX62KF/wV6+nll4FbUJ25xNweUqbrG8JqPZ69jqziHO7pJx
 AMTz5+XhbiCrS+WwqE1ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a4pbUfFtTqY=:5nVhztB9wyc3HbapZ5MoJG
 Kg3TR7YOUUMK5Ix0F3n9Jd+SKPMTUbE8uMRs7XVxQdRHoskDCAz9TMCGejy86xDMgPl+vvaCQ
 cB6oLrWiPreDZ3KuAZI9ZpMsVgGLUUmlA5RKbPLQsE0JUskUx66qjLnCaohDs+frXq0atEijg
 uINdbw4CQQTBe6uVKyXT6zu8AdQH8jZ6ZCHCotHPsllRcoFobyjo8C176GLotPZgWopJX01W7
 rsAxiVUMyAMg/lSpOHErvb6L1/9BGpX4nbYJdHggMx1km6iLy6X15ySjDwNTIBXG21sGAsjFs
 ZDaE4PwgEml9oXsvdrxhTYfiC/wNgum/t0lxsGRKQHzq80vNlbPVBbqRXicygWaWOjXtpngnf
 syRhxz7JLLZODtjkcB8ADoJma9cmJmnPvk/+zsESh/ZXwy7PbTTomvva0KcnB
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 19.03.21 11:39, Nitin Joshi1 wrote:

Hi,

> Regarding "GMKS" method, it does not have "version" related information. So , its unlikely to impact any older platforms.
> However, I got it confirmed that definition of GMKS method itself doesn't include any workaround feature.
> 
> But, since its getter function , I also think its harmless and if it workaround some issue then I don’t see any concern.

How about publishing schematics / specs, so we can confirm what it's
really doing ?

In recent decades I've learn to mistrust vendor-provided firmware
(especially when it comes to acpi). The reason why I'm currently
bisecting AMD's AGESA blob, in order to completely replace it.

It's a tedious job, had to write my own analysis tool, but step
by step making progress. (and already learned they've been using a
pretty inefficient compiler that can't even inline trivial memcpy().
Probably some older msvc ... :p)

--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
