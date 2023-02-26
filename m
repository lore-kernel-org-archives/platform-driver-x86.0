Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF2C8C64ED6
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Feb 2023 17:31:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjBZRbS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 26 Feb 2023 12:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjBZRbP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Feb 2023 12:31:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5699EDA
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2023 09:31:10 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B3B4260C5A
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2023 17:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DC2CC433A0
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2023 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677432669;
        bh=zdc5AnkPL8gL+ux8nsgn0aOztRMMHz96zBYSsc3TmT8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UZa0nQTENKaz7fXyON5l0UbXf5ztd0/1eV5rXG43Vwj8vZIa3vqdM+iCpIf+xfiPd
         EzVZBFQpdgSK7mUDqDn7SUcZ+DIefhnkriN6VryF33G8MZL7tJBanLcVLJU8h2IT/t
         OzZ/NmiDzanViK/qbaxDdrIoknw+5YvxaQG18z/C0XcfbUemP+R0oHWZqldR/6nUcw
         UZCyI184WuKMFtf+5za7FfVHve7g/1FB/ybTOSYT+nn4LayuaUJoA+zRAYZfA4p9K0
         Rp5sl6BMHLG+kjGFgTm1VC9Mbl6pTYorqorbXRpE562/8Liebcqe6w3Qgdw5NPwpNz
         1PiQTO9Cah8cQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 10AACC43144; Sun, 26 Feb 2023 17:31:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 26 Feb 2023 17:31:06 +0000
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
Message-ID: <bug-204807-215701-jEHnQzRMz3@https.bugzilla.kernel.org/>
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
 Attachment #303662|0                           |1
        is obsolete|                            |

--- Comment #300 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 303789
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303789&action=3Dedit
Asus WMI for nct6775 v6.2 base (2023.02.26)

* Rebased over v6.2
* Added more AMD A520 boards.
* Several boards use different mutex name, could be regression - code is
unchecked for now.

(In reply to A. M. from comment #299)
> hi all.
> I have added my mobo a week ago to the list. It works fine. Someone may a=
dd
> it to the whitelist.=20
>=20
> # cat /sys/class/dmi/id/board_name
>=20
> PRIME A520M-A II
>=20
> Thanks. a.

Could you please recheck with new patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
