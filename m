Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F80C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Jun 2022 09:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234182AbiFMJTB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Jun 2022 05:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbiFMJS4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Jun 2022 05:18:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D11140FF
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 02:18:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D77F861336
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 09:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DD01C34114
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jun 2022 09:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655111934;
        bh=z1bhuOFoieXZ3tyYUyxaVRhf1Asp0bFvKq7hc6Yu5nA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J3LwnTTTd+htQAGcCewDpNZSkDlasLXS+dookKnOJmhOdA/+rGIylezB59Blb5ozn
         lF4h7Um8Nxl3fgHdliFnIxo1eZdICNIH3aR2FRgwGsvZvdEPBOZhsa+xti9QRVyFZo
         YI7MVqqo2Uw9RtBR/wc30vo+Hq6b7P1UJQP9zg8txDfa+bQ4Rgaj42Wp3UMJD+RHgl
         8qEcfHB0o9TaIch/hTcHVakStTWs7adfqVQA2vsEokXzKbGCC5fSklvqF619EHwj7P
         I0/TikJ6mwYbeRbxmX625ThHbFbGklTnAMQjK7V8dvQPW5P87DWYy2ebZFTsZ7MRRy
         PEewbRTluCc0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 04956C05FD2; Mon, 13 Jun 2022 09:18:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 13 Jun 2022 09:18:53 +0000
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
Message-ID: <bug-214899-215701-HCDc9k6OWP@https.bugzilla.kernel.org/>
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

--- Comment #31 from Johannes Pen=C3=9Fel (johannes.penssel@gmail.com) ---
Thank you for your help!

The kernel ships with a tool to read / write to the EC. It is built by runn=
ing
"make ec" inside tools/power/acpi and relies on the module ec_sys (enabled =
by
CONFIG_ACPI_EC_DEBUGFS). To enable EC write support, this module must be lo=
aded
with the parameter "write_support=3D1". Writing to a register works by runn=
ing
"./ec -w [offset] -v [value]".

Replacing all the OSYS if-conditionals inside _REG with just "Local0 =3D 0x=
06"
indeed fixes the issue. Looks like _REG somehow does not receive a correct
value for OSYS. I've tried changing _SB.PC00._INI so it unconditionally sets
OSYS to 0x07DF, but this does not fix _REG. When executed in step-by-step m=
ode
with the kernel AML debugger, _SB.PC00._INI seems to function correctly by
default anyway.

Here comes the interesting part: When running _REG (with arguments 0x03 and
0x01) inside the kernel AML debugger with unmodified ACPI tables, the method
executes correctly and the keys start working.

My understanding of ACPI is limited, but my guess would be that for some
reason, \_SB.PC00.LPCB.EC0._REG gets evaluated before _SB.PC00._INI, thus
leaving the former with an incorrect value for OSYS. AFAICT, this does not =
look
too dissimilar from the issue in the bugzilla thread you linked.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
