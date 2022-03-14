Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 062CCC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Mar 2022 19:00:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237813AbiCNTBT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Mar 2022 15:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiCNTBT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 15:01:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA4613D53
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 12:00:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0F9EFB80FA1
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 19:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8138DC34117
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 19:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647284406;
        bh=PRcgKQrbeTp8117ke/nKss+WtQTDUrDa+wDswNEqRmY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eHn//KtiRROrAO+vSW8XKUs3OuyQxiGGynvVgZwXzeC25KzI/O6MV0hKwLgiShx6o
         v9ThP/r0z6+TAK9erWY7Po6SuLXAa+OTJCPCNHvo2SBEnOVnizbgtvEs/ObwvSrh4b
         FyXbN9QxuBSGnlvLCreyB6YNCR1P0QB7wd1czhHRRSHFcK//HU4Wvyrl5HbduP3okk
         4TbZ9j151BSya8qN0YJ8CJIRTSRiDnmIomnOLclXpF0nu4X0t6BGpH71BqvZh+XvWh
         KDQRpaqMHH9rJuJ4313ivcJMgOE6Bw5feGuTq9fPdiF/ToWbA1o95Br/977WGYEC4O
         RV/ioNoql9yaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6FB4BC05FD2; Mon, 14 Mar 2022 19:00:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 14 Mar 2022 19:00:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: renedis@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-3OQovQxzCF@https.bugzilla.kernel.org/>
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

renedis (renedis@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |renedis@hotmail.com

--- Comment #228 from renedis (renedis@hotmail.com) ---
Thanks all for the effort en support. please also add:

cat /sys/class/dmi/id/board_name
PRO H410T

[    5.478347] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[    5.478351] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20210331/utaddress-204)
[    5.478356] ACPI: OSL: Resource conflict; ACPI support missing from driv=
er?

uname -a
Linux rd-nas01 5.13.0-35-generic #40-Ubuntu SMP Mon Mar 7 08:03:10 UTC 2022
x86_64 x86_64 x86_64 GNU/Linux

cat /etc/os-release
PRETTY_NAME=3D"Ubuntu 21.10"
NAME=3D"Ubuntu"
VERSION_ID=3D"21.10"
VERSION=3D"21.10 (Impish Indri)"
VERSION_CODENAME=3Dimpish
ID=3Dubuntu
ID_LIKE=3Ddebian
HOME_URL=3D"https://www.ubuntu.com/"
SUPPORT_URL=3D"https://help.ubuntu.com/"
BUG_REPORT_URL=3D"https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL=3D"https://www.ubuntu.com/legal/terms-and-policies/priva=
cy-policy"
UBUNTU_CODENAME=3Dimpish

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
