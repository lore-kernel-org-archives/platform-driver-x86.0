From: Michal Hocko <mhocko@suse.cz>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Tue, 16 Jun 2015 08:33:46 +0200
Message-ID: <20150616063346.GA24296@dhcp22.suse.cz>
References: <201506141105.07171@pali>
 <20150615211816.GC16138@dhcp22.suse.cz>
 <201506152327.59907@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40504 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751486AbbFPGdw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Jun 2015 02:33:52 -0400
Content-Disposition: inline
In-Reply-To: <201506152327.59907@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org

On Mon 15-06-15 23:27:59, Pali Roh=E1r wrote:
> On Monday 15 June 2015 23:18:16 Michal Hocko wrote:
> > On Sun 14-06-15 11:05:07, Pali Roh=E1r wrote:
> > > Hello,
> > >=20
> > > in drivers/platform/x86/dell-laptop.c is this part of code:
> > >=20
> > > static int __init dell_init(void)
> > > {
> > > ...
> > >=20
> > > 	/*
> > > =09
> > > 	 * Allocate buffer below 4GB for SMI data--only 32-bit physical
> > > 	 addr * is passed to SMI handler.
> > > 	 */
> > > =09
> > > 	bufferpage =3D alloc_page(GFP_KERNEL | GFP_DMA32);
> >=20
> > [...]
> >=20
> > > 	buffer =3D page_address(bufferpage);
> >=20
> > [...]
> >=20
> > > fail_rfkill:
> > > 	free_page((unsigned long)bufferpage);
> >=20
> > This one should be __free_page because it consumes struct page* and
> > it is the proper counter part for alloc_page. free_page, just to
> > make it confusing, consumes an address which has to be translated t=
o
> > a struct page.
> >=20
> > I have no idea why the API has been done this way and yeah, it is
> > really confusing.
> >=20
> > [...]
> >=20
> > > static void __exit dell_exit(void)
> > > {
> > > ...
> > >=20
> > > 	free_page((unsigned long)buffer);
>=20
> So both, either:
>=20
>  free_page((unsigned long)buffer);
>=20
> or
>=20
>  __free_page(bufferpage);
>=20
> is correct?

Yes. Although I would use __free_page variant as both seem to be
globally visible.

--=20
Michal Hocko
SUSE Labs
