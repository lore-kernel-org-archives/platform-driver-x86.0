Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D1BEB64D7
	for <platform-driver-x86@archiver.kernel.org>; Sun, 18 Jun 2023 20:11:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjFRULS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 18 Jun 2023 16:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjFRULQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Jun 2023 16:11:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AF7E60
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jun 2023 13:11:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BF6A160F7D
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jun 2023 20:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F880C433C9
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Jun 2023 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687119071;
        bh=csDSgt/VBzlZ4KAoppbaWbpa1o27UGyi4Xgz3K2esNw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MR/B3+Gig3sKbwYz45IWnRAc0R/y2sUDawUtX1cGjLAEv8oteJfr0YAua50qubXxi
         O8do8b4BwgtRzZWa0LwR88eOYlbmaH7029oOFsymHYYcDJMmSFSCc9QQvNYm3QbKF9
         2DAOBZEi+79cnfF9FtjcQFgCau+KlWhZs/bdlB6oTT/VvVbbo4cp2SpNPRMxtMh2jC
         W5e+otM4LBpWT/Ldptn9YAN6stKLZuYX44tK4qzei5lq4LEvjDp/6D+zUuiHTerC2P
         cBPZnb1zl9yonp+2l2jhx/t2tdKBnPa7GQN/hDuEHAdm8HrzbS8AtHf/q07wXmNe+Z
         4n8xcxPk3rYAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0114CC4332E; Sun, 18 Jun 2023 20:11:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217571] amd_pmf: AMD 7840HS cpufreq locked at 400-544MHz after
 power unplugged
Date:   Sun, 18 Jun 2023 20:11:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc cf_kernel_version
Message-ID: <bug-217571-215701-cEFyg8kP8Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217571-215701@https.bugzilla.kernel.org/>
References: <bug-217571-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217571

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com
     Kernel Version|                            |6.3.8; 6.4.0-rc6; GIT

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
