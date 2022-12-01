Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89941C4321E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Dec 2022 02:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiLACLh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Nov 2022 21:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiLACLg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Nov 2022 21:11:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B45D9D827
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 18:11:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C1D6E61E32
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 02:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E677DC433D6
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 02:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669860693;
        bh=NwrFdoPCuCJiC1YURFyZuJ+vBzBBkGhI9whweL1S1UU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=e5iAb29ah4cvsfThxqHR5vTZh8coLA5JjG1A83LDNZ1CueKZHteV9vXCwCsFgbbPw
         HKeHKXS5mgDp8r6mLtIK3pflFGN42RWixtlvzW1tdmgCkQBEN2CRh2N0N1hVtur9xB
         KMXr9DkTqQ/N5z8jYdcCb5eqfumgSYLeHMASJ+wplorRyxeDoPEzhug2zbuIHwI6xv
         V9kYL0OY8PwjDHWUX/ha7EIDl/8qnBa55dImhnb5GzCVw/AjR3SjM6os4pkMZbNCk9
         U/rDO81hKHN1I+9IbV7vU2WKAGoF+/EfJZXBp5L5XbVNrnqYpmS6h7ZINs+3PRjEpU
         pQaBrpOlLaTug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CDF0CC433E6; Thu,  1 Dec 2022 02:11:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Thu, 01 Dec 2022 02:11:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REJECTED
X-Bugzilla-Resolution: INSUFFICIENT_DATA
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211741-215701-XKIVq5DSxe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEEDINFO                    |REJECTED
         Resolution|---                         |INSUFFICIENT_DATA

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
