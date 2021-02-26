Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F4D2C433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Feb 2021 09:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3C66D64F32
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Feb 2021 09:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhBZJTc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Feb 2021 04:19:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:40942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229556AbhBZJR2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Feb 2021 04:17:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 794DF64F03
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Feb 2021 09:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614331007;
        bh=R5yCVDf1A8uxMhSBeb4XkjM6DR2YmDVM0oTrqx/tU10=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=scs/X1FDml7GSgFsCBdAp0plUTiSWEWVuyMCNCeiLbRfgUpIqEx6wR18PxUcI+yBV
         2XWbYFkfIJk9Md6t0+WbOoy4w94E/83xms0akcQT3bZjTCySKV0pI1bxLajTrZIOWG
         0hfC+jEQKvokmBs5OcJWRz0vB5FeeF5QWZItlMYmlKTSDpPHqBZR4WEoAQIqWyNoDl
         uqFxgq1mJHZSC2zYNY3iZltggTGDX05X2psQUm7qhsdcXm8Hv5zVuwzGoqqEMm2FiD
         /040vFg8io+b5JU8EpwWCxRnS7qxwLtluvKpp8SXDV+Kpj/oTFgkmCnt2cdU8PK4cb
         QJHfCxAWt5q3Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211895] dell_wmi_sysman causes unbootable system
Date:   Fri, 26 Feb 2021 09:16:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pspacek@isc.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-211895-215701-rUat89dG24@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211895-215701@https.bugzilla.kernel.org/>
References: <bug-211895-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211895

Petr =C5=A0pa=C4=8Dek (pspacek@isc.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pspacek@isc.org

--- Comment #1 from Petr =C5=A0pa=C4=8Dek (pspacek@isc.org) ---
Created attachment 295461
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D295461&action=3Dedit
journalctl from the failed boot - DELL E5470

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
