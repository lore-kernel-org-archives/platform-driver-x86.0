Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEA6C5479D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 11 Jan 2023 18:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbjAKSuq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 11 Jan 2023 13:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233512AbjAKSuo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 13:50:44 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD3C3C71C
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 10:50:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 71A9061DD9
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 18:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1C08C433D2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 18:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673463042;
        bh=F3381Bgbcu2Kbwbk8lfXC+vf+5ZhJDM3ajm8mn9LXGU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QJlAXNYbzmaMtstYdDjUJJlCUZbjtWdLBpjKVMq2Wdf7GKTX5gyIPd+dkAP5x+8xN
         HzmIqL5ct0cns0LXz/aT37JBlHKUmdVmxi7UnQjsqT3UMpsmssYcINKNg2c2gd2V5k
         iP7ZBtkQThJLSQfjJwo5IdkawEfA5NZYU6VDr+MbwXe6mUlmvu3ocrSMnMa6Km1Yzq
         AGtt3idfySovZ0Ca2UiQJ5jygUJKTR/4nMfHPbciaI+OQxR1J4Ol2ppjLP/PBQxYSX
         lukmFICgskfqYBQv0CV13ywodVBYaPIiUI/QDYbbRwfR1PRW9Tup9BezTCn3AiSKqT
         exxRJmDyUFtag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B885AC43141; Wed, 11 Jan 2023 18:50:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date:   Wed, 11 Jan 2023 18:50:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-215701-ZXMw2wMlB6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-215701@https.bugzilla.kernel.org/>
References: <bug-216917-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #1 from kolAflash (kolAflash@kolahilft.de) ---
I've narrowed the problem down to somewhen between 6fc4c0cd9 (last known go=
od)
and v6.0.18

Linux-6.1.4 is fine.
(i just can't use it productively because of
https://gitlab.freedesktop.org/drm/amd/-/issues/2171 )

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
