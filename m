Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D483C19F2A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Aug 2022 12:20:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbiHKMUN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Aug 2022 08:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235191AbiHKMTw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Aug 2022 08:19:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9E394115
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 05:19:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 494BB61314
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 12:19:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A397CC433C1
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 12:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660220390;
        bh=m4dYvv1xRJwiHGqFPKEMWanZI+qphe1ybROvUpdTyaw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=evi6FXuawtNkFr/CS45jtKlH9VSWu2MdYYw0WHUp5+fzREtBWqITGz7S4agym06Ry
         mODPjd7axFxcxyyjZVB13zHAl147cZ305etEMqq31X5+sGgNlBQD3MPLNEQ/hRpRgr
         apUHbgtd386gnkgrSE2aY4T2PYv0KqWr5+o7Fe4svq9H1WKu8JYo0nQyYRl/nMZ6wj
         FGP95MFDIGsd6nA4LFzHAKeP7H1EwSuA6sLw6080OaTx97QFhvbJDsm6jD7pgp2JU9
         UNwI2HFnXUp/REzvesmUQEzBK+vdT0ZnENAoVoPh+pD8p3ExrjsY8dP6QDvmLmYy9I
         vyQAsiYeg9cng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 77BAFC433E7; Thu, 11 Aug 2022 12:19:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216347] ACPI power profile keeps switching to "low-power" on
 ThinkPad T14 Gen1 (AMD)
Date:   Thu, 11 Aug 2022 12:19:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: markpearson@lenovo.com
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc assigned_to
Message-ID: <bug-216347-215701-GIniKC6uYG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216347-215701@https.bugzilla.kernel.org/>
References: <bug-216347-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216347

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |markpearson@lenovo.com
           Assignee|drivers_platform_x86@kernel |markpearson@lenovo.com
                   |-bugs.osdl.org              |

--- Comment #5 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> There doesn't seem to be anything hammering the toggle, it just switches
> itself back to "low-power".

Well it at least proves this is happening from firmware/hardware and not
(obviously) from your own doing in software.  I think it still needs further
characterization.

> There doesn't seem to be any apparent pattern that would provoke this.=20

Just as a guess; could this be related to lap mode?  There is a lap mode va=
lue
stored in `dytc_lapmode`.  Can you add that to your output?


@Mark maybe you can help explain this?

If nothing else I think it would be good to extend some dev_info messaging =
when
this is happening.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
