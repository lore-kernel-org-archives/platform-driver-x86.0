Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64CBC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 12:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A94D422573
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 12:15:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbhAQMP4 convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 07:15:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:41352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728836AbhAQMPz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 07:15:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 046D322AAC
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 12:15:15 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sun, 17 Jan 2021 12:15:14 +0000
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
Message-ID: <bug-199715-215701-W0O8FL9zKr@https.bugzilla.kernel.org/>
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

--- Comment #33 from Richard Neumann (mail@richard-neumann.de) ---
@Hans "work" is a relative term here. They are all recognized and started.
Going into details would go beyond the scope of this thread, I think.
dmesg excerpt:

[   10.855774] amd-sfh-pci 0000:04:00.7: Sensor mask: 0x80007
[   10.856054] hid-generic 0018:03FE:0001.0002: hidraw1: I2C HID v0.01 Device
[accelerometer] on AMD Sensor Fusion Hub (PCIe)
[   10.856325] hid-generic 0018:03FE:0001.0003: hidraw2: I2C HID v0.01 Device
[gyroscope] on AMD Sensor Fusion Hub (PCIe)
[   10.856614] hid-generic 0018:03FE:0001.0004: hidraw3: I2C HID v0.01 Device
[magnetometer] on AMD Sensor Fusion Hub (PCIe)
[   10.856893] hid-generic 0018:03FE:0001.0005: hidraw4: I2C HID v0.01 Device
[ambient light sensor] on AMD Sensor Fusion Hub (PCIe)

I am only *using* the accelerometer, so a mask of "1" or "0x1" respectively
would suffice.

Testing the other sensors is non-trivial. I branched my refactored version of
the driver to extend it with an API to allow for reverse-engineering the PCI
device to detect other sensors. But again, this maybe something to discuss in
another place (or write a paper about :p).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
