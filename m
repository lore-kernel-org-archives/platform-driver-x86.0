Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC5EC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 03:12:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2DB84613E9
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 May 2021 03:12:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhEEDNQ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 May 2021 23:13:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:48084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230454AbhEEDNQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 May 2021 23:13:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D365613E3
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 May 2021 03:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620184340;
        bh=UhZvN074U06WnYgaruIl0/VWsSA87XyyiWe3g8Tm/ww=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ObyK+1XC6JiPKYP2KQJhBvFuEwq+LH1DMrBAbyc6kjj2AsDqvKx/kyCd0ZRKlobci
         HeEb3PmYIQzwEiG+QcGAmqBrIwgoQvChE5LAtuU6N+FFOV74+q7wPJyEydQ6eZic3H
         7z/VSht7xpXPfFEyaRLARUFQ8eLUV9BU2a8IkZ423tzHnaonswl3LVazxtnuj1usK7
         7m4IMYqsJjl7ly6jHfctC245RCOSLNSaXFJFfqxjhQftOgUibZSjWqKH8iYm1Khiiy
         OrE+TctenbEuPxd3gfvYZ3PieVNUQOnVKF5swh93Kq32BXCJ19RHYes1EWIzZy5Dne
         3eohJSTWd2H9w==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 05 May 2021 03:12:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-N3PjpvWtij@https.bugzilla.kernel.org/>
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

--- Comment #76 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Bernhard Seibold from comment #75)
> Created attachment 296645 [details]
> Add support for access via Asus WMI to nct6775 (Rev 2)
>=20
> Here's an updated patch that also accesses the Super-I/O ports via WMI.
> Please note that it also adds an ACPI resource check for that IO region. =
So
> it might actually make the driver work on less hardware, although that ch=
eck
> should probably have been there in the first place.

Seems to work here, thank you very much!

nct6775: Found NCT6798D or compatible chip at 0x0:0x290
nct6775: Using Asus WMI to access chip

$ sensors

nct6798-isa-0000
Adapter: ISA adapter

I'm only curious why it continues to say ISA adapter which doesn't seem
technically correct.

Anyways, please submit for Linux 5.13 - it mustn't be too late as we are no=
w in
a merge window.

Tested-by: Artem S. Tashkinov <aros@gmx.com>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
