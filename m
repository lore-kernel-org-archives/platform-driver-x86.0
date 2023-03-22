Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274D1C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 13:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbjCVN7C (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 09:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbjCVN67 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 09:58:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A82746AC
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 06:58:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7DC00B81CEF
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 13:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DF5CC433EF
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679493498;
        bh=rV1NrC9l2Q+OGdRrOUnNsreW38LZq19hSMkt2b1+rFw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lMG6GiCJRoJ5XgwLQOiqa6K0lrCajZPlZEDtkWjNI34NHTQpcY45SeLI5yalWFkcD
         kzcWIWWBJbb63fiRNIEk5C4/M4PB7qPBg2NMiBXvuBxQiHcCFy4UPXJ99gakhCyGZj
         50CjKDBlL3LSnipnozGwASzBERQSNmPIp7p7TWnguPpwlqlQJEtc7qOXIx6ezR93QM
         4KVIhn2/zQrDspe1sXjX45IdLredDoGNns9y0ln42Ce1VvEVndd5r+vqKmJL3hKqEk
         HKD2kDewJm71IZMzFp+JTUuFIVbniIS9oLx6ATn+Eb6lGnCm/IS9lrPKH+hLBD7+OZ
         AW4Gv+aTXcvvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D7364C43141; Wed, 22 Mar 2023 13:58:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 22 Mar 2023 13:58:17 +0000
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
Message-ID: <bug-216824-215701-Uny8fMH82G@https.bugzilla.kernel.org/>
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

--- Comment #15 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
Hi hans, sorry for bringing this issue again.=20

Recently I switched desktop environments, specifically Fedora 37 Gnome from
KDE. Since the 37 version of Fedora is using an older version of systemd i =
had
to install the patch you provided here and the function keys are working
(Fedora 38 has the latest systemd version with the patch included).

So the strange thing is, the disable/enable the touchpad function key F4
stopped working in Gnome for some reason.=20

evtest detects the input but it doesn't do anything in gnome:

Event: time 1679493260.452112, -------------- SYN_REPORT ------------
Event: time 1679493265.334443, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1d
Event: time 1679493265.334443, type 1 (EV_KEY), code 29 (KEY_LEFTCTRL), val=
ue 1
Event: time 1679493265.334443, -------------- SYN_REPORT ------------
Event: time 1679493265.336519, type 4 (EV_MSC), code 4 (MSC_SCAN), value db
Event: time 1679493265.336519, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), va=
lue
1
Event: time 1679493265.336519, -------------- SYN_REPORT ------------
Event: time 1679493265.337277, type 4 (EV_MSC), code 4 (MSC_SCAN), value 76
Event: time 1679493265.337277, type 1 (EV_KEY), code 85 (KEY_ZENKAKUHANKAKU=
),
value 1
Event: time 1679493265.337277, -------------- SYN_REPORT ------------
Event: time 1679493265.339611, type 4 (EV_MSC), code 4 (MSC_SCAN), value 1d
Event: time 1679493265.339611, type 1 (EV_KEY), code 29 (KEY_LEFTCTRL), val=
ue 0
Event: time 1679493265.339611, -------------- SYN_REPORT ------------
Event: time 1679493265.342147, type 4 (EV_MSC), code 4 (MSC_SCAN), value db
Event: time 1679493265.342147, type 1 (EV_KEY), code 125 (KEY_LEFTMETA), va=
lue
0
Event: time 1679493265.342147, -------------- SYN_REPORT ------------
Event: time 1679493265.343741, type 4 (EV_MSC), code 4 (MSC_SCAN), value 76
Event: time 1679493265.343741, type 1 (EV_KEY), code 85 (KEY_ZENKAKUHANKAKU=
),
value 0
Event: time 1679493265.343741, -------------- SYN_REPORT ------------


How can i had this key to the patch you created for systemd here:
https://github.com/systemd/systemd/pull/25824



Thank you Hans!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
