From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] Input: i8042 - Prevent intermixing i8042 commands
Date: Sat, 29 Aug 2020 09:47:58 +0200
Message-ID: <20200829074758.GA16838@amd>
References: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="BXVAT5kNtrzKuDFl"
Return-path: <linux-leds-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
Sender: linux-leds-owner@vger.kernel.org
To: Raul E Rangel <rrangel@chromium.org>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, Shirish.S@amd.com, Andy Shevchenko <andy@infradead.org>, Dan Murphy <dmurphy@ti.com>, Darren Hart <dvhart@infradead.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, "Lee, Chun-Yi" <jlee@suse.com>, Rajat Jain <rajatja@google.com>, Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-08-27 13:52:22, Raul E Rangel wrote:
> The i8042_mutex must be held by writers of the AUX and KBD ports, as
> well as users of i8042_command. There were a lot of users of
> i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
> This resulted in i8042_commands being issues in between PS/2
> transactions.
>=20
> This change moves the mutex lock into i8042_command and removes the
> burden of locking the mutex from the callers.
>=20
> It is expected that the i8042_mutex is locked before calling
> i8042_aux_write or i8042_kbd_write. This is currently done by the PS/2
> layer via ps2_begin_command and ps2_end_command. Other modules
> (serio_raw) do not currently lock the mutex, so there is still a
> possibility for intermixed commands.


> @@ -343,10 +330,14 @@ int i8042_command(unsigned char *param, int command)
>  	unsigned long flags;
>  	int retval;
> =20
> +	mutex_lock(&i8042_mutex);
> +
>  	spin_lock_irqsave(&i8042_lock, flags);
>  	retval =3D __i8042_command(param, command);
>  	spin_unlock_irqrestore(&i8042_lock, flags);
> =20
> +	 mutex_unlock(&i8042_mutex);
> +
>  	return retval;

There's something wrong with whitespace here. Checkpatch?
									Pavel
								=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--BXVAT5kNtrzKuDFl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl9KCC4ACgkQMOfwapXb+vLRLQCZAVRSNB7AWmLMpShfbIqQb9g7
e2kAn0k5vjeRzWluElrV5q2QcU+nhqJy
=TVRR
-----END PGP SIGNATURE-----

--BXVAT5kNtrzKuDFl--
