Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A80EC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 13:49:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbjKNNtM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 08:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjKNNtM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 08:49:12 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E8A01A1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 05:49:09 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98578C433C9
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699969748;
        bh=peaE98/BbgG2vDtmXa399mmsOxFyr0rPZdJtKJccpJQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A3LNZ98zamc9feuuOIBMW5yN4EeNqp0lma1VJK9bEwotZBcyOp81ogsvI3i5V+YU9
         JLfAcjQsJOHW+o1x2Nw352e6LNC89MIZt0sjAkFJFtgkla4z+NMBdxiOv+E03Dw27a
         agwPnvrch/ngjolE/270A7eOZZ0sP33VJV8//SFHxwxHBoQZit6AiJiTHyiMuXElOn
         rH298dGYgE6/A2PWeToa8OpgqVoA3ukzTZWELRLTPXvgU32dKCFGXOt76rzRVPktY1
         nQlOzu0Er3HGf5FB9/K1EebOB0cubv67+Z/3U6bkva9a8OiXLbXxCeLaM1ptarXhY4
         tFZTyyhiLVWuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7018FC4332E; Tue, 14 Nov 2023 13:49:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218143] platform/x86/intel/pmc: regression found in commit
 804951203aa541ad6720c9726c173d18aeb3ab6b
Date:   Tue, 14 Nov 2023 13:49:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jahutchinson99@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_bisect_commit cf_regression
Message-ID: <bug-218143-215701-M1hGEK9b9a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218143-215701@https.bugzilla.kernel.org/>
References: <bug-218143-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218143

James (jahutchinson99@googlemail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Bisected commit-id|                            |804951203aa541ad6720c9726c1
                   |                            |73d18aeb3ab6b
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
