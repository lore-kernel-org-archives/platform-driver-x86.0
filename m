Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2D7C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Tue, 27 Sep 2022 13:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232525AbiI0NPv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 27 Sep 2022 09:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbiI0NPp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 09:15:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4B51182C
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 06:15:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C964F61986
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 13:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DB2FC433D6
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 13:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664284542;
        bh=6yfNrGUo4f7STzvmWi+cVWxgfmPRrq0QQz6h7JxAMQs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=IBu9fl0pTEKrz1F1ONOfu5J/Xnb4ejorkvkKjcd2mIg6HD1pXqLgdVsSXqjlKaZHq
         fyf12LciZZj66282rf+GaQ+K8E5LPgCipv1eq6WTQJYhsQwLMmoMd6NAbj4QMN8vAw
         uTvAJwWTFP5GuCtxs9Quh/QD9lgG20G4n9MZbQ7vUffmGTgB51cXGnGZZoyB18MB8i
         hp3mnWspnJSmDw7+z9BjarlYr9aQPkIZC+vagvTeS9J2zbNxQkcYHHDEyMHmKbUuWO
         2FSy7f0iX4FdFTBBCDzAFusU38kuQX3n0GcttIyREYNv+8G1hMTwHiK03a8p40Mzn1
         JlpTKluiMM9aw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0EB26C433E6; Tue, 27 Sep 2022 13:15:42 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Tue, 27 Sep 2022 13:15:41 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216516-215701-WLgeQc8wUj@https.bugzilla.kernel.org/>
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

--- Comment #15 from kolAflash (kolAflash@kolahilft.de) ---
I booted the Kubuntu-22.10 beta which comes with linux-5.19 (ran the live i=
mage
from USB storage). And the power consumption was at about 2 % per hour. The
kernel is pretty much the same to what I'm using with openSUSE, so in some =
way
the userspace must make a difference. At least in the way the userspace
configures the kernel via sysfs.

Then I went back to my openSUSE-15.4 system, running the linux-6.0-rc6 kern=
el I
compiled. And I disabled all sysfs wakeup triggers from userspace.
  find /sys/devices/ -type f -name wakeup -exec bash -c 'echo disabled > "{=
}"'
\;
And indeed, power usage went down to 2 % per hour! :-)
So should I open a bug for s2idle in openSUSE instead!?




I also tried other Linux distros a kernel >=3D 5.19. But I couldn't get the
s2idle power usage significantly below 2 % per hour. So S3 is still about 4
times better with around 0.5 % battery usage per hour.

Tomorrow I'm planning to do the debugging steps described by Mario in comme=
nt
#14.
So maybe with that the consumption can be brought further down for s2idle.

But I also still the idea of using S3 (especially because of the very low p=
ower
consumption).
---> So I'd still like to see a fix for the commit initially mentioned. Or
maybe not a fix, but a kernel command line option to disable that behavior.
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D7123d39dc24dcd21ff23d75f46f926b15269b9da

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
