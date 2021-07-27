Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3DAFC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Jul 2021 23:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF46660F6C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Jul 2021 23:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhG0Xny (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Jul 2021 19:43:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:49028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232766AbhG0Xny (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Jul 2021 19:43:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 72AF260F6C
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jul 2021 23:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627429433;
        bh=Y7r4Nk/U6ghwgF1WkJtH6stjsZqsTaEwZphZ+5YvVmk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ehr9U3FqOP8Y+L9ZTFqTCZdzCiHqn9k2xelkuPvO/lV609I6PBvd7gxbsekYPLTyK
         mbuj1msVJlbzgWb7UF0L81TfZdY7Grm+lsh+3PjZ3S14WU6gp/miVSNhqyQkZoLbCY
         +sZPvBqyCNTejZtmfxiuNlU0NN8N5bZmQgbFly2qUS+F8ox8p5rj7j7GYViPF2SKsd
         wbwhMQHGIOSvwVdgXkbq4AWMVvF52k1oG/WPLa07nv4yC90EzySW1uoNxEmWyMZ3B1
         n/pfkd41W+v3YOsrSTJfQzmrZGK5+PARVbKnV8S31vnmSk9i6Z/Qt6xbK1sbfsafVo
         gpLeqGezP7u2w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Tue, 27 Jul 2021 23:43:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: james.a.munsch@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-UGf9ltMH6H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #43 from James Munsch (james.a.munsch@gmail.com) ---
I've learned alot with this thread. Thanks.

Confirmed also working for the equipment I was using as well.

CLEVO NH58HPQ

06:36:29 jm@jm ~ =E2=86=92 lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 20.04.2 LTS
Release:        20.04
Codename:       focal

06:41:26 jm@jm ~ =E2=86=92 uname -a
Linux jm 5.10.0+ #3 SMP Tue Jul 27 18:08:55 CDT 2021 x86_64 x86_64 x86_64
GNU/Linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
