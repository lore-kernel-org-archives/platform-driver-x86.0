Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A65C43334
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 18:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiGIS0e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 14:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGIS0d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 14:26:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB3D1183F
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 11:26:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 09CE460F9F
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 18:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55733C3411C
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 18:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657391191;
        bh=1cA+iFTa7wpGZonVB15eZFZK2p/n9ier/MW3hj3TKkQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HZ9skvM8L7z2EY+6qMdJXwJ+Yuj7eus/ex4JFaKwYeHXRsaseAKdqcIisPGTMB4Y9
         B16HeSXZgrbwiY3N8saJ9f8GC1/LZfh3eHBKEfsgOU2ZkSaq5rOdLIm0ntM4ZLWSSV
         T26R+ISZHouKonvJKV8B5110aOf5yScyP1RacEaFXZcx70nvM+7IM8BvxqiHigJK++
         fUcJmGlSEWoytKhWoO8PgdI1IEWM8ebl3o3YnPuQo0w1krqtB6b1F+IFbtYuEPyfPX
         ZDxWVNBFYZJwFFZFF6SK9IRK3WWSUeg6oXzAYcfnF5griCjbYwx//ktJY+vHYQTIrJ
         S+prdOKNtVu5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3958FC05FD6; Sat,  9 Jul 2022 18:26:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Sat, 09 Jul 2022 18:26:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-216230-215701-VWwShhKVby@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

madcatx@atlas.cz changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.18.10                     |5.18.9

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
