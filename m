Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4C9C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu,  6 Oct 2022 07:38:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiJFHi1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 6 Oct 2022 03:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbiJFHi1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Oct 2022 03:38:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 394FB8E9AE
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Oct 2022 00:38:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E9F94B82017
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Oct 2022 07:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9881BC43140
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Oct 2022 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665041903;
        bh=+DhnTPSp8ZfIBDbjB3IK4w0TkAeNfEB8Lc0dGhaw3zg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PRHqMB0z7jvwmUwAGk5iBqXf8xEKyHwGtfLFddS0S8HEvG9hNkm4Bdp880qSTelNC
         sRxKAvkEnX8/WmHj48/oyj9C2s6RhsPLIJF9d5q3LIMZeOQ0ac5osBzn5UL8QwoZQs
         YOrPoEJ8TXz4DEiFnaCb3hprCAhN7/uOKbYyzyRqT5alZYgr6bvJN0qK0S24UyoOxI
         R6Kjlnj6zD+KxEEMMi2HMvNkwNsNi5y6QG6dKbl97yhUstomSb830+wIo1FeL5xrX8
         HaLNtW4wSCjEIYgRMk4mk6N490hslRlDsP4F1Z5LivayU/j1PVQ3XNI4KLLC84unpi
         bAb2tnuL0POjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 815D1C433E9; Thu,  6 Oct 2022 07:38:23 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Thu, 06 Oct 2022 07:38:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-4w72MaehsR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #58 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Johannes Pen=C3=9Fel from comment #57)
> On my machine, the new patch set is working flawlessly with Linux 6.0.

Great, thank you for testing!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
