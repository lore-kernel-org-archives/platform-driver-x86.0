Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19A7C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 07:02:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiGKHCE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 03:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbiGKHCE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 03:02:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1547140C2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 00:02:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7EC2FB80D8F
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 07:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D66CC3411C
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657522921;
        bh=H36CrZidTLuUwcv7IzXwt03hydq6H3fvjQD27c6EudE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eBeghJmaPvZ+lHVFtOQgG1S/dwNQw271Or22KKs1EjIMnJCs+Z7iBcebrc9/V+6KM
         U2w7sT9ZH5l/6Ck2xQPy+3uv21sRqbKJRxr4ivMUKT0Ygq34MipBFD0L35eYkvsdDE
         i8GuFiPTUrPhOzkFnTcpJ+SUEiTtJW412HCObomN1FlrVac4zBM3wCmkxVUHodwbbi
         vojLmYUGWmOUGAW7siUf8lOZFUPZRnel9Neb3bZ6f40KymyDRNcdmudC5ccwAYmdx2
         AFNWsS1U2X2NKEpTwy2wWdD9zFNXRMNure15sBYTRYPWZX3jqty5JBaY0zJBe3vi9/
         Kzeai53diMOlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 10849CC13B0; Mon, 11 Jul 2022 07:02:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 07:02:00 +0000
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
Message-ID: <bug-216230-215701-Ic34WSNzSX@https.bugzilla.kernel.org/>
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

--- Comment #5 from madcatx@atlas.cz ---
Thanks for looking into this.

It turns out that the issue is more difficult to reproduce than I'd origina=
lly
thought. I saw a few cold boots that went fine and one warm boot when the i=
rq9
fault happened. It looks like the cold/warm boot was just a red herring.

My machine is affected by the NVMe slow wakeup bug so I only started to use
s2idle since kernel 5.18. As such I don't know if this is a regression. I'll
see if I can downgrade the firmware if you think that'd help you track this
down. FTR I'm on version 1.40 which seems to be the latest one as of now.

I attached the requested logs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
