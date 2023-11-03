Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22EF6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 09:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346975AbjKCJTo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 05:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346954AbjKCJTo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 05:19:44 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4C10DE
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 02:19:37 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-357cf6725acso7015535ab.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Nov 2023 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699003177; x=1699607977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gofsKQgNawTEhNhqfYq8tYrYvM42rUi9h9xaHc9fQD4=;
        b=NHY7K6/6XndM3sabO3TS0c80cr9vyBlHKMS1t7sqjvai1IYv/0Fhdbw80O/mb5OtSz
         n4IKckgeJRLhDcpW3rw1aeE6tXbVy1Gh7nQJ3EDJ0WH/XpdPQJB9mxNDNtmyDq4ns1Ef
         jF6Gf1UURslPxrsx59nOvs25sSSvc4M5Xt9PBMSIf1l6tSDEX+xNHlEuzlMC988Sva7p
         nmrWEzlWK7TAG7zE6v3Uf4k0MBX9RfyZs4K4G8bNadC1TPfkXmpwUjUASI5maSRJC+uR
         zzQzB2slxsjbVx5r6c/0BwK37CrLmx+l3ZcxzksDAJxG4hUUO6a4iBeFPBKHD8pHUqbt
         nbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699003177; x=1699607977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gofsKQgNawTEhNhqfYq8tYrYvM42rUi9h9xaHc9fQD4=;
        b=qK3u2e2nj8G3MG11cdIXx8Rk0nseaI4tXSJ1ou32R8XFCiOBbXJEdJQDqoE9zNUA9L
         Z0zYHSj0eCHj9uHSg6kWK2p3Nf9SiZte8KnYBxzXe3g65lmsRS37HoIOwgEnjdVB9LHL
         UKwBAfX6V588WPwlvwob7NDtnSnLYl6jAVVIBieUCPduKNQ5vuYoqfmqHoJYK6rOR2KY
         3RWqbo3wNjd2VtUrrvsm1dbsNf9opxKt0+wnWpYtDvzdRyHQT8lqbeboP8XWRSTPqTOi
         PGm4VGVLCuIMH6WM1CbJ/ep3/7sry0EnRUFNSYuuntprxQcvgHQc65zZ/7D3RwPvYqFt
         oH3A==
X-Gm-Message-State: AOJu0Yxzufm6WxKDaaMp9EcghiItRaBG2xA/Vat0ffmdsVbRUG+bjfzi
        J/wCEBlk3Lb3ugjQ+BQevczOKbmVVfE=
X-Google-Smtp-Source: AGHT+IHcvScEuhVxS+R88II4uwoPRYFn4Y/gICPU3AYJraXOxM9+yv5sIio8lIqFiE/kpXh1YzKTKg==
X-Received: by 2002:a05:6e02:1a42:b0:351:1647:5fa0 with SMTP id u2-20020a056e021a4200b0035116475fa0mr25730610ilv.18.1699003176639;
        Fri, 03 Nov 2023 02:19:36 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id b14-20020aa7810e000000b006be17e60708sm1024851pfi.204.2023.11.03.02.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 02:19:36 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id A86359157AE6; Fri,  3 Nov 2023 16:19:33 +0700 (WIB)
Date:   Fri, 3 Nov 2023 16:19:33 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     bugzilla-daemon@kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [Bug 218092] Laptop hanging on black screen, when suspended and
 woke up!
Message-ID: <ZUS7JclVRHsbsum7@debian.me>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
 <bug-218092-215701-9R4neosxK8@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/7gE0xAWla6CvgRd"
Content-Disposition: inline
In-Reply-To: <bug-218092-215701-9R4neosxK8@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--/7gE0xAWla6CvgRd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2023 at 07:16:24AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218092
>=20
> --- Comment #43 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
> I don't know what happened exactly but it's building .deb files now. I d=
=C4=B1d this
> things:
> https://github.com/openssl/openssl/issues/20293#issuecomment-1461877599 -=
-> I
> did make modules then make modules_sign. make modules_sign give error and=
 I did
> this: https://askubuntu.com/a/1178467
> then, to create signature, I think, click the link:
> https://superuser.com/a/1322832 --> In this, I did this:=20
> "In your linux kernel root folder that you're compiling go to the certs f=
older
> and run:"
> openssl req -new -nodes -utf8 -sha512 -days 36500 -batch -x509 -config
> x509.genkey -outform DER -out signing_key.x509 -keyout signing_key.pem
> Then I tried this: "make modules_sign" and "make modules_install" and get
> error, so I decided to disable module signing:
> https://stackoverflow.com/questions/29806414/how-to-disable-kernel-module=
-signing-in-linux
> but I didn't change the value from this UI. So I manually change .config =
file:
> CONFIG_MODULE_SIG=3Dn
> CONFIG_MODULE_SIG_ALL=3Dn
> I was change this and copy to linux6.6/ folder and then run "make -j$(npr=
oc)
> bindeb-pkg" then I checked the .config file while is building. In the .co=
nfig
> file that used for last building:=20
> CONFIG_MODULE_SIG=3Dy
> # CONFIG_MODULE_SIG_ALL is not set

To use your own key pair, you need to set CONFIG_MODULE_SIG_KEY to the path
of the desired key.

>=20
> NOW, I have this .deb file. How I am gonna install this, do I have to use
> command or I just click and open with KDE Discover. And which file should=
 I
> install?
> -----
> dpkg-deb: building package 'linux-image-6.6.0' in
> '../linux-image-6.6.0_6.6.0-6_amd64.deb'.
> dpkg-deb: building package 'linux-libc-dev' in
> '../linux-libc-dev_6.6.0-6_amd64.deb'.
> dpkg-deb: building package 'linux-headers-6.6.0' in
> '../linux-headers-6.6.0_6.6.0-6_amd64.deb'.
> dpkg-deb: building package 'linux-image-6.6.0-dbg' in
> '../linux-image-6.6.0-dbg_6.6.0-6_amd64.deb'.
>  dpkg-genbuildinfo --build=3Dbinary -O../linux-upstream_6.6.0-6_amd64.bui=
ldinfo
>  dpkg-genchanges --build=3Dbinary -O../linux-upstream_6.6.0-6_amd64.chang=
es
> dpkg-genchanges: info: binary-only upload (no source code included)
>  dpkg-source --after-build .
> dpkg-buildpackage: info: binary-only upload (no source included)

Use apt (the package manager). Only kernel headers and images are needed
to get the kernel running:

```
# apt install ../linux-headers-6.6.0_6.6.0-6_amd64.deb ../linux-image-6.6.0=
_6.6.0-6_amd64.deb
```

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/7gE0xAWla6CvgRd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUS7IQAKCRD2uYlJVVFO
o2wZAP0UMsLRIPSS8pOAu4IpdexoJhwSP57Lh9G+06/iXW8YGwD/ZO/ayrcjfE6Y
yYGwEZCcP3OcjT0ZYLhCFupTg6zHAwM=
=TTGo
-----END PGP SIGNATURE-----

--/7gE0xAWla6CvgRd--
