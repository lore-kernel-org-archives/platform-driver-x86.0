Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C763DC76195
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 14:36:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbjC0OgR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 10:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbjC0OgQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 10:36:16 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D111E8
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 07:36:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D08C2B81603
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94724C433D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679927769;
        bh=31ZGjix+wKvP79DCWKYFjVCKE/IAzl/vepwHpuLw1Kw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Z1w6HH6I5uC+iJ8EJqQQcnbw+xmAbl19pEHz/rDAo7tPtbM70sch3sAOJJN0YXfMO
         64FNiBMejDEVbA9RNeiGOpRtWeeEv2R/Cx19R8U5QIdJkRmhXtkmFjuRrEoRdyl6fS
         skcQ3PZX43vn+tN+lv8zpDPFM1s1NHNT8krQIPiWMIVAlwBJbmpEXmw+iMOHpNtbh+
         AR2U9qdptAIUndR1B1H8/wcPr/M1OIU774fHQXKDhqlINkGtxNOmAdjQ7avrfi+YSE
         YR5Ltrui8qqhLiXJKZeETRrAXxvgfADuY4FwFA8IpnSP/fdqt89/e2zvvJZB9w9PJ3
         QyahPRiT3dNpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 79429C43141; Mon, 27 Mar 2023 14:36:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 14:36:09 +0000
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
Message-ID: <bug-216824-215701-izviJqm8gU@https.bugzilla.kernel.org/>
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

--- Comment #21 from Andr=C3=A9 Barata (andretiagob@protonmail.com) ---
Should i create a pull request in here?

https://github.com/systemd/systemd/pull/25824

cheers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
