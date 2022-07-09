Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D57C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  9 Jul 2022 18:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiGISYa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 9 Jul 2022 14:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGISY3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Jul 2022 14:24:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABADC1183F
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 11:24:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 53B36B802C6
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 18:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02EC2C3411C
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Jul 2022 18:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657391066;
        bh=zXt6aJwaZ8QIJQOyXLS/mNsRjXPoTOZjqn5XjeYhPTo=;
        h=From:To:Subject:Date:From;
        b=UhmgZFrFPeQO59RFir8NfyqeS7z9hug+PyW4gWf+m+CIg4tKtdoso8LKr22kGuYnx
         p/mrxmD0D+Fu+6NVc1nVb4X+dRh9E7Hp5icCDVQqxWbph9eFewGF2S6Euf/yAfXOu0
         v6FVtzoQzmfybxR2CS+w3LUn1YA3pN2IyuvDtNmh1rHQw5V3O4Rf8E9v8VsjMX6yRC
         xtFGe5eOT4lEYum+gS2aXreMV6xzRLy++SBAsDEFjUZFAKs8O/WJBDgFMGNjqfi4sy
         LpnGByzBZDs7iriUxPGvJ/Is9bVjVOpmDDDxF5WRTopZd3pcT66oeDvWF5mdNghvOO
         dMuhiORF0VcYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E9364CC13B5; Sat,  9 Jul 2022 18:24:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] New: "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD)
 when s2idle is enabled
Date:   Sat, 09 Jul 2022 18:24:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

            Bug ID: 216230
           Summary: "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
                    s2idle is enabled
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.10
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: madcatx@atlas.cz
        Regression: No

Whenever I power up my T14 Gen1 TP with AMD chip, I get the following error
about 4 seconds after boot

[    4.304639] kernel: irq 9: nobody cared (try booting with the "irqpoll"
option)
[    4.304652] kernel: CPU: 1 PID: 0 Comm: swapper/1 Not tainted 5.18.9-arc=
h1-1
#1 137f0035b2ece06cb65382579db27e9de66af504
[    4.304654] kernel: Hardware name: LENOVO 20UDS02D00/20UDS02D00, BIOS
R1BET71W(1.40 ) 04/05/2022
[    4.304655] kernel: Call Trace:
[    4.304656] kernel:  <IRQ>
[    4.304658] kernel:  dump_stack_lvl+0x48/0x5d
[    4.304662] kernel:  __report_bad_irq+0x35/0xaa
[    4.304664] kernel:  note_interrupt.cold+0xa/0x65
[    4.304666] kernel:  handle_irq_event+0x72/0x80
[    4.304669] kernel:  handle_fasteoi_irq+0x8e/0x1f0
[    4.304671] kernel:  __common_interrupt+0x46/0xa0
[    4.304674] kernel:  common_interrupt+0x81/0xa0
[    4.304677] kernel:  </IRQ>
[    4.304677] kernel:  <TASK>
[    4.304678] kernel:  asm_common_interrupt+0x22/0x40
[    4.304681] kernel: RIP: 0010:cpuidle_enter_state+0xdc/0x380
[    4.304684] kernel: Code: 00 00 31 ff e8 95 70 80 ff 45 84 ff 74 16 9c 5=
8 0f
1f 40 00 f6 c4 02 0f 85 8f 02 00 00 31 ff e8 fa 44 86 ff fb 0f 1f 44 00 00 =
<45>
85 f6 0f 88 22 01 00 00 49 63 ce 48 8d 04 49 48 8d 04 81 49 8d
[    4.304685] kernel: RSP: 0018:ffffb77f401a7e90 EFLAGS: 00000246
[    4.304687] kernel: RAX: ffff8f606f872cc0 RBX: 0000000000000003 RCX:
0000000000000000
[    4.304688] kernel: RDX: 0000000100930767 RSI: fffffffc2980382f RDI:
0000000000000000
[    4.304688] kernel: RBP: ffff8f5980bcfc00 R08: 0000000000000002 R09:
000000004b6f7f5c
[    4.304689] kernel: R10: 0000000000000d4c R11: 0000000000000002 R12:
ffffffff94d51300
[    4.304690] kernel: R13: 0000000100930767 R14: 0000000000000002 R15:
0000000000000000
[    4.304692] kernel:  cpuidle_enter+0x2d/0x40
[    4.304693] kernel:  do_idle+0x1ba/0x220
[    4.304695] kernel:  cpu_startup_entry+0x1d/0x20
[    4.304696] kernel:  start_secondary+0x11c/0x140
[    4.304699] kernel:  secondary_startup_64_no_verify+0xd5/0xdb
[    4.304702] kernel:  </TASK>

When the machine boots up, I can check /proc/interrupts and get this for IR=
Q 9

  9:          0     100076          0          0          0          0=20=
=20=20=20=20=20=20=20=20
0          0          0          0          0          0          0        =
  0=20
        0          0  IR-IO-APIC    9-fasteoi   acpi, pinctrl_amd

Rather interestingly, when I reboot the machine, I don't get any IRQ-related
errors during boot and everything works fine. /proc/interrupts now looks li=
ke
this

 9:          0         87          0          0          0          0=20=20=
=20=20=20=20=20=20=20
0          0          0          0          0          0          0        =
  0=20
        0          0  IR-IO-APIC    9-fasteoi   acpi, pinctrl_amd

The number of interrupts very slowly increases as the computer runs.

This odd IRQ9 error that happens only on the first cold boot happens only w=
hen
I enable "Windows sleep", aka s2idle, mode in BIOS. Switching to S3 ("Linux
sleep") takes care of the IRQ problem but I'd rather stick to s2idle because
the latest Lenovo firmware has some issues that go away when s2idle is enab=
led.

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
