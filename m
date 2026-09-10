Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AB3483BD9
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051735; cv=pass; b=iUy5rzf2nNs66WcmmrEBTgeCMKlgp/zKGjoWQJlMBN1c8blpsR8HxqRz1y/0lBiJxvtl8XuXFXq58cmgjrOSuK8OcniQnMty27708NL2KM5tAoy+yvT02FYSsz9XEtM3ozj/8RUTJ1eZmMiSfMsoPBxbrvm28rfIYc+cngeDMh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051735; c=relaxed/simple;
	bh=6sLSQ8cAg3ps9NP43BI41ma/3AAke+r6Xg4OXL5Yf8I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PsMeCrSP8t6IPdxqmr5WyYAZ0e06dCAcgPXg4JSZi1yPiD+4LR12LKaWTBaG/32uNSAh9DSgK5tQoY7pmbESqjdxiAseQEgLWI7vnC2Cies2dOYgDLHCKssrILVExf1LzW1qnI4IY1Ony9gyQY4QfAA7ceFlTI/v/yo5yQY/cX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AepMTpfi; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AepMTpfi"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-866e57f63a3so83617627b3.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 07:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789051731; cv=none;
        d=google.com; s=arc-20260327;
        b=fmaVzXysVDQmvyOMXinuMfDkUMmwbBwnB9fBY+h/nXIQwvNK5DaCuPJ6beHk/mhZyq
         ir4FqHI/C0EKxaspZeeBMDGwNRE2NPvjxpCeglDgWQIRUmSZNIvLjmyKJLG5Pa3aufY1
         wDgvf/eFpbXbyyMA9kt9sWz3Ldi5WVvx1xs6sHFYCWLByhLF5HjfYKFh0aEvNpzxuMWA
         PzdvBpUrvBkSci33qw8E7jtSlCxri4yI4LDz3lZ8sj5TgvArKZqYFe7FG9Q95lj4WICZ
         ro1nXcjLhPLDK5rwildOtYlvGSNN5bovdSRUD6PZT3ZvBoyy+XjFvB4ikcuLxz7FTadb
         pQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ni8B91MG4UdENsQP1YfkoP8wKAwkCPFzn6Fz6uXhfug=;
        fh=sbxZ5ffFU8v94SJ4G15SzjVApZfi6NXSWDVt5AAtT3s=;
        b=hII0VMxzqQVouc78AnDYkQR/TyS0Pw5/tq9CT449lG9kZe7TIH/GjAAmc3ZZbGKNCE
         CiToRor+ZQZkYFKLZMkPwGKyzhbtlIRwG3lxr0F2uAy3hxD3BgZOU0NPMEB8iCVQm/2W
         f8nZJu+jRh0Oy6S+wLio3t0tn0GUcKf/aUBI5nB9CzShbbBmd3vbr6AC4sWcXGpp8t/k
         k3bczYEcbAjOzlFPLhK3Ssxu7iPo6V74hN3i/cztQ/ea6Fe3D5Er4vqmKKivr7YsNkdz
         9Lh/hfutnu+Va1Tly3qVzPwKL+/bELbZms2OYyPy9wmIusJiNs8lQqphhDcpWEz61r6a
         6MkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789051731; x=1789656531; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ni8B91MG4UdENsQP1YfkoP8wKAwkCPFzn6Fz6uXhfug=;
        b=AepMTpfiHUHfazLw4vE4KhhqyUE20jeRfnCzlS59z7nQtzWnLsHNknOZM+I/Des4Go
         xPeuSaURbiQcCQs4dfSlXRF9cwtge7ZjS+EK8sLKFUoACItjQf9tkkP/++3UMXtk82+j
         IugUwye2RgxiXZumv5d5GNU2dPsRCypRTX6FsbDJFKiOuWBqU1fIGFiGx4E2ZSThT85E
         ZhdGtZz4WABsoplhbjSkrcwf801AAc5JnBWrj8pw13afyFoneI4q6E9+EhXgb6ZBm9jx
         6Tdz5jgt7H4M9oI7FsmuX++oh+eOJRIlririkW+FKecZebHTDAlDpiTllDI0uAafNgkw
         L+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051731; x=1789656531;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ni8B91MG4UdENsQP1YfkoP8wKAwkCPFzn6Fz6uXhfug=;
        b=gaXK3SsoLkR6hYvB7S8rvATtKUeafHANHwFRfpmnCnOcDF7rEuTdKpQDPJm9VE24YV
         rOgX+Oe8NmSWvbAjrdy6WBy8Wy7URXV1PDdhJAk3b5XndWJZD8yLUT87uinFjJksd3rL
         BMW4oCZ8hkrG7DO40PAFu66jv5JW6FSEsAhnFpLLtYM/lXBUmdUZXTzZdUQaxLlbZ+By
         CYZbZs37gagbToQraVv5PVijLPf2Suh8NJKynhw058SoXi7zlsJh2XXD3KVfaScNm54c
         B8kfZynnqAhZwnC9ahNiJ5jYeNprAxdQfMw0taU38dyOQzscHZCdIcFMcws8Lvc8w4Mr
         aUmA==
X-Gm-Message-State: AFuF++nXrTto5QhpF/E0fS/hH2dOYYA/ZR2EOdEEonbXwoGZyfpoOu/W
	Hr94JU2umstyfiX1aJhUj1KkVAW66eYmOAix1SblgiDTKRTFR+GmmISv3KbVciUHV3wC8HGzS5w
	Pvindlil/v9U9oy1/WlgwGRIEExoRNRQ=
X-Gm-Gg: AYBFou31ICXBQMcPpvf/TFQ+AwzW8w5+JQK+TMwPJwukmZFL9mrK04BGSDS8XtW5Vxo
	AyGcJUUmQLwL9h0v7cppgnWBvqX1wj+3Z4hbuCNATrPZsxkQW84KiA94muSNq/dv2Mr8HYwj/X2
	Es2MTVcBgjjfktFv4qLdLEv3Bkh8MJj9aH7GcCTERHqb3X4BNXMo8Q+3K+uiIf5de5+6x/cJJbZ
	sI5F6zWpAb/dySsCzlHgU1ekqQTyc2eCOYcGVCY3qn7EY6r9fvbUua4wcJCnv1jIzOOEyu5DRri
	+NN/p+XuEzaGULvYf5B8qphhZSKl/TxhcFQ9DIaNU2JdU/pjaOcoXZKVOmbHzMxJYAZ3oTkVsUX
	U34H+UMugoa42cZEdUpkDUbFVoadTwVwMfGycIFT7dFTRFDklsVfH9ln2cA==
X-Received: by 2002:a05:690c:e3cb:b0:883:b187:74dd with SMTP id
 00721157ae682-883b187761dmr9015347b3.42.1789051731155; Thu, 10 Sep 2026
 07:48:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marcel Moosbrugger <marcelmoosbrugger@gmail.com>
Date: Thu, 10 Sep 2026 16:48:39 +0200
X-Gm-Features: AcwNN1WM_VnZ5aZPjuznbT7TLsBiCOIhoYyyVolPYFyCg5L86MoOXvG28Ov0rus
Message-ID: <CABtUotPsNuAQERXacAs0fxrHVqa-Cxr4BFEED0xdE-nmwE=kgg@mail.gmail.com>
Subject: Arrow Lake-H 285H: FATAL BERT records that are pure Intel SoC/PMC
 crashlogs - two raw blobs, asking for a decode
To: david.e.box@linux.intel.com, xi.pardee@linux.intel.com, 
	irenic.rajneesh@gmail.com
Cc: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I have a laptop that hard-freezes about once per 20 hours of uptime. Five of
those freezes left FATAL BERT records consisting entirely of Intel SoC/PMC
crashlog sections, and I now have two of the raw blobs. I cannot decode the
payload and I do not think anyone outside Intel can.

  https://bugzilla.kernel.org/show_bug.cgi?id=221923

ASUS ROG Zephyrus G16 GU605CW, Core Ultra 9 285H (family 6 model 197
stepping 2), BIOS 311, microcode 0x122, Arch Linux. 22 freezes since
2026-05-04, on every kernel tried up to 7.2.3. No console, no SysRq, no
network; only a power-button hold recovers it. Every section in both records
is type 81212a96-09ed-4996-9471-8d729c8e69ed with record GUID
8f87f311-c998-4d9e-a0c4-6065518c4f6d. No IA32, memory or PCIe section, so
this is not an MCA, not DRAM ECC and not PCIe.

Two questions.

1. Can someone map these crashlog sections to a failing IP block, or point
   me to who can? Comparing the two records narrows it: their sections pair
   one-to-one by the first payload dword, two sections are byte-identical
   across two failures five days apart, four differ in under 3% of their
   bytes, and two differ in 66% and 80%. So the ~83 dwords that differ
   inside the near-identical sections are what changed between two
   independent instances of the same fault. They are listed in the bug with
   offsets and both values. That is as far as I can get blind.

2. pmt_crashlog never binds here. The VSEC enumerates telemetry only
   (intel_vsec.telemetry.0/1/2), there is no intel_vsec.crashlog device, and
   /sys/class/intel_pmt/ has telem1..13 and nothing else. The PMC is clearly
   capturing crashlogs since firmware publishes them through BERT. Is the
   missing crashlog capability expected on Arrow Lake-H mobile? If it were
   exposed, the driver that already exists could read this at runtime
   instead of only on the boot after an unrecoverable failure.

This is not one machine: the same CPU and iGPU on a ThinkPad T14p (Fedora
Discussion 183627) and an Arrow Lake desktop on Windows (Intel Community
thread 1751966) show the same signature, the desktop one with the same
0xdeadbeef-filled payload.

The bug sits under intel_idle because the one freeze that panicked did so on
idle exit. I have since run intel_idle.max_cstate=2 for 79 hours of exposure
and it froze anyway, so that lever is refuted here and the component is
probably wrong. Please move the bug if there is a better home.

I am happy to run patched kernels or any instrumentation you want, and I can
supply further blobs - at the current rate there is a new one most weeks.

Thanks,

>> DI Dr.techn. Marcel Moosbrugger, BSc
>> Computer Science - Researcher - Communicator
>> marcelmoos.com - linkedin.com/in/marcelmoos
