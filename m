Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB32FC432BE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 16:12:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EFA660E78
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 16:12:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbhHDQM7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Aug 2021 12:12:59 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:40050 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236839AbhHDQK5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Aug 2021 12:10:57 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2E07E1C0B7A; Wed,  4 Aug 2021 18:10:39 +0200 (CEST)
Date:   Wed, 4 Aug 2021 18:10:38 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     =?utf-8?B?eXVlY2hhby56aGFvKOi1tei2iui2hSk=?= 
        <yuechao.zhao@advantech.com.cn>
Cc:     "345351830@qq.com" <345351830@qq.com>,
        =?utf-8?B?UmFpbmJvdy5aaGFuZyjlvLXnjokp?= 
        <Rainbow.Zhang@advantech.com.cn>,
        =?utf-8?B?eXVueGlhLmxpKOadjuS6kemcnik=?= 
        <yunxia.li@advantech.com.cn>,
        =?utf-8?B?SmlhLlN1aSjotL7nnaIp?= <Jia.Sui@advantech.com.cn>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: Re: [v2,1/1] adv_mix955x is a scheme that multiplexes
 PCA9554/PCA9555 into LED and GPIO
Message-ID: <20210804161038.GE25072@amd>
References: <tencent_17A7BBC4D15D331C1A25B4075294E5D67706@qq.com>
 <cb03b75a018e4bec83eac6898eb1d2af@ACNMB2.ACN.ADVANTECH.CORP>
 <20210427135356.GA2426@duo.ucw.cz>
 <859d8fcef654414c9ba55993adc93104@ACNMB2.ACN.ADVANTECH.CORP>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Content-Disposition: inline
In-Reply-To: <859d8fcef654414c9ba55993adc93104@ACNMB2.ACN.ADVANTECH.CORP>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2021-04-28 01:51:04, yuechao.zhao(=E8=B5=B5=E8=B6=8A=E8=B6=85) wrote:
> Hi Pavel
> As for " Please Cc LED drivers to the LED maintainers...", does it mean t=
hat I only need to Cc LED drivers to LED maintainers?
> Or do I need to send this driver to linux-leds@vger.kernel.org instead of=
 platform-driver-x86@vger.kernel.org.
>

You should probably send to both lists.
						Pavel
--=20
http://www.livejournal.com/~pavelmachek

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmEKu/4ACgkQMOfwapXb+vKqIACgo41uosR8j5SCMB5EKAuTjLxU
0WUAn1pIakBew+CKSHsFVlyKI5eC/1Cu
=4+bK
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
