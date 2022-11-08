Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7463CC4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Nov 2022 18:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbiKHSgG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Nov 2022 13:36:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbiKHSgF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Nov 2022 13:36:05 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98EF22CC9C
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Nov 2022 10:36:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 362A161735
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Nov 2022 18:36:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 909EDC433D6
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Nov 2022 18:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667932560;
        bh=lKUtou5JUcOraiv+blcV/1dh7jCx7l937yXyGoPQk8U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ConZxPOZd5xy+DuhJpm8d/O9yDuL1gOdyBZxb8+0ery7gLfSX8mLSiiDDrOzBVGAR
         1v1RqIM4mh9sn0T4MoAnPoM4g8pyhIxzseqMvGCl+qCdcxoVD+WpvUN+15Z3/ETzui
         q0h2pWRpySaHQLGn7boo+HOy98Ha4oPahDeTHDHKH6RkpBhOP3ghBVRdmfy7oZI2Gc
         UYb5EUy21fA6pLJt/quPpqKwQukPv5ctp+SvXrnOUxYHfv2rFmv9/yjdFrfnYi6IXj
         WGHPpa+FqK32pZgg9/2y7y0KVTffx/F5EKNmUaGDt/X2WwZ2aqvd5hBGEnNsyZqJZB
         /+n5MQqKk2tBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 72DD5C433E4; Tue,  8 Nov 2022 18:36:00 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216647] first hibernate to disk fails on HP EliteBook 845 G8
Date:   Tue, 08 Nov 2022 18:36:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216647-215701-qNXZlWb6XI@https.bugzilla.kernel.org/>
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

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
OK 6.0.7 +
https://cgit.freedesktop.org/drm/drm-misc/commit/?h=3Ddrm-misc-fixes&id=3De=
0b26b9482461e9528552f54fa662c2269f75b3f
please.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
