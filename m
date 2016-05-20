From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/2] dell-laptop: Expose auxiliary MAC address if
 available
Date: Fri, 20 May 2016 16:27:42 +0200
Message-ID: <20160520142742.GA29844@pali>
References: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com>
 <1462811099-16897-2-git-send-email-mario_limonciello@dell.com>
 <20160511133251.GA3440@eudyptula.hq.kempniu.pl>
 <201605111841.54411@pali>
 <3afbad44903b4da88b1362e938850da8@ausx13mpc120.AMER.DELL.COM>
 <20160512084033.GW29844@pali>
 <d6ad6268f43549f58efa41b5065b015e@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:37775 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932099AbcETO1q (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 May 2016 10:27:46 -0400
Content-Disposition: inline
In-Reply-To: <d6ad6268f43549f58efa41b5065b015e@ausx13mpc124.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@Dell.com
Cc: kernel@kempniu.pl, mjg59@srcf.ucam.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Thursday 12 May 2016 19:08:30 Mario_Limonciello@Dell.com wrote:
> > > We do mirror the information in ACPI under the system bus:
> > >
> > >     Scope (_SB)
> > >     {
> > >         Name (AMAC, Buffer (0x17)
> > >         {
> > >             "_AUXMAC_#847BEB5992D2#"
> > >         })
> > >     }
> > >
> > > I don't know how to properly access this from the kernel side.  I=
 noticed
> > that most drivers that reference ACPI nodes refer to devices, not s=
omething
> > hanging off the system bus.
> > > If you could advise the right way to go about that, I would appre=
ciate it.
> >=20
> > So there are two ways how to read that MAC address. One is via SMM =
and
> > one via ACPI.
>=20
> Yes, this isn't a general statement for read only static information,=
 but in this case it is true.
>=20
> > You can also read ACPI buffer (name is probably \_SB.AMAC) with ACP=
I
> > functions in kernel. Ask ACPI people, for correct API. I'm sure thi=
s is possible
> > also without creating new ACPI driver...
>=20
> Thanks will do.

I think that acpi_get_handle() and acpi_evaluate_object() methods are
those which you want to use.

> > > If I can access that, maybe it's better to do this directly as a =
patch to the
> > Ethernet driver in question (r8152).
> > > That's actually how it's handled on the OS side for Windows too f=
rom what I
> > understand.
> > > We have some FW bit set in them to indicate they're Dell Realtek =
products
> > (don't have this detail yet).
> > > When they see that bit they look for that ACPI buffer and use it =
to set the
> > MAC address the OS sees.
> >=20
> > Maybe it should be better to chose same way as Windows drivers? Bet=
ter
> > ask on netdev mailing list and ping maintainers of that ethernet dr=
iver what
> > they think about it.
> >=20
> > For me it sounds like a better solution (patching that ethernet dri=
ver) as
> > exporting some non-standard sysfs node from kernel with MAC address=
 and
> > then using another tool which send that MAC address back to kernel.
> >=20
>=20
> Great, thank you for your feedback.  I'll wander down that rabbit hol=
e.

Ok, CC me next discussion.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
