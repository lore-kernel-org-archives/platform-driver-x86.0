Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A73C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 15:35:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234194AbjKBPfd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 11:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234629AbjKBPfc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 11:35:32 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802DC18B
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 08:35:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13794C433C8
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 15:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698939326;
        bh=y2+8QSwl7VPWZgXn6g0NEtWJYZy7yqXP46BjvoLhZpU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ojDUsaim6UYOjkw7kfIxo4fXHI6bwCoORNGUxXra5TwvNpjDILffKp3ojpg82dzHT
         KmPkUwun9Rp4Zeo1Cl68YXdHDMVdtSPDSqNtRaTz8hBJqkaXu8LXSiVgKPYU59haK0
         pWOfXtkgWyjAdYo1G5SxRHQGuBLHHHF28IWeC/yotsz4T4QUzYnNKU4CaF4jnop3wk
         cnjlANU7wx/iFQLG1Dk7JHax7JkRgR9N6Lu25fhfwZDv2A4A7Lv5mspNZvOAc3f3uZ
         ZXo5NEx7mOy/88rwDT6rAmUnliT2ASl5bOhPBg9J/whaNUFaed59rKQ9j7MENq9upx
         jdxU5n55sqWiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E9B40C4332E; Thu,  2 Nov 2023 15:35:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 15:35:25 +0000
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
Message-ID: <bug-218092-215701-QES8TkFbyL@https.bugzilla.kernel.org/>
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

--- Comment #35 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #34)
> You'll need to scroll up and look at the error to find out what's wrong.
> It's not in the tail of the stuff you shared.

I did this:
https://www.mail-archive.com/kernelnewbies@kernelnewbies.org/msg21536.html
I run this command: scripts/config --disable SYSTEM_TRUSTED_KEYS=20
It's asked me question again and I press enter for default. Then start again
the build. this time it take 30 minutes around. Then give this error (I thi=
nk,
it's the same error.):=20
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


I can't scroll too much, at some point it's stop, I can't see all outputs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
