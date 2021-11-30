Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263ACC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 30 Nov 2021 16:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbhK3QYK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 30 Nov 2021 11:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238919AbhK3QYK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Nov 2021 11:24:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22187C061746
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 08:20:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D870DB81A53
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 16:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 936BFC53FC1
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Nov 2021 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638289248;
        bh=Qb2Jy1A10FUNQtX5HjKuVtWImNJcH7ta1PZa/SeHc2E=;
        h=From:To:Subject:Date:From;
        b=cVA5jTIKaMuwaBEEWEMnC+sSKh1a3QXwf4dBeeIdp2wJLNmY3OFZy2c7thbsL5J4h
         OIgCggdNK+T0S54DGWW3pgtGemChbBMcMgNJd0SUZOl03rFTBbB/j/5tHpbd7ex5gb
         wdkzeUrn8x5RkNcohFHt+p4JrbNAcMutR9lBarJKH8E2GdsMqfJVyzPDtAu06n8Gzi
         KLp2HqKzUN69qmGyCyZhFkFLGWonT8ACe1IYCMiNjCRQ/7JqlbaMXh1sLhRGBeDBVy
         m76plXkJVSlgDgGZaRwxvtGWqv6kRDvxfTpZYrLz/Dc2P2r8EXB7obXXcQNtsC+7qa
         YxxKuFOysTSJQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 69D5860F00; Tue, 30 Nov 2021 16:20:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215177] New: Stop exporting platform_profile interface for
 Lenovo T14/P14s Gen2 AMD
Date:   Tue, 30 Nov 2021 16:20:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjoern.daase@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215177-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215177

            Bug ID: 215177
           Summary: Stop exporting platform_profile interface for Lenovo
                    T14/P14s Gen2 AMD
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: bjoern.daase@gmail.com
        Regression: No

The T14/P14s Gen2 AMD (and maybe more?) have a completely broken platform
profile implementation. While advertising three profiles, they do not change
anything. See
https://forums.lenovo.com/t5/Other-Linux-Discussions/T14-AMD-subpar-CPU-per=
formance/m-p/5089829?page=3D1#5386521
for details.

As some user space software (e.g. platform-profiles-daemon) expects them to
work correctly when they are available, they should not be exported for bro=
ken
devices.

Therefore, I suggest to stop exporting a platform_profile interface for the
Lenovo T14/P14s Gen2 AMD.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
