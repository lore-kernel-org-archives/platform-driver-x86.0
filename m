Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BD6C46467
	for <platform-driver-x86@archiver.kernel.org>; Sat,  7 Jan 2023 18:07:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjAGSHr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 7 Jan 2023 13:07:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjAGSHp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Jan 2023 13:07:45 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E516A3592C
        for <platform-driver-x86@vger.kernel.org>; Sat,  7 Jan 2023 10:07:44 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5F094B8069F
        for <platform-driver-x86@vger.kernel.org>; Sat,  7 Jan 2023 18:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16300C4332C
        for <platform-driver-x86@vger.kernel.org>; Sat,  7 Jan 2023 18:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673114862;
        bh=799xVyrOH1UVwkahSBGUCIdGP1khukf+RRt+G7cLzwE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cSnHHG/K53tR9Zwimcm+SlRwCuC6IClrDNY7XAkp5xXCoVKcoHG3j3T+MWgXz4JV8
         AnsTpK0vUcVT8+2gZYjgZxxI61SnBJdjtUxS2UxwqE/Qx7HeFGEQvMvbM7IbI3eSUG
         thmZz2Aw4lpC9uGfG71EY73cTNxTrMjRt3RPMXXRxPyyosUzJZRb0aCYjbmI7yehe2
         R6jIUuZEIZw03neQv2nck9FaoglHA8O9wBq7XbEAeANXwgPeWB6y/o8y2J+X8rwBKE
         a/QvIo8nmZpV1NaWCUz059iQ+TfMaS6vo60Kb7fw+y8p7W+rteVIMt4hl54txbRWRY
         O8QDj6Nj+JDtw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 077F3C43143; Sat,  7 Jan 2023 18:07:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 07 Jan 2023 18:07:39 +0000
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
Message-ID: <bug-204807-215701-LH6eQ89aWV@https.bugzilla.kernel.org/>
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
 Attachment #303466|0                           |1
        is obsolete|                            |

--- Comment #281 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303548
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303548&action=3Dedit
Asus WMI for nct6775 v6.1 base (2023.01.07)

(In reply to Jeroen Beerstra from comment #280)
(In reply to Slawomir Stepien from comment #274)

Could you check with new patch? It contains updated Fan and Temperature sen=
sors
support.

https://patchwork.kernel.org/project/linux-hwmon/patch/20221228135744.28175=
2-1-linux@roeck-us.net/
https://patchwork.kernel.org/project/linux-hwmon/patch/20230102212857.5670-=
1-zev@bewilderbeest.net/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
