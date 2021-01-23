Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B07C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Jan 2021 22:09:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 879F722AAA
	for <platform-driver-x86@archiver.kernel.org>; Sat, 23 Jan 2021 22:09:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbhAWWJV convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 23 Jan 2021 17:09:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:60624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725922AbhAWWJV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Jan 2021 17:09:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id AF62B22D2C
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 Jan 2021 22:08:40 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sat, 23 Jan 2021 22:08:40 +0000
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
Message-ID: <bug-199715-215701-WPgQec0eoG@https.bugzilla.kernel.org/>
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

--- Comment #55 from Richard Neumann (mail@richard-neumann.de) ---
@Dimitris. The submitted v8 Version of AMD is already merged into the mainline
kernel for v5.11, afaik. So we will definitely get a driver with kernel 5.11.
The only problem is, that it does not include an option to override the sensor
mask if the manufacturer of the system did not write it into the P2C register
as is the case on our HP Envy 13-ag0xxx models.
So the upstream driver is pretty useless to us.

My refactored patch series is a side-project I developed after the initial
driver version of AMD was submitted upstream. I repeatedly asked for adding a
kernel parameter to be able to override the sensor mask, which was confirmed as
a good idea, but was never implemented. So I took a look at the code myself and
added it. While I was at it, I encountered some more problems regarding the
code structure and DMA handling, that I also reported upstream [1]. I also saw
some unused code. So, to challenge myself to improve the driver, I read into
the Linux kernel API documentation for the HID subsystem, PCI drivers and
platform drivers and re-wrote the patch to what eventually became the patch
series that I now submitted upstream.

I understand Hans' concern about the rewrite, but I think that it would benefit
the Kernel to share my work on the driver. If the maintainers are reluctant to
replace the driver with my changes, that's okay. They can still cherry pick
what they regard as improvements on the code.

[1] https://lkml.org/lkml/2020/3/30/157

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
