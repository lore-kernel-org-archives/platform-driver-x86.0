Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B75C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 19:10:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiGKTK0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 15:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbiGKTKZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 15:10:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E36431DE9
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 12:10:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB52761531
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 19:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48F4CC341C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 19:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657566623;
        bh=lHE34DlAIeGnh7a79gtzOJ0dGOQGrYPopKod8UquyFg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=h4KnILpxTtlIyVFePwW2AX0mggNh1YxJosZTZ1APiXYc0i+rThh/JNvrXxZMcD/Lc
         HN6/LHvVcCDNCnjRjZGL44jfdOWMAnsw04SsDd/+VfeLWAeZnglOzfmFYDuhlA3aoB
         5ANZ2Vz3a9LrknXTh0vuV2m3VVJgzX9gRg6RbH2iMUFmA+vbJRvLBlwQLQGLxr3yJE
         t6v5hbzhF2VbRcVwjUaC0CGr2WEtfneeLLkImAZDn4mvyW5B8sh8mW3UZKrCuoVzbf
         GXuiEM6jC6IsfP2EEGz/Q/5L9q5VZmvgmgCIo6FH3WOXTpsfT/v7C+CG89nS+GPnZD
         b4o9CUz4qS7vg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2ED5BC05FD6; Mon, 11 Jul 2022 19:10:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 19:10:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-wdtaVzGYRn@https.bugzilla.kernel.org/>
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

--- Comment #12 from madcatx@atlas.cz ---
Is it pinctrl.dyndbg=3D+p or pinctrl_amd.dyndbg=3D+p? I used the former to =
produce
the last dmesg dump, the latter doesn't seem to do anything.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
