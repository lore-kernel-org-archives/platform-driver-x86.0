Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C000FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 22:17:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90F0061075
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 22:17:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhKAWUD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 18:20:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:58086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231161AbhKAWUD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 18:20:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6307560C51
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Nov 2021 22:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635805049;
        bh=y81vKiPTHpVbtBzw5BuUSVeenAlfBhOqq4Ja08OvQTQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JkdLXCe3sjKlW9i5J6SmucHCwomcjittWEt4uTEdDJXQkE76fIFxCNWiSP6odc3mQ
         TR1XjcLtvfzD41Ph9UZpj4MBL8Xg0tEQnp6ePx3OQQDHxDY2X+Bky17nWIvBouCTCI
         EvSMOP8nkALWuu96eIg/UfBbM2VvV2EZEfEH5fEDeHrRYCcfoYPX+l+WL2Z+U7wNB7
         6Yxoj3gE2TwtVsJkKXPgtSscWvn01A00L1+7qJrTAYCPik8/h32let1WCY3/Q/e5To
         oFGmW54+MzoDD0ZW4g36VCEms8e+j+HR/vwkQZTFO7w2TWRfFqwqvoqAGav3MY2Xvl
         qPA6aML4w2HIw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Mon, 01 Nov 2021 22:17:29 +0000
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
Message-ID: <bug-214899-215701-JSHZUZbSQo@https.bugzilla.kernel.org/>
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

--- Comment #6 from Johannes P (johannes.penssel@gmail.com) ---
Getting those brightness keys to actually produce key events is something I
have tried unsuccessfully for quite a while now. Having just re-checked all=
 14
available input devices for good measure with evtest, there is still nothin=
g to
report. Same goes for ACPI and WMI events as far as I can tell. Under Windo=
ws,
the brightness keys work without issues.

I have noticed that this is actually very similar to how the microphone mute
key behaves without the ideapad-laptop driver loaded. (i.e. it is virtually
undetectable) The driver exposes this key via the keymap it creates for the
"Ideapad extra buttons" input device. Maybe my brightness keys need to be a=
dded
to this keymap as well?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
