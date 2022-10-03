Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479BCC433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Oct 2022 14:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiJCOcI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Oct 2022 10:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJCOcH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Oct 2022 10:32:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ADF4481D6
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 07:32:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D963560F68
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 14:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 488E6C433D7
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664807526;
        bh=kXbxe+Kzd919fXluXvJ8QG9M7esqsQOOUc346AGUcf4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZFmz4Wxi579wkWFXPX3eSqoVD70ZhMBbm60jKTaIpB0i0tNYWzeSmmi/KJU3FVN8t
         VM1nQi7gxucOI4JcnTNhvxCv/JQo26D8w4ve0e6aabgA9olVNOjnUelhWEuP7y5HWI
         ahx7GO+1mVKhiDplnslUjOmpPndRx2TQ0H5cZ66q3XpD8D4++h09WvBP1iLTOq3Y6G
         EiyFVdpZoun5fchEzFOXE50ccBQhHK9vEdbxsCqOWorWWnhPNPxh1d8uAjEyvhByQg
         rgHBUyoH/xuHVL2NwoTQo9OqgCy+LxB8bg8Em18aZcZOL5kcIjlLLFOFOFdGpIFyxq
         z3YRY7wQjJfOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 26C9BC433E9; Mon,  3 Oct 2022 14:32:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 03 Oct 2022 14:32:05 +0000
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
Message-ID: <bug-214899-215701-RNuQPGYATw@https.bugzilla.kernel.org/>
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
 Attachment #301329|0                           |1
        is obsolete|                            |
 Attachment #301330|0                           |1
        is obsolete|                            |

--- Comment #53 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 302925
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D302925&action=3Dedit
[PATCH 1/4] ACPICA: include/acpi/acpixf.h: Fix indentation

Sorry for the long silence, I'm afraid my workload is causing me to sometim=
es
be a bit slow with following up on some bugs.

I have prepared a new set of patches (with only minor changes) based on
upstream feedback which I will send upstream soon.

If possible please give this new patch series a try. It is based on top of =
the
6.0 kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
