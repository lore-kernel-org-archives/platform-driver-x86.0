From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/4] dell-wmi: Rework code for generating sparse
 keymap and processing WMI events
Date: Thu, 9 Jun 2016 12:59:46 -0700
Message-ID: <20160609195946.GO28348@f23x64.localdomain>
References: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
 <20160608225032.GL28348@f23x64.localdomain>
 <20160609112721.GA2461@eudyptula.hq.kempniu.pl>
 <201606091333.49010@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:48408 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750751AbcFIT7x (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Jun 2016 15:59:53 -0400
Content-Disposition: inline
In-Reply-To: <201606091333.49010@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 09, 2016 at 01:33:48PM +0200, Pali Roh=C3=A1r wrote:
> On Thursday 09 June 2016 13:27:21 Micha=C5=82 K=C4=99pie=C5=84 wrote:
> > > > -		case 0x10:
> > > > -			/* Keys pressed */
> > > > +		case 0x0010:
> > > > +			/* Sequence of keys pressed */
> > > >=20
> > > >  			for (i =3D 2; i < len; ++i)
> > > >=20
> > > > -				dell_wmi_process_key(buffer_entry[i]);
> > > > +				dell_wmi_process_key(0x0010, buffer_entry[i]);
> > > >=20
> > > >  			break;
> > > >=20
> > > > -		case 0x11:
> > > > -			for (i =3D 2; i < len; ++i) {
> > > > -				switch (buffer_entry[i]) {
> > > > -				case 0xfff0:
> > > > -					/* Battery unplugged */
> > > > -					pr_debug("Battery unplugged\n");
> > > > -					break;
> > > > -				case 0xfff1:
> > > > -					/* Battery inserted */
> > > > -					pr_debug("Battery inserted\n");
> > > > -					break;
> > > > -				case 0x01e1:
> > > > -				case 0x02ea:
> > > > -				case 0x02eb:
> > > > -				case 0x02ec:
> > > > -				case 0x02f6:
> > > > -					/* Keyboard backlight level changed */
> > > > -					pr_debug("Keyboard backlight level "
> > > > -						 "changed\n");
> > > > -					break;
> > > > -				default:
> > > > -					/* Unknown event */
> > > > -					pr_info("Unknown WMI event type 0x11: "
> > > > -						"0x%x\n", (int)buffer_entry[i]);
> > > > -					break;
> > > > -				}
> > > > -			}
> > > > +		case 0x0011:
> > > > +			/* Sequence of events occurred */
> > > > +			for (i =3D 2; i < len; ++i)
> > > > +				dell_wmi_process_key(0x0011, buffer_entry[i]);
> > >=20
> > > Since this is identical to case 0x010, let's avoid the duplicatio=
n
> > > of code and
> > >=20
> > > handle this with a fall-through, like:
> > > 		case 0x0010:
> > > 		case 0x0011:
> > > 			/* Sequence of events occurred */
> > > 			for (i =3D 2; i < len; ++i)
> > > 		=09
> > > 				dell_wmi_process_key(buffer_entry[1], buffer_entry[i]);
> >=20
> > I believe it was Pali's intention to make a distinction between key=
s
> > being pressed (0x0010) and other events occuring (0x0011), so perha=
ps
> > a comment after the first case label could be useful?
> >=20
> >     case 0x0010:
> >         /* Sequence of keys pressed; fall through */
> >     case 0x0011:
> >         /* Sequence of events occurred */
> >         for (i =3D 2; i < len; ++i)
> >             dell_wmi_process_key(buffer_entry[1], buffer_entry[i]);
> >=20
> > I'll leave it to Pali to decide, I'm just throwing in my two cents.
>=20
> Yes, that is truth, to visually distinguish between events and keys.

The proposed comment accomplishes that without the duplication of code.

--=20
Darren Hart
Intel Open Source Technology Center
