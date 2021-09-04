Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13759C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 20:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F40E860F42
	for <platform-driver-x86@archiver.kernel.org>; Sat,  4 Sep 2021 20:46:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbhIDUrh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 4 Sep 2021 16:47:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:46526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229888AbhIDUrg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 16:47:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B700460F9C
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Sep 2021 20:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630788394;
        bh=UnSrnfyPZ85HRYktqzMIva9MoxEGb23Lkpu/6l3cedc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pc/zEbLKiQwyEQlPDsqixPGTS0HrMFaukzgTCDxp+wcB/SBOTrlRIP/iEO+vM3rPb
         gp06JMFeUPD+h8dUrcsZ1QjeDuWIf1lUE3iKG5cjvD3SBeTAfCQvGnJ4sbjzMXuQ+x
         lZazmH2LvvhERuEBIXmvotALQj9yYihAcfIee1Vub7ZsAyFiDffznqe44ncgO0a2yN
         D1YTSI+hY6bWAIFJTROD+KCnct4H3NUb1AkLuv8XhxeVl5pkD+G+6wJ3kAyHzx2Uof
         U4K3Fz3rInXpcFzt53qWNRZXngfiGz5zqP7xRXwNDPBthCSynZCOf/KBYntp/jFNV+
         dI29ZJobQ0rEQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 04 Sep 2021 20:46:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-X1Xi3mgP57@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298539|0                           |1
        is obsolete|                            |

--- Comment #88 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 298669
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298669&action=3Dedit
POC: Add support for access via Asus WMI to nct6775 by board/vendor name de=
tect

Updated version with check vendor name and fix for possible issues with non
ASUS motherboards, added names of motherboards have mentioned in bug. I will
also check possible way for use functions pointers instead conditional chec=
ks
equal to access_wmi. After that I will try to send patch to review.

(In reply to comment #87)
> I added my board "ROG STRIX B550-F GAMING (WI-FI)" and added patch against
> 5.14.1-arch1-1 BIOS 2423 08/10/2021.

Thank you, I have added your board also.

(In reply to comment #86)
> Please add my board name "TUF GAMING B550-PLUS".

Thank you, I have added it to list. What the distro do you use?=20

For debian it can be:
* git clone
git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
* cd linux-stable
* git check v5.14
* cp /boot/config-5.10.0-8-amd64 .config
* make CC=3D"ccache gcc" -j 32
* make CC=3D"ccache gcc" -j 32 bindeb-pkg
* sudo dpkg -i ../linux-image-5.14.0+_5.14.0+-1_amd64.deb

Look to https://wiki.debian.org/BuildADebianKernelPackage

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
