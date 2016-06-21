From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH][v2] dell-wmi: add a WMI event code for display on/off
Date: Tue, 21 Jun 2016 09:24:29 -0700
Message-ID: <20160621162429.GB3685@f23x64.localdomain>
References: <1466135067-28566-1-git-send-email-alex.hung@canonical.com>
 <201606172050.27278@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:39891 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751665AbcFUQYb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jun 2016 12:24:31 -0400
Content-Disposition: inline
In-Reply-To: <201606172050.27278@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Alex Hung <alex.hung@canonical.com>, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org

On Fri, Jun 17, 2016 at 08:50:27PM +0200, Pali Roh=E1r wrote:
> On Friday 17 June 2016 05:44:27 Alex Hung wrote:
> > @@ -133,6 +133,9 @@ static const struct key_entry
> > dell_wmi_keymap_type_0000[] __initconst =3D { /* Audio panel key */
> >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> >=20
> > +	/* Monitor On/Off Control key */
> > +	{ KE_KEY, 0xe027, { KEY_DISPLAYTOGGLE } },
>=20
> Darren, I would suggest small alignment (as for 0xe026):

Done.

>=20
>    	{ KE_KEY,    0xe027, { KEY_DISPLAYTOGGLE } },
>=20
> >  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
>=20
> --=20
> Pali Roh=E1r
> pali.rohar@gmail.com



--=20
Darren Hart
Intel Open Source Technology Center
