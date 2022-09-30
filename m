Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9347C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Sep 2022 01:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbiI3BB3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Sep 2022 21:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiI3BBZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 21:01:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 761BE1F44DF
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 18:01:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1048B614DB
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 01:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7362AC433C1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 01:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664499682;
        bh=yys4VaKvtyQxtLU0rppAxfSPHb+AXB7lAK/Dh3CUAeA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pY6M9OZmTA3gdEPoW1DUwbrk/cnUFK5EdpUcXRr4D2ejRR/IwxKdTOB87pV53a+ep
         XVqc1iHEH+9cVZu/hv9cE0fr1lENui8MaIjL7+0y/stJIvwIQM7klUOgZvO0urVyfO
         n6A7Af184dkhkqApJP6MjRK6iAqB3udf1wk64ddNJ7un3zDl8jn5q2wUFdAPjWlU+c
         24OG98hSVbYL0vUlwaed6VXEVZe4rZUtwloqxMwhwrtdYAnlA057Y/jD0eDRsTDaak
         sDgGxuCNYxLXuP29XvTvGRpoiJYD1bdbOskzvyD5EI6kVmBMnlcXJar5yPdnNF5XwA
         buHKkSNXN8kUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 488C5C433E6; Fri, 30 Sep 2022 01:01:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Fri, 30 Sep 2022 01:01:22 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-0Q9QjASxXD@https.bugzilla.kernel.org/>
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

--- Comment #29 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Is the usleep_range() patch about helping with the buggy interrupts?
> Or is is about further lowering the power consumption below 2 % per hour?
> (2 % per hour is the best I got until now, when the deepest state was act=
ive
> all the time)

It's for trying to keep it in deepest state for more of the kernel's suspend
cycle when it has been interrupted. If you're already in the deepest state =
for
most of the suspend cycle it won't do anything.

>   SMU Firmware, version 64.61.0

This is the BIOS component with the bug.  The fix is in 64.66.0.

> I got no Windows installed. But I'm wondering how Windows is handling this
> firmware bug?

Windows does Modern Standby a little bit differently.

> Does "certified with Ubuntu" mean HP is officially supporting it?
> Or does this mean, that just Ubuntu says it's working?

I can't put words in their mouths on what it means for them.

> Wouldn't it be better, if you - as official AMD employee - report this to
> HP!?

I'm not their customer; you are.

> EC means "Embedded Controller"?
> GPE means "General Purpose Event"?

Yes

> A little more than 1 % of battery was consumed. And I'm wondering if this
> might contradicts your theory, about the EC trying to notify about a new
> battery level.

That amount of time in deep sleep matches how it should be behaving.  If th=
at
*wasn't* with acpi.ec_no_wakeup=3D1 then the usleep_range() change is helpi=
ng and
I should clean up and send a patch for it too.

But to your question, I don't have insight into the exact nature of what HP=
's
EC does; so I hypothesize.  I only know the AMD side of it.

> So tomorrow morning I'll see how much power it has consumed using the
> ec_no_wakeup workaround :-)

OK.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
