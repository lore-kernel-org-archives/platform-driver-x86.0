Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA07C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Mar 2022 11:23:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348133AbiCXLZ0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Mar 2022 07:25:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347752AbiCXLZW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Mar 2022 07:25:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DF73ED1E
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 04:23:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A8603B8233B
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 11:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4CE8EC34119
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Mar 2022 11:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648121027;
        bh=T2EQSy0/li0c5niJJINxohmogeTCVNC1gjnTTJY0sEw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XlPv1M0+ipUxMWm5JzZcd7KqKGqzYu634YXT7x9ZGZnZgpBF0nOwUwyBrwfOmWg4o
         Xny4GhqSHR7GIS/17h7nOL8jlTaj7YHQde8ksG0VJT7D+yxc+x0eGkkg/Ivawc2eR2
         AdPwJuUhtzqql10ImtDWZXNm2DvmTY8ByK6q5Ze/olp6tr2E1H1JLEOYZYmJPETXVE
         lSMjb3+Kz4RfDSJNiIVClHaMCu1SsLmwHK2JlvOvpoX2CvSnqE2tJ374FXBIMYBdaG
         GvxqEDAJcKi4p9pRQSlNzAYDlRigb70q4888ApYVTF/Eynj4zkbMXZaPdnfXTHx254
         9Sd9DreqdjlnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3C59DCAC6E2; Thu, 24 Mar 2022 11:23:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 24 Mar 2022 11:23:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: hubert.banas@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-sdPRI1tVin@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #229 from Hubert Banas (hubert.banas@gmail.com) ---
Would it be possible to get these new motherboard in during Linux 5.18 merge
window?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
