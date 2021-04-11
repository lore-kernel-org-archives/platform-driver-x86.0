Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0B9C433ED
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 10:18:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A64B961243
	for <platform-driver-x86@archiver.kernel.org>; Sun, 11 Apr 2021 10:18:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbhDKKSW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 11 Apr 2021 06:18:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:46738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229792AbhDKKSV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Apr 2021 06:18:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B7FB761206
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Apr 2021 10:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618136285;
        bh=eJU2UGacn0P8uogvUPNaiBc7cSD05vux28E0VVE4ScM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eoNQpWSmAX/+ZFLeOwUzbccMXlJpQXw+bfUyaGiTInPnzUw2pN8q+Hs06BV6SoX5k
         H19Dkvcj9mvJiIQ8B0yb/a4tcVszE6Zw+2VccXfxAD+rIfgXO++UYRWGvuzZKdjmYS
         HlxE0eK52xU5YJuAIyWsdP0NZAC42M6YB2wp9qgw9rdbTlx7hTCa+afjtnYi9ZxkXb
         L6Q4uabcl4fwpoh+JR9oSS6MiiHGw5gGD7TjruzBkZPMp5mlbXVREmQ8l4z1nnDeBL
         7tsLXlQKoVrQXFlKMkQmJ89a5L81ZnfJvGL6fvTcSIF/m6qlQvQCa0QiEPiemP4K6U
         2LXR5BQUrYUlQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 11 Apr 2021 10:18:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mat.jonczyk@o2.pl
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-kpQ6oVjkTl@https.bugzilla.kernel.org/>
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

--- Comment #57 from Mateusz Jo=C5=84czyk (mat.jonczyk@o2.pl) ---
(In reply to Hans de Goede from comment #56)
> Hmm,
>=20
> asus-wmi-sensors also is not such a great solution, it seems the WMI
> interface is buggy on some boards and causes fans to stop or get stuck at
> max speed, which is quite bad, see:
>=20
> https://github.com/electrified/asus-wmi-sensors#known-issues

IMHO, this could be caused by access races, not necessarily by a buggy BIOS.
The driver may simply not implement correct synchronization methods. It may=
 be
necessary to call some ACPI / WMI methods before and after accessing the
sensors to avoid resource conflicts.

As is written in the documentation:
> The more frequently the WMI interface is polled the greater the potential=
 for
> this to happen.

I am also not sure if the driver implements correct locking behavior
kernel-wise.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
