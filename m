Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554FDC4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Nov 2023 07:16:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344310AbjKCHQc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Nov 2023 03:16:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344260AbjKCHQb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 03:16:31 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2304211B
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 00:16:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEC01C433C8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698995784;
        bh=hNTeaUdToy7DsJcZzuxQcpAmrLHmiVQI5esQeFG3baU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VLyxAmRShykIOHs1BgsE9M9Nc673iTY1vde47VXWEcrSjDPDY2teWGQvyzo5VfBM7
         Qs4z476mg13LIdtBOa/E84oF31gWU4EUo4xlu1vd4G5WMx4MAlQFztpGrsXC14qhRS
         ysClulIflyB6W8TbW02zOR1pSIUVfY0nFNmymjoQW/7oM6USJUqOobA+C8fD4aT3a6
         qB7186g5TbvJstMhJnX0yCi3R3tywUUN5uGnuB0HSoSm6vmfnm0Skx/UOt6htJGBMg
         GcTJnYZmjULZfNSiQjGnRn54UMXK5tYb/bM23zq8RKtNJzGb6aRKUC4A2op6fJ2nNF
         j+s2xjKlScgZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9FBA0C4332E; Fri,  3 Nov 2023 07:16:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 07:16:24 +0000
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
Message-ID: <bug-218092-215701-9R4neosxK8@https.bugzilla.kernel.org/>
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

--- Comment #43 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
I don't know what happened exactly but it's building .deb files now. I d=C4=
=B1d this
things:
https://github.com/openssl/openssl/issues/20293#issuecomment-1461877599 -->=
 I
did make modules then make modules_sign. make modules_sign give error and I=
 did
this: https://askubuntu.com/a/1178467
then, to create signature, I think, click the link:
https://superuser.com/a/1322832 --> In this, I did this:=20
"In your linux kernel root folder that you're compiling go to the certs fol=
der
and run:"
openssl req -new -nodes -utf8 -sha512 -days 36500 -batch -x509 -config
x509.genkey -outform DER -out signing_key.x509 -keyout signing_key.pem
Then I tried this: "make modules_sign" and "make modules_install" and get
error, so I decided to disable module signing:
https://stackoverflow.com/questions/29806414/how-to-disable-kernel-module-s=
igning-in-linux
but I didn't change the value from this UI. So I manually change .config fi=
le:
CONFIG_MODULE_SIG=3Dn
CONFIG_MODULE_SIG_ALL=3Dn
I was change this and copy to linux6.6/ folder and then run "make -j$(nproc)
bindeb-pkg" then I checked the .config file while is building. In the .conf=
ig
file that used for last building:=20
CONFIG_MODULE_SIG=3Dy
# CONFIG_MODULE_SIG_ALL is not set

NOW, I have this .deb file. How I am gonna install this, do I have to use
command or I just click and open with KDE Discover. And which file should I
install?
-----
dpkg-deb: building package 'linux-image-6.6.0' in
'../linux-image-6.6.0_6.6.0-6_amd64.deb'.
dpkg-deb: building package 'linux-libc-dev' in
'../linux-libc-dev_6.6.0-6_amd64.deb'.
dpkg-deb: building package 'linux-headers-6.6.0' in
'../linux-headers-6.6.0_6.6.0-6_amd64.deb'.
dpkg-deb: building package 'linux-image-6.6.0-dbg' in
'../linux-image-6.6.0-dbg_6.6.0-6_amd64.deb'.
 dpkg-genbuildinfo --build=3Dbinary -O../linux-upstream_6.6.0-6_amd64.build=
info
 dpkg-genchanges --build=3Dbinary -O../linux-upstream_6.6.0-6_amd64.changes
dpkg-genchanges: info: binary-only upload (no source code included)
 dpkg-source --after-build .
dpkg-buildpackage: info: binary-only upload (no source included)
-----

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
