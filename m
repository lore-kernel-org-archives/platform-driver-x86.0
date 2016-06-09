From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 4/4] dell-wmi: Rework code for generating sparse
 keymap and processing WMI events
Date: Thu, 9 Jun 2016 13:27:21 +0200
Message-ID: <20160609112721.GA2461@eudyptula.hq.kempniu.pl>
References: <1465342347-20635-1-git-send-email-pali.rohar@gmail.com>
 <1465342347-20635-5-git-send-email-pali.rohar@gmail.com>
 <20160608225032.GL28348@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35272 "EHLO
	mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752352AbcFIL10 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Jun 2016 07:27:26 -0400
Received: by mail-wm0-f52.google.com with SMTP id v199so102895818wmv.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jun 2016 04:27:25 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160608225032.GL28348@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > -		case 0x10:
> > -			/* Keys pressed */
> > +		case 0x0010:
> > +			/* Sequence of keys pressed */
> >  			for (i =3D 2; i < len; ++i)
> > -				dell_wmi_process_key(buffer_entry[i]);
> > +				dell_wmi_process_key(0x0010, buffer_entry[i]);
> >  			break;
> > -		case 0x11:
> > -			for (i =3D 2; i < len; ++i) {
> > -				switch (buffer_entry[i]) {
> > -				case 0xfff0:
> > -					/* Battery unplugged */
> > -					pr_debug("Battery unplugged\n");
> > -					break;
> > -				case 0xfff1:
> > -					/* Battery inserted */
> > -					pr_debug("Battery inserted\n");
> > -					break;
> > -				case 0x01e1:
> > -				case 0x02ea:
> > -				case 0x02eb:
> > -				case 0x02ec:
> > -				case 0x02f6:
> > -					/* Keyboard backlight level changed */
> > -					pr_debug("Keyboard backlight level "
> > -						 "changed\n");
> > -					break;
> > -				default:
> > -					/* Unknown event */
> > -					pr_info("Unknown WMI event type 0x11: "
> > -						"0x%x\n", (int)buffer_entry[i]);
> > -					break;
> > -				}
> > -			}
> > +		case 0x0011:
> > +			/* Sequence of events occurred */
> > +			for (i =3D 2; i < len; ++i)
> > +				dell_wmi_process_key(0x0011, buffer_entry[i]);
>=20
> Since this is identical to case 0x010, let's avoid the duplication of=
 code and
> handle this with a fall-through, like:
>=20
> 		case 0x0010:
> 		case 0x0011:
> 			/* Sequence of events occurred */
> 			for (i =3D 2; i < len; ++i)
> 				dell_wmi_process_key(buffer_entry[1], buffer_entry[i]);

I believe it was Pali's intention to make a distinction between keys
being pressed (0x0010) and other events occuring (0x0011), so perhaps a
comment after the first case label could be useful?

    case 0x0010:
        /* Sequence of keys pressed; fall through */
    case 0x0011:
        /* Sequence of events occurred */
        for (i =3D 2; i < len; ++i)
            dell_wmi_process_key(buffer_entry[1], buffer_entry[i]);

I'll leave it to Pali to decide, I'm just throwing in my two cents.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
