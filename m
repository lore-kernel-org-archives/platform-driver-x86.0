From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 1/3] platform: x86: dell-rbtn: Dell Airplane Mode Switch
 driver
Date: Fri, 28 Nov 2014 13:54:57 +0200
Message-ID: <20141128115457.GT1304@lahna.fi.intel.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1416755361-17357-2-git-send-email-pali.rohar@gmail.com>
 <20141128113328.GS1304@lahna.fi.intel.com>
 <201411281245.55747@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201411281245.55747@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Nov 28, 2014 at 12:45:55PM +0100, Pali Roh=E1r wrote:
> Hello,
>=20
> I will fix all those style problems and add some comments.
>=20
> On Friday 28 November 2014 12:33:28 Mika Westerberg wrote:
> > > +	if (ACPI_FAILURE(status))
> > > +		return;
> > > +
> > > +	rfkill_set_states(rfkill, !output, !output);
> >=20
> > You can also write it like:
> >=20
> > 	if (ACPI_SUCCESS(status))
> > 		rfkill_set_states(rfkill, !output, !output);
> >=20
> > which looks better to me at least.
> >=20
>=20
> In whole module I'm using this style:
>=20
> f1();
> if (f1_failed)
> 	return;
> f2()
> if (f2_failed)
> 	return;
>=20
> So I would like not to change it for one function.

=46air enough.

> > > +}
> > > +
> > > +static int rbtn_set_block(void *data, bool blocked)
> > > +{
> > > +	/* FIXME: setting soft rfkill cause problems, so disable
> > > it for now */ +	return -EINVAL;
> > > +}
> > > +
> > > +struct rfkill_ops rbtn_ops =3D {
> >=20
> > static? const?
> >=20
>=20
> Yes, static const should be used.
>=20
> >=20
> > > +/*** module functions ***/
> > > +
> > > +static int __init rbtn_init(void)
> > > +{
> > > +	return acpi_bus_register_driver(&rbtn_driver);
> > > +}
> > > +
> > > +static void __exit rbtn_exit(void)
> > > +{
> > > +	acpi_bus_unregister_driver(&rbtn_driver);
> > > +}
> > > +
> > > +module_init(rbtn_init);
> > > +module_exit(rbtn_exit);
> >=20
> > module_acpi_driver()?
> >=20
>=20
> No, see PATCH 2/3.

Yeah, I noticed it after I wrote the comment.
