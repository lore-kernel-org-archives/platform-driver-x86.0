Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F601C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 13:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbiLUNSr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 08:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbiLUNSp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 08:18:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10DF9233A2
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 05:18:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3212561787
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 13:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90FF4C433D2
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 13:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671628720;
        bh=D70QcgoUxdW0WPGsU+dW6o8jXNTD+pi0DRnTtqTtO70=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MKS2akhzD1jweKA2n+k3QTmxaliMWmAKlsQy/ntXv9G2WeatzdyGthKpb7W0i1PY+
         AEG+23lyGeGH5o+8YxSgt+gFBZVcsO0ZgxiLr8vHNxE78Xs5Ap/leTWUJuV10vlPQW
         D1mjUfkJlEKfczI9kDHh0/ZUBwaMdIirTsoGFqIOz4MNuhbeBtSyUA+Z4EbunTFuau
         i69k3Wpc260Ww3HKQnCufQoSJbBRzIOrVERwWnlagI4LC+cLKbPn0BM9jUOYNc66PP
         OpR0PuQ4IQEWhk5m+zeRtbc1XUOmKrqZd6ebi9HAwFsHE/MNKqNZJCzDxXqWWUwKdY
         bA2XWrdJtZQOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 73F1DC43141; Wed, 21 Dec 2022 13:18:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 13:18:39 +0000
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
Message-ID: <bug-216824-215701-6YlwShJ4zC@https.bugzilla.kernel.org/>
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

--- Comment #12 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
Created attachment 303446
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303446&action=3Dedit
key led 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
