Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AB4C433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 10:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A607161242
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 10:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347045AbhDGKgc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 06:36:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346649AbhDGKga (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 06:36:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2E8B46139C
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Apr 2021 10:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617791778;
        bh=hdE04yoTWyEyf9s5S6kQB+wRqWkjDhJshX8+hkx2EZg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G6naNRunYi6ip7QVRRPXMn2Qx5h6GhaYxjfO/ND5uSp0WjzUOY/mQG75pupERBkde
         Hlu6+SC/sWvLLawvMgqZsgMkuWR0LQOkBIsXHoP80swzW461G8djdz6dn6jlMPqX/E
         x3BKKjzm1ekKpiGf5sD95yQbgTtEJ6+eiI0mr3moAI2v9x67owW6J8IAYvPKkNeQ/X
         SveBSBKK+raREot/qVim7oCOrSd45QUecLYaD6g2p7BrimYQEgOweLEete1zox2pid
         3rkygOeY6eWJ+vGZaZE6uSgp7Z8tU8HgYK/sImVmQQ7E5ilHHC0qC5r4Q9uOL0bL3M
         AGhH+FgtO1OEg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210457] Fan sporadically maxed on wake-up due to unavailable
 sensor temperature
Date:   Wed, 07 Apr 2021 10:36:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210457-215701-9YvtoIKKyG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210457-215701@https.bugzilla.kernel.org/>
References: <bug-210457-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210457

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #9 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to cfr from comment #8)
> On my machine, the issue seems to have been caused by a firmware bug, whi=
ch
> only manifested in symptoms with the kernel update. That is, the firmware
> was the same for 3+ years with no issue, the new kernel triggered the bug,
> but a firmware update seems to have resolved it.

Thank you.

Can the other reporters of this bug please also see if the latest BIOS reso=
lves
this? ThinkPad BIOS updates are available on lvfs, so they can be done under
Linux through fwupdmgr.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
