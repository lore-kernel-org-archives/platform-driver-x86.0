Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BBE27A91D
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 01:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784164433; cv=none; b=KqoOJ/Fj9L1DynGJ1JjBQ1l+05fJO3livU5JjlgVvkC/B79wgyHfA99ldshDxmL4F4j4GskFUjzgDv9bXhfQ2G5jRM/x3UafZbgl3R9VUfeZ5Ht5JDFN+HyuyWLeAdwA+u7kWwnwiSay+ToipDUZVmmHVTq/pYoewlUGX3Nak4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784164433; c=relaxed/simple;
	bh=hJ2QWzblJW+aKKgkxbFWrhlvdcToNUcpu5yPh8OXZ5A=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Jz4i8Ewcecn9IMxiy1zTVImWnHrrXf61guLNpBz9bjlf4zbA1Y5xqsbzK4TDYMUV95xGYFUX0vg0aP433mY6+6rQ2KX74/FmsoTBLShayOvVyBhq08iASXq5B+fPcN82yum+WrLwM+NbH0ffv4Z8r0Bnj+45T/YOIDMkvu7hfD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u8h8y0x/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u8h8y0x/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E247C19425
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 01:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784164433;
	bh=hJ2QWzblJW+aKKgkxbFWrhlvdcToNUcpu5yPh8OXZ5A=;
	h=From:To:Subject:Date:From;
	b=u8h8y0x/9JKU9U8/bE3w/gwpT4i0Z6c/hFcIc1Uiwy0BI2ah7LgwDWWGRWJoyn8oA
	 GoXJb0xGDtuW/UdN1IVu6FFn3QMqMt+8YC35kt+NEpGwjOCeXXbnleUFrpGYPh7WGm
	 Gnh8XRlxmW9gBG678arLJ628Zw0rPaNtuhza6c0K9Qf7KonJxSf/YcdYBwCSiFhBwA
	 5NK5q/eo1m3021vUfUSRuF+sHbBuAvPXyRbNvO0EAIkfOQjfrFJe9BQWdlhKoxXvp5
	 Lv/cRdub3oartNNHA5xHTcs9LG+Vo4SOzvEPUriBS0H7mdJ4Ng7wvzmKvOkooi6B3T
	 1Dfn6yng+R/bQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0BBD9C3279F; Thu, 16 Jul 2026 01:13:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221755] New: amd_pmc: ThinkPad T14 Gen 2 AMD machine type 20XL
 missing from s2idle quirk list - intermittent ~10s resume from s2idle
Date: Thu, 16 Jul 2026 01:13:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ywc8891@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 cf_regression
Message-ID: <bug-221755-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D221755

            Bug ID: 221755
           Summary: amd_pmc: ThinkPad T14 Gen 2 AMD machine type 20XL
                    missing from s2idle quirk list - intermittent ~10s
                    resume from s2idle
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: ywc8891@gmail.com
                CC: mario.limonciello@amd.com
        Regression: No

Hardware: Lenovo ThinkPad T14 Gen 2a, machine type 20XLS41C00
(DMI product name "20XLS41C00"), Ryzen 5 PRO 5650U (Cezanne),
BIOS R1MET62W (1.32, 2025-06-26), Samsung PM9A1-class NVMe.
Kernel: 6.12.95 (Debian 13); also verified missing in current mainline.

The ThinkPad T14 Gen 2 AMD was sold under two machine types, 20XK and
20XL. The s2idle quirk list in drivers/platform/x86/amd/pmc/pmc-quirks.c
(originally added in 455cd867b85b, "platform/x86: thinkpad_acpi: Add a
s2idle resume quirk for a number of laptops") only matches 20XK, so on
20XL machines the quirk never applies (no "Using s2idle quirk" message
at probe) and the firmware SMI handler runs on the NVMe D3->D0
transition when exiting suspend-to-idle.

Symptom: with IOMMU translation enabled (default), resume from s2idle
intermittently takes ~10 seconds. With /sys/power/pm_print_times
enabled, seven devices across three PCIe root ports all stall in
pci_pm_resume_noirq for ~10.25s and are released at the same instant
(consistent with all cores held in SMM):

    snd_hda_intel 0000:07:00.6: PM: pci_pm_resume_noirq returned 0 after
10257983 usecs
    snd_hda_intel 0000:07:00.1: PM: pci_pm_resume_noirq returned 0 after
10247499 usecs
    snd_rn_pci_acp3x 0000:07:00.5: PM: pci_pm_resume_noirq returned 0 after
10258065 usecs
    xhci_hcd 0000:07:00.4: PM: pci_pm_resume_noirq returned 0 after 10258121
usecs
    xhci_hcd 0000:07:00.3: PM: pci_pm_resume_noirq returned 0 after 10258198
usecs
    xhci-pci-renesas 0000:06:00.0: PM: pci_pm_resume_noirq returned 0 after
10247641 usecs
    nvme 0000:01:00.0: PM: pci_pm_resume_noirq returned 0 after 10247719 us=
ecs

This is the same firmware bug the existing quirk addresses for 20XK and
siblings, and the same class of omission as 9a469c6dfab3
("platform/x86: thinkpad_acpi: Add missing T14s Gen1 type to s2idle
quirk list").

Verification: I built amd-pmc with the attached one-entry patch adding
DMI product name "20XL" (mirroring the 20XK entry). On load the driver
reports:

    Using s2idle quirk to avoid T14 Gen2 AMD platform firmware bug

and a subsequent 14-hour suspend resumed in ~1s with no noirq stalls,
where previously even ~8-minute suspends could hit the ~10s delay.

A further two-day soak test with the patched module (short ~5-minute
naps and two separate ~14-hour overnight suspends) showed every resume
completing in ~1s with no pci_pm_resume_noirq stall on any device.

Patch attached. Signed-off-by/Tested-by: Yap Weei Choong <ywc8891@gmail.com=
>.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
