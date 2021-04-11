Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E82CC433ED
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 08:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B68F611ED
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 08:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhDKIZx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Apr 2021 04:25:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:46002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229804AbhDKIZx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Apr 2021 04:25:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 796F161206
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Apr 2021 08:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618129537;
        bh=JxVdsC/SuBq63CYTzQULy3eYYewiLzj3H2NDR3qL9DM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EW9D1TXl2HbBzwGeYItgoX8ja3Hc90da4LIFkCEJ0h3jyhyqAOhCcGSvC+jaE17/u
         QS60q8TjSpnW8B5YWpfL6SLgNu8MpgH5yKClMWhEBNEZRvudp6Z9RSJFe4r08+K2dP
         Eth33J2nf/9zqK57RhDRFdhvJBL4NH97vuFRSLWhuWZ2OPNiX5ze3RXthndNVfeZRP
         mk+TgyV1+NY+aU/DO0R34BmiOOOYqBruRemGztQa/6Gsz54+zgncMBeMHcrlmKrCqM
         kQ1T5aE5iePrnvunC1gPWikg3UKj67PzRB8S2DK2hG5r9uqzWuLyhQsW85abUGQ3ZW
         vp9hLJwR37pmA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 11 Apr 2021 08:25:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mat.jonczyk@o2.pl
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-RZHDK2oOTr@https.bugzilla.kernel.org/>
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

Mateusz Jo=C5=84czyk (mat.jonczyk@o2.pl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mat.jonczyk@o2.pl

--- Comment #54 from Mateusz Jo=C5=84czyk (mat.jonczyk@o2.pl) ---
Hello,

I was doing some preparatory work to implement the solution in comment 47 -
like analysis of source code.

Unfortunately, it seems like this solution would only work for ASUS boards.=
 All
the acpidump outputs in this ticket are from ASUS boards. The "RHWM" and "W=
HWM"
methods are from an interface with UID=3D"ASUSWMI", so they look to be
asus-specific.

For ASUS boards there exists a better driver:

https://github.com/electrified/asus-wmi-sensors

so there is probably no reason to implement direct access to nct6775.

Are there any benefits from implementing access to nct6775 as outlined abov=
e?

Greetings,

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
