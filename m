Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1527C4321E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Apr 2022 23:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbiDLXgV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Apr 2022 19:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231738AbiDLXd2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Apr 2022 19:33:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F7FCD32C
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 15:22:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9C51FB82054
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 21:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62F64C385A8
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 21:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649799975;
        bh=dCSI1dvN+jRmVvcTPCEMymE4y8cb1BycR73hqUcDfjk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bwsMNCE0lsHazKiXtQK+9YsD3fLFqPA7Oqc15l3AbhS5qWbQE9unHu8sNVViUCU1x
         +mSMjellluusSIrwSpUm1NsX9aGtrZENqlvl+HFEE+05tKcaFYQvNcwrlwiYuNZhHe
         GfrMaBBx7Lbx6BeAJvVE51lJxgcxSh7IiRz16ezMaYY9cQlQkFM4BLmwYB4nJUXwmD
         6miOMVL1EMtYYc2fXQGasVKosb10xv0ja4FGd6NBXisECrgv8/u8CzjlW1kDmcX1iQ
         tvDcBjywJ4wEZ2YqZ4CybpnET2357WwIbBtuS7C1CObIJfZmojUL84m8yrbkXI0sNw
         JLA8mY5OagtXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 42F26C05F98; Tue, 12 Apr 2022 21:46:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 12 Apr 2022 21:46:15 +0000
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
Message-ID: <bug-214899-215701-3aD9wPSmnv@https.bugzilla.kernel.org/>
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

--- Comment #21 from Johannes P (johannes.penssel@gmail.com) ---
Thank you for your advice, I really appreciate that you still keep my issue=
 in
mind. Unfortunately, still no success with i8042.dritek=3D1.=20

After digging through Windows Event Viewer, I was able to figure out that t=
he
keys actually do trigger ACPI events there. When pressing brightness up/dow=
n,
the corresponding EC query methods _Q12/_Q11 are executed, resulting in an =
ACPI
brightness event.

            Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0=
xFF
            {
                P80B =3D 0x11
                Notify (^^^GFX0.DD1F, 0x87) // Device-Specific
                Notify (VPC0, 0x80) // Status Change
            }

            Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query, xx=3D0x00-0=
xFF
            {
                P80B =3D 0x12
                Notify (^^^GFX0.DD1F, 0x86) // Device-Specific
                Notify (VPC0, 0x80) // Status Change
            }

When calling the methods on Linux through the ACPI kernel debugger, the same
thing happens. A brightness event is generated and the EC debug module prin=
ts
this:

[ 1101.374238] ACPI: EC: 2: Increase command
[ 1101.374244] ACPI: EC: Command(WR_EC) started
[ 1101.374247] ACPI: EC: TASK (0)
[ 1101.374271] ACPI: EC: EC_SC(R) =3D 0x08 SCI_EVT=3D0 BURST=3D0 CMD=3D1 IB=
F=3D0 OBF=3D0
[ 1101.374275] ACPI: EC: EC_SC(W) =3D 0x81
[ 1101.374497] ACPI: EC: IRQ (1)
[ 1101.374532] ACPI: EC: EC_SC(R) =3D 0x08 SCI_EVT=3D0 BURST=3D0 CMD=3D1 IB=
F=3D0 OBF=3D0
[ 1101.374537] ACPI: EC: EC_DATA(W) =3D 0x00
[ 1101.374837] ACPI: EC: IRQ (1)
[ 1101.374872] ACPI: EC: EC_SC(R) =3D 0x00 SCI_EVT=3D0 BURST=3D0 CMD=3D0 IB=
F=3D0 OBF=3D0
[ 1101.374876] ACPI: EC: EC_DATA(W) =3D 0x10
[ 1101.375113] ACPI: EC: IRQ (1)
[ 1101.375145] ACPI: EC: EC_SC(R) =3D 0x00 SCI_EVT=3D0 BURST=3D0 CMD=3D0 IB=
F=3D0 OBF=3D0
[ 1101.375163] ACPI: EC: Command(WR_EC) stopped
[ 1101.375169] ACPI: EC: 1: Decrease command
[ 1101.375301] ACPI: EC: 2: Increase command
[ 1101.375304] ACPI: EC: Command(RD_EC) started
[ 1101.375307] ACPI: EC: TASK (0)
[ 1101.375331] ACPI: EC: EC_SC(R) =3D 0x00 SCI_EVT=3D0 BURST=3D0 CMD=3D0 IB=
F=3D0 OBF=3D0
[ 1101.375337] ACPI: EC: EC_SC(W) =3D 0x80
[ 1101.375564] ACPI: EC: IRQ (1)
[ 1101.375599] ACPI: EC: EC_SC(R) =3D 0x08 SCI_EVT=3D0 BURST=3D0 CMD=3D1 IB=
F=3D0 OBF=3D0
[ 1101.375603] ACPI: EC: EC_DATA(W) =3D 0x00
[ 1101.375853] ACPI: EC: IRQ (1)
[ 1101.375888] ACPI: EC: EC_SC(R) =3D 0x01 SCI_EVT=3D0 BURST=3D0 CMD=3D0 IB=
F=3D0 OBF=3D1
[ 1101.375908] ACPI: EC: EC_DATA(R) =3D 0x00
[ 1101.375922] ACPI: EC: Command(RD_EC) stopped
[ 1101.375926] ACPI: EC: 1: Decrease command
[ 1101.376178] ACPI: EC: 2: Increase command
[ 1101.376182] ACPI: EC: Command(WR_EC) started
[ 1101.376185] ACPI: EC: TASK (0)
[ 1101.376209] ACPI: EC: EC_SC(R) =3D 0x00 SCI_EVT=3D0 BURST=3D0 CMD=3D0 IB=
F=3D0 OBF=3D0
[ 1101.376214] ACPI: EC: EC_SC(W) =3D 0x81
[ 1101.376601] ACPI: EC: IRQ (1)
[ 1101.376636] ACPI: EC: EC_SC(R) =3D 0x08 SCI_EVT=3D0 BURST=3D0 CMD=3D1 IB=
F=3D0 OBF=3D0
[ 1101.376641] ACPI: EC: EC_DATA(W) =3D 0x00
[ 1101.377350] ACPI: EC: IRQ (1)
[ 1101.377385] ACPI: EC: EC_SC(R) =3D 0x00 SCI_EVT=3D0 BURST=3D0 CMD=3D0 IB=
F=3D0 OBF=3D0
[ 1101.377389] ACPI: EC: EC_DATA(W) =3D 0x1a
[ 1101.377671] ACPI: EC: IRQ (1)
[ 1101.377697] ACPI: EC: EC_SC(R) =3D 0x00 SCI_EVT=3D0 BURST=3D0 CMD=3D0 IB=
F=3D0 OBF=3D0
[ 1101.377712] ACPI: EC: Command(WR_EC) stopped
[ 1101.377715] ACPI: EC: 1: Decrease command
[ 1101.377802] ACPI: EC: 2: Increase command
[ 1101.377805] ACPI: EC: Command(RD_EC) started
[ 1101.377808] ACPI: EC: TASK (0)
[ 1101.377831] ACPI: EC: EC_SC(R) =3D 0x00 SCI_EVT=3D0 BURST=3D0 CMD=3D0 IB=
F=3D0 OBF=3D0
[ 1101.377836] ACPI: EC: EC_SC(W) =3D 0x80
[ 1101.378089] ACPI: EC: IRQ (1)
[ 1101.378124] ACPI: EC: EC_SC(R) =3D 0x08 SCI_EVT=3D0 BURST=3D0 CMD=3D1 IB=
F=3D0 OBF=3D0
[ 1101.378128] ACPI: EC: EC_DATA(W) =3D 0x00
[ 1101.378445] ACPI: EC: IRQ (1)
[ 1101.378469] ACPI: EC: EC_SC(R) =3D 0x01 SCI_EVT=3D0 BURST=3D0 CMD=3D0 IB=
F=3D0 OBF=3D1
[ 1101.378489] ACPI: EC: EC_DATA(R) =3D 0x00
[ 1101.378498] ACPI: EC: Command(RD_EC) stopped
[ 1101.378501] ACPI: EC: 1: Decrease command

But why doesn't this happen when pressing the actual key like on Windows?

As far as I can tell, Windows registers keycodes on the exact same keys as
evtest, i.e. there are no codes registered when I press the brightness keys.
(this also applies to mic mute, rfkill, etc...)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
