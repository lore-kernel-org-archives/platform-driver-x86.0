From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH v10 13/15] platform/x86: wmi: create userspace interface
 for drivers
Date: Fri, 20 Oct 2017 13:54:36 +0000
Message-ID: <19e30ca305e449de86b702ae8900d306@ausx13mpc120.AMER.DELL.COM>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <175838453318108ae69be344c4d3a2b75c2edc69.1508434514.git.mario.limonciello@dell.com>
 <20171020132138.GA23973@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from esa7.dell-outbound.iphmx.com ([68.232.153.96]:42300 "EHLO
        esa7.dell-outbound.iphmx.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750960AbdJTNyi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Oct 2017 09:54:38 -0400
In-Reply-To: <20171020132138.GA23973@kroah.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: greg@kroah.com
Cc: dvhart@infradead.org, andy.shevchenko@gmail.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, luto@kernel.org, quasisec@google.com, pali.rohar@gmail.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, gnomes@lxorguk.ukuu.org.uk

> -----Original Message-----
> From: Greg KH [mailto:greg@kroah.com]
> Sent: Friday, October 20, 2017 8:22 AM
> To: Limonciello, Mario <Mario_Limonciello@Dell.com>
> Cc: dvhart@infradead.org; Andy Shevchenko <andy.shevchenko@gmail.com>;
> LKML <linux-kernel@vger.kernel.org>; platform-driver-x86@vger.kernel.org;=
 Andy
> Lutomirski <luto@kernel.org>; quasisec@google.com; pali.rohar@gmail.com;
> rjw@rjwysocki.net; mjg59@google.com; hch@lst.de; Alan Cox
> <gnomes@lxorguk.ukuu.org.uk>
> Subject: Re: [PATCH v10 13/15] platform/x86: wmi: create userspace interf=
ace for
> drivers
>=20
> On Thu, Oct 19, 2017 at 12:50:16PM -0500, Mario Limonciello wrote:
> > +	wblock =3D container_of(wdev, struct wmi_block, dev);
> > +	if (!wblock)
> > +		return -ENODEV;
>=20
> How can container_of() ever return NULL?  If so, you have a very odd
> memory layout...
>=20

I'm assuming this is from set_required_buffer_size right?

The symbol is exported out for other drivers to use.  It's possible for ano=
ther
driver to allocate a wmi_device structure that's not part of a wblock.

> > +	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
> > +		wdriver =3D container_of(wblock->dev.dev.driver,
> > +					struct wmi_driver, driver);
> > +		if (!wdriver)
> > +			continue;
>=20
> Same here.  And other places in this file.
>=20

This one it's possible that a driver isn't bound to a device, and when
that happens wdriver is NULL.
