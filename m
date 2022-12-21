Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C29C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 13:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbiLUNS2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 08:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiLUNS1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 08:18:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2005121884
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 05:18:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C627AB81AF5
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 13:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 475BFC433D2
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671628704;
        bh=WQwVsc+9DVVxAGLtp9QHKSmClTSSiMwfnBAWqka308o=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QOPunMTXuMPfoaexGGhNVM9+XrbROidCpiQJfn6x+AZNa4BwOmDBcKG7naA+F0zxt
         QICetRIfw3KZWX9MsXlFujXVJpdlL8KxRxJXVaaJtMFwpxSSPO2qVh/31flGMYAA7F
         0/5+ahcR83du3KRZihhvduE+fRgeLYFjS19i/+zmDqmghZGJDstzQXJslcTxblt59N
         fVZBuR8l3BelxkPiFXnJBD3SRyLzKct2DJq+fCgjY0kRRirjY/thT+BtJPTP68VqGg
         Q9wBbfXUIhky+yLzuGscy4QldJy31/fbYgKcojepY5u5aFyNrQCUMjgWKxH6ijXg7Y
         z5YLhQzXUV4vg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2375DC43142; Wed, 21 Dec 2022 13:18:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 13:18:23 +0000
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
Message-ID: <bug-216824-215701-TDBkFzsLyJ@https.bugzilla.kernel.org/>
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

--- Comment #11 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
Created attachment 303445
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303445&action=3Dedit
key led

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
