From: Darren Hart <dvhart@infradead.org>
Subject: Re: Possible broken MM code in dell-laptop.c?
Date: Mon, 15 Jun 2015 13:36:45 -0700
Message-ID: <20150615203645.GD83198@vmdeb7>
References: <201506141105.07171@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:32876 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752160AbbFOUgw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Jun 2015 16:36:52 -0400
Content-Disposition: inline
In-Reply-To: <201506141105.07171@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Stuart Hayes <stuart_hayes@dell.com>, Matthew Garrett <mjg@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.cz>, platform-driver-x86@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org

On Sun, Jun 14, 2015 at 11:05:07AM +0200, Pali Roh=E1r wrote:
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
> 	if (!bufferpage) {
> 		ret =3D -ENOMEM;
> 		goto fail_buffer;
> 	}
> 	buffer =3D page_address(bufferpage);
>=20
> 	ret =3D dell_setup_rfkill();
>=20
> 	if (ret) {
> 		pr_warn("Unable to setup rfkill\n");
> 		goto fail_rfkill;
> 	}
> ...
> fail_rfkill:
> 	free_page((unsigned long)bufferpage);
> fail_buffer:
> ...
> }
>=20
> Then there is another part:
>=20
> static void __exit dell_exit(void)
> {
> ...
> 	free_page((unsigned long)buffer);

I believe you are correct, and this should be bufferpage. Have you obse=
rved any
failures?

--=20
Darren Hart
Intel Open Source Technology Center
