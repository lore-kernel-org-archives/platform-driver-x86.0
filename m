Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356FFC4321E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Dec 2022 02:12:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbiLACL6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Nov 2022 21:11:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbiLACL5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Nov 2022 21:11:57 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E8754465
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 18:11:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4DD7B61E09
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 02:11:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74BD9C433D6
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 02:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669860715;
        bh=kVddjF6E9S2a/vuRP/0fSmunydhbJQYB8uzmSWPSz7s=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=avLuFdn4+xTFYURTPBPgg0HXtRZSuMUY4LAYkuERdv8eKjFMk8n1kdqFT4pr5OZ6G
         1HqUJkbZOyTMy1fSn8/tkszk6KV4Jw3cw6t5ugM65UKAddpR/dqzp0LH0bsRcNNfZO
         xfqBfyIsSKDTb10Izak9YRgZdR4LpxqcXrrQ+YEcip87b+dIXMJfv+PTnvR2MUMbt6
         Vo8OFlAE6YfZJebobLUx3jRuEt1enU8MFRVRfIbWhqJoCOLo9UfYfNldFcAleM37dn
         xWWFH/0fKWuMQskr3PW2EbTQW2+u1e+iCaZCV26NXqBZMkgr3DS/fRjXuPXd0btc10
         jhvzrrk+kZ+5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 649F5C433E6; Thu,  1 Dec 2022 02:11:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Thu, 01 Dec 2022 02:11:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REJECTED
X-Bugzilla-Resolution: INSUFFICIENT_DATA
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211741-215701-kHXy6BDZeS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

--- Comment #8 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Okay, I'll close this then, thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
