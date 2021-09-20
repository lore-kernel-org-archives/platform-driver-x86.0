Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539F9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 12:37:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3EF5361177
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Sep 2021 12:37:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235233AbhITMik (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Sep 2021 08:38:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:58798 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231849AbhITMij (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Sep 2021 08:38:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4DFA560F9D
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Sep 2021 12:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632141433;
        bh=wAOjvX2BdkVVJ9W1W4uK4vEKkOrgrO1J4t3fcSaTb8U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=s/SBe8zDHJ75hLmsvIkDKBNFiRIv2J2QYDw13FVPnR0tUqObUVP1tc/kbvQahWXr+
         OjsvZY3BvWNiBLMqUyj9aIvhCg1rmKwE8hWR74UncVutI9M+H5YVe7ZgdaqNVXVz5u
         Ci9pH/h9eyfsLee56ZTcaYhuTEWa2X5v97tYnGP4jfZ99fY3Lq1jqZAl+W9CyCUpqi
         nrJ2C3xDnX8IIx8V5zvJ0pLSm6FCHA+ctwBLXFQpIFwVX5VhkQiy+OeSGAGvMZmbEv
         CpG5D77nHl/4kklUYa/gg2RsvjW1bfun7CoUgs0AixW4NtoU4e5BokQZvCzBj9ZCHU
         nc26TgZ+MvOuw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 20 Sep 2021 12:37:12 +0000
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
Message-ID: <bug-204807-215701-2YwyOdSBQE@https.bugzilla.kernel.org/>
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
 Attachment #298805|0                           |1
        is obsolete|                            |

--- Comment #125 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 298887
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298887&action=3Dedit
Add support for access via Asus WMI to nct6775 (2021.09.20)

Updated patch with support:
---
+       "PRIME B360-PLUS",
+       "PRIME B460-PLUS",
+       "ROG CROSSHAIR VIII DARK HERO",
+       "ROG CROSSHAIR VIII FORMULA",
+       "ROG CROSSHAIR VIII HERO",
+       "ROG CROSSHAIR VIII IMPACT",
+       "ROG STRIX B550-E GAMING",
+       "ROG STRIX B550-F GAMING",
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
---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
