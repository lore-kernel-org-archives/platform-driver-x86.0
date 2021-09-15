Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F0DC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 10:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9AB5961283
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 10:02:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbhIOKEN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 15 Sep 2021 06:04:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:39516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232144AbhIOKEN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Sep 2021 06:04:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A2D561279
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Sep 2021 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631700174;
        bh=mLmFUzozUVuNwC3Cdp+jaPi0kbDLwcA/PYYDBXlNt5Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=l6D+I+MCV6ZDzdliloVp3+P/sk3C3VuMNG3JXejISxHAqWfQvzivlntcTCiO8rPUi
         mzgn/0Il8QSAqHI+nnD5QtUM+XZkkCv1Pdh+jBfLvKme5zYkUU08b0X1m5CsC6BKvZ
         J4Qk8WB1008x/HW7yVREYXW9LA6g573ZBPgemETCLHDcBr2aQ5GH1nVOk1xTpSY8t1
         gKI8kFxmcGrvQuWRLXolQqL5cYUnf2iH8tI+qTwCr1NLZ/M/U6GuRTe0p1XAK42JdC
         iphPazsu4tLFIZvYs9mL+btxXc3FS0EKk2roZH2/QYfxp5RPRqlR6zVRFphyprcEpD
         rO8QTPxeY6GlQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 15 Sep 2021 10:02:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: greenbigfrog@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-2OxAweGHP0@https.bugzilla.kernel.org/>
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

--- Comment #113 from Jonathan (greenbigfrog@gmail.com) ---
(In reply to Denis Pauk from comment #110)
> Created attachment 298805 [details]
> POC: Add support for access via Asus WMI to nct6775 with debug
>=20
> Add more debug information about what is wrong with match vendor/board na=
mes.
>=20
> (In reply to Jonathan from comment #109)
> > Created attachment 298799 [details]
> > dmesg for boot with Denis's patch applied
>=20
> Could you add your board to list and recheck?

This patch works, after adding "TUF GAMING X570-PLUS (WI-FI)".
(At first it didn't, but then I noticed I did forget the closing bracket on
"(WI-FI")

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
