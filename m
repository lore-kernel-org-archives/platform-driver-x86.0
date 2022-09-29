Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE68CC433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Sep 2022 23:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbiI2XwT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Sep 2022 19:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiI2XwT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 19:52:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9CF1162C4
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 16:52:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BC813B825AC
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 23:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ABD3C433D6
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 23:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664495535;
        bh=RSIglhPLgiu5rLQI3iR4LR5C6mNYU9UyLGu+mf043rk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Vr3vN9sD54yKMaTnmO+j0CUEB7OwmFiHaey6Vwqrc9nG6CPr+bXdBY61d2CqKImQT
         r1jkJ9BM8g/9dYeIzlu80rrpIC+V7SbsYzpTnD10eSXvrV+RfUmd85n7YAGPtrUMyS
         wN02ExFTnEpZiJx0aUGiZEticLUHAvy9WD00F86o89Y//Vf61C+oMYH/sFBzeCy5k2
         1meNrRuVCGxAN7xRPTzzgA759Uc3gGBusJDFBS++oor1DqAb2l27Q4qHthzg/udQVb
         0vfox2CSVVGg0Ca1MnbTYbPrREWNTncgygsW+CMHVsoBxsdhjoRSH+CeF72xQ+MzWX
         /jOfx0Y+npIxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3C6C6C433E4; Thu, 29 Sep 2022 23:52:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Thu, 29 Sep 2022 23:52:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-216516-215701-57xTkpWtTh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DOCUMENTED

--- Comment #27 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Compiled with all patches from comment #14, 1) and 2).

OK, I also sent that new idlemask patch I suggested to the mailing list for=
 the
future to make debugging easier.
https://patchwork.kernel.org/project/platform-driver-x86/patch/202209292150=
42.745-1-mario.limonciello@amd.com/

I don't have any evidence that the usleep_range() change helped in any way,=
 so
I won't send that for now.

If you discover that is required for good battery life on your side let me =
know
and I'll cleanup a more proper variation of it to send out.

> Here are the first results.

OK so the idle mask doesn't "change" from one time to another in any unexpe=
cted
ways to me.

> [   90.048438] PM: Triggering wakeup from IRQ 9
> [   90.048801] PM: Triggering wakeup from IRQ 1

When you see two IRQs like this; it's a firmware bug as described in the ot=
her
report I mentioned above.  HP will need to issue a new BIOS to fix this.

This is a laptop certified with Ubuntu (see
https://ubuntu.com/certified/202206-30367).  You should contact HP support =
and
ask them for a BIOS fix.

> [  332.466583] PM: Triggering wakeup from IRQ 9

When you're seeing these alone in the middle of the sleep it's because of t=
he
EC GPE firing to do $something.  In this case I believe it's the EC trying =
to
notify a new battery level.  Due to the above bug I mentioned I think these
together will "prevent" it from going back to the deepest state.

> That workaround works very well! Thanks :-)

Sure.  This is going to limit you quite a bit in terms of wakeup sources, b=
ut
IMO I think it's a worthwhile trade off for this problem.  You should hopef=
ully
be getting much better power consumption now over s2idle.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
