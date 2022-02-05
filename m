Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA1DDC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 18:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbiBESCr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 13:02:47 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:43262 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233036AbiBESCq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 13:02:46 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7FE9A6118E
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 18:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E056BC340ED
        for <platform-driver-x86@vger.kernel.org>; Sat,  5 Feb 2022 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644084165;
        bh=9Dnz9OyVFKQx6xZYXYhaS1+pG54LS4XHeA4Spih3WZo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Sqos1qflth+96hVlZDmJsJFWw164+B88/p8+lveSq4wqXUwk/kW/kQ3eLrYQ0ozrc
         6YH2YiInM/AtcXxvHbGcb3n1fledMWKUYd8lMNEGq7P1G9S3ynycBakEt/fIs64032
         iSCFpDgxvYlZNGEDQQVLzT7uS5rqEHLF6UdjpuyxumuBj08CXzMk7vxTLdvCerXqGK
         rC830KAPbewLEqw+7XI2rzwHl2jwgGVOZxpf5XSw0Dir2jb95Ie4uB1hDiECXsToc6
         5oTPOz8k9T6e8giNmsnUbs0h+Igc74P4SxD4VNabZ48k2+875k5pSGSRUEzRqFjWl4
         TlJUhr/vdlFhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C0760C05FD4; Sat,  5 Feb 2022 18:02:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 212985] ideapad_acpi: VPC2004:00: DYTC interface is not
 available. platform_profile interface is unavailable
Date:   Sat, 05 Feb 2022 18:02:45 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lortegap@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform-driver-x86@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212985-215701-pCVcztKhcm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212985-215701@https.bugzilla.kernel.org/>
References: <bug-212985-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212985

Luis O (lortegap@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lortegap@protonmail.com

--- Comment #6 from Luis O (lortegap@protonmail.com) ---
Sorry for bothering, but I noticed than in kernel 5.16.5 there's a new mess=
age:

[    8.069951] ideapad_acpi VPC2004:00: DYTC_VERSION is less than 4 or is n=
ot
allowed: 4
[    8.069953] ideapad_acpi VPC2004:00: DYTC interface is not available

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
