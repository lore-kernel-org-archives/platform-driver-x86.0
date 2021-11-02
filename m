Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44CB1C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:16:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C86261076
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 14:16:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231340AbhKBOSd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 10:18:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:51132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231347AbhKBOS1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 10:18:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4ABD760FC2
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Nov 2021 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635862552;
        bh=RiGuGge1vlQP+nTJVWzyoaNo/Pr9gNsojVESLF6JwNc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FUvv3VfAdOWQqiGjO1redcVgo4XyQs/+iD7/GHgEbajzeRM1dNViOoTAESEwdTiDa
         Up1WlgIfm59nzzKiJXPgxyQZungqTxwyYjhRD65oZSReH5huNqsyXrGRu3FpNCfdHq
         ZAFgzq3Al+bAzfwPKi95fUt5EDMNckJonseE0RbbBRa/ebwfqW0abc+8pyeCL2stOq
         wLzlweTLxZe6XuDf+MyZ9PvCIelB4vGyLQOq+L/S+Vm6pB7cONQaKMUfnF5HYc8yT+
         +kR+wJzaqUEsmPcjJYME6eWD19ApZ4WCNcfEiK85E2GjjFaVqjbKXAUPYfK2O1Wuln
         w6bjsuJf3Y/Zw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Tue, 02 Nov 2021 14:15:51 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-rvKrd0xVYY@https.bugzilla.kernel.org/>
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

--- Comment #11 from Johannes P (johannes.penssel@gmail.com) ---
[  150.562836] ideapad_laptop: ideapad_acpi_notify vpc: 100
[  152.094907] ideapad_laptop: ideapad_acpi_notify vpc: 2000
[  154.742909] ideapad_laptop: ideapad_wmi_notify value: d0

These are the events picked up with your ideapad-laptop patch.

ideapad_acpi_notify vpc: 100=20
this is the mic mute key

ideapad_acpi_notify vpc: 2000=20
this is the rfkill/airplane mode key

ideapad_wmi_notify value: d0
this is a custom "open app" key. Although it generates no key code, it prod=
uces
this ACPI event: (picked up with acpi_listen)
8FC0DE0C-B4E4- 000000d0 00000000

Still nothing but grave silence from the brightness keys though.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
