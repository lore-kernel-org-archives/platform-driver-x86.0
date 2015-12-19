From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/4] platform/x86: Add Asus Wireless Radio Control driver
Date: Fri, 18 Dec 2015 22:39:57 -0800
Message-ID: <20151219063957.GD7244@malice.jf.intel.com>
References: <1450193442-7930-1-git-send-email-jprvita@endlessm.com>
 <1450193442-7930-2-git-send-email-jprvita@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45658 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753278AbbLSGj6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 19 Dec 2015 01:39:58 -0500
Content-Disposition: inline
In-Reply-To: <1450193442-7930-2-git-send-email-jprvita@endlessm.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@endlessm.com>

On Tue, Dec 15, 2015 at 10:30:39AM -0500, Jo=E3o Paulo Rechi Vita wrote=
:
> Some Asus notebooks like the Asus E202SA and the Asus X555UB have a
> separate ACPI device for notifications from the airplane mode hotkey.
> This device is called "Wireless Radio Control" in Asus websites and A=
SHS
> in the DSDT, and its ACPI _HID is ATK4002 in the two models mentioned
> above.
>=20
> For these models, when the airplane mode hotkey (Fn+F2) is pressed, a
> query 0x0B is started in the Embedded Controller, and all this query =
does
> is a notify ASHS with the value 0x88 (for acpi_osi >=3D "Windows 2012=
"):
>=20
> 	Scope (_SB.PCI0.SBRG.EC0)
> 	{
> 		(...)
> 		Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query
> 		{
> 			If ((MSOS () >=3D OSW8))
> 			{
> 				Notify (ASHS, 0x88) // Device-Specific
> 			}
> 			Else
> 			{
> 				(...)
> 			}
> 		}
> 	}
>=20
> Signed-off-by: Jo=E3o Paulo Rechi Vita <jprvita@endlessm.com>

Hi Joao,

Nice work!

In the future, [please be sure to include all the maintainers listed by
get_maintainer.pl when submitting patches for review.

No concerns from me on this portion of the series.

--=20
Darren Hart
Intel Open Source Technology Center
