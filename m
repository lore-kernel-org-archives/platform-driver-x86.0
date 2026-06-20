Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B901341650
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781946980; cv=none; b=KfUA56+JHqSqO7Rin+OtXAVbMDwFGyM5uzIHtraHucEnXltb/OwVs5ka4FSq/Xf3otHj9n1oXFffN++zMv+HDIaF7qiaeCEc81z9cNjlCE5cA2rENLtca2atzUQGS93DNXTqJvywZCyBjlpyrYnf/kQjUxJCnm1LGjXA2CYz+Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781946980; c=relaxed/simple;
	bh=fiVRMuXe0peeVNX0ucB1QWC2y4uvOqhCduasZ1Gnxqs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RpstjlJC1p6kYxdsr5rGmXBsATK32iyEuvTph5g2pWlN42fKrQX0btvO9EG5Kqp6wEiewnuGRO2tBUHSeXR7HaQRh5ymXxyoO13shmkfDat/B0jmka5H563gWFY6s1J37dPC3Ru9KGGqP11w+8/4ub+L6HwRyoc0VzChwV4yl/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aH3qj5+U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aH3qj5+U"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F849C2BCB0
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Jun 2026 09:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781946979;
	bh=fiVRMuXe0peeVNX0ucB1QWC2y4uvOqhCduasZ1Gnxqs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aH3qj5+U9L0bY0rfYslNhDb9kXgiRURLuLSzSzaVp49pcRSjU/21nGIvT94wBeTEf
	 7lFYB+E5NUqRviSHzBPxIQ9Jz4Fq/OAeyiDbwbefpuPrjHmX/DrvQNaSNLJopuq/Cq
	 To7ehwrhCp1yplMBWqC8X5e4n6/L7SnGrcvRAt5c7bB4OxFUQZW69vIdObmCnpYQhY
	 ga0S3mxzJcyk5stVU0IRaPv7p4dm2sqaDWRT8kd2GDxQI2VtRLdBrZDEDRT8GXsmE1
	 51rLfbF8DLVGOqkvQHLCijDozKdM31EX/BDPjTHf62vBd1drsfS0vleT+S5D8AJzWF
	 cUOvKp7bPRWxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 85368C4160E; Sat, 20 Jun 2026 09:16:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221569] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kerenel
Date: Sat, 20 Jun 2026 09:16:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: moravec@ukf.sk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221569-215701-L0QA28G3lI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221569-215701@https.bugzilla.kernel.org/>
References: <bug-221569-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221569

--- Comment #29 from Milan Oravec (moravec@ukf.sk) ---
I thank you so much! It works again! Do you know what is this?

j=C3=BAn 20 10:59:56 migo-HP kernel: hp_wmi: Unknown event_id - 131073 - 0x0
j=C3=BAn 20 10:59:56 migo-HP kernel: hp_wmi: Unknown event_id - 131073 - 0x0

my system is plaguing gpu gangs, but I don't know how to trigger it to bise=
ct
it, can it be related?

I've reported it here:

https://gitlab.freedesktop.org/drm/amd/-/work_items/5382

here is relevant part of the syslog:

j=C3=BAn 20 10:48:37 migo-HP kernel: PM: hibernation: hibernation entry
j=C3=BAn 20 10:59:56 migo-HP kernel: Filesystems sync: 0.012 seconds
j=C3=BAn 20 10:59:56 migo-HP kernel: Freezing user space processes
j=C3=BAn 20 10:59:56 migo-HP kernel: Freezing user space processes completed
(elapsed 0.001 seconds)
j=C3=BAn 20 10:59:56 migo-HP kernel: OOM killer disabled.
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x00000000-0x00000fff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x0009f000-0x000fffff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x09b00000-0x09dfffff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x09f00000-0x09f3bfff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x65b05000-0x65b0ffff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x67a48000-0x67a4cfff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x6a3a9000-0x6a3a9fff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x6a482000-0x6a5acfff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x73c5f000-0x79ffefff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Marking nosave pages:=
 [mem
0x7a000000-0xffffffff]
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Basic memory bitmaps =
created
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Preallocating image m=
emory
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Allocated 1054168 pag=
es for
snapshot
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Allocated 4216672 kby=
tes in
0.50 seconds (8433.34 MB/s)
j=C3=BAn 20 10:59:56 migo-HP kernel: Freezing remaining freezable tasks
j=C3=BAn 20 10:59:56 migo-HP kernel: Freezing remaining freezable tasks com=
pleted
(elapsed 3.018 seconds)
j=C3=BAn 20 10:59:56 migo-HP kernel: printk: Suspending console(s) (use
no_console_suspend to debug)
j=C3=BAn 20 10:59:56 migo-HP kernel: queueing ieee80211 work while going to=
 suspend
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.0:
Asserting Reset
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: EC: interrupt blocked
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: PM: Preparing to enter system sl=
eep state
S4
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: EC: event blocked
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: EC: EC stopped
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: PM: Saving platform NVS memory
j=C3=BAn 20 10:59:56 migo-HP kernel: Disabling non-boot CPUs ...
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 15 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 14 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 13 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 12 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 11 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 10 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 9 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 8 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: Spectre V2 : Update user space SMT mit=
igation:
STIBP off
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 7 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 6 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 5 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 4 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 3 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 2 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: CPU 1 is now offline
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Normal pages needed: =
1258377 +
1024, available pages: 6938971
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: PM: Restoring platform NVS memory
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: EC: EC started
j=C3=BAn 20 10:59:56 migo-HP kernel: AMD-Vi: Virtual APIC enabled
j=C3=BAn 20 10:59:56 migo-HP kernel: AMD-Vi: Virtual APIC enabled
j=C3=BAn 20 10:59:56 migo-HP kernel: LVT offset 0 assigned for vector 0x400
j=C3=BAn 20 10:59:56 migo-HP kernel: Enabling non-boot CPUs ...
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 1 AP=
IC 0x2
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU1 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 2 AP=
IC 0x4
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU2 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 3 AP=
IC 0x6
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU3 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 4 AP=
IC 0x8
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU4 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 5 AP=
IC 0xa
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU5 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 6 AP=
IC 0xc
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU6 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 7 AP=
IC 0xe
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU7 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 8 AP=
IC 0x1
j=C3=BAn 20 10:59:56 migo-HP kernel: Spectre V2 : Update user space SMT mit=
igation:
STIBP always-on
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU8 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 9 AP=
IC 0x3
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU9 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 10 A=
PIC 0x5
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU10 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 11 A=
PIC 0x7
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU11 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 12 A=
PIC 0x9
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU12 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 13 A=
PIC 0xb
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU13 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 14 A=
PIC 0xd
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU14 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: smpboot: Booting Node 0 Processor 15 A=
PIC 0xf
j=C3=BAn 20 10:59:56 migo-HP kernel: CPU15 is up
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: PM: Waking up from system sleep =
state S4
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: EC: interrupt unblocked
j=C3=BAn 20 10:59:56 migo-HP kernel: usb usb1: root hub lost power or was r=
eset
j=C3=BAn 20 10:59:56 migo-HP kernel: usb usb2: root hub lost power or was r=
eset
j=C3=BAn 20 10:59:56 migo-HP kernel: usb usb3: root hub lost power or was r=
eset
j=C3=BAn 20 10:59:56 migo-HP kernel: usb usb5: root hub lost power or was r=
eset
j=C3=BAn 20 10:59:56 migo-HP kernel: usb usb7: root hub lost power or was r=
eset
j=C3=BAn 20 10:59:56 migo-HP kernel: usb usb4: root hub lost power or was r=
eset
j=C3=BAn 20 10:59:56 migo-HP kernel: usb usb6: root hub lost power or was r=
eset
j=C3=BAn 20 10:59:56 migo-HP systemd[1]: Starting Load/Save RF Kill Switch =
Status...
j=C3=BAn 20 10:59:56 migo-HP kernel: usb usb8: root hub lost power or was r=
eset
j=C3=BAn 20 10:59:56 migo-HP kernel: ACPI: EC: event unblocked
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: [drm] PCIE GART o=
f 512M
enabled (table at 0x000000801FB00000).
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: PSP is resuming...
j=C3=BAn 20 10:59:56 migo-HP kernel: hp_wmi: Unknown event_id - 131073 - 0x0
j=C3=BAn 20 10:59:56 migo-HP kernel: hp_wmi: Unknown event_id - 131073 - 0x0
j=C3=BAn 20 10:59:56 migo-HP kernel: nvme nvme0: D3 entry latency set to 10=
 seconds
j=C3=BAn 20 10:59:56 migo-HP kernel: nvme nvme0: 16/0/0 default/read/poll q=
ueues
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: reserve 0x1100000=
 from
0x801c000000 for PSP TMR
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.1: DSP1:
cirrus/cs35l41-dsp1-spk-prot-103c8da8.wmfw: format 3 timestamp 0x64269d09
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.1: DSP1:
cirrus/cs35l41-dsp1-spk-prot-103c8da8.wmfw: Fri 31 Mar 2023 10:42:49 W. Eur=
ope
Daylight Time
j=C3=BAn 20 10:59:56 migo-HP kernel: mt7925e 0000:62:00.0: HW/SW Version:
0x8a108a10, Build Time: 20260414153001a
j=C3=BAn 20 10:59:56 migo-HP kernel: usb 3-2: WARN: invalid context state f=
or
evaluate context command.
j=C3=BAn 20 10:59:56 migo-HP kernel: usb 1-1: reset high-speed USB device n=
umber 2
using xhci_hcd
j=C3=BAn 20 10:59:56 migo-HP kernel: usb 3-2: reset full-speed USB device n=
umber 2
using xhci_hcd
j=C3=BAn 20 10:59:56 migo-HP kernel: mt7925e 0000:62:00.0: WM Firmware Vers=
ion:
____000000, Build Time: 20260414153105
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.1: DSP1:
Firmware: 400a4 vendor: 0x2 v0.65.0, 2 algorithms
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.1: DSP1:
cirrus/cs35l41-dsp1-spk-prot-103c8da8-spkid0.bin (v1): v0.65.0
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.1: DSP1:
spk-prot: C:\Users\tlu.AD\Desktop\HP_Consumer\CY25\Clipper_Piston\Official
release\20241101_RDL\HP_Clipper_103
j=C3=BAn 20 10:59:56 migo-HP kernel: usb 3-5: reset high-speed USB device n=
umber 3
using xhci_hcd
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: RAS: optional ras=
 ta ucode
is not available
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: RAP: optional rap=
 ta ucode
is not available
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: SECUREDISPLAY: op=
tional
securedisplay ta ucode is not available
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: SMU is resuming...
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.0: DSP1:
cirrus/cs35l41-dsp1-spk-prot-103c8da8.wmfw: format 3 timestamp 0x64269d09
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.0: DSP1:
cirrus/cs35l41-dsp1-spk-prot-103c8da8.wmfw: Fri 31 Mar 2023 10:42:49 W. Eur=
ope
Daylight Time
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: SMU is resumed
successfully!
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: [drm] DMUB hardwa=
re
initialized: version=3D0x09004700
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring gfx_0.0.0 us=
es VM inv
eng 0 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring comp_1.0.0 u=
ses VM
inv eng 1 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring comp_1.1.0 u=
ses VM
inv eng 4 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring comp_1.2.0 u=
ses VM
inv eng 6 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring comp_1.3.0 u=
ses VM
inv eng 7 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring comp_1.0.1 u=
ses VM
inv eng 8 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring comp_1.1.1 u=
ses VM
inv eng 9 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring comp_1.2.1 u=
ses VM
inv eng 10 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring comp_1.3.1 u=
ses VM
inv eng 11 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring sdma0 uses V=
M inv eng
12 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring vcn_unified_=
0 uses VM
inv eng 0 on hub 8
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring jpeg_dec_0 u=
ses VM
inv eng 1 on hub 8
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring mes_kiq_3.1.=
0 uses VM
inv eng 13 on hub 0
j=C3=BAn 20 10:59:56 migo-HP kernel: amdgpu 0000:63:00.0: ring vpe uses VM =
inv eng 4
on hub 8
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.0: DSP1:
Firmware: 400a4 vendor: 0x2 v0.65.0, 2 algorithms
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.0: DSP1:
cirrus/cs35l41-dsp1-spk-prot-103c8da8-spkid0.bin (v1): v0.65.0
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.0: DSP1:
spk-prot: C:\Users\tlu.AD\Desktop\HP_Consumer\CY25\Clipper_Piston\Official
release\20241101_RDL\HP_Clipper_103
j=C3=BAn 20 10:59:56 migo-HP kernel: wlo1: Driver requested disconnection f=
rom AP
00:00:00:00:00:00
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.1:
Calibration applied: R0=3D10080
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.0:
Calibration applied: R0=3D9682
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.1:
Firmware Loaded - Type: spk-prot, Gain: 17
j=C3=BAn 20 10:59:56 migo-HP kernel: cs35l41-hda i2c-CSC3551:00-cs35l41-hda=
.0:
Firmware Loaded - Type: spk-prot, Gain: 17
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: Basic memory bitmaps =
freed
j=C3=BAn 20 10:59:56 migo-HP kernel: OOM killer enabled.
j=C3=BAn 20 10:59:56 migo-HP kernel: Restarting tasks: Starting
j=C3=BAn 20 10:59:56 migo-HP kernel: Restarting tasks: Done
j=C3=BAn 20 10:59:56 migo-HP kernel: efivarfs: resyncing variable state
j=C3=BAn 20 10:59:56 migo-HP kernel: efivarfs: removing variable
HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67
j=C3=BAn 20 10:59:56 migo-HP kernel: Bluetooth: hci0: HW/SW Version: 0x0000=
0000,
Build Time: 20260414153243
j=C3=BAn 20 10:59:56 migo-HP kernel: efivarfs: finished resyncing variable =
state
j=C3=BAn 20 10:59:56 migo-HP systemd-sleep[7985]: System returned from sleep
operation 'hibernate'.
j=C3=BAn 20 10:59:56 migo-HP kernel: PM: hibernation: hibernation exit

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
