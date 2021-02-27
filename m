Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A55AC433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 27 Feb 2021 13:11:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C87564E69
	for <platform-driver-x86@archiver.kernel.org>; Sat, 27 Feb 2021 13:11:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbhB0NLq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 27 Feb 2021 08:11:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:53474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229990AbhB0NLp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 Feb 2021 08:11:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 652EF64EC0
        for <platform-driver-x86@vger.kernel.org>; Sat, 27 Feb 2021 13:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614431465;
        bh=h7fzdMA77YiP1zKVRbkJ7cUYsokQf9J6rDOTmJuY8qs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rO/hpm3n5LW0os/7vmwi9KBKZ15QNQy7wDBTDuL/Yg5u1zRsGWED7eU1uKBpg+kVO
         bcqnL7utxHQcEQy1whiznSday8Wkr4x4Xu7KFnky2GfZbDiWnUFzeKd7wBNM+FTX3z
         1UYAvGI2mM6ao3nBG2C/K8gIyLdmdm5ZprkqLAcWPZv8/vSKNZjSGNirxM/xR9+wsW
         JAc2QPyGUfFL1z8AFjBm+9epfP42PAeJTPUknYtl4wtcMCPLQdt6s0jYRFW0YsBdII
         6AlzNA1OOakmufkg3l1BxANXYMarZZDBnzX2QkUNbtuhohMytY3ZsL8O2VGRrQ4z5e
         JCbIB/1Bpsc0Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211977] System fails to resume the second time with 5.10.17,
 resumes fine with 5.10.13
Date:   Sat, 27 Feb 2021 13:11:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-211977-215701-R6o5HW6tIH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211977-215701@https.bugzilla.kernel.org/>
References: <bug-211977-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211977

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
