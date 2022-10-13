Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BC5C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 13 Oct 2022 03:56:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbiJMD4W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 12 Oct 2022 23:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJMD4V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Oct 2022 23:56:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4785A1C417
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Oct 2022 20:56:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D70376165E
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 03:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B823C433D7
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 03:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665633380;
        bh=vsYjgsadluReXpcbAOGPs6ADWQExqRTD/D//C1cCinc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YSsU7MLzr8GBHhTfk+1mlAdzYRwmq7ikDPZ/COVo2PdXCnTvvscXTGQKNHjeIpyOs
         8dtcjGQsPt1LJ+Ex+yHv8mw9aABWf15qbdEBrMX+MQI0u5yXJ+r/IqRbMDeRmaXiKk
         2UpLDcxbaSzNWprnEXd+i8Vjhs/+Y3ydPkWxbH1nXJ6f87qFf2upRkyQjHXhCIlgwG
         4eOOJRYfl1lqXpYS2iH7fyOn/j5GQTzUPD+k1LL53ArxQDPtOqKrqzMVXPHXWN1SB1
         5G+XOtuShctmLBSRKXpU34l6zE6aZVGzleQP3DD0PrjjkmxhlN7LgEiHSmUUhIhHwF
         IPgSr5sTSKVRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 28A51C433E4; Thu, 13 Oct 2022 03:56:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216574] Hybrid System Suspend broken HP EliteBook 845 G8
 (a.k.a. Hybrid Sleep / s2both) (s2idle Notebook)
Date:   Thu, 13 Oct 2022 03:56:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216574-215701-qOpolFL1Hi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216574-215701@https.bugzilla.kernel.org/>
References: <bug-216574-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216574

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I've submitted it as
https://lore.kernel.org/linux-pm/20221013035017.5098-1-mario.limonciello@am=
d.com/T/#u
.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
