From: Mark D Rustad <mrustad@gmail.com>
Subject: Re: [PATCH V4 2/3] mfd: Intel Platform Monitoring Technology support
Date: Wed, 29 Jul 2020 15:59:37 -0700
Message-ID: <3DCA0A88-0890-49EE-8644-E6311E891C55@gmail.com>
References: <20200714062323.19990-1-david.e.box@linux.intel.com>
 <20200717190620.29821-3-david.e.box@linux.intel.com>
 <20200728075859.GH1850026@dell>
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Content-Type: multipart/signed;
        boundary="Apple-Mail=_7DE39EFC-2EDC-4C73-8668-B39BBF04D3AF";
        protocol="application/pgp-signature";
        micalg=pgp-sha256
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200728075859.GH1850026@dell>
Sender: linux-pci-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: "David E. Box" <david.e.box@linux.intel.com>, dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com, alexander.h.duyck@linux.intel.com, linux-kernel <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org


--Apple-Mail=_7DE39EFC-2EDC-4C73-8668-B39BBF04D3AF
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii;
	delsp=yes;
	format=flowed

at 12:58 AM, Lee Jones <lee.jones@linaro.org> wrote:

> If you do:
>
> 	do {
> 		int pos;
>
> 		pos = pci_find_next_ext_capability(pdev, pos, PCI_EXT_CAP_ID_DVSEC);
> 		if (!pos)
> 			break;
>
> Then you can invoke pci_find_next_ext_capability() once, no?

Part of your suggestion here won't work, because pos needs to be  
initialized to 0 the first time. As such it needs to be declared and  
initialized outside the loop. Other than that it may be ok.

--
Mark Rustad, MRustad@gmail.com


--Apple-Mail=_7DE39EFC-2EDC-4C73-8668-B39BBF04D3AF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEE6ug8b0Wg+ULmnksNPA7/547j7m4FAl8h/1kACgkQPA7/547j
7m5rPg/+PLg09fE2ihUlYc2tfxKI2OFvTYSVtj9/VzXoB+mGfkYbu6pvuo7TQxFJ
EiKXeHRVk8X0b5fRitc+bfOh6Pnv5UomQBGlJ913QE9Z7ihTXIgqgehYGE2rUgXI
c32yapNDuH5O+HcM1o2er+iBPkAZVTLvEbIss82F32QLFsDtouy0ZtlYL3hNE/9B
eNW9PFKKoJ04uJwL31jM51jv/pZESGxaZljUDFEOmScsTg28KyBe1DwrXKFEUwyF
ItlBTaY1AZ7rPktbJZUEuRXpjG5ryCfk+m3GU6CDwW/+bFTYNEJaEKA2IN6PqeHY
FUltSWLSktecZqE49VTmlpfFiw+iTCOc7LnhzaV5S6HZRv8e3YGf/emqtsFs3NWY
TkEAdOkNBpp+LF06Z0kkqHQfLiVG9sFv7WecHxYzJg5R9g3NM3e6H5B2B5gDre7V
2Z5K0aJj+XfPAkyUR0qF5rJDkhjHM9BsPsEZecX7Bi8mh70eLFhI0FjCnEqrqlEc
T9muHDC4bILxgm+42CJ+LuAyARt9q1v41hu47JuqLJEw1IetTaj8CptwRfMt1d6a
jHmST0dxpYqjnHIZJetE3GmZeRe0UCb3J0OY+aXb0b9yNiBl8lC4XhiFQxQ1xKzJ
LMVCGyobQ2oISbAW17Y0BtyN/C3XvK505BqXGrcM5RXrG//1zeo=
=hBk9
-----END PGP SIGNATURE-----

--Apple-Mail=_7DE39EFC-2EDC-4C73-8668-B39BBF04D3AF--
