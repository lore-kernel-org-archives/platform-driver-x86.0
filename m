Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FC8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Nov 2021 12:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83CD3611AF
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Nov 2021 12:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhKCMsU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Nov 2021 08:48:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:35538 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230282AbhKCMsT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Nov 2021 08:48:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A3EF611C5
        for <platform-driver-x86@vger.kernel.org>; Wed,  3 Nov 2021 12:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635943543;
        bh=VJfu/ehGBR4f0UbzP6NMEZXzqFJ68gi9aHwLCXh+wns=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N121vN0CkfTOWqepRpAdNBNoKHeU3GPJxDoJVdFVfXQMD4Mp3detY0QhBaP4TBmQE
         NrjyrjEF1jMcVUserrykAUz5DCOG4Sk6vNm/sUhlhhPZQtbo2BwgXrycvwJdzmAwbI
         KwFM+fH40vcW9hw/o/940rSQETC0kjasLbJeujyn0nrsYXNz4VkOyfUZfJ4iUpqDP1
         1tdnPd2OMDXXA/er3XPcRLkzuI4JzZ5FEuUWZCziRy5y+4JcokUBqd1IGlkND4QaLU
         HP8brTTtlVHkqEw4krdvNs1Qx0OXc33dR2xy46UtiiSQ/qBIBlPrcTOiCEZnX6NOJs
         xZCBYNySv1/BQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 03 Nov 2021 12:45:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: temp82@luukku.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-lvZQDlTHAL@https.bugzilla.kernel.org/>
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

Jarkko Korpi (temp82@luukku.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |temp82@luukku.com

--- Comment #146 from Jarkko Korpi (temp82@luukku.com) ---
Please add also Asus z390 rog strix f-gaming.

[    3.685656] nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
[    3.685747] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
[    3.685750] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
