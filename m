Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE1D1D8E01
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 01:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778980333; cv=none; b=dAljFk+U9mS2YRgjGRXkDCqjvou+Omq2R6DKibac3tdrrzocvsCEX87hCrNFITwwkEQfHNgfVmq32lMlw2tscZreA2W38vMAZyi6IPfXmLVIGPna18rMwsyARmSvY1+b4tyukIytmvaHancvWL9Z2aGYqYoUGRjfYIRX8O1hE+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778980333; c=relaxed/simple;
	bh=S2yemSXObgtPGPZkMhPRvOTdqCU+Cp3rMNfWmzXjJUc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K33zOJjLacY+SikB3DTeZU3DjneFFZD0/shfG5H56pb5F6uPz9zWtcArcr7KF/UoEKaMcXoVPXMNXZ3yjrTP7Yk72GQKgcd1Lhh+LHQt8cOPjTNE8CoVap4olUQkLhpot+97zsAEabQ3U/sqLKeZ8EJcbyhFdzy+u6bMw/liHGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHWGTkjj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHWGTkjj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AD7EC2BCF5
	for <platform-driver-x86@vger.kernel.org>; Sun, 17 May 2026 01:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778980333;
	bh=S2yemSXObgtPGPZkMhPRvOTdqCU+Cp3rMNfWmzXjJUc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LHWGTkjjPHXFroN2EH37p30n1fDlpAVxtdJVkhaocFpwcEC5GO7/XYaCLWB4AttAS
	 dVhfisD17n//bpK+CLDf7oX34uPA1hfc3stI+DS8IMdiAGl2P5ZYSy/2odLwM7IRC1
	 UcN1bsuL5NgxwUG+tso8Ph6M/E1cnNN7/nZMnxgbcUnyuZ3JkRCKN+FY0FSTZDQtb6
	 X1MlvosMUR2AnnwG0sPjGjPmVp3Zci39Bivxu4Q6OaJs7gNby4n81zV+/u1jjameu7
	 KIYD/st2TG2Pg2fGtRBYuOmp7HhaHjNOqgLWImGJ6Gf/7N4ZKu4eEFo4uVrTClBPO2
	 s7nFnGMVNQN8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42EE8C53BC5; Sun, 17 May 2026 01:12:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 221065] ideapad_acpi: unexpected charge_types spam on Yoga Pro
 7 14ASP9
Date: Sun, 17 May 2026 01:12:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: rickk1166@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221065-215701-bdeZXCfoRq@https.bugzilla.kernel.org/>
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

--- Comment #84 from Rick (rickk1166@gmail.com) ---
(In reply to Rong Zhang from comment #83)
> (In reply to Rick from comment #82)
> > (In reply to Rong Zhang from comment #81)
> > Using s-tui:
> >=20
> > Running in a standard terminal window results in it's graphs stopping
> during
> > the pause events but when it comes back it looks like the power usage w=
as
> > reduced during the event.  This does not seem surprising as the entire =
GUI
> > stops updating.
>=20
> Hmm, did it reduce by a little or a lot? And how about CPU frequencies?

power usage when normal was around 3W and during the pause the graph drops =
to
about 1/2 of normal.  I can't see any difference in CPU% or CPU frequency w=
hen
the event happens.

> > Running in a virtual terminal (the ones built into Mint using ctrl-alt-=
F1
> > for a terminal and ctrl-alt-F7 to return to the GUI) I did not see any
> > variation whatsoever while watching it through enough time for an event=
 to
> > happen.  Power was lower than the test in a standard terminal window (I
> > suspect because the GUI was not updating).  There were no pauses as you
> > suspected.
>=20
> Just for confirmation, did the "unexpected charge_types" appears when usi=
ng
> VT?

Sorry - was running kernel 6.17 which does not have messages.=20=20
I re-tested with kernel 6.19
When sitting in a virtual terminal that is running "dmesg -w" I see previous
messages, but when I sit there for 10 minutes there were no additional
messages.
Conclusion: when sitting in virtual terminal there are no pauses and no
messages.

> GPU throttling may also lead to the same effects, which we can't rule out
> yet. You can monitor GPU statistics with amdgpu_top's GUI, which provides
> graphs so that you can check them after a pause.

Don't have time right now to figure out the proper way to install amdgpu_to=
p,
if it is needed I will have to come back to that.  Let me know if this beco=
mes
important to your investigation.

> Yes, triggering magic sysrq to see stacktraces in dmesg during the pause
> event is very helpful and reveals what's going on.

On my laptop Fn-S is sysrequest so I am using keyboard commands for trigger=
ing
- much easier than trying to setup SSH - thanks for suggesting this option!

in normal UI I do the following:
open terminal and run "sudo sysctl kernel.sysrq=3D1" to enable the magic ke=
yboard
stuff and then "dmesg -w" so I can see kernel messages and copy them
Use alt-(Fn-S)-l to trigger dump when pause happens - see following dump wi=
th
the error message immediately following.


[ 1874.345294] sysrq: Show backtrace of all active CPUs
[ 1874.345318] NMI backtrace for cpu 4
[ 1874.345325] CPU: 4 UID: 0 PID: 0 Comm: swapper/4 Not tainted
6.19.14-061914-generic #202604221411 PREEMPT(voluntary)
[ 1874.345329] Hardware name: LENOVO 83JR/LNVNB161216, BIOS QXCN21WW 10/28/=
2025
[ 1874.345333] Call Trace:
[ 1874.345336] <IRQ>
[ 1874.345343] show_stack+0x49/0x60
[ 1874.345356] dump_stack_lvl+0x5f/0x90
[ 1874.345361] dump_stack+0x10/0x18
[ 1874.345362] nmi_cpu_backtrace.cold+0x34/0x83
[ 1874.345364] ? vprintk_default+0x1d/0x30
[ 1874.345369] ? __pfx_nmi_raise_cpu_backtrace+0x10/0x10
[ 1874.345374] nmi_trigger_cpumask_backtrace+0x115/0x140
[ 1874.345381] arch_trigger_cpumask_backtrace+0x15/0x40
[ 1874.345383] sysrq_handle_showallcpus+0x1a/0x30
[ 1874.345390] __handle_sysrq.cold+0x23/0x167
[ 1874.345395] sysrq_handle_keypress+0x2d2/0x740
[ 1874.345398] ? sched_balance_find_src_group+0x52/0x2f0
[ 1874.345404] sysrq_filter+0x42/0xa0
[ 1874.345406] input_handle_events_filter+0x49/0xb0
[ 1874.345413] input_pass_values+0x168/0x190
[ 1874.345415] input_event_dispose+0x172/0x180
[ 1874.345418] input_handle_event+0x41/0x80
[ 1874.345420] input_event+0x51/0xa0
[ 1874.345422] atkbd_receive_byte+0x77e/0x8c0
[ 1874.345426] ps2_interrupt+0xa1/0x110
[ 1874.345429] serio_interrupt+0x4b/0xb0
[ 1874.345434] i8042_handle_data+0x189/0x370
[ 1874.345437] ? timekeeping_adjust+0x1e/0x180
[ 1874.345442] ? sched_balance_domains+0xd9/0x380
[ 1874.345445] i8042_interrupt+0x15/0x60
[ 1874.345447] __handle_irq_event_percpu+0x59/0x220
[ 1874.345452] handle_irq_event+0x36/0x80
[ 1874.345455] handle_edge_irq+0xd3/0x1a0
[ 1874.345459] __common_interrupt+0x50/0x160
[ 1874.345465] ? irq_enter_rcu+0x75/0x90
[ 1874.345469] common_interrupt+0xb0/0xe0
[ 1874.345476] </IRQ>
[ 1874.345476] <TASK>
[ 1874.345477] asm_common_interrupt+0x27/0x40
[ 1874.345481] RIP: 0010:cpuidle_enter_state+0xca/0x6a0
[ 1874.345486] Code: 00 e8 8a 32 e2 fe e8 35 ee ff ff 49 89 c5 0f 1f 44 00 =
00
31 ff e8 46 3c e0 fe 80 7d d0 00 0f 85 13 02 00 00 fb 0f 1f 44 00 00 <45> 8=
5 e4
0f 88 e3 01 00 00 4d 63 fc 49 83 ff 0a 0f 83 73 04 00 00
[ 1874.345488] RSP: 0018:ffffcef38021fe00 EFLAGS: 00000246
[ 1874.345492] RAX: 0000000000000000 RBX: ffff89e500e24000 RCX:
0000000000000000
[ 1874.345494] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
0000000000000000
[ 1874.345495] RBP: ffffcef38021fe50 R08: 0000000000000000 R09:
0000000000000000
[ 1874.345496] R10: 0000000000000000 R11: 0000000000000000 R12:
0000000000000003
[ 1874.345496] R13: 000001b467ae5fba R14: ffffffff857381a0 R15:
0000000000000003
[ 1874.345501] ? tick_nohz_stop_tick+0xe1/0x250
[ 1874.345507] cpuidle_enter+0x30/0x50
[ 1874.345513] call_cpuidle+0x21/0x50
[ 1874.345517] cpuidle_idle_call+0x16b/0x1f0
[ 1874.345521] do_idle+0x94/0xf0
[ 1874.345524] cpu_startup_entry+0x29/0x30
[ 1874.345526] start_secondary+0x125/0x180
[ 1874.345532] ? soft_restart_cpu+0x14/0x14
[ 1874.345538] common_startup_64+0x13e/0x141
[ 1874.345542] </TASK>
[ 1874.345543] Sending NMI from CPU 4 to CPUs 0-3,5-11:
[ 1874.345573] NMI backtrace for cpu 10 skipped: idling at io_idle+0x3/0x30
[ 1874.345580] NMI backtrace for cpu 2 skipped: idling at io_idle+0x3/0x30
[ 1874.345591] NMI backtrace for cpu 8 skipped: idling at io_idle+0x3/0x30
[ 1874.345599] NMI backtrace for cpu 1 skipped: idling at io_idle+0x3/0x30
[ 1874.345614] NMI backtrace for cpu 0 skipped: idling at io_idle+0x3/0x30
[ 1874.345625] NMI backtrace for cpu 6 skipped: idling at io_idle+0x3/0x30
[ 1874.345632] NMI backtrace for cpu 3 skipped: idling at io_idle+0x3/0x30
[ 1874.345646] NMI backtrace for cpu 9 skipped: idling at io_idle+0x3/0x30
[ 1874.345654] NMI backtrace for cpu 11 skipped: idling at io_idle+0x3/0x30
[ 1874.345669] NMI backtrace for cpu 7 skipped: idling at io_idle+0x3/0x30
[ 1874.345677] NMI backtrace for cpu 5 skipped: idling at io_idle+0x3/0x30
[ 1876.209675] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast]
and [Long_Life] are enabled

On another pause:
Use alt-(Fn-S)-w to trigger dump when pause happens

[ 2357.204797] sysrq: Show Blocked State
[ 2357.205074] task:upowerd state:D stack:0 pid:1910 tgid:1910 ppid:1
task_flags:0x400100 flags:0x00080000
[ 2357.205084] Call Trace:
[ 2357.205089] <TASK>
[ 2357.205096] __schedule+0x2ad/0x600
[ 2357.205109] schedule+0x27/0x90
[ 2357.205111] schedule_timeout+0xcf/0x110
[ 2357.205117] ___down_common+0xef/0x160
[ 2357.205120] __down_common+0x5a/0x150
[ 2357.205123] __down_timeout+0x16/0x30
[ 2357.205126] down_timeout+0x72/0x80
[ 2357.205128] acpi_os_wait_semaphore+0x74/0x1c0
[ 2357.205136] acpi_ex_system_wait_mutex+0xdf/0x140
[ 2357.205143] acpi_ds_begin_method_execution+0x21a/0x450
[ 2357.205148] acpi_ps_execute_method+0x58/0x3e0
[ 2357.205153] acpi_ns_evaluate+0x196/0x5e0
[ 2357.205157] acpi_evaluate_object+0x20c/0x490
[ 2357.205161] acpi_battery_get_state+0x96/0x220
[ 2357.205170] acpi_battery_get_property+0x5c/0x410
[ 2357.205173] __power_supply_get_property+0x6d/0x250
[ 2357.205181] power_supply_get_property+0x13/0x30
[ 2357.205185] power_supply_format_property+0xf6/0x3e0
[ 2357.205188] power_supply_show_property+0x16/0x30
[ 2357.205190] dev_attr_show+0x1f/0x60
[ 2357.205196] sysfs_kf_seq_show+0xca/0x130
[ 2357.205203] kernfs_seq_show+0x27/0x40
[ 2357.205206] seq_read_iter+0x130/0x4a0
[ 2357.205214] ? security_file_permission+0x5b/0x170
[ 2357.205221] kernfs_fop_read_iter+0x31/0x40
[ 2357.205224] vfs_read+0x270/0x3a0
[ 2357.205231] ksys_read+0x71/0xf0
[ 2357.205234] __x64_sys_read+0x19/0x30
[ 2357.205235] x64_sys_call+0x1dcb/0x2360
[ 2357.205242] do_syscall_64+0x81/0x5a0
[ 2357.205246] ? smp_call_function_single_async+0x22/0x50
[ 2357.205253] ? kick_ilb+0x10f/0x180
[ 2357.205259] ? sched_use_asym_prio+0x8c/0xe0
[ 2357.205262] ? sched_clock_noinstr+0x9/0x10
[ 2357.205267] ? update_load_avg+0x8e/0x420
[ 2357.205270] ? sched_clock_noinstr+0x9/0x10
[ 2357.205272] ? sched_clock+0x10/0x30
[ 2357.205278] ? raw_spin_rq_unlock+0x10/0x40
[ 2357.205281] ? rq_unlock_irqrestore+0x1f/0x50
[ 2357.205284] ? __note_gp_changes+0x1f3/0x270
[ 2357.205290] ? note_gp_changes+0x93/0xa0
[ 2357.205292] ? rcu_core+0x1b7/0x3f0
[ 2357.205295] ? rcu_core_si+0xe/0x20
[ 2357.205297] ? handle_softirqs+0xdf/0x330
[ 2357.205302] ? arch_exit_to_user_mode_prepare.isra.0+0xd/0x100
[ 2357.205308] ? irqentry_exit+0x97/0x5a0
[ 2357.205311] ? __irq_exit_rcu+0x45/0x120
[ 2357.205313] ? sysvec_apic_timer_interrupt+0x54/0xd0
[ 2357.205315] ? sysvec_reschedule_ipi+0x65/0x110
[ 2357.205317] entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 2357.205321] RIP: 0033:0x7e3a1351baca
[ 2357.205326] RSP: 002b:00007ffec83c8220 EFLAGS: 00000246 ORIG_RAX:
0000000000000000
[ 2357.205330] RAX: ffffffffffffffda RBX: 0000632936047890 RCX:
00007e3a1351baca
[ 2357.205332] RDX: 0000000000001008 RSI: 0000632936047890 RDI:
000000000000000d
[ 2357.205333] RBP: 00007ffec83c8240 R08: 0000000000000000 R09:
0000000000000000
[ 2357.205334] R10: 0000632936048890 R11: 0000000000000246 R12:
000000000000000d
[ 2357.205335] R13: 0000000000001008 R14: 0000000000001008 R15:
0000000000001007
[ 2357.205338] </TASK>
[ 2357.205458] task:cinnamon state:D stack:0 pid:2362 tgid:2362 ppid:2307
task_flags:0x400000 flags:0x00080000
[ 2357.205462] Call Trace:
[ 2357.205464] <TASK>
[ 2357.205465] __schedule+0x2ad/0x600
[ 2357.205466] schedule+0x27/0x90
[ 2357.205468] schedule_timeout+0x88/0x110
[ 2357.205470] ? __pfx_process_timeout+0x10/0x10
[ 2357.205474] ___down_common+0xef/0x160
[ 2357.205476] __down_common+0x5a/0x150
[ 2357.205478] __down_timeout+0x16/0x30
[ 2357.205480] down_timeout+0x72/0x80
[ 2357.205482] acpi_os_wait_semaphore+0x74/0x1c0
[ 2357.205484] acpi_ex_system_wait_mutex+0xdf/0x140
[ 2357.205486] acpi_ex_acquire_mutex_object+0x68/0x170
[ 2357.205489] acpi_ex_acquire_mutex+0x8b/0x2d0
[ 2357.205490] acpi_ex_opcode_2A_0T_1R+0x173/0x1f0
[ 2357.205492] acpi_ds_exec_end_op+0x1bb/0x960
[ 2357.205495] acpi_ps_parse_loop+0x12e/0x770
[ 2357.205497] acpi_ps_parse_aml+0xbe/0x5f0
[ 2357.205498] acpi_ps_execute_method+0x172/0x3e0
[ 2357.205500] acpi_ns_evaluate+0x196/0x5e0
[ 2357.205502] acpi_evaluate_object+0x20c/0x490
[ 2357.205504] acpi_battery_get_state+0x96/0x220
[ 2357.205507] acpi_battery_get_property+0x5c/0x410
[ 2357.205509] __power_supply_get_property+0x6d/0x250
[ 2357.205512] power_supply_get_property+0x13/0x30
[ 2357.205514] power_supply_format_property+0xf6/0x3e0
[ 2357.205516] power_supply_show_property+0x16/0x30
[ 2357.205517] dev_attr_show+0x1f/0x60
[ 2357.205519] sysfs_kf_seq_show+0xca/0x130
[ 2357.205521] kernfs_seq_show+0x27/0x40
[ 2357.205523] seq_read_iter+0x130/0x4a0
[ 2357.205525] ? security_file_permission+0x5b/0x170
[ 2357.205528] kernfs_fop_read_iter+0x31/0x40
[ 2357.205529] vfs_read+0x270/0x3a0
[ 2357.205532] ksys_read+0x71/0xf0
[ 2357.205534] __x64_sys_read+0x19/0x30
[ 2357.205535] x64_sys_call+0x1dcb/0x2360
[ 2357.205536] do_syscall_64+0x81/0x5a0
[ 2357.205537] ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xe0
[ 2357.205539] ? do_syscall_64+0xbe/0x5a0
[ 2357.205540] ? arch_exit_to_user_mode_prepare.isra.0+0xd/0xe0
[ 2357.205542] ? do_syscall_64+0xbe/0x5a0
[ 2357.205543] ? sysvec_apic_timer_interrupt+0x54/0xd0
[ 2357.205544] ? sysvec_reschedule_ipi+0x65/0x110
[ 2357.205545] entry_SYSCALL_64_after_hwframe+0x76/0x7e
[ 2357.205546] RIP: 0033:0x767a3e11baca
[ 2357.205547] RSP: 002b:00007fff023cf670 EFLAGS: 00000246 ORIG_RAX:
0000000000000000
[ 2357.205549] RAX: ffffffffffffffda RBX: 000062683635f3c0 RCX:
0000767a3e11baca
[ 2357.205549] RDX: 0000000000001000 RSI: 00006268369efd20 RDI:
0000000000000017
[ 2357.205550] RBP: 00007fff023cf690 R08: 0000000000000000 R09:
0000000000001000
[ 2357.205551] R10: 0000000000000000 R11: 0000000000000246 R12:
0000626836c66840
[ 2357.205552] R13: 0000626836c66848 R14: 00007fff023cfb60 R15:
0000000000000017
[ 2357.205553] </TASK>
[ 2357.205929] task:kworker/9:0 state:D stack:0 pid:4783 tgid:4783 ppid:2
task_flags:0x4208060 flags:0x00080000
[ 2357.205934] Workqueue: kacpi_notify acpi_os_execute_deferred
[ 2357.205938] Call Trace:
[ 2357.205940] <TASK>
[ 2357.205941] __schedule+0x2ad/0x600
[ 2357.205942] schedule+0x27/0x90
[ 2357.205944] schedule_timeout+0xcf/0x110
[ 2357.205946] ___down_common+0xef/0x160
[ 2357.205948] ? acpi_ut_update_ref_count.part.0+0x116/0x260
[ 2357.205952] __down_common+0x5a/0x150
[ 2357.205954] __down_timeout+0x16/0x30
[ 2357.205955] down_timeout+0x72/0x80
[ 2357.205957] acpi_os_wait_semaphore+0x74/0x1c0
[ 2357.205959] acpi_ex_system_wait_mutex+0xdf/0x140
[ 2357.205961] acpi_ds_begin_method_execution+0xb4/0x450
[ 2357.205964] acpi_ds_call_control_method+0x9e/0x4a0
[ 2357.205966] acpi_ps_parse_aml+0x3e6/0x5f0
[ 2357.205968] acpi_ps_execute_method+0x172/0x3e0
[ 2357.205969] acpi_ns_evaluate+0x196/0x5e0
[ 2357.205971] acpi_evaluate_object+0x20c/0x490
[ 2357.205974] acpi_battery_get_info+0x6a/0x260
[ 2357.205976] acpi_battery_notify+0x11a/0x150
[ 2357.205979] acpi_ev_notify_dispatch+0x5b/0xb0
[ 2357.205982] ? _raw_spin_lock_irqsave+0xe/0x20
[ 2357.205984] acpi_os_execute_deferred+0x1a/0x40
[ 2357.205986] process_one_work+0x18e/0x370
[ 2357.205991] worker_thread+0x188/0x320
[ 2357.205993] ? __pfx_worker_thread+0x10/0x10
[ 2357.205996] kthread+0x10b/0x220
[ 2357.205999] ? __pfx_kthread+0x10/0x10
[ 2357.206000] ret_from_fork+0x159/0x1d0
[ 2357.206003] ? __pfx_kthread+0x10/0x10
[ 2357.206005] ? __pfx_kthread+0x10/0x10
[ 2357.206006] ret_from_fork_asm+0x1a/0x30
[ 2357.206008] </TASK>
[ 2357.206023] task:kworker/9:1 state:D stack:0 pid:8176 tgid:8176 ppid:2
task_flags:0x4208060 flags:0x00080000
[ 2357.206026] Workqueue: events power_supply_changed_work
[ 2357.206028] Call Trace:
[ 2357.206030] <TASK>
[ 2357.206031] __schedule+0x2ad/0x600
[ 2357.206032] schedule+0x27/0x90
[ 2357.206034] schedule_timeout+0x88/0x110
[ 2357.206036] ? __pfx_process_timeout+0x10/0x10
[ 2357.206038] ___down_common+0xef/0x160
[ 2357.206040] __down_common+0x5a/0x150
[ 2357.206041] __down_timeout+0x16/0x30
[ 2357.206043] down_timeout+0x72/0x80
[ 2357.206045] acpi_os_wait_semaphore+0x74/0x1c0
[ 2357.206047] acpi_ex_system_wait_mutex+0xdf/0x140
[ 2357.206049] acpi_ex_acquire_mutex_object+0x68/0x170
[ 2357.206051] acpi_ex_acquire_mutex+0x8b/0x2d0
[ 2357.206052] acpi_ex_opcode_2A_0T_1R+0x173/0x1f0
[ 2357.206054] acpi_ds_exec_end_op+0x1bb/0x960
[ 2357.206057] acpi_ps_parse_loop+0x12e/0x770
[ 2357.206058] acpi_ps_parse_aml+0xbe/0x5f0
[ 2357.206059] acpi_ps_execute_method+0x172/0x3e0
[ 2357.206061] acpi_ns_evaluate+0x196/0x5e0
[ 2357.206069] acpi_evaluate_object+0x20c/0x490
[ 2357.206071] acpi_evaluate_integer+0x61/0x100
[ 2357.206077] ideapad_psy_ext_get_prop+0x4e/0x120 [ideapad_laptop]
[ 2357.206082] __power_supply_get_property+0x1bc/0x250
[ 2357.206085] power_supply_get_property+0x13/0x30
[ 2357.206087] power_supply_format_property+0xf6/0x3e0
[ 2357.206089] add_prop_uevent+0x41/0xf0
[ 2357.206091] power_supply_uevent+0xe8/0x120
[ 2357.206092] dev_uevent+0x10e/0x350
[ 2357.206097] ? kobject_get_path+0x83/0xa0
[ 2357.206103] kobject_uevent_env+0x327/0x500
[ 2357.206105] kobject_uevent+0xb/0x20
[ 2357.206106] power_supply_changed_work+0xcc/0x1b0
[ 2357.206107] ? __pfx___power_supply_changed_work+0x10/0x10
[ 2357.206109] process_one_work+0x18e/0x370
[ 2357.206111] worker_thread+0x188/0x320
[ 2357.206113] ? __pfx_worker_thread+0x10/0x10
[ 2357.206115] kthread+0x10b/0x220
[ 2357.206117] ? __pfx_kthread+0x10/0x10
[ 2357.206118] ret_from_fork+0x159/0x1d0
[ 2357.206120] ? __pfx_kthread+0x10/0x10
[ 2357.206121] ? __pfx_kthread+0x10/0x10
[ 2357.206122] ret_from_fork_asm+0x1a/0x30
[ 2357.206124] </TASK>
[ 2360.256074] ideapad_acpi VPC2004:00: unexpected charge_types: both [Fast]
and [Long_Life] are enabled

Let me know if there is value in getting multiple versions of these and I w=
ill
capture more.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
