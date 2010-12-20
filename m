From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] platform/x86: Fix recursive Kconfig dependency
Date: Mon, 20 Dec 2010 09:24:31 -0800
Message-ID: <4D0F914F.2050908@oracle.com>
References: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de> <201012192000.14969.PeterHuewe@gmx.de> <AANLkTi=gqimS5n6J6GXcZA_W1JHZ8yHJHAKqP=dDmN0Z@mail.gmail.com> <201012201809.41269.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <201012201809.41269.PeterHuewe@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?UGV0ZXIgSMO8d2U=?= <PeterHuewe@gmx.de>
Cc: sedat.dilek@gmail.com, Stephen Rothwell <sfr@canb.auug.org.au>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, John Linville <linville@tuxdriver.com>
List-Id: platform-driver-x86.vger.kernel.org

On 12/20/10 09:09, Peter H=C3=BCwe wrote:
> Am Montag 20 Dezember 2010, 15:46:02 schrieb Sedat Dilek:
>>> Added Stephen Rothwell on CC, maybe he can apply it directly to
>>> linux-next ;)
>>>
>>> Peter
>>
>> I do not think this will happen for a "as-warning-classified" patch.
>=20
> On arm and avr32 it is not only a warning but an error instead!
>=20
> -> so the patch fixes an error / build failure which imho is quite an=
=20
> important issue.
>=20
> You can see the errors in Ellerman's build farm.
>=20
> http://kisskb.ellerman.id.au/kisskb/buildresult/3652816/
> http://kisskb.ellerman.id.au/kisskb/buildresult/3664077/
> http://kisskb.ellerman.id.au/kisskb/buildresult/3652972/
> http://kisskb.ellerman.id.au/kisskb/buildresult/3664113/
>=20
> As it is an error for arm and avr32 maybe it should go through their =
trees=20
> instead?


It's a kconfig "error" on x86 also, but it does not stop the .config fi=
le
from being generated.  It needs to be fixed, but it's not deadly.


--=20
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
desserts:  http://www.xenotime.net/linux/recipes/
