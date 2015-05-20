From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] thinkpad_acpi: revert unintentional device attribute
 renaming
Date: Wed, 20 May 2015 02:19:59 -0700
Message-ID: <20150520091959.GB22037@vmdeb7>
References: <1432057503-18089-1-git-send-email-bjorn@mork.no>
 <1432058117.3143492.272974641.60D462B3@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:43420 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750794AbbETJUA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 May 2015 05:20:00 -0400
Content-Disposition: inline
In-Reply-To: <1432058117.3143492.272974641.60D462B3@webmail.messagingengine.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>, platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Bastien Nocera <hadess@hadess.net>

On Tue, May 19, 2015 at 02:55:17PM -0300, Henrique de Moraes Holschuh w=
rote:
> On Tue, May 19, 2015, at 14:45, Bj=F8rn Mork wrote:
> > The conversion to DEVICE_ATTR_* macros failed to fixup a few cases =
where
> > the old attribute names didn't match the show/store function names.
> > Instead of renaming the functions, the attributes were renamed. Thi=
s
> > caused an unintentional API change.  The hwmon required 'name' attr=
ibute
> > were among the renamed attribute, causing libsensors to fail to det=
ect
> > the hwmon device at all.
> >=20
> > Fix by using the DEVICE_ATTR macro for these attributes, allowing t=
he
> > show/store functions to keep their system specific prefixes.
> >=20
> > Fixes: b4dd04ac6ef8 ("thinkpad_acpi: use DEVICE_ATTR_* macros")
> > Cc: Bastien Nocera <hadess@hadess.net>
> > Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> > Signed-off-by: Bj=F8rn Mork <bjorn@mork.no>
> > ---
> > v2: kept the original function names, using the DEVICE_ATTR instead
>=20
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Thanks for the catch Bj=F8rn, much appreciated. Queued for 4.1 fixes.

--=20
Darren Hart
Intel Open Source Technology Center
