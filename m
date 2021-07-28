Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF152C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 13:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE53761037
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 13:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbhG1NUg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 09:20:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:36630 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233315AbhG1NUg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 09:20:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C0D7760240
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627478434;
        bh=bApvAWNFtQfm3it/naXSMqwSNjS5EnwNH6H4ndaVeCc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bw91XXtgr+ooSGcZNBBESB5ASsW5zMH2fqJRs8ihRg7ZKWDAsL0LbsdP6KR81T2hN
         ZVyyp6Uj9IpqhsJtfBd3/0qi9JkdkFMqHiPgCQ0jeMV5mSKrgqeA2JyMrDI7Wxj8xo
         yOaCsLindUjQ1AwD+hTOC/7iTs/t6U5yAmlAakBoLhwUxD43iBSHmtUK6vQckE+zO0
         OejaW/Wr7DN+0aliQo921SKQC9SYFt5KY+/7S3YeAukwb5TW/+UNDwDaIhow7XZ1RN
         rxEEG9OmHstEoE+9AQnKVpX0dVnHj+EEubZkGxnKLFZ1uskiK8YlsChPQZwA9hEmYo
         2LO2IpQE75N7w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 209011] asus-wmi always reports tablet mode on a ZenBook
 UX390UAK
Date:   Wed, 28 Jul 2021 13:20:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209011-215701-YZL6mAoyJv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209011-215701@https.bugzilla.kernel.org/>
References: <bug-209011-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209011

--- Comment #13 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thanks, I'm pretty sure I know what is going on here. I'm writing a kernel
patch to fix this now.

If you are curious what is going on here is a comment which I just wrote to
document the code/fix I'm working on:

/*
 * Helper code to detect 360 degree hinges (yoga) style 2-in-1 devices usin=
g 2
accelerometers
 * to allow the OS to determine the angle between the display and the base =
of
the device.
 *
 * On Windows these are read by a special HingeAngleService process which c=
alls
undocumented
 * ACPI methods, to let the firmware know if the 2-in-1 is in tablet- or
laptop-mode.
 * The firmware may use this to disable the kbd and touchpad to avoid spuri=
ous
input in
 * tablet-mode as well as to report SW_TABLET_MODE info to the OS.
 *
 * Since Linux does not call these undocumented methods, the SW_TABLET_MODE
info reported
 * by the intel-hid / intel-vbtn drivers is incorrect. These drivers use the
detection
 * code in this file to disable SW_TABLET_MODE reporting to avoid reporting
broken info
 * (instead userspace can derive the status itself by directly reading the 2
accels).
 */

Now I just need to actually write the mentioned detection code, test it on =
one
of my own devices and then hook it up in the intel-vbtn.c and intel-hid
drivers.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
