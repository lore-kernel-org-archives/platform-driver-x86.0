Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FFAC6FD1D
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 14:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbjC0Olg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 10:41:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232235AbjC0Olf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 10:41:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6B226A5
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 07:41:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1AF40612B1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:41:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FA83C433D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679928090;
        bh=Lbm2+UcqS44SlOtLqRd0ofm3mL16YmQb2QUxsOQWJlk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G66Sv/Rt62PNMeVxmLe+lsevSEC5NtxQT8oRWneuiKbIHZF0qOJ2vRuYuUkt2PmuG
         c3v2F/0TQXGA/18YjNVRUQR93ufJXni4claD9lnafCbgzT2+vY7qujkp+/2C59Zaon
         pCezF1zN4lI74SkUDgG593HYy16PGdUkklz6LdADnjb+PDtEO4Ffwi0UsyD+dR+Lcm
         Mf2jvNRO7L0RvDGdyuF/BSZO8Lu3kz1/iGwJ2nZymVZgb4o/9GYrsIeDbN5r/sgzX5
         LNfi8SdPz+Tj91WYKJLgUrzVKEuGDIEaz7kmni7x11ue4fSqhB4BKHooNX1xgBnKg9
         KMlD01nCJ/bQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6EEA7C43142; Mon, 27 Mar 2023 14:41:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 14:41:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216824-215701-m2EpdVRenc@https.bugzilla.kernel.org/>
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

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
