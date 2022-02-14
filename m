Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D19DEC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Feb 2022 21:17:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbiBNVRl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Feb 2022 16:17:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbiBNVRk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Feb 2022 16:17:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722291390E2
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 13:17:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 30091B816C2
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 21:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5836C340EE
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 21:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644873448;
        bh=81lHgp5yecCfKmDZWHL3YBY3gtjeaKx7KZekNMsSzFk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tugSOAVSkA5EY7nb4gSIE2qS1R+54A0MQ1U6KsoMTB58TdK/kPnx03aR5PMVr1/ex
         AGvwvSi58wMe8z+cy5MbTnGn3dx/doOlPe335RFcSwJgsGLuJH76Q5YTq7tuRqHpIn
         vCCd33YGZZlg5GmIfz3NMwXzagcb0iaqPJmXXvpaL2sNDrWBXMq57um0XiUlJZx8Wm
         THfaC45I4mpCrItG0doiLAH/5E2icFwKpdX+JOen43BeJNpWAW25vqakAi0rc2+C3W
         oqjVrPiiteU6Z8/8YTa9Uo5heGGkCnJBvsmXfjmB7YMiYd1ecb9T31ogpMEszQIrX0
         M/Dmk8T9VznUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B5D03C05FD0; Mon, 14 Feb 2022 21:17:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215531] Lenovo charge limit feature stops 1% short of the
 configured limit and says it's still charging
Date:   Mon, 14 Feb 2022 21:17:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nate@kde.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215531-215701-wdVl8AW8oS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215531-215701@https.bugzilla.kernel.org/>
References: <bug-215531-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215531

--- Comment #6 from Nate Graham (nate@kde.org) ---
We do use upower, but upower is currently affected by the aforementioned bug
that makes it not report that the battery is full when a charge threshold h=
as
been met, so we have code working around this until that gets fixed.

Once upower correctly reports "plugged in and fully charged" when the charge
level is at the limit and charging has stopped, we can remove that code.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
