From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] dell-wmi: Improve unknown hotkey handling
Date: Mon, 30 Nov 2015 10:27:38 -0800
Message-ID: <20151130182738.GA30553@malice.jf.intel.com>
References: <a19a018252f8352a5d22934c98fba2954e9b1c6c.1448069061.git.luto@kernel.org>
 <20151123194710.GJ24147@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54306 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754403AbbK3S1k (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 30 Nov 2015 13:27:40 -0500
Content-Disposition: inline
In-Reply-To: <20151123194710.GJ24147@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Mon, Nov 23, 2015 at 08:47:10PM +0100, Pali Roh=E1r wrote:
> On Friday 20 November 2015 17:27:00 Andy Lutomirski wrote:
> > +		if (keycode =3D=3D KEY_RESERVED) {
> > +			pr_info("firmware scancode %d maps to unrecognized keycode %d\n=
",
> > +				bios_entry->scancode, bios_entry->keycode);
> > +			continue;
> > +		}
>=20
> Please use "0x%x" instead "%d" for those scan and key codes. Other pa=
rts
> in driver use "0x%x" so that new info message could be more confused =
if
> it has decimal codes...
>=20
> With that fix, you can add my:
> Reviewed-by: Pali Roh=E1r <pali.rohar@gmail.com>

Andy, will you be resending with this change?

--=20
Darren Hart
Intel Open Source Technology Center
