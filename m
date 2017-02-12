From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [ibm-acpi-devel] [PATCH 1/1] thinkpad_acpi: Add support for
 status (external cover) LED
Date: Sun, 12 Feb 2017 19:22:44 +0100
Message-ID: <20170212182244.imjewspnt32lkeq2@earth>
References: <20170119172132.36029-1-agoode@google.com>
 <CAOf41Nka4UNk_XUegEXAOHE-Xf0eOs71fuZgBKr0PHEL9sGyag@mail.gmail.com>
 <20170208010132.GB7028@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="oy2wn5k2swoe6kk7"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:46950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751217AbdBLSWw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Feb 2017 13:22:52 -0500
Content-Disposition: inline
In-Reply-To: <20170208010132.GB7028@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Adam Goode <agoode@google.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org


--oy2wn5k2swoe6kk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 07, 2017 at 11:01:32PM -0200, Henrique de Moraes Holschuh wrote:
> Hello Adam,
>=20
> I apologise for the delay on answering you.
>=20
> On Tue, 31 Jan 2017, Adam Goode wrote:
> > On Thu, Jan 19, 2017 at 12:21 PM, Adam Goode <agoode@google.com> wrote:
> > > This allows the control of the red status LED, which is the dot of th=
e "i"
> > > in the word "ThinkPad" on the outside cover of newer models.
> > >
> > > In the manual, both this LED and the power LED are referred to as
> > > the "system-status indicators" without distinction between the two, so
> > > I chose "status" as the LED name.
>=20
> I seem to recall this LED had an ACPI interface that was specific for
> it, and allowed it to on/off/sine-wave?

I don't know what the ACPI interface looks like, but the lid status
led goes into sine-wave mode during suspend. Note, that the power-led
also goes into sine-wave mode during suspend and is already supported
by thinkpad-acpi's LED code (without the sine-wave feature as far
as I can tell).

> > > Signed-off-by: Adam Goode <agoode@google.com>
> > >
> > > diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/=
x86/
> > > thinkpad_acpi.c
> > > index cacb43fb1df7..6577bf8e5635 100644
> > > --- a/drivers/platform/x86/thinkpad_acpi.c
> > > +++ b/drivers/platform/x86/thinkpad_acpi.c
> > > @@ -5611,11 +5611,11 @@ static const char * const
> > > tpacpi_led_names[TPACPI_LED_NUMLEDS] =3D {
> > >         "tpacpi::standby",
> > >         "tpacpi::dock_status1",
> > >         "tpacpi::dock_status2",
> > > -       "tpacpi::unknown_led2",
> > > +       "tpacpi::status",

"status" looks a bit generic. I suggest "external_lid_status".

> > >         "tpacpi::unknown_led3",
> > >         "tpacpi::thinkvantage",
> > >  };
> > > -#define TPACPI_SAFE_LEDS       0x1081U
> > > +#define TPACPI_SAFE_LEDS       0x1481U
>=20
> What happens on older Lenovo models (x00, x10, x20 series?)?  I think
> the T410 already had it...
>=20
> Also, please add code to not export it to userspace (as a led class) on
> IBM.

Adam, can you prepare an updated patch? I would like to use this
led to notify myself about events (i.e. compilation finished)
while my thinkpad's lid is closed.

-- Sebastian

--oy2wn5k2swoe6kk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAligp/EACgkQ2O7X88g7
+prxcg//SNfkwu1euSn9uBitIJThAc9eiqzc0FLhlkxBMxMqkSi1XQMZ1X1jQ9fq
xLsTDwnzpcp7TYXuu5Exh7ON5yNxpX0B813wA/lbNUkFNGUca+x4shj4Hqc3wIrR
94UCoa4z9eLglbVgmbTn/RBSLJTuwUqq0nqE2eLMPmA2iqtaWqsQBKtaKx8RPWW2
u0hd1alwo4YytPypmqfgBGstEJtDUecau6CL/BP97Cyz+6xEChVzw71vibQRAYns
dDd36SZ05EgFheDw4jbMhJGcC6psN/O8owkwpW5s9FM41MNGSjg9rRdSEiXixn4k
l8p9kUh5jK8qHLFE30L4xyhZjhy7MohO5sbm/3BOEzouqxJYOEc5RW+ptx+RhUIL
qy6zh7On8iqAacOUPY4OzhIsS1x0T7JnnnVQ1uhzRkR2us+UzfqTwHxRUdSJkaK4
QNuibg4Pt48KP8ZmxTEHrDqY5A7vmpGnJ0v9NBDLNbkGakQ8O0aQ2PBcyXbfjRR+
W3ZoZOMj4Ob19s4B54hQmGK3nZ0mY0kLnaAj4zxe3+Wl3Y+Z5WlB3QxG3wOpOXvI
8H19d7rkE3bUu5uV00TBiBxVodPh+Gt01UUAzsd2SFH0hQ3nWFViBiM8j5nvEl39
Pf9lCcxlc6GRjSUUzXNSYzGKuTTZcVwzCCft0sYaa+Xbm8m+M7Q=
=jpL/
-----END PGP SIGNATURE-----

--oy2wn5k2swoe6kk7--
