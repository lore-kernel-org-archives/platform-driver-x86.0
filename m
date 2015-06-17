From: Darren Hart <dvhart@infradead.org>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Tue, 16 Jun 2015 20:43:34 -0700
Message-ID: <20150617034334.GB29788@vmdeb7>
References: <201506141105.07171@pali>
 <20150615211816.GC16138@dhcp22.suse.cz>
 <201506152327.59907@pali>
 <20150616063346.GA24296@dhcp22.suse.cz>
 <20150616071523.GB5863@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57481 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751095AbbFQDnr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Jun 2015 23:43:47 -0400
Content-Disposition: inline
In-Reply-To: <20150616071523.GB5863@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Michal Hocko <mhocko@suse.cz>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org

On Tue, Jun 16, 2015 at 09:15:23AM +0200, Pali Roh=E1r wrote:
> On Tuesday 16 June 2015 08:33:46 Michal Hocko wrote:
> > On Mon 15-06-15 23:27:59, Pali Roh=E1r wrote:
> > > On Monday 15 June 2015 23:18:16 Michal Hocko wrote:
> > > > On Sun 14-06-15 11:05:07, Pali Roh=E1r wrote:
> > > > > Hello,
> > > > >=20
> > > > > in drivers/platform/x86/dell-laptop.c is this part of code:
> > > > >=20
> > > > > static int __init dell_init(void)
> > > > > {
> > > > > ...
> > > > >=20
> > > > > 	/*
> > > > > =09
> > > > > 	 * Allocate buffer below 4GB for SMI data--only 32-bit physi=
cal
> > > > > 	 addr * is passed to SMI handler.
> > > > > 	 */
> > > > > =09
> > > > > 	bufferpage =3D alloc_page(GFP_KERNEL | GFP_DMA32);
> > > >=20
> > > > [...]
> > > >=20
> > > > > 	buffer =3D page_address(bufferpage);
> > > >=20
> > > > [...]
> > > >=20
> > > > > fail_rfkill:
> > > > > 	free_page((unsigned long)bufferpage);
> > > >=20
> > > > This one should be __free_page because it consumes struct page*=
 and
> > > > it is the proper counter part for alloc_page. free_page, just t=
o
> > > > make it confusing, consumes an address which has to be translat=
ed to
> > > > a struct page.
> > > >=20
> > > > I have no idea why the API has been done this way and yeah, it =
is
> > > > really confusing.
> > > >=20
> > > > [...]
> > > >=20
> > > > > static void __exit dell_exit(void)
> > > > > {
> > > > > ...
> > > > >=20
> > > > > 	free_page((unsigned long)buffer);
> > >=20
> > > So both, either:
> > >=20
> > >  free_page((unsigned long)buffer);
> > >=20
> > > or
> > >=20
> > >  __free_page(bufferpage);
> > >=20
> > > is correct?
> >=20
> > Yes. Although I would use __free_page variant as both seem to be
> > globally visible.
> >=20

Michal - thanks for the context.

I'm surprised by your recommendation to use __free_page() out here in p=
latform
driver land.

I'd also prefer that the driver consistently free the same address to a=
void
confusion.

=46or these reasons, free_page((unsigned long)buffer) seems like the be=
tter
option.

Can you elaborate on why you feel __free_page() is a better choice?

--=20
Darren Hart
Intel Open Source Technology Center
