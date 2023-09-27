Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C142E82CB2
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 17:09:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjI0RJa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Sep 2023 13:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjI0RJ3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 13:09:29 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D2895
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 10:09:27 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04853C433C9
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 17:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695834567;
        bh=YG3afLaqzfFBodVLhppSpR/cFQtHbMYeFkhM4929cAs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZIcArFVulqCBVYY+KJPkoE3y+XXJJ8LtadtvCNE0e+VLRbo5OfV+ad8E9wnLKDdEY
         nmAb9A9snMxTE9dJBVJsC8RN3LW3xQl7MGKQtNMkT4jGs70uMzC5uqOugrrfhoYp4b
         bR53HkpEXas9JI2ypSODtIUyLtaGDygaixRPVrgzFid3UtzgMzBB4e/Ysk1t0/zb/w
         ga/sVF4GPg+hhTTyBbGvZjUmEf4PEjQGBspC+PZ9nznivUXAWfgOQojSsDLODVrlej
         oLMVW34AIRTVuXoIXLtx3M/YIQvDWOEjyAnoLaGU4qgBxN6BZQtj/NWk0qhvm+uEqx
         ytv2wfGeO7MRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D87E3C4332E; Wed, 27 Sep 2023 17:09:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Wed, 27 Sep 2023 17:09:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpearson-lenovo@squebb.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217947-215701-p0NqmmR0jd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217947-215701@https.bugzilla.kernel.org/>
References: <bug-217947-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217947

--- Comment #7 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
OK - so (just to be sure) with those changes it is working correctly?
Mark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
