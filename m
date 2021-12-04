Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01FBC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Dec 2021 11:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhLDLKD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Dec 2021 06:10:03 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:39186 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350310AbhLDLKC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Dec 2021 06:10:02 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5BD8AB80CBD
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 11:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A308C341CF
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Dec 2021 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638615995;
        bh=87eMuxmf84X7XQGDkrsJx0ozAD6hMlPZdgLFE+IWO8o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gZCEqyTmTsMwexC/tl5nbygGhJL/9v7gdCwJx0MuNgD6TyDD4ZzDCfoZmz4t8go5F
         id7Dkz+mMvv60VdIOiQeIiZfms/3cijmVHOkLK4jS1G4Bk+WYDQaFL5CIruXqP2jiN
         li/AWbF5Q6HqFyNCKCd1RpSeYJXOuUsmguPYrpg+Z2QiKbysuBrN2REf24qRJjWI88
         ehqwYvILDxs1tmTnCa1ShTa36mmVJR53k69zOHx/C2WzbjZqSNTh75/IhUPo2u+dZq
         bpt3NJiRvlT1+vzyVakgXuSTtBsVjOAoCgyuvfNDpFD5pJ1BKW4Nd7L6Ej+tfPGF1p
         mLyEN0XTmD7OQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id F1EBC611AF; Sat,  4 Dec 2021 11:06:34 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sat, 04 Dec 2021 11:06:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-199715-215701-AsuNKP8ndG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |superm1@gmail.com

--- Comment #62 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Add Mario. Mario, can you pull the strings to unstale this efforts?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
