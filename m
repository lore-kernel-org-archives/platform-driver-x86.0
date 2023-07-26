Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7698C0015E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 14:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbjGZOYS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 10:24:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234275AbjGZOYR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 10:24:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78706188
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 07:24:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D04B61536
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 14:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69C74C433C7
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690381455;
        bh=0cGs01eZdtxhlGpEQcRUgelqbVzc/Z8VG33SPn2d9FI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ewALofrRIUaZZPGQNZB+RbvRWRHJyRz16fWXLIvN7nNbLHM2TpzcKIps3jre+5QOg
         QIWC7OSyzDA2jGdROFHoxa8MmF2pNy2O+FN3AlUUtAfnoCfdo+dp2b4FM40VRQjFf7
         61AUsVx4oXOHL7bLkkelwyRsWFbR2ID0BzgFEK7ZSULDgTl0Ma7e4ys5qiiMqNpR/v
         LDSWzpAKG7IxaY+RxMhRJgeR+mjvlY3x6QpfNjpaAMczFhwE8hu9Jnv9gHO+w1+My/
         ITBmkV4zbBDdUZE/IE7e8vUDLmlpXrWbVaFM7j+RnFDW5PeJ0EuPJsca/BXOxaRnYj
         Ru2XHuiHPJdAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 51334C4332E; Wed, 26 Jul 2023 14:24:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217696] Looking for a way to enable power saving mode for Ryzen
 APUs, along with limiting the upper temperature and total power consumption
Date:   Wed, 26 Jul 2023 14:24:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217696-215701-g7lYhSpxLM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217696-215701@https.bugzilla.kernel.org/>
References: <bug-217696-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217696

--- Comment #22 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> The patched driver outputs slightly different debug messages:

This looks correct to me now for what amd-pmf can support today.

> Originally I was looking for a way to control my APU TDP(TTP) and maximum
> temperature threshold *without* using ryzenadj because CPU control regist=
ers
> are locked in secure boot mode.

This isn't something AMD supports.  The APU coefficients are set by system
designers in their firmware as a result of the hardware design decisions.

That's why I'm fixating on getting the method of coefficient configuration
working.  Some OEMs do it entirely in their EC, some do it entirely in PMF,
some do a combination and some it with the involvement of code running in T=
EE.

We will need to wait until the other bits are supported by amd-pmf to revis=
it
this issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
