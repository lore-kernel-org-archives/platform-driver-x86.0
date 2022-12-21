Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3505BC10F1B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Dec 2022 11:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbiLULp5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Dec 2022 06:45:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLULp4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Dec 2022 06:45:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D4F120AA
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 03:45:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 22D3761784
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 11:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7574CC433EF
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Dec 2022 11:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671623153;
        bh=aI4lBz8yZY1geU3/HB7bfr3Ac3+GPaujcSX26c+ltss=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=D785N+nwnWXruwelZiVltJlaGu1jpXh4wRvK9OpHxfh/A6smmLIgF2+MBgpyJ/rQc
         XkyBv43i9GzNJkU+Vm904YdToFqpgjerAoDQl0I4FiZ2VSlaoLg7ZPn6kjijBPZEEC
         IR2EuMSdc9uiA4C57Z7tiaQF03ecvOO0VP213ufD5srksZ+zNaWIJdrYA0cw8/xwAy
         YWhumXds+GogUoKKci5E8a8gQswgPzmUVfVgO0bV7VOVG22J05YESpvzDOIpsK521i
         109DkDR7vh0V8ukmAWkNM4shPYHp8nQVjEhzVElFcoVwxMPW7rxFZFvAP3Cte1WfRn
         rIvLM3a1HRHeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 530BFC43142; Wed, 21 Dec 2022 11:45:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Wed, 21 Dec 2022 11:45:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-7kuu4VjWaq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216824-215701@https.bugzilla.kernel.org/>
References: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

--- Comment #6 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
About the camera on/off hotkey, when I asked you to see if there are any
changes in evtest when toggling the camera on/off I meant any changes in the
output of evtest for input3 / the "AT Translated Set 2 keyboard" input devi=
ce.

I expect there won't be any changes there, which would be unfortunate becau=
se
it would be nice if we could send different events for camera on vs camera =
off.

Talking about the camera, how does Fn + F6 work with the slider/switch on t=
he
side? I guess that if you turn of the camera with the slider that then Fn +=
 F6
simply does not do anything?  IOW the slider overrides the Fn + F6 setting =
when
the slider is in the camera-off position?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
