From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCHv4] hp-wmi: limit hotkey enable
Date: Thu, 10 Sep 2015 14:21:47 -0700
Message-ID: <20150910212147.GA117960@vmdeb7>
References: <20150910030330.GE90062@vmdeb7>
 <1441907100-4141-1-git-send-email-kvans32@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50508 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750943AbbIJVVu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 10 Sep 2015 17:21:50 -0400
Content-Disposition: inline
In-Reply-To: <1441907100-4141-1-git-send-email-kvans32@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kyle Evans <kvans32@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net

On Thu, Sep 10, 2015 at 12:45:00PM -0500, Kyle Evans wrote:
> Do not write initialize magic on systems that do not have
> feature query 0xb. Fixes Bug #82451.
>=20
> Redefine FEATURE_QUERY to align with 0xb and FEATURE2 with 0xd
> for code clearity.
>=20
> Add a new test function, hp_wmi_bios_2008_later() & simplify
> hp_wmi_bios_2009_later(), which fixes a bug in cases where
> an improper value is returned. Probably also fixes Bug #69131.
>=20
> Signed-off-by: Kyle Evans <kvans32@gmail.com>
> ---
>  Since v1:
>  - Refactored feature query 0xb into separate function
>  - Redefine FEATURE_QUERY to align with 0xb and FEATURE2 with 0xd
>=20
>  Since v2:
>  - Simplify hp_wmi_bios_200x_later functions. No longer returns true=20
>  (4) when the test fails. However, if state is somehow useful, that i=
s lost.
>=20
>  Since v3:
>  - Fix whitespace, email client reformatting.

Thanks, this one applies cleanly, however:

drivers/platform/x86/hp-wmi.c: In function =E2=80=98hp_wmi_input_setup=E2=
=80=99:
drivers/platform/x86/hp-wmi.c:675:2: error: implicit declaration of fun=
ction =E2=80=98hp_wmi_2008_later=E2=80=99 [-Werror=3Dimplicit-function-=
declaration]
  if (!hp_wmi_bios_2009_later() && hp_wmi_2008_later())
  ^
drivers/platform/x86/hp-wmi.c: At top level:
drivers/platform/x86/hp-wmi.c:299:19: warning: =E2=80=98hp_wmi_bios_200=
8_later=E2=80=99 defined but not used [-Wunused-function]
 static int __init hp_wmi_bios_2008_later(void)

Looks like you missed "bios" in the call to hp_wmi_bios_2008_later. Whi=
ch
suggests this version was not compile tested. As I cannot test the code=
 myself
without hardware, I depend on submitters even more to do the testing, s=
o it is
really important that you have tested the exact patch that I send to Li=
nus.

--=20
Darren Hart
Intel Open Source Technology Center
