From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v10 13/15] platform/x86: wmi: create userspace      interface
 for drivers
Date: Fri, 20 Oct 2017 15:07:27 +0000
Message-ID: <c9ceac21e74b4b37b8393ab76bb2238f@ausx13mpc120.AMER.DELL.COM>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com>
 <20171020132138.GA23973@kroah.com>
 <19e30ca305e449de86b702ae8900d306@ausx13mpc120.AMER.DELL.COM>
 <20171020144839.GA4550@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171020144839.GA4550@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: hch@lst.de, greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, gnomes@lxorguk.ukuu.org.uk
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Christoph Hellwig [mailto:hch@lst.de]
> Sent: Friday, October 20, 2017 9:49 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: greg@kroah.com; dvhart@infradead.org; andy.shevchenko@gmail.com; linu=
x-
> kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; luto@kernel.=
org;
> quasisec@google.com; pali.rohar@gmail.com; rjw@rjwysocki.net;
> mjg59@google.com; hch@lst.de; gnomes@lxorguk.ukuu.org.uk
> Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace interf=
ace for
> drivers
>=20
> On Fri, Oct 20, 2017 at 01:54:36PM +0000, Mario.Limonciello@dell.com wrot=
e:
> > > -----Original Message-----
> > > From: Greg KH [mailto:greg@kroah.com]
> > > Sent: Friday, October 20, 2017 8:22 AM
> > > To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> > > Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>=
;
> > > LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.=
org;
> Andy
> > > Lutomirski <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.c=
om;
> > > rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Alan Cox
> > > <gnomes@lxorguk.ukuu.org.uk>
> > > Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace in=
terface
> for
> > > drivers
> > >
> > > On Thu, Oct 19, 2017 at 12:50:16PM -0500, Mario Limonciello wrote:
> > > > +	wblock =3D container_of(wdev, struct wmi_block, dev);
> > > > +	if (!wblock)
> > > > +		return -ENODEV;
> > >
> > > How can container_of() ever return NULL?  If so, you have a very odd
> > > memory layout...
> > >
> >
> > I'm assuming this is from set_required_buffer_size right?
> >
> > The symbol is exported out for other drivers to use.  It's possible for=
 another
> > driver to allocate a wmi_device structure that's not part of a wblock.
>=20
> container_of can never return NULL, it does arithmetics on a pointer
> based on the type it is embedded into.
>=20
> You better don't register a wmi_device that's not part of the block
> with your driver.  Which others drivers are those, btw?

No drivers do this today, it's obviously not a good idea.
I was just saying it's hypothetical.

I see that the other methods exported (wmi_evaluate_method and such) to dri=
vers=20
require that it's part of a wblock, so this seems like a reasonable expecta=
tion
from other drivers.  I'll remove this invalid check.

> > This one it's possible that a driver isn't bound to a device, and when
> > that happens wdriver is NULL.

=20
> See above, no it can't.  Maybe wblock->dev.dev.driver can be NULL,
> but in that case you must not call container_of on it.

> container_of() is just pointer math.  If you pass in NULL, you will get
> a non-NULL value (incremented or decremented).  If you pass in a very
> tiny number, you might get NULL, but that's still really wrong.
>=20
> In other words, these tests will _NEVER_ fail.  Go ahead, try it :)

I was seeing failures (with NULL) when I tested with some drivers unbound,=
=20
but I now understand my check is definitely wrong.  I'll adjust the check a=
nd make=20
sure it's valid.

Thank you both for your feedback here.
