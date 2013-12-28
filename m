From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 0/4] thinkpad_acpi: Add support for controlling charge
 thresholds
Date: Sat, 28 Dec 2013 20:10:03 -0200
Message-ID: <20131228221003.GA24911@khazad-dum.debian.net>
References: <1384178195-12218-1-git-send-email-jak@jak-linux.org>
 <20131228211026.GA14725@jak-x230>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54660 "EHLO
	out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751206Ab3L1WKM (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 28 Dec 2013 17:10:12 -0500
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 05CB920F75
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Dec 2013 17:10:05 -0500 (EST)
Content-Disposition: inline
In-Reply-To: <20131228211026.GA14725@jak-x230>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Julian Andres Klode <jak@jak-linux.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Matthew Garrett <matthew.garrett@nebula.com>, "open list:THINKPAD ACPI EXT..." <ibm-acpi-devel@lists.sourceforge.net>, "open list:THINKPAD ACPI EXT..." <platform-driver-x86@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Sat, 28 Dec 2013, Julian Andres Klode wrote:
> On Mon, Nov 11, 2013 at 02:56:29PM +0100, Julian Andres Klode wrote:
> > This patch series adds support for specifying charging thresholds,
> > forcing a battery to discharge, and inhibiting charging, on ThinkPa=
d
> > Laptops using Sandy Bridge or newer processors.
>=20
> Hello again,
>=20
> it's been about 1.5 months now after I submitted this patch series
> and I have not received any response yet.
>=20
> I fixed the issues pointed out by Bj=F8rn Mork in the previous patch
> except for the one with the battery names, as I have no idea how
> battery numbers are created or mapped. I can only say that the names
> are the same on my test machine, I don't have any other ones.
>=20
> Henrique, it would be really great if you could take a look.

I did.  I just did not manage to finish looking over it, it is not real=
ly
okay as-is, mostly because it did not create a power-supply device and
properly extended that thing in a generic way, which would be vastly
preferable to adding yet another private interface.

--=20
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
