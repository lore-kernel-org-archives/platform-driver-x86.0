Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30FC23EAAB
	for <platform-driver-x86@vger.kernel.org>; Thu, 20 Nov 2025 18:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763663074; cv=none; b=uBtYAPMqJToZdKbTE/pg101M2MDOUEzHTetLE2sPA3dgQ53MI/KzqKzo2NdkF2Fp0Jvmh/5bOzhuAcO07H0aewdKUjwpDCqZZZ/PeXMahMmCDjnHjJGO553lD17TRIr3a2x7KDn2QW+1rDXFjKgHpUMrZpYp8xEnGVVC4s6Yvjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763663074; c=relaxed/simple;
	bh=rV3TlEZ7nzJKqQ+KdAqKfYfWE+Dhk6OLNLEXd0hPpPw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nWwdlAxJwuZSaoJDs0SQSzDoSj+bgdpBztomH7asTE31H03u20XZvQv+crl0+yDPj73nP6Q3sw5xgJIY9cusOUbBJ3eaHQJCeITTTtUFTkR45kzBYNAQ1xzMblWzlu0J8oPs8pcox28LFuwgU/xCtFF6LBqMk1NVi1Y4uu/pRo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpIRubKT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpIRubKT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763663073; x=1795199073;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=rV3TlEZ7nzJKqQ+KdAqKfYfWE+Dhk6OLNLEXd0hPpPw=;
  b=VpIRubKTFMwh4zqTkaS2b+op9BXhVhUH5cxQRZGbyhWcoma+q6YqAbob
   qKKVNvd/8337HbdG7ch7lW4oGqL/9KkgArNE9ePLGniqc8p5mtKoebAVJ
   royG3enNFKaVVRSjQy9aeepv/D/JpRUxIB7cThbMpyQz78anBk9v8NJGs
   ZikSqmdJtHis8Ti17pWnM40BDuFOz3vp1qe+dyh48QK9Ax1MWIOt0vkHq
   mkgbfVQ9DAjCAUX4z2xakFVPSBGrc6ErBfhobtYfr2qH0fk3Np1ny12em
   Y9JwLwzRx0N0TbnYHjG14IwplhD3B4Ug7pokOBZ+U5ezWrX7xkF0DI47e
   g==;
X-CSE-ConnectionGUID: x65xxDv2SXKcAhxz0RwZkQ==
X-CSE-MsgGUID: QWyVEu9eQjiaQzFIhJD7Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69362315"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69362315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 10:24:32 -0800
X-CSE-ConnectionGUID: aDe7ExMsSO+eYjVzPoRXHw==
X-CSE-MsgGUID: YHmdP3ENQTmtNEH65jFCMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="190676056"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 10:24:32 -0800
Message-ID: <bebab37ece85f7680085ff1bb10d64bf964bcb55.camel@linux.intel.com>
Subject: Re: panic on show_attr
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: "Li,Rongqing" <lirongqing@baidu.com>, "hansg@kernel.org"
 <hansg@kernel.org>,  "ilpo.jarvinen@linux.intel.com"	
 <ilpo.jarvinen@linux.intel.com>
Cc: "platform-driver-x86@vger.kernel.org"
	 <platform-driver-x86@vger.kernel.org>
Date: Thu, 20 Nov 2025 10:24:31 -0800
In-Reply-To: <ddc761afc091323bec7cb9eeb8df35d11afb4efb.camel@linux.intel.com>
References: <719de07e4eb14bd4afcfad9772e5f686@baidu.com>
	 <ddc761afc091323bec7cb9eeb8df35d11afb4efb.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-11-20 at 09:46 -0800, srinivas pandruvada wrote:
> On Thu, 2025-11-20 at 01:59 +0000, Li,Rongqing wrote:
> > When both the intel-uncore-frequency.ko and intel-uncore-frequency-
> > tpmi.ko modules are loaded, if the probing of intel-uncore-
> > frequency-
> > tpmi fails, the intel_uncore_frequency_tpmi module fails to load.
> > However, uncore_freq_common_init() called by intel-uncore-
> > frequency-
> > tpmi has already replaced the uncore_read and uncore_write function
> > pointers with those from intel-uncore-frequency-tpmi. Subsequent
> > access to sysfs will then trigger a kernel panic.
>=20
> If probe fails then there should be nothing to read from sysfs.
> Please confirm your kernel version.
> Particularly if you have a change
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c?h=3Dv6=
.18-rc6&id=3Ddb643cb7ebe524d17b4b13583dda03485d4a1bc0
>=20

Also you said you said intel-uncore-frequency.ko is loaded. That means
that your kernel may have added a cpu model here for this platform
which has TPMI. I think better to reproduce in an upstream kernel.
https://elixir.bootlin.com/linux/v6.17.8/source/drivers/platform/x86/intel/=
uncore-frequency/uncore-frequency.c#L230

Thanks,
Srinivas

> Thanks,
> Srinivas
>=20
> >=20
> > [=C2=A0 288.179765] BUG: kernel NULL pointer dereference, address:
> > 0000000000000000
> > [=C2=A0 288.179772] #PF: supervisor read access in kernel mode
> > [=C2=A0 288.179775] #PF: error_code(0x0000) - not-present page
> > [=C2=A0 288.179776] PGD 7fabf95067 P4D 7fabf95067 PUD 7f929e2067 PMD 0
> > [=C2=A0 288.179780] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > [=C2=A0 288.179783] CPU: 137 PID: 56850 Comm: cat Kdump: loaded Tainted=
:
> > G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OE=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 6.6.0#3=20
> > [=C2=A0 288.179787] RIP: 0010:uncore_read+0xb9/0x1e0
> > [intel_uncore_frequency_tpmi]
> > [=C2=A0 288.179793] Code: 84 df 00 00 00 48 c1 e8 0f 5b 83 e0 7f 69 c0
> > a0
> > 86 01 00 89 06 31 c0 c3 cc cc cc cc 80 7f f0 00 0f 85 11 01 00 00
> > 48
> > 8b 47 f8 <48> 8b 00 83 e0 7f 5b 69 c0 a0 86 01 00 89 06 31 c0 c3 cc
> > =C2=A0cc cc cc
> > [=C2=A0 288.179796] RSP: 0018:ffffc9000b5bfdb0 EFLAGS: 00010246
> > [=C2=A0 288.179798] RAX: 0000000000000000 RBX: ffff88ffcac4f400 RCX:
> > 0000000000000000
> > [=C2=A0 288.179800] RDX: 0000000000000002 RSI: ffffc9000b5bfdc4 RDI:
> > ffff88ffcac4f400
> > [=C2=A0 288.179801] RBP: 0000000000000002 R08: ffff88ffcb3c7b80 R09:
> > 0000000000001000
> > [=C2=A0 288.179802] R10: 0000000000001000 R11: 0000000000000000 R12:
> > ffff88ffcb080000
> > [=C2=A0 288.179803] R13: 0000000000000001 R14: 0000000000000001 R15:
> > ffff88ffcb0b8000
> > [=C2=A0 288.179804] FS:=C2=A0 00007f6b530b3740(0000)
> > GS:ffff88ff7f840000(0000)
> > knlGS:0000000000000000
> > [=C2=A0 288.179806] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> > [=C2=A0 288.179808] CR2: 0000000000000000 CR3: 0000007f8f0e0003 CR4:
> > 0000000000770ee0
> > [=C2=A0 288.179809] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> > 0000000000000000
> > [=C2=A0 288.179810] DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7:
> > 0000000000000400
> > [=C2=A0 288.179812] PKRU: 55555554
> > [=C2=A0 288.179812] Call Trace:
> > [=C2=A0 288.179814]=C2=A0 <TASK>
> > [=C2=A0 288.179816]=C2=A0 ? __die_body+0x1a/0x60
> > [=C2=A0 288.179822]=C2=A0 ? page_fault_oops+0x15d/0x460
> > [=C2=A0 288.179827]=C2=A0 ? xas_load+0x9/0xa0
> > [=C2=A0 288.179831]=C2=A0 ? filemap_get_entry+0xe2/0x160
> > [=C2=A0 288.179837]=C2=A0 ? exc_page_fault+0x60e/0x7f0
> > [=C2=A0 288.179840]=C2=A0 ? __mod_memcg_lruvec_state+0x4a/0xa0
> > [=C2=A0 288.179844]=C2=A0 ? asm_exc_page_fault+0x22/0x30
> > [=C2=A0 288.179848]=C2=A0 ? uncore_read+0xb9/0x1e0
> > [intel_uncore_frequency_tpmi]
> > [=C2=A0 288.179852]=C2=A0 show_attr+0x44/0xa0 [intel_uncore_frequency_c=
ommon]
> > [=C2=A0 288.179857]=C2=A0 sysfs_kf_seq_show+0xa7/0x100
> > [=C2=A0 288.179862]=C2=A0 seq_read_iter+0x186/0x3e0
> > [=C2=A0 288.179866]=C2=A0 vfs_read+0x214/0x310
> > [=C2=A0 288.179869]=C2=A0 ksys_read+0x59/0xd0
> > [=C2=A0 288.179871]=C2=A0 do_syscall_64+0x8a/0x100
> > [=C2=A0 288.179875]=C2=A0 entry_SYSCALL_64_after_hwframe+0x78/0xe2
