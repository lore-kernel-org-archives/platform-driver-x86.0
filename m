From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation: Rename hpfall.c => freefall.c, fixes
 for Dell
Date: Fri, 27 Jun 2014 13:25:49 -0700
Message-ID: <53ADD34D.4020709@infradead.org>
References: <1399114077-19314-3-git-send-email-pali.rohar@gmail.com> <20140614085328.GC15326@Nokia-N900> <201406161355.03998@pali> <201406272108.10901@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47466 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264AbaF0UZy (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 27 Jun 2014 16:25:54 -0400
In-Reply-To: <201406272108.10901@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>, Matthew Garrett <matthew.garrett@nebula.com>
Cc: Pavel Machek <pavel@ucw.cz>, Valdis Kletnieks <valdis.kletnieks@vt.edu>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sonal Santan <sonal.santan@gmail.com>

On 06/27/14 12:08, Pali Roh=E1r wrote:
> On Monday 16 June 2014 13:55:03 Pali Roh=E1r wrote:
>> On Saturday 14 June 2014 10:53:29 Pavel Machek wrote:
>>> On Wed 2014-06-11 10:02:07, Pali Roh?r wrote:
>>>> Dell kernel driver dell-smo8800 provides same freefall
>>>> interface as hp_accel so program hpfall.c works also on
>>>> Dell laptops. So rename it to freefall.c.
>>>>
>>>> Dell driver does not provide hp::hddprotect led so make
>>>> sure that freefall.c works also if hp::hddprotect does
>>>> not exist in sysfs.
>>>>
>>>> Additionally write info to syslog.
>>>>
>>>> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
>>>> Cc: Sonal Santan <sonal.santan@gmail.com>
>>>> ---
>>>> Changes since v1:
>>>> * Fixed warnings: Missing a blank line after declarations
>>>> ---
>>>>
>>>>  Documentation/laptops/00-INDEX   |    4 +-
>>>>  Documentation/laptops/freefall.c |  177
>>>>  ++++++++++++++++++++++++++++++++++++++
>>>>  Documentation/laptops/hpfall.c   |  146
>>>>  ------------------------------- 3 files changed, 179
>>>>  insertions(+), 148 deletions(-) create mode 100644
>>>>  Documentation/laptops/freefall.c delete mode 100644
>>>>  Documentation/laptops/hpfall.c
>>>
>>> Acked-by: Pavel Machek <pavel@ucw.cz>
>>>
>>> 						Pavel
>>
>> Randy, Matthew: PING
>>
>> first patch which implementing dell-smo8800.ko was merged, but
>> this patch which updating documentation and fall daemon *not*.
>=20
> PING.
>=20
> What is with this patch? Why was still not set to Linus in doc or=20
> platform pull request?
>=20

Sorry, I was on vacation this week, but that does not explain the previ=
ous
delays.

I'll merge it sometime this weekend.

Thanks.

--=20
~Randy
