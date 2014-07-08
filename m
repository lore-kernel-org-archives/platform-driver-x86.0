From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation: Rename hpfall.c => freefall.c, fixes
 for Dell
Date: Tue, 08 Jul 2014 15:49:46 -0700
Message-ID: <53BC758A.5060303@infradead.org>
References: <1399114077-19314-3-git-send-email-pali.rohar@gmail.com> <1402473727-5464-1-git-send-email-pali.rohar@gmail.com> <53AF7601.5000205@infradead.org> <201407072015.32497@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:56736 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751224AbaGHWtx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 8 Jul 2014 18:49:53 -0400
In-Reply-To: <201407072015.32497@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?ISO-8859-1?Q?Pali_Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <matthew.garrett@nebula.com>, Pavel Machek <pavel@ucw.cz>, Valdis Kletnieks <valdis.kletnieks@vt.edu>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sonal Santan <sonal.santan@gmail.com>

On 07/07/2014 11:15 AM, Pali Roh=E1r wrote:
> Hello Randy, sorry but now I do not have any free time...

a. It took me 7 minutes to split the patch into 2 patches as I requeste=
d.

b. In the future please do it like that.

c. Pavel asked me to go ahead and apply the patch. I will do that since
I have a few other patches to hpfall.c (freefall.c) that need to be app=
lied.


> On Sunday 29 June 2014 04:12:17 Randy Dunlap wrote:
>> Hi,
>>
>> This should really be done as 2 separate patches:
>> One to move/rename the file and one to make the
>> changes/additions to it for DELL.
>>
>> Can you resend it as 2 patches like that, please?
>>
>> Thanks... and sorry for the delay.
>>
>> On 06/11/14 01:02, Pali Roh=E1r wrote:
>>> Dell kernel driver dell-smo8800 provides same freefall
>>> interface as hp_accel so program hpfall.c works also on
>>> Dell laptops. So rename it to freefall.c.
>>>
>>> Dell driver does not provide hp::hddprotect led so make sure
>>> that freefall.c works also if hp::hddprotect does not exist
>>> in sysfs.
>>>
>>> Additionally write info to syslog.
>>>
>>> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>
>>> Cc: Sonal Santan <sonal.santan@gmail.com>
>>> ---
>>> Changes since v1:
>>> * Fixed warnings: Missing a blank line after declarations
>>> ---
>>>
>>>  Documentation/laptops/00-INDEX   |    4 +-
>>>  Documentation/laptops/freefall.c |  177
>>>  ++++++++++++++++++++++++++++++++++++++
>>>  Documentation/laptops/hpfall.c   |  146
>>>  ------------------------------- 3 files changed, 179
>>>  insertions(+), 148 deletions(-) create mode 100644
>>>  Documentation/laptops/freefall.c delete mode 100644
>>>  Documentation/laptops/hpfall.c
>=20


--=20
~Randy
