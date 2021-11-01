Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7BAC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 20:33:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31E7760F42
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Nov 2021 20:33:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhKAUg2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Nov 2021 16:36:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:47186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229560AbhKAUg1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Nov 2021 16:36:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1097060296
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Nov 2021 20:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635798834;
        bh=HkcoCOzQgVlzIlXcYDksjP8o7kDfsKZ6EnSqjJxtx/g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CbAf2UGLqGWXY9kJYZ4yPtbYWJA7e+KKrjPCqH6lTofNpjujC/42u0uaMi8nUPoS6
         jjBkS9xRedwma6slRX2izYhxEJfGevsHdmHprfiUJdgdodnObnTC7sNn3D0cJsUyLD
         alhaNi05Prn5dervizzFkjDxr9uCedBRgYznp1II23Obd/rpImviG9LqdVDRbU8KyM
         sVLWfj1hCVwKg8MSQi9nkM/nxQrEZIIFKs3YmU4EAzhYqR3aXUGQBsXKMdaiRtvtM4
         TQ7m9fxMrGg0vcvMg6GyikNnVUFDKrjlauxIHHXjrrr+0xMaTAM43fsr6RVqTg8ZmB
         0Tq55pjRlhAdw==
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: platform backlight device not working
Date:   Mon, 01 Nov 2021 20:33:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-6MI7cIJNfI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #3 from Johannes P (johannes.penssel@gmail.com) ---
I'm specifying my command line via kernel config, so for some reason, it sh=
ows
up in a separate message somewhat late in dmesg:

[    0.017237] Kernel command line:
crypt_root=3DUUID=3D2cf18008-b55c-4f5f-926b-5f92a588348a
root=3DUUID=3Dc890d077-9357-4996-94a3-811d6f477c89 i915.enable_guc=3D2
iwlwifi.power_save=3D1 iwlmvm.power_scheme=3D3
snd-hda-intel.power_save_controller=3D1 acpi_backlight=3Dvendor

Possibly of note as well is that I am able to write custom values into
/sys/class/backlight/ideapad/actual_brightness, which none of the other
interfaces allows.=20

ls -la /sys/class/backlight (with acpi_backlight=3Dvideo)
total 0
drwxr-xr-x  2 root root 0 Nov  1 21:28 .
drwxr-xr-x 79 root root 0 Nov  1 21:28 ..
lrwxrwxrwx  1 root root 0 Nov  1 21:28 acpi_video0 ->
../../devices/pci0000:00/0000:00:02.0/backlight/acpi_video0
lrwxrwxrwx  1 root root 0 Nov  1 21:28 acpi_video1 ->
../../devices/pci0000:00/0000:00:02.0/backlight/acpi_video1
lrwxrwxrwx  1 root root 0 Nov  1 21:28 intel_backlight ->
../../devices/pci0000:00/0000:00:02.0/drm/card0/card0-eDP-1/intel_backlight

I am afraid to report that booting with acpi_backlight=3Dvideo did not help=
 with
the brightness keys :(

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
