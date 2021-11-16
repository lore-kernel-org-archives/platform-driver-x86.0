Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032D8C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 23:46:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFB2163223
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Nov 2021 23:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbhKPXtV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Nov 2021 18:49:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:60406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231377AbhKPXtV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Nov 2021 18:49:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4082E63227
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Nov 2021 23:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637106383;
        bh=ODHvOC0NqRwNrtVUMpGgWjdXIxQpsA58RSYIsJXeOkQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kKcq2ORVSpvflnPFBQAMXGJ253m+X9WulcPla366XLICHnUG5TWiUsOVZGJnY3V+P
         ej89d+fOSGFTLltGjy6V0LxHH8mgoE0OiPeAv2gGtQyd0watbw3MELRyYR1e9nGECV
         we7wQBRpZDrxNcaHGOfitNJiJgsGWNEl/b2fqoY5f/KVDLBEV/X9I2iv2i7Vy/KGFE
         j1xzKuoPipefxp5ADpDBb0pelTXJRRetv7jyoszFInT02IBx/0/k/VZ/jEWDDDUSRg
         qpH54kufc2f8NPoqFhklfFVC9SyKBJhvC3Cra62r5fCSw3+JQAO179qPH6jTii875B
         Xw/oIGvDEMRqg==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 201885] acpi PNP0C14:02: duplicate WMI GUID
 05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:01)
Date:   Tue, 16 Nov 2021 23:46:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marcel@ziswiler.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201885-215701-aUnbR3IQMz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201885-215701@https.bugzilla.kernel.org/>
References: <bug-201885-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D201885

Marcel Ziswiler (marcel@ziswiler.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |marcel@ziswiler.com

--- Comment #13 from Marcel Ziswiler (marcel@ziswiler.com) ---
Still there on first generation Lenovo ThinkPad T14 AMD (Ryzen 7 PRO 4750U
based) running 5.14.17-301.fc35.x86_64:

Nov 16 15:16:15 fedora kernel: acpi PNP0C14:01: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
Nov 16 15:16:15 fedora kernel: acpi PNP0C14:02: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
Nov 16 15:16:15 fedora kernel: acpi PNP0C14:03: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
Nov 16 15:16:15 fedora kernel: acpi PNP0C14:04: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)
Nov 16 15:16:15 fedora kernel: acpi PNP0C14:05: duplicate WMI GUID
05901221-D566-11D1-B2F0-00A0C9062910 (first instance was on PNP0C14:00)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
