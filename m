Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9474C636D6
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Feb 2023 22:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjBQW5o (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Feb 2023 17:57:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjBQW5l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 17:57:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6C65FBEB
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 14:57:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DAFCCB82E8F
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 22:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F1D1C43334
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 22:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676674618;
        bh=rwI+5WMZrtCHsClDqX1cQ8gmZ1r02WkKUVUgKiu/VsI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pkbTrKO+ikVQN07Uq65ddvqf51uuh0rI5A2g4i2+MDvaqg0iUh5upaFVPk4b20TAo
         aUE4DAjHC3E9h3igQ1JvYtcGK4jRXffzEXDQRt7reqlSGptzTcua6UsqcyfAOFJnke
         tmMC86fVpgawGILjVLaBPYWxOZ0Q8ZUR+Zgg/44aEj4t7/orPdCM9n7KzlS8SIliod
         uR6oI5/hsZpOTJZGV77lu1a/4p68VhHmLyl9nZW5qLcxubx+Dvsf6TPps9+J9RlmgM
         9NIGo7fvJKLBwfOl0cfasF2YnMGh/Ap4lroKTzO26Qz/0xrnm/jZudG5H/kgLYg0T+
         J1Ues6VITe6zQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9024FC43144; Fri, 17 Feb 2023 22:56:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 17 Feb 2023 22:56:56 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-Huvvb164fj@https.bugzilla.kernel.org/>
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

--- Comment #298 from Denis Pauk (pauk.denis@gmail.com) ---
(In reply to P=C3=A4r Ekholm from comment #293)
> Is this stable on a 5.19 kernel? Having a TUF GAMING X570-PLUS board and
> hasn't tried the patch before. Now I was getting the Ubuntu HWE kernel 5.=
19
> for Jammy. Can I run lm-sensors and having the sensors running without
> trouble?

You board is supported by 5.19 kernel, and does not have any know issues. A=
pply
additional patch is not required for your board.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/hwmon/nct6775-platform.c?h=3Dv5.19#n1090

After initial merge code does not have any significant changes related to a=
sus
bioses support, just add new board to list of supported boards.

New kernel 6.3+ could have additional support of x670 boards. Merge window =
will
be in one or two weeks after that will be more information about exact list=
 of
supported boards by upstream kernel.

Look to
https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/tr=
ee/drivers/hwmon/nct6775-platform.c?h=3Dhwmon-next#n1115=20

Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
