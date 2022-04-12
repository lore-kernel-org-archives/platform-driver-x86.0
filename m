Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0246C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 12 Apr 2022 18:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbiDLSrz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 12 Apr 2022 14:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbiDLSry (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Apr 2022 14:47:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A66DD593A4
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 11:45:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 43B3061B48
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 18:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D596C385A1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649789135;
        bh=O2LPeIZlBtWJXzisrGOGyqo+iiivFpLINVqbvA00bTM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oNho/v8QbIZzBVqz9KWtrEpV4YD0vgRirPr/B4ZgDSmdf+p6pj/kW2ghK+0BtFEF3
         +RoCwtz28unuul/nf3dplJ2W9uOFI/zPJOMD0MrQN9Zg4wOaCQ63zZ7NBgWuUsIOtt
         4eEQPrfP9rL4wd7oCh4jHTxrrH7moGxkA3TYxW2K8zkuL1jOL1MyqhtiOPhm1VyT5v
         1DthnviD4+WATg/425BWHNFlRPP8ZSfXDnxRkx6WvxHnRitBlhoetr8yDuedEHD33x
         6QtbAUJSWjehkwItoV7jpkLej6fSY4jR4avWx3WB7tMDknixdgGzY8i2dWmhu0Uj/F
         rFZ4hI25SCfnw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7C446C05FD2; Tue, 12 Apr 2022 18:45:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Tue, 12 Apr 2022 18:45:35 +0000
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
Message-ID: <bug-214899-215701-nbEv3X5KHL@https.bugzilla.kernel.org/>
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

--- Comment #20 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
So I just hit a similar problem on another laptop what helped there (it got=
 the
keys to send events on the "AT Translated Set 2 keyboard" device) is adding
i8042.dritek=3DY to the kernel commandline.

I think doing this is worth a try on your ideapad too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
