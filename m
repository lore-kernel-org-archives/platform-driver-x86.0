Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C238AC433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 13:24:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94CDB6191F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 13:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230300AbhCVNYK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Mar 2021 09:24:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:39366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233467AbhCVNXF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 09:23:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 40DA461606
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Mar 2021 13:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616419384;
        bh=cxeJo1J3DUS9yQ+Hffw4s625qNOtN5Cd9dTjzygIEow=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ePLupvduGJfaE6iKaY0zJFOYMnkgemGtB9J5meN7sfO6j/splV/Typ8qUU6NlDrYe
         cm7F2NjCSF6wxsf0JTlUlFjxkwHG46Wv3F8TMNqY7zPq0W7KyWcJQ2pxWiLE9jXTVk
         6bYm7taxlSXNGNtd1qj+otvmhT6zAOkCDtdjpe96CjQ8duZErvB5fRqbuDTwCH1CHJ
         hQgugD/N4aYlHppaylNp36H79+yZFLAYBUrfbhubC4X8Pj2ZdMiUDJwUUkfMYxY7Zz
         KLZyYNQGckvtFruBHBjb1K5OVYyddWCIdFMHH5RZgkSqVv+503ur1DuSMhAltvbLVy
         S+Sx4Rdd/3Q4Q==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210457] Fan sporadically maxed on wake-up due to unavailable
 sensor temperature
Date:   Mon, 22 Mar 2021 13:23:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: s-cvhajmmblfsofmpsh@thorsten-wissmann.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210457-215701-GgGJhRYC5Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210457-215701@https.bugzilla.kernel.org/>
References: <bug-210457-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210457

--- Comment #7 from Thorsten (s-cvhajmmblfsofmpsh@thorsten-wissmann.de) ---
Probably it's the same issue. However, here we know that the main issue is =
that
the first entry of /proc/acpi/ibm/thermal is erronously -128 some (or most)=
 of
the time (so the fan is just a symptom, not the issue).

temperatures:   -128 -128 0 0 0 0 0 0 0 0 1 0 0 0 0 0

Iirc, the first entry is
/sys/devices/platform/thinkpad_hwmon/hwmon/hwmon*/temp1_input

(By the way, the second entry being -128 is fine)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
