Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 652E5ECAAA1
	for <platform-driver-x86@archiver.kernel.org>; Tue,  1 Nov 2022 13:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229487AbiKANUs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 1 Nov 2022 09:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbiKANUr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Nov 2022 09:20:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD3EFD08
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 06:20:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 99721B81D8D
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 13:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B208C433D7
        for <platform-driver-x86@vger.kernel.org>; Tue,  1 Nov 2022 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667308843;
        bh=t38wugJrvthCDP/f7ZVORzlGxLVdrbdzRf27DaYKNNo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JAR4XcaWAO0YpwVGHJf6spkxvp2lbFDrp6sWtXE2QNOhf5KyyxF8ZwmE/VHaTZYPh
         mrvXxP6HXe2SLVWavsVkXquLcM2S7hyLqrrJ1Ke/fChloUarjObpwe+kQPfjXgZVZU
         OcbAWAnHrei3Qs9tkKqhm1l4pBeKFnmDUC/6iNDAkE36mvQJ4z9RO++HZWkuGF+c22
         xpbjwvR7KY9eXSvb7GgUq+eIpq2uGYSWKQFTib9CoevEvkDvgDz1dU2eeeGf24rpqT
         C/G5XN9i/zkW3H7kF5WYzinDqJdL0gBuf3Wx/BnLkUxR8obh/SS4EtrlnXfYyd/T+X
         pacc7sMy8T7aw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0D18BC433E6; Tue,  1 Nov 2022 13:20:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] first hibernate to disk fails on HP EliteBook 845 G8
Date:   Tue, 01 Nov 2022 13:20:42 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216647-215701-NlAi4s0X52@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216647-215701@https.bugzilla.kernel.org/>
References: <bug-216647-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216647

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #1 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
2022-10-31T14:01:20.603318+01:00 myhost kernel: [  150.051133][ T5939] amdg=
pu
0000:05:00.0: amdgpu: 00000000604fe5dc pin failed
2022-10-31T14:01:20.603321+01:00 myhost kernel: [  150.051137][ T5939]
[drm:dm_plane_helper_prepare_fb [amdgpu]] *ERROR* Failed to pin framebuffer
with error -19

This is probably at least partially:

https://gitlab.freedesktop.org/drm/amd/-/issues/2213

You should keep an eye for when the solution for that comes around if it
improves your problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
