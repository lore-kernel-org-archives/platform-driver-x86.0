Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25CDC4332F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 11:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbiLULip (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 06:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLULio (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 06:38:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9553A272D
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 03:38:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5145FB81AF5
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 11:38:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19A35C433D2
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671622721;
        bh=gEN58Bd7prBQDhX/B6GFG7K7Z23P64Yr6GUpGyb+fMU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=critICK8UNpcWn3HF1A8aLzdMPLajw6rTX9gwyLMn0EvEZp3haG+OS+D3y+J9eFPN
         eomRrc029qAm/CaQKu8wUJaVbej8Q32u9pWbSWAvAsnpjec253THumZ5LnhpVe5wEY
         R7BWvO860XL0glZENW8RQ9KvPIdamGyR/4zhZEqry3h5/dVxPCAHwXkYV49J9raacn
         WI/Frq0Jbl8qDzIlCtE0L5b8Ipg3XrjOGTR6U2OwOBmvrqB1i7wHc9WnBjXlYk+Rrr
         tDYuTyYKXzeyAz++FBcuPES9swl8v4DP5P0dXWviV3t0e6HxvIVVX6VAk+Ks77NW2Z
         pEV0FArdt7ifg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0988FC43141; Wed, 21 Dec 2022 11:38:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 11:38:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216824-215701-oGRhgioqsr@https.bugzilla.kernel.org/>
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

--- Comment #5 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 303443
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303443&action=3Dedit
60-keyboard.hwdb

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
