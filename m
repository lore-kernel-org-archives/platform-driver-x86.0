Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B84EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 08:25:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbiDYI2W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 04:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240244AbiDYI16 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 04:27:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1157CBF5D
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 01:24:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C0A3AB81131
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 08:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E20BC385AE
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650875088;
        bh=FVkyTrgM7czLSK81N25ZbsdJ5Zlkt3jHZVhjDhgaEUA=;
        h=From:To:Subject:Date:From;
        b=qaHebW7JRyZ0G6A1T88Q+PxrUFgOHudl4xj+KrQAjlonE6uSE7Xu3AFQ99Qwn9iiz
         NKFSYCqVzMd4O7eX50opztR/7j6iV7aqSfaE7UrgdZSAnO/zc1pQvw1rrrBDIy4JMc
         yWQkv+0n+Evy4s+boNySXPqtOr4Fq2wfMHJyuQRz6w7hdP6jV9TedDWjVp1F6uZF/e
         MNVkUIX8PlSQcghShm2zYrjG0Xs4KwuDMDZehhCKAFOphIy8kvbGCjOcRoBNGRvcy7
         eOi3T+g8JNGclYnMPrm1zAFInXlOUrRg9UaglIrHePgee3iaayPBhbnFG5HjpZhSQU
         sJ8HYs6nAAx3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3E264C05FD0; Mon, 25 Apr 2022 08:24:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215883] New: Unable to resume from suspend with module
 `intel_lpss_pci` enabled
Date:   Mon, 25 Apr 2022 08:24:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: taigi100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215883-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215883

            Bug ID: 215883
           Summary: Unable to resume from suspend with module
                    `intel_lpss_pci` enabled
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.17
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: taigi100@gmail.com
        Regression: No

Hey,

My PC is unable to resume from sleep if I have the `intel_lpss_pci` module
enabled. I didn't manage to get useful logs, but here is the HW:

Host: B660M GAMING X DDR4=20
CPU: 12th Gen Intel i7-12700KF (20) @ 5.000GHz=20
GPU: AMD ATI Radeon RX 6600/6600 XT/6600M=20
Memory: 3636MiB / 31942MiB

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
