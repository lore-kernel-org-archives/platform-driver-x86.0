Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1231C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun, 12 Jun 2022 15:25:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231444AbiFLPZH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 12 Jun 2022 11:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234861AbiFLPZG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Jun 2022 11:25:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88D9348332
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jun 2022 08:25:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 214F060F27
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jun 2022 15:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75093C3411C
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jun 2022 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655047504;
        bh=HN2LYjgE3nH8XQBjP2u+QjIhia1Y8Vme+K0Nj3nlS6M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=le/rx7l4DPH2Axz28f/0uf4nV6/7CTcMT5TGUH8wssoBuKwg5zRankYWXF536KW6T
         kzedAEOsshLfHw9y1GnvN9volysuk83Vi/Yj2J21kCyKY8n7gyjVzt9ZjfFwcnj2Ik
         Pi2bQkE9mxETSA/JJQD+e/TmBOxWx/6A0oQgj5GxTF+ns0SRa0kezqw0JZxOygDBJN
         rPvxkHQq/tsOvCSYMvuqBHZp+Ug8qRMIL3/giEVAUmexWo5LtWhdGWuin1kX0XNbo4
         rw44QI65TyWN2U2QhRERmPYNWi9a5zGepVvJaTQqOyWmMIYAuKgDROnyA34nLDLuHA
         BVbfBfRRTre1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 552AAC05FD6; Sun, 12 Jun 2022 15:25:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Sun, 12 Jun 2022 15:25:04 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-5MUJn3WAlv@https.bugzilla.kernel.org/>
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

--- Comment #29 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Johannes Pen=C3=9Fel from comment #28)
> Finally, I have managed to get the keys working.=20
>=20
> Using ec-dump.exe, I figured out which EC registers hold different values=
 on
> Windows compared to Linux. After writing 0x86 to offset 0xA3, (which is 0=
x80
> on Linux by default) the keys started working instantly, with proper ACPI
> events and everything.

That is some good detective work on your side!

May I ask how you are writing 0x86 to offset 0xA3 under Linux ?

I think this part of the DSDT is interesting:

        Device (EC0)
        {
            ...

            OperationRegion (ERAX, SystemMemory, 0xFE0B0400, 0xFF)
            Field (ERAX, ByteAcc, Lock, Preserve)
            {
                ...
                Offset (0xA3),=20
                OSTY,   3,=20
                    ,   1,=20
                ADPI,   2,=20
                    ,   1,=20
                ADPT,   1,=20
                ...
            }
            ...

            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 =3D=3D 0x03))
                {
                    ECAV =3D Arg1
                }

                If (((Arg0 =3D=3D 0x03) && (Arg1 =3D=3D One)))
                {
                    ...
                    If ((OSYS =3D=3D 0x07DF))
                    {
                        Local0 =3D 0x06
                    }

                    If ((Acquire (LFCM, 0xA000) =3D=3D Zero))
                    {
                        OSTY =3D Local0


Under Linux OSYS should be 0x06. So this in essence writes 0x06 to the lowe=
r 4
bits of the byte at offset 0xA3 of the MMIO region at 0xFE0B0400...

So maybe this is the path which we need to hit, but which for some reason is
not being hit under Linux ... ?

We could try to confirm this with a DSDT override. where we add an extra
unconditional (sow without all the if-s):


                       OSTY =3D 0x06=20

To the top of the _REG method above and then build a new DSDT and use the
initrd override method to inject this. See:

https://docs.kernel.org/admin-guide/acpi/initrd_table_override.html

If you can give this a try that would be great. If the issue turns out to be
that the _REG code is somehow not hitting the desired code-path then that
likely is a generic issue caused by subtle differences between how Linux ru=
ns
ACPI code vs how Windows does it. And figuring that out and fixing it will
likely also help on other devices.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
