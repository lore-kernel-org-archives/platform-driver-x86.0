Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C696C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 29 Jun 2022 21:10:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbiF2VKm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 29 Jun 2022 17:10:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbiF2VKl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jun 2022 17:10:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F952CC90
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 14:10:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 64CBAB82739
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 21:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19377C341CB
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 21:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656537038;
        bh=1eO/OpxFqMuCEjsIKIZgzTpnQzYwq83mlqnSpy4LCO8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KW58jf8Y91uH20vfcT8DS0dwhxpOZsnp3/J/Grz9RRqX18+WmLlRooGiyRhGW3juO
         ltcqKTz/zfim+FFvHdPUGTHNxXus1v6VHIdbsiKD2mpqXtRdzaQA1/qyaGQDUe+Nzj
         es9RTQkGjy1fCURBzNYvITEgs4yHOsmcMAoy9NLZ6EfZ74TAEptDpQGBflXNkehq2u
         ySHlM2rSSvRX5IxUFeFj2DBA/V3kv2rW8ByuA6yaePYLStqrqaxydJXpp3y0fBRFjk
         9F8bgpX4g+ZpvKdC+YW2VnU1SEzL0bM7LpwCBVK+wwep8maiveCf8v4GGwdF9PrZuS
         diXtIOSpKvA/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EBC4FC05FD2; Wed, 29 Jun 2022 21:10:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date:   Wed, 29 Jun 2022 21:10:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216176-215701-AN9fXZk3zk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

--- Comment #7 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Barnab=C3=A1s P=C5=91cze from comment #6)
> My concern is that there is already a "charge_type" attribute which can t=
ake
> the "Fast" value among others: Unknown, N/A, Trickle, Fast, Standard,
> Adaptive, Custom, Long Life, Bypass.
>=20
> It might even make sense to wire up the so-called "conservation mode" to
> this attribute as well ("Long Life") .

That is a good point, although AFAIK that is more intended for charger-type
power_supply devices then for batteries...

Either way I think it is best to just write a proposal in the form of a
Documentation patch to Documentation/ABI/testing/sysfs-class-power and then
discuss this further on the mailinglist.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
