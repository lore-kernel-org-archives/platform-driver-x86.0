Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92834C05027
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 03:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjBMDHq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 12 Feb 2023 22:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjBMDHp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Feb 2023 22:07:45 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7BAE9EFF
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Feb 2023 19:07:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 467D360E8B
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 03:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA92CC433D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 03:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676257661;
        bh=yXXXxq/8sUhrm0ys+Dz7lvaYvDVeVnh/iC83Nk095nI=;
        h=From:To:Subject:Date:From;
        b=XACCgW/uVHCWSjhfXvVqCyNUWL3vlqxc+WQSNBKVR8BYxPZMv3TycNaFOnLARK/ZU
         +Y6FWj5H3BywS2v73ZfNhz8EXMPFEtJVwWvbXJ8B+8m+zVc9eCu7a6UybwAX+/ctpC
         lOwb5XVks2712wyoAGlPBvczs1PTUmgpHXXbZ/6cve3cZHidGHsp7DB4uTGjkx97+E
         VHhvzUH+bvbfCC75ZwMKULDId2LgEo5jJGwkJka00r6NID0u52UJdf7Z7u39rGKHyS
         MqdkyNSm5ZaV47CjlF1vJ4CtQZlK1Ni9vVeR7dA21BFbfuSxEMRS0MIX1N63XYT9ux
         mur2eQ0UG67rg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8B375C43142; Mon, 13 Feb 2023 03:07:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217028] New: CONFIG_AMD_PMF missing CONFIG_POWER_SUPPLY
 depend/select
Date:   Mon, 13 Feb 2023 03:07:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: z@pyl.onl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217028-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217028

            Bug ID: 217028
           Summary: CONFIG_AMD_PMF missing CONFIG_POWER_SUPPLY
                    depend/select
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.11-gentoo
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: z@pyl.onl
        Regression: No

That depend is missing resulting in this error:
ld: drivers/platform/x86/amd/pmf/core.o: in function `amd_pmf_remove':
core.c:(.text+0x10): undefined reference to `power_supply_unreg_notifier'
ld: drivers/platform/x86/amd/pmf/core.o: in function `amd_pmf_probe':
core.c:(.text+0x38f): undefined reference to `power_supply_reg_notifier'
make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
make: *** [Makefile:1248: vmlinux] Error 2

The relevant kconfig file is located at drivers/platform/x86/amd/pmf

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
