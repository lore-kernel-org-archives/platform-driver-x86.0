Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33029C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233744AbiDYT3W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 15:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbiDYT3V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 15:29:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7DB70933
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 12:26:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 897FCB81A3C
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 19:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E01BC385A9
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650914774;
        bh=a78p1/+Ixid37eVL5e3BTUA+3CudR5pUs/0F+hEgEaE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SzDHrWrEup9p6y0DMThHyntJ6ElE3Zw7YI+qgvlTYW8X7xgXSqste+viTdOBD0eAr
         t5FRZKP6WaSOW0dQ7CZkbaKZBGQLSs4cKfUzSPn8yvkHrSraf+NnAX9epRb/0R0iYp
         mNf+JgYz061IAFGUQ3KAeHQd8GBPRi6yTJD1DiQJIdjC42U3atH0jGieTX1J0imDKg
         /V7F0eZ8qyCv+arvFgmIxTF2nsH0AvFI71JvDetP/8qST4b7trW+170jDV6+ZxRSY8
         LLC26L4V8e6wZqVT0oFaEYrtJx3/qpPR05dL+174gi+ZEhkA2JEKeWKfXTBCiKhbqt
         rFQV4sUj2Zhig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1C20DC05FD0; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215883] Unable to resume from suspend with module
 `intel_lpss_pci` enabled
Date:   Mon, 25 Apr 2022 19:26:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: taigi100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215883-215701-mfsltmrVD9@https.bugzilla.kernel.org/>
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

--- Comment #4 from taigi100@gmail.com ---
also what file system are you using?
-> No clue, default?

 =EE=82=B0 cat /sys/power/resume=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
0:0
 =EE=82=B0 cat /sys/power/resume_offset=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20
0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
