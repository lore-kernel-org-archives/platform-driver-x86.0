Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58F69C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Dec 2022 22:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbiLTWct (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Dec 2022 17:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbiLTWcs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Dec 2022 17:32:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B40413F9E
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 14:32:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15146B81674
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 22:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0DCFC433D2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 22:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671575564;
        bh=25CzUgqmyivOJWfo7TZk8rT4FeTAB9xPGT7/x+JD1Uc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DWTqr8zl3YckxHo57AKi19Qdex84ob2OEfhDhFa/MJwRdQ4wTh/FGFvNxsmXf/m1w
         jQw+BYy3KyIjJnL7FH0zi42Cpe8m7HLppi8id7XTY5xgLbCy16/q4sVaZ5x/kdoTKF
         2uU238H9jNoYtaUAvZq/EAInTOY2tipchW9JDqVoRWnR/+gj4qg9skdcdq6/KqBjl1
         /8W1rLHVLfvF/OMVqeEaVjP9ertD02hETkcaxWju9/SPOQGnC0F2WTs9zA0yYmJxJq
         nlsDZHODMplD09GMphEzIXeMHvR+bHy03ZXaSdzK13EMtLW5iPj5xpO5S2RIt2bzqo
         lOy5T3ICk0Apg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BDE76C43141; Tue, 20 Dec 2022 22:32:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Tue, 20 Dec 2022 22:32:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216824-215701-z8HDbSjbFk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216824-215701@https.bugzilla.kernel.org/>
References: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

--- Comment #1 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
Created attachment 303437
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303437&action=3Dedit
evtest

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
