Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B83C6377D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 14:14:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11BAF6128A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 14:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhGVNeC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Jul 2021 09:34:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:41504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232347AbhGVNeA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jul 2021 09:34:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3E8CF6128C
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jul 2021 14:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626963275;
        bh=ZK3TFDtg7QusgMjpuXno9cYXkIzs1B4Z1gCus/gYTkE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cjutZp6UP2YdfRUchf0oYQmVIBjXTjPbm1SXaJ58VIXkaKmexaqe8eKWsm7COoR7u
         Mbfsr/6LEMEfrI08N2mMvuUEevugu3+GVRF7eQz5ulm7csFuGW2XwexQ3rHq9Mt60+
         TQcRsiQ2+33ZaU/V/8wwWK6m7Tlpk0+5hTFFUX5ipgV4ynZzNm202CguKoVP53MZqB
         GuvUlLrbkBjM6/hgjXlW/ZQx0xTwxW2JxF/IKYIX8z3f214Pm/XBZuR4YSljcMNQS+
         LTTVTKMAccg+F2vhi3Mv2n2aJZne+Ozige24HqcrjKExOi+SghYKarSRRM9pYSzj9R
         SpC0UKKHZdKWw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Thu, 22 Jul 2021 14:14:34 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-m0i3FiYvDO@https.bugzilla.kernel.org/>
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

--- Comment #39 from Riccardo Mori (patacca@autistici.org) ---
(In reply to Rod Thomas from comment #37)
> a) Where 44 comes from - is this the GPIO pin that corresponds to acpi pin
> 57?

You can find the mappings with `cat /sys/kernel/debug/pincntrl/INT346\:00/p=
ins`
For example let's analyze the row for pin 57:
`pin 57 (SLP_S0B) 44:INT34C6:00 mode 1 0x44000700 0x00000051 0x00000000 [LO=
CKED
full, ACPI]`
You can see that it is referring to line SLP_S0B, it is mapped to GPIO 44 a=
nd
is not in GPIO mode (mode 1) and is fully locked and has ACPI ownership.
In contrast pin 37:
`pin 37 (CLKOUT_48) 140:INT34C6:00 GPIO 0x40800102 0x0000003d 0x00000000
[LOCKED tx]`
it is referring to line CLKOUT_48, it is mapped to GPIO 140, it is in GPIO =
mode
and ACPI has no ownership of it


> Sorry to be a noob but just want to understand this before I embark on my
> first > kernel build.

I see you are using an archlinux based distro so you might find useful this
repo I just created to build linux with this hack:
https://github.com/patacca/linux-tigerlake-hack

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
