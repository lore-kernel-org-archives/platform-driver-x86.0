Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716BFC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 14 Feb 2022 06:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbiBNGmt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 14 Feb 2022 01:42:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231508AbiBNGms (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Feb 2022 01:42:48 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1581E4D62F
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Feb 2022 22:42:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9D048612A8
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 06:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AEF9C340EE
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 06:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644820960;
        bh=Z5+7nHI/xAIktYXDmYnVsJks53XHquaK2wMb/EVYfkg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rgVkQsN+WRShISOWHLqPyGxvFu30WrFtE2CwK2dVNtIeuIfEvfULR1p4UUFd7/M+O
         PHehYE85AMdjYJf+lwSWe2x2MDME7ATjEPGJmRM5jLJWJzRUXlGCQyv/NIo70Qpy8U
         iSkFrw2Wey3Pcsb2ZElLv7jlQanfWt9HwTHoMQ3xGwRnoC4VqITRCZr6PX4yH4m+3O
         ct3mbXQNeisEbsZZHlhp0zjR27MdkUNhNDqgk5rVGInFnmz3EXIGXrqaC5Qi1vSf+7
         JMyfkelGLiss9VYkjvW1sqFvgRjmgseOCZD1k8iCHZ5CeWStrM40L4l5wje/61Z9gE
         0tI3KeN8aqXUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D710CC05FD0; Mon, 14 Feb 2022 06:42:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215531] Lenovo charge limit feature stops 1% short of the
 configured limit and says it's still charging
Date:   Mon, 14 Feb 2022 06:42:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rui.zhang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component rep_platform assigned_to product
Message-ID: <bug-215531-215701-tIg5j3g5GT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215531-215701@https.bugzilla.kernel.org/>
References: <bug-215531-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215531

Zhang Rui (rui.zhang@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rui.zhang@intel.com
          Component|Other                       |Platform_x86
           Hardware|x86-64                      |All
           Assignee|rjw@rjwysocki.net           |drivers_platform_x86@kernel
                   |                            |-bugs.osdl.org
            Product|Power Management            |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
