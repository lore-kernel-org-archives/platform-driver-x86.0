From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_menlow: prevent NULL pointer dereference
Date: Thu, 9 Jun 2016 12:53:30 -0700
Message-ID: <20160609195330.GM28348@f23x64.localdomain>
References: <1464186011-732-1-git-send-email-vincent.stehle@intel.com>
 <20160608203846.GG28348@f23x64.localdomain>
 <20160609172452.GA32327@jazz.nc.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48146 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751AbcFITxb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Jun 2016 15:53:31 -0400
Content-Disposition: inline
In-Reply-To: <20160609172452.GA32327@jazz.nc.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Sujith Thomas <sujith.thomas@intel.com>, Zhang Rui <rui.zhang@intel.com>, Len Brown <len.brown@intel.com>, Rafael Wysocki <rjw@rjwysocki.net>

On Thu, Jun 09, 2016 at 07:24:52PM +0200, Vincent Stehl=E9 wrote:
> On Wed, Jun 08, 2016 at 01:38:46PM -0700, Darren Hart wrote:
> > Under what circumstances can the .remove op be called with a NULL s=
truct
> > acpi_device * as a parameter? From what I can see, most acpi_* call=
s accpeting
> > an acpi_device rely on it not being null, and they are regularly ca=
lled from
> > driver remove functions.
> > Did you observe an explicit failure or can you describe a call path=
 where this
> > can occur?
>=20
> Hi Darren,
>=20
> Thank you for reviewing.
>=20
> I am not sure about when the .remove() functions are called with a NU=
LL
> pointer, or if that can ever happen. I just noticed that dereferencin=
g the
> pointer and checking for NULL after did not seem to be the right thin=
g to
> do. So I wanted to replicate instead the same construct as e.g.
> xen_acpi_processor_remove().
>=20
> Your remark encouraged me to do some more digging into the sources an=
d it
> appears that 13 .remove() functions do indeed check their input devic=
e
> pointer for NULL, while 26 do not (the remaining do not use their inp=
ut
> pointer at all). Now I am puzzled about the necessity to check the po=
inter
> for NULL or not, and there does not seem to be a definitive answer in=
 the
> docs either...

Either way, some change appears to be needed.

Rafael, with respect to acpi .remove functions, is it even possible to =
be called
with a NULL struct acpi_device *?

--=20
Darren Hart
Intel Open Source Technology Center
