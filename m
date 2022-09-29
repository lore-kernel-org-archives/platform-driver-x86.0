Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E13C433FE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Sep 2022 21:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbiI2VOq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Sep 2022 17:14:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiI2VOo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 17:14:44 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFE1F5D
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 14:14:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 344D3B8261E
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 21:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6A6EC433D6
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 21:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664486078;
        bh=E2Y2EKvdBAF3FKM0oIS8pKHMEoexql1SNan/EVkn+zo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=q2VHwzN/M2zURHamBl2liGBTQweBspMsH/NJ0b7YjxCsmmtagZN+0CIhg9RwsLFXW
         dPKtI+cNrBN9V4LP9RVD1/Dyj226nWNGpH6LZJVDiTSCmI1hlq1lYfW8ds9JGYvTdE
         WSMjUyLA9CxHZ2QfZPHhIECuHTk1CJWVeA4apI29giS7OfOfx18uqYkwbf58Nxbf0z
         gmw8NkVW63a7xkCd8q1BGvNEouk/AOKH0I9cD99PXSoYXjEGpdTB6QDw8HqYqUPA+R
         w0EK5UEqmIgAqKbKJBnF7Cd2BNzgmJhMtwN46n5m29SelAciD1GnPUcOzGa1GGHE8f
         ycldD7ngvspug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A2176C433E6; Thu, 29 Sep 2022 21:14:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Thu, 29 Sep 2022 21:14:38 +0000
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
Message-ID: <bug-216516-215701-wMEykfqGhv@https.bugzilla.kernel.org/>
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

--- Comment #25 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> So about 2.5 % of power (1.3398 Wh) was consumed.
> If the system was in perfect s2idle, this should have been less than 1% f=
or
> 23 minutes.
> Bug 2.5 % pretty much matches about 700 seconds of "bad" s2idle after the
> initial 700 "good" s2idle seconds in deepest state

Yup so what we're seeing here is that basically after an event comes in from
the EC waking up the SOC, it never goes back to sleep properly.  I suspect
there is some underlying firmware issue leading to that behavior.

Can you please do the following:

1) add right after the usleep_range() you added before this:

amd_pmc_idlemask_read(pdev, pdev->dev, NULL);

2) Add
https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/=
?h=3Dbleeding-edge&id=3Dcb3e7d624c3ff34a300587929c82af7364cf5c09

That will get us some more debugging information at least when this happens.

> I guess that the deepest state has been interrupted by the remnant of wha=
t=20
> completely wakes the system if i8042 and LNXSYBUS:00/PNP0C0D:00 are not
> disabled (see above).

I think you're right.  The underlying firmware issue is probably the same as
https://bugzilla.kernel.org/show_bug.cgi?id=3D215770

As a W/A can you have a try with acpi.ec_no_wakeup=3D1 on your kernel comma=
nd
line?  That should stop EC from issuing any wakeups and triggering this oth=
er
firmware bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
