Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B01C43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Jul 2022 17:29:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231970AbiGMR3y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Jul 2022 13:29:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbiGMR3y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jul 2022 13:29:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5543826577
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 10:29:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E404061D0A
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 17:29:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 440A3C341C0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657733392;
        bh=MrIBh5CHdLX9sBsel9LKKUuryS4DdnTXtxtx4xuGKKs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tsXsPRgu9dA8cwLtS0IvonYroKppHhVxk96Y8+UMzB0Cm4eRJXzVcGfPRB+sLysy1
         My9bL+nfcPvuOPoxvFg1axSLdeFENFBjwxFJUIFJ3iVfu6uZNl2thbbQeptf/sj0BX
         +9/ujB0GFcSlDUIjIEj6FnxZgZNYVk2wGiyhufnIVzpOf5Hz/fqQH147/KPwquCx7R
         lH48e6cW1nxGdZj/55se56jZRI/wUec28LnmL0fJX41FTegfZA5vop73CsbIIIT2Pj
         O2Rpah+R0I5PbGTHhjv7Ymwvui7JTNZrucQkYqWQPwDs5dXqH8o9tsBITRyMslUHh3
         T+QWFeGZL6GMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2C7E5CC13B0; Wed, 13 Jul 2022 17:29:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Wed, 13 Jul 2022 17:29:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216230-215701-Qkh8gsG14E@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #19 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
> I'd say if you don't hit this in the next few days with this change we sh=
ould
> close it as "DOCUMENTED".  Mayyybe we should add something to the Kconfig
> text to warn about this?  Not sure what else can really be done from the
> kernel.

We could consider changing the amd pinctrl option into a bool instead of a
tristate, forcing it to be builtin. In general ACPI tables may rely on the
pinctrl through GPIO OpRegions in various ways. So making sure that these a=
re
available early usually is a good idea. I've also seen issues on some Intel
models when the pinctrl driver is not builtin.

Note I just checked and the Fedora kernels already have:

CONFIG_PINCTRL_AMD=3Dy

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
