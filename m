Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CA87C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Jun 2022 13:49:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236525AbiF0NtJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Jun 2022 09:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236584AbiF0NtI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 09:49:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A895BE7
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 06:49:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 10BAAB81707
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 13:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD127C341C8
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jun 2022 13:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656337743;
        bh=xwk2mjEZBeQIR3Z4HfI0Cv2K1gONmG+dERMR9/qITbI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PT5k6deCyFPX7MIfXeUOs4I5Sd7HRXueCF/siKPPdxBMizaQJDBFnPp0YcAAj2eAr
         qvyvhEPGI768T4jCU22EZbdiV67TMYA6TTtSqnhLG0RZarOkpaSZAYpr6lOPYdcMjD
         +8j+UuMmY6UaS6F5LVHrzSwT7XwfWkFr3CNl4gAZ6ZFelp0GpOcChQQNpqnJyAQaw/
         MmLSVbRZzcurxRIDNw3B3WZpRVT6zu6knKJ956BksOayuBy/zaGB2b/wWCUohBTAya
         O6UVtCW1udKjU2JkOiiV7OZjljaCzYGgFPPLkVrB02U1W2CXnNpf/0lFVkMHH8hNY0
         AWzD7nhINxFiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9EFB8CAC6E2; Mon, 27 Jun 2022 13:49:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date:   Mon, 27 Jun 2022 13:49:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pobrn@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216176-215701-1ntI9zu1g4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pobrn@protonmail.com

--- Comment #3 from Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) ---
I have a device that supports this (YOGA 520-14IKB), so I think I can prepa=
re a
patch until the next merge window. The biggest question - I think - is where
should this be exposed? Another attribute on the platform device, or maybe =
on
the battery power supply device somehow?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
