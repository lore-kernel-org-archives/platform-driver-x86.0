Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60500C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 13:02:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3907760E09
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Jul 2021 13:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235263AbhG1NCd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Jul 2021 09:02:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:54740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235954AbhG1NCd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 09:02:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CA6AE60E09
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 13:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627477351;
        bh=spFve4aAQsbuZfnwZDLro6vKyB/5h4uPU388t7NKkfw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cfiQ2I+1Qn/JtpnYzmLnNvYKWAMbAYbmRASZ9MNRODLteyBcuFP2ZhuGaZgLzgDqK
         pXAbTjqd7N+EXQQD8J8OHRqDzTHevWjImdeTOg1LezEzO5a4ghTuK7j8oT5Ej20TZa
         Lguz0/1dulY0+Bg+G07iG4HGAH1fGDnoNO6gbZ+ke83UVJrVIDLXi0NLa6O+05u7xB
         7XeA40OCwHj+GuwvMWcVZsLWsnH/hY0myhO4hA7dm4JOTB+r8ddp1SQO9mv9VRoITk
         dKaEy4KLmYmVBoXOBIT16wFCx1AdokZe+944+Cn6IM4D44xbh3XUZ+SuIcaObHn2w4
         RbQOO2p+lo0Yw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 209011] asus-wmi always reports tablet mode on a ZenBook
 UX390UAK
Date:   Wed, 28 Jul 2021 13:02:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: julius@devpi.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-209011-215701-OUzEzjzNaT@https.bugzilla.kernel.org/>
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

--- Comment #12 from Julius Lehmann (julius@devpi.de) ---
Created attachment 298077
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298077&action=3Dedit
dmesg output 2 - TP412UA

1) Yes, I did that. To be sure, I redid the 360 turn and posted another dme=
sg.

2) output of "grep . /sys/class/dmi/id/* 2> /dev/null"

/sys/class/dmi/id/bios_date:07/25/2019
/sys/class/dmi/id/bios_release:5.12
/sys/class/dmi/id/bios_vendor:American Megatrends Inc.
/sys/class/dmi/id/bios_version:TP412UA.308
/sys/class/dmi/id/board_asset_tag:ATN12345678901234567
/sys/class/dmi/id/board_name:TP412UA
/sys/class/dmi/id/board_vendor:ASUSTeK COMPUTER INC.
/sys/class/dmi/id/board_version:1.0
/sys/class/dmi/id/chassis_asset_tag: No  Asset  Tag=20
/sys/class/dmi/id/chassis_type:31
/sys/class/dmi/id/chassis_vendor:ASUSTeK COMPUTER INC.
/sys/class/dmi/id/chassis_version:1.0
/sys/class/dmi/id/ec_firmware_release:1.7
/sys/class/dmi/id/modalias:dmi:bvnAmericanMegatrendsInc.:bvrTP412UA.308:bd0=
7/25/2019:br5.12:efr1.7:svnASUSTeKCOMPUTERINC.:pnVivoBookFlip14_ASUSFlipTP4=
12UA:pvr1.0:sku:rvnASUSTeKCOMPUTERINC.:rnTP412UA:rvr1.0:cvnASUSTeKCOMPUTERI=
NC.:ct31:cvr1.0:
/sys/class/dmi/id/product_family:VivoBook Flip
/sys/class/dmi/id/product_name:VivoBook Flip 14_ASUS Flip TP412UA
/sys/class/dmi/id/product_version:1.0
/sys/class/dmi/id/sys_vendor:ASUSTeK COMPUTER INC.
/sys/class/dmi/id/uevent:MODALIAS=3Ddmi:bvnAmericanMegatrendsInc.:bvrTP412U=
A.308:bd07/25/2019:br5.12:efr1.7:svnASUSTeKCOMPUTERINC.:pnVivoBookFlip14_AS=
USFlipTP412UA:pvr1.0:sku:rvnASUSTeKCOMPUTERINC.:rnTP412UA:rvr1.0:cvnASUSTeK=
COMPUTERINC.:ct31:cvr1.0:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
