Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B54CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 14:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjKBOdQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 10:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbjKBOdM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 10:33:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 480691BC
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 07:33:00 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8FDBC43391
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698935579;
        bh=pgn2lFArN7eKH5LYCs90ocnRLvKUmtkATRbZhjEcCWQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WFVEk5qvnuT66289kJb2sQDLxvCyfMOHj8w3SAGb3NlClWemRS6jUblmPKoAjHyFd
         PcqUmJqTUe0AczVRbYqR/SKtneOJcj0Aol3dp3nz1uUWWCwD++7vDrLZ+tFiebiR4j
         heDnkCKywlYXvfWjFPNSDAp5nzt3OO3t7xNRYPPt8fjZ/WLCZ5itz2Jrw1jqip6sj2
         zzanBlvVDnCXXzUrcHlVUABtHuG2b6+w8soZu9I9jRY0kKUggShy9+Ie9x6tTeTPcM
         bsuu4ZCt6qEzxzv7NdDmIqbmpxwqCuqiRHqMSOjs8fbrxerr3HgWzWpMvwfkYpj4gI
         gvryWgwRR1USg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BA0FFC4332E; Thu,  2 Nov 2023 14:32:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 14:32:59 +0000
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
Message-ID: <bug-218092-215701-CIggyEIeN7@https.bugzilla.kernel.org/>
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

--- Comment #33 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Ertugrul Uyar from comment #32)
> (In reply to Ertugrul Uyar from comment #31)
> > (In reply to Ertugrul Uyar from comment #30)
> > > (In reply to Ertugrul Uyar from comment #29)
> > > > (In reply to Mario Limonciello (AMD) from comment #28)
> > > > > Yeah like I said, you need to install build dependencies.  You ca=
n do
> > > them
> > > > > manually one by one or you can use 'sudo apt build-dep
> $SOURCE_PACKAGE'
> > > to
> > > > > do it.
> > > > >=20
> > > > > I don't know the name of the source package used for Tuxedo.  It's
> > > > something
> > > > > like this:
> > > > >=20
> > > > > # sudo apt build-dep linux-image
> > > >=20
> > > > I tried this: https://phoenixnap.com/kb/build-linux-kernel
> > > > sudo apt-get install git fakeroot build-essential ncurses-dev xz-ut=
ils
> > > > libssl-dev bc flex libelf-dev bison
> > > > And it's start to build. Then I keep enter to choose default options
> for
> > > > questions.
> > >=20
> > > Then I get this and installed the missing deppendency.
> > >=20
> > > dpkg-buildpackage --build=3Dbinary --no-pre-clean --unsigned-changes
> > > --rules-file=3D'make -f debian/rules' --jobs=3D1 -r'fakeroot -u' -a$(=
cat
> > > debian/arch)
> > > dpkg-buildpackage: info: source package linux-upstream
> > > dpkg-buildpackage: info: source version 6.6.0-1
> > > dpkg-buildpackage: info: source distribution jammy
> > > dpkg-buildpackage: info: source changed by ertugruluyar
> > > <ertugruluyar@ertugruluyar-pc>
> > > dpkg-buildpackage: info: host architecture amd64
> > >  dpkg-source --before-build .
> > > dpkg-checkbuilddeps: error: Unmet build dependencies: debhelper
> > > dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied;
> > > aborting
> > > dpkg-buildpackage: warning: (Use -d flag to override.)
> > > make[2]: *** [scripts/Makefile.package:146: bindeb-pkg] Error 3
> > > make[1]: *** [/home/ertugruluyar/Desktop/linux-6.6/Makefile:1538:
> > > bindeb-pkg] Error 2
> > > make: *** [Makefile:234: __sub-make] Error 2
> >=20
> > It did things that start CC ... then I get error a few minutes later:
> > make[5]: *** [Makefile:1913: .] Error 2
> > make[4]: *** [Makefile:359: __build_one_by_one] Error 2
> > make[3]: *** [debian/rules:25: build-arch] Error 2
> > dpkg-buildpackage: error: make -f debian/rules binary subprocess return=
ed
> > exit status 2
> > make[2]: *** [scripts/Makefile.package:146: bindeb-pkg] Error 2
> > make[1]: *** [/home/ertugruluyar/Desktop/linux-6.6/Makefile:1538:
> > bindeb-pkg] Error 2
> > make: *** [Makefile:234: __sub-make] Error 2
>=20
> Then I did this:
> https://wiki.ubuntu.com/Kernel/BuildYourOwnKernel
> sudo apt-get install libncurses-dev gawk flex bison openssl libssl-dev dk=
ms
> libelf-dev libudev-dev libpci-dev libiberty-dev autoconf llvm

I got the same error.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
