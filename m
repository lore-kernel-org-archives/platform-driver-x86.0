Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368AFC77B61
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 16:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234206AbjDYQS7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 12:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234427AbjDYQS4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 12:18:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5888216190
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 09:18:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CE0F162A50
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 16:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35153C433D2
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 16:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682439533;
        bh=GO8fsetcVoNCGNkZaCwFlytM7RcfIuKqkq4FMsj6PVs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BVUntzu8C4pQHAunfe/zAXIbtN0HB4//VeJNsM3oS8UzSJNGR4RSKtnP7xVoD73pn
         q+Uzen/FT+NiCR2HBBu+DypDvBgYOL3VL5vlf4AQaUiJCgXpeASuRK2paSyNQ1WLB7
         7lndjKDxD322CPGtyMph8q5YR8mX5svyr58LJSRQLUmSnkjyak1+Xe0OZl85mWO2ec
         B8xaJMNZrWaQ0jxNAUdPVQ/oie3z9oMaA4GPPbBx2lX+AQlJS/AH6DMDMHEgeU662f
         4bFe6PxC4DF5pdWiCt7Guf/ubDLScJDDj/ku9/oMZKOnwgXgny7QvETfxavlcm0p28
         +kfegzlhM3QYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1B1D9C43142; Tue, 25 Apr 2023 16:18:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Tue, 25 Apr 2023 16:18:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 7ec0436c-7844-4c81-b72c-b80ee3084b19@schlosser.pw
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211741-215701-nGgX2ghcoZ@https.bugzilla.kernel.org/>
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

Firnin (7ec0436c-7844-4c81-b72c-b80ee3084b19@schlosser.pw) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |7ec0436c-7844-4c81-b72c-b80
                   |                            |ee3084b19@schlosser.pw

--- Comment #10 from Firnin (7ec0436c-7844-4c81-b72c-b80ee3084b19@schlosser=
.pw) ---
I can confirm that this bug is still present in kernel 6.1. SW_TABLET_MODE =
does
show up as an input device, but never triggers an event.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
