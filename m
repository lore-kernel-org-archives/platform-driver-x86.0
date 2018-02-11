From: Eric Light <eric@ericlight.com>
Subject: Re: dell_wmi: Unknown key on Dell Latitude E6410
Date: Sun, 11 Feb 2018 19:19:21 +1300
Message-ID: <1518329961.4047166.1266765672.5C33A6A1@webmail.messagingengine.com>
References: <20180204120449.tyxpngr2bja7eg3a@pali>
 <d75833c799884f999c6b0f3886269f23@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:59123 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752647AbeBKGTW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Feb 2018 01:19:22 -0500
In-Reply-To: <d75833c799884f999c6b0f3886269f23@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario.Limonciello@dell.com, pali.rohar@gmail.com
Cc: platform-driver-x86@vger.kernel.org

Hi Mario,

Sorry for the slow reply.=20=20

I've only recently noticed the error messages, but I've never updated the B=
IOS on this laptop, so I assume it's always been happening.

Just checked, I'm running BIOS revision A01 (on a Latitude E6410).  I might=
 take the time to flash to a reasonably recent version  :)

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Tue, 6 Feb 2018, at 14:06, Mario.Limonciello@dell.com wrote:
> Eric,
>=20
> > -----Original Message-----
> > From: Pali Roh=C3=A1r [mailto:pali.rohar@gmail.com]
> > Sent: Sunday, February 4, 2018 6:05 AM
> > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > Cc: platform-driver-x86@vger.kernel.org; Eric Light <eric@ericlight.com>
> > Subject: dell_wmi: Unknown key on Dell Latitude E6410
> >=20
> > Hi Mario!
> >=20
> > Eric Light wrote me that on his Dell Latitude E6410 laptop, dell_wmi
> > prints following messages into dmesg at every boot.
> >=20
> > [   14.254258] dell_wmi: Unknown key with type 0x0011 and code 0xffd0 p=
ressed
> > [   14.254259] dell_wmi: Unknown WMI event type 0x12
> > [   14.487922] dell_wmi: Unknown key with type 0x0011 and code 0xffd1 p=
ressed
> > [   15.014983] dell_wmi: Unknown key with type 0x0011 and code 0x01e3 p=
ressed
> >=20
>=20
> It almost sounds to me like B2 table is missing entries.
>=20
> Is this a regression after a BIOS update?  Or it's always been this way?
>=20
> > Seems that in dell_wmi we are completely missing processing of WMI
> > events which starts with 0x0012 and then there are some unknown codes
> > 0xffd0 and 0xffd1.
> >=20
> > Do you have access to documentation what are those code at all? And what
> > is hidden behind WMI events which starts with 0x0012?
> >=20
> > Also Eric wrote me that pressing brightness up or down key generates
> > following events:
> >=20
> > Brightness Up:
> >=20
> > [ 1103.717988] dell_wmi: Unknown key with type 0x0011 and code 0xffae p=
ressed
> > [ 1103.717990] dell_wmi: Unknown key with type 0x0011 and code 0xff81 p=
ressed
> >=20
> > Brightness Down:
> >=20
> > [ 1157.078641] dell_wmi: Unknown key with type 0x0011 and code 0xffac p=
ressed
> > [ 1157.078644] dell_wmi: Unknown key with type 0x0011 and code 0xff80 p=
ressed
> >=20
> > For me it looks suspicious because why pressing one key generates those
> > two 0x0011 events and why next one is generated after 2-3s...
> >=20
> > I think the best way is to define all those events in dell_wmi to be
> > ignored (as I have not heard that brightness does not work), but it
> > would be a good idea to know we are going to ignore.
> >=20
> > --
> > Pali Roh=C3=A1r
> > pali.rohar@gmail.com
