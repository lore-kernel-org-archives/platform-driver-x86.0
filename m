Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72E9C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 16:01:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A8F772250F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 16:01:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728394AbhAQQBo convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 11:01:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:51810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728368AbhAQQBm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 11:01:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id EC57922573
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 16:01:01 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sun, 17 Jan 2021 16:01:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@richard-neumann.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-RSX9xoOVcn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=199715

--- Comment #39 from Richard Neumann (mail@richard-neumann.de) ---
I just tried to test the latest staged upstream version, but it does not even
build:

make: Entering directory '/usr/lib/modules/5.10.7-zen1-1-zen/build'
  CC [M]  /var/lib/dkms/amd-sfh-hid/1.0.3/build/amd_sfh_hid.o
  CC [M]  /var/lib/dkms/amd-sfh-hid/1.0.3/build/amd_sfh_client.o
  CC [M]  /var/lib/dkms/amd-sfh-hid/1.0.3/build/amd_sfh_pcie.o
  CC [M] 
/var/lib/dkms/amd-sfh-hid/1.0.3/build/hid_descriptor/amd_sfh_hid_desc.o
/var/lib/dkms/amd-sfh-hid/1.0.3/build/hid_descriptor/amd_sfh_hid_desc.c:12:10:
fatal error: amd_sfh_pcie.h: No such file or directory
   12 | #include "amd_sfh_pcie.h"
      |          ^~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.build:279:
/var/lib/dkms/amd-sfh-hid/1.0.3/build/hid_descriptor/amd_sfh_hid_desc.o] Error
1
make: *** [Makefile:1805: /var/lib/dkms/amd-sfh-hid/1.0.3/build] Error 2
make: Leaving directory '/usr/lib/modules/5.10.7-zen1-1-zen/build'

I never understood why they put the hid descriptors in a subdir anyway.
I already spent far too much time on this driver. I have my working refactored
version. I'll leave the rest for somebody else.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
