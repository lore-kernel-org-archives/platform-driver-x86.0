Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3C1C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 13:54:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjKBNyD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 09:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229995AbjKBNyC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 09:54:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95656D7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 06:53:56 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FC66C433CB
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 13:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698933236;
        bh=pPBXvpEY2hfrjUqkuZyS4+BhXZj0NykDZkKjVzb7xy0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TBj10upnjhF7awRi67bLpLZPahVDQjos25LgkJt9LWbFClsBrbkBeB8AV6wtlxOoL
         8LFDIfts04lXjEOTTwU+my9jC/CuEjRuJNmDJ8jQDrOqN/PWJ5xy0bMjzm2arj5YKk
         jpTiAwWMMQTdsZyH6IaxvvS0iu293KOC270hueC4SpEGK7ZhVjCx1ONYPV/ZvMNlgK
         A0n+TFRHfu0HBCOql9IUbO8YE/Ewdw6l02z1DP2LRFUGD19D21AnZgAlZmv/4e93IQ
         hOyDcIuU+1BE3bh3gKbmJqtXTsoKXabZplS88T+RnmrSzRGTLh50YFrJiUTzbIb06G
         tHHctG2CTtT7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0E87DC4332E; Thu,  2 Nov 2023 13:53:56 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 13:53:55 +0000
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
Message-ID: <bug-218092-215701-CufSH1s3Mp@https.bugzilla.kernel.org/>
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

--- Comment #27 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #26)
> > Because, I tried "sudo apt install apt build-dep linux-image" --> it di=
dn't
> > find build-dep and show all linux-image* for different versions. Should=
 I
> try
> > to "make -j$(nproc) bindeb-pkg"?
>=20
> If you build and it's missing dependencies it will mention that, fail the
> build and you have to find them.  The apt build-dep command I suggested w=
as
> to give you another shortcut.

ertugruluyar@ertugruluyar-pc:~/Desktop/linux-6.6$ make -j$(nproc) bindeb-pkg
***
*** Configuration file ".config" not found!
***
*** Please run some configurator (e.g. "make oldconfig" or
*** "make menuconfig" or "make xconfig").
***
make[1]: *** [/home/ertugruluyar/Desktop/linux-6.6/Makefile:784: .config] E=
rror
1
make: *** [Makefile:234: __sub-make] Error 2

THEN I move .config file that I copied to linux-6.6/kernel/ folder to the
linux-6.6/ folder. and I run this:

ertugruluyar@ertugruluyar-pc:~/Desktop/linux-6.6$ make -j$(nproc) bindeb-pkg
  SYNC    include/config/auto.conf.cmd
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
/bin/sh: 1: flex: not found
  YACC    scripts/kconfig/parser.tab.[ch]
/bin/sh: 1: bison: not found
make[3]: *** [scripts/Makefile.host:9: scripts/kconfig/lexer.lex.c] Error 1=
27
make[3]: *** Waiting for unfinished jobs....
make[3]: *** [scripts/Makefile.host:17: scripts/kconfig/parser.tab.h] Error=
 127
  HOSTCC  scripts/kconfig/menu.o
make[2]: *** [Makefile:697: syncconfig] Error 2
make[1]: *** [/home/ertugruluyar/Desktop/linux-6.6/Makefile:798:
include/config/auto.conf.cmd] Error 2
make: *** [Makefile:234: __sub-make] Error 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
