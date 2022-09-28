Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAA7C32771
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Sep 2022 16:57:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbiI1Q5i (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Sep 2022 12:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbiI1Q5h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2022 12:57:37 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B03D77566
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 09:57:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B499DB82174
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 16:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68EEFC433D6
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664384253;
        bh=KzNSUKDttHazycFcxG728mMi8OY2OJAGQ4IN44u3kjE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tPoRvrWpW3vMJR8D+31t2B4aGeisW3oboJzb52nKDD9NS7AXKSxtHE/iMBdCJ0CFq
         Es4IWkV6H/9yjdsYIrqy04NuPCGugo/+ywDJsn537X++U30nGoSSuk8oV29szQUyMF
         xqF2aAW85iK6uuCfhmV080JJGj/W9ypR/aGAgjnjznWsIDSVtB4JIlmlgU86p9An3i
         /OPqNIFYlOQjoiMxvkm5JZegGX4OoLOlxYvVJwEBgoG3P6xd/5HokKYDzUX2StZ6gR
         m4QtoP5kJIRNlY5AsSsAKe4tWxIj0OLIsmpkprP3+mOZJNiQj4fhYgGM6piYtqxNV6
         MO/0TFkzxKHMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4EE5EC433E6; Wed, 28 Sep 2022 16:57:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Wed, 28 Sep 2022 16:57:33 +0000
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
Message-ID: <bug-216516-215701-rcZ6vK0XIA@https.bugzilla.kernel.org/>
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

--- Comment #22 from kolAflash (kolAflash@kolahilft.de) ---
(In reply to Mario Limonciello (AMD) from comment #21)
> > --> And closing the notebook lid is what's waking the CPU!
> [...]
> > 1. Stay in deepest sleep state when closing the lid. (or immediately re=
turn
> > to deepest sleep)
>=20
> When you close the lid we need to know whether the kernel leaves the susp=
end
> loop or not.  If it didn't leave the suspend loop then my hypothesis is t=
he
> act of going into suspend and then closing the lid causes a Linux specific
> race condition that prevents going into the deepest state.  That's why I
> proposed by usleep_range patch.  It will only help with power consumption=
 if
> the kernel is still in the s2idle loop.

I don't fully understand what you want me to do now. Please clarify.

The logs I attached where made with a v6.0-rc7 kernel containing all patches
you mentioned in comment 14. Including the usleep_range patch.
Does these logs help you?


> > 3. Bring the s2idle power consumption further down below 2 % per hour.
>=20
> That last usleep_range patch is what I'm most interested in to fix this. =
 If
> you run a longer suspend, I suspect it might help with going to sleep from
> an EC triggered event for battery life notification.

So I should put the notebook to sleep for one hour, without closing the lid?

OK, I'll do
  sleep 10; systemctl start suspend.target
just before closing the lid.
(then put the notebook into my bag and go home from work)
(using the comment 14 patched kernel)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
