Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1778C4338F
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Aug 2021 23:24:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE94361350
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Aug 2021 23:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhHUXY6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 21 Aug 2021 19:24:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:42536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231150AbhHUXY5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Aug 2021 19:24:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BE06F6127C
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Aug 2021 23:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629588257;
        bh=hA4S/L0aL9Ha05r7nXCP/gPmBCmHKscAqWEggk5GTfY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=askY4kN49BHGj5IcDJOwqUmZZr9JHZEFRe2CO+w7N9dCq730Vul8AEiWbaQH9OqeD
         0ZzQ99lXNUrz04peuICHKnlqfeHnFywtdXnsgDq0z4azVbAHTRPNqN+u+7aDBu7FDw
         HXGFrSElfayti9FAURjIXpHiUGHnvArg8kVgbdBB65B2WjdVA5pVaxFaKSdyTsEltF
         +bMFniE5SdWWKSXpXV9F+/vwegIlKJWo6nowsy+eBx/GZZHuf0B/8SrQr+KAYhvsJL
         fdI907agEzMzSWCrelWgPpeG7KfsWJWDYpayhAShpC+WYsnNVc3I8hjj5bbQgvh+hy
         nP7rkkbkSCvJw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 21 Aug 2021 23:24:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-km68Cdm4pv@https.bugzilla.kernel.org/>
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

--- Comment #83 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Andy Shevchenko from comment #82)
>=20
> The best what you can do is to go to the mailing list and discuss it there
> with a respective maintainer.

Meanwhile this bug is not resolved and there's no (accepted) patch. The bug
status is wrong and misleading but I'm not going to argue :-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
