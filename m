From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Allocate buffer on heap
 rather than globally
Date: Wed, 31 Jan 2018 18:06:39 +0100
Message-ID: <20180131170639.fhmodmamu4mi6ubw@pali>
References: <1517331540-13266-1-git-send-email-mario.limonciello@dell.com>
 <20180130171745.i5wwcwr4qdbcoxhm@pali>
 <CAHp75VcqCdEQjUCoSGz87Mb3HFomfOwKWxC7S2CjtqSAZQEpsA@mail.gmail.com>
 <20180131090758.v6eyj35gymlfyzhk@pali>
 <bb29662337484ad8bd2350e6b68133d3@ausx13mpc120.AMER.DELL.COM>
 <CAHp75VcqYgDCTPqjn9F1SpAbamgPk8B7s4zYAb8csD8oFpLihw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="zmcmku37yuvk4ibo"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35792 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752840AbeAaRGm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 31 Jan 2018 12:06:42 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VcqYgDCTPqjn9F1SpAbamgPk8B7s4zYAb8csD8oFpLihw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Mario Limonciello <Mario.Limonciello@dell.com>, Darren Hart <dvhart@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>


--zmcmku37yuvk4ibo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wednesday 31 January 2018 18:53:19 Andy Shevchenko wrote:
> On Wed, Jan 31, 2018 at 6:46 PM,  <Mario.Limonciello@dell.com> wrote:
>=20
> >> > for allocation: ..._alloc_request()
> >> > for filling: _fill_request() / _prepare_request()
> >> >
> >> > or alike.
> >> >
> >> > _set_arguments() not good enough to me.
> >>
> >> Ok. Then we need to stick with 5 arguments... What about name
> >> dell_fill_request()? E.g.
> >>
> >>   struct calling_interface_buffer buffer;
> >>   dell_fill_request(&buffer, 0x2, 0, 0, 0);
> >>   ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> >>
> >
> > The other alternative is to just define the input of the structure imme=
diately with
> > an initializer, no multi argument filler function.  Like this:
>=20
> Either would work for me, though one comment below.
>=20
> > -       struct calling_interface_buffer buffer;
>=20
>=20
> > +       struct calling_interface_buffer buffer =3D {CLASS_INFO,
> > +                                                 SELECT_RFKILL,
> > +                                                 {0, 0, 0, 0},
> > +                                                 {0, 0, 0, 0}};
>=20
> Looking to this approach I would rather provide a macro then.
>=20
> #define FILL_REQUEST(a,b,c,d,...) \ // variant FILL_RFKILL_REQUEST(a,b,c,=
d)
> (struct calling_interface_buffer) { \
>  ... \
> }
>=20
> But then it is macro(s) vs. function(s) debate.

Does not matter, I'm fine with either macro or function.

>=20
> > -       dell_set_arguments(&buffer, 0, 0, 0, 0);
> > -       ret =3D dell_send_request(&buffer, CLASS_INFO, SELECT_RFKILL);
> > +       ret =3D dell_send_request(&buffer);
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--zmcmku37yuvk4ibo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCWnH3nQAKCRCL8Mk9A+RD
Ukw5AKCeM9CnuEE8G6Nwv+vYrCYHPOtq4QCgu7hC/v93/fhplaiVR1WUY4+Foiw=
=Ymjo
-----END PGP SIGNATURE-----

--zmcmku37yuvk4ibo--
