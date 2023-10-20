Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F1F6C001DF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Oct 2023 02:00:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346788AbjJTCAm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 19 Oct 2023 22:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346827AbjJTCAl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2023 22:00:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D5C126
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Oct 2023 19:00:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B156C433C8
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Oct 2023 02:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697767237;
        bh=MIUzfFU3nMmaX7f5DuSmOp+qA/qnO4Av0C/ntqucXZo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fSgc+I/sQ7fzWIMRvu43nIgfO2Vu4X1eS2Ieay59dQToD5A76FJ8NxhMMziXJW/W1
         qLb2NVhaFQMkQugex2Q87mRwr9lzXRJPio0VDSXW57NE3gi8O68NEo0qAVfjVbZtr1
         0iiSmYAdNO8gtdsPi7OKQwmkviKCk9ja9S6EZoH4cteOnLNMvO1SoWyA9kz4e2z7IS
         zfKmRytxBvaAgei7cGvxNazINzo5OhBtEAYu7CCKYL5SxjD66ZNnUrU46JYt4D6OyK
         3SDrKuzM8VJsDEncWWmMYHkPWi3R/NFTIUYLGj8R6inzT+O067AjmoZydAug+UnuWc
         lkkP9QVUtpAfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2A507C4332E; Fri, 20 Oct 2023 02:00:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218024] broken suspend to idle on Lenovo V15 G4 AMN (and
 related laptops)
Date:   Fri, 20 Oct 2023 02:00:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218024-215701-JDyJClFpcv@https.bugzilla.kernel.org/>
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

--- Comment #13 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
> I'm starting to suspect that "AMN" stands for "AMD MendociNo".

Oh man - can't believe I didn't notice that! I think you're right. I have no
experience with Ideapad naming (I've always thought ThinkBook was strange..=
.I
think it follows similar)

I checked on PSREF and it gave the platforms you found. I think you're good=
 to
go.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
