Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F280C61DB3
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 22:24:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240685AbjALWYb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 17:24:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240098AbjALWXn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 17:23:43 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09066BAF
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 14:01:25 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pG5dK-0006Zp-Vp; Thu, 12 Jan 2023 23:01:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pG5dJ-005ctK-Di; Thu, 12 Jan 2023 23:01:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pG5dI-00CN5l-D7; Thu, 12 Jan 2023 23:01:12 +0100
Date:   Thu, 12 Jan 2023 23:01:12 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>
Cc:     kernel@pengutronix.de, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/3] platform/x86: Drop empty platform remove functions
Message-ID: <20230112220112.cxzfoxo4cejzjbpx@pengutronix.de>
References: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3wzp2kkp7l55dqqh"
Content-Disposition: inline
In-Reply-To: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--3wzp2kkp7l55dqqh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Dec 13, 2022 at 05:23:56PM +0100, Uwe Kleine-K=F6nig wrote:
> this series removes all platform remove functions that only return zero
> below drivers/platform/x86. There is no reason to have these, as the only
> caller is platform core code doing:
>=20
>         if (drv->remove) {
>                 int ret =3D drv->remove(dev);
>=20
>                 if (ret)
>                         dev_warn(...)
>         }
>=20
> (in platform_remove()) and so having no remove function is both
> equivalent and simpler.

Gentle ping! I didn't get any feedback for this series yet after nearly
a month.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--3wzp2kkp7l55dqqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPAgyUACgkQwfwUeK3K
7Antggf/WVLEEjwsMHyzgPP570K/gNDREhap5mhNB7kVOumsS+Vo6yjxdQ3mkU2l
NultMFzzIMh0o6Am8WoWERxxzlM/zegV46YuqWSpLwAVL+vjaZIP4A1SO0uFySXj
+Xa0yxgLoSo+B6jNFUYEWqre2gFoThn1gWGf4hoElPunYJAiOvBI7Rqz04iNgtPB
GTRGIge9yzq0Vg1VmJlBkrG36uyT5sk7v39RXdpjXMgoRMBY9dvZdmC6OQwq5QWP
Q5ogFTXnlfkY3kzmTsLkL1zGNH0q90FQaljfHTFZVynwMQW+JzUiF7Ac/A0C5oAg
lTTR4c+NKa3jRn8uZrZ3Fje7hCny2A==
=YWX1
-----END PGP SIGNATURE-----

--3wzp2kkp7l55dqqh--
