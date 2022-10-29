Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD8FC38A02
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 Oct 2022 02:48:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbiJ2CsN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 28 Oct 2022 22:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiJ2CsN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Oct 2022 22:48:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA9D6E895
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Oct 2022 19:48:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD86362B51
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Oct 2022 02:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33A6BC4347C
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Oct 2022 02:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667011691;
        bh=dSI+IFLepycfIeAUjBWU/hmldM8TiVXK/qS5zgA4rps=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=r5/mfLlhjFxuKgtNlwX1M59F9wviHxp2fm/pl8Nsll6cf+fpxp8hULQZA9KsbWvDY
         J7nrrLL4myq3sgiufJZJ3EnXVjBxbfvfffWDdWSnhGG3wbbUeNDFeKaZk/HxHCuKry
         0z6m1eubr2+5blL8hrCkGOfaV7lVGvUPWUb6kqdJ/dUd8Y2GoE1rUQxzKKf/1Bo3dJ
         8lt2eZsp1VetRqci4hN3GKwWi8/ZVYkV9EI3HzUrlmCaB+J3D7kdtyoM4bW9FE0oWt
         L/2KzSEWeKHW3eDM8SRXHKZAApA5ErtP6LBVhtM2scX1YTqdeSBrJTXuQNqbm+fA4B
         k6KYFav7bScew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2183FC433E4; Sat, 29 Oct 2022 02:48:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Sat, 29 Oct 2022 02:48:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gerald.b.nunn@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214899-215701-Tv92UcUvgZ@https.bugzilla.kernel.org/>
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

Gerald Nunn (gerald.b.nunn@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gerald.b.nunn@gmail.com

--- Comment #59 from Gerald Nunn (gerald.b.nunn@gmail.com) ---
Tested the patches on a Lenovo Slim 7 (i7-1260p) which is the updated versi=
on
of the Ideapad Slim 7 Pro and it works great. Using Arch with kernel 6.0.5

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
