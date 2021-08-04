Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B56C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 19:52:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C247060EE7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 19:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240666AbhHDTxJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Aug 2021 15:53:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:48718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238185AbhHDTxH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Aug 2021 15:53:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D728B60F58
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Aug 2021 19:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628106774;
        bh=zDBBTAWkeWUm9RbZWWdTkq6UAV5Y4TI7hkyWLU2WYtE=;
        h=From:To:Subject:Date:From;
        b=TBpi9m15+gLzC11WTIyPE9nxPo4pRFJX+WCVx1SIIImBKvGphe4kD9H1J6UuThMS4
         frl/ZkQk+RCMn8D+pjrPE74h2gxDOAatE2NPWDc68qQUbbwUeuN6nJt2OsaWo2fULP
         03cbNdIfqmxY02UaFnOEehgW/xhXvl8O/AbD8Hus/hSkPNrYQ5ihHF9e9BmqYWsgOw
         XQ94NQWDaxQzSIGYW6q2AGShjw95LLFTd9zzF+BWheRuCMUwD3aR+dRMlc/GZBrAoR
         EoR0Z98ium3aSLucMeY1jipUpA0SpDz/rjwbzdxwpZiziBVdYD7IrWO8kkDAC07KGz
         ZLzoYvvTnzBDg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213977] New: Unable to lock HW IRQ 44 TigerLake
Date:   Wed, 04 Aug 2021 19:52:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: death420.x@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213977-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213977

            Bug ID: 213977
           Summary: Unable to lock HW IRQ 44 TigerLake
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.6-200
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: death420.x@gmail.com
        Regression: No

Created attachment 298201
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298201&action=3Dedit
acpidump -o clevo-tables.dat

Hey,

I was told to open another report with an acpi dump. I do not have anything
else custom in my kernel except for including the .patch file in the follow=
ing
post. I added to the .patch file to the SOURCES dir and added in to the
kernel.spec and rebuilt the kernel package and installed it. Still getting =
the
below error.=20

RE: https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

[  924.443744] tigerlake-pinctrl INT34C6:00: pin 57 cannot be used as IRQ
[  924.443746] genirq: Setting trigger mode 8 for irq 131 failed
(intel_gpio_irq_type+0x0/0x130)
[  924.448165] gpio gpiochip0: (INT34C6:00): gpiochip_lock_as_irq: cannot g=
et
GPIO direction
[  924.448166] gpio gpiochip0: (INT34C6:00): unable to lock HW IRQ 44 for I=
RQ
[  924.448167] genirq: Failed to request resources for ELAN0412:01 (irq 131=
) on
irqchip INT34C6:00
[  924.448174] i2c_hid_acpi i2c-ELAN0412:01: Could not register for ELAN041=
2:01
interrupt, irq =3D 131, ret =3D -22
[  924.448201] i2c_hid_acpi: probe of i2c-ELAN0412:01 failed with error -22

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
