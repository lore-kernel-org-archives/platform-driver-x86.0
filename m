Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA9AC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 11:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230048AbjKCLgK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 07:36:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbjKCLgI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 07:36:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1083C134
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 04:36:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91611C433C8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 11:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699011361;
        bh=UuoAjFU7DzjSB7AR7ktwMCnUgtiofUoNndfQfHJcdwM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NzsEeBOikfTqBd+sP4BqKTWtIxuTj4QiHqFdgNyCaAClCNf7eW0PNWbSV3aI4Dqih
         ldQL/25y8GZ4vGPQL8qK7FivPw+eQDFqcLYDdXn4PcNR6P72SApcOsC0qMM3VIGHU7
         TYce2CYEpp1B2IdSzqDMJaJPP+OismxqDI6aRkOaR8q6GjAyZz3b2nSfrXoI3aRenO
         ZanLbFHluzFGMWwQbxdImO73hAHABGFglvitB55b/TT1JL/GrAdFZ5eneLnmJEZm/x
         968S2SYdGhEgfOuJgrRJOYeGxM4Y+6mYWP7LPclgdGDlhjtyIUIDzjkBaosDeNBLce
         bBWmsfhdG+DwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 72DDEC4332E; Fri,  3 Nov 2023 11:36:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 11:36:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-a4Cnb0AXog@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #45 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Bagas Sanjaya from comment #44)
> Created attachment 305355 [details]
> signature.asc
>=20
> On Fri, Nov 03, 2023 at 07:16:24AM +0000, bugzilla-daemon@kernel.org wrot=
e:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D218092
> >=20
> > --- Comment #43 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
> > I don't know what happened exactly but it's building .deb files now. I =
d=C4=B1d
> > this
> > things:
> > https://github.com/openssl/openssl/issues/20293#issuecomment-1461877599=
 -->
> I
> > did make modules then make modules_sign. make modules_sign give error a=
nd I
> > did
> > this: https://askubuntu.com/a/1178467
> > then, to create signature, I think, click the link:
> > https://superuser.com/a/1322832 --> In this, I did this:=20
> > "In your linux kernel root folder that you're compiling go to the certs
> > folder
> > and run:"
> > openssl req -new -nodes -utf8 -sha512 -days 36500 -batch -x509 -config
> > x509.genkey -outform DER -out signing_key.x509 -keyout signing_key.pem
> > Then I tried this: "make modules_sign" and "make modules_install" and g=
et
> > error, so I decided to disable module signing:
> >
> >
> https://stackoverflow.com/questions/29806414/how-to-disable-kernel-module=
-signing-in-linux
> > but I didn't change the value from this UI. So I manually change .config
> > file:
> > CONFIG_MODULE_SIG=3Dn
> > CONFIG_MODULE_SIG_ALL=3Dn
> > I was change this and copy to linux6.6/ folder and then run "make
> -j$(nproc)
> > bindeb-pkg" then I checked the .config file while is building. In the
> .config
> > file that used for last building:=20
> > CONFIG_MODULE_SIG=3Dy
> > # CONFIG_MODULE_SIG_ALL is not set
>=20
> To use your own key pair, you need to set CONFIG_MODULE_SIG_KEY to the pa=
th
> of the desired key.
>=20
> >=20
> > NOW, I have this .deb file. How I am gonna install this, do I have to u=
se
> > command or I just click and open with KDE Discover. And which file shou=
ld I
> > install?
> > -----
> > dpkg-deb: building package 'linux-image-6.6.0' in
> > '../linux-image-6.6.0_6.6.0-6_amd64.deb'.
> > dpkg-deb: building package 'linux-libc-dev' in
> > '../linux-libc-dev_6.6.0-6_amd64.deb'.
> > dpkg-deb: building package 'linux-headers-6.6.0' in
> > '../linux-headers-6.6.0_6.6.0-6_amd64.deb'.
> > dpkg-deb: building package 'linux-image-6.6.0-dbg' in
> > '../linux-image-6.6.0-dbg_6.6.0-6_amd64.deb'.
> >  dpkg-genbuildinfo --build=3Dbinary
> -O../linux-upstream_6.6.0-6_amd64.buildinfo
> >  dpkg-genchanges --build=3Dbinary -O../linux-upstream_6.6.0-6_amd64.cha=
nges
> > dpkg-genchanges: info: binary-only upload (no source code included)
> >  dpkg-source --after-build .
> > dpkg-buildpackage: info: binary-only upload (no source included)
>=20
> Use apt (the package manager). Only kernel headers and images are needed
> to get the kernel running:
>=20
> ```
> # apt install ../linux-headers-6.6.0_6.6.0-6_amd64.deb
> ../linux-image-6.6.0_6.6.0-6_amd64.deb
> ```
>=20
> Thanks.

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
