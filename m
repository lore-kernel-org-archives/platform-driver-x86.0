Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B33C433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 00:14:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AD296124F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 15 Sep 2021 00:14:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235838AbhIOAPU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Sep 2021 20:15:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:57744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229520AbhIOAPU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Sep 2021 20:15:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 628E96121E
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Sep 2021 00:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631664842;
        bh=Mo7KhGPjoDFJx4hX+hKSRUo2w18fjU5jdbDjjUZlj9c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JtezgAcChpbD9tLj/wvv6bXR0CMjwYKUuujCKbH7k/HzNoINZhNOO/Pc/E9BDBzBa
         UDv1X0Pq9XwUizo7mAQi0UPqqAx4mjtWkFpO3MpeJmeRlYs8zf2Nuv3g8kqR8hSlt8
         IN3dTKyCZykebcshJaMbCATuD7k7T60T2k6uawtDyYbnIyKJIKKwPrWpfUfsCpDEyw
         r4IqQzo1lUWPkgHGoHEhtg3tcvuWVgF1py0wvLCE6Lf9tw61o6Ta1Ut3388DqCXe1X
         d5DTiAZLBgERwn55R3w+CpXFKpyQJqbAVIE5QDhAhFJszKdx8jvemX4ZExbJshdk7O
         X2fQkpNsx9dVw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Wed, 15 Sep 2021 00:14:01 +0000
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
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-MS9qOHptQ5@https.bugzilla.kernel.org/>
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

--- Comment #111 from Eugene Shalygin (eugene.shalygin@gmail.com) ---
Most of these boards, as you probably know already, seem to not provide
readings for all the available sensors via the Nuvoton chip. For example, w=
ater
temperature sensors are unavailable. Readings from those sensors are availa=
ble
via the embedded controller registers. Thus I created a little HWMON driver=
 [1]
to read them using WMI method 'BREC' (probably stands for Block Read Embedd=
ed
Controller). The driver currently supports only three boards (ROG Crosshair
VIII Hero, ROG Crosshair VIII Dark Hero, ROG STRIX X570-E GAMING). ROG
Crosshair VIII Formula should not differ, but need someone with the hardwar=
e to
test.

While working on these sensors for the Libre Hardware Monitor project, we f=
ound
that the Nuvoton 6798D chip provides sensors readings for configured in the
BIOS QFan sources in its registers [2]. Maybe those are worth displaying wi=
th
the nct6775 driver? They can include sensors that are otherwise are availab=
le
from the embedded controller only.

If you want to add support for your boards, feel free to submit patches to
either project (and notify me to update the driver for HWMON from LHM if
needed, please).

[1] https://github.com/zeule/asus-wmi-ec-sensors
[2] https://github.com/LibreHardwareMonitor/LibreHardwareMonitor/issues/533

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
