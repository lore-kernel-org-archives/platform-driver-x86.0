From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH] platform/x86: Fix recursive Kconfig dependency
Date: Wed, 15 Dec 2010 12:51:04 -0800
Message-ID: <4D092A38.7020407@oracle.com>
References: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de>	<201012152135.35941.PeterHuewe@gmx.de> <AANLkTin+vOvpK4geMKdcx4wiOSc_EdPNwXJAcFTaCcnf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:24412 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752158Ab0LOUvw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Dec 2010 15:51:52 -0500
In-Reply-To: <AANLkTin+vOvpK4geMKdcx4wiOSc_EdPNwXJAcFTaCcnf@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: =?UTF-8?B?UGV0ZXIgSMO8d2U=?= <PeterHuewe@gmx.de>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Sedat Dilek <sedat.dilek@googlemail.com>

On 12/15/10 12:49, Corentin Chary wrote:
> On Wed, Dec 15, 2010 at 9:35 PM, Peter H=C3=BCwe <PeterHuewe@gmx.de> =
wrote:
>> Am Donnerstag 09 Dezember 2010, 00:29:30 schrieb Peter Huewe:
>>> This patch removes a recursive dependency which causes a build fail=
ure
>>> [1-3] by changing the ASUS_WMI from select ACPI_WMI to depend on
>>> ACPI_WMI as most other _WMI config options do.
>>>
>>> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
>=20
> Hi, another patch was posted before:
>=20
> http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/970/m=
atch=3Dacpi_wmi
>=20
> Randy Dunlap sort of Acked it ("Ah, that's what Sedat's patch does.  =
Good.")
> http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/971/m=
atch=3Dacpi_wmi

=46or Matthew:
Acked-by: Randy Dunlap <randy.dunlap@oracle.com>

>=20
> Your patch seems to miss TC1100_WMI section.

Yes, it would be better to do both (all) of them the same way.

--=20
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your cod=
e ***
