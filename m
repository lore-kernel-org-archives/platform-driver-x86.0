Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C351C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Feb 2021 09:21:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CC4C64F3A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Feb 2021 09:21:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhBZJVA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Feb 2021 04:21:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:41146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229990AbhBZJSw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Feb 2021 04:18:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 23B0964F24
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Feb 2021 09:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614331091;
        bh=dXdEbjZf7Oh9oHKXLyokwANjhLhr6KThg0em45RFg6U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=A/9RyIh/op+d8qntDY+6aM3o4jEVjcTJLvHYa8escXvVYPTygP2vBYPfEPTDP5y9W
         I0CAtaXt29UDbfmtO6tdlwQDQLcyoQBi4qndHJHuYy8TfLdeGebmLknL8ivdf44FKu
         qa9sHhE52ZuA1CNTkYKsUF5MRs4KbLZ2Q3wOSsPtwS1rGGwioUU/WVMMFTIp2ugbVq
         iNc/rrn4ScPpJ5qVRPXQCi3ojiFwavP34uj2+hDABGA8MjprXjGMeOWZ43tfGBz5oS
         zu4jYGx5NA+BoGMk+/YOHRxK9QxBvWaUlaWfWeyXbl90n43ZOtJj4fh6e7krlMjeOZ
         1C8TSH2FoFSSA==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211895] dell_wmi_sysman causes unbootable system
Date:   Fri, 26 Feb 2021 09:18:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pspacek@isc.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211895-215701-VUfcUta0ov@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211895-215701@https.bugzilla.kernel.org/>
References: <bug-211895-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211895

--- Comment #2 from Petr =C5=A0pa=C4=8Dek (pspacek@isc.org) ---
Panic reproduced also on Dell Latitude E5470/0MT53G, BIOS 1.23.3 08/04/2020
with kernel 5.11.1.

First log lines about WMI are:
wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control method not found
acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (f=
irst
instance was on PNP0C14:01)
acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9062910 (f=
irst
instance was on PNP0C14:01)

and then boot goes on for a second. Several processes cause stack traces to=
 be
printed, pointing all over the place. Blacklisting the module workarounds t=
he
problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
