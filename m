From: Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH 2/2] ACER: Add support for ambient light sensor
Date: Wed, 06 Jun 2012 09:22:35 +0800
Message-ID: <1338945755.1492.20.camel@rui.sh.intel.com>
References: <1338570683-16491-1-git-send-email-marex@denx.de>
	 <201206041914.00536.marex@denx.de>
	 <CAHR064jYAFd06VYZvi90xZCyJCKEmEdKkmrim9mEn584CqRmzw@mail.gmail.com>
	 <201206060055.59421.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:14744 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752203Ab2FFBVE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Jun 2012 21:21:04 -0400
In-Reply-To: <201206060055.59421.marex@denx.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, joeyli <jlee@suse.com>, Len Brown <len.brown@intel.com>, pavel@denx.de

On =E4=B8=89, 2012-06-06 at 00:55 +0200, Marek Vasut wrote:
> Dear Corentin Chary,
>=20
> [...]
>=20
> > >> This is a generic device, and should be handled by ACPI core
> > >> (Samsung laptop have this too). See "ACPI ALS" on linux-acpi.
> > >=20
> > > Saying this would be enough. Lee explained to me what this ACPI00=
08
> > > means, I'm quite new to the ACPI land so pardon my ignorance here=
=2E But
> > > it then boils down to Lee's question, why wasn't the patch for AC=
PI ALS
> > > that was already proposed accepted? And what can be done to get i=
t in?
> >=20
> > Yep, I've seen Lee's message latter. Regarding ACPI ALS status, it =
was
> > forgotten for a long time, and recently Zhang Rui told that he will
> > take another look at it, but nothing sure. If you want to know more
> > about the status, you can do a quick search on gmane using "ACPI AL=
S"
> > query on linux.acpi
>=20
> Actually, going through the ACPI0008 patch, I see it introduced new s=
ysfs class.=20
> Maybe we should rather integrate it with Linux-IIO these days?
>=20
yes.
please refer to this thread
http://marc.info/?l=3Dlinux-acpi&m=3D132060809120911&w=3D2

I do not have time to do this right now, and it will be great if you ar=
e
interested in introducing the ACPI ALS driver.

thanks,
rui
