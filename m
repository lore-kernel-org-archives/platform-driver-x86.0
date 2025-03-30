Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CB41ADC6C
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Mar 2025 10:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743329833; cv=none; b=k00+uYzr+Z++O5kSKtQLdj0bo2IAgdzsPBjhrA/+1ZEGd9LgWJc6PDy8/fu12/2jihv+6L45GIzv1dM37heuvYFiw4GkxYYMBISVUOUrfR/iP1lXMPkFwGMBgzjQhs9+pgyB0zwRPFxn1QQvdRdiYu76DFX7z7zPpl5SwoAN0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743329833; c=relaxed/simple;
	bh=QUJBcVTblvI2EP5xQeDaKtT9t49vv3F0LfFpOmYL5zQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IIPDy6OBkT6J/y+hFLIW9O5MtldphiRLZRIfFfpFaqjCRNOW/THteXVQVM3Y9GXtW0DMMHIzLeGW9GoDFYc6Aspzv6XvnW4FNvTRDf03EX9Sr1l/+dgMYKQUaFK/2nV644nzr2/68Be3uBlG3l5LoYPgB/LOzXMj95QaBWhnY4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de; spf=pass smtp.mailfrom=tometzki.de; dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b=XZOXdUhw; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riscv-rocks.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tometzki.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b="XZOXdUhw"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86dddba7e0eso1445143241.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Mar 2025 03:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1743329830; x=1743934630; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4hmIlzKnM4x1XSGz8oqM3l2exfPjdhfaEWlyxe3yT8=;
        b=XZOXdUhwRYq8sYjLxh37zoavhGvWcSfwKKj4SWm/SRrco2AaLtji/IBpBHRjAAkaFJ
         cqVLS1nNmkWCzGH/pR5TbESItsqOcWD+v/Kn5l+KavDIjIu3QWVWqmDl5HpmdWEr6eae
         kbSLGqkfsQqTKZATznqB65djsUclvdTlp9p6GZAsprcs3YppTbiUPpLvjzc7rWeQPaW2
         YX954uDJl8hq/VyfDkfPO4Uy9M8h01UKfyiXCS50UM3ftwCQGMojFpOxqYI7keR09T2I
         CChEHqINjhAvme3SBrTQMHq3oRqeCFS26vpXEWFSmdnC/fWZ0g+pb5H9eR1Kgsq3BGFj
         gBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329830; x=1743934630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4hmIlzKnM4x1XSGz8oqM3l2exfPjdhfaEWlyxe3yT8=;
        b=GU34Jvm1EdXz3C6gbO+H2e7eLHbaT1P2bOYydvAypQVAk+04tlLimWSBltY1RGZxMz
         S/aslNoY7TImsnbP7rbfyc8aK/n8shn/Aim589fSTfFMHM2UPOn1CCMvZEYvgsHUlICg
         SLLbdUcxkWRsBPr8bOG6tPhZzTDnnHmF6/cYkPgFY0xDdSeMvNZr6Wto3ZyuEuhfy6SH
         Aen7ssA7b7pwxwzEpkUrgNQY8SlS3N4FdNvvOV+bF2LLuEn5E2SI58VraoVzx3XwncIn
         eHbS5HZWXzT4mTxgONvgo97rTYAbEHKY6ADXfaKJhgHk3B4ELJx7TwGg3xki658ZOPqN
         d6lg==
X-Forwarded-Encrypted: i=1; AJvYcCV66FQhYuf+hjFGlprGQEHL8j/u2T+fVLK766gv7iKSXnYVUeVdO1IL3meWWatNjntHBrysk5MCdgxpvprl6Vep3ffw@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Rk+GOtoHRp80NK7Uja8Fvhf3W0Cq2Z17GYI6eTz7GnzBRFhb
	1LUggfWdq6Cw99cOoZy6sZhztkJNM3tEyk25QQpbFVKfWr1mkJzR3pB70zBnp0rUm3zNsijhv5G
	Trw5fzM0k3GMw4OqCtxqC4SwHs8Q7vu6Q5bCvoqBxm8pgRsWBmyxrqcTY
X-Gm-Gg: ASbGnctxuhQU9ljoP43KAY6ntx+brUcNsMgK9eBZ89s9dCOE+Qzp/YlxGI1o0Ql8DaE
	FAQ6LeVyExlir1290ArF4jI8rVEUtCM1UzmvNHoI0XDin/MpPTeR+YyeAGdBPC054reu19GLHKh
	jKZv3Z1qUqP4XUOeDJzKxvUQ9yUtQ6PIzmJYLFqzdQ4yKYCsWsnqhIB++MizlPDyuak2P5
X-Google-Smtp-Source: AGHT+IF7wmYD0v2wV7AArUPg1C3DKP9EzijeJLu59el+RlTsKkFNaJOOPiOz4nWPOd+gTE3gTqA2Dixs7Pt1qhAdbNg=
X-Received: by 2002:a05:6102:f0b:b0:4c1:91da:dac1 with SMTP id
 ada2fe7eead31-4c6d386f3aamr2752325137.6.1743329829959; Sun, 30 Mar 2025
 03:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL=B37kdL1orSQZD2A3skDOevRXBzF__cJJgY_GFh9LZO3FMsw@mail.gmail.com>
 <D8TDEP8ZEYE6.24AVWSGXURB4I@gmail.com> <CAL=B37ko7Zyr6gJxYTvsFKsfXKNTPw80UvjNgbQ+B6EZ9GGfaw@mail.gmail.com>
 <D8TEDS91VAGU.1UVZWWWWMRRNG@gmail.com>
In-Reply-To: <D8TEDS91VAGU.1UVZWWWWMRRNG@gmail.com>
From: Damian Tometzki <damian@riscv-rocks.de>
Date: Sun, 30 Mar 2025 12:16:59 +0200
X-Gm-Features: AQ5f1JrNKC-LSmi8WC38UPS2EIku1txYddu_ejaayvw7kQwVfmBJzlEFsln7S0A
Message-ID: <CAL=B37nDNmkNo46tSfH-B7a+Uhex2LqhkbhJ7pjU9zrv+j3wug@mail.gmail.com>
Subject: Re: Kernel Null Pointer Dereference on Fedora with thinkpad_acpi
To: Kurt Borja <kuurtb@gmail.com>
Cc: hmh@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Kurt,
hello together,

I successfully tested the patch on my ThinkPad X1. System boots
normally without errors.

Tested-by: Damian Tometzki <damian@riscv-rocks.de>

Best regards
Damian

On Sun, Mar 30, 2025 at 8:47=E2=80=AFAM Kurt Borja <kuurtb@gmail.com> wrote=
:
>
> On Sun Mar 30, 2025 at 3:28 AM -03, Damian Tometzki wrote:
> > On Sun, Mar 30, 2025 at 8:01=E2=80=AFAM Kurt Borja <kuurtb@gmail.com> w=
rote:
> >>
> >> Hi Damian,
> >>
> >> On Sun Mar 30, 2025 at 2:19 AM -03, Damian Tometzki wrote:
> >> > Hi together,
> >> >
> >> > I encountered a kernel crash on a Lenovo ThinkPad (BIOS N32ET95W 1.7=
1)
> >> > running Fedora with kernel 6.15 (merge window) 7f2ff7b62617. The iss=
ue
> >> > is a NULL pointer dereference during initialization of the
> >> > thinkpad_acpi module. The crash occurs in kobject_get() while handli=
ng
> >> > RFKill device registration (tpacpi_new_rfkill =E2=86=92 rfkill_regis=
ter =E2=86=92
> >> > device_add).
> >> > With kernel 6.14 system boot=C2=B4s fine
> >> >
> >> > Let me know if further logs or debugging info are needed. Below the =
short dump
> >> >
> >> > Mar 29 17:43:16.173712 fedora kernel: thinkpad_acpi: Disabling
> >> > thinkpad-acpi brightness events by default...
> >> > Mar 29 17:43:16.175636 fedora kernel: ACPI: bus type thunderbolt reg=
istered
> >> > Mar 29 17:43:16.179626 fedora kernel: BUG: kernel NULL pointer
> >> > dereference, address: 000000000000004c
> >> > Mar 29 17:43:16.179689 fedora kernel: #PF: supervisor read access in=
 kernel mode
> >> > Mar 29 17:43:16.180235 fedora kernel: #PF: error_code(0x0000) - not-=
present page
> >> > Mar 29 17:43:16.180290 fedora kernel: PGD 0 P4D 0
> >> > Mar 29 17:43:16.180325 fedora kernel: Oops: Oops: 0000 [#1] SMP NOPT=
I
> >> > Mar 29 17:43:16.180340 fedora kernel: CPU: 6 UID: 0 PID: 1015 Comm:
> >> > (udev-worker) Not tainted 6.14.0 #355 PREEMPT(lazy)
> >> > Mar 29 17:43:16.180449 fedora kernel: Hardware name: LENOVO
> >> > 20XWCTO1WW/20XWCTO1WW, BIOS N32ET95W (1.71 ) 10/24/2024
> >> > Mar 29 17:43:16.180469 fedora kernel: RIP: 0010:kobject_get+0xd/0x70
> >> > Mar 29 17:43:16.180491 fedora kernel: Code: 66 66 2e 0f 1f 84 00 00 =
00
> >> > 00 00 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e
> >> > fa 53 48 89 fb 48 85 ff 74 1f <f6> 47 3c 01 74 22 48 8d 7b 38 b8 01
> >> > 00>
> >> > Mar 29 17:43:16.180506 fedora kernel: RSP: 0018:ffffd3d200b5f750
> >> > EFLAGS: 00010202
> >> > Mar 29 17:43:16.180523 fedora kernel: RAX: ffff8ebbc10fac00 RBX:
> >> > 0000000000000010 RCX: 0000000000000000
> >> > Mar 29 17:43:16.180534 fedora kernel: RDX: 0000000000000000 RSI:
> >> > ffffffff9aebafa0 RDI: 0000000000000010
> >> > Mar 29 17:43:16.180547 fedora kernel: RBP: ffff8ebbd49f4b88 R08:
> >> > 0000000000000100 R09: 0000000000000000
> >> > Mar 29 17:43:16.180559 fedora kernel: R10: ffffd3d200b5f760 R11:
> >> > 0000000000000008 R12: 0000000000000010
> >> > Mar 29 17:43:16.180573 fedora kernel: R13: ffff8ebbc8b12388 R14:
> >> > ffffffffc14a7500 R15: 0000000000000000
> >> > Mar 29 17:43:16.180587 fedora kernel: FS:  00007f1aa7c15040(0000)
> >> > GS:ffff8ebf72546000(0000) knlGS:0000000000000000
> >> > Mar 29 17:43:16.180606 fedora kernel: CS:  0010 DS: 0000 ES: 0000 CR=
0:
> >> > 0000000080050033
> >> > Mar 29 17:43:16.180630 fedora kernel: CR2: 000000000000004c CR3:
> >> > 0000000113948001 CR4: 0000000000f70ef0
> >> > Mar 29 17:43:16.180642 fedora kernel: PKRU: 55555554
> >> > Mar 29 17:43:16.180654 fedora kernel: Call Trace:
> >> > Mar 29 17:43:16.180664 fedora kernel:  <TASK>
> >> > Mar 29 17:43:16.180676 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x=
2f0
> >> > Mar 29 17:43:16.180688 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x=
2f0
> >> > Mar 29 17:43:16.180704 fedora kernel:  ? show_trace_log_lvl+0x1d2/0x=
2f0
> >> > Mar 29 17:43:16.180712 fedora kernel:  ? device_add+0x8f/0x6e0
> >> > Mar 29 17:43:16.180724 fedora kernel:  ? __die_body.cold+0x8/0x12
> >> > Mar 29 17:43:16.180739 fedora kernel:  ? page_fault_oops+0x146/0x180
> >> > Mar 29 17:43:16.180748 fedora kernel:  ? exc_page_fault+0x7e/0x1a0
> >> > Mar 29 17:43:16.180758 fedora kernel:  ? asm_exc_page_fault+0x26/0x3=
0
> >> > Mar 29 17:43:16.180769 fedora kernel:  ? __pfx_klist_children_get+0x=
10/0x10
> >> > Mar 29 17:43:16.180781 fedora kernel:  ? kobject_get+0xd/0x70
> >> > Mar 29 17:43:16.180792 fedora kernel:  device_add+0x8f/0x6e0
> >> > Mar 29 17:43:16.180804 fedora kernel:  rfkill_register+0xbc/0x2c0 [r=
fkill]
> >> > Mar 29 17:43:16.180813 fedora kernel:  tpacpi_new_rfkill+0x185/0x230
> >> > [thinkpad_acpi]
> >> > Mar 29 17:43:16.180826 fedora kernel:  ibm_init+0x66/0x2a0 [thinkpad=
_acpi]
> >> > Mar 29 17:43:16.180840 fedora kernel:
> >> > tpacpi_pdriver_probe+0x160/0x250 [thinkpad_acpi]
> >> > Mar 29 17:43:16.180852 fedora kernel:  platform_probe+0x41/0xa0
> >> > Mar 29 17:43:16.180887 fedora kernel:  really_probe+0xdb/0x340
> >> > Mar 29 17:43:16.180900 fedora kernel:  ? pm_runtime_barrier+0x55/0x9=
0
> >> > Mar 29 17:43:16.180912 fedora kernel:  ? __pfx___driver_attach+0x10/=
0x10
> >> > Mar 29 17:43:16.180920 fedora kernel:  __driver_probe_device+0x78/0x=
140
> >> > Mar 29 17:43:16.180932 fedora kernel:  driver_probe_device+0x1f/0xa0
> >> > Mar 29 17:43:16.180942 fedora kernel:  __driver_attach+0xb8/0x1d0
> >> > Mar 29 17:43:16.180954 fedora kernel:  bus_for_each_dev+0x82/0xd0
> >> > Mar 29 17:43:16.180966 fedora kernel:  bus_add_driver+0x12f/0x210
> >> > Mar 29 17:43:16.180976 fedora kernel:  driver_register+0x72/0xd0
> >> > Mar 29 17:43:16.180988 fedora kernel:  __platform_driver_probe+0x45/=
0x90
> >> > Mar 29 17:43:16.180999 fedora kernel:  __platform_create_bundle+0xe7=
/0x100
> >> > Mar 29 17:43:16.181011 fedora kernel:  ?
> >> > __pfx_tpacpi_pdriver_probe+0x10/0x10 [thinkpad_acpi]
> >> > Mar 29 17:43:16.181025 fedora kernel:  ?
> >> > __pfx_thinkpad_acpi_module_init+0x10/0x10 [thinkpad_acpi]
> >> > Mar 29 17:43:16.181035 fedora kernel:
> >> > thinkpad_acpi_module_init+0x37e/0x430 [thinkpad_acpi]
> >> > Mar 29 17:43:16.181045 fedora kernel:  do_one_initcall+0x58/0x300
> >> > Mar 29 17:43:16.181053 fedora kernel:  do_init_module+0x82/0x240
> >> > Mar 29 17:43:16.181065 fedora kernel:  init_module_from_file+0x8b/0x=
e0
> >> > Mar 29 17:43:16.181073 fedora kernel:  idempotent_init_module+0x113/=
0x310
> >> > Mar 29 17:43:16.181083 fedora kernel:  __x64_sys_finit_module+0x67/0=
xc0
> >> > Mar 29 17:43:16.181093 fedora kernel:  do_syscall_64+0x7f/0x170
> >> > Mar 29 17:43:16.181103 fedora kernel:  ? syscall_exit_to_user_mode+0=
x1d5/0x210
> >> > Mar 29 17:43:16.181112 fedora kernel:  ? do_syscall_64+0x8c/0x170
> >> > Mar 29 17:43:16.181124 fedora kernel:  ?
> >> > syscall_exit_to_user_mode_prepare+0x14a/0x180
> >> > Mar 29 17:43:16.181135 fedora kernel:  ? syscall_exit_to_user_mode+0=
x10/0x210
> >> > Mar 29 17:43:16.181144 fedora kernel:  ? do_syscall_64+0x8c/0x170
> >> > Mar 29 17:43:16.181152 fedora kernel:  ?
> >> > syscall_exit_to_user_mode_prepare+0x14a/0x180
> >> > Mar 29 17:43:16.181163 fedora kernel:  ? syscall_exit_to_user_mode+0=
x10/0x210
> >> > Mar 29 17:43:16.181173 fedora kernel:  ? do_syscall_64+0x8c/0x170
> >> > Mar 29 17:43:16.181182 fedora kernel:  ? seq_read_iter+0x20e/0x480
> >> > Mar 29 17:43:16.181198 fedora kernel:  ? vfs_read+0x29b/0x370
> >> > Mar 29 17:43:16.181217 fedora kernel:  ? __seccomp_filter+0x41/0x4e0
> >> > Mar 29 17:43:16.181233 fedora kernel:  ?
> >> > syscall_exit_to_user_mode_prepare+0x14a/0x180
> >> > Mar 29 17:43:16.181250 fedora kernel:  ? syscall_exit_to_user_mode+0=
x10/0x210
> >> > Mar 29 17:43:16.181264 fedora kernel:  ? do_syscall_64+0x8c/0x170
> >> > Mar 29 17:43:16.181280 fedora kernel:  ? do_syscall_64+0x8c/0x170
> >> > Mar 29 17:43:16.181292 fedora kernel:  ?
> >> > syscall_exit_to_user_mode_prepare+0x14a/0x180
> >> > Mar 29 17:43:16.181316 fedora kernel:  ? syscall_exit_to_user_mode+0=
x10/0x210
> >> > Mar 29 17:43:16.181331 fedora kernel:  ? clear_bhb_loop+0x35/0x90
> >> > Mar 29 17:43:16.181341 fedora kernel:  ? clear_bhb_loop+0x35/0x90
> >> > Mar 29 17:43:16.181351 fedora kernel:  ? clear_bhb_loop+0x35/0x90
> >> > Mar 29 17:43:16.181360 fedora kernel:  entry_SYSCALL_64_after_hwfram=
e+0x76/0x7e
> >> > Mar 29 17:43:16.181372 fedora kernel: RIP: 0033:0x7f1aa84c5a8d
> >> > Mar 29 17:43:16.181381 fedora kernel: Code: ff c3 66 2e 0f 1f 84 00 =
00
> >> > 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2
> >> > 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d
> >> > 4b>
> >> > Mar 29 17:43:16.181392 fedora kernel: RSP: 002b:00007ffe5ca79bc8
> >> > EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> >> > Mar 29 17:43:16.181406 fedora kernel: RAX: ffffffffffffffda RBX:
> >> > 00005610a8c7deb0 RCX: 00007f1aa84c5a8d
> >> > Mar 29 17:43:16.181419 fedora kernel: RDX: 0000000000000000 RSI:
> >> > 00007f1aa7b88965 RDI: 0000000000000032
> >> > Mar 29 17:43:16.181431 fedora kernel: RBP: 00007ffe5ca79c80 R08:
> >> > 0000000000000000 R09: 00007ffe5ca79c30
> >> > Mar 29 17:43:16.181441 fedora kernel: R10: 0000000000000000 R11:
> >> > 0000000000000246 R12: 0000000000020000
> >> > Mar 29 17:43:16.181448 fedora kernel: R13: 00005610a8c7f880 R14:
> >> > 00007f1aa7b88965 R15: 0000000000000000
> >> > Mar 29 17:43:16.181458 fedora kernel:  </TASK>
> >> > Mar 29 17:43:16.181472 fedora kernel: Modules linked in: cfg80211(+)
> >> > thunderbolt(+) thinkpad_acpi(+) igen6_edac intel_soc_dts_iosf
> >> > platform_profile snd soundcore int3403_thermal int340x_thermal_zone
> >> > soc_button_>
> >> > Mar 29 17:43:16.181784 fedora kernel: CR2: 000000000000004c
> >> > Mar 29 17:43:16.181806 fedora kernel: ---[ end trace 000000000000000=
0 ]---
> >> >
> >> > Best regards
> >> > Damian
> >>
> >> Hmmm - I have a feeling about this one.
> >>
> >> Can you apply and test the attached proposed patch? If you do please
> >> verify if the problem persist and if the driver has all the features
> >> present before the regression.
> >>
> >> If everything goes nicely, feel free to add a Tested-by: tag for when =
I
> >> submit this.
> >>
> >> --
> >>  ~ Kurt
> >
> > Hi Kurt,
> >
> > many thnaks for the fast response.
> > With this patch my system boot again but i have other dump in dmesg
>
> Oh, makes sense. It's the same problem but it was hidden because of the
> previous one.
>
> The attached patch should fix it.
>
> --
>  ~ Kurt
