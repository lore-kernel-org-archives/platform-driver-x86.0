Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902F2E7D240
	for <platform-driver-x86@archiver.kernel.org>; Tue, 26 Sep 2023 06:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjIZG56 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 26 Sep 2023 02:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjIZG55 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Sep 2023 02:57:57 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A712FE4
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Sep 2023 23:57:51 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4458FC433C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Sep 2023 06:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695711471;
        bh=0QIlsBfh+deFcThHkSLtpRjNVL+Ss37bDLNrknc9kow=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kncH1axfknzD/Vo9Yoy9GKzTZ3OYrgVleUtrHD1aLVrCYK4wM0mJVlR9Hvs7PQop6
         mrpBVIik4w3PIANKqDjyFVBhLUpjGyU4zpDldta4SYJrXDH07OKA8ZVOEcPGmZ/3k6
         R++02VfW+CEowdqL/3lmYIXqL+2aHqYgUCkaHWdI/fshEypQVUw28aPCsRU15aV+Tr
         iclHAdJV+xV8sLn4ntd+ebQ0bo3qstEr5xNzob+PLc4mpXtoYtl1OAO4yyOxTCXSJj
         qx0uG+L1D+3nclJJAUuYUPy1zRxtsSxub+J31uWnMQPKqOEbXeb4XysE2s7y4jiAKN
         4SuZGA0x8Hr1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 27090C4332E; Tue, 26 Sep 2023 06:57:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Tue, 26 Sep 2023 06:57:50 +0000
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
Message-ID: <bug-217947-215701-K3RL3eKayX@https.bugzilla.kernel.org/>
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

--- Comment #3 from Jiri Slaby (jirislaby@gmail.com) ---
(In reply to Mark Pearson from comment #2)
> Can I confirm this is on a T14s G3 AMD platform?

Yes.

> It looks like this line is causing problems on this platform:
> funcmode =3D (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
>=20
> Normally that should return PSC mode (in this case - unless you have AMT
> mode, which you don't on that gen platform).=20
> But it's saying it is in standard mode instead....which is peculiar. The =
FW
> is doing something non-standard to other platforms.

Interestingly, it happens only initially and during suspend. Other than tha=
t,
it's in PSC mode likely.

> Do you still get the warning when:
>  - you're in performance or low-power modes?

I am on always in low-power mode. This notebook is crap, it's noisy and very
hot in balanced or performance modes even when idling.

>  - you're in lap mode?

What is that?

> As a quick test could you try adding:
>=20
>  /* Check if we are PSC mode, or have AMT enabled */
>  funcmode =3D (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> +if (funcmode =3D=3D DYTC_FUNCTION_STD)
> +  funcmode =3D DYTC_FUNCTION_PSC;
>=20
> To see if it behaves correctly please?

Will try.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
