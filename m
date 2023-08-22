Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D01EE4993
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Aug 2023 10:44:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjHVKoF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Aug 2023 06:44:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjHVKoF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Aug 2023 06:44:05 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA692199;
        Tue, 22 Aug 2023 03:44:03 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 848841C000B; Tue, 22 Aug 2023 12:44:02 +0200 (CEST)
Date:   Tue, 22 Aug 2023 12:44:02 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Sasha Levin <sashal@kernel.org>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Patil Rajesh Reddy <Patil.Reddy@amd.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.4 36/54] platform/x86/amd/pmf: Notify OS power
 slider update
Message-ID: <ZOSRcmbzTxI9POQR@duo.ucw.cz>
References: <20230813154934.1067569-1-sashal@kernel.org>
 <20230813154934.1067569-36-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="SO4HukLAp6rMFfdj"
Content-Disposition: inline
In-Reply-To: <20230813154934.1067569-36-sashal@kernel.org>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--SO4HukLAp6rMFfdj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>=20
> [ Upstream commit 33c9ab5b493a0e922b06c12fed4fdcb862212cda ]
>=20
> APMF fn8 can notify EC about the OS slider position change. Add this
> capability to the PMF driver so that it can call the APMF fn8 based on
> the changes in the Platform profile events.

New feature with a new API. Why is it in AUTOSEL?

Best regards,
							Pavel
						=09
>  drivers/platform/x86/amd/pmf/acpi.c | 21 ++++++++
>  drivers/platform/x86/amd/pmf/core.c |  9 +++-
>  drivers/platform/x86/amd/pmf/pmf.h  | 16 +++++++
>  drivers/platform/x86/amd/pmf/sps.c  | 74 +++++++++++++++++++++++++++--
>  4 files changed, 114 insertions(+), 6 deletions(-)
>=20

--=20
DENX Software Engineering GmbH,        Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany

--SO4HukLAp6rMFfdj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZOSRcgAKCRAw5/Bqldv6
8tFRAJ452vjYFE8xY9aSd2vPedW7W5GrNgCdEuTof7OBA47HBWUZ2cL/z+IcBHU=
=QsoG
-----END PGP SIGNATURE-----

--SO4HukLAp6rMFfdj--
