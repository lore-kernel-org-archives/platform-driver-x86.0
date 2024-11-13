Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D07B13B7AE
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 02:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731465758; cv=none; b=U2gT9FMUJmGx4bGMPbResPAxuceGEzanKqfIMMeCbcZAhITK06sxcpCeAp5Wnu74O/MDWmg8ubFdd0redle5p+e6m/d0GWfjD7DQ818cpZ2OGuuvRRO9J6YzwMI5VnUxsWeu07bPBnhC15dpOBS8XHKS2ALg8Y3TEckyfcC19lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731465758; c=relaxed/simple;
	bh=kjcBGvYO3oNcnDdT/QgJs8spzh+1LqJbbRFnSq+cGbI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LhYZmf3++kcBjSPAqNGBLCkVvLAz47M47PSXXeE3WI0WLlQ4uGOfcM/icvHiBx0NmjP5BSaGMgjU38gAqmTNkn0VLPxcSWV2+ZNxyotk8kJ1CrERhqQdurzZRWgjBA0wx7aq7LbbzsoZFUIQdjFzCa4oaSxWqGY3YA8vUwnbJok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q4J9bW5K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q4J9bW5K"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE596C4CED4
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 02:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731465758;
	bh=kjcBGvYO3oNcnDdT/QgJs8spzh+1LqJbbRFnSq+cGbI=;
	h=From:To:Subject:Date:From;
	b=Q4J9bW5K3ZMJj4MOTIW5j3agDu8yqUC4BdlVqzRluWoMYbhPL+Yf/H4Ua0lHNk14g
	 gcRedC2TU7PZkA++TJoEBBhUK5ytIcgu3SieZ7xIAusiP1cwRcBpTlqmVBBxwAE98l
	 zcu17vnb2eQvFvRhZvxznBMeGG8rHUkVnSNfqeo2eruQJ2qAA7iKkbQBqzufR3xLUk
	 Z7sm9X/hqSkQP0TuhdC/3QEysudN+S96We2lhDDkW6RY0FS/xcECXfZjsYGgErN+zZ
	 kzlKtCjNCzuJDzcAHqZvEATpDmQvkfLNi8b4tcaUf0o1gsgEk0ynoMruefuv/JJteL
	 FZ9pIFcG8d+WQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D2F66C53BC2; Wed, 13 Nov 2024 02:42:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] New: [TPM2] tpm_tis driver crashs during the boot time.
Date: Wed, 13 Nov 2024 02:42:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219495-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

            Bug ID: 219495
           Summary: [TPM2] tpm_tis driver crashs during the boot time.
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Platform_x86
          Assignee: drivers_platform_x86@kernel-bugs.osdl.org
          Reporter: andy.liang@hpe.com
        Regression: No

Created attachment 307212
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307212&action=3Dedit
binary_bios_measurements file

When the TPM2 ACPI table sets the Minimum Log Length size more then 4MB, a =
call
trace occurs during the boot time. The reason is the kmalloc limits the max=
imum
size to 4MB for x86 arch.

=3D=3D=3D=3D=3D=3D
https://elixir.bootlin.com/linux/v6.8/source/arch/x86/include/asm/page_type=
s.h#L10
#define PAGE_SHIFT 12
#define KMALLOC_SHIFT_MAX (MAX_PAGE_ORDER + PAGE_SHIFT)

https://elixir.bootlin.com/linux/v6.8/source/include/linux/mmzone.h#L30
#define MAX_PAGE_ORDER 10

https://elixir.bootlin.com/linux/v6.8/source/include/linux/slab.h#L309
#define KMALLOC_MAX_SIZE (1UL << KMALLOC_SHIFT_MAX)
The max size  =3D (1UL <<  MAX_PAGE_ORDER + PAGE_SHIFT) =3D ( 1UL << (10 + =
12)) =3D
2^22 =3D4,194,304 (4MB)
=3D=3D=3D=3D=3D=3D

https://elixir.bootlin.com/linux/v6.8/source/drivers/char/tpm/eventlog/acpi=
.c#L87
[   11.795176] kernel:  __kmalloc+0x2b1/0x330
[   11.795179] kernel:  tpm_read_log_acpi+0x95/0x1e0

Problems:
[   11.795129] kernel: Call Trace:
[   11.795131] kernel:  <TASK>
[   11.795133] kernel:  ? show_trace_log_lvl+0x1d6/0x2ea
[   11.795139] kernel:  ? show_trace_log_lvl+0x1d6/0x2ea
[   11.795141] kernel:  ? alloc_page_interleave+0x19/0x90
[   11.795145] kernel:  ? show_regs.part.0+0x23/0x29
[   11.795146] kernel:  ? show_regs.cold+0x8/0xd
[   11.795148] kernel:  ? __alloc_pages+0x2b0/0x330
[   11.795150] kernel:  ? __warn+0x8c/0x100
[   11.795154] kernel:  ? __alloc_pages+0x2b0/0x330
[   11.795156] kernel:  ? report_bug+0xa4/0xd0
[   11.795160] kernel:  ? handle_bug+0x39/0x90
[   11.795162] kernel:  ? exc_invalid_op+0x19/0x70
[   11.795164] kernel:  ? asm_exc_invalid_op+0x1b/0x20
[   11.795167] kernel:  ? __alloc_pages+0x2b0/0x330
[   11.795169] kernel:  alloc_page_interleave+0x19/0x90
[   11.795171] kernel:  alloc_pages+0x131/0x1e0
[   11.795173] kernel:  kmalloc_order+0x2f/0xd0
[   11.795175] kernel:  kmalloc_order_trace+0x1d/0x90
[   11.795176] kernel:  __kmalloc+0x2b1/0x330
[   11.795179] kernel:  tpm_read_log_acpi+0x95/0x1e0
[   11.795183] kernel:  tpm_bios_log_setup+0x54/0x270
[   11.795185] kernel:  tpm_chip_register.part.0+0x32/0x1f0
[   11.795186] kernel:  tpm_chip_register+0x61/0xa0
[   11.795188] kernel:  tpm_tis_core_init.cold+0x206/0x448
[   11.795191] kernel:  tpm_tis_init.part.0+0xb4/0x130
[   11.795193] kernel:  tpm_tis_plat_probe+0xd4/0x100

[   11.795195] kernel:  platform_probe+0x46/0xd0
[   11.795201] kernel:  really_probe+0x21f/0x420
[   11.795203] kernel:  __driver_probe_device+0xe8/0x140
[   11.795205] kernel:  driver_probe_device+0x23/0xc0
[   11.795207] kernel:  __driver_attach+0xf7/0x1f0
[   11.795209] kernel:  ? __device_attach_driver+0x140/0x140
[   11.795211] kernel:  bus_for_each_dev+0x7c/0xd0
[   11.795213] kernel:  driver_attach+0x1e/0x30
[   11.795215] kernel:  bus_add_driver+0x148/0x220
[   11.795217] kernel:  driver_register+0x95/0x100
[   11.795219] kernel:  ? tpm_init+0x68/0xfa

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
