From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: [PATCH] platform/x86: Fix recursive Kconfig dependency
Date: Mon, 20 Dec 2010 15:46:02 +0100
Message-ID: <AANLkTi=gqimS5n6J6GXcZA_W1JHZ8yHJHAKqP=dDmN0Z@mail.gmail.com>
References: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de>
	<201012152214.29452.PeterHuewe@gmx.de>
	<AANLkTikPVqaZE8KBOCKWuwkqRpn3mHKQn+V3bUU5cW7=@mail.gmail.com>
	<201012192000.14969.PeterHuewe@gmx.de>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:34087 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752945Ab0LTOqD convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 20 Dec 2010 09:46:03 -0500
In-Reply-To: <201012192000.14969.PeterHuewe@gmx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Peter_H=C3=BCwe?= <PeterHuewe@gmx.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, John Linville <linville@tuxdriver.com>

On Sun, Dec 19, 2010 at 8:00 PM, Peter H=C3=BCwe <PeterHuewe@gmx.de> wr=
ote:
> Am Freitag 17 Dezember 2010, 12:30:15 schrieb Sedat Dilek:
>> On Wed, Dec 15, 2010 at 10:14 PM, Peter H=C3=BCwe <PeterHuewe@gmx.de=
> wrote:
>> > Am Mittwoch 15 Dezember 2010, 21:51:04 schrieb Randy Dunlap:
>> >> > Hi, another patch was posted before:
>> >> >
>> >> > http://article.gmane.org/gmane.linux.drivers.platform.x86.devel=
/970/ma
>> >> > tch =3Dacpi_wmi
>> >> >Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
>> >
>> > Yeah, you're right - but as Sedat's patch is perfect (and fixes bo=
th) -
>> > so for Sedats's patch:
>> > Acked-by: Peter Huewe <peterhuewe@gmx.de>
>> >
>> > Thanks,
>> > Peter
>>
>> [ CC John Linville ]
>>
>> It's a bit disappointing to see my fix is still not in
>> platform-drivers-x86/linux-next [1] (even it's only fixing "warnings=
",
>> 9 days past).
>> linux-next tree is for me a very high dynamic SCM tree, I am doing
>> mostly daily builds, at weekend I am testing/pulling other trees
>> before they go into Monday's linux-next.
>> As far as I have fun with "my process"... I will continue.
>
>
>
> Added Stephen Rothwell on CC, maybe he can apply it directly to linux=
-next ;)
>
> Peter
>

I do not think this will happen for a "as-warning-classified" patch.
As far as I understood from a previous asking to accept a patch
through Stephen, he answered me that he is expecting that patches for
sub-trees shall be pushed by the sub-maintainer(s).
This is surely the optimal way.

There is a nice, informative interview with Stephen on topic of
linux-next [1] (working together with submaintainers etc.).

Unfortunately, it will sometimes happen that more than one people will
notice or send a patch to the same issue.
So, yeah a bit waste of time someone could think.
Thus, it is always good to check the MLs first :-).

But which MLs?
It's a pity people don't use linux-next ML for l-n releated stuff.
As a consequence, I subscribed a few hours ago to linux-next ML [2]
and will post primarily there (LKML should IMHO not be the 1st place
for such issues, but a CC is OK).

The subjects of Emails should be very clear on what type of issue.
=46or example, breakage(s) shoul be clearly expressed.
Also, I miss often against WTF version of linux-next ppl send patches.
Hey, hello, each l-n version has a localversion-next file, didn't see :=
-)?
A good subject:
"Re: linux-next: Tree for December 20 (BROKEN iwlwifi)" or
"linux-next: next-20101220 (BROKEN iwlwifi)"

That a GIT tree is compile-able is a (maybe *the*) first step to QA,
but QA is a big playground.

Hmm, I have some ideas in my big suitcase...
The wiki [1] needs partly a refresh...
An IRC-channel #linux-next would be fine...
Lemme re-think and write them down.

- Sedat -

P.S.: Personally, I have seen some patches from Randy and others which
were still not applied.

[1] http://video.linux.com/video/1048
[2] http://linux.f-seidel.de/linux-next/pmwiki/pmwiki.php?n=3DLinux-nex=
t.ShortSummary
