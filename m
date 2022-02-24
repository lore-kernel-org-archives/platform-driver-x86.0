Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAA1C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 06:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiBXGXV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 01:23:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiBXGXV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 01:23:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80821165C19
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 22:22:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 02022B82486
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 06:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACAFFC340EC
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645683769;
        bh=Ph5f4gYQKwFWAD32wccr4lwqcvYaZkHzOU7ctXM83B8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DwTVS5118t8itBkBonwLemwwMrZp+ziKd0ZSjMdFfpcG6pEdcFr/ks7Gop/sZxFSB
         mBT6MGxkk+pdZY8SmXyqIOGaFjF1B68jDds5p137oion6zHy2Fws/PgwBYH5YYKvQd
         HxScxNJ3es8ReC1NGf3EuK38L/t8hsqwVpPlrrv65G++mmgMDK83CZDHO0phKNTBb/
         y5f9DN2Gs+Qo+x9Jb6uNQz9UUZ8jEXk/KH+dWi1CjUk3ukn4PDNi9rgQEXR5vxbcZA
         ODm3iW/xsnMKm4LOM3hreAO0VZ+TP+NgeJ6xU06YZCtN6MHGl/C9boB9c1BtIW/B5N
         yl9BD+8PisBYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 954FBC05FD0; Thu, 24 Feb 2022 06:22:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Thu, 24 Feb 2022 06:22:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rodomar705@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-854xZUXF30@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

--- Comment #68 from Marco (rodomar705@protonmail.com) ---
(In reply to Alex Deucher from comment #67)
> Support for newer platforms was added last year:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/
> ?id=3D0aad9c95eb9a2b086322e28ae2e58ad25598604e

As said above, this is correct. The issue is that the LID sensor coming from
the SFH (the way that Windows tell if the system has switched into tablet m=
ode,
verified by myself after disabling the driver and losing that functionality=
) is
still missing, and the older driver forked above had added support recently.
Unfortunately that driver doesn't support Ryzen APU platforms after 3000
series.

Both options for me aren't unfortunately usable, and I still hope that some=
one
from AMD will fix this issue.

Marco.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
