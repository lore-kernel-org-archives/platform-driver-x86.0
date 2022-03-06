Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3696C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Mar 2022 19:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234150AbiCFTvl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Mar 2022 14:51:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbiCFTvk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Mar 2022 14:51:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0384C286FB
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Mar 2022 11:50:47 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 77A17B80ECF
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Mar 2022 19:50:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22F11C34117
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Mar 2022 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646596245;
        bh=YC8S8sQVZ8WL3aGunHwuqYyZnnJb0t9UEzNy4lYMXtg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=X3x2VFMn5M7QWr53/RsX1SLCOTH7LZmxQxMA2dz+OlMurqxLQ+mGcxr/xplcmDG3X
         QFZP4rA8s61fYvwqYcIqAq3902ZRgDeu7SNppouXhAO90myLzsKcp44ljh+GproIve
         IVuD1H9riK1L9h1RxiHg8NwGUXVSQGxVFWD0UXWYpx6b/an8ZLZ/VJtNhUXbwYuRpR
         oAIwd7YGkYhKSjzXWCa5MvIp73M5+U1Hy0nDdratdlG7UVWksIPKkp0FMUFiWvEnJu
         vXWbrMVkh8KMl3VceFmdofObGbl1t6N26Et9hxGr5FYnx3flWlGQkEZfLoqhwqCsUN
         nQ+eFJ9aEIatA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 12F88CAC6E2; Sun,  6 Mar 2022 19:50:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 06 Mar 2022 19:50:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: hubert.banas@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-1h2AGYYF8Y@https.bugzilla.kernel.org/>
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

Hubert Banas (hubert.banas@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hubert.banas@gmail.com

--- Comment #225 from Hubert Banas (hubert.banas@gmail.com) ---
First I would like to thank all of you who contributed to this patch. Speci=
al
thanks to Denis who took it upstream.

I have another candidate and was hoping we can have it added to the patch.

$ cat /sys/class/dmi/id/board_name
ROG STRIX X570-E GAMING WIFI II

$ dmesg
[    4.244908] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[    4.244914] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20210930/utaddress-204)
[    4.244919] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?

$ uname -a
Linux pop-os 5.16.11-76051611-generic #202202230823~1646248261~21.10~2b22243
SMP PREEMPT Wed Mar 2 20: x86_64 x86_64 x86_64 GNU/Linux

$ cat /etc/os-release
NAME=3D"Pop!_OS"
VERSION=3D"21.10"
ID=3Dpop
ID_LIKE=3D"ubuntu debian"
PRETTY_NAME=3D"Pop!_OS 21.10"
VERSION_ID=3D"21.10"
HOME_URL=3D"https://pop.system76.com"
SUPPORT_URL=3D"https://support.system76.com"
BUG_REPORT_URL=3D"https://github.com/pop-os/pop/issues"
PRIVACY_POLICY_URL=3D"https://system76.com/privacy"
VERSION_CODENAME=3Dimpish
UBUNTU_CODENAME=3Dimpish
LOGO=3Ddistributor-logo-pop-os

Thank you!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
