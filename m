Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3F7C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 11:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 283FD2064C
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 11:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbhAQLN6 convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 06:13:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:33240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728470AbhAQLNv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 06:13:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1D62422AAC
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 11:13:11 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sun, 17 Jan 2021 11:13:10 +0000
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
Message-ID: <bug-199715-215701-b2ANAn8m4p@https.bugzilla.kernel.org/>
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

--- Comment #30 from Richard Neumann (mail@richard-neumann.de) ---
@Hans Thank you for your input.

First, here is the requested output:

$ cat /etc/modprobe.d/amd_sfh.conf 
options amd_sfh_hid sensor_mask=524295

$ grep . /sys/class/dmi/id/* 2> /dev/null
/sys/class/dmi/id/bios_date:11/15/2019
/sys/class/dmi/id/bios_release:15.46
/sys/class/dmi/id/bios_vendor:AMI
/sys/class/dmi/id/bios_version:F.46
/sys/class/dmi/id/board_asset_tag:Base Board Asset Tag
/sys/class/dmi/id/board_name:8496
/sys/class/dmi/id/board_vendor:HP
/sys/class/dmi/id/board_version:92.48
/sys/class/dmi/id/chassis_type:31
/sys/class/dmi/id/chassis_vendor:HP
/sys/class/dmi/id/chassis_version:Chassis Version
/sys/class/dmi/id/ec_firmware_release:92.48
/sys/class/dmi/id/modalias:dmi:bvnAMI:bvrF.46:bd11/15/2019:br15.46:efr92.48:svnHP:pnHPENVYx360Convertible13-ag0xxx:pvr:rvnHP:rn8496:rvr92.48:cvnHP:ct31:cvrChassisVersion:
/sys/class/dmi/id/product_family:103C_5335KV HP Envy
/sys/class/dmi/id/product_name:HP ENVY x360 Convertible 13-ag0xxx
/sys/class/dmi/id/product_sku:4JS64EA#ABD
/sys/class/dmi/id/sys_vendor:HP
/sys/class/dmi/id/uevent:MODALIAS=dmi:bvnAMI:bvrF.46:bd11/15/2019:br15.46:efr92.48:svnHP:pnHPENVYx360Convertible13-ag0xxx:pvr:rvnHP:rn8496:rvr92.48:cvnHP:ct31:cvrChassisVersion:

Regarding the driver. Yes, it is completely refactored version that is close to
a re-write. I posted it to the IIO mailing list, since this is where the
original driver was also posted and discussed.
I realize that I made a lot of changes, but I am confident, that my code base
has a cleaner approach, since it utilizes the respective start, stop, open and
close functions of the HID LL API and contains less (if even any) unused code
and data structures. It is up to the maintainers whether they accept it,
request changes or whatnot. I've done my part and am happy using my clean and
stable implementation, that btw. is also used by other Arch Linux users with my
DKMS package in the AUR. I unsuccessfully tried to make changes to the upstream
driver during its development, which were ignored by both the devs and the
maintainers. Refactoring the driver to clean it up, make it integrate
seamlessly with the kernel APIs and providing the params to make it
configurable on devices where the manufacturers screwed up was challenging,
interesting and mostly a fun experience. Getting my work upstream, frankly, not
so much.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
