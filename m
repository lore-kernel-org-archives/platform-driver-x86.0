From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] platform/x86: Fix recursive Kconfig dependency
Date: Wed, 15 Dec 2010 21:49:30 +0100
Message-ID: <AANLkTin+vOvpK4geMKdcx4wiOSc_EdPNwXJAcFTaCcnf@mail.gmail.com>
References: <1291850970-7190-1-git-send-email-peterhuewe@gmx.de>
	<201012152135.35941.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f45.google.com ([209.85.215.45]:51385 "EHLO
	mail-ew0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752158Ab0LOUtc convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 15 Dec 2010 15:49:32 -0500
In-Reply-To: <201012152135.35941.PeterHuewe@gmx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Peter_H=C3=BCwe?= <PeterHuewe@gmx.de>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Randy Dunlap <randy.dunlap@oracle.com>, Sedat Dilek <sedat.dilek@googlemail.com>

On Wed, Dec 15, 2010 at 9:35 PM, Peter H=C3=BCwe <PeterHuewe@gmx.de> wr=
ote:
> Am Donnerstag 09 Dezember 2010, 00:29:30 schrieb Peter Huewe:
>> This patch removes a recursive dependency which causes a build failu=
re
>> [1-3] by changing the ASUS_WMI from select ACPI_WMI to depend on
>> ACPI_WMI as most other _WMI config options do.
>>
>> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

Hi, another patch was posted before:

http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/970/mat=
ch=3Dacpi_wmi

Randy Dunlap sort of Acked it ("Ah, that's what Sedat's patch does.  Go=
od.")
http://article.gmane.org/gmane.linux.drivers.platform.x86.devel/971/mat=
ch=3Dacpi_wmi

Your patch seems to miss TC1100_WMI section.

--=20
Corentin Chary
http://xf.iksaif.net
