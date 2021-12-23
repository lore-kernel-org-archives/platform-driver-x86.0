Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D976C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Dec 2021 08:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347257AbhLWI3j (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 23 Dec 2021 03:29:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347232AbhLWI3h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Dec 2021 03:29:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9C3C061401
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Dec 2021 00:29:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 65D74B81F8F
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Dec 2021 08:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F4B4C36AF6
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Dec 2021 08:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1640248174;
        bh=FgOuZiYGSP0JkM1jBJo8S6XMTUj0/Gw2KamLzBc5kbM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IXPYpbCmZnhpzX51PizFpyuYEZbEpYRZyWdk5RTVgqbXxDLjSYmlYov6TA52poTXR
         METmYcHzAQO1rOUcssV8e5K6xqoMJmQlAsQT0ngknNZB+kLPsEQ2bek7QEvoY8MRfW
         MV92Zgnwr7SX3KBSqoTzWin5FsZsq2ToTDkcQApuvKes1eAq4T+ZwBLhmQkkOBxvWJ
         oqJr3tAScNs4TJXyteSdvzDW4Ifkk/B8Rt1ALlwuXPUD9bmTjfbX8o6gO+e3ijlZ/j
         JVDgOY3BS4qg9baW1s6Ao7CC9tmQXnWjK/9RksDTlN0J6y25SWaa7SSDsAUC5adL8c
         LwCUI3lv041Rw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1040D60E98; Thu, 23 Dec 2021 08:29:34 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 23 Dec 2021 08:29:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: greg@krypto.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-FzWxQESdUx@https.bugzilla.kernel.org/>
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

Gregory P. Smith (greg@krypto.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |greg@krypto.org

--- Comment #202 from Gregory P. Smith (greg@krypto.org) ---
Created attachment 300125
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300125&action=3Dedit
ASUS Pro B550M-C/CSM acpidump -b dsdt.dat

The "Pro B550M-C" as mentioned in #c70 also appears to need to be in a list.

$ cat /sys/class/dmi/id/board_name=20
Pro B550M-C

https://www.asus.com/us/Motherboards-Components/Motherboards/CSM/Pro-B550M-=
C-CSM/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
