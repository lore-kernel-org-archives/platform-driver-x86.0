Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172A6C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Nov 2023 12:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbjKNMsT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Nov 2023 07:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjKNMsT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Nov 2023 07:48:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DF0D188
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 04:48:16 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08365C433C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Nov 2023 12:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699966096;
        bh=Y/VBvtN2JeOrqxNSjCR0BSmVJPtnfbNzvBs+DlvJBqc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HmF1Zp1j6PfZzY88LAtv1jDcNaPCHg1im4rqCz1fodCbrPkA8oMKT8jzZrVnpurql
         L787dW4PKtr79dFUgFQ5Sh0UDNoy++rTN3HUlW3TpIcxtZjB5TlZLAE551TO9C1hPd
         txGnbvykvUpJMTfd9U5cbEYvzSzMzpdd0ucE2arY/gTpXiH6psY04Uplx4niaKfah/
         mpc1VlFiFU0iHtr4pH1tME5/DW4d9cLpQ2Lp5J6sls9aj+bIfmcC2VHIaqNksofzKi
         4DLfEp4OQyg8s0evdxdwbw2U7FoWqx2+GInfh7AX9bdVAwIqfi5MptJDMQtFBBOy5L
         1Oxd1ZuoTwLww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EA295C4332E; Tue, 14 Nov 2023 12:48:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218143] platform/x86/intel/pmc: regression found in commit
 804951203aa541ad6720c9726c173d18aeb3ab6b
Date:   Tue, 14 Nov 2023 12:48:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to product
Message-ID: <bug-218143-215701-Hsh69GHMdb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218143-215701@https.bugzilla.kernel.org/>
References: <bug-218143-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218143

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g
          Component|Other                       |Platform_x86
           Assignee|rjw@rjwysocki.net           |drivers_platform_x86@kernel
                   |                            |-bugs.osdl.org
            Product|Power Management            |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
