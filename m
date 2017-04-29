From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH v4] platform/x86: ideapad-laptop: Add sysfs interface
 for touchpad state
Date: Sat, 29 Apr 2017 12:22:55 +0530
Message-ID: <1493448775.9725.5.camel@debian.org>
References: <20170217184756.15181-1-rrs@debian.org>
         <1487759058.9334.7.camel@debian.org>
         <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-j/SJk6oTJo7rk7stQO4g"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36456 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S968926AbdD2GxD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2017 02:53:03 -0400
Received: by mail-pg0-f68.google.com with SMTP id v1so8398973pgv.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Apr 2017 23:53:03 -0700 (PDT)
In-Reply-To: <CAHp75VcGYLSsnDgb_dzD0NVCK+aR6w7jZWfR+4nN-BfnAcdRWA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Ike Panhc <ike.pan@canonical.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


--=-j/SJk6oTJo7rk7stQO4g
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, 2017-04-28 at 22:17 +0300, Andy Shevchenko wrote:
> On Wed, Feb 22, 2017 at 12:24 PM, Ritesh Raj Sarraf <rrs@debian.org> wrot=
e:
>=20
> > Any further comment on this patch ? Will this be accepted ?
> > Please give a N/ACK.
>=20
> Sorry for a long delay, but I can't go with this without clear
> understanding that there is indeed no other ways available.
> From what I read in the above link=20

i am assuming you are referring to the launchpad bug report here.

> the main issue that driver doesn't
> send SW_TABLET_MODE event through input device.

Well. Yes. That is one part. If SW_TABLET_MODE is done in the driver, much
better. My patch was simply in line with some of the other drivers (hp-wmi =
and
thinkpad_acpi) to get it working for Lenovo Yoga series.

> I think this is the best approach how it should go.

--=20
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
--=-j/SJk6oTJo7rk7stQO4g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlkEOEcACgkQpjpYo/Lh
dWnxORAAow8yLhKiIjgoEEX+R1JmPZ5BMU7fzhRZNXX8GdtR8bxfvmE1lcfALLLG
Yyq1QBa9i8nTGsGoDg4lO91gyw2MSeAI6v1vd7mc5GPL+8SOWCqo1cAJwh9lpHlO
epOd+qUAe2kwwNrJpCgvoKwRpdeSWrIlHtwjEB6YxtfXPLezojvvU7krE0isT6pM
r/vXzxpO3yIRUN5b1Xtyd6eY6jB88aXDndW6Mv+nAVa0omdMnpKLQegl8P72LrPF
IQL2n2OAJ4O5nLer5CCT6eXPBJywWW+dG601drhRXJN4SjTDe0WfaaFF3Thf1AZg
5nK8xIMxH25GdprSkneacPi+CzKSLPO9whsI9sx3JtO3vKA6i96ISNjfANtMVY9H
2A0egXRY642YbTa0SKM61SVr8NvGc82AMbg24n2a144twu+CQ9jHNRy8cYDQ6T2/
+1Dg7lBIKfoOGys7c1hYQDerLcoXyuyRxBwl7GHukqi/S1TpyeYOgxtcSoDXOXP/
78B3ZT2vVtZDQciuP3HZ8I4jZeCrwfEvlW4V1TYcas5eGA4h/5sdok+23cgR93pl
SgNq66+/awYg8NTcYv60hq3mvLCYxtk7Wvj5kfGZP6EXOA2C96zfOOAx6xnD6QW9
nFUWwo/EQSnFEWG+GKViitKwcshrmgVuWCeCsbNGPygeyy5SuVc=
=jxg/
-----END PGP SIGNATURE-----

--=-j/SJk6oTJo7rk7stQO4g--
