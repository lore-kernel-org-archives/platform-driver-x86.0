Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CE6C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Dec 2021 17:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236596AbhLERcy (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Dec 2021 12:32:54 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:56904 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232874AbhLERcy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Dec 2021 12:32:54 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E725EB80ED4
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 17:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB8FCC341D1
        for <platform-driver-x86@vger.kernel.org>; Sun,  5 Dec 2021 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638725364;
        bh=FiRqywRcWQ464hjXIThDWDx4OXi/AjZ89/0RL+guwjQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Z4cchonoVaAZTp9RVr+4v9xfz4J69pXazi7NcFN8SBw/RR3IoIVz9tQEb5Nn8ZELg
         kx+DB35ol2ZFjV201/bH20dffB1JZmrmoig3rJT1wkOHSy7xzPx4ivdWtjo2zvUkkJ
         Ru5ZhxIoF9lhd8Ouv7rkP9nxxBnL0ZmmOvJQluKWN0iCMy+W5hhBrgohKc9+5+N0vY
         54MKvmDrvHxTqYskv62QMswgc2IL4GunCw/33gXStaRBoMjx5Zp12+iq87b4+b/PeE
         T0yUMrur7d+pBETbggzCu7nUHklUi4ZiXggy5O3aQbiiWsJ1U4/wXb06/gUqKBBLx4
         7Sk+raM3dyd1g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id ADB4E611CC; Sun,  5 Dec 2021 17:29:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 05 Dec 2021 17:29:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-sUwSRhxpww@https.bugzilla.kernel.org/>
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

--- Comment #188 from Vladdrako (vladdrako007@gmail.com) ---
> P8Z68-V is not in the list of supported boards, could you try add it to t=
he
> list (asus_wmi_info_table)?=20

Added DMI_EXACT_MATCH_ASUS_BOARD_NAME("P8Z68-V LX", NULL),
Nothing changed.

> If it does not help, could you attach dump of your bios? (acpidump -b -n
> DSDT). I  assume that bios does not support WMI methods from that patch a=
nd
> need to search fully different workaround.

Here dump from CH341A https://www.upload.ee/files/13692045/P8Z68-V_LX.Bin.h=
tml

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
