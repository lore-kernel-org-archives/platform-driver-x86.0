Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D77C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 10:57:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66B7922795
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 10:57:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728146AbhAQK5y convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 05:57:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:57906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727480AbhAQK5u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 05:57:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E80C422BEA
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 10:57:04 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sun, 17 Jan 2021 10:57:04 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-199715-215701-tpjVvJtjo0@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #26 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Hi Richard,

Thank you for your work on this.

I took a look at your patch-series from 2:
https://patchwork.kernel.org/project/linux-iio/patch/efa4524cd07abe0a7773b24d33b64f09e0bf1f82.camel@richard-neumann.de/

And there are several big issues with it:

1) It seems to have only been send to the linux-iio mailing-list, while it
mostly touches files under drivers/hid. So the HID maintainers did not see it
and the iio maintainers are likely ignore it because it is not an IIO patch

2) You seem to have build an top of an older version of the amd-sfh driver and
instead of porting your changes to the new version, your series seems to
completely replace the currently upstream version with your version. A patch
series like this will never be accepted upstream. You need to submit a patch
upstream with a small incremental change on top of the upstream version of the
driver. E.g. submit a patch just adding the module parameter.

I've prepared a patch-set which adds a module parameter for the sensor-mask on
top of the current upstream version of the amd-sfh code, without making any
further changes. I'll attach that here, please test.

2 questions:

1. may I ask what sensor_mask_override value you are using? That will be useful
for Luya to test this on his device, as well as for adding a DMI quirk to
automatically do the right thing in the future.

2. Can you please run (as normal user):

grep . /sys/class/dmi/id/* 2> /dev/null

and copy and paste the output here?  We will need to come up with some way to
make this "just work" for end-users without needing to set the module-parameter
and it is likely that this will be based on a DMI quirk table, so it would be
good to have the DMI strings for your model.

Luya, I will build a Fedora kernel for you with the patches added. I will post
a link to that in the Fedora bug you filed for this; and Luya, can you also
provide the output of 'grep . /sys/class/dmi/id/* 2> /dev/null' please?

Regards,

Hans

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
