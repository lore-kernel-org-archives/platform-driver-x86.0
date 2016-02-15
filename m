From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH 1/2] ideapad: No hardware switch after 2016
Date: Tue, 16 Feb 2016 01:05:26 +0800
Message-ID: <56C20556.7040900@canonical.com>
References: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
 <1455531863-1294-1-git-send-email-ike.pan@canonical.com>
 <87r3gew4zw.fsf@nemi.mork.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87r3gew4zw.fsf@nemi.mork.no>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 02/15/2016 08:08 PM, Bj=C3=B8rn Mork wrote:
> Ike Panhc <ike.pan@canonical.com> writes:
>=20
>> There are complains on few ideapads that wireless is always hard
>> blocked but there is no physical radio switch. For now, we need
>> each user to report its dmi information and ignore hard blocks
>> on their ideapad. With more and more ideapads available in market
>> to maintain the dmi table becomes never-ended job.
>>
>> I've checked lenovo website and for recent design none of the
>> ideapads has radio switch. I do not believe there will be in the
>> future. Therefore to disable hard block according to BIOS date is
>> reasonable approach.
>>
>> This patch will disable rfkill hardblock if BIOS year > 2015.
>=20
> Huh?  And what happens when a user upgrades the BIOS on older hardwar=
e?
>=20

That's why I believe > 2015 is a better choice, not > 2014.

Ideapads in market now carries BIOS year 2015 and I found no radio swit=
ch
on them. And I don't believe anyone will receive or upgrade BIOS for mo=
re
then 1y old machine. In fact I haven't heard anyone upgrading BIOS for =
a
long time.
