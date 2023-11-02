Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CC3C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 13:46:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376655AbjKBNqI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 09:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376610AbjKBNqH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 09:46:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C4BA6
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 06:46:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2D3BC433C9
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 13:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698932764;
        bh=MCy26nk7bymouwjXsa10/mZvZlzD5sj4nSk9dJEGnBo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Iy71WWMZ/6DjUHGj97y4xg19Yw8E1avyDjjZX+fd0mFQESuMejzPn0xJAhbhmjEyO
         vtnGvUz/+ftfxEV7U5QEQFjnqhEqynx1ld2iuodGhj9nwQ8cOGdvi8aRzs4TBmHDhA
         hdNLM97A0BNq+4ME/k4EI3bGzzT57PbJNf/7S3F4LIcnTg/S2a4MUeHT/iP/nB0kBl
         BCB8aOCwwcd6oprdXV5pj6IffYxJYr0ETVnwO+SP8e8797tlD8Ws3eTPUqZ/1Y4QQD
         zaC31gC+GLCrHvc8JzB2EevUpx6TFkNKTFrYs2YNyoMA+78qtmIVljxYULgwpKa5t+
         Zz1oS0kEVsz7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 98E69C53BD0; Thu,  2 Nov 2023 13:46:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 13:46:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-y2SJvmdxuy@https.bugzilla.kernel.org/>
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

--- Comment #26 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Because, I tried "sudo apt install apt build-dep linux-image" --> it didn=
't
> find build-dep and show all linux-image* for different versions. Should I=
 try
> to "make -j$(nproc) bindeb-pkg"?

If you build and it's missing dependencies it will mention that, fail the b=
uild
and you have to find them.  The apt build-dep command I suggested was to gi=
ve
you another shortcut.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
