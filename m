Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FFDC4338F
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 13:42:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B59C960725
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 Aug 2021 13:42:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234324AbhHCNma (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 Aug 2021 09:42:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:39118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232748AbhHCNma (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 09:42:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4441660725
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Aug 2021 13:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627998139;
        bh=kL2S2ZpS8oZYM3GvssPKmheD4eZfhj3oGBWVGEhx8as=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Fm45tlVIQMKmhfgVP96Vtly1utnJJy4XddwpOdmlfuxf/15q13eM1TXzmY3DOmqvu
         SIq/HzNs1Erb3oRD/gk28htIV9xEr5FS30qzXS2YsnD+1DIGqZ2xvfKw72EQUv0ZId
         s2FbLR0dqiLpgDdGjT47j29jLX9upufKH90Q8lFptvLtonV/C1n4QEXeUNMPCe4W1f
         mXgTX39pyY2REoVAvj17wBAYA8RHm9valLvEVgJanS8hXp067I7uS81Rf+kLYDC5wp
         WzDN+p74BdgggVpQEzDVxu1xsZZVAYCBKZEN75obLicktpVqK4dnM+QrzfLocBdz89
         KZ7NjgSeQvi8g==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Tue, 03 Aug 2021 13:42:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-mbOnBeUkTF@https.bugzilla.kernel.org/>
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

--- Comment #52 from wse@tuxedocomputers.com ---
For reference: Tongfang replied that they checked (on windows I guess) that
"after kernel computation" the value for INTA is 0x8C.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
