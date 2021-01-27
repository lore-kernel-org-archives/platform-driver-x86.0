Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56FEAC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 06:15:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CBAE20717
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jan 2021 06:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhA0GPH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jan 2021 01:15:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:50326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235253AbhA0DQT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 22:16:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 52E9464D92
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jan 2021 01:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611712661;
        bh=qWZYDdCJrHjsLd45tX8q4meM6g6IMcwaKZKnJZiCZQQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PIq+lkU0uCDl6BU8rVnEVre7EruY2ZLuZnykKQ/aQVYMRGFo1+LJrC3EzaQMibNHR
         jDlgtsheVFp48Fjks06Aow3sSzhYVvSKG+SCMID+xLRRpQtk8Wf8CcxmiEM/j3wFDu
         s4AFoLX9Tl3g0AMywXGBNvi4wO/Evtxuu/VC8m1aWzuyTHKHPghMs+RIkZgpqqPvPc
         SrewDZaWPAfeGH/63pq6ZkApi3VCS5NufGCY0dav5BTfQu7JUvyjibC7BITJjgjy0F
         tm08Q1HAhEkyKiHyf86bmH0Ob8/jpkLQ9TWJq8eiuXLhTl/Tj7rEK37qowqf+zJY+L
         pAVfQ1/fHa2XQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Wed, 27 Jan 2021 01:57:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-og1HffH4wr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D199715

--- Comment #58 from Luya Tshimbalanga (luya@fedoraproject.org) ---
(In reply to Richard Neumann from comment #56)
> @Dimitris, @Luya
> I have added DMI-based model detection to my driver [1] (v. 2.9.8 in the
> AUR).
> I successfully tested it on my system.
> Please make sure that you disable i.e. comment out any sensor override if
> you want to test whether it works on your systems. The quirk should enable
> only the accelerometer and magnetometer for the devices that Luya and I
> posted above.
>=20
> [1] https://github.com/conqp/amd-sfh-hid-dkms/blob/master/amd-sfh-quirks.c

Thanks, I will try it on my Fedora system.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
