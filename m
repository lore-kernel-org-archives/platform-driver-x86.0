Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932E4C433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Sep 2022 23:30:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiI2XaB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Sep 2022 19:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiI2X37 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 19:29:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC6157216
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 16:29:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AAF7C621F2
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 23:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12A54C433D6
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 23:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664494196;
        bh=JbjaGOnTQ68wY18MGWQCpBSsCysFe7LuBukYenhaUTc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J4nZ52h4IXi4sA/QtZXxkFx2jZkgHkgwFVovq1WhoXYVAmDqY3HUMEmnH3gwl1okw
         W3UbeRwdwQ/8CLxGTAvkZIZyzFilz2XjAfVp5R2dF2TrAufcWKXL8ldhghJGfNCACG
         PVgfP3R031FMOwmwGLeXjO6vNT8JuCwE5ISlLTjMuiR5WC6tHfhJptc7bOHvZK+2+A
         ljFNqXTbZT4pwTFxFQ/s6aoj1NuJ2HH2DwVvzh0C8rc9+fcR2USfi2m0DtHUEw8DCI
         w4ARxuiG08A/P4aE+KABtcJ+3EcakeVwEcJrGdpLyOPFrFa9t01QbTlXhDKcE39yUE
         Wco8wT1qX1fNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E47D2C433E6; Thu, 29 Sep 2022 23:29:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Thu, 29 Sep 2022 23:29:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216516-215701-rVVgoOSVXC@https.bugzilla.kernel.org/>
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

--- Comment #26 from kolAflash (kolAflash@kolahilft.de) ---
Created attachment 301896
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301896&action=3Dedit
kernel log for s2idle: v6.0-rc7 with bug 216516 comment #25 patches

@Mario
Thank you for all the great help!!!




(In reply to Mario Limonciello (AMD) from comment #25)
> [...]
> Can you please do the following:
>=20
> 1) add right after the usleep_range() you added before this:
>=20
> amd_pmc_idlemask_read(pdev, pdev->dev, NULL);
>=20
> 2) Add
> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commi=
t/
> ?h=3Dbleeding-edge&id=3Dcb3e7d624c3ff34a300587929c82af7364cf5c09
>=20
> That will get us some more debugging information at least when this happe=
ns.

Compiled with all patches from comment #14, 1) and 2).

Here are the first results.

1. s2idle was without sysfs settings. System was woken by closing the lid.

2. s2idle was with sysfs settings (see log). Directly after sleep I (un)plu=
gged
the power, opened/closed the lid and pressed keys on the keyboard. System w=
as
finally fully woken by pressing the power button.

3. s2idle was with sysfs settings (see log). System was going to sleep while
the lid was closed. Lid was opened after about 18 seconds. System was fully
woken by pressing the power button.

I'll now do another test for at least 30 minutes. So we can see the power
consumption.




> [...]
> As a W/A can you have a try with acpi.ec_no_wakeup=3D1 on your kernel com=
mand
> line?  That should stop EC from issuing any wakeups and triggering this
> other firmware bug.

That workaround works very well! Thanks :-)

Didn't make any sysfs of procfs settings. Opening/closing the lid, pressing
keyboard keys and disconnecting AC power didn't wake the system. And the
"deepest state" log reported the full time being in that state, so it didn't
return from "deepest state" early.
I didn't have time to do a long time test with the ec_no_wakeup workaround.
Tested it for max. 90 seconds.
(workaround is not in the attached log)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
