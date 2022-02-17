Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9364FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 01:20:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230183AbiBQBVL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Feb 2022 20:21:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230173AbiBQBVK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Feb 2022 20:21:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC85E2A0D46
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 17:20:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AE6E6B8206C
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 01:20:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76BAAC004E1
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 01:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645060854;
        bh=sKooRmpVIYS2FT3oyXacmWVwAyEfypu/PDFP+HWZWg8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CwTziOsyEJYSqMQQ+1bjn+gsaUZJPfoXVTR0SftZjo2FKun5K+/1oFpXxsBhXPLRq
         nlAsfQZ2dXTMjPPFnW9tin2rOjuHVeW0NuwGHoFJC7PBKZ4N9dneyibLZrtyNwM36K
         KtAHrC2NeWnl3iJdxaOauzlvEtgO2+TEIxwNXrCpKK3sD+3c6SYUZf5DmmdLGRxKxC
         4xd9PRKFkQUnP/xkWIRT1M75oxrw5Ce6E2FJenbWbpsmiPj+6gaLoAO8VXBQzLDD/T
         cdsvsmQFVx3af92dAt+gmhA5TTxqKPgF4INS6py85LbmkDDuvl+62EsADols9/W6Ix
         xzUYhcYo0/BYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 55A7CC05FD2; Thu, 17 Feb 2022 01:20:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Thu, 17 Feb 2022 01:20:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-214899-215701-IFoq2hdw9m@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

Johannes P (johannes.penssel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|ideapad-laptop: platform    |ideapad-laptop: brightness
                   |backlight device not        |hotkeys not working
                   |working                     |

--- Comment #19 from Johannes P (johannes.penssel@gmail.com) ---
After doing some further testing, I am pretty sure that these keys are not
handled by ACPI at all. Setting acpi.debug_level to maximum and going throu=
gh
the debug layers one by one, I was not able to produce any sort of response
from them. I would really like to know what is going on here.=20

Curiously, uninstalling the Lenovo hotkey driver in Windows does not break =
them
there, so I guess they nonetheless must be using some kind of standardized
method to communicate with the OS?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
