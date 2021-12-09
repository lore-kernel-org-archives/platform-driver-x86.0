Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FD5C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu,  9 Dec 2021 05:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229618AbhLIFUp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 9 Dec 2021 00:20:45 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:56682 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhLIFUp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Dec 2021 00:20:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1DED5B82373
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Dec 2021 05:17:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCFAEC341EC
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Dec 2021 05:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639027029;
        bh=ywdGn+lSoNpH31H1WZ3wi+cxGqEoMMlV1Zd2mlBuf7Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eQCPjrHBwTCcpt21n+JbDdhehUYnVapINyasVe+wyhCyWUPKw/Xzc2MHwMPi1U3ZW
         0bEfcjAlqneToPb/z2syUUtNH8t/XAR21Zif1RTmdHI2avylO2JEkCcO9zmmCxLwGR
         lR9nMlE2sZF6aBUU05+uqv9xMl2HoE7/Zd8niSbVqoYCMb7r7iEZyB1acBQZsCZmX4
         EVewfRpL4ozeQ//ALEplX9c0FkqeRB7k2Asy+kEOVX3+2xF+rnQ4kkR6y8ELqUZ3vU
         6VZuPOMorol8+GaV3jLDY+UnJJPK4HMviqai9nZGOqYKxtICRU/k5U4YtJx/cJXO7b
         dFKo7tkkUgy3w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C3F0260F38; Thu,  9 Dec 2021 05:17:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 09 Dec 2021 05:17:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vladdrako007@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-zMq5NFb0J3@https.bugzilla.kernel.org/>
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

--- Comment #193 from Vladdrako (vladdrako007@gmail.com) ---
(In reply to Denis Pauk from comment #192)
> You can try with DMI_EXACT_MATCH_ASUS_BOARD_NAME("P8Z68-V
> LX", &acpi_board_LPCB_MUTEX), But I am not sure that it will lock correct
> mutex or be safe.

drivers/hwmon/nct6775.c:5443:56: error: =C2=ABacpi_board_LPCB_MUTEX=C2=BB u=
ndeclared here
(not in a function)
 5443 |         DMI_EXACT_MATCH_ASUS_BOARD_NAME("P8Z68-V LX",
&acpi_board_LPCB_MUTEX),
      |=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
^~~~~~~~~~~~~~~~~~~~~
drivers/hwmon/nct6775.c:5411:24: note: in expansion of macro
=C2=ABDMI_EXACT_MATCH_ASUS_BOARD_NAME=C2=BB
 5411 |         .driver_data =3D info,=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
        \
      |                        ^~~~

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
