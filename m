Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 551C6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 11:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbiLULiY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 06:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLULiX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 06:38:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3761272D
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 03:38:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3ABC9B81B6A
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 11:38:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D126EC433EF
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671622699;
        bh=kYVJs2O1O3ttT2CGd6VnmCICdTKs9njX76SrQE8V5WE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Zbi+GvnlGsOXD25/kqj4N1GTeRu0/uFx2dUTLI+0GLNGWnhwAXsGlmbVLBes6Pl1A
         WRHp8ZnAh58Wq6rsUJZ8o9m36vuqmGcqqQIkJTd7MEIFtZh49kF/MPNXU2bHZBb2qy
         7U2rRwQZ3cNXYTT+S1LVvmEr7upBMKbDgsepD+oMkTlcnqqZWczPJe0GMrq4NbXgy4
         zhT1IomXgZncQ3o10ED0GC8JYnXGYeA7RiaXt2limpG61ixxhC+8QwjDaaeJMg/P++
         0OBhgJgcGgkddPawqzx/Kp3zSr25/yibVSipWzXLRZScMZLMYirNqDPoWEibEYQgZh
         J3gyIqhqZl/5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AEC70C43142; Wed, 21 Dec 2022 11:38:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 11:38:19 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216824-215701-AGRpN0rM4c@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #4 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thank you for the bug report.

Getting the 3 keys which don't send any events to work should be a matter of
adding mappings for the MSI custom atkbd scancodes for these.

I'm going to attach a 60-keyboard.hwdb file here. Please copy this file to
/etc/udev/hwdb.d and then run:

sudo systemd-hwdb update
sudo udevadm trigger /dev/input/event*

After this run "sudo evtest" again and select the "AT Translated Set 2
keyboard" again. Now all 4 keys should generate events.

And hopefully your desktop-environment will also respond to these events.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
