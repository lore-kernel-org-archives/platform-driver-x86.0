Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D64BC4167B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Oct 2023 20:49:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234898AbjJaUtV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Oct 2023 16:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344584AbjJaUtN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 16:49:13 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2C3D6B
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 13:48:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0569DC433C8
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 20:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698785313;
        bh=UAovWrE8UhG/kBTv7xNrh2bFKXDG7P4jonfnlzavUCE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=q886vDtw4fvfH4E7XVSVU+NUaIS5aW0vKBwSiSRLV36c+rKSM99TuCBFq/tJtCrsH
         yUMVzApoSRGPxb32ImgUFkF3WZ9377D7M7i81X0bJY6Z8iw4HPIIKzJQg9VuWdjiQN
         /DT7w7hGdUdwDxgtjYBaGrgxFwX4HKxV4bGPBU1vWPtm6fjaZ9w40XwE1yLKlWZWP4
         ISPHdcIO3x+T+9JDi3qj6D3HgOFEgEImf1JzklJ5iid3CN+9n4Ch30Xr22CM/bwdeu
         t5xidozEKicmonEkWyslZx1NkqtMiBqtm+gH64UDnOJKFSJzH/YCvnfa5BBUG6x1op
         mb1Pwe/0yrhUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E9699C53BD0; Tue, 31 Oct 2023 20:48:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 20:48:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218092-215701-F2jXmDlrdR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #12 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 305346
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305346&action=3Dedit
possible patch

Here's a patch that adds your system to the quirk list.  Let's see if that
helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
