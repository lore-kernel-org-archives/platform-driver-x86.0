Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0652C19F28
	for <platform-driver-x86@archiver.kernel.org>; Sun, 31 Jul 2022 03:41:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbiGaDla (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 30 Jul 2022 23:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiGaDl3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Jul 2022 23:41:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEC213D7A
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Jul 2022 20:41:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 214DFB80A27
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 Jul 2022 03:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9B0FC433D6
        for <platform-driver-x86@vger.kernel.org>; Sun, 31 Jul 2022 03:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659238885;
        bh=orJEKMWf3nqROyitIJlA4oq6Q6+0eWt8Bm4K6pOerT8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cJHr/8Arf2JWFIwpwBp5lcPqnMtpem9/wbbR+8VEMYlNmDZaezFVi2vuCS0S1OTNn
         E2I7lgyHB7q44Yv2CsyjXwl14OVBgLjYFznCfClsJimMkOfxl0BrvP7CcOdUcNHco1
         9n/UwVUpvPN2wRZmgklYUkCgSempWRz5Y3oDzXB92L4ZrznHoXsVtNBs4j2oWMDyiP
         9Dh4RZDnVbxlkS9ee0FTyKaiJQd0E8O5UbTWYroJnnMB4dfy2/klAhhXSQ2vbsYkh7
         EQP8eEHhT0T19Qbq+x92nrnPzUULUG+p+/VTKy/utx+kKgZXOcyA5bPfcrnkzfo9Tp
         s2xCev8zB2+iA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A18BBC433E7; Sun, 31 Jul 2022 03:41:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Sun, 31 Jul 2022 03:41:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cristina223@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-TwQbz7tVpB@https.bugzilla.kernel.org/>
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

--- Comment #52 from cris223 (cristina223@gmail.com) ---
I've compiled the new ver 5.18.5 linux-xanmod-edge with the patches given by
Phillip's github
https://github.com/PJungkamp/yoga9-linux/tree/main/kernel-patches

on my github
https://github.com/322sirc/linux-xanmod-edge

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
