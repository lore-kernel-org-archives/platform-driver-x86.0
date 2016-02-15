From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH 1/2] ideapad: No hardware switch after 2016
Date: Mon, 15 Feb 2016 18:32:25 +0100
Message-ID: <877fi5x4k6.fsf@nemi.mork.no>
References: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
	<1455531863-1294-1-git-send-email-ike.pan@canonical.com>
	<87r3gew4zw.fsf@nemi.mork.no> <56C20556.7040900@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:41901 "EHLO canardo.mork.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751326AbcBORcy convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 12:32:54 -0500
In-Reply-To: <56C20556.7040900@canonical.com> (Ike Panhc's message of "Tue, 16
	Feb 2016 01:05:26 +0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Ike Panhc <ike.pan@canonical.com> writes:
> On 02/15/2016 08:08 PM, Bj=C3=B8rn Mork wrote:
>> Ike Panhc <ike.pan@canonical.com> writes:
>>=20
>>> There are complains on few ideapads that wireless is always hard
>>> blocked but there is no physical radio switch. For now, we need
>>> each user to report its dmi information and ignore hard blocks
>>> on their ideapad. With more and more ideapads available in market
>>> to maintain the dmi table becomes never-ended job.
>>>
>>> I've checked lenovo website and for recent design none of the
>>> ideapads has radio switch. I do not believe there will be in the
>>> future. Therefore to disable hard block according to BIOS date is
>>> reasonable approach.
>>>
>>> This patch will disable rfkill hardblock if BIOS year > 2015.
>>=20
>> Huh?  And what happens when a user upgrades the BIOS on older hardwa=
re?
>>=20
>
> That's why I believe > 2015 is a better choice, not > 2014.
>
> Ideapads in market now carries BIOS year 2015 and I found no radio sw=
itch
> on them. And I don't believe anyone will receive or upgrade BIOS for =
more
> then 1y old machine. In fact I haven't heard anyone upgrading BIOS fo=
r a
> long time.

Now I don't know this platform, but that assumption seems terribly
fragile to me.

Do you own a crystal ball?  Are BIOS updates for older machines so
unlikely that you don't even have to consider the possibility?  What
about a security flaw affecting the BIOS of a large number of older
machines?  Has that never happened?

Sorry, but I don't think it's very nice to owners of older ideapads to
just let their rfkill devices disappear silently if they ever upgrade
their BIOS after 2015.  Yes, that may not be possible right now.  And i=
t
might never become possible.  I don't know.  But what exactly is your
plan *if* it becomes possible?

And are you sure there is no proper way to fix this issue?  I know
firmware engineers are evil ;) But it would be surprising if they didn'=
t
put some clue about the physical switch into the BIOS tables.  I see
that you check flags for wlan/bt/3g existence.  Maybe there is another
flag indicating the switch existence? Or maybe some other acpi method?

At the very least, I am convinced there are other hardware you can
correlate the switch existence with.


Bj=C3=B8rn
