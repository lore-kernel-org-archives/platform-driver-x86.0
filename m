Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E33EC2B9F4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 14:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 593E0619A3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 14:08:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbhF1OKe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 10:10:34 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:33989 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230033AbhF1OKa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 10:10:30 -0400
Received: from [192.168.1.155] ([77.9.21.236]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MLRgp-1lgTOr0D8V-00ISVV; Mon, 28 Jun 2021 16:07:54 +0200
Subject: Re: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems
To:     "Shravan, S" <s.shravan@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
References: <20210428032224.8299-1-s.shravan@intel.com>
 <CAHp75Vfq6B0=q0dsQPTP_A8sdPh9tepBooa7cW=KJYX78ekWtw@mail.gmail.com>
 <MWHPR11MB1455D055108F1DBEA6EB9285E3319@MWHPR11MB1455.namprd11.prod.outlook.com>
 <c7c3d395-826b-fc34-b396-a9c7631d981b@metux.net>
 <CAHp75VdLhxv4PqRznZGXQiWtdM7Ssx29xDkH4BaZ_DmHWa=-Nw@mail.gmail.com>
 <MWHPR11MB145562EBE171DD3B40595DD0E3089@MWHPR11MB1455.namprd11.prod.outlook.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <c76d3ae7-a7fb-e766-d71c-c929cfde969c@metux.net>
Date:   Mon, 28 Jun 2021 16:07:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB145562EBE171DD3B40595DD0E3089@MWHPR11MB1455.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tO6RNtWJSEN1do3Q6BB1wTys33kYpbNOZDjk7/dsYc4aA8yfK2q
 BJTyRT7cY1ox/1L/dLZt+OcQcSPVQqMYJ6IKYC/DsmCrSHkkvSvSWCwsicaNepecEKPiAK1
 ow6RNm9qCuRXFq0fU+/iBPKoJpzJJgJB8OB9iYf7tI+2sHI/t+AJ+yTCwo1xc1NkL12OSv/
 kv6wqir8Fc9O6Iv9ArrWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:C9bnp9qTCYg=:rrJZEQqZvNTpqagzF0pPib
 h6KF77pGxVXp32bCmljC3qyFB4MkMfWU1njDPDxs0QsPETOr3JXgIIfrgc2/3RAhck0GAMy8w
 linI0T6sKqgrpVn5KNbF42P7gVy0YKdegv1jJ/8hPRODYXk4sWm7Q8UH0h2+xZl/n7KUNQw7G
 vTrc+Fyyzokh7heYeEaBjVNnCmi19zuUMpKCakD0AotbYA5HTV4kBbVksICz2NjCwzNH5SeZh
 jMry2/5PSo3gInkN732RrUJQ51n2wb/Q5S+5ZF5tHkH1ZHMBNLLuA1d6dcJOrvrmbfjlA0tPs
 RI2/tIFnhHeT0ZAmXQSPsmJQ4IyiHBRptGgnoR7UbYFx5bH+vCH0HcoBsnJDIJlomank6wDV6
 VIi/a5qxtycMU4oPwfDF4N2ldaAPplqkICRxd42iYal7eD3bHOn84fm7s/3P94jz0fk5gtb6k
 EO3XEi05KiatofIzuDdSqz8REqTBuzPG0qbWV0UTUhODIpccZnw6sRMzNlcv+YOGSQeXu9LGB
 hxfu8DOWTB19U/+Jwc4D2s=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 23.06.21 16:03, Shravan, S wrote:

Hi,

> [Shravan]  This driver is exposing the SAR parameters solely influenced by 
> the current status of the host platform and is not specific to any RF device. 
> Hence it is placed at the path (Platform driver).

I'm confused, how could that be not specific to any RF device ? It can
only make sense at all, if we know which device certain settings need to
be applied to. And even finding reasonable settings highly depends on
lots of hardware and environmental specific factors, starting with the
frequencies and modulation types, signal routing on the board, shielding
characteristics of the machine's case, etc, etc.

By the way: why does it have to be some proprietary ACPI call ?

Why not just publishing some table where the kernel can do the lookup ?
And do we have some (simple!) identification of the board/machine, so we
can easily override these bios values when necessary ?

Over the last decades I had to learn to *never* trust BIOS vendors with
anything more than just starting the kernel, especially not trusting in
ACPI tables. And we certainly cant expect people doing field bios
upgrades anytime soon, in case some bios vendor actually manages to
clean up his dirt and publish some actual fixes.

Seriously, I'd rather try to keep bios out of the loop as much as
possible. And if it is involved, let it describe the hardware precisely
instead of doing whatever magic logic.

(I need to hold back myself for not starting another rant against ACPI
and bios vendors :p)

>>> 2. its unclear for which air interface is the data really retrieved ?
> 
> [Shravan]  The initial implementation supports parameters received for WWAN. 
> Subsequently other RF device types (Wifi, BT) will be supported.

We still don't know for which individual interface these parameters
apply to. I've got machines with multiple WWAN interfaces out in the
field.

>>> 3. unclear how userland this should really handle in a generic way
>>>      --> how does it know which device to tune ?
> 
> [Shravan] Userland will configure these parameters on the specific RF device.

So the user needs to configure it anyways. Why do we have to have that
acpi stuff in the first place ? If we're already involving a device
specific userland, everything (including the tables) could live entirely
in userland - and we would never ever have to touch bios or kernel
anymore. (remember: bios upgrades are always a total mess).

>>> by the way, who hat that funny idea putting such information into acpi
>>> in such a weird way ?
>>
>> I believe its source is a Windows driver and Windows "culture", they simply 
>> don't give a crap about anything else and Windows is a product-oriented platform 
>> (each product is unique even if 99.9% of the hardware and firmware is the same 
>> with twenty more products).

Okay, and why are you guys (Intel) following such insanity, when this is
meant for Linux-based devices like Chrome ?

Sorry, but doing something just because thousands of programming minions
in Windoze world (which, from my personal expercience, most of them, at
least on driver and firmware side, I have to consider totally
incompetent) are doing it that way, really is a bad excuse and has
nothing to do with decent engineering.

So, please, let's throw away that arbitrary acpi junk and engineer a
technically good solution.

My requirements for such a solution would be:

* the involvement of bios/acpi shall be limited to some exact
   identification, or even better, formal description of the hardware.
   (like we do w/ device tree) [*1]
* beyond that, there shall be no need to ever do any bios upgrade,
   once this data is initially added
* the formal description shall also indentify the which devices are to
   be tuned
* the OS shall be in full control of everything, no hidden firmware
   magic at all.
* the solution shall be generic enough so it can be directly applied to
   *any* similar hardware, no matter what vendor or fw type.


--mtx


[*1] maybe offtopic: I'm actually considering embedding actual DTB into
      the bios and leave acpi just as a legacy fallback - yes, seriously.
--
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
