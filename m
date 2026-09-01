Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029DE38D415
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276247; cv=none; b=Hbyf6M8MmweoJjwL1/Q+K+sVIwV6gQtT4LRJWjUof2CvYEg8rciUHLlynf92aTGTqzV9fDm328yFLnCKZjJw1Q1GaHwOXhpTJZVr40NVmFll0LFKPQERqt9Ss5ToUibzw4GstKcQbfaddOw4hP4c01OSTLo8lggurSyFOucW49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276247; c=relaxed/simple;
	bh=UmojlSheAV64LrmT3kln3La1H/0LyFhB+PKdJBZ9i1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOV/HBZRyd54Y4BvZKI2ClvMJ5CtzkVa6htKkqmBy+fVwTIkcIPl3s9t/5PhTdJvYnNH2tYj4YOJZsXmmPZhHkkdvqMAD28dpadDqUXfDT60FF+J1PjGnHA9ECxPrQP212EexZTv+zc1HkIU4B05+keHwBsCGWrFfP7MfREaHx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ybnjbt0c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ybnjbt0c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2841F00A3A;
	Tue,  1 Sep 2026 15:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276245;
	bh=ETXnEfS8sG1tSm7IJJnW5zDFtZj3Cd5bpgXHjk8Gnkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ybnjbt0c+SYCQrmbl6Ye8c0NIozrFxbqCPaMMaht1SibJxtQjTJ8KxvMjDMP5bq6B
	 3MTaK1gyJvL6ogmGxpuCQGOPmLRjAZD/yR6SibZDDgG8Djobljc/MEiNUNsZEAF/Q+
	 p2X4j9Z9m9wGQW7qes66ozRLi3uWUq5vSRoxxZfEMdp20rjKZyfEiYXjvrkLt5C7BW
	 5QPtsjM/01zZQNQ2MIuey2+hiiPZJ/n1lQAEpEKhulVVd3h5rgDawzsItPUOnEb51/
	 lRuUEqBvzojips4/vydMQ3cIaZEpC9gNo0DHR4ps2cRE4yD5Wghad+KY/agZ9rVVr8
	 KmokJzUucm01A==
Received: by venus (Postfix, from userid 1000)
	id 7F11D181B0C; Tue, 01 Sep 2026 17:24:03 +0200 (CEST)
Date: Tue, 1 Sep 2026 17:24:03 +0200
From: Sebastian Reichel <sre@kernel.org>
To: David Stephenson <git@davidstephenson.net>
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH] platform: arm64: thinkpad-t14s-ec: don't send
 KEY_KBDILLUMTOGGLE on Fn+Space
Message-ID: <apbt8k0IH2U28-Cm@venus>
References: <20260825193556.133277-1-git@davidstephenson.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5mbmsvvik7ninqyc"
Content-Disposition: inline
In-Reply-To: <20260825193556.133277-1-git@davidstephenson.net>


--5mbmsvvik7ninqyc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] platform: arm64: thinkpad-t14s-ec: don't send
 KEY_KBDILLUMTOGGLE on Fn+Space
MIME-Version: 1.0

Hi,

On Tue, Aug 25, 2026 at 07:36:21PM +0000, David Stephenson wrote:
> On the T14s, the EC already steps the keyboard backlight when you press
> Fn+Space: off, then low, then high.
>=20
> We report that change with t14s_kbd_bl_update() (brightness_hw_changed).
> We then also send KEY_KBDILLUMTOGGLE.
>=20
> The extra key is the problem. Desktops treat it as "please toggle the
> light." GNOME calls Keyboard.Toggle() and changes the LED itself. That
> fights the EC's three steps. The on-screen bar also stays empty,
> because Toggle() always returns 0%.
>=20
> thinkpad_acpi on x86 already skips the key when the firmware changed
> the light. It only uses brightness_hw_changed. Do the same here: keep
> the LED update, do not send KEY_KBDILLUMTOGGLE.
>=20
> Tested on a Lenovo ThinkPad T14s Gen 6 (21N1, Snapdragon X Elite) with
> GNOME. After this change the OSD bar tracks off / 50% / 100%.
>=20
> Signed-off-by: David Stephenson <git@davidstephenson.net>
> ---

Reviewed-by: Sebastian Reichel <sre@kernel.org>

Greetings,

-- Sebastian

>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-t14s.c
> index 5590302a5..22d20a907 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -488,8 +488,14 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void=
 *data)
>  	case T14S_EC_EVT_NONE:
>  		break;
>  	case T14S_EC_EVT_KEY_FN_SPACE:
> +		/*
> +		 * Firmware already cycles the keyboard backlight
> +		 * (off / low / high). Notify userspace through the LED
> +		 * class only. Emitting KEY_KBDILLUMTOGGLE as well makes
> +		 * desktop environments toggle the LED a second time.
> +		 */
>  		t14s_kbd_bl_update(ec);
> -		fallthrough;
> +		break;
>  	case T14S_EC_EVT_KEY_FN_F4:
>  	case T14S_EC_EVT_KEY_FN_F7:
>  	case T14S_EC_EVT_KEY_FN_4:
> --=20
> 2.55.0
>=20
>=20

--5mbmsvvik7ninqyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqW7gQACgkQ2O7X88g7
+prahBAAgLl8K27mTJVxx3giz1Lj3eC/xrb0xAQsYhZ3C91Jw9UbhYRYPBqId74N
c+vmUXUszCSHLxZv8FxrqrYtAOZMDoV8nePFMNGgBRrSJirMNn81Y7dyz/E6x/3q
YFhFIrbDevZb6NHrzs+iJOqqtXGCsfwV72jVu01GV4bgSDGDmPfa3rQzR7wAvkuZ
GfjNXwhlodyfvPPktrgNxPBFu4FFCDTuN1FMFMJr7ctQg6U4VLuM7cP6d064I2W1
HOIDfpiINCXVxARUNDy1Tr64bX+6jUJUCkNofF2fZ27o79c28o3fzaN3XW/Sc8HO
G75EIzSciN6U5aptOnFv00qyaTYmu12xSJBLYI0iURV0tJmLQmpalqF8hQrQloq/
6WyK9RQwI4yLZy+5P+00R5NYuqwKO9+A86h5lSvfymPbzuRAAjE+JQ+jhFEiNS4W
PaQKY/+KCLwM8ArD6VmtGmvYy7uDiV6xGmk7zz+NvY6ZvHoYYOsKymoXU6KdYceT
/cFsnTsGQKir6nmifcrh7LCsLNJJPix+xUCV/HtiTNJHZP79SHKbgu9cl1332480
8Y3RtFNVaEeEk7oheGNVEyDK68yUnRioRP6mDppjhZYAUWzq2SXGSIIAVgXqkukz
gq5M+j5PZVAimwCWQvASgOi28AbI6pYdwE/dTTwKcYXLD27Q7DM=
=C2YE
-----END PGP SIGNATURE-----

--5mbmsvvik7ninqyc--
