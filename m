Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D49C433ED
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 May 2021 20:57:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6DA06145D
	for <platform-driver-x86@archiver.kernel.org>; Fri,  7 May 2021 20:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230164AbhEGU6B (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 7 May 2021 16:58:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230093AbhEGU6B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 May 2021 16:58:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 08DEC60FD8
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 May 2021 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620421021;
        bh=2OEXgX2sFuoVqCflYCDn7eF+olqsKVu3XussLNPhAeo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=McY0vGTjzrjAEQXCboHaWwmMHlUlokuodZZMGZj0/YAyJFeAWZ8T0TZoRCmXollXv
         UNKBduDoyufuip9GtcPFPaYvgKvvWmTXDOJj6fHUNN03hXO0dcydGRvu9SxW0xZbHB
         CJfzOHqNsB0q3NU3c0BUbCTbGs9P5GwaBgla/1ywcBZFHKFFe6gMzTtmm1soCpwDmL
         iNn/ChbJS4Rmtgie8QrfRMseVVtw1Qg3XNFKXd+o5Fxt7/d76ostnZkLToWSgZSdQH
         elnU0XfAokduFLVDDaijdbxpX5pCjMGcOl6MOT1vYFJCalLVJZh1RHiutZUl5Bz11O
         4FAEdZdyYNa5w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 212985] ideapad_acpi: VPC2004:00: DYTC interface is not
 available. platform_profile interface is unavailable
Date:   Fri, 07 May 2021 20:57:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pobrn@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform-driver-x86@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212985-215701-wENDNk3idb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212985-215701@https.bugzilla.kernel.org/>
References: <bug-212985-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212985

Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pobrn@protonmail.com

--- Comment #1 from Barnab=C3=A1s P=C5=91cze (pobrn@protonmail.com) ---
That message is not necessarily a bug. That interface is not available on a=
ll
devices. Can you check if the VPC2004 ACPI device has a method named "DYTC"?

> The conservation_mode interface is available but cannot be used.

Sorry, that's on me. There is a glaring typo in the driver, I'll send a pat=
ch
to fix it shortly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
