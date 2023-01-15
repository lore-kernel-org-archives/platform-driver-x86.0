Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77AEC3DA78
	for <platform-driver-x86@archiver.kernel.org>; Sun, 15 Jan 2023 20:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbjAOUpY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 15 Jan 2023 15:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbjAOUpX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 Jan 2023 15:45:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6BE212F3C
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Jan 2023 12:45:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1E33EB80C80
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Jan 2023 20:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A39C8C4339C
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Jan 2023 20:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673815519;
        bh=UFSF1zlv8tN8HvWL40F7FEgZFAiAV2cCueteDGMo0tE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NMBVkGOKFbr0uJsYakjD6bW5maDX/VX6+jlRZ+44mu11HZsZXTrMA4B4kHhRELP9o
         2c5oef7XnFubDbtYjRnYiyKJPLP+8IzFC1o8+AKT7S9k3o7S3FTqCXuzoubdtWU4d4
         aINvx8ZGCk4dBsLlkl5++rMgDtzBzhCjGdU4pWR4OAny4EwkCxCBg1E+qncPYfpOzH
         R1Ch15pp8WdgYVsmxyrDRTg2uP78bI+/nzfd3yXF6nOQzOA0FJcFIU2QfIIzqWnbTD
         WMV+AuNwdMeIXyFd9C6wJUOeJCCB+iqfOV4W6bAOHexgfhdP5psucq8UkR5MXQG3Tv
         CiGgUIpxwDPDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 94611C43142; Sun, 15 Jan 2023 20:45:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 15 Jan 2023 20:45:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-ujmaxuo0OV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303548|0                           |1
        is obsolete|                            |

--- Comment #283 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303610
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303610&action=3Dedit
Asus WMI for nct6775 v6.1 base (2023.01.15)

Rebased patch to new commits from hwmon-next

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
