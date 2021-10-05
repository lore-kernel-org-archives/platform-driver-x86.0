Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B38FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 21:26:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D6F261159
	for <platform-driver-x86@archiver.kernel.org>; Tue,  5 Oct 2021 21:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236188AbhJEV2h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 5 Oct 2021 17:28:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235679AbhJEV2h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Oct 2021 17:28:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4D4C761175
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Oct 2021 21:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633469206;
        bh=twtk9xPoejAsc9waY/sx2uliTg14WrknOh5QeRBInO8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=a1Jh0/gjn0zSgstoyXQ9iB2QyoqfsrBsv1nrY116c6+BD91LeK6QSIOH63CCi74nr
         zg0UN+gigC1aKulSh0FZTXBmBODmnfz3/OVbLeVjtk0bmImRgH2k6k9M3Xs/surk3p
         Fz5Iry3pY13AXdnw6JpiXnwFTqkiuBpZsiK1GY1TMnf2unyx+34vVzzihFk45WJ+z/
         HiiHVEhXEB22kwFLCuAiXhfwlmQj3ByBNyQqwkFT3HxQMQLnuzWp8phF4ehSZ8uE72
         fGGYyyjRFkdh++M5XxbLV3F3XR3RQvXRC5Lu/Qy99XQ/x/YWD1R/B22BFcn2D97lvu
         v66sykaG9AJMQ==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Tue, 05 Oct 2021 21:26:45 +0000
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
Message-ID: <bug-204807-215701-wkPF3EpjIB@https.bugzilla.kernel.org/>
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

--- Comment #136 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
(In reply to Denis Pauk from comment #135)
> Both drivers have used same entry point and difference as I see that: old
> boards return some list of sensors with names,

There was a special WMI interface that reads all sensors, both from SIO and=
 EC,
kind implementing what you did for the nct driver and what is implemented in
the asus-wmi-ec-sensors, but done fully in the DSDT code.=20

> new one always returns zero as count of sensors

There is simply no that high-level WMI interface in the new boards.

> and requires some hardcoded list of sensors.

I now think the EC sensors are at the same registers for the old and new
boards.=20=20

> And list of old and new boards is not intersected.=20

Exactly! So half the driver will be a dead code anyway. Would it be better =
to
load only one of the small drivers? Also, for the old boards the nct6775 dr=
iver
will load and asus-wmi-sensors provides duplicate readings.=20=20
>=20
> As for me, when we have 30% of similar code better have one driver for bo=
th
> cases. Currently driver has 1126 lines.

The only shared code between those two is the HWMON interface functions, wh=
ich
is more or less the same for many HWMON drivers.=20

So, would it be simpler to provide 3 drivers: nct6775, asus-wmi-sensors,
asus-wmi-ec-sensors?

> Do you like to be in MAINTAINERS list?

Yes, please. I still have work to do with that (even not all available sens=
ors
are discovered yet).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
