From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Tue, 16 Jun 2015 09:15:23 +0200
Message-ID: <20150616071523.GB5863@pali>
References: <201506141105.07171@pali>
 <20150615211816.GC16138@dhcp22.suse.cz>
 <201506152327.59907@pali>
 <20150616063346.GA24296@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f54.google.com ([74.125.82.54]:33086 "EHLO
	mail-wg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751818AbbFPHP1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Jun 2015 03:15:27 -0400
Content-Disposition: inline
In-Reply-To: <20150616063346.GA24296@dhcp22.suse.cz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Michal Hocko <mhocko@suse.cz>, Darren Hart <dvhart@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org

On Tuesday 16 June 2015 08:33:46 Michal Hocko wrote:
> On Mon 15-06-15 23:27:59, Pali Roh=C3=A1r wrote:
> > On Monday 15 June 2015 23:18:16 Michal Hocko wrote:
> > > On Sun 14-06-15 11:05:07, Pali Roh=C3=A1r wrote:
> > > > Hello,
> > > >=20
> > > > in drivers/platform/x86/dell-laptop.c is this part of code:
> > > >=20
> > > > static int __init dell_init(void)
> > > > {
> > > > ...
> > > >=20
> > > > 	/*
> > > > =09
> > > > 	 * Allocate buffer below 4GB for SMI data--only 32-bit physica=
l
> > > > 	 addr * is passed to SMI handler.
> > > > 	 */
> > > > =09
> > > > 	bufferpage =3D alloc_page(GFP_KERNEL | GFP_DMA32);
> > >=20
> > > [...]
> > >=20
> > > > 	buffer =3D page_address(bufferpage);
> > >=20
> > > [...]
> > >=20
> > > > fail_rfkill:
> > > > 	free_page((unsigned long)bufferpage);
> > >=20
> > > This one should be __free_page because it consumes struct page* a=
nd
> > > it is the proper counter part for alloc_page. free_page, just to
> > > make it confusing, consumes an address which has to be translated=
 to
> > > a struct page.
> > >=20
> > > I have no idea why the API has been done this way and yeah, it is
> > > really confusing.
> > >=20
> > > [...]
> > >=20
> > > > static void __exit dell_exit(void)
> > > > {
> > > > ...
> > > >=20
> > > > 	free_page((unsigned long)buffer);
> >=20
> > So both, either:
> >=20
> >  free_page((unsigned long)buffer);
> >=20
> > or
> >=20
> >  __free_page(bufferpage);
> >=20
> > is correct?
>=20
> Yes. Although I would use __free_page variant as both seem to be
> globally visible.
>=20

Michal, thank you for explaining this situation!

Darren, I will prepare patch which will fix code and use __free_page().

(Btw, execution on fail_rfkill label caused kernel panic)

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
