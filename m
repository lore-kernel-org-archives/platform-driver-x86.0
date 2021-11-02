Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812FDC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:53:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 635B360F36
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:53:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234299AbhKBO4I (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 10:56:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:35952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234284AbhKBO4H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 10:56:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4CCB560F02
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Nov 2021 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635864812;
        bh=obQft3+/23I+/rRqa4odDT2m0kiDtkT90kSb+PAmDh4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SOBIToYURLckEsB0g/TD2gs75JzBSei0ZQ/C7FJoj/E+8TD0MGiRIHLBEtDjIMm8e
         yYUWuqHCfXo/CjZHCEM6IRgQ6I4feFeGqdPt4GqdI8w8tRQSLSVb5jcxyaqhOVn0W5
         7GgUfTE9ILdyDLFIB+rfQcJvJmoXPkvifSZuc1EXfkF1NWLZDAQw6yrzicvZnuhjKJ
         iHf1RW+6DaPyEWt8t/XOywYkpugQGNulhXjHIR70qa5f+jwlzPlE3PXb1AOzK0C7Zv
         XkVZhGNbURNOmA6lBn6wdM8RnsR/c74ZO0Venp2AVnj/avTI3BUDHGlNQkZheSe+kt
         JFpsG3h+LAkHQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Tue, 02 Nov 2021 14:53:32 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214899-215701-Oh8Sqq8wHS@https.bugzilla.kernel.org/>
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

--- Comment #14 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 299405
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299405&action=3Dedit
acpi-video event debug patch

Please give this a test spin and see if any events are printed to dmesg when
pressing the brightness keys.

p.s.

We should really also hookup that WMI 0xd0 event to e.g. KEY_OPEN. Johannes,
that would potentially make a good first kernel patch for you (assuming you
haven't written kernel patches before).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
