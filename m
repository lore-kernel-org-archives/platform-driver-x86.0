Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD5BC77B73
	for <platform-driver-x86@archiver.kernel.org>; Sat,  6 May 2023 07:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjEFHFX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 6 May 2023 03:05:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbjEFHFW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 6 May 2023 03:05:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 170291154B
        for <platform-driver-x86@vger.kernel.org>; Sat,  6 May 2023 00:05:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A310961831
        for <platform-driver-x86@vger.kernel.org>; Sat,  6 May 2023 07:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D108C433AC
        for <platform-driver-x86@vger.kernel.org>; Sat,  6 May 2023 07:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683356721;
        bh=tZIOkp8rEB0T0Xo6icAVGHSwHVgF8y06pH2+tXNcCoE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=odw8fP9aoS25PER3ftHVPxmCYFEkzPiU1fRyjG3J7bty1foLmEk362VV6R/rx7sQU
         CIDRZpi6FTN9BKE7MFp1catHktQCkhLKQSKBuN+ePQgpf7L0u+yDf+sa8zgcbMQ/tK
         5lUIQZidXyG5vsaueWFryiZe9mPSbf6DnBbXLzsVSWbf9dWSxHOEdFrJYilq6/806u
         TQteFac3Ocp6xMjMFkk7+i6YwjQzY9sbGeYcLTNcknhgfzQh7s5DmTA958lowkp3vL
         2BYkvK/ZqHDGxieW7zQjd2fxr5YG446yqpvH7TTrVYtOwrlSTswKsDpB7RUjn39IQr
         cSNKD9dNquDDA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F1D9CC43144; Sat,  6 May 2023 07:05:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 06 May 2023 07:05:18 +0000
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
Message-ID: <bug-204807-215701-wUQMeZigIJ@https.bugzilla.kernel.org/>
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
 Attachment #304087|0                           |1
        is obsolete|                            |

--- Comment #327 from Denis Pauk (pauk.denis@gmail.com) ---
Created attachment 304223
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304223&action=3Dedit
Asus WMI for nct6775 v6.3 base (2023.05.06)

Rebased over v6.3, List of supported boards are same as previous.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
