Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C29DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  8 Jul 2022 10:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237649AbiGHK7f (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 8 Jul 2022 06:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237642AbiGHK7e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 06:59:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3809C88F07
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 03:59:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E21B3B80189
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 10:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A18C5C341C7
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657277971;
        bh=5DcOw5DH2/mpo/bNpwgx1sdgDkoSb2PpRlurF8lIFJs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mVGrm37psUMnH2987hRbqML18l2tzoOuHNTVKz5RoUnQiNvtCwmLTfjr1Yvrtq5Ts
         IlK9pBng+qGW9clpkUXtZ/5LodP/e3E8p0njV4pFug/YwBuUCB+qHlQL9gubvoGHXJ
         XSJYb3gt9RstZ4gJ7jmeqCjWw8Mgiq8AV9eiL40ckAPh3ooigkApS2KAKFIDpTQXLE
         smqqnPWFfR7J+2Uwv7cKot/H13BmOz//kRqgWu0kabq6QXZZAsObPuQZIfflh7knWw
         fEnUWDvp/+T8YOk70cOU4uk8DTU3u+FIRPFrdjaOJ5u2DTGYEHR2qZXApeIIqTZzn2
         IHCTL/M8rBJ4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 82D1CC05FD2; Fri,  8 Jul 2022 10:59:31 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Fri, 08 Jul 2022 10:59:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blur.3rd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215993-215701-9L1HRzhyzr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

--- Comment #6 from Supasak Sutha (blur.3rd@gmail.com) ---
Now it's like this

[   21.037999] Serial bus multi instantiate pseudo device driver CSC3551:00:
error -2404: failed to allocate SPI device CSC3551:00 from ACPI: -2404
[   21.038102] Serial bus multi instantiate pseudo device driver: probe of
CSC3551:00 failed with error -2404

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
