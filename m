Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0E5C433B4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 May 2021 16:23:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6DE661057
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 May 2021 16:23:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241069AbhEQQYf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 May 2021 12:24:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:44994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244967AbhEQQXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 May 2021 12:23:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5137261019
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 May 2021 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621268519;
        bh=/pIsLMIKDvXs9Rw1caWQNndEXElIZ7pyYqdZXe5QSsg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=scjcdQDZwhpJeezi6JdhHPVU43A2UarXeKzZtEBV0NKqK+9iAkrW0PxF2udqo9DmS
         gazvpDDh1Gmd115OecAtmfwhvo0bDSWOjdaf1UNsBRk6/SMJo43UQDrJbJe0MBejag
         AR8uPsWHOQvIu2LQeJ3A7ONex7JvK07rh4AucIgNOTWLdwLho8s43aC4uH+yXXvzbe
         GuyGEylOp7kPabqAQKEQZaO+vJnR5JIPQakoWhlKb9mJML5JcDpznP8l2Sy+PpABgg
         riaSck07444HDx95X+Mva1H9YsQLHF2uwdAIkr6cQmW7K+gFwkfkybrXvr6OOBrB2w
         vZKI+8Zktm3LQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213109] ideapad-laptop: Regression in 5.12.x for Battery
 conservation mode
Date:   Mon, 17 May 2021 16:21:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pobrn@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213109-215701-hMlGieeigl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213109-215701@https.bugzilla.kernel.org/>
References: <bug-213109-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213109

Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pobrn@protonmail.com

--- Comment #1 from Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) ---
Thanks for bringing this up. The issue has already been reported in
https://bugzilla.kernel.org/show_bug.cgi?id=3D212985 and a patch has been s=
ent to
fix it (
https://lore.kernel.org/platform-driver-x86/20210507235333.286505-1-pobrn@p=
rotonmail.com/
).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
