Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8710C04A95
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Sep 2022 16:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233632AbiI1Qgh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Sep 2022 12:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233488AbiI1Qgc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2022 12:36:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CB5B56D9
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 09:36:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 158F6B820D1
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 16:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC978C433C1
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664382987;
        bh=SubKuDF8ep1o/yJh1NKZiuE40yYLG2fiJZ+3pvF8zHY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eDFiEkYW5IL3DTeTr+aZWQ52ZvPrJIXSGINiMn3CpH81YblTQhx2cgY42cRKNmUMN
         T7dLO9DyNdIyFZE2h06KOogXqfWfTZhlpDZwUzESiX1O0drfmsDPDigNfO4rFBFrIb
         B2EQnaPgdGpxTZgG/K7OQmSgqwFJX1gnYq2SjenjhBBVzL2IVunTTBBj5Ob7IUdjO5
         Yb2lGmm7y/MyNzwvYrmD1i4y9ghOy4xiA38l+GCaLDBP+lsi8lwnATL1rrkqdO9rtb
         KBkxK8Nn26WVqundg3VmATSBJL3cK0SgIDJYaby+WUuZp2brz9y6c6Hxo8IdmiN17J
         pbMasV2YEmuTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B2259C433E6; Wed, 28 Sep 2022 16:36:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Wed, 28 Sep 2022 16:36:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-CTgJ2XlSi4@https.bugzilla.kernel.org/>
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

--- Comment #21 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> --> And closing the notebook lid is what's waking the CPU!

Glad it's clarified what is going on.

> I did this and applied the mentioned patches. (4 commits + usleep_range
> patch)
> I closed the lod 22 seconds after s2idle started. Which matches exactly t=
he
> dmesg output:

OK good.

> 1. Stay in deepest sleep state when closing the lid. (or immediately retu=
rn
> to deepest sleep)

When you close the lid we need to know whether the kernel leaves the suspend
loop or not.  If it didn't leave the suspend loop then my hypothesis is the=
 act
of going into suspend and then closing the lid causes a Linux specific race
condition that prevents going into the deepest state.  That's why I propose=
d by
usleep_range patch.  It will only help with power consumption if the kernel=
 is
still in the s2idle loop.

> 3. Bring the s2idle power consumption further down below 2 % per hour.

That last usleep_range patch is what I'm most interested in to fix this.  If
you run a longer suspend, I suspect it might help with going to sleep from =
an
EC triggered event for battery life notification.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
