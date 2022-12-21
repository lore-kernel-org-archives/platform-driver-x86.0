Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1A3C4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 12:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbiLUMvG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 07:51:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232067AbiLUMux (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 07:50:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EF3233A2
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 04:50:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 38358B81B86
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 12:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D462EC433EF
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 12:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671627035;
        bh=Kj2SLJRQr74ig2YQhRQxma6EVG9nP323sGqhTk9KiAQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cZ0PcUYtp0ZbhOiRh4DgaSiM5nMSY9p6TClnzUl66iuYmyOX5P7EZZ9eXIX3kNJac
         zfbWBstM31DAJJLxeOH3eYCHKmCvoTTRtCu7Lvm1k0rEqJgb54xtCM32ziZ472Su0B
         xXzaOCaJe28VEkdYd9EcpMXA1dnj+qm/uqKVdi+sekMiZOIrLHcMGo36TDaL5NOUOV
         Zx+H3hTDFCEDXuzaRVtTpX7rk0QeliSLE5hgzD5CQaFcVrZV/t8Fq/0Jgu2UEBCzOM
         wa1lgEA5FeWIdy0YF1qbqyqhe+Dc/RjHWkflNuxKxm3/7g4zmA8XVjzaiKv3i3aG4V
         Cx8GMaHz6oAAw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 749D4C43142; Wed, 21 Dec 2022 12:50:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 12:50:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-ML3zUtdnZr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216824-215701@https.bugzilla.kernel.org/>
References: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

--- Comment #8 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
Oh yes, turning the camera switch off the hotkey does nothing. I guess it
physicaly disconects the camera.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
