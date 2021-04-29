Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1096CC433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Apr 2021 10:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C00956145E
	for <platform-driver-x86@archiver.kernel.org>; Thu, 29 Apr 2021 10:18:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238046AbhD2KSs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 29 Apr 2021 06:18:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:41420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233219AbhD2KSr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Apr 2021 06:18:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 355DC6145E
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Apr 2021 10:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619691481;
        bh=MP2LPORUuXZUtc1efloo8sBh+3fzO3hsmoUbp8CYNGU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=RXRZvPfL/EDU6vQmqU/gOIfVsI9SanDCTSysbILuEI7Ti27N5jKtnSor2kI1VfCRy
         dk7Pgql8QHA71qhAQKWDTRzcS5TDY8PXY/afA3opBaQnMkM/apGtOmAwmyjFyd0Byr
         /xBrY8wQCtdfPTFaX8/DWtJ6OgLB/XY2cHzYRlG4jxmd9NoycRtfb6p2qdirAVL9T2
         Nr2u582Q/ixzTd5ZmHtzHnYmNva8aIlCr2qE6IV5klABxrDSz2j3L3G1hsSiaeCJb3
         eYWPUvVco6HufezPQjF3h4R9w7z9LfhcVmOeRmiCYVp1NzAtMnp2iuq7uylSTbCePa
         fVQU486ImzrwA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 29 Apr 2021 10:18:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-NKeFpKQxz7@https.bugzilla.kernel.org/>
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

--- Comment #74 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
> Please also note that this patch only adds access via WMI for i/o port 0x=
295,
> while superio access is still using the "traditional" method.

Ah I missed that, yes that needs to be resolved before this is suitable for
upstream. Thank you for your work on this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
