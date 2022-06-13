Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B80CCA47C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Jun 2022 10:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347572AbiFMKzs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Jun 2022 06:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350295AbiFMKys (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Jun 2022 06:54:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1497D13E16
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 03:30:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A2E0B60EF5
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 10:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D03BC34114
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 10:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655116242;
        bh=PHXISeuJlnElXsRTl0Rm1K5iopcAJPoIM1q5qBWHZvI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SZwLRMODJ+FKfd97ZvB6SBJKl6+ct/44JxAbG/TejsGBWEE7aAcgo+3XzACbF3jGk
         jXr+s3ACr77/6ql0OObi5SRTWeRz7r4N14PTLWZs+OHzYxWmKyCctUmtJ5KBxl+9Vx
         JJ64BzL9Hcz842xZrWme4gwCpyG0k3hyZy1E5SEa+fMNS4BMFcVBMef2hhiqjH0yD0
         C7mne94nfQ6SITBytPgUY+idYHSlt20a1RZVWZlZEmzwGdNgRwPZUrVAETDTCq+Pjf
         1bwscxuhRqars1a++3ffqhFYYHd3o2c0WY14cygCbi7tdtGd6K63yKIeTtmHAgehkk
         DDZhDgXVB2mUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E0296C05FD5; Mon, 13 Jun 2022 10:30:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 13 Jun 2022 10:30:41 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-fdkVoT8KsH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #32 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Johannes Pen=C3=9Fel from comment #31)
> Thank you for your help!

You're welcome and thank you for your work on this, your APCI debugging ski=
lls
are impressive!

> My understanding of ACPI is limited, but my guess would be that for some
> reason, \_SB.PC00.LPCB.EC0._REG gets evaluated before _SB.PC00._INI, thus
> leaving the former with an incorrect value for OSYS. AFAICT, this does not
> look too dissimilar from the issue in the bugzilla thread you linked.

Yes, I believe that that is what is happening too.

Looking at the code I have an idea how to fix this, I'm testing a patch for
this now (to make sure it does not regress things on other hw, or at least =
on
my laptop).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
