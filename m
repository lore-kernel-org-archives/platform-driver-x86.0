Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EDDC433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri, 30 Sep 2022 00:37:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiI3AhV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Sep 2022 20:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiI3AhU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 20:37:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EC3A139BF7
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 17:37:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B844EB80D8B
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 00:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B3E0C433C1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 00:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664498236;
        bh=IrQWBJxGCcntMoMSK+v821GxwuzdFj03sZ9D7t8eNVc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OVpEJYj7xUbLXihFoJ6+PZRk9AR11RjRFs1gsMHeIyt/QZVHkqcWMma1sh5m1S12C
         4j5yyi+vMuWDAlTfQBz5NgjIyVNKWiN8BFCzwf45XlZenc00+q1F8fc+oPUfbSaof+
         CsRaxh9K1Z/F+oPQ9w8/Vu1MURnZU7ZeznDdKisotFOLcGV8JDM2iUvU05lZxmzXkj
         /+d+TcVxhRF5JjPWAxzStAS8MZwTccfzamtEchtN4m5r4vfMamSlcnSbGQwusHJy0P
         rbCeVTv66u5EDzf7QXcYLjeUa8uNfPAnXvx9eTdW4ie6WY86aLR8tBIMTO42UAC0gN
         GhpkganfAlgaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 45AC1C433E6; Fri, 30 Sep 2022 00:37:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Fri, 30 Sep 2022 00:37:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DOCUMENTED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216516-215701-P5ARBvNjrO@https.bugzilla.kernel.org/>
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

--- Comment #28 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 301897
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301897&action=3Dedit
kernel log for s2idle: v6.0-rc7 with bug 216516 comment #25 patches - 30
minutes of s2idle

(In reply to Mario Limonciello (AMD) from comment #27)
> [...]
> I don't have any evidence that the usleep_range() change helped in any wa=
y,
> so I won't send that for now.
>=20
> If you discover that is required for good battery life on your side let me
> know and I'll cleanup a more proper variation of it to send out.

I'll try to run some tests.
Just to get this right:
Is the usleep_range() patch about helping with the buggy interrupts?

Or is is about further lowering the power consumption below 2 % per hour?
(2 % per hour is the best I got until now, when the deepest state was active
all the time)




> > Here are the first results.
>=20
> OK so the idle mask doesn't "change" from one time to another in any
> unexpected ways to me.
>=20
> > [   90.048438] PM: Triggering wakeup from IRQ 9
> > [   90.048801] PM: Triggering wakeup from IRQ 1
>=20
> When you see two IRQs like this; it's a firmware bug as described in the
> other report I mentioned above.  HP will need to issue a new BIOS to fix
> this.

All tests where made with BIOS version 01.10.00 Rev.A (released 2022-08-09 /
build 2022-07-13)
This is the most recent BIOS version available.
https://support.hp.com/us-en/drivers/selfservice/swdetails/hp-elitebook-845=
-g8-notebook-pc/38492638/model/2100000127/swItemId/ob-294554-1?sku=3D5Z621EA
See "Revision history":
  Embedded Controller (EC), version 43.2D.00
  PSP Firmware, version 0.11.0.79
  SMU Firmware, version 64.61.0
  AMD GOP EFI Driver AMD GOP X64 Release Driver, version 2.16.0.17.10
  Cypress Power Delivery (PD) Firmware, version 0.7.0

I got no Windows installed. But I'm wondering how Windows is handling this
firmware bug?




> This is a laptop certified with Ubuntu (see
> https://ubuntu.com/certified/202206-30367).  You should contact HP support
> and ask them for a BIOS fix.

Does "certified with Ubuntu" mean HP is officially supporting it?
Or does this mean, that just Ubuntu says it's working?

I can try posting the HP support for HP support forum or calling the HP
business support hotline. But most of the it's quite hard to get real help =
from
them.
https://h30434.www3.hp.com/t5/Business-Notebooks/bd-p/General
Wouldn't it be better, if you - as official AMD employee - report this to H=
P!?




> > [  332.466583] PM: Triggering wakeup from IRQ 9
>=20
> When you're seeing these alone in the middle of the sleep it's because of
> the EC GPE firing to do $something.  In this case I believe it's the EC
> trying to notify a new battery level.  Due to the above bug I mentioned I
> think these together will "prevent" it from going back to the deepest sta=
te.

EC means "Embedded Controller"?
GPE means "General Purpose Event"?

Maybe I can more explicitly test if it's the battery level.
Removing the battery is possible. It's just a little more effort.
But instead I could fully charge the battery and put the notebook into s2id=
le
with AC power connected. In that case the battery level shouldn't change. S=
o no
event should happen, if I DON'T I press the keyboard, (un)plug the ac power=
 or
open/close the lid.


I attached another log:

System was in s2idle for 30 minutes without interruption (deepest state the
whole time). System was on battery power (no ac power connected). And comme=
nt
#25 (including comment #14) patches where applied. I just opened and closed=
 the
lid 30 seconds before waking the system using the power button. So the syst=
em
wasn't in deepest state of sleep.

A little more than 1 % of battery was consumed. And I'm wondering if this m=
ight
contradicts your theory, about the EC trying to notify about a new battery
level.




> > That workaround works very well! Thanks :-)
>=20
> Sure.  This is going to limit you quite a bit in terms of wakeup sources,
> but IMO I think it's a worthwhile trade off for this problem.  You should
> hopefully be getting much better power consumption now over s2idle.

I'm a late riser person. And I also like my notebook to stay asleep, unless=
 I
press the power button ;-)

So I'll go to bed now. And I'll also put the notebook on battery (no ac pow=
er
connected) and into s2idle with the ec_no_wakeup workaround enabled. So
tomorrow morning I'll see how much power it has consumed using the ec_no_wa=
keup
workaround :-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
