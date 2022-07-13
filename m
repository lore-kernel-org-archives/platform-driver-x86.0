Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2792C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jul 2022 18:04:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbiGMSER (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jul 2022 14:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiGMSEQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jul 2022 14:04:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F112D1209A
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 11:04:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 161C461D44
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 18:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 793CBC3411E
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657735454;
        bh=hJFNu50y+IzW5KC3PXN1b+fT+xQAG1lQSia5Cg+zn2E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eRfOrphoZHPP8e1+scfolxBUDYkraKkIFcwwwyqYtEN2gL/iByujODfBFH+jsWONV
         AQMM+UoNBbTwhBWhUqw/WjGUQ4e9tYuS8cU1/9OHBmjRHDfOyMjqP9TG5zeSdt8I3F
         jB+wWL7NOdEaSLyyBPHEkky6pVP/f4PTxdDcJ3sBS4igwnqHJpuZj4idN4AHqmbyUV
         p4olHRkVcmp2j05ylh6ON4Z0g22ehb06C/naoge7iFK4cH8rH0+f7QRRFz3J9A4rYJ
         hFskNtjjk2pCAdfhqkJXr34bD12LF/tBB1b/4EgR/435QrZpvwDslDHkI62XctkhBz
         zHV9jnF7wzVLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5EBEFCC13B7; Wed, 13 Jul 2022 18:04:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Wed, 13 Jul 2022 18:04:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-8FNJMDPtmh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #20 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Great suggestion, thanks!
I've sent up
https://lore.kernel.org/linux-gpio/20220713175950.964-1-mario.limonciello@a=
md.com/T/#u
for just that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
