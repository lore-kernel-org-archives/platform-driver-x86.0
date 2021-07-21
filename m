Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BFBC12002
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 09:02:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26CFE6113C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 09:02:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235987AbhGUIVv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 04:21:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236719AbhGUILy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 04:11:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0718D6120A
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626857551;
        bh=6a9mFdK3tFXSCXnKi+HvsAEcIHcLVMUNk+tkEyy3Ek0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WrUfB8Yobt/aJhcuP0i9d9BK84OBP9HEHxMJ8oj/wLAn/55l0uq7okRcGPattQJ6K
         igOVU0EpCvkN1h6s4coFrkF5Fd79FyklERWU5A6e2bn5XSy1tcCEn7u2/JWDG2PdtA
         HiVgAommS+6Ge9YhecNhDzTmYYQWDJ+c7cXHhP+IR2HU4mpcjReWlYUDBt8LCgfpch
         kQFDt//b/D8uPyuIX3dg2pJE6/pOMjQy8tnkQXyM5zDVswU8iNjm57utbAuSjh2dLA
         0iPK+woWIUeIF4RndUk7njRZdvKfkQjjxKE9QlV0C0BJ6pYzpy5q2kLMXUdcwKmFV6
         hiQOZ9+yjYl7Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 08:52:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rod.thomas@talktalk.net
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213579-215701-2wEMbg6bI6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

Rod Thomas (rod.thomas@talktalk.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rod.thomas@talktalk.net

--- Comment #12 from Rod Thomas (rod.thomas@talktalk.net) ---
Also seen on Clevo NH77HJ

[  +0.000242] idma64 idma64.0: Found Intel integrated DMA 64-bit
[  +0.003073] tigerlake-pinctrl INT34C6:00: pin 57 cannot be used as IRQ
[  +0.000002] genirq: Setting trigger mode 8 for irq 140 failed
(intel_gpio_irq_type+0x0/0x140)
[  +0.001386] libphy: r8169: probed
[  +0.000140] r8169 0000:02:00.0 eth0: RTL8168h/8111h, 80:fa:5b:97:31:f8, X=
ID
541, IRQ 141
[  +0.000003] r8169 0000:02:00.0 eth0: jumbo features [frames: 9194 bytes, =
tx
checksumming: ko]
[  +0.000421] gpio gpiochip0: (INT34C6:00): gpiochip_lock_as_irq: cannot get
GPIO direction
[  +0.000003] gpio gpiochip0: (INT34C6:00): unable to lock HW IRQ 44 for IRQ
[  +0.000001] genirq: Failed to request resources for ELAN0412:01 (irq 140)=
 on
irqchip INT34C6:00
[  +0.000023] i2c_hid_acpi i2c-ELAN0412:01: Could not register for ELAN0412=
:01
interrupt, irq =3D 140, ret =3D -22
[  +0.000042] i2c_hid_acpi: probe of i2c-ELAN0412:01 failed with error -22
[  +0.011757] random: crng init done
[  +0.000003] random: 3 urandom warning(s) missed due to ratelimiting

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
