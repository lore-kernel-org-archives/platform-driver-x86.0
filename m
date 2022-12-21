Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC0DC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 12:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiLUMNB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 07:13:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiLUMNA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 07:13:00 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8186543
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 04:13:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 956E16177C
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 12:12:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02D54C433D2
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671624779;
        bh=WYHoFzW0+jbZeH06ux0JF82zVcvTIuWAK3A/LweRXRc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Y+7nJbY1pZh/naH41jbOh6PiKMtS5HnscuO3o9YHwT1HJ5djcyuhZrKIfX4XYV0NS
         hwekl+XWpTPlyvHK3XkR34uj3Oss810UGCJlq6iLPSIjPix8XAFUL3EWn/lL6l8uED
         bmRFdYeGztoKwrhqrgtuZZ8TzsvgdJSW/wvRMphn8Yf2+n1KCSz+I3LZwUah3zNlLG
         LWSok4a4EewEMyBe0EZ/g8ajO9DUYcTrfX+AuW0VPOkPFx2lH8vw3XEQMSYvLTdCUs
         2rDUqupw8XZzrEaufGIHVw6U7AMKGKpYA0JitaJvJd16ObDJ/pjbqZuF7mlBXHtovV
         qw1Y6Q6FWf6GA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DE754C43141; Wed, 21 Dec 2022 12:12:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 12:12:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-zILa3e9cas@https.bugzilla.kernel.org/>
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

--- Comment #7 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
(In reply to Hans de Goede from comment #4)
> Thank you for the bug report.
>=20
> Getting the 3 keys which don't send any events to work should be a matter=
 of
> adding mappings for the MSI custom atkbd scancodes for these.
>=20
> I'm going to attach a 60-keyboard.hwdb file here. Please copy this file to
> /etc/udev/hwdb.d and then run:
>=20
> sudo systemd-hwdb update
> sudo udevadm trigger /dev/input/event*
>=20
> After this run "sudo evtest" again and select the "AT Translated Set 2
> keyboard" again. Now all 4 keys should generate events.
>=20
> And hopefully your desktop-environment will also respond to these events.

Thank you for responding!

So i did those steps but the desktop environment didn't respond and nothing
happened (example: mute/unmute mic).

evtest showed the events though

Related to the camera, you are right the output is always the same when
pressing the hotkey:

vent: time 1671624629.967592, type 4 (EV_MSC), code 4 (MSC_SCAN), value ee
Event: time 1671624629.967592, type 1 (EV_KEY), code 212 (KEY_CAMERA), valu=
e 1
Event: time 1671624629.967592, -------------- SYN_REPORT ------------
Event: time 1671624630.042611, type 4 (EV_MSC), code 4 (MSC_SCAN), value ee
Event: time 1671624630.042611, type 1 (EV_KEY), code 212 (KEY_CAMERA), valu=
e 0

Using the switch on the side of the keyboard gives me this:

Event: time 1671624717.066109, type 4 (EV_MSC), code 4 (MSC_SCAN), value d9
Event: time 1671624717.066109, -------------- SYN_REPORT ------------
Event: time 1671624717.068528, type 4 (EV_MSC), code 4 (MSC_SCAN), value d9
Event: time 1671624717.068528, -------------- SYN_REPORT ------------
Event: time 1671624718.487656, type 4 (EV_MSC), code 4 (MSC_SCAN), value ee
Event: time 1671624718.487656, type 1 (EV_KEY), code 212 (KEY_CAMERA), valu=
e 1
Event: time 1671624718.487656, -------------- SYN_REPORT ------------
Event: time 1671624718.490199, type 4 (EV_MSC), code 4 (MSC_SCAN), value ee
Event: time 1671624718.490199, type 1 (EV_KEY), code 212 (KEY_CAMERA), valu=
e 0

Off: d9, On: value 1 and 0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
