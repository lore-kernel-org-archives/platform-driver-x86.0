Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7737F346FAD
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 16:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779036324; cv=none; b=n2tEPjO3k/r2hXLR5zxXgss0YRz7mMHv3TshLYUoD4iyaVEJmLACTChKHvJWP7BybZeGShLzYkaw3SpsV1w4o5C16TApnNHwowHbEr/PDcgTyb+A8jrTVTj8lzOapOAJUL6vSBujfO9VKHqAf0JUH9cBEYeiFEk0+tA1+rqcX8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779036324; c=relaxed/simple;
	bh=BUQvC2Hwj/oYfAFiF6kBXUALQ8nR9z3n7/4zI0cNrFs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qJcWVDbFKndw6/VCcdd4yah9MItJg/GLs9v9I82tFpOA7YhzY1+copc8DISUkjJO3IkOZhYWQifXAZAAW3nK8qtj/MrTgtwxip3/xgEmrSvf4PbwPg18VwClkhnSPv0N3B1L7A84AuEtGoPjwSxq8CHZwavBQjbNvY7ImpIFTGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGhoLV2E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGhoLV2E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 084A9C2BCF7
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 16:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779036324;
	bh=BUQvC2Hwj/oYfAFiF6kBXUALQ8nR9z3n7/4zI0cNrFs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SGhoLV2EnFddd8Z1bhW7iZNhJxlEkLofldqOHyJgF3LCI6BAa967NsDdMUDfycVHU
	 HPAA7OdWKO72RUSS6569Fz9cpxx69BFswKU1x1WYVtd+IfajDMX7CvfHkSmhVMJrfi
	 ICeS+gV3uaUiT3+lSUzQSQKcX2rUL1wKVOmfV03uwJeqKEEZgxV714gjeUtfDUYnW8
	 VGVhdpHUsv85wC9TsCMN1wVSMde1L6sL8jC0+NVm1gEgqZgS8k5bZCI52Bjm2X5Eir
	 vWPCfHvBHVeE8Ah2AcsY6M5wgxCkJW2AshxUZOMflN9/O4TRRujpI0umdAcoc27BIO
	 D2LJAFIEeyjzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 00588C4160E; Sun, 17 May 2026 16:45:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 17 May 2026 16:45:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: i@rong.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-ziM28szF0Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221065-215701@https.bugzilla.kernel.org/>
References: <bug-221065-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D221065

--- Comment #85 from Rong Zhang (i@rong.moe) ---
(In reply to Rick from comment #84)
> (In reply to Rong Zhang from comment #83)
> > (In reply to Rick from comment #82)
> > > (In reply to Rong Zhang from comment #81)
> > > Using s-tui:
> > >=20
> > > Running in a standard terminal window results in it's graphs stopping
> > during
> > > the pause events but when it comes back it looks like the power usage=
 was
> > > reduced during the event.  This does not seem surprising as the entire
> GUI
> > > stops updating.
> >=20
> > Hmm, did it reduce by a little or a lot? And how about CPU frequencies?
>=20
> power usage when normal was around 3W and during the pause the graph drops
> to about 1/2 of normal.  I can't see any difference in CPU% or CPU freque=
ncy
> when the event happens.

That sounds like an unfortunate combination of FW and SW bugs. Still I am
unsure how such a combination can freeze applications other than Cinnamon, =
but
let's put this aside for now and focus on what was happening during the pau=
se.

>=20
> > > Running in a virtual terminal (the ones built into Mint using ctrl-al=
t-F1
> > > for a terminal and ctrl-alt-F7 to return to the GUI) I did not see any
> > > variation whatsoever while watching it through enough time for an eve=
nt
> to
> > > happen.  Power was lower than the test in a standard terminal window =
(I
> > > suspect because the GUI was not updating).  There were no pauses as y=
ou
> > > suspected.
> >=20
> > Just for confirmation, did the "unexpected charge_types" appears when u=
sing
> > VT?
>=20
> Sorry - was running kernel 6.17 which does not have messages.=20=20
> I re-tested with kernel 6.19
> When sitting in a virtual terminal that is running "dmesg -w" I see previ=
ous
> messages, but when I sit there for 10 minutes there were no additional
> messages.
> Conclusion: when sitting in virtual terminal there are no pauses and no
> messages.

Hmm, that's weird. Perhaps Cinnamon did not read power supply properties af=
ter
you switched to VT? Fewer ECMT consumers, fewer ECMT pressure.

>=20
> > GPU throttling may also lead to the same effects, which we can't rule o=
ut
> > yet. You can monitor GPU statistics with amdgpu_top's GUI, which provid=
es
> > graphs so that you can check them after a pause.
>=20
> Don't have time right now to figure out the proper way to install
> amdgpu_top, if it is needed I will have to come back to that.  Let me know
> if this becomes important to your investigation.

No, it's not very important to the investigation. That being said, you may
simply install its amd64 deb if you still want to mess around with it, as y=
our
distro is Linux Mint.

>=20
> > Yes, triggering magic sysrq to see stacktraces in dmesg during the pause
> > event is very helpful and reveals what's going on.
>=20
> On my laptop Fn-S is sysrequest so I am using keyboard commands for
> triggering - much easier than trying to setup SSH - thanks for suggesting
> this option!

Good to know that.

>=20
> in normal UI I do the following:
> open terminal and run "sudo sysctl kernel.sysrq=3D1" to enable the magic
> keyboard stuff and then "dmesg -w" so I can see kernel messages and copy =
them
> Use alt-(Fn-S)-l to trigger dump when pause happens - see following dump
> with the error message immediately following.

These stacktraces are very useful. Thanks a lot!

>=20
>=20
> [ 1874.345294] sysrq: Show backtrace of all active CPUs
> [ 1874.345318] NMI backtrace for cpu 4
> [ 1874.345325] CPU: 4 UID: 0 PID: 0 Comm: swapper/4 Not tainted
> 6.19.14-061914-generic #202604221411 PREEMPT(voluntary)
> [ 1874.345329] Hardware name: LENOVO 83JR/LNVNB161216, BIOS QXCN21WW
> 10/28/2025
> [ 1874.345333] Call Trace:
[..snip..]
> [ 1874.345543] Sending NMI from CPU 4 to CPUs 0-3,5-11:
[..snip..]
> [ 1876.209675] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fa=
st]
> and [Long_Life] are enabled

Hmm, nothing is running??? I didn't expect that.

I guess an ACPI method was sleeping (hence not running) with ECMT held, whi=
le
other methods were waiting for ECMT (hence also sleeping). Some ACPI method=
s do
poll and sleep with ECMT held, as I can see in the acpidump.

>=20
> On another pause:
> Use alt-(Fn-S)-w to trigger dump when pause happens
>=20
> [ 2357.204797] sysrq: Show Blocked State
> [ 2357.205074] task:upowerd state:D stack:0 pid:1910 tgid:1910 ppid:1
> task_flags:0x400100 flags:0x00080000

Oh, upowerd.

> [ 2357.205084] Call Trace:
> [ 2357.205089] <TASK>
[..snip..]
> [ 2357.205128] acpi_os_wait_semaphore+0x74/0x1c0
> [ 2357.205136] acpi_ex_system_wait_mutex+0xdf/0x140

\_SB.BAT0._BST is a "Serialized" method. Another process/thread was executi=
ng
\_SB.BAT0._BST, so this process must wait.

> [ 2357.205143] acpi_ds_begin_method_execution+0x21a/0x450
> [ 2357.205148] acpi_ps_execute_method+0x58/0x3e0
> [ 2357.205153] acpi_ns_evaluate+0x196/0x5e0
> [ 2357.205157] acpi_evaluate_object+0x20c/0x490
> [ 2357.205161] acpi_battery_get_state+0x96/0x220

acpi-battery was trying to execute \_SB.BAT0._BST.

> [ 2357.205170] acpi_battery_get_property+0x5c/0x410

acpi-battery was updating battery state (acpi_battery_get_state) when a pow=
er
supply property was read by userspace (acpi_battery_get_property).

> [ 2357.205173] __power_supply_get_property+0x6d/0x250
> [ 2357.205181] power_supply_get_property+0x13/0x30
> [ 2357.205185] power_supply_format_property+0xf6/0x3e0
> [ 2357.205188] power_supply_show_property+0x16/0x30
[..snip..]
> [ 2357.205338] </TASK>
> [ 2357.205458] task:cinnamon state:D stack:0 pid:2362 tgid:2362 ppid:2307
> task_flags:0x400000 flags:0x00080000

Oh, so Cinnamon was the process that was executing \_SB.BAT0._BST.

> [ 2357.205462] Call Trace:
> [ 2357.205464] <TASK>
[..snip..]
> [ 2357.205482] acpi_os_wait_semaphore+0x74/0x1c0
> [ 2357.205484] acpi_ex_system_wait_mutex+0xdf/0x140
> [ 2357.205486] acpi_ex_acquire_mutex_object+0x68/0x170
> [ 2357.205489] acpi_ex_acquire_mutex+0x8b/0x2d0

\_SB.BAT0._BST was waiting for ECMT.

> [ 2357.205490] acpi_ex_opcode_2A_0T_1R+0x173/0x1f0
> [ 2357.205492] acpi_ds_exec_end_op+0x1bb/0x960
> [ 2357.205495] acpi_ps_parse_loop+0x12e/0x770
> [ 2357.205497] acpi_ps_parse_aml+0xbe/0x5f0
> [ 2357.205498] acpi_ps_execute_method+0x172/0x3e0

acpi-battery was executing \_SB.BAT0._BST.

> [ 2357.205500] acpi_ns_evaluate+0x196/0x5e0
> [ 2357.205502] acpi_evaluate_object+0x20c/0x490
> [ 2357.205504] acpi_battery_get_state+0x96/0x220
> [ 2357.205507] acpi_battery_get_property+0x5c/0x410

Hmm, acpi_battery_get_state() has an internal cache. However, it was skippe=
d in
this case as two processes were executing it simultaneously, so they all pa=
ssed
the cache expiration check. Ideally, there should be a mutex to prevent this
dilemma -- I will find some time to write a patch for it.

> [ 2357.205509] __power_supply_get_property+0x6d/0x250
> [ 2357.205512] power_supply_get_property+0x13/0x30
> [ 2357.205514] power_supply_format_property+0xf6/0x3e0
> [ 2357.205516] power_supply_show_property+0x16/0x30

So both upowerd and Cinnamon tried to read all power supply properties upon
power supply events. Hmm, that's not optimal. Ideally, Cinnamon should util=
ize
upower instead.

[..snip..]
> [ 2357.205553] </TASK>
> [ 2357.205929] task:kworker/9:0 state:D stack:0 pid:4783 tgid:4783 ppid:2
> task_flags:0x4208060 flags:0x00080000
> [ 2357.205934] Workqueue: kacpi_notify acpi_os_execute_deferred
> [ 2357.205938] Call Trace:
> [ 2357.205940] <TASK>
[..snip..]
> [ 2357.205957] acpi_os_wait_semaphore+0x74/0x1c0
> [ 2357.205959] acpi_ex_system_wait_mutex+0xdf/0x140

\_SB.BAT0._BIX is a "Serialized" method. Another process/thread was executi=
ng
\_SB.BAT0._BIX, so this process must wait.

> [ 2357.205961] acpi_ds_begin_method_execution+0xb4/0x450
> [ 2357.205964] acpi_ds_call_control_method+0x9e/0x4a0
> [ 2357.205966] acpi_ps_parse_aml+0x3e6/0x5f0
> [ 2357.205968] acpi_ps_execute_method+0x172/0x3e0
> [ 2357.205969] acpi_ns_evaluate+0x196/0x5e0
> [ 2357.205971] acpi_evaluate_object+0x20c/0x490
> [ 2357.205974] acpi_battery_get_info+0x6a/0x260

acpi-battery's event handler was trying to execute \_SB.BAT0._BIX. Beforeha=
nd,
it had executed \_SB.BAT0._STA. Both need ECMT.

> [ 2357.205976] acpi_battery_notify+0x11a/0x150
> [ 2357.205979] acpi_ev_notify_dispatch+0x5b/0xb0

Hmm, an ACPI battery event was being handled.

> [ 2357.205982] ? _raw_spin_lock_irqsave+0xe/0x20
> [ 2357.205984] acpi_os_execute_deferred+0x1a/0x40
> [ 2357.205986] process_one_work+0x18e/0x370
> [ 2357.205991] worker_thread+0x188/0x320
[..snip..]
> [ 2357.206008] </TASK>
> [ 2357.206023] task:kworker/9:1 state:D stack:0 pid:8176 tgid:8176 ppid:2
> task_flags:0x4208060 flags:0x00080000
> [ 2357.206026] Workqueue: events power_supply_changed_work
> [ 2357.206028] Call Trace:
> [ 2357.206030] <TASK>
[..snip..]
> [ 2357.206045] acpi_os_wait_semaphore+0x74/0x1c0
> [ 2357.206047] acpi_ex_system_wait_mutex+0xdf/0x140

\_SB.PCI0.LPC0.EC0.VPC0.GBMD was calling \_SB.PCI0.LPC0.EC0.RDER, which was
waiting for ECMT.

> [ 2357.206049] acpi_ex_acquire_mutex_object+0x68/0x170
> [ 2357.206051] acpi_ex_acquire_mutex+0x8b/0x2d0
> [ 2357.206052] acpi_ex_opcode_2A_0T_1R+0x173/0x1f0
> [ 2357.206054] acpi_ds_exec_end_op+0x1bb/0x960
> [ 2357.206057] acpi_ps_parse_loop+0x12e/0x770
> [ 2357.206058] acpi_ps_parse_aml+0xbe/0x5f0
> [ 2357.206059] acpi_ps_execute_method+0x172/0x3e0
> [ 2357.206061] acpi_ns_evaluate+0x196/0x5e0
> [ 2357.206069] acpi_evaluate_object+0x20c/0x490
> [ 2357.206071] acpi_evaluate_integer+0x61/0x100
> [ 2357.206077] ideapad_psy_ext_get_prop+0x4e/0x120 [ideapad_laptop]

ideapad-laptop was executing \_SB.PCI0.LPC0.EC0.VPC0.GBMD.

> [ 2357.206082] __power_supply_get_property+0x1bc/0x250
> [ 2357.206085] power_supply_get_property+0x13/0x30
> [ 2357.206087] power_supply_format_property+0xf6/0x3e0
> [ 2357.206089] add_prop_uevent+0x41/0xf0
> [ 2357.206091] power_supply_uevent+0xe8/0x120
> [ 2357.206092] dev_uevent+0x10e/0x350
> [ 2357.206097] ? kobject_get_path+0x83/0xa0
> [ 2357.206103] kobject_uevent_env+0x327/0x500
> [ 2357.206105] kobject_uevent+0xb/0x20
> [ 2357.206106] power_supply_changed_work+0xcc/0x1b0

Oops, power_supply_changed() must have been called before, so there was ano=
ther
ACPI battery event that arrived earlier???

If this is the case, another kworker was probably handling another ACPI bat=
tery
event and thus executing \_SB.BAT0._BIX.

Multiple EC queries may notify BAT0... Hmm, more investigation needed.

> [ 2357.206107] ? __pfx___power_supply_changed_work+0x10/0x10
> [ 2357.206109] process_one_work+0x18e/0x370
> [ 2357.206111] worker_thread+0x188/0x320
[..snip..]
> [ 2357.206124] </TASK>
> [ 2360.256074] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fa=
st]
> and [Long_Life] are enabled

Eventually, \_SB_.PCI0.LPC0.EC0_.RDER timed out, causing
\_SB.PCI0.LPC0.EC0.VPC0.GBMD returned a malformed value, which resulted in =
the
warning message.

>=20
> Let me know if there is value in getting multiple versions of these and I
> will capture more.

Yes. I need more stacktraces. But the next time you capture them, please ma=
ke
two slight changes:

Please execute

  echo 'file drivers/acpi/ec.c +p' | sudo tee /proc/dynamic_debug/control

beforehand, so that I can see which EC queries arrive before the pause even=
t.

Please also spam magic sysrq until the pause finishes, so that I can see mo=
re
samples during the pause. In detail, you can press Alt (keep it pressed), p=
ress
Fn+S once (no need to keep them pressed), and quickly spam l and w alternat=
ely.
You can do some practice beforehand.

With these changes, your dmesg dump will be extremely long, so please uploa=
d it
as an attachment.

Thanks for being willing to investigate the issue together!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
