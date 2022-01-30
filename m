Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589D7C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 Jan 2022 18:02:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241652AbiA3SCQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 30 Jan 2022 13:02:16 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:46264 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240608AbiA3SCQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Jan 2022 13:02:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F0899612AF
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Jan 2022 18:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D6F6C34111
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Jan 2022 18:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1643565735;
        bh=fYp/CWmqLuPPjHt1LM9cYbtHLv0HeOk+msRq8/Cp6xo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J2gpqQmxP2HUwEGl7O6wd0qSwT5bW3TyTqMFeyb4lfsK0KMfy/YyBaomkti0rQ+zT
         o824plwhFiVnQz7KNlqnIwr6JU2bvv7qCGcRBXPkipiM3dcOxMgPelZe8kmB8np7h6
         DN8sL4HcWfLrazI7kCl+UJRBvpBXfX3pbM3mNCVaXZcCK2B/5aUMDCoWI+WyuF9ZI7
         /H5UXBdRccRjTC1lr+n2xJG4tQbfBVDeIVJ4eb2yHWA0p9qjB5KgaW0qVBiuywx526
         ehmKUb3j0hNwfLHQ9XSi9uSKrqaDCloOPaJM6PcAGRs4z9YBHPsoWHRiOMQwvQo/qj
         uPm44j/kfv/yA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4E01FC05FD6; Sun, 30 Jan 2022 18:02:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 30 Jan 2022 18:02:13 +0000
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
Message-ID: <bug-204807-215701-NsYojLH0lw@https.bugzilla.kernel.org/>
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
 Attachment #300253|0                           |1
        is obsolete|                            |

--- Comment #212 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 300351
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300351&action=3Dedit
Asus WMI for nct6775 v5.16 base (2022.01.30)

Updated patch with X570-E and Z390-F/H/I.=20

Boards with possible support of i2c connection/mutex are moved to separate
section.=20

Also includes patches from
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/lo=
g/?h=3Dhwmon-next
and
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/lo=
g/?h=3Dhwmon-for-v5.17-rc2

(In reply to Jonathan Farrugia from comment #211)
> Any idea if or when this fix will make it into a Kernel release? As of
> 5.16.3 it's still not merged.

Patch with "Pro B550M-C" will be included to 5.18 release.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
