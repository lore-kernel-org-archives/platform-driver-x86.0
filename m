Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A8DAC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Jun 2022 16:36:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356805AbiFOQgS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Jun 2022 12:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356774AbiFOQgR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jun 2022 12:36:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0C934677
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 09:36:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6FD11617EF
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 16:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1320C34115
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 16:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655310975;
        bh=3ge8TlkKPwVb22/q6HqKHmWzhuGnGVvyKJqId7d0nTc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tIN/BaHgLdp2m1PuZroqEUftW3Cx3FEC8BIkMPOpOqhF2mR+dY0wMaNcauEuDdbT2
         BshMYmLalNb6NM6NTFF75zXjg+/0EveUmAnMjC5O/xSvF4k03G6Z2u/siGrihwzk4O
         iisL9gx/tHupWmX2er0/a5F6rFWfmYeVNVzw73CLqN7tb5uMGUUptoLYgFGu/Rnm/Q
         b+p+vLcw99AyMG+h8YFoyI6ogwHnF5l+H3ZmUcun7AdJSfseBVI7AOqSCgBIPvraUm
         4FZaBEmLTyhIjVw9vzMM+6VMZrTAujw+coXjbZJ2E5fAYM0RjNvQVzLHuIZ49YM7lC
         Q0Ex7gDKrJVVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BD943C05FD5; Wed, 15 Jun 2022 16:36:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Wed, 15 Jun 2022 16:36:15 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-214899-215701-SOTCr3mKhJ@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #301163|0                           |1
        is obsolete|                            |
 Attachment #301177|0                           |1
        is obsolete|                            |

--- Comment #40 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 301181
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301181&action=3Dedit
Attempt 3 at fixing this (4 patches in a tarbal)

Ok, this patch-set should still fix things on your IdeaPad while also not
causing any ACPI errors on my X1C8.

So this should be it, assuming it passes review.

Please give this a try and let me know how it goes.

I'll also submit this upstream as a RFC to get some discussion going about =
the
chosen approach, I'll put you in the Cc of that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
