Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C73FC43334
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Jun 2022 08:29:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350879AbiFVI3b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Jun 2022 04:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356322AbiFVI3Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 04:29:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED3DA381BC
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 01:28:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63C28B81C5F
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2237C34114
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655886520;
        bh=SgtPMozPsZbYuwbbSn1Ff97ZbD8UY1+uqJpCw6CiYGI=;
        h=From:To:Subject:Date:From;
        b=HnAjWdZvXiZmIyDt7lY9evM3HIW5CPcFjY12YEyWrNMkKZv89VhNL7J4CKet/X8QS
         Acsj/fahsIjddDIRAA0g0GjVQ0AvgRpFAcSjROsROLjP8rsO2/YANeDRp7+DQjY3b9
         w9zlxmHdWIm3t1jjgaMmWVFWv685SCH4nWBnETP1TEKLeyjcaBvyj+AgYcKvSocWzM
         YEHolNOCtH/vzwICXACb3S2SHXKN9VSWMHPOD2nOFs+fYBfnQboKbjtfm8Fww/ypRo
         DVdr91eKfTC0y19GURpnj6IsdVttjQptly/Z6V1aL/nPIv8xT6p2x6srAYVGWuvtU2
         4BTwoBLEuQ/Pw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D1F93C05FD2; Wed, 22 Jun 2022 08:28:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216163] New: cstates: intel_idle.max_cstate=4 required to
 eliminate flickering of the display on the laptop model 3Logic Group Graviton
 N15i-K2
Date:   Wed, 22 Jun 2022 08:28:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kovalev@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216163-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216163

            Bug ID: 216163
           Summary: cstates: intel_idle.max_cstate=3D4 required to eliminate
                    flickering of the display on the laptop model 3Logic
                    Group Graviton N15i-K2
           Product: Drivers
           Version: 2.5
    Kernel Version: v5.18
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: kovalev@altlinux.org
        Regression: No

Created attachment 301249
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301249&action=3Dedit
Limiting the list of states for the model processor INTEL_FAM6_KABYLAKE_L

After booting the system almost immediately (it takes less than 1 minute),
there are short-term shutdowns of the display (up to 3 seconds). The problem
disappears if I load the kernel with the parameter intel_idle.max_cstate=3D=
4.

While debugging the kernel, I determined that the processor model ID is 0x8=
E,
defined a macro in the header file /arch/x86/include/asm/intel-family.h :

...
#define INTEL_FAM6_KABYLAKE_L           0x8E    /* Sky Lake             */
/*                 AMBERLAKE_L          0x8E       Sky Lake -- s: 9     */
/*                 COFFEELAKE_L         0x8E       Sky Lake -- s: 10    */
/*                 WHISKEYLAKE_L        0x8E       Sky Lake -- s: 11,12 */
...

And I created a patch with a reduced number of states (4 states) of downtime
for this model, which works successfully.

I am attaching a patch and asking you to consider the feasibility of such a
solution.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
