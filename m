Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D57C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 17 Oct 2022 10:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbiJQKJ6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 17 Oct 2022 06:09:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230445AbiJQKJy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Oct 2022 06:09:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D424B859
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 03:09:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 30D1061036
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 10:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9527EC4315E
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Oct 2022 10:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666001386;
        bh=j+iUaPSnUpky8cSZw8LHlMFTeEYOT4WEMkTwVK93tco=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IKfaqmTmORWJkphJTYJ0b/iFjE5bty8uPgnOSg54n/F/OeGkUwDZYJmU9qF164KOQ
         mxUpXE0k+5+KcijHDfbsZpRU288ahwNNqoBE4cdR3rR1Yp/Bl/c/VG6AV45AG+dpTR
         T7r9kLYFk+d/gB24B1jNlRN2qoME53U0XIslTrJDAGSfMdP+krTbfIG7kYTi8GeoEM
         4MlCje3PO/1dOgMgodID47o0SJZ/s88a31HmAztUG8kCZzwHJCQzqc3MNlUeMMdJYP
         MHXI5l4BCvCMZOC3wo4h3UnsQ4lWiUjSmSpKbcXaGfe0a8KgBESLZVQg6D1YYFQzOf
         bFf9OlU6XkMOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 87E4CC433E9; Mon, 17 Oct 2022 10:09:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 17 Oct 2022 10:09:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jlp.bugs@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-zNleZbGqP3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Jure Repinc (jlp.bugs@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jlp.bugs@gmail.com

--- Comment #261 from Jure Repinc (jlp.bugs@gmail.com) ---
Created attachment 303020
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303020&action=3Dedit
Asus P8H67 DSDT

Is Asus P8H67 also a MB that could have support added?

DSDT attached.

dmidecode:
Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
        Manufacturer: ASUSTeK COMPUTER INC.
        Product Name: P8H67
        Version: Rev X.0x
        Serial Number: MF70B3G04701427
        Asset Tag: To be filled by O.E.M.
        Features:
                Board is a hosting board
                Board is replaceable
        Location In Chassis: To be filled by O.E.M.
        Chassis Handle: 0x0003
        Type: Motherboard
        Contained Object Handles: 0

dmesg:
[207642.852150] nct6775: Found NCT6776D/F or compatible chip at 0x2e:0x290
[207642.852158] ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWRE) (20220331/utaddress-204)
[207642.852163] ACPI: OSL: Resource conflict; ACPI support missing from dri=
ver?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
