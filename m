Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50A3C4321E
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Dec 2022 01:06:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiLABGO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 30 Nov 2022 20:06:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbiLABGO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Nov 2022 20:06:14 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 731478DFD8
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Nov 2022 17:06:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 22CE3B81DA0
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 01:06:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1E1DC433D7
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 01:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669856770;
        bh=siBmMAfkwE5ABE9wjxjrTOMvDQPUvcU8tEqwJM0C9L8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UCI6TFOt6Pvx0cBahrtYcHYN/lRj/9voxA2BOAJd1qSBniObQCmqRu0s43q9LIGYn
         1Yg+PIq4eGk0LOr4vB19cMeVOhLNbpRg0YxOsj43LAhl0Vkw9wKQQlhrzWO1sYOQCr
         gPJ9GnxUQZj5aH04dYqorEinsOlu10NnCHza3DrDcfoMJY2RUjWYqVVDzAZ+XZ9Wwz
         F6Y1i4b4Er2IncBbTAAFzDoHGBSa9XwudgPCDBYQa+bQmq0kUYFUQtlQbsqELUEEVj
         JrkJ7u6LTR9Unoon1UTS7kcTPsjjtKGrKiImXn63kQlCWmA8R1P8X95j7+U1GnG/hF
         PaFZjfAfWJjEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CA0A0C433E4; Thu,  1 Dec 2022 01:06:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Thu, 01 Dec 2022 01:06:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211741-215701-2fMwS3qoZP@https.bugzilla.kernel.org/>
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

--- Comment #7 from Luya Tshimbalanga (luya@fedoraproject.org) ---
Unfortunately, I have no longer a HP Envy x360 for testing anymore. It is
replaced by a Dell Inspiron 14 7425 2-in-1 Ryzen 7 5825U.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
