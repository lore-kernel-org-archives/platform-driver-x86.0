From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Tue, 16 Jun 2015 12:12:12 +0200
Message-ID: <20150616101211.GA25899@amd>
References: <201506141105.07171@pali>
 <20150615203645.GD83198@vmdeb7>
 <201506152242.30732@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:50824 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756497AbbFPKMP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 16 Jun 2015 06:12:15 -0400
Content-Disposition: inline
In-Reply-To: <201506152242.30732@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.cz>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org

On Mon 2015-06-15 22:42:30, Pali Roh=E1r wrote:
> On Monday 15 June 2015 22:36:45 Darren Hart wrote:
> > On Sun, Jun 14, 2015 at 11:05:07AM +0200, Pali Roh=E1r wrote:
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
> > > 	if (!bufferpage) {
> > > =09
> > > 		ret =3D -ENOMEM;
> > > 		goto fail_buffer;
> > > =09
> > > 	}
> > > 	buffer =3D page_address(bufferpage);
> > > =09
> > > 	ret =3D dell_setup_rfkill();
> > > =09
> > > 	if (ret) {
> > > =09
> > > 		pr_warn("Unable to setup rfkill\n");
> > > 		goto fail_rfkill;
> > > =09
> > > 	}
> > >=20
> > > ...
> > >=20
> > > fail_rfkill:
> > > 	free_page((unsigned long)bufferpage);
> > >=20
> > > fail_buffer:
> > > ...
> > > }
> > >=20
> > > Then there is another part:
> > >=20
> > > static void __exit dell_exit(void)
> > > {
> > > ...
> > >=20
> > > 	free_page((unsigned long)buffer);
> >=20
> > I believe you are correct, and this should be bufferpage. Have you
> > observed any failures?
>=20
> Rmmoding dell-laptop.ko works fine. There is no error in dmesg. I thi=
nk=20
> that buffer (and not bufferpage) should be passed to free_page(). So =
in=20
> my opinion problem is at fail_rfkill: label and not in dell_exit().

You seem to be right. Interface is strange...

alloc_pages() returns struct page *,
__free_pages() takes struct page *,
free_pages() takes unsinged long.

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses=
/blog.html
