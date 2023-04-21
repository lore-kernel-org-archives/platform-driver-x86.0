Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C671C77B75
	for <platform-driver-x86@archiver.kernel.org>; Fri, 21 Apr 2023 11:39:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbjDULjD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 21 Apr 2023 07:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229750AbjDULjC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Apr 2023 07:39:02 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2470C155;
        Fri, 21 Apr 2023 04:38:18 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 3BA001C0E01; Fri, 21 Apr 2023 13:37:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1682077056;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2XdBu+av0qZxGuaP1nMetGj4D3Yj20NmV5LLc6errWE=;
        b=aNse9vV4/YdI8p2PwrhG7v1PhLBPhn46Zi7YAOIkphiD1ARS846CLid8RVs34xQBi4rSv3
        0nOH+W3ZcETf0P+jnPeOGZ4D+94zHF4eAzrIzUK6FOi3WJANanxAnWGQ3o4wVYjHjn5qwv
        12IiJgnJeQ6ET1zaLk2StdOafSpkKOA=
Date:   Fri, 21 Apr 2023 13:37:35 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas@t-8ch.de
Subject: Re: [PATCH v10 02/14] HP BIOSCFG driver  - biosattr-interface
Message-ID: <ZEJ1f7vOL1zCyNyR@duo.ucw.cz>
References: <20230419151321.6167-1-jorge.lopez2@hp.com>
 <20230419151321.6167-3-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="X09ELK96AjtUktk9"
Content-Disposition: inline
In-Reply-To: <20230419151321.6167-3-jorge.lopez2@hp.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--X09ELK96AjtUktk9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Linux Security components are under development and not published yet.
> The only linux component is the driver (hp bioscfg) at this time.
> Other published security components are under Windows.
>=20
> Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

> +/*
> + * ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
> + *
> + * BIOS supports UTF-16 characters that are 2 bytes long.  No variable
> + * multi-byte language supported.
> + *
> + * @p:   Unicode buffer address
> + * @str: string to convert to unicode
> + *
> + * Returns a void pointer to the buffer containing unicode string
> + */
> +void *ascii_to_utf16_unicode(u16 *p, const u8 *str)
> +{

Does this need to go to library somewhere?

BR,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--X09ELK96AjtUktk9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZEJ1fwAKCRAw5/Bqldv6
8vJfAJ9GV17J1jjrrXapJv4Y1ULKh0TKogCgnx32XNgfDS28gAnlJLciuHSUfPI=
=LREm
-----END PGP SIGNATURE-----

--X09ELK96AjtUktk9--
