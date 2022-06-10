Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC13AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 20:07:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346780AbiFJUH0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 16:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244918AbiFJUHZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 16:07:25 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3D623D5E0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 13:07:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 24EBCB83766
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 20:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C86E8C3411C
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 20:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654891641;
        bh=oxzMX4cp5plu8InDMw+pm3bgLUXVhHF6pz2w1S5iBV0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PNm4pphqGgjrLfwkK8gRN1UxZcc82SmyHy4TMEZlb16wzM/urbBKk2ISOSisjYHmS
         4TqRf3tyJ024NLvYFAgHDwa+r4JtIcx+kd7Nj62AUSAZL2t1tKw3KN703g4DstbAQg
         3veuzFrvyCAaAwuLusWJwaUMmbksyxc+EALlTUG6U36y+vK0/Mq37tIjNdClxDiHbg
         aU4l0aoWBk3XHMGqs2T9YxwyLxFppU6Og6DXfSEEu5ScbTbZr792EjreBlravqH7Zg
         ReyNfJOOx5697YoBq2A5/SAWkEi1hW9mOCvP/eBftJ9VXybPok7Eyn0wfxwgVM9lHc
         eoz783KagVDwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A2D75C05FD2; Fri, 10 Jun 2022 20:07:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Fri, 10 Jun 2022 20:07:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-DDvb8QuZOM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #28 from Johannes P (johannes.penssel@gmail.com) ---
Finally, I have managed to get the keys working.=20

Using ec-dump.exe, I figured out which EC registers hold different values on
Windows compared to Linux. After writing 0x86 to offset 0xA3, (which is 0x8=
0 on
Linux by default) the keys started working instantly, with proper ACPI even=
ts
and everything.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
