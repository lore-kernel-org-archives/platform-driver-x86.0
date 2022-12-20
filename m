Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D43C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Dec 2022 22:33:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiLTWdz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Dec 2022 17:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbiLTWdy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Dec 2022 17:33:54 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A05C13F9E
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 14:33:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A204A615D8
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 22:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11EEBC433D2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 22:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671575632;
        bh=xXabqRpA8D1oyg1cLSVcgiSsSum/vpAg2PECCxYaqpw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pGtms02G426QDixpPI7oOHqe46xTmupqgHw62tvq1W9vTOxomY6FW6bAB6ZSC2mG+
         EcVZrCNPuO0ZpvOmmgS7+tGXf09IX7nVTGBwmCWJYPVhZrjH1zc6fm789M3HvClhRi
         pFKI52l5XWo9prrKSWYaIRLblLwBpsaoYUS6aCNetrnt/2rjaL2yaDYLtHPXGsPi38
         iFv7sBa13P8YRqy2TJ7d47LOf7aT7P1dRYPW/AN6jcKMgTsWswTejGtUY6FzpX5jrK
         wEZaPCukRXOkTehM+A6Q+2XSQQdkcDYoLr4bqvRYUVzoD9hSunWYBc046DOKrKXcZH
         E8niMNE5xPxXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 016CDC43142; Tue, 20 Dec 2022 22:33:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Tue, 20 Dec 2022 22:33:51 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-ilZSq7O2um@https.bugzilla.kernel.org/>
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

--- Comment #3 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
3 files annexed: image, evtest.txt and dmseg.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
