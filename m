Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86F3C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 11:35:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B361C20575
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 11:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbhAQLfZ convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 06:35:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:36558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727967AbhAQLfM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 06:35:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4F47222AAC
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 11:34:26 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sun, 17 Jan 2021 11:34:25 +0000
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
Message-ID: <bug-199715-215701-re13HWYNGi@https.bugzilla.kernel.org/>
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

--- Comment #31 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Richard Neumann from comment #30)
> $ cat /etc/modprobe.d/amd_sfh.conf 
> options amd_sfh_hid sensor_mask=524295

Ok, so that translates to:

options amd_sfh_hid sensor_mask=0x80007

So you are enabling all 4 sensors:

#define ACEL_EN         BIT(0)
#define GYRO_EN         BIT(1)
#define MAGNO_EN        BIT(2)
#define ALS_EN          BIT(19)

I assume that you have verified that all 4 work?

Note that you can actually use hex-values (prefixed with 0x) when setting
integer module parameters, that typically make things easier to parse in cases
where the integer is a bitmask like this case.

> Refactoring the driver to clean it up, make it integrate seamlessly with the
> kernel APIs and providing the params to make it configurable on devices where
> the manufacturers screwed up was challenging, interesting and mostly a fun
> experience. Getting my work upstream, frankly, not so much.

May I ask you to at least consider re-posting the series as is with the email
going to the right people:

[hans@x1 linux]$ scripts/get_maintainer.pl -f
drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
Nehal Shah <nehal-bakulchandra.shah@amd.com> (maintainer:AMD SENSOR FUSION HUB
DRIVER)
Sandeep Singh <sandeep.singh@amd.com> (maintainer:AMD SENSOR FUSION HUB DRIVER)
Jiri Kosina <jikos@kernel.org> (maintainer:HID CORE LAYER)
Benjamin Tissoires <benjamin.tissoires@redhat.com> (maintainer:HID CORE LAYER)
linux-input@vger.kernel.org (open list:AMD SENSOR FUSION HUB DRIVER)

With a cover letter why you believe that your version is better / cleaner ?

Note you will very probably still be asked to refactor your work so that it
will consist of incremental patches which slowly moves the existing driver to
your version. But this way at least the maintainers will be aware that there is
room for improvement, because I'm pretty sure that they will not have seen the
posting to the linux-iio list.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
