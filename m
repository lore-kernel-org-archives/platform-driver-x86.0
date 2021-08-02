Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A86C4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 14:07:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 135D360555
	for <platform-driver-x86@archiver.kernel.org>; Mon,  2 Aug 2021 14:07:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236199AbhHBOHN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 2 Aug 2021 10:07:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:47244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233976AbhHBOFE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Aug 2021 10:05:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 981BC61151
        for <platform-driver-x86@vger.kernel.org>; Mon,  2 Aug 2021 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627912966;
        bh=zkR5fxia88myK+KKicUG3caoE5wnm/jDUxqU9JktYts=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OJu6TULKU4B/WrLE/ABk1IYOyqz1dTVvlpIvS1U1wnZcULpsXEkXDoHIobJ81Qmar
         J4P5ItJcErxVzwdM8sySWoqpk2DYTA+qKzGHD5qCg19gDlGa9Reon5XIXUBtAWSp9r
         ZgJWqqvkJcSwoLWrFpb6ScIvCKIPi/aUqPH0UE5AURgSMvlOK4PqWdL/5e1BVY63NU
         OXg9SB+pzEPp2H7PpWVBXh+0IadwER7PI0xRsH/YSmn2rbCoklhV57X2raUq+WA81i
         pFn/+6w4pLwthISO4H/XFLQqAvfVdWU9GGaCBW2L76SGYt58wi0eeD6w9iXRre3fLI
         A6QTPF3KEgdVg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Mon, 02 Aug 2021 14:02:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-FxTMELkmYJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #44 from wse@tuxedocomputers.com ---
Found the offending code bit in the dsdt:

    Scope (_SB.PC00.I2C0)
    {
        Device (TPAD)
        {
            [...]
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                BADR =3D SADR /* \_SB_.PC00.I2C0.TPAD.SADR */
                INTA =3D GNUM (0x0801000C)
            }
            [...]
        }
    }

INTA should evaluate to 0x8C (140), but does evaluate to 0x2c (44).
GNUM is some kind of offset calculation, ignoring the 0x08, taking values f=
rom
an array based on the 0x01 and adding it to the 0x000C. You can check it in=
 the
disassembled dsdt. I don't know ofcourse if GNUM is buggy, the array is wro=
ng,
or the 0x0801000C input value is wrong (you can choose an input value that
makes GNUM evaluate to 0x8C).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
