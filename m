Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406436;
	b=ibnJPjnO4FImZEWtEccHLQGJmxntGeidYnF5oqmvxJ12NjYCuf4yWcZha/+RpddiPak6
	 rUP2FOSOZvEj9oZPYNElBUAJ43q0BsvwaFjs9Rb5lXPehtcL/lGjonnCrQYmsqufqr7kS
	 IHE/KwAmkT4XqVJhkDYkrIcg73jCeXHmqhXzTwUkwsN4zI/WnTq80A713svfvIWxmW7cW
	 R8IW7coUgWwcm5TMtIhIoF3PtWeABwAKx8EoZc51UMje1wFfLpg6l0ug18bD6IyhzhjlB
	 mR5gRJZayXGv9neBhCh7d7CzvAWy/HEZ1zrD5W5iE70ywHrZYJQGSVM4JFUiDqMrxJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406436;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:DKIM-Signature;
	bh=aQPSbyTyvzjEz7CkN1X6Le4LXz7sS2rlzNpRvzzXUdo=;
	b=WlgE2cNg61Bw0C9cRHO3BOlVRp5eiXr5tusKKUfL5YQzU9B9KXOPo13YAb1Yyqc5x2Jv
	 Gg8i94Ukt3kz3OHJIGgfre0mOFfpDYu8E7BBTcAcrIxI40hvHwTu8fWRLg1ca//f4/ulo
	 83ZmYXmqOYa+yj0ps4DPYcMz9nZbM/LISEnYJKqz0eReJX5IyMmP5PGN3lGqjgoAncfZN
	 cZEt1RqS7m6M48tSnuL8/z88gh/GX3SDdYeMMk0p8Apkkm+z729DFKhi090rgmCA1Nyl2
	 id4lCRsJ6qxGl70iX2/VKa8wlNkX8vHDg2H3EKcHisyaRuV1IGevWnApXDfEj/zTemQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=TxOoVhis;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE88606A8BA;
	Wed, 11 Nov 2026 14:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DE88606A8BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=TxOoVhis
Received: from abreu.molgen.mpg.de (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6D6C94C4047E69;
	Wed, 11 Nov 2026 15:13:14 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Juergen Gross <jgross@suse.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell: dcdbas: Force synchronous probe
Date: Wed, 11 Nov 2026 15:13:02 +0100
Message-ID: <20261111141304.67110-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1794406394; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=aQPSbyTyvzjEz7CkN1X6Le4LXz7sS2rlzNpRvzzXUdo=; 
	b=TxOoVhis2vVxX2cmIxMahp3ETuJGyoRz8ll2FUhVVlH0zF9d6Y5iF9dBXCIwXo8bBBFlntDiTiuX
	pf1XPfjPS1+Q2D8nTYGE4A5koIHalCZoJKsq2fFxiWYb7pP7M7B5WmFcA87P8Q2LHbAI4H8YWYosS9
	oJE+DwsB9W9SQSbTXhXHi97HKdfqF0h1z+JB7hkmRV7nF0++HT6ji5SNV76+tqJrtvqCZgeGx9wrmE
	MDoAHBMNLOJakyHpChRrGL6rLrORXNM4wC8GHlcjDWidyD6o3KG2p6Mi7WKbqq+Sliq0k45NRWFRrS
	VrIY6BN5NIcTCNpAJClJSFomvV3VQErw==

dcdbas registers its platform driver and its own platform device in
dcdbas_init(), and only dcdbas_probe() sets dcdbas_pdev, the device that
dcdbas_smi_alloc() and dcdbas_smi_free() use for the DMA allocation.
Since commit 77089467fc79 (platform/x86/dell: add buffer
allocation/free functions for SMI calls), dell_smbios calls
dcdbas_smi_alloc() from its module init through init_dell_smbios_smm().

That relies on the probe having run when dcdbas_init() returns. With
asynchronous probing, requested with module.async_probe=1,
dcdbas.async_probe=1 or driver_async_probe=dcdbas, the probe is queued
instead, and if dell_smbios is loaded before it runs,
dcdbas_smi_alloc() passes &dcdbas_pdev->dev, with dcdbas_pdev still
NULL, to dma_alloc_coherent():

    BUG: kernel NULL pointer dereference, address: 0000000000000268
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    PGD 0 P4D 0
    Oops: Oops: 0000 [#1] SMP NOPTI
    CPU: 2 UID: 0 PID: 295 Comm: (udev-worker) Not tainted 7.4.0-rc1-ortiz-bt4 #1 PREEMPT(lazy)
    Hardware name: Dell Inc. XPS 13 9310/0GG9PT, BIOS 3.17.0 07/12/2023
    RIP: 0010:dma_alloc_attrs+0x22/0x220
    [...]
    RDI: 0000000000000010 [...]
    Call Trace:
     <TASK>
     dcdbas_smi_alloc+0x2d/0xc0 [dcdbas]
     init_dell_smbios_smm+0x1e/0x190 [dell_smbios]
     dell_smbios_init+0x10f/0xf10 [dell_smbios]
     do_one_initcall+0x89/0x3d0
     do_init_module+0x6a/0x290
     init_module_from_file+0xc8/0x180
     idempotent_init_module+0x23e/0x360
     __x64_sys_finit_module+0x7f/0x110
     do_syscall_64+0xc1/0x560
     entry_SYSCALL_64_after_hwframe+0x76/0x7e

On a Dell XPS 13 9310 booted with module.async_probe=1, udev loads both
modules early, and this happened in about one of 15 boots.

The probe of the device dcdbas creates itself is part of setting up the
interface the module exports, so force it to be synchronous, like
commit 31e11af34e2c ("serial: 8250: force synchronous probe for the ISA
and PNP drivers") did for a similar race.

Tested in QEMU (x86_64_defconfig + kvm_guest.config, DCDBAS=m,
DELL_SMBIOS=m, DELL_SMBIOS_SMM=y, SMBIOS OEM string "Dell System"): one
SCHED_FIFO process on one vCPU loads dcdbas with async_probe=1 and then
dell_smbios, so the queued probe cannot run in between.

  without this patch: oops in dcdbas_smi_alloc() in the first iteration, 4 of 4 boots
  with this patch:    6 x 200 load/unload iterations, no oops

The two ideas below were discarded:

-   Setting dcdbas_pdev in init: dell_smbios would then use the device
    while it might still be probing.

-   platform_create_bundle(): a failed probe would fail the module load.
    Because of the symbol dependency, dell_smbios would then fail to
    load as well, including its WMI backend.

Fixes: 77089467fc79 ("platform/x86/dell: add buffer allocation/free functions for SMI calls")
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    Analysis, reproducer and patch drafted with claude-opus-5-5.

 drivers/platform/x86/dell/dcdbas.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 678f44252a453..5ce3a3f78980d 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -708,6 +708,11 @@ static void dcdbas_remove(struct platform_device *dev)
 static struct platform_driver dcdbas_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
+		/*
+		 * dcdbas_probe() sets dcdbas_pdev, which the exported
+		 * dcdbas_smi_alloc() needs as soon as dcdbas_init() returns.
+		 */
+		.probe_type = PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe		= dcdbas_probe,
 	.remove		= dcdbas_remove,
-- 
2.54.0

