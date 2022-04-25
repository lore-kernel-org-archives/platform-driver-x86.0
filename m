Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9E4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 19:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234711AbiDYTYM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 15:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233060AbiDYTYL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 15:24:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1529910A6C7
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 12:21:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B2AC3B817A4
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 19:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F0A7C385A7
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 19:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650914463;
        bh=3lQ78W5uFEPre8nXM7IUkAsdE361gQRQbk/pI90OSAw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QWaygbHXWrC3E0gVz+t06hgmvQIa8vuU/xObvJIMsOGPoA7SwT8NUjydlnfNhDian
         GIdPmamVw2WQ8WhZav9PQoB9Ype5aBgUKDBH/xEU35xgcmuKgjbP75/v2Czwq06C0S
         TvjvM99Hba36B7j1wbdVo40HMb1xVLD9lXtprhUodERiLvafZETQQKYWHryp8GPY8k
         Q4n4UbrxCqjlYHtDH4Ewozkz0i5LodfkiZB6bg92JVZf+jWGKoAnJYD47CqCM18zQp
         gr3+IxHp9F1m59670r8Wc5t0b31L3kEMtka/Yo/dZU4gha7TLJBaA5Xv0M2rbox38x
         qAV9GhtuPeyyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2B08CC05FCE; Mon, 25 Apr 2022 19:21:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215883] Unable to resume from suspend with module
 `intel_lpss_pci` enabled
Date:   Mon, 25 Apr 2022 19:21:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: o@zgur.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215883-215701-dI7TqxKgWK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215883-215701@https.bugzilla.kernel.org/>
References: <bug-215883-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215883

--- Comment #3 from Ozgur Kara (o@zgur.org) ---
Hello,

okay I understand this is a known issue with Alder Lake type CPUs I think.
Could you please give the output of cat /sys/power/resume and cat
/sys/power/resume_offset output? also what file system are you using?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
