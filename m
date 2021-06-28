Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258E5C11F64
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 17:47:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0220B61C4D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 28 Jun 2021 17:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbhF1Rt4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 28 Jun 2021 13:49:56 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:59883 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbhF1Rtz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Jun 2021 13:49:55 -0400
Received: from [192.168.1.155] ([77.9.21.236]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQNF3-1lcHlk2Raz-00MIOP; Mon, 28 Jun 2021 19:47:17 +0200
Subject: Re: [PATCH V2 1/1] [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem
To:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shravan S <s.shravan@intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "An, Sudhakar" <sudhakar.an@intel.com>
References: <20210510074016.31627-1-s.shravan@intel.com>
 <20210510074016.31627-2-s.shravan@intel.com>
 <CAHp75Ve_=mv5MbLvqxGwu8GAuxAjBLpRHE9KNua-yvmzUNKuKw@mail.gmail.com>
 <79bd7236-dec1-ffde-8c23-3a500e04eedd@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <f9e0a2b8-6e30-0b85-34d0-16a101da4686@metux.net>
Date:   Mon, 28 Jun 2021 19:47:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <79bd7236-dec1-ffde-8c23-3a500e04eedd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BqNzo0DqHFQC34wBLi5/jZejcGrvzxexHldPi5UQs+5fzdZnfZt
 Pjo0GJKEvrsUUgOVRmLzi3EXDCstP/sqg8HtO43Exwt01mSafug1KAU/vhI2kj4WQ5ZAIja
 2IHDuV27cuZYIBRCUTmI/tpugyuwTvlwrhtXE4IYjdoUiDZa574LIojCDdfeesAzgToFs7g
 8FVugyLcGs0S4DngYvfNA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zJ8jYAU+b/k=:+vTM7xCjBAEDBrBmfwb5Et
 ltq7FFoB1WgUgc9jvdhfpdla+gXMhPhmYanBDoS7LskAsV/rtxpy43LXUiT4Jn2ply4wosC19
 rjvfS0fa4L9SUa+UHFf2PmSxokb9X4uqNAhUMqHpPAY7o/Yt4VRASTI5NENLz2EbEl5k0t2uA
 nJAQX1Md7goF3NUtIMaMTR73t2irGR1idYeHhI4C4B0yNMFWXzI9NY2Nfmumo0JBdllWAYR/O
 vaHhZGSe1v2czA/ebt3tyZjrTE9Az3tErqWDCvvsaka5Ym14fslv/M+OZ6WfgrcDnFEffBNwO
 IXlsvcnB0Jts+qOLyE+Fa91yyR4AGgS7HkpKpGmNWcdmaXcmZVX9wt6NLINIoPAbCCJGjoQ7g
 Z698uUTgQ67iIruf9yvEUvlt2kPni64YeFuJuQbrQlhSilfXr0gdanbXPZgASt66zBL2/Jx7W
 FZdxXZx5xcHkjTbR8sWI61Mw8W25y6HBi3KDEo+METGc6F96QBrljU0+eutPW60r7rxcXMJLw
 /06Dphmll3M12LG3618DOQ=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 28.06.21 17:12, Hans de Goede wrote:

Hi,

> I'm not in favor of internal reviews, esp. not when new userspace
> API is involved. I would greatly prefer for the discussions surrounding
> this to be kept public.

ACK. Please do that in open public. There're still lots of things to
discuss that should be discussed in wide public, instead of comittee
behind closed doors.

> I agree that ideally we should have some generic userspace API for this,
> but I'm afraid that ATM that simply is not possible. 

Why not ? Lets collect the actual requirements and talk about some
viable solutions (I've already got a few ideas ...)

> This whole notion of maximum tx power being controlled based on various 
> sensors because of SAR reasons is pretty new (at least in the PC/laptop space) 
> and I know of a couple of vendors who are slapping some adhoc firmware
> interface on the sensor readings for some modem related userspace
> process to consume.

We should bring them here onboard, public discussion. And at the same
time we should make it crystally clear to them that weird adhoc hacks
won't be accepted and just give them very bad reputation and
shitstorming. Seriously, I believe we should go that route, in order
to prevent even more damage by insane firmware interfaces.

Such stuff really doesn't belong into firmware, at least not the way its
done now. Instead there just should be a clear description of the actual
hardware.

> I don't think that it is realistic to try and layer a common userspace
> interface over this at this point time. Actually I believe that even
> trying to do so is a bad idea at this point in time, since this is
> all so new that we are bound to get it badly wrong if we try to
> design a common userspace API for this now.

actually, I don't think it should go through userland (except perhaps
a knob for switching it on/off).

> I also don't want to wait for this to all crystallize out since that
> will likely take years; and we should add support for this under Linux
> in a reasonable time-frame. For laptops which ship with Linux
> pre-installed it is important that there is feature parity between
> Windows and Linux; and support for these new type of modems which need
> this "SAR" integration is one of the biggest pain points with this ATM.

I don't think that this should serve as an excuse for slappy and vendor 
specific solutions, especially when userland is involved.

And if we really do that, then just as some intermediate solution,
and lets put it under staging.


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
