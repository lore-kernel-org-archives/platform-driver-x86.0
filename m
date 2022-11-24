Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D576C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Nov 2022 11:49:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiKXLtv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Nov 2022 06:49:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiKXLtr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Nov 2022 06:49:47 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C697BBDFB
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 03:49:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 12E4EB82778
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 11:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC19CC433C1
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Nov 2022 11:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669290578;
        bh=A2UZX6XNG7m4ShfcIejMuA0YWdgWK9mkvwLgRDvv7sU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dd+2z+QC96vrowX5nQOJnVZ684F/cogHxWnvck9s/st/9WPHu4X6dqGMgc5+626WN
         nMCjZ/qC1XtGWt+y4fuUBT8ENmhb97yySDwitwiw+3hzCWyW98lL50T8VVihPP9fdu
         xFwijwgbnT4HY27Y8UU+yGp9ihUY0fFaEY7ns2X2agYQAz3mw8KclzsLhVizSSCnpr
         iZdDX83Fn8kyh7spMkq+54ZPitIkRWIlpLCR8FYoYJMN4f95IKtSvX2l94NzUdbBME
         3BQQRLp68rU+rJzyJ406R+7qW/FltpWDvaia040/RiiYwZUwn9WiNYmy4AxRpmfoCu
         7I2KaQUzPXmNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8FB31C433E6; Thu, 24 Nov 2022 11:49:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Thu, 24 Nov 2022 11:49:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211741-215701-bjB9ANSSsB@https.bugzilla.kernel.org/>
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

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g

--- Comment #5 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Add Hans to the Cc list, he made a lot of work on different laptops to make
SW_TABLET_MODE working.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
