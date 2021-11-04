Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A219C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Nov 2021 21:22:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AF0261252
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Nov 2021 21:22:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbhKDVZd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Nov 2021 17:25:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:38236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232051AbhKDVZc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Nov 2021 17:25:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4E10E60F39
        for <platform-driver-x86@vger.kernel.org>; Thu,  4 Nov 2021 21:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636060974;
        bh=ahKZDfWg6flTbNREawztuwfLfaAOAjDX2O1QA69a3Nc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lylRBGdCTCdMTUnWM1JVtYKkYO2NpWmEphwA9NLUEpVr1LEWY8EbR6tc+SQI56wV1
         kqcrAWa3WnNv0iDDG2WAhCjbQW3IShgNT2VAkdGF7e5A5XwjzVRMy2vDX3DMnA/Mz3
         3qPiCf2U7Whiitqg4sb2PqMTPegrmXTC0jwiMVLgbDS8klpOsY1N2SwO+LIm9ajNJF
         58Tv+r+UKRls/01dVm7SeYg9jA0HlU7tnySQ2qAlX/9yCZ8aziqEtN0gPOOu5kjwKI
         Ojx8ZCm40y7bTw9NZ1PXXAkjp29YowjZhTOqP2yHeeGQ0Ubm13J4CUnjx/yf5KFzGC
         QepkBkc2nNvHg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Thu, 04 Nov 2021 21:22:53 +0000
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
Message-ID: <bug-214899-215701-F0c9Sa3Qtr@https.bugzilla.kernel.org/>
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

--- Comment #17 from Johannes P (johannes.penssel@gmail.com) ---
Looks like the mic mute key and the brightness keys do not behave identical=
ly
with the ideapad-laptop module unloaded after all.

While playing around with ACPI EC debugging today, I was able to produce ou=
tput
for everything (including the otherwise "invisible" KB backlight toggle) ex=
cept
the brightness keys. This included the mic mute key and other keys reliant =
on
ideapad-laptop. Without the module, pressing these keys still triggered EC
debug output.

Just as a correction to my above claims.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
