Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBACC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 14:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4C936120E
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 14:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233255AbhKEOcu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 10:32:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:47978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233248AbhKEOcu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 10:32:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6209361250
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 14:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636122610;
        bh=QwvbT111+GeViaxjOUca/Nh2udUOcWW7lBzhT5INLeI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qp0sBHd8ojU3LLKQMfRDDBnhx34jDs/z/L4XFSZCCiinM8mNrIIrz9Lmm66I70vb6
         CvZaIuf37DtybAXqY2ZbIyEGHZPeo1J1G0c+bxAMtBAKzc9aL8ef1CcYlKCrtwPvDW
         rD10huYNlcTOQ6geRLwoTa804pZW45z6K0dtlRWpcAaTbK1Zsr36boJ0nlJoedrvFs
         WhJt0gQq2f3q///sqDLR2XArye8C8kHO53/WPtOJg41OxLIOSPeyv5Tk6jo5lwRvlK
         eaUsUAdrc6QagrCd60mZOyZF75l2elKSV0iSJoXvxtIqrRi9ge+V6kIUQXdymRMT69
         qJ4wekp9I5bZg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 05 Nov 2021 14:30:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-uCIDCFvRTa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #155 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Eugene Shalygin from comment #154)
> (In reply to Olli Asikainen from comment #153)
> > Yeah, it's old and suffers from the same bug, but I reckon supporting t=
his
> > would be a completely different story. Thanks for your answer Eugene and
> > sorry for the noise.
>=20
> This firmware seem to be using ACPI mutex named \_SB_.PCI0.LPCB.SIO1.MUT0=
 to
> guard access to the nct chip registers.
>=20
> I wonder, can we rely on these mutexes, whose names seem to be quite stab=
le,
> as well, instead of the WMI functions? Then accessing nct registers would
> become simpler: lock ACPI mutex if needed, access registers always in the
> regular way, unlock the mutex.

There is a _SEM (semaphore) handling example in the upstream:
https://elixir.bootlin.com/linux/latest/source/drivers/i2c/busses/i2c-desig=
nware-baytrail.c
https://elixir.bootlin.com/linux/latest/source/arch/x86/platform/intel/iosf=
_mbi.c#L275
maybe something similar can be done for ACPI Mutex() object.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
