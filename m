Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25687C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Dec 2022 22:33:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233010AbiLTWdF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Dec 2022 17:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233873AbiLTWdE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Dec 2022 17:33:04 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35E613D78
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 14:33:03 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F22C61501
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 22:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1904C433EF
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Dec 2022 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671575583;
        bh=g6piuAp9aOKNLuKYa9oqwqdz+pf1x1Y19p9Meqci4fs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Dz3cgRYYv6m7O0wPyAFwGVdPf2ChpFcKIy/KzfOJsJ9acqq2cGCXQOVe0znZCkaha
         G2bvn40RXeuLRP12oCwdAQoVl8jAl4rrJ+PeESfW4ap+ikmR9SGI+DDem/R/CFldZ5
         bYZYyWn3NqOz09YRoKAAlOKuum+yMN6yeaKRW7UYLoHvg+oJOfZjIk1K84pFgrCUJ6
         6PTa6A+Z1NvVGwLIwm37NwxcUkWWXgttpLGi95yHpGwLDqKb3s9u2BSqvRkTlXZ3OK
         L6OLNVr3e1FFHDYZ2SbzxGiDk6mNWRw5AmnNFa77fvXGpZtM83snYo9f/QZVXh9z8I
         eSkH6ygyB+G4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E0628C43141; Tue, 20 Dec 2022 22:33:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Tue, 20 Dec 2022 22:33:02 +0000
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
Message-ID: <bug-216824-215701-n6AMrqvvRy@https.bugzilla.kernel.org/>
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

--- Comment #2 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
Created attachment 303438
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303438&action=3Dedit
smesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
