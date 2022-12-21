Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDBBC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 13:18:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbiLUNSE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 08:18:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiLUNSD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 08:18:03 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C4241EEFC
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 05:18:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0CC4861787
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 13:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68540C433EF
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 13:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671628681;
        bh=r9jx2BxasQsqn9WwRV8om9CP0UCHH43GfomfcmGW+hY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DBaIuGYg9HrvYHvZnqFhXSdc7TSvsnoQeZCK2QIypiD0fDNeoHWgvbNqZJLWA/VdW
         IT6bxGzVECAbMRETL/xHta5T7E4iPIscfqe7KEsqBlv0qjOzetnr3RwOmwj2Z7StI2
         ifqSI69O/gU1WaEKE8thAhpODFXmX5H3RSys+UnBOu+T4NX49y6EpftPxD2BF78ekv
         yKjOo/QhPDMer2mDgHQbOwGHIEtsNitz68z0BdosvqRtfjxx0tulmK4BCpOZukwfki
         yxap6Oenn12enjeA6c7LnMU79eROpoYwqU6lgDpwMzf+GbsovKXAFtbXTwhXS8f+2O
         BMtBQsB34fjoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2F5FBC43142; Wed, 21 Dec 2022 13:18:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 13:18:00 +0000
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
Message-ID: <bug-216824-215701-GjcIHPiQ5P@https.bugzilla.kernel.org/>
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

--- Comment #10 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
I found out that the rotation screen key now also works but it's not associ=
ated
with any keyboard shortcut in system settings.

So to summarize, hotkeys that now work: 1. Mute/Unmute Microphone, 2. Camera
On/Off (KDE doesn't notify the change), 3. Opens up System Settings (as a
keyboard shortcut), 4. Screen Rotation Hotkey (Nothing happens because it's
probably not associated with any keyboard shortcut).


So i think they are all working now Hans!

Just noticed something else (it's not that important). Some of the hotkeys =
have
a led that doesn't turn on when i press them (see the led.jpg and led 2.jpg
images).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
