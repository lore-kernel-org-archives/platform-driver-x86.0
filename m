Received: from baidu.com (mx22.baidu.com [220.181.50.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D03C247DE1
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 01:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.181.50.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763603991; cv=none; b=SF7auRP2oE6z5eVwaK5GxlFOPv+KKj78yvwbp/kklyO8qGRKUVVUNZJo/DoGzsT8x0XzUEAsoioraO+EircypqGAGqCSRZfKJ/EEddZEPpxr35LMNXijsLgD9+nWOoQEmH7vSZa9aQQ2zUIBubDUwSt37CWcMaWRbbvMFWpYer4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763603991; c=relaxed/simple;
	bh=YJdGpPCby78TiD5FWgY48sxCHPBOpQz+k3d4UJJuaPw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=hKhfOrW9svfglr8Rk709bc7gV7OopawGqPiU0Wimmm4Jh92Dd/Vs2496yJRHsEYRbLWcPEflu5CrfOKOzn2OgzD/0IT/whUR7N6Hr2EOCSBwxcvpzB0UHHW6n1HmPYO8gxHM8OXpqQaBUUHape+CU1y4A81aXlrLEGlYTbUcHI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; arc=none smtp.client-ip=220.181.50.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
From: "Li,Rongqing" <lirongqing@baidu.com>
To: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "hansg@kernel.org" <hansg@kernel.org>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>
Subject: panic on show_attr
Thread-Topic: panic on show_attr
Thread-Index: AdxZus5n8Le7D1zWTsaLLYonXiaCKw==
Date: Thu, 20 Nov 2025 01:59:25 +0000
Message-ID: <719de07e4eb14bd4afcfad9772e5f686@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-FEAS-Client-IP: 172.31.3.14
X-FE-Policy-ID: 52:10:53:SYSTEM

When both the intel-uncore-frequency.ko and intel-uncore-frequency-tpmi.ko =
modules are loaded, if the probing of intel-uncore-frequency-tpmi fails, th=
e intel_uncore_frequency_tpmi module fails to load. However, uncore_freq_co=
mmon_init() called by intel-uncore-frequency-tpmi has already replaced the =
uncore_read and uncore_write function pointers with those from intel-uncore=
-frequency-tpmi. Subsequent access to sysfs will then trigger a kernel pani=
c.

[  288.179765] BUG: kernel NULL pointer dereference, address: 0000000000000=
000
[  288.179772] #PF: supervisor read access in kernel mode
[  288.179775] #PF: error_code(0x0000) - not-present page
[  288.179776] PGD 7fabf95067 P4D 7fabf95067 PUD 7f929e2067 PMD 0
[  288.179780] Oops: 0000 [#1] PREEMPT SMP NOPTI
[  288.179783] CPU: 137 PID: 56850 Comm: cat Kdump: loaded Tainted: G      =
     OE      6.6.0#3=20
[  288.179787] RIP: 0010:uncore_read+0xb9/0x1e0 [intel_uncore_frequency_tpm=
i]
[  288.179793] Code: 84 df 00 00 00 48 c1 e8 0f 5b 83 e0 7f 69 c0 a0 86 01 =
00 89 06 31 c0 c3 cc cc cc cc 80 7f f0 00 0f 85 11 01 00 00 48 8b 47 f8 <48=
> 8b 00 83 e0 7f 5b 69 c0 a0 86 01 00 89 06 31 c0 c3 cc
 cc cc cc
[  288.179796] RSP: 0018:ffffc9000b5bfdb0 EFLAGS: 00010246
[  288.179798] RAX: 0000000000000000 RBX: ffff88ffcac4f400 RCX: 00000000000=
00000
[  288.179800] RDX: 0000000000000002 RSI: ffffc9000b5bfdc4 RDI: ffff88ffcac=
4f400
[  288.179801] RBP: 0000000000000002 R08: ffff88ffcb3c7b80 R09: 00000000000=
01000
[  288.179802] R10: 0000000000001000 R11: 0000000000000000 R12: ffff88ffcb0=
80000
[  288.179803] R13: 0000000000000001 R14: 0000000000000001 R15: ffff88ffcb0=
b8000
[  288.179804] FS:  00007f6b530b3740(0000) GS:ffff88ff7f840000(0000) knlGS:=
0000000000000000
[  288.179806] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  288.179808] CR2: 0000000000000000 CR3: 0000007f8f0e0003 CR4: 00000000007=
70ee0
[  288.179809] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 00000000000=
00000
[  288.179810] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 00000000000=
00400
[  288.179812] PKRU: 55555554
[  288.179812] Call Trace:
[  288.179814]  <TASK>
[  288.179816]  ? __die_body+0x1a/0x60
[  288.179822]  ? page_fault_oops+0x15d/0x460
[  288.179827]  ? xas_load+0x9/0xa0
[  288.179831]  ? filemap_get_entry+0xe2/0x160
[  288.179837]  ? exc_page_fault+0x60e/0x7f0
[  288.179840]  ? __mod_memcg_lruvec_state+0x4a/0xa0
[  288.179844]  ? asm_exc_page_fault+0x22/0x30
[  288.179848]  ? uncore_read+0xb9/0x1e0 [intel_uncore_frequency_tpmi]
[  288.179852]  show_attr+0x44/0xa0 [intel_uncore_frequency_common]
[  288.179857]  sysfs_kf_seq_show+0xa7/0x100
[  288.179862]  seq_read_iter+0x186/0x3e0
[  288.179866]  vfs_read+0x214/0x310
[  288.179869]  ksys_read+0x59/0xd0
[  288.179871]  do_syscall_64+0x8a/0x100
[  288.179875]  entry_SYSCALL_64_after_hwframe+0x78/0xe2
