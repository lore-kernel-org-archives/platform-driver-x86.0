Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B62E80A93
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Sep 2023 06:34:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229849AbjI0GeO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Sep 2023 02:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjI0GeG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 02:34:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DAD8FC
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 23:34:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 120ABC433C9
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 06:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695796445;
        bh=5kdjQW+gXizE/XLNBbhkTCDE++XuGYYUTAzKp/R8HCc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=edLf/QPGhl7PabzMsZ0jCsKx7rkwNUX8tGBJkcyYiRg31ZlmI2oZjGGBvsNZFMEbE
         BjxKaxSigDZZ9n4fitHv5ZeRfzp43ETjVSMXSsosZrfJA4tpu3VqGxOuFgqr3P+70K
         PD8Q0SyJ2zYG0iarPd/t0p9dJDjB54iFrpEkLtPjAu+9YpbLjN8wVTjXaQLx+QNdVd
         4uzIlInC/w2yYB7yTfgukNtdqbhYzevAbdeOUVJmJQrYSzR0bMm1Vfi0dBKCtrQMJ3
         eqt9r72+H0NrNnycSfFxgsol7RrfgzOIXdtzLJ6amGwW7uzRPk2PB3YcvanWuei65B
         N/3KRzJPwADEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D2482C4332E; Wed, 27 Sep 2023 06:34:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Wed, 27 Sep 2023 06:34:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jirislaby@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217947-215701-IXogdgPQ5O@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217947-215701@https.bugzilla.kernel.org/>
References: <bug-217947-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217947

--- Comment #6 from Jiri Slaby (jirislaby@gmail.com) ---
(In reply to Mark Pearson from comment #5)
> Ah yeah - need to add:
> case DYTC_MODE_MMC_BALANCE:
> underneath=20
> case DYTC_MODE_PSC_BALANCE:
> in function convert_dytc_to_profile
> (same as is done for the MMC block above)
>=20
> I think that will cure that error.

Of course:
dytc_profile_refresh: err=3D0 mmc=3D0 psc=3D1 mmc_get=3D0 funcmode=3D13 out=
put=3D0x1f001
perfmode=3D15

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
