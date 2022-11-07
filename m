Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA98C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Nov 2022 13:36:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbiKGNge (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Nov 2022 08:36:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbiKGNgc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Nov 2022 08:36:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 947DE14032
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 05:36:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2F03BB80EE6
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 13:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3A9FC433C1
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Nov 2022 13:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667828188;
        bh=yNBSXTlARLkAqXgfpIsH9kp645dSbyE64L0/Yd5wSc0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J8Fl+mRGFmZ2a9OcZyGRspC52brn63zhvzs8kdnuLAqTloOapkpUl939DGsuRR+KA
         Y+lTsmp4oUPn3uya4Qs2/DEGEGO5GvsBxrUMMojEX0BvqYHH6utswFV060YOT50Ymw
         VEXYcU2Jf+VrSyqLJqLPZq/x1ZLCCCuM6LJX1E1Yj4IoejzfkqYw8uNVri00+xFiJx
         NaEFBfs77GAOBBujgFHReEyZS4HLbbUs2/Ne9sJe7rNAT5ScAhyFONt3ffv2pheQhm
         ozQikaFDHn9AvA+lSeqdI+DTXIwmc6s0BnOWjvEosDGrvCu2WhROpM9cHH20uoc3Pj
         GAdUpuQM4v1AQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BC5F3C433E6; Mon,  7 Nov 2022 13:36:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] first hibernate to disk fails on HP EliteBook 845 G8
Date:   Mon, 07 Nov 2022 13:36:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-216647-215701-LywFlxHHct@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216647-215701@https.bugzilla.kernel.org/>
References: <bug-216647-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216647

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #3 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Two of those three patches are in 6.0.7, would be good to know if that helps
your problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
