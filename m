Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F028C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Mar 2022 03:28:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239428AbiCWDaC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Mar 2022 23:30:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbiCWDaB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Mar 2022 23:30:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943277006C
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 20:28:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D16E260BCA
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 03:28:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37A03C340EC
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 03:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648006111;
        bh=GiQIqIzjDWalZz8K9ipZpU5ZrGrPc6x9G7DSuE8siHA=;
        h=From:To:Subject:Date:From;
        b=SjP8PSy2c7K1m+0yV/PODC8NEMcu9J2mJiBlWqA88+tNJm1uq/qvnShnxBVmcAdVd
         e2CbxlZXnX1sKVdGYGU+84YL4FjRP4xMOWT9JNF/Ydy718CCOnJRpqyr7w3fMex+gz
         3ORiX8l83DY0oDUUlKYUyLLyTUYn810rVft84Cj23cLJMEZ3sNIux34hlF3bSOsNFw
         74K59KgGpir9kkRw35W6jCsZNKxlQqtXI1wgN/a6X5JFfFZkSLT/LsWyHFVni/K+FX
         ++U6JasDSuop/sUcDY90f9fBMHXc+cZa9WUgtR5ms5f4C0rPf09AZ9NabGNdK+Kyxi
         cGIwuYbkRs1kg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 15459C05F98; Wed, 23 Mar 2022 03:28:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] New: acpi_bus_register_driver() does not work on Alder
 Lake
Date:   Wed, 23 Mar 2022 03:28:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215730-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215730

            Bug ID: 215730
           Summary: acpi_bus_register_driver() does not work on Alder Lake
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13, 5.16, maybe all.
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: xuemin.wu@dbh.dynabook.com
        Regression: No

e.g.

in drivers/platform/x86/toshiba_acpi.c
acpi_bus_register_driver(&toshiba_acpi_driver);
does not work:

when execute acpi_bus_register_driver(&toshiba_acpi_driver).
the ".add" function is not called to add the driver.

and dmesg no errors/warnings have been reported when insmod this driver.

This issue exists on Alder Lake.
This issue does not exist on Tiger Lake.

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
