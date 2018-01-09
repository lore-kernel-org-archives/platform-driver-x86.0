From: Matthew Thode <mthode@mthode.org>
Subject: Re: platform/x86: thinkpad_acpi: unhandled HKEY 0x60b0 and 0x60b1
Date: Tue, 9 Jan 2018 14:24:48 -0600
Message-ID: <20180109202448.zd63xjr3hth4tzru@mthode.org>
References: <CANq1E4Q55Z9WZ1qPhpmbtXGLb2oPcVst2Xo3YLnxtbt6d6WK_Q@mail.gmail.com>
 <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="wahxay6nqkydiyjj"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.mthode.org ([216.82.208.22]:36988 "EHLO mx1.mthode.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751513AbeAIUeZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Jan 2018 15:34:25 -0500
Content-Disposition: inline
In-Reply-To: <CAHp75VfPR2Aj3ucmsoNtiJ96UBRzg+y6nCfU3d3ZuJZE5pUehg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: David Herrmann <dh.herrmann@gmail.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>


--wahxay6nqkydiyjj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18-01-09 22:16:10, Andy Shevchenko wrote:
> +Cc: Mattew, who is an author of the patch I posted link to which earlier.
>=20
> On Tue, Jan 9, 2018 at 3:19 PM, David Herrmann <dh.herrmann@gmail.com> wr=
ote:
> > Hi
> >
> > The thinkpad_acpi driver constantly reports about unhandled events on
> > my ThinkPad X1 5gen. The logs look like this:
> >
> > kernel: thinkpad_acpi: unknown possible thermal alarm or keyboard event=
 received
> > kernel: thinkpad_acpi: unhandled HKEY event 0x60b1
> > kernel: thinkpad_acpi: please report the conditions when this event
> > happened to ibm-acpi-devel@...
> >
> > kernel: thinkpad_acpi: unknown possible thermal alarm or keyboard event=
 received
> > kernel: thinkpad_acpi: unhandled HKEY event 0x60b0
> > kernel: thinkpad_acpi: please report the conditions when this event
> > happened to ibm-acpi-devel@...
> >
> > I have no clue what triggers them. However, the 0x60b1 event seems to
> > notify about some kind of action, and 0x60b0 seems to notify about its
> > end (like FAN-START, and FAN-STOP). The 0x60b0 follows 0x60b1 usually
> > in a timespan between 1s-10s.
> >
> > The event occurs even when the laptop is not moved/touched, but only
> > performs random computations. The first time this occurs is usually
> > during user-space startup, which might just be the time the module is
> > loaded. So far, I did not see any other event occurring before/after
> > it, which might give any hints.
> >
> > What is the recommended way to deal with that? I am having a hard-time
> > figuring out what triggers it, but at the same time it spams the
> > system-logs to a degree that after 1h of uptime, the vast majority of
> > the system log is cluttered with those messages.
> >
> > I can provide a patch to ignore these events in the driver? Or does
> > anyone have access to Lenovo developers to ask for help?
> >

I've been able to trigger it 'at will' on the X1C5.  If I hover my hand
just below the arrow keys I'll get the first signal, after I take it
away I get the second one.  There seems to be a delay in when I put (or
take away) my hand to prevent spamming the logs even more.  It could be
to sense lid close, but there's already another sensors for that I
thought.  The only remaining thing I can guess it that it's to detect
your hands to turn on the keyboard backlight or something.

I don't think it's related at all to the fingerprint sensor as I hover
my hand to the right of it.

--=20
Matthew Thode

--wahxay6nqkydiyjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEExFR3cOKGRpGbcMHPZKN76q4ZpOgFAlpVJQ8ACgkQZKN76q4Z
pOj31w//Sufady3sjcxEY71SccvMunEZ3/U6aCFTdpj5wIDcJmoyyqTGNesvVms8
BRucly+bXqV/msvfWUzqpjMIce4LdwPxcUO+teCHkrxaLY8Ku5/xP/sGNPL5GKRc
psfJcykXUON6SKKWSGXVnzv7aGzN18DFRIPtknQs1jnmpcJrGQXJe5+fASnmvPPH
y2a+k3o4BuIlrIxIgsuDc+5OKcqZpxCG5W/qyuXzKWP//QrRA+Oo4ih/xj7IRd1Y
/pQpfK8K5AETAwMa9QeeeyY2DKTZyRo2LeUd6O5JjI18SnLpp96PbIXg/5tG9YTQ
CaaEQ2vsaDG4a0gaYVnp2VyJ2nvL/TtrJ2JIlRyqOnKkttPKE4/vcL80048PUhTU
vz/nv1kiD6zif31dKgHu3VcX9ptQPog36Di/4GT0gyknSZ8nvf6GxtvsH5a3RNtB
EoqMBL6el8id3/42ztYqvUChz2HLv2B+YyiZWx61vGfqP8Ha0/MRVOnKa4aME03/
YVogBKBeQFFgNjeetrijdl4UIi/4xlSDLmYaEZqQIK78hTNf/ypxdzQFUZApb1Ip
UWmvBkvjhp20pUHzjUWEMrqYYwAPptzh+hUmh5ol5ciP/oYAgy4CU7/Tbbc+4qee
R7Dz9qe8Quzgp5r1JNnHohUFPmN+gyh4lQGcFP2c/s++uRMp1jE=
=1mmH
-----END PGP SIGNATURE-----

--wahxay6nqkydiyjj--
