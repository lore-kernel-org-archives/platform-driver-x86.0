Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225BEC43217
	for <platform-driver-x86@archiver.kernel.org>; Thu,  1 Dec 2022 12:18:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiLAMSv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 1 Dec 2022 07:18:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiLAMSs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Dec 2022 07:18:48 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F08DA85FE
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 04:18:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DE3F2B81F10
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 12:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89246C433C1
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Dec 2022 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669897121;
        bh=esU1os2WPzUyG4/my6wRAhER8OHbadcRPI/QPBEXh1E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aMdVuYNZG8wNgUrqJ58bMBJvheJHf3Y10T3FAEw7xqhKUoRShPNKbs7xHtqrE/l0F
         9vNAKomf7m+WfBnnmbPf4L5rZ0wMFN0IkO1aIu8ulQzG9iUxNjyEWENvMvutyolp9G
         kAaDA7BdcrPqycsPe5JsZjv9mPP7hB8TY1y5boT+WuKkjl0PEoysVOF8ZE/XA36arv
         kIQ30vhae8qA3PjZBz/BJXNgiW8iENxYtm1L1RhnUpsutamdY70TBHNDTd8C2kDitc
         nckh6oCIVsnmlko2Win2tMBeNESTTFcnnxMscUPIJRi6Oig/7w7DkxcpXcI6Gv9bER
         G71/b+25TWm2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 36F83C433E4; Thu,  1 Dec 2022 12:18:41 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Thu, 01 Dec 2022 12:18:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-211741-215701-P7f2p3ixwY@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REJECTED                    |REOPENED
         Resolution|INSUFFICIENT_DATA           |---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
