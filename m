Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066B5C63793
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 07:48:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD14D60249
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Jul 2021 07:48:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhGVHIN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Jul 2021 03:08:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:33020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230200AbhGVHIN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jul 2021 03:08:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BD61A60249
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jul 2021 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626940128;
        bh=kjHWXYFCbkU7So3KHAe/l8EItvJyjd+8PmiLk5cjmek=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DHjiDhRm4ifYpBBOZAyhjc1mqB9WStOobJjm0CV6lpUfml+xquyOzzyYlh7btNjko
         ALcjca1eRGdPLH35H270u0gnk1NwqxLnXxW4ttzK5KAi/c6ACdJtQPSl2YMXPU5w6N
         oBukkF8kzwVxH/u6uIktzgzE4nTlcxA61CfzNnprPNHgmTfl0KNVoUcw6tbhfZTbrt
         qRq0Ji74cV8vjyQie4WodpReoWhroJLSHb22zTkpMYnJ3am1QATTH5j9bNaRZLmjpe
         K9/VcmCa0jJ7hAVdAhnKYouq6wQEBzCAenpoXIchaM++BnDCejx8Lw2ZQ1khr1uE4/
         8U/a6Y0N9sCCg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Thu, 22 Jul 2021 07:48:48 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-mwXfqga995@https.bugzilla.kernel.org/>
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

--- Comment #35 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to wse from comment #34)

> So my noob question: From where in the firmware does this 57/44 pin
> come? Is it ACPI code (hope so, then a workaround could be crafted even
> without vendor support)? If yes: What am I looking for in the .dsl files?

GPDI is a variable in NVS that is filled by BIOS. That variable is being
converted on OS level to the INT1 with `INT1 =3D GNUM(GPDI)`. There are 4
(almost?) identical code snippets (one per each of I=C2=B2C controllers), s=
o you
need to see which one is in use or change all of them. This will require to
recompile complete DSDT.

I would suggest to whine at vendor and tell them that their BIOS is wrongly=
 set
the pin for TouchPad device in DSDT. It is quite likely that Windows drivers
just ignore interrupt resource for touchpad (which is a mistake in Windows
driver, but we all know that the quality there is simply awful).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
