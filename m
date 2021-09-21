Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9861FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 14:45:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7753560F6E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Sep 2021 14:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbhIUOrS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Sep 2021 10:47:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:38390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233602AbhIUOrR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Sep 2021 10:47:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6C0006120A
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Sep 2021 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632235549;
        bh=wtynBv7org63btuaDul7AV9XjpfAz54/Z8P1sH0qlA8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XCIt+U+vcolIxlFxs4FgnBr1jvpNjFQ5m9FdgeLzFZywaSlDvb6OzKickAGOSDu0u
         dWwi7l5wtk3Vo9Xk/1YUysAyjY8ZBlQnhAkKAhIMpGKRzqstZYE4OnlhkEMga8gFhp
         K+n9wPawknrnVfrnXtZFsZ57YWa+shu3Gw1GwtL+ZpIOj0WVaVmNlcspdw/a7AnjlC
         07K3Rv/MW6Bwf7CxTDffimHD74wCDMwwxJVEJKtamxTTkZ8oWygcF61HgPEL3Z8fvd
         b+o6cscy6YDLI8+ywSlV+AB8aKWgby7fJDfwvUpz1u4MySgl6Yyhsc382+S600Yacb
         HjrQ3fbT3A30A==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 21 Sep 2021 14:45:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pauk.denis@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-204807-215701-we4BZrVVDm@https.bugzilla.kernel.org/>
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

Denis Pauk (pauk.denis@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #298887|0                           |1
        is obsolete|                            |

--- Comment #127 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 298905
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298905&action=3Dedit
Add support for access via Asus WMI to nct6775 (2021.09.21)

Added support by ASUSWMI:
--
+       "PRIME B360-PLUS",
+       "PRIME B460-PLUS",
+       "PRIME X570-PRO",
+       "ROG CROSSHAIR VIII DARK HERO",
+       "ROG CROSSHAIR VIII FORMULA",
+       "ROG CROSSHAIR VIII HERO",
+       "ROG CROSSHAIR VIII IMPACT",
+       "ROG STRIX B550-E GAMING",
+       "ROG STRIX B550-F GAMING",
+       "ROG STRIX B550-I GAMING",
+       "ROG STRIX B550-F GAMING (WI-FI)",
+       "ROG STRIX X570-F GAMING",
+       "ROG STRIX Z390-E GAMING",
+       "ROG STRIX Z490-I GAMING",
+       "TUF GAMING B550M-PLUS",
+       "TUF GAMING B550M-PLUS (WI-FI)",
+       "TUF GAMING B550-PLUS",
+       "TUF GAMING X570-PLUS",
+       "TUF GAMING X570-PLUS (WI-FI)",
+       "TUF GAMING X570-PRO (WI-FI)",
+       "TUF GAMING Z490-PLUS (WI-FI)",
--

I have added i2c adapter code from OpenRGB code:
--
+       "PRIME B450M-GAMING",
+       "PRIME X370-PRO",
+       "PRIME X399-A",
+       "PRIME X470-PRO",
+       "PRIME Z270-A",
+       "PRIME Z370-A",
+       "ROG CROSSHAIR VI HERO",
+       "ROG STRIX B350-F GAMING",
+       "ROG STRIX B450-F GAMING",
+       "ROG STRIX X399-E GAMING",
+       "ROG STRIX Z270-E",
+       "ROG STRIX Z370-E",
+       "ROG STRIX Z490-E GAMING",
+       "TUF B450 PLUS GAMING",
--

Could anyone with such boards check that it still works with OpenRGB? It us=
es
incompatible with ASUSWMI method. If it works, i will try to port to use
AsusWMI code.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
