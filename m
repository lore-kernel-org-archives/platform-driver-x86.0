Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0FDE7D277
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Sep 2023 10:32:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjIZKcR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Sep 2023 06:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjIZKcQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2023 06:32:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD06BF
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 03:32:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0ECB3C433C8
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 10:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695724330;
        bh=3ZxK4c78mYlP2mLUppeSVUwZD5gcYZcWdu9mdAnvtAk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bOrzVjaE3qKEY3hdgHfKSoJ88xP4wYUn3yG6o1L3poyv3UrWj5mqgS2HTUtULx8py
         FrTx//U/gvyuW0MbxaQnjF8iM7xQeVd8VAz/GWQHn2VwV1gHBdI12xNBWGk7FU4CZh
         JxliPw5e/VeYIuROp7cvEQNs535uUxWwSVd/s7nzQwxudLgzr7QXbNY26YlkPFlbem
         V3WqmsURbHovwXJPQnu0Y6R/xKSCDKsK3Ft2AExMHGBRVmtrjN8ihOcPQ8KjjG48LX
         LhJQwycGiWyWjOPGsTM9Fp/vUIwW5LeCm897CvTrXT7Vgvy3flZdAYAxg4n7Ip3lLQ
         JuNMcy8CzEE3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E1D70C4332E; Tue, 26 Sep 2023 10:32:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Tue, 26 Sep 2023 10:32:09 +0000
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
Message-ID: <bug-217947-215701-xB8yJNopPk@https.bugzilla.kernel.org/>
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

--- Comment #4 from Jiri Slaby (jirislaby@gmail.com) ---
(In reply to Jiri Slaby from comment #3)
> > As a quick test could you try adding:
> >=20
> >  /* Check if we are PSC mode, or have AMT enabled */
> >  funcmode =3D (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> > +if (funcmode =3D=3D DYTC_FUNCTION_STD)
> > +  funcmode =3D DYTC_FUNCTION_PSC;
> >=20
> > To see if it behaves correctly please?
>=20
> Will try.

It only changes the error to EINVAL. 0xf is not handled as a correct state =
in
PSC.

BTW the first (bad) log:
thinkpad_acpi: dytc_profile_refresh: err=3D-22 mmc=3D0 psc=3D1 mmc_get=3D0 =
funcmode=3D13
output=3D0x1f001 perfmode=3D15

subsequent refreshes (good):
thinkpad_acpi: dytc_profile_refresh: err=3D0 mmc=3D0 psc=3D1 mmc_get=3D0 fu=
ncmode=3D13
output=3D0x20013d01 perfmode=3D3

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
