From: valdis.kletnieks@vt.edu
Subject: Re: wmi: usercopy: Kernel memory overwrite attempt detected to spans multiple pages (offset 0, size 4104)
Date: Sun, 17 Jun 2018 19:03:33 -0400
Message-ID: <134035.1529276613@turing-police.cc.vt.edu>
References: <1529182886.3450.3.camel@gmail.com> <1529186697.2784.2.camel@gmail.com> <CAGXu5jLwA37YJWi50i7bQZ6N7MtctvbXjsVg337zgD11AQ=9SA@mail.gmail.com>
 <1529263827.6069.4.camel@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1529276613_2593P";
         micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1529263827.6069.4.camel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mihai =?UTF-8?Q?Don=C8=9Bu?= <mihai.dontu@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, LKML <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

--==_Exmh_1529276613_2593P
Content-Type: text/plain; charset=us-ascii

On Sun, 17 Jun 2018 22:30:27 +0300, Mihai Donțu said:

> Your patch works OK for me, thank you. The libsmbios tool, however, not
> so much. It appears to be behind latest developments.
>
> # echo "+keyboard" >/sys/class/leds/dell\:\:kbd_backlight/start_triggers
>
> is all that is needed today.

If you're ever in this remote corner of southwest Virginia, I owe you a beverage.
I was going bonkers trying to figure out why my Dell Latitude's keyboard no
longer had a backlight... (and wondering if I was going to need to replace it
*again* - this laptop is 5 years old and on its third keyboard already)

--==_Exmh_1529276613_2593P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Comment: Exmh version 2.8.0 04/21/2017

iQEVAwUBWyboxY0DS38y7CIcAQJLhAf/RLIjU2o0G7Sm3G6zK1mMNewF9a4LOls+
eZUpQC6fZB5g+x+xP4+fontc7czdeNQZBkW61Pl9jbRVrOALkvYpoiGHn8EnjxrA
jW7H6wisfZ4xDbo97CS2GpP/pwadgTffPzdABpylo51sh3UWvdYNOMtMlZQL+MSP
fNf8ea1sv6dvVZjQNv2spgLLAL5fcG30V0KPDXtv5tWPGDTSoI2F2KgPA1wArgUr
pevvcZI2AyRW5sLQTNUMtDLdvSZTuVy4pFT2eHEoRyMHmnCvqELoN8d9v/aqrDpt
Ueca6oDYO30BzKAqKYI3K9bicCWpS6JlKn4juPvJeKL9LFJM31fVVQ==
=cdug
-----END PGP SIGNATURE-----

--==_Exmh_1529276613_2593P--
