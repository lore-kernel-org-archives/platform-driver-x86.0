Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A508C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Nov 2023 16:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbjKBQcs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Nov 2023 12:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjKBQcr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 12:32:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD2312D
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 09:32:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34694C433C7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698942765;
        bh=0n03wVCclDcUtOSNJKQstp2fvS2iIWUq6wVYdvMdWCc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LUTrObjBIXU0xlUUQPdtv0HcYsbhj/8UIeAEA+P2CJcE0B5DrMS3BtgdgNQ2IumoF
         k1KF83vQU8gBXHDFHoF0rxq+OfrqtNVG0xmxKJyRoEW1QzK/TD6/oOKB7k6AJI7hHg
         lz/sm+OY1J6ZgAU9TxymRfuAx44xzY4TwbRhx5yHnrw/3ErfVns8tH7He78Y/+bFWE
         DwDjZFKQpdAlWKOdSW9YogZXsvtlCVsTcLL4UjqaQubqM8nOmXfozsjwtrhKMH9Egj
         laAjGzYkHE08CitpfsPtfDOn/i1bDJ0AynypMmpobKXbVNmw2ToL92OO1LxTgXFr5G
         4+xHk6hovrW0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 14D23C4332E; Thu,  2 Nov 2023 16:32:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218024] broken suspend to idle on Lenovo V15 G4 AMN (and
 related laptops)
Date:   Thu, 02 Nov 2023 16:32:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218024-215701-hZQmxNNREz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218024-215701@https.bugzilla.kernel.org/>
References: <bug-218024-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218024

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #15 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Note the fixes for this have landed in 6.5.10 now, which should be available
through your distro for Arch and Fedora users soon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
