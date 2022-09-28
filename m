Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A35F5C04A95
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Sep 2022 17:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233426AbiI1RGf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Sep 2022 13:06:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234000AbiI1RGe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2022 13:06:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 185EDDED6E
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 10:06:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B779DB8217F
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 17:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5681EC43470
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 17:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664384790;
        bh=o3APXcpHFMGp5M4MWUIw1JzcCurByy2WTgviZ0JBoW8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IZiwpWHsG7h8MGU/nQeVQThkFY2DN63P2OSCLkYe1mhFF//bUNZLSY7jQ0dM25K/P
         4+VhD3IuT8vEipVbNmBOMve6i+byJhoJWCP280OeT41jUPBGNf8uVuwNp78N8HmD6a
         H1vfwyMYuKe/yTmvIOL1F+B8y2971kIYbvk5a6/iOqIdXWOtMs3nSx/aLfWCTdPfCE
         2BdXUzwvVvT0RK2BnH1C7KDtfppB8Hr3YkAEXNGZU+71SlswBfXyBYJcSh/dLpQH9X
         2ElSb30yq0JniVeSgTYfuEfPhlAE6IsNO5MOu8hSb8u+OkuHm05V0eJkkmh7nnLTV9
         RvaOFkuos1w9g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 30E7FC433E4; Wed, 28 Sep 2022 17:06:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Wed, 28 Sep 2022 17:06:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-0m4WzuAokV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

--- Comment #23 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
All of these events are so intermingled, we need to decouple and characteri=
ze
log events to understand which are issues we're hitting or not.

From what you've described there is at a minimum a firmware bug causing a
spurious IRQ1.  I suspect this when paired with any other number of wakeup
events is causing either a system wakeup or not getting into the deepest st=
ate.

So your "disabling keyboard wakeup" is probably a good idea until HP can fix
that firmware bug.

I also hypothesize my patch will help battery life when there are these typ=
es
of spurious events but I don't really know for sure.

So with the same debugging lines I suggested in comment #12 and my patches
suggested we need you to issue a suspend and keep track of what you did whe=
n so
we can correlate it to the events shown.

>   sleep 10; systemctl start suspend.target
> just before closing the lid.

That sounds good to me.  Then we'll know if the EC had spurious events that
woke the system and whether it went back to deepest state and how long.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
