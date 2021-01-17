Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B11B0C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 11:11:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C06D2064C
	for <platform-driver-x86@archiver.kernel.org>; Sun, 17 Jan 2021 11:11:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbhAQLK7 convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 17 Jan 2021 06:10:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:60724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728193AbhAQLKW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 06:10:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5618F22AAC
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 11:09:34 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sun, 17 Jan 2021 11:09:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-u99Q9SVSKv@https.bugzilla.kernel.org/>
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

--- Comment #29 from Luya Tshimbalanga (luya@fedoraproject.org) ---
(In reply to Hans de Goede from comment #26)
... 
> Luya, I will build a Fedora kernel for you with the patches added. I will
> post a link to that in the Fedora bug you filed for this; and Luya, can you
> also provide the output of 'grep . /sys/class/dmi/id/* 2> /dev/null' please?
> 

Certainly. Here is the requested output:

grep . /sys/class/dmi/id/* 2> /dev/null

/sys/class/dmi/id/bios_date:07/03/2020
/sys/class/dmi/id/bios_release:15.47
/sys/class/dmi/id/bios_vendor:AMI
/sys/class/dmi/id/bios_version:F.47
/sys/class/dmi/id/board_asset_tag:Base Board Asset Tag
/sys/class/dmi/id/board_name:8497
/sys/class/dmi/id/board_vendor:HP
/sys/class/dmi/id/board_version:92.48
/sys/class/dmi/id/chassis_type:31
/sys/class/dmi/id/chassis_vendor:HP
/sys/class/dmi/id/chassis_version:Chassis Version
/sys/class/dmi/id/ec_firmware_release:92.48
/sys/class/dmi/id/modalias:dmi:bvnAMI:bvrF.47:bd07/03/2020:br15.47:efr92.48:svnHP:pnHPENVYx360Convertible15-cp0xxx:pvr:rvnHP:rn8497:rvr92.48:cvnHP:ct31:cvrChassisVersion:
/sys/class/dmi/id/product_family:103C_5335KV HP Envy
/sys/class/dmi/id/product_name:HP ENVY x360 Convertible 15-cp0xxx
/sys/class/dmi/id/product_sku:4BQ00UA#ABL
/sys/class/dmi/id/sys_vendor:HP
/sys/class/dmi/id/uevent:MODALIAS=dmi:bvnAMI:bvrF.47:bd07/03/2020:br15.47:efr92.48:svnHP:pnHPENVYx360Convertible15-cp0xxx:pvr:rvnHP:rn8497:rvr92.48:cvnHP:ct31:cvrChassisVersion:

Thank you for addressing the bug report, Hans!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
