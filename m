Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6F6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Sep 2022 16:50:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235714AbiI2Quk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Sep 2022 12:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbiI2Quj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 12:50:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1893A1EAF1
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 09:50:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3F3EB82366
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 16:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62C3BC43146
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664470236;
        bh=utXwhY0jaSeb9gJhMjkZQ3anfb0zbUgHE55nm74LLrU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iy1Pt2Jgz7zXtEvDyYkp1SBBlg9/RFybgqQzvsVk45Lm9BS2J0g2iNFRbOGEjRO2X
         D5p3LfQp6ue9xnb1df8/Mek12ms6S301PIutvvrWjItSyl0Bos7JyYTkF2ohMNADBh
         Tohugu3aM8V+K6eqWljmwjSME0MRUy/FOqa8tGedYKUn8vHFXrnhd6QTR+fgMfUjsF
         nkUljN6b/b67Ht1X5ia4Gpm9qjlEi1JT+BvZXAqnfKDSQEIqauW9E1+yHzZlJ8PXhz
         +IYgxX09jyMMYtUcB7ajKuqWhqcLbR4GljFmhET5deR+OkHOjZql5Um03J83FvFrAT
         k/pBWgdaYO14Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 53BB3C433E7; Thu, 29 Sep 2022 16:50:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 201885] acpi PNP0C14:02: duplicate WMI GUID
 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
Date:   Thu, 29 Sep 2022 16:50:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-201885-215701-zZ7c3ZDgiO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201885-215701@https.bugzilla.kernel.org/>
References: <bug-201885-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D201885

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #17 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
This is fixed by the following commit which will be in 6.1:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.=
git/commit/?h=3Dreview-hans&id=3D134038b075cb1dae21623499d765973d286ac94a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
