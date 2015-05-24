From: Valdis.Kletnieks@vt.edu
Subject: Re: [PATCH v3 2/3] dell-rbtn: Export notifier for other kernel modules
Date: Sun, 24 May 2015 01:07:36 -0400
Message-ID: <220947.1432444056@turing-police.cc.vt.edu>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com> <1431600868-11737-3-git-send-email-pali.rohar@gmail.com> <CAKdAkRRHZc3qk=gz7_KUwCNJup54gAjdmFn+V0=hQJ-bqkrWsA@mail.gmail.com>
            <201505230305.50655@pali>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1432444056_2099P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from omr1.cc.vt.edu ([198.82.141.52]:42485 "EHLO omr1.cc.vt.edu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751312AbbEXFIm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 24 May 2015 01:08:42 -0400
In-Reply-To: Your message of "Sat, 23 May 2015 03:05:50 +0200."
             <201505230305.50655@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@linux.intel.com>

--==_Exmh_1432444056_2099P
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, 23 May 2015 03:05:50 +0200, Pali Roh=E1r said:

> I'm thinking about using symbol_request() in dell-laptop.c (instead har=
d=3D20
> dependency) and then not ignoring error here... It could fix this=3D20
> problem.

That would also address the problem of a build
that has DELL_LAPTOP=3D=5Bym=5D but DELL_RBTN=3Dn.

--==_Exmh_1432444056_2099P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: Exmh version 2.5 07/13/2001

iQIVAwUBVWFcmAdmEQWDXROgAQK+2BAAuRMszm4hQ1qc1gpQ1RGRkojNFlkuXS2f
ZPsSDldc0nfEI/1ox93YYloKAnJ7VPv7yxAXflwlcJi1JQA45+803mCxEBmcidQ+
UzoqOAoLIkJOma5K5jqjdACiJIUFYNySj6H9SHjeKKp02qvimt7OwLA++uTSG46o
TbwfdyTtzCSKftwxUo82ZC8luKUjAi0uquh5dIC2rKyMPpdBX++7TCtL1+DOkErG
tIbJsORsu40JVIove06oDTqBT16AsIJOZgHUnItDF1jCpI7Ez9IRng9Nsyj5GGsn
WTKcoE2y8Cn7oPn4rt+CnkJ16l9P5UjuYTs456fpOHRyXVBoEuCB+Ps8VOXBM+cf
m14WiRCsLMt3OytPsOLFM8TxocF6pC7/8cVmx+5f9c8TJcORiyq8Y4JyFrqLorfS
hVZAxaXgb9pVoTdJMe6fsuGK6MXn6s39bcxewERN/grP3yYB9tcRIugEgiQ9IRhp
pvJqYE98mW7JbU1VgNNVqm6CTNw64eNDlRN/yXNZ28CUW+FUDpcIbLz1ydhwKUO0
2js6IZNkv0M9ge/T1cV8/gkBddh6VllnAo7g9jJ20Jxgd9dRaWEvYa4TGbd1JBL0
XDDoEl7TGrwyXywwJ9fLrAei0y/x+XiTtD3FURkkQVpdDzlbLxGnpBhT19o2OmSr
GDnYbi9DZNQ=
=QXl7
-----END PGP SIGNATURE-----

--==_Exmh_1432444056_2099P--
