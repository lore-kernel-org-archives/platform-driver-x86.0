Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B097C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Jun 2022 20:27:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344717AbiFOU1J (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Jun 2022 16:27:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344979AbiFOU1I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jun 2022 16:27:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F260527CF
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 13:27:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9AC24B82173
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 20:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45E52C3411A
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655324823;
        bh=Sx4OmX3kd7pKbxcLB/ls62VcLbsGXPUy11FiEcvJXbI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R7hXYJ/hXiNev9chpr+k3pdHZzEUqk5BbyetBk6GW3eylixP4gXn3wJnjreW/7LUd
         mgO5wecDXTopUo6RRH6nWa0zqs1yGWl3blOmB4ye/HR2wkrd2nQbZDNk2FxyPlRyxH
         RZgUaLIoUXmMB1p64u0SpkUq/Tzgr+8SivTMzG+MiSnsPhNcnROz9c5q2UHvofmSNA
         qp4p6u7dCyY2b3MZEFq8uEGzHPNtNLSU9wwkQ1rs0VBabFEqncV9ucaSJ64Td1QOSw
         wjdl7x5XA77eAg44x9uXfkzgx+W8BhfEIbX1+iC25Bk1FEfl4LG/OgAhYTNQgg8FD/
         mKj/VcQyA/bOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2DB8AC05FD2; Wed, 15 Jun 2022 20:27:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Wed, 15 Jun 2022 20:27:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-MVc6jYAUEq@https.bugzilla.kernel.org/>
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

--- Comment #41 from Johannes Pen=C3=9Fel (johannes.penssel@gmail.com) ---
I'm happy to report that on my end, there are still zero issues and working
brightness keys with the latest patch set.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
