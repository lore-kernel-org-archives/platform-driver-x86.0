Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA099C433C1
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 16:05:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9336761968
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 16:05:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhCTQFA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 12:05:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:47300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229787AbhCTQEs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 12:04:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id F06C16196E
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Mar 2021 16:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616256288;
        bh=V30gAALFojIgpr1SvXVhzvwK8J6Y+p6NItzBB9zfFsw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BUoOIjO0sMZYxO1B2hyj47KVFs9ZAkyQTtajb2FJEmZwxPpt/9BgX8ZfAGR3XO9FL
         ghIteBbzg+XxTDm7mjjctugrpD4+bMXLy1sdDrqN/7NU9Eq41qcUt1Hh0e4AoZJXrI
         krt/RT78W4IKVhR7y7kO+8USaERN6RxmnmG4jH8aDuI1Ke4bJUMQ9ocVy4m2blDFPx
         EuC89jLc9PItvps9rn39BikctFaCqmlIEqYvXmb6n5kIv8ctfRmbn/AA2RFm7NdzO6
         UnBc2zRGanWEaW1tZ+Hz4lgsyMBkPtcZOjO7f+T9enxWDLTWrfJ+fRVsRoHx8tdtJe
         aLlGk4J6cjB/g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 20 Mar 2021 16:04:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mjg59-kernel@srcf.ucam.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204807-215701-RyXhssiZls@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Matthew Garrett (mjg59-kernel@srcf.ucam.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |INVALID

--- Comment #45 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
Artem,

Nobody is denying there's an issue here. However, the issue is that an
additional driver needs to be written for this hardware. Please file a new =
bug
for that and do not keep reopening this one.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
