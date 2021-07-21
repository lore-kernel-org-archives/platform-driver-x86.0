Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A9CC6377B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 18:24:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 214BE61222
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Jul 2021 18:24:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238815AbhGURoF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Jul 2021 13:44:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:34040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236157AbhGURoD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 13:44:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0D05061208
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 18:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626891880;
        bh=LV9kX8eGipgMm8pw9uV3H0hARImzJUCxXtA0ZJW513M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dm3Btjr+k5N/Ms7x38tDMtcw+d1Tje+/kduKWzM4Cp/HFbW0uH5bpMnuNosSmJA5w
         COEeogz8YeI1B3heh7Gxxlm8ai0KnpGGFUUirkJdWy4s+M7WvwAZHumi61H1lNnHTz
         hROi8O0FnIAAmypS5w9NmiXRXKm1ySNKpgF4iyKX3mu5xlsHGN63zL5y5n9egWbq96
         o4ikK/Xn/+IafDbxrB8GoXhZ67sRFxR3um551/fxGxOYDVyrBzLd5URcLQ6dXbVofJ
         UOVRhfxc8qNIU+V4UspdvL5kOROsgNKiTXVYFVQPxnQZsNcCleMr6+6fQ6OdTd/57E
         dw6yT8tdqJ36w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 18:24:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patacca@autistici.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213579-215701-WDn8Qgmuhj@https.bugzilla.kernel.org/>
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

--- Comment #31 from Riccardo Mori (patacca@autistici.org) ---
Created attachment 297989
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297989&action=3Dedit
dmesg

Unfortunately even after the hack it is still trying to use pin 57

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
