Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAA4C4708C
	for <platform-driver-x86@archiver.kernel.org>; Mon,  5 Dec 2022 22:30:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230235AbiLEWa6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 5 Dec 2022 17:30:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbiLEWa5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Dec 2022 17:30:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB99221A6
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 14:30:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9F317B8159B
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 22:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D9B6C433C1
        for <platform-driver-x86@vger.kernel.org>; Mon,  5 Dec 2022 22:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670279454;
        bh=a5DMqV+UMWfanWaUeegEEisjnunw30rjff0zdJptnn8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QZYFsHPXsl2RZGyPIwDh6QirLN44/GeaWzV3KIOkydiQ48OtVm5WymUPtwyWOm1w1
         1THBtqbmayJeyB/0Rid2Zu2Zg+0x5yA7q3nQ6A5noJ6K8OYrTgJwwacpSDLUnKy49V
         9jK2o0yWxsmrate2vvuDNL4zPfyLApr1nZRo9/jxssIcVSg5+Qw0Vw55TCoZlQ/Rcy
         BIIxHC1+prsyfVtYosqr4FlL4RJlXbfiANWv2MHjbKWc3LaCfoJAl1ka98eLkr1oY+
         Veqs/HlzH72Je5psZHm8yc9ex+mP98b3WbtQtm/RCc9MlR0NNzAWahZfUoY/RFzjB5
         m8hqhrZqQJOBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3CC5DC433E4; Mon,  5 Dec 2022 22:30:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] first hibernate to disk fails on HP EliteBook 845 G8
Date:   Mon, 05 Dec 2022 22:30:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Power Management
X-Bugzilla-Component: Hibernation/Suspend
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: rjw@rjwysocki.net
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-216647-215701-m76eNGaxlp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216647-215701@https.bugzilla.kernel.org/>
References: <bug-216647-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216647

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Platform_x86                |Hibernation/Suspend
           Assignee|drivers_platform_x86@kernel |rjw@rjwysocki.net
                   |-bugs.osdl.org              |
            Product|Drivers                     |Power Management

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
