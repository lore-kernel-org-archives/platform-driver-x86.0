Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05E4C76195
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 13:43:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbjC0Nn2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 09:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjC0Nn1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 09:43:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A8FA3ABF
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 06:43:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CDB88B8159F
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 13:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77664C433EF
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 13:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679924603;
        bh=adQQSqDSVfkBszAripMtuoGsZrDyXaKZ3a1uO0QC9wI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QqRFSEuQQ6fRUOJvRKTpvQ0bgH1IC4oJ78dW2epS1Q78QmP/g9T1E7Ov2mrdy4TBO
         y4FklicYVUlP2qWu27b3btbyPbLbigMeBP2tt/NW6/be5FUsxkJZBDior5SUWlLNm7
         R0FzCfDv/EPiUED8msBqFdtD+IxQe7fDCtFJqC0WutNJIRq3IfC2I7VekFa5fGZbPP
         cRtAYE0zlb8R3Z28FOIIhMTe6q2Qk1kcBOdRj2cS7A/Smv9nSR2CyMAf93gCV+7S6z
         SS6pYFPLulzrMleCKtvXm8gLpPIfJh2lPd6UfmnQS/qbi+LigXVyBYtUyitsLsFcCo
         XWNfvEkPMXo7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 574B6C43141; Mon, 27 Mar 2023 13:43:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 13:43:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-tYkdjLRzxm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216824-215701@https.bugzilla.kernel.org/>
References: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

--- Comment #17 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
(In reply to Hans de Goede from comment #16)
> That is weird.
>=20
> You could try adding the following line to the list MSI keys in hwdb:
>=20
>  KEYBOARD_KEY_55=3Df21
>=20
> But as the evtest output shows scancode 85 / 0x55 is normally used for a =
key
> found on some Japanese keyboards and the Fn + F4 keypress is not just
> sending 0x55 it is sending windows-key + ctrl + 0x55 .
>=20
> You say this did work under KDE ?

Thanks for replying Hans!

Yes, it the shortcut worked on KDE but not in Gnome for some reason.


I updated the 60-keyboard.hwdb with the KEYBOARD_KEY_55=3Df21 line in the M=
SI
section.

Then i did:
sudo systemd-hwdb update
sudo udevadm trigger /dev/input/event*

It still does nothing

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
