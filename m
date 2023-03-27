Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 239A7C76195
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 14:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbjC0OUw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 10:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbjC0OUg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 10:20:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F9F86BE
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 07:18:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 713F0B8109B
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37F82C433D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679926420;
        bh=sTe134vzghu+/CZghkFVfjhFHy6l/Q318x+HMHcZS3E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dmfj/xrG31HAddLmZ5Shp2AD6kFReGbvvSmP3Tx5z7lh71oiBgFeKntq4TU6fIjmM
         AY1SD5qy9cpB7UboxzXJlJ6aEBDIhy8SzeOZXOfE2JhvOrkuNbki816Amkk4MmSS1M
         8KCUarqmYv41LiKNv0mHnHAKcZS9AmHe2Yd0zH9oI85StLbiu+00hsoXvhtZv4k7Ty
         DK2dNmZDqhGO7+WEm8VOpP15tPBvm0mNFJwxTBuDQMNn8JYfBZLb8XapvUUeAL1MzO
         xe/nPClvnaouBZr5v/QiFjo9Xf7sYezHUqqoIbdyrwSGsFzpPg+Ojt9yYoefC1fnst
         dFTFh9/U8U3ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 167D6C43142; Mon, 27 Mar 2023 14:13:40 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 14:13:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andretiagob@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-XVMyGL2cyv@https.bugzilla.kernel.org/>
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

--- Comment #20 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
(In reply to Hans de Goede from comment #19)
> Ugh, I got it wrong, the new line should be:
>=20
>  KEYBOARD_KEY_76=3Df21
>=20
> please give that a try I expect it will fix things.

Yep it's working now!

:)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
