Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA896C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon,  6 Dec 2021 17:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345368AbhLFSCE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 6 Dec 2021 13:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236253AbhLFSCE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Dec 2021 13:02:04 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1BCDC061746
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 09:58:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 77287B811E1
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 17:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 253D1C341E7
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Dec 2021 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638813513;
        bh=r3tiiaEsWyl+fLhyS/O+ltk7hqXM8ckRjxoro547S3Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YomTGLb9PUqLaLOQGnYZh4kXYKItaN0Xqgpo2Krj1rT26+9ukwfMEORiBKuXWesIo
         ASalK6tbUARpmd0n0sat5lWmA9QJ9XtLukS5JldAO+drkpx79yrcx3f3i6QVcTXXba
         6KX+D8ZNzNujnxIRC/2Hz/32AaNYjYQeld1qkfKtdKUbIvK0V970uLHUblldxL2Uis
         uJTt8O4L+IvOzszPs3v3aaX9JNSBWaCwUpO19YdCGGV2yiqzhMyslFFmzbtRccd+aQ
         dW9cfRjG9yvE0EWwHwzPPMUv79cmLOwsyWkFT8WoGj0721MDt4vkzDqVHpcUKo6C8D
         4zFE0CZjtd6TA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 0B5A661182; Mon,  6 Dec 2021 17:58:33 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 06 Dec 2021 17:58:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michael@theoddone.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-TwCGuij6ma@https.bugzilla.kernel.org/>
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

Michael Altizer (michael@theoddone.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michael@theoddone.net

--- Comment #189 from Michael Altizer (michael@theoddone.net) ---
Probably not the best place to put this, but I can confirm that this patch
appears to work on my new ASUS motherboard after updating the asus_wmi_boar=
ds
table with its board name ("ROG STRIX B550-A GAMING" - it's just a B550-F w=
ith
a different color scheme).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
