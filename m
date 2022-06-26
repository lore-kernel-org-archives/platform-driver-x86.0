Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A311C43334
	for <platform-driver-x86@archiver.kernel.org>; Sun, 26 Jun 2022 19:44:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230413AbiFZToj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 26 Jun 2022 15:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiFZToj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jun 2022 15:44:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71781E6
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 12:44:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1569160EC1
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 19:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73F11C34114
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 19:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656272677;
        bh=JXlkaXgUmYlSbWrUr6Xe6+LsPNkTfO9TaxjPhdB/G60=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DAHOyCvrtTHHSaV8/pn3nt4pIB7NsYBkyg+qQqfvALINNzs6ZwfQTAU2TMnoosj+y
         VmWhs7JXcsX08crir+0WSnWRZQYZUU1q+BulvdYOyOUZ4jDFwDrZvzlkIzY/nbmQcu
         J4/UBaZZrfB8vlYb1TTNhTHud/7qTLZkfW76NP0czDM5ziUh2cA5tHpCLz97EttAoA
         Vg2P44lYAjMICZJqy606sJNeP19mzVf1vU3zeV8Hjm1nSpwEO6nW0mNX5rKiERX2VG
         ClAkAq34WBDA1zOhM+t8YFTIx6QfprODeV21WddOL2e/4+ZjHvFiEV4yUiGR5umvGP
         3Ohb4LAP7DIbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5581CC05FD2; Sun, 26 Jun 2022 19:44:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date:   Sun, 26 Jun 2022 19:44:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tinozzo123@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216176-215701-jsSZteVhcA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

--- Comment #2 from tinozzo123@tutanota.com ---
There are multiple of them.
https://wiki.archlinux.org/title/Lenovo_IdeaPad_5_14are05#Rapid_Charge
https://wiki.archlinux.org/title/Lenovo_IdeaPad_5_15are05#Rapid_Charge
https://wiki.archlinux.org/title/Lenovo_IdeaPad_Flex_5_14alc05#Rapid_Charge

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
