Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE49C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 08:13:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D430460F70
	for <platform-driver-x86@archiver.kernel.org>; Tue,  2 Nov 2021 08:13:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhKBIQI (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 2 Nov 2021 04:16:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:47890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhKBIQH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 04:16:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6F6AF60E9C
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Nov 2021 08:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635840813;
        bh=LMWIF19AoBDIu56y/C0DC0TTpyOVAB/Wdxqd7UL0AJU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=H2RxIwvIoCvMM/q/9cTOpRQqJ+JeKVPObYBH1YMx7Ycwx/sxG3ABSBH+TuplQNu5I
         cOpyY+e2lpRTr6cdXmM/TBmYS3AV1tCs3ipQsL27lcVXhPg67id5I1uacsyZeWK5XK
         dT5vcH1SIex/ZE+UrPj6LV40Sn7i7DTsArU3urpuc57e6UfiS52ZPnD4UKWt7iHcN3
         qulQ56xOqaD0a4ygpLMhWCIHuxmjHZDHylkNq5+WvM9ZKZXZ6gl4qRIo2oPXy3AEER
         5O9sTS+Ma6+pKfUjcQF+rr398gfDHVC4IM1sFSJac4R0JDELkX/OjCipksspTa6XS8
         ySkV2ZGUv0b9Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Tue, 02 Nov 2021 08:13:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214899-215701-GCinHhqdJL@https.bugzilla.kernel.org/>
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

--- Comment #10 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 299401
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299401&action=3Dedit
ideapad-laptop event debug patch.

Can you give this patch a try please; also make sure you have CONFIG_ACPI_W=
MI
enabled please.

With this patch pressing your micmute button should definitely show an even=
t in
the "dmesg -w" output; if the micmute does not show events your not running=
 the
patched code.

Once you have verified that the micmute button logs events in dmesg, please=
 try
the brightness buttons.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
