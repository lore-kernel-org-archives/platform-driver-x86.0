Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB684ECAAD3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 09:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbiISJBa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 05:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiISJB2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 05:01:28 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6461012627
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 02:01:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 199C9B810C5
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 09:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5580C433C1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 09:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663578084;
        bh=2Hfswh1cCyUTKSgtcsm1JDwY+bv2sY2tx7+KjoTlRro=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uHDsium3ESFxgq94EGkwIrU2T0gj3BoSFHNOwXZS+JcUoGMZYckEUvLpaSZu2+rpF
         QxM9nQW73dSNj+Y9LbHZ+9o08V6Ck46Vy44Ki+MJpzWOAw48BgP3z3osKw4+OYug4K
         7W+CSM22kbiwdNXbxStqbZykfTq7wE6CBloEB5mPy3SAPtrTOlRnPV9NH0yvAG4UX+
         bqP45tkWuNFjQaVR7if3kg+laDm7VK7UE/a3mieKzh7IadsjqULK9gj7QoEH+0LD9d
         RqnH5v3M21ilDahkQRUrjitmJb3wYTGyeA6PB2UflZmpFLBRdrUXdTFH+JRUhWCleB
         mUFzBe8nHiA6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AD8F0C433E4; Mon, 19 Sep 2022 09:01:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216204] ideapad-laptop: Testing for DYTC platform-profile
 support
Date:   Mon, 19 Sep 2022 09:01:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-216204-215701-uafrtzKjVj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216204-215701@https.bugzilla.kernel.org/>
References: <bug-216204-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216204

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g
         Resolution|---                         |ANSWERED

--- Comment #1 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Sorry for the slow reply.

Note the kernel now allows enabling V4 DYTC support from the kernel
commandline, by passing: ideapad_laptop.allow_v4_dytc=3D1 on the kernel
commandline.

As for testing this:

1. Pass the kernel cmdline parameter
2. Check that switching the profile in GNOME results in the contents of
   /sys/firmware/acpi/platform_profile changing
3. Run a heavy workload, e.g. a make -j8 kernel compile
4. Monitor the power-consumption in powertop (while running from battery)
5. Change the profile

Step 5. should then result in significant changes of consumed power (this m=
ay
take some minutes to register).

Without platform_profile support the GNOME setting only changes the pstate
governer  profile, so things will ramp up slower. The actual platform_profi=
le
setting should change the RAPL values / should change the maximum energy
consumption (programmable TPD) of the processor.

Note that this may only take effect when combined with running thermal-prof=
iled
with the experimental Intel DPTF support enabled.

Since there is not really a bug to fix here I'm going to close this bug rep=
ort
now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
