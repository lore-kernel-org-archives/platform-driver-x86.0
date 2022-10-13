Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149DDC4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 Oct 2022 02:02:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbiJMCB7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Oct 2022 22:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbiJMCB6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2022 22:01:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F32B55C94D
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 19:01:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 611246158C
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 02:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9B84C433D6
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 02:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665626512;
        bh=L3Wg0shksHFHZZAoPZaCjmtgZlCPkf+5gSuRSjrP63E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VF2lJy3tXDCQ/4Tfr2Y88tMpihYKFS+4AqmGL6ia2yPy0ArV+40CBGf0hEU2eU1HQ
         7syzaYlYHuZwA6xousJErs3Efa+X7C2ucar9Uvu+kiN5xchoQoMRs1ZCpz5DJkSutv
         Jzj5+YsaMdZGxutnkseOMLjwOH/0vQ94H11iyX9m0qTijYY7FpZtjSmxDzhHV1hxo5
         EdWNyz8S9nblklwOzfXY38vhoZlOJIm6UTf1Q/P/kbT5ENvU79mWKfpsxFLH+sUIWE
         fe1QMFUhiw0C9mZI/qNb4pLyiUwWEti6rieAmzbY5mdzi2SOUxZ9iGxQNzpgnlSuhJ
         qTkVk6ev7fGnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9DE6BC433E6; Thu, 13 Oct 2022 02:01:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216574] Hybrid System Suspend broken HP EliteBook 845 G8
 (a.k.a. Hybrid Sleep / s2both) (s2idle Notebook)
Date:   Thu, 13 Oct 2022 02:01:52 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-216574-215701-TjGGTdZaTi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216574-215701@https.bugzilla.kernel.org/>
References: <bug-216574-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216574

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #1 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Created attachment 302985
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D302985&action=3Dedit
Possible solution

I glanced through the kernel code and it seems to me it's currently hardcod=
ed
to try to go into S3 instead of what the kernel is configured for (which ma=
y be
s2idle).

See if this patch helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
