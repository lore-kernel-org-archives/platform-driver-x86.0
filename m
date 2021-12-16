Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C31C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Dec 2021 07:14:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbhLPHOS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Dec 2021 02:14:18 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:48030 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234369AbhLPHOR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Dec 2021 02:14:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8817AB822FF
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Dec 2021 07:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F436C36AE4
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Dec 2021 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639638855;
        bh=+yYvIxLTGaPpTu8lITMgoPsubYm5ZOWllAi9RP2K6Wo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mw6IH9BveF2U8MBSAoSSxwixofhmjKnDFI04Sy3vQBgjmQjcaBvNZgnnp51akSrjw
         Hno9Y8cE+/rq1cONIOegk+PsTyFv0vd2PgL3Qtxz90M00wZSh+H32aIr2qQkUCBp/b
         0/y/uUBMDNpvUh72aUL1kYp9PyLceF9evgk8zW7KcpLpLB22uR/oVhmo02K2Ep9+3x
         YhNVIgFAVIRjEL/HDLlmPu5TIvkf/zO2VeFodT0MxEOa5bv+78eF+COQxCyzvYo9Mm
         +5SE8FA8kLh+z3rcglB5zoCNXCainGljP8NnQTkSah3SD6Y9Tj3tAfA8eQGuo0Co1P
         HiHXSEmhJ7fcQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3B8EF60F46; Thu, 16 Dec 2021 07:14:15 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 16 Dec 2021 07:14:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: logos128@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-5fkHgV9OCk@https.bugzilla.kernel.org/>
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

Ivo Ivanov (logos128@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |logos128@gmail.com

--- Comment #201 from Ivo Ivanov (logos128@gmail.com) ---
Created attachment 300039
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300039&action=3Dedit
0001-hwmon-nct6775-Add-support-for-ROG-MAXIMUS-X-HERO.patch

I can confirm that the sensors of Asus ROG MAXIMUS X HERO also work with the
proposed patchset. The name of the board is "ROG MAXIMUS X HERO", and needs=
 to
use acpi_board_LPCB_MUTEX.

Attached a patch based on the Linux 5.15 branch with applied latest patchset
for nct6775 from 2021.12.14 (comment #199 from Denis Pauk).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
