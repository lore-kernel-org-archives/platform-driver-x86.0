Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A615AC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 06:23:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiF0GX1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 02:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiF0GX0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 02:23:26 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E267C2AEA
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 23:23:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A0C00B80AD4
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 06:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7076BC341CC
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 06:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656311003;
        bh=Ehb1+nLGmxFG22ZkMsUvpOc0rnd5+6+B+Yu9lkG7Tb0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=T6nNTYyqcN/44ED1yQc2FbtmzPpIO0H+i83EIHXFFwP/gvBL9Ls/aooQ1aEwXFKPe
         yDa6FvXa9Z2IoJKjIqlLn8URhWuwVPeUPovMbkKDENQxlxm0jI7ocvPgMAZIoMieSf
         LRkxZAVa2rAOOmO1oHk3yO6r8rTJUgtBx3mbOSenASEtkoEGxzt1l6WnSwFiZLK2Wk
         WD0MjI5tElbjxgSy1H84EU69AdM6ew/3MdfRC4i1QIdLNlFThXTWuTcn+7TPrioC5s
         Mholhkjb9eGftwyS4nhFQ/PjEl4JokUv+HMMGTMnAsoS6nNkmuYozKuPitqebqUmvi
         /rPAtBSj3Eq0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 56A0FCC13AD; Mon, 27 Jun 2022 06:23:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215651] Battery charge limit is reset on every boot on ASUS
 laptops
Date:   Mon, 27 Jun 2022 06:23:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dragonn@op.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215651-215701-zuUnKtJh0W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215651-215701@https.bugzilla.kernel.org/>
References: <bug-215651-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215651

Mateusz (dragonn@op.pl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dragonn@op.pl

--- Comment #2 from Mateusz (dragonn@op.pl) ---
This is not a bug, this is how the hardware works, you need some kind a pro=
gram
with does reapply that value at boot. They is no way for the kernel to make=
 it
persistent just because the hardware doesn't support persisted charger limi=
t.
Most users on ASUS laptops use asusctl for that:
https://gitlab.com/asus-linux/asusctl it works on TUF laptops too and charg=
er
limit control should work on ZenBooks too, you only need to manually add
asusd-alt service and enable it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
