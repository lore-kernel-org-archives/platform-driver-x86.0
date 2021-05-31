Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB2AEC47098
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 14:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B534161413
	for <platform-driver-x86@archiver.kernel.org>; Mon, 31 May 2021 14:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbhEaODB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 31 May 2021 10:03:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:36536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231834AbhEaOA7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 10:00:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4565961413
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 May 2021 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622468199;
        bh=jixIZ0JgLI+KnQOZ/2eZdUB8fhT4CUvToNltZo3itzw=;
        h=From:To:Subject:Date:From;
        b=Yg4uheW+ozs/zP7mnabQDdX4XtdD7lg/pt211jlIzEBsUJm7LBZVAHPFY+aDvcfn4
         7HzQq7eHNATxaaVtQWZlPHkxIQ5P7IGKXftagGoegNgji+NGc7XENQZglHqOJxlsco
         ZL4A88pQm/LfbMz9MMde2kKuiolayB8HlDhip2PiP+apNFgwZjcOk+XkGsqyw+Wj8c
         cYW9+ZgdAgVz445dZ2JWBWHJxz/Rm92+VvULL2AUwY15Cnil+lS/dCSwIEd/y7FGhP
         kBZXyQd3Mjiv2nTJmnbOXkL54ecKETotiVAQ3hewG0GB1iQ3WE7tDUrlrdjEUoj8sD
         KUMYj9QRyk1rg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] New: ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Mon, 31 May 2021 13:36:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213297-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213297

            Bug ID: 213297
           Summary: ideapad-laptop: DYTC interface not found, several
                    functionalities missing
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.8
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: johannes.penssel@gmail.com
        Regression: No

Created attachment 297073
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297073&action=3Dedit
hwinfo | grep -i driver output

Device: Lenovo 5 15ITL05(i5-1135G7/GeForceMX450)
Latest UEFI/ME firmware (FHCN41WW/FHME26WW)
Distro: Gentoo (5.10.27 stable and 5.12.8 testing), Arch Linux (5.12.8)

When inserting the ideapad-laptop module: these dmesg log messages occur:

[    2.583728] input: Ideapad extra buttons as
/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/input/input3
[    2.583756] ideapad_acpi VPC2004:00: Keyboard backlight control not
available
[    2.590680] ideapad_acpi VPC2004:00: DYTC interface is not available

Result:
-despite the appropriate module being loaded,
/sys/firmware/acpi/platform_profile is missing completely
-backlight brightness control via fn function keys doesn't work
-missing drivers for LUK2019 and IDEA2004 (hwinfo | grep -i driver output is
attached)
-neither xev nor acpid register any inputs from the brightness keys

None of the problems described above occur under Windows 10.

So far, I've tried updating the UEFI/ME FW, switching to LTS kernels and
different distros, as well as the standard workarounds for non-functional fn
keys.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
