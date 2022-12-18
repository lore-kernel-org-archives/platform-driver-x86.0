Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF606C10F1E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 18 Dec 2022 18:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbiLRSb1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 18 Dec 2022 13:31:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiLRSat (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Dec 2022 13:30:49 -0500
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B5EFCE1D;
        Sun, 18 Dec 2022 10:21:58 -0800 (PST)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id A6E281C09DB; Sun, 18 Dec 2022 19:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1671387715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mG5YlQYa6fZvoTrpxjawF7DHB0JYdQEby7Dow5wZ2+M=;
        b=ZqFeHdNaRSXSFdRpQKLyTT02XtTxjjhO9ZSj4l3OvETN9ynOxpxZ4EmmTUHh76ONch6+6u
        pLkE46K9Mti318V7EXku0qEDyPHMgEFBRPq9qtZAFsSjxeiF33VL6JHZBmM4hj+e3Tuxno
        pCcCvsB1TFxAqKlYabbzJG1crCBsy4A=
Date:   Sun, 18 Dec 2022 19:21:55 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     hdegoede@redhat.com, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 0/9] Extend Intel On Demand (SDSi) support
Message-ID: <Y59aQ5hIZeLGx7hn@duo.ucw.cz>
References: <20221119002343.1281885-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="sd6k+wBVQurr7X90"
Content-Disposition: inline
In-Reply-To: <20221119002343.1281885-1-david.e.box@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--sd6k+wBVQurr7X90
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2022-11-18 16:23:34, David E. Box wrote:
> Intel Software Defined Silicon (SDSi) is now known as Intel On Demand. The
> following patches do the following:
>=20
> 1. Identify the driver/tools as Intel On Demand. Only text descriptions a=
re
> changed. Kconfig and filenames remain the same.
> 2. Perform some attribute cleanup by preventing the showing of files when
> features are not supported.
> 3. Adds support for a new GUID. GUIDs are used to identify the layout of
> the On Demand registers in sysfs. Layouts are described in the
> documentation on github [1].
> 4. Add support for reading On Demand meter certificates in sysfs.
> 5. The rest of the patches modify the existing tool to support discovery
> and reading of On Demand registers and the meter certificate.

Intel should not be allowed to double-charge their customers.

NAK.
								Pavel
							=09
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--sd6k+wBVQurr7X90
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCY59aQwAKCRAw5/Bqldv6
8jrjAJ48dx6lAZ2QYvZ8SZQYN1yWgqfolACfSnldJnpxhYmCL0gYABHxIXspzhI=
=M0vV
-----END PGP SIGNATURE-----

--sd6k+wBVQurr7X90--
