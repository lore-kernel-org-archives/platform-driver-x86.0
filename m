From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH 1/2] ideapad: No hardware switch after 2016
Date: Tue, 16 Feb 2016 10:04:02 +0800
Message-ID: <56C28392.7060706@canonical.com>
References: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
 <1455531863-1294-1-git-send-email-ike.pan@canonical.com>
 <87r3gew4zw.fsf@nemi.mork.no> <56C20556.7040900@canonical.com>
 <877fi5x4k6.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:60644 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752022AbcBPCEK (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 21:04:10 -0500
In-Reply-To: <877fi5x4k6.fsf@nemi.mork.no>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On 02/16/2016 01:32 AM, Bj=C3=B8rn Mork wrote:
> Ike Panhc <ike.pan@canonical.com> writes:
>> On 02/15/2016 08:08 PM, Bj=C3=B8rn Mork wrote:
>>> Ike Panhc <ike.pan@canonical.com> writes:
>>>
>>>> There are complains on few ideapads that wireless is always hard
>>>> blocked but there is no physical radio switch. For now, we need
>>>> each user to report its dmi information and ignore hard blocks
>>>> on their ideapad. With more and more ideapads available in market
>>>> to maintain the dmi table becomes never-ended job.
>>>>
>>>> I've checked lenovo website and for recent design none of the
>>>> ideapads has radio switch. I do not believe there will be in the
>>>> future. Therefore to disable hard block according to BIOS date is
>>>> reasonable approach.
>>>>
>>>> This patch will disable rfkill hardblock if BIOS year > 2015.
>>>
>>> Huh?  And what happens when a user upgrades the BIOS on older hardw=
are?
>>>
>>
>> That's why I believe > 2015 is a better choice, not > 2014.
>>
>> Ideapads in market now carries BIOS year 2015 and I found no radio s=
witch
>> on them. And I don't believe anyone will receive or upgrade BIOS for=
 more
>> then 1y old machine. In fact I haven't heard anyone upgrading BIOS f=
or a
>> long time.
>=20
> Now I don't know this platform, but that assumption seems terribly
> fragile to me.

Maybe I do not say why I propose this patch clearly. User can not use
wireless with network manager if hardblock reports yes faultily. For
now, more then half of ideapad models has no ethernet port and even
with ethernet, user will only find out wireless does not work. User
without ability to blacklist ideapad_laptop will consider Linux faulty
and choose other solution.

>=20
> Do you own a crystal ball?  Are BIOS updates for older machines so
> unlikely that you don't even have to consider the possibility?  What
> about a security flaw affecting the BIOS of a large number of older
> machines?  Has that never happened?

Upgrading BIOS might brick the machine. Laptop seller likes that even
less.

>=20
> Sorry, but I don't think it's very nice to owners of older ideapads t=
o
> just let their rfkill devices disappear silently if they ever upgrade
> their BIOS after 2015.  Yes, that may not be possible right now.  And=
 it
> might never become possible.  I don't know.  But what exactly is your
> plan *if* it becomes possible?

This is very close to impossible. In this case, I can introduce a new
dmi tables to whitelist those models.

>=20
> And are you sure there is no proper way to fix this issue?  I know
> firmware engineers are evil ;) But it would be surprising if they did=
n't
> put some clue about the physical switch into the BIOS tables.  I see
> that you check flags for wlan/bt/3g existence.  Maybe there is anothe=
r
> flag indicating the switch existence? Or maybe some other acpi method=
?

Indeed. They are evil.

I've asked acpidump for one of the ideapads[1] and find out those flags=
[2]
are from EC register[3] which is blackbox to us.

[1] https://bugs.launchpad.net/bugs/1528299
[2] http://pastebin.ubuntu.com/15088110/
[3] http://pastebin.ubuntu.com/15088128/

>=20
> At the very least, I am convinced there are other hardware you can
> correlate the switch existence with.

I believe so but I do not believe they are ideapads.

--
Ike Panhc
