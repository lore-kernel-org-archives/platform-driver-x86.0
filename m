Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE4DC25B67
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Oct 2023 17:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345228AbjJZRVq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Oct 2023 13:21:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjJZRVp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Oct 2023 13:21:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14B11AA
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Oct 2023 10:21:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29EE0C433C8
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Oct 2023 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698340902;
        bh=lcUiU0+4xZH12WNunapcGsCOxSOcTnSZDwNRPLFOadA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=V+/2dDC435c9ABH/CqU36MVcP8fBVSw+3HAtovhsTWsFdmOfUjeUOR/sXrs2Iac+X
         k0wX09bddOMg9Re/dS0s4BFxHmQ/yxS0YD5nBBxAwc+LmAipFesUwpi1ec3lLpsnmV
         xFEZrWTMed+FBykZwXud8uKOOdYWc74dkYl+hPOD1vQs1X+WKGcSF3PrtweajdnRuC
         YOSaFPinPYIJ+/t5BEK+60JqwI157GvbTH3ZO6u0wOEbzhrTzLsgjHsdMU0LJNvTRf
         g5n+HBBKRVr41Vt1q2P20LbkN5waUtUpXDhdzrJWc4RcI+VBaMEyrizE2p4zYcxWKF
         tPVrHkL5sc1/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0895AC4332E; Thu, 26 Oct 2023 17:21:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Thu, 26 Oct 2023 17:21:41 +0000
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
Message-ID: <bug-217947-215701-rCDunHdONY@https.bugzilla.kernel.org/>
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

--- Comment #10 from Mark Pearson (mpearson-lenovo@squebb.ca) ---
Thanks for the ping - I had completely forgotten about this one.

I'll check on the status. My notes (internal ticket LO-2242) say we're wait=
ing
on the FW team for a fix, they did do one version but it didn't work. I've =
no
idea why it's taking so long.

Mark

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
