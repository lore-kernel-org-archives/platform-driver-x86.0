Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2E6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 13:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88AB261351
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 13:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhKEN7W (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 09:59:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231998AbhKEN7W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 09:59:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 65A7461283
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 13:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636120602;
        bh=DnY4t4Z+nz/BeS7UTjTuO6sz4JdJ3taBBz3v6VEUG9w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=klO9guvRyyIsvFpLo3Pj7CERBCR0f8JGASn+P29c9qKcUy+NKimt90OBAan8A1Ldb
         Grb3QO38XvZ/A0WQ4F6afghe5/I2s3KTcmrAoDpQtwySPi69/OfmzXDHpDJyziMr8Q
         +TpnqUP7V8HX2vuZnz5kazY0sd9UBQ+kjo54s2kiKB60GN0ITuQCNHUthxshCTbeAY
         oiJjBUrMNmimBBpNdwTYLQhoUF2lbNmOCgdoFXWSQuanNk08yslLxj17tPirREvrWa
         zXnPn8r9GYiJ/ohOga9KA09Bzm7r29Km0rHNJQ9oC2TMNeFtqgoSiKAQlOUQV21j9n
         Rw1ZRxtYVtYYA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 05 Nov 2021 13:56:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: eugene.shalygin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-dLubdM5xsG@https.bugzilla.kernel.org/>
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

--- Comment #152 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Olli Asikainen from comment #151)
> Created attachment 299459 [details]
> acpidump -b -n DSDT

This motherboard has totally different firmware, neither like the ones
supported by Denis patch, nor those supported by the asus-wmi-sensors drive=
r.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
