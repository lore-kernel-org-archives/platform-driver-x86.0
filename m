Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CD6C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 15:44:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CBB66194A
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 15:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbhCTPoR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:44:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:44348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229791AbhCTPns (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 11:43:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4CD5A61973
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Mar 2021 15:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616255028;
        bh=375WokOQrCC85OgtMFlHWG4ujQNrTREFNWWsn7A+IEY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cJJCitLu7ipWe3kki2Qg8dZJNEqYEPK7ruw4TC78vrUj2eFOyEu+5FCPJiygnEtjB
         GF7P5Lhnq8Z2OkD5fujy/N32T994YglEH5EQKRiBBOkNGl0ha+gPoZ1hOmmtrTAvVX
         SNPPOLqCAG5mLrKa6h+UaVxu7IdRv9xwkLSXHnvQ3nTDg7msv32HpFH7LEzxxoWlQI
         aZ5lRhrNN1yjextgPz/K//M487ydZW2zSWwVLum8HbjRdoxgAn2tW6CdS+4PrTxZWM
         EZokiKYWzy1Jv5BQyLlr1DxlV2voiIk+S6ni7mgJluRs5o+HGUzOfNu1ppBpOyvd2r
         +QgOpCpAo46HQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 20 Mar 2021 15:43:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-c2ixBRibRQ@https.bugzilla.kernel.org/>
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

--- Comment #44 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Artem S. Tashkinov from comment #42)
> "Your motherboard might not be exposing ACPI resources correctly, so you
> might
> not get access to your HW sensors. You could add
> "acpi_enforce_resources=3Dlax" to kernel boot parameters to enable monito=
ring
> at your own risk. Please refer to
> https://bugzilla.kernel.org/show_bug.cgi?id=3D204807 for more information=
".

This message will at least allow various Linux distros to enable the option=
 by
default because many are not aware of the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
