Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8853EC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 14:18:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjKBOS2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 10:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjKBOS1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 10:18:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B922212F
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 07:18:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62A34C433C8
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 14:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698934701;
        bh=XdrQfBI8Zjoi+HOKEKuHSlJKxOD1qCr5m36WRvJTuRQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KIaEA/9qVfmWnm1mwO48GMVnImqxQQU5H/BEKxMsbnxjD9W4HcJp9Cmbfc8UU+6io
         nAuvXqRAOI/OJnp1tSJ7gak3usgABZ1SZ5j7zR9iPQvD+fON+1M8YCYaHZ1gfRTu7d
         frxnv8kAsc8C2fGmme1a3sfpMDk4IXA90psj5HL7+Ft0KrmJ3O2l0CzgAGSkQRjrxI
         QB5WNbcZNG3SW74NpCvBORfikSSidKHBH9F/avEaLjY1mBaB69D5PoMENJSKvhy8l+
         X+l8BmalPxHKfDODeQsijOSn3icwdmkBIuo3C9Xtr2MCJAsiUEYpNWpmLirM33HEah
         if+pdmpUFN84w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4A723C4332E; Thu,  2 Nov 2023 14:18:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 14:18:21 +0000
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
Message-ID: <bug-218092-215701-BsYkDxz51x@https.bugzilla.kernel.org/>
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

--- Comment #31 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Ertugrul Uyar from comment #30)
> (In reply to Ertugrul Uyar from comment #29)
> > (In reply to Mario Limonciello (AMD) from comment #28)
> > > Yeah like I said, you need to install build dependencies.  You can do
> them
> > > manually one by one or you can use 'sudo apt build-dep $SOURCE_PACKAG=
E'
> to
> > > do it.
> > >=20
> > > I don't know the name of the source package used for Tuxedo.  It's
> > something
> > > like this:
> > >=20
> > > # sudo apt build-dep linux-image
> >=20
> > I tried this: https://phoenixnap.com/kb/build-linux-kernel
> > sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils
> > libssl-dev bc flex libelf-dev bison
> > And it's start to build. Then I keep enter to choose default options for
> > questions.
>=20
> Then I get this and installed the missing deppendency.
>=20
> dpkg-buildpackage --build=3Dbinary --no-pre-clean --unsigned-changes
> --rules-file=3D'make -f debian/rules' --jobs=3D1 -r'fakeroot -u' -a$(cat
> debian/arch)
> dpkg-buildpackage: info: source package linux-upstream
> dpkg-buildpackage: info: source version 6.6.0-1
> dpkg-buildpackage: info: source distribution jammy
> dpkg-buildpackage: info: source changed by ertugruluyar
> <ertugruluyar@ertugruluyar-pc>
> dpkg-buildpackage: info: host architecture amd64
>  dpkg-source --before-build .
> dpkg-checkbuilddeps: error: Unmet build dependencies: debhelper
> dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied;
> aborting
> dpkg-buildpackage: warning: (Use -d flag to override.)
> make[2]: *** [scripts/Makefile.package:146: bindeb-pkg] Error 3
> make[1]: *** [/home/ertugruluyar/Desktop/linux-6.6/Makefile:1538:
> bindeb-pkg] Error 2
> make: *** [Makefile:234: __sub-make] Error 2

It did things that start CC ... then I get error a few minutes later:
make[5]: *** [Makefile:1913: .] Error 2
make[4]: *** [Makefile:359: __build_one_by_one] Error 2
make[3]: *** [debian/rules:25: build-arch] Error 2
dpkg-buildpackage: error: make -f debian/rules binary subprocess returned e=
xit
status 2
make[2]: *** [scripts/Makefile.package:146: bindeb-pkg] Error 2
make[1]: *** [/home/ertugruluyar/Desktop/linux-6.6/Makefile:1538: bindeb-pk=
g]
Error 2
make: *** [Makefile:234: __sub-make] Error 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
