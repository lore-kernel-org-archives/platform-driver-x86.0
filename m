Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D81DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 28 Nov 2021 20:17:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237092AbhK1UUP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 28 Nov 2021 15:20:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbhK1USP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Nov 2021 15:18:15 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD685C061574
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Nov 2021 12:14:58 -0800 (PST)
Received: from mail.kernel.org (unknown [198.145.29.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 651BAB80D5F
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Nov 2021 20:14:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 23F0B60E94
        for <platform-driver-x86@vger.kernel.org>; Sun, 28 Nov 2021 20:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638130496;
        bh=Z+ZmcMvVe9Mi5MjFeDSrrxW6/FFYIJK/55v7dY72X34=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KBoqlXdGUWBC/dIfL7d2wmgChvEos1JNE/rvubm8s9jkkHK/MuSA5nugj2XxZzUc3
         R6Qw154LwFC7qa/nTlWPvcczdy6r6IigofAgD5t22t/TjTZGaMqydOMK1/mBMODA0R
         Zc6EBRzxH/WzjSyB9DKSNfMAMyhQD9nte5J5RtNW+SIbOtwggbedXsBrE9jfLSUagx
         VQZjA5Zev0wO7WHBt3apDuE3MlF/BnrTeh4AS+j4VFmc6sQm6/hj7rBYeMJiaeH/VA
         tvqJsE03yl7LN6YK2LwlKgmsxXKTKv7c57AVxyLCgwUO1Qec4bArPeiM0ypUhAG3RZ
         w0x4odX8o29ug==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 20E73610E5; Sun, 28 Nov 2021 20:14:56 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 28 Nov 2021 20:14:53 +0000
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
Message-ID: <bug-204807-215701-FUwWwwbSCN@https.bugzilla.kernel.org/>
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
 Attachment #299537|0                           |1
        is obsolete|                            |

--- Comment #173 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 299757
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299757&action=3Dedit
Rebased patch with i2c v5.15 28.11.2021

Code have sent as part of https://lkml.org/lkml/2021/11/28/225 + i2c.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
