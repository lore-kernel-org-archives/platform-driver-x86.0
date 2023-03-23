Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B08C6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 23 Mar 2023 00:59:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjCWA7N (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 20:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjCWA7M (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 20:59:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B7F1BDF
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 17:59:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6B2FFB81EB1
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 00:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B019C433AE
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 00:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679533148;
        bh=DM0sSk0Q18bJFy9QpMEAP1uJaQkM+VYlKSIwmcruBvA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=g0zeZ9L8YUUbD/GYVbamYRXW7c4x6Nmuw8lw+GMA7pr3cNhfUih5Cgczn8+CMZJS6
         UxQDs4oNERRtIIqLyI9AEuA6KfVGJLNfxy5/mbYSSk4kHabATPuzdu5R1xtERu7st/
         8169FzVgZQ4Jnnqw/IECpH9TbJWCG4uqBwoczhuubLjMmVzOUdUCyX27IgREJSSqwI
         RMMbe2k/8b2fSqppPh6TSUcxOyFY6SLBmemUtb5Rpoi2uBR5d/wrGxpfH0uwAdeh7A
         QM221bzAQ9gAG0ne4CdfHrveL3t/D9UVfV1o25T7z5ikxhjSRJVT4h2zG5iyyH8I5s
         YZUG2MdekxLNw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EE63CC43141; Thu, 23 Mar 2023 00:59:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 23 Mar 2023 00:59:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bmilreu@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-VqFNszhUN5@https.bugzilla.kernel.org/>
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

bruno (bmilreu@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bmilreu@gmail.com

--- Comment #315 from bruno (bmilreu@gmail.com) ---
Created attachment 304004
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304004&action=3Dedit
acpidump -b for ROG STRIX Z690-E GAMING WIFI

acpidump -b for the ROG STRIX Z690-E GAMING WIFI

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
