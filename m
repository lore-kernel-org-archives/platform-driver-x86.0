From: Michal Hocko <mhocko@suse.cz>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Mon, 15 Jun 2015 23:18:16 +0200
Message-ID: <20150615211816.GC16138@dhcp22.suse.cz>
References: <201506141105.07171@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
Content-Disposition: inline
In-Reply-To: <201506141105.07171@pali>
Sender: owner-linux-mm@kvack.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart <dvhart@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun 14-06-15 11:05:07, Pali Roh=E1r wrote:
> Hello,
>=20
> in drivers/platform/x86/dell-laptop.c is this part of code:
>=20
> static int __init dell_init(void)
> {
> ...
> 	/*
> 	 * Allocate buffer below 4GB for SMI data--only 32-bit physical addr
> 	 * is passed to SMI handler.
> 	 */
> 	bufferpage =3D alloc_page(GFP_KERNEL | GFP_DMA32);
[...]
> 	buffer =3D page_address(bufferpage);
[...]
> fail_rfkill:
> 	free_page((unsigned long)bufferpage);

This one should be __free_page because it consumes struct page* and it
is the proper counter part for alloc_page. free_page, just to make it
confusing, consumes an address which has to be translated to a struct
page.

I have no idea why the API has been done this way and yeah, it is really
confusing.

[...]
> static void __exit dell_exit(void)
> {
> ...
> 	free_page((unsigned long)buffer);


--=20
Michal Hocko
SUSE Labs

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>
