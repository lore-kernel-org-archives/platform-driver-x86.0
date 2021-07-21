Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BF6C07E9B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 07:33:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A744F606A5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 07:33:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbhGUGxR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 02:53:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:34460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235061AbhGUGxN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 02:53:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7B9BF6113C
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 07:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626852820;
        bh=YhfOH2VaDcpPJkX4gszeP22U7jPhEI/w2nyiqNgzaj8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tq5G/DBg4Lg/VAzlzIxf/W/wDBXlQwdJeaS2AkKqAgYtH0Q1p+2KsqRtxNEnZMSkj
         qYRSOA2YIjuWu00sWvEekFBl44D+xnDaxTqewuFbodgm4lgls05zErRxKeznYQ7QuV
         BrDs6drecYUCQoGCD2goSeJBLC8JBWq2hFnxtoy7+OLpSH7Zd5LfoXCs/1mAjoFrZo
         fgExB6aGOXLcI65bd9VWyHhulGNLj6u+UP754C/Rmr8uV4Y10KALSakTGrGLlGdka+
         Pe3hz3A4hjl8nzxwAA/B/H1XNz8sznULZ7JCfh6wxoCbpAXVpoKnUDSglVpBFNPUym
         y3EfZ3bMsI4WQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 07:33:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-213579-215701-zS5v5BMwkv@https.bugzilla.kernel.org/>
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

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |markpearson@lenovo.com

--- Comment #11 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
In both cases it's about this pin

pin 57 (SLP_S0B) 44:INT34C6:00 mode 1 0x44000700 0x00000051 0x00000000 [LOC=
KED
full, ACPI]

The 'ACPI' marker makes it impossible to the driver to use as IRQ and on to=
p of
that the pin is in a wrong mode and locked which makes impossible to do
anything about this on the driver side. There are few possibilities of the =
root
cause of this (Cc'ed also to Mark from Lenovo):
1. Bug in firmware:
  a) wrong pin number;
  b) wrong pin configuration;
  c) wrong ASL code that makes 1a) to happen;
  d) combination of aboves.
2. Bug in the driver. The only possibility so far is the broken offsets for
LOCK and/or PADOWN register sets, but the only possible commit that may aff=
ect
this, i.e. cb8cc18508fb ("pinctrl: tigerlake: Fix register offsets for TGL-H
variant"),  has been discussed in the bug #213463 comment #9 (also useful to
read the entire discussion) and not confirmed to be a culprit.

So, to me it sounds quite likely that the issue is on firmware side. But I'm
all ears for the information that may help to eliminate it from the equatio=
n.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
