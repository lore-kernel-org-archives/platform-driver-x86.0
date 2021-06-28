Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEA8C2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 16:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C204E61992
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 16:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231878AbhF1QnY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 12:43:24 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36479 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbhF1QnY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 12:43:24 -0400
Received: from [192.168.1.155] ([77.9.21.236]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MYeV1-1lkrNt2oiJ-00VdTA; Mon, 28 Jun 2021 18:40:46 +0200
Subject: Re: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Shravan, S" <s.shravan@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
References: <20210428032224.8299-1-s.shravan@intel.com>
 <CAHp75Vfq6B0=q0dsQPTP_A8sdPh9tepBooa7cW=KJYX78ekWtw@mail.gmail.com>
 <MWHPR11MB1455D055108F1DBEA6EB9285E3319@MWHPR11MB1455.namprd11.prod.outlook.com>
 <c7c3d395-826b-fc34-b396-a9c7631d981b@metux.net>
 <CAHp75VdLhxv4PqRznZGXQiWtdM7Ssx29xDkH4BaZ_DmHWa=-Nw@mail.gmail.com>
 <MWHPR11MB145562EBE171DD3B40595DD0E3089@MWHPR11MB1455.namprd11.prod.outlook.com>
 <c76d3ae7-a7fb-e766-d71c-c929cfde969c@metux.net>
 <CAHp75Ve8vMhJ6RxOg1XJaOaDgEBSkaamr2S_34zn21=AJvOsZA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <aaf49f09-264b-1dab-b297-9b06733a5ab7@metux.net>
Date:   Mon, 28 Jun 2021 18:40:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve8vMhJ6RxOg1XJaOaDgEBSkaamr2S_34zn21=AJvOsZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HHeAhvm9eVunKnnGYKujW24NcxfnvY49/g/2/gaUjBi4s14dosk
 bX8xB51ysWa8ikSmg76FToKXX+H2jfV5RlTK10jXz8xBMLtPPwL99y7luMlGY8Mwo0cU47W
 9WBaeBB6Kam4BEmzfEX7YdGFCh9tAGvLbKUaGEqSb3p+nP52cAAwsgwrut3392+I9vQykRX
 kdVNC9h/41Sn6J0hVnWng==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o/4RM3qKemo=:9vFvlBPEIAROVqEtXrSNkl
 YzaoBD88o1zRVo3Kn3jjC3jeBXo6svIo/437yZp37HkTx8jI+QzPUkRvv20jkO/b0yqq0q7mY
 S7/j09/xONZV+UAxZAjEVGhKNZ4SruLzavAUs2iQt3AnqF7OvXqkVAj59R4VbkiGM9taXalvY
 C9WUvAyGpys/hTPDcXJItgcBiogcGs4jGGMT10yuMUPGZFF3PgKXzVMQOUmZ6Thisceb+2v48
 VEN3hKVkFKC2z5v73zXGrb5cKF/DkaUzY7dhxsH8qRJ2SK5RVM18oK++WiHwJjQAb5Q6Jdfc4
 dXl+IXTlRaRQPZ3naXJEHCvW4nrI3Yal+FWeBhwnHgEomiUebPOWdUmfSQfSAL79zg1souA2f
 mty84JeUXIMnOpwIVPpL69gCoA14HmjA3CQpV6NqwdfGa1R11HYD+7Z7cZnyb1omUf1AY/4gP
 RiqQZUrvo7Bayw7i1lSw6ThdhmJVn8d/FZu5qQ//30XaWSsRixX1P0mu9tYfZJY9XSlXD6nBJ
 E7VAoMe0++srs8ROIg5hkE=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 28.06.21 17:04, Andy Shevchenko wrote:

> But this is not the issue of ACPI, right? Maybe you should stream the
> energy to complain and file bugs against vendors who do not know how
> to cook ACPI?

It's an issue of the acpi ecosystem. Mostly the fault of individual hw
vendors that invent weird ways to abuse it for things it never had been
designed. We're here talking with some (representative of some) hw
vendor.

By the way: this actually isn't an issue of these specific intel modems
at all, but the mainboards where some of these could plugged into. At
that point I wonder why we don't hear a word from these guys, it would
be their duty.

> Isn't it applicable to all firmwares? Have you tried to avoid wireless
> firmwares (rhetorical question)? 

It depends. Firmware for external controllers (which is loaded by the
kernel) is an entirely different area. I wish we wouldn't need to care
about it, but it's better us doing that of board or bios vendors,
and we have reasonabley well methods to cope with it.

> My point is that we have to live with
> that fortunately or unfortunately.

It seems that the whole thing is still under development (even sounds
like for now only one company using it in their closed devices), so we
might still have the chance to prevent another nightmare.

>> (I need to hold back myself for not starting another rant against ACPI
>> and bios vendors :p)
> 
> As I said, look into the root cause, while I admit that the ACPI spec
> is easy to abuse / misinterpret (in some cases).

Yes, and it's used for things it wasn't designed for. Actually, I claim
it was a bad idea in the first place - device tree already has been
there and the superior solution when acpi brought upon us. And even
after that, there way plenty time to introduce a hybrid solution to add
in device tree and leave the old acpi stuff as legacy. This actually
would have been pretty easy to do so.

Yes, ACPI received several useful improvements over the time, but still
very incomplete (anything but well thought), and ... voila ... it's even
embedding pieces of device tree, so it becomes somewhat more useful.
(but still in quite weird ways). At that point I really wonder why we're
not directly using DT ?

One of the major problems at this point is board vendors treating vital
information of device / board composition as some kind of black magic,
instead of just giving us a precise description how things are wired up.

> I haven't got it. How do you deduct that it's solely for Chrome? 

He mentioned in one of the mails. At least it sounded that Chrome
devices are currently the only ones that actually use it.

>> So, please, let's throw away that arbitrary acpi junk and engineer a
>> technically good solution.
> 
> ACPI has nothing to do with any solution to be "junk". If one doesn't
> know how to cook it, it doesn't prevent them from cooking it in a
> better way.

I've been referring about this specific way to put it into acpi. Indeed
acpi could be used to do it in a sane way, but this would look very
differently then. I would declare any way of putting this into acpi
functions as junk - a clean solution would be giving a precise
description of the hardware itself, a purely declarative approach,
that is independent of the actual baseband module.


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
