Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F91EC433E0
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 04:22:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A95464F21
	for <platform-driver-x86@archiver.kernel.org>; Thu, 18 Mar 2021 04:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbhCREWJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 18 Mar 2021 00:22:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:42404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229454AbhCREVa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Mar 2021 00:21:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5F6B864F30
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Mar 2021 04:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616041290;
        bh=ImPh2+HP4LDCyE4rItsotilcDSwJZ4OFgPoAmbTGgjg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CO8e944mnLTwU2RnEhvqqLQDzlpUa+8l0Me1vkSug4SoUd8akcRT45PjxPfT+t8CG
         FBA4FymGXT0mokyxw0lTxxbgmlKXzFrzCnuoxAQaWurTW1er3p/V3CGdPpRkRyqLq1
         EsGa5g/maub3btyUy2X6fF66n12rBQXlLXYeD9w/rqU8D5T6Q/VYrVg/e6bpabsTQy
         /MBLgSFpsxbYbBbtPacAFi5X1irW/Uo1mlBYQsgP3D9UPzz8A7dgaq2B+tSRePDE6F
         +sgmUMIjIR0sIDGiqiQPHXAWrlarHCk7ruDc5vY1M0FnoN4yx5NYpKywp8AIsPxCmF
         M0XTWHHtE7ytg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 18 Mar 2021 04:21:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rui.zhang@intel.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-40jhEtyw8V@https.bugzilla.kernel.org/>
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

--- Comment #32 from Zhang Rui (rui.zhang@intel.com) ---
Reassign to platform driver category.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
