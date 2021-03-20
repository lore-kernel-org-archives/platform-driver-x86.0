Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD180C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 12:14:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A88E6196D
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 12:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhCTMOM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 08:14:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:36920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229596AbhCTMNn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 08:13:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7DB18619A2
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Mar 2021 07:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616224967;
        bh=QDlBHpJF6nFaw5/AlAhnL7vyb4jc5PeVfdLuZV5ox/Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WaP9QZlocovejq9qU1673YoZ2esiexzUyH86AvxUK2NQGGeQpbPFC8/tQ4tAudT5I
         8BLHTNxbxlAdsZZd/TIccfHhg3bkhAlrneHrGBJFpPofw/gqgWEZoFZv/mhQsUJ949
         x9uGevMZLD6DiwyHE0l480h1nVC0v5ClsBMbhqz9HjjDH2w/8nbD7Ji6mnwm6Phzc2
         8KPeFiM6ilHKkK5hn8gGIlYfspGQLLleYhvHJJoNN/cwk5Xo18+eauUkFjjwiSEJwK
         u3ny/LOtzpZCr9N5myxJq6JzeCGFg2SeVARPZrnsknDS5URf36D4lE+WxOVbPGwlE+
         lWe3LM+k4vIzA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 20 Mar 2021 07:22:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaap.dehaan@freenet.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-Ee4nyFpdrL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #38 from Jaap de Haan (jaap.dehaan@freenet.de) ---
CONFIG_ASUS_WMI=3Dm andI confirmed the module is loaded.

I think I saw some improvements lastly in the support of temperature sensor=
s, I
am not so sure because I have no traces of the old state and it's a long ti=
me
ago I used the UI. I flashed my BIOS recently and hoped things would be sol=
ved
with that action.

Thanks a lot Matthew for this good explanation and for the first time I
understood (at abstract level) what is going on and why it is so. This
explanation is something really valuable to be kept and put in a prominent
place like kernel Documentation and a known issues text file (then a less a=
sus
specific explanation) IMO.

I was nearly as desperate to try to use the `acpi_enforce_resources=3Dlax`
setting but without understanding it is for me as an engineer something "ho=
t"
and now I really get why it is so, I will for my part keep my fingers away =
from
the setting and hope that someone will find out how to get the FAN values in
the normal driver.

Many thanks for the clarification.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
