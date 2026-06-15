Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5721DA62E
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 01:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781486453; cv=none; b=mwE2nnfHnlFBqJJ55Ggr5nVCxjaesZHNe7cpckA5wP2dK8p2gxNwL01yx0g7eM/p2ghYzZX+lmTOpDwSEeein1AVMdYmAciqcyzgzLk8gteWZHhZZ1UY/MrhjN2nPS5JxslxdTEKe+6tf5VodkLNAL+LtPMPbfbu0y0RpqCxcb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781486453; c=relaxed/simple;
	bh=PXYZgApfnqyVIa4YaH4NEUHGEvNUmcWjcTZCp8VE/vk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gf6pGr83KzKT/4bJAj7F4mjf+299vJiweJwAJBkjH/0TiYtt3ceUwa5K0dAmZl3dhPThlGHbebbfcw7SrPPqgPcBLiLMpeTXQjOo8o1MFRSwMgIxTaZx48oeRAFhCaUpJOoA07F7CIcwqFgjXjfWsaXla/gOqOhW9wDO0NtsL3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWqXR342; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWqXR342"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-517de710886so23861951cf.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 18:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781486450; x=1782091250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr+bOdlVOxOVCfKz1xLps1z0GSeCacR0QQvvN176IbE=;
        b=AWqXR342ySp+pDv8DhQ88dMdsvSt6xvgUlOxol0UugI81zDlr4Cyyyx9JIc8uKShzP
         yNO2HbJFrM+KvjZjykCzlQBBs389jg4ixzx2grZKepe5+DKUzwdOWuqSvjtMkvWykxwM
         Ep1R1f/DVnVEj1lWRlKW1HDWqOY2TG+h8k+y+fQhxohqKUGRGlGdkFIFEQXZl79xVORu
         6U7rbRDUetBUC30J6v9Emlg0kLp1OAozUWNFSTPdx1XbI9tUIlvPLjQTd4+ldLOGAkqO
         wrmdMGs8fECk/jN1nKMpDxX7VjhxuIzrf4g1vZC82t87QFuLA9vEYwERBqRA7tgZOu+j
         MYgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781486450; x=1782091250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wr+bOdlVOxOVCfKz1xLps1z0GSeCacR0QQvvN176IbE=;
        b=P5MDI9DhRu9jBVVO8StsPUIyMqUZZEd6myAy8Kgc6JmN8qm0YBSgDotH1RX+AvgAQ3
         b0/eb4WKq3oXNibCqivWnsdsKSVZZAO9KbT5Ah+hYC44QS7sTSid8r4/2nJGRGIxnUQY
         d7Kvi0NWo+Q/jKFn/I+6OLJel1WVSYIFEwxV4o6NiaLjkHjmeHuF8NLMGKBVG+69/sro
         H2Kt6VRN20l5Pse2Cfleuw5dqP1o0o4s7FaCOuplJtcblfVjCsxTXiiGFd2ANETJWfUb
         adWw6L9c1L6+KaQpcps9nz11EbraGt2vZXpvaa+3YJNbYYk+hSMdIB5OLxqnJWUz4Oms
         y+CQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Yx1qx4owPC//jCkXe2CUJSumruuDZxcPtxM68y0FP0m8TeSEiWvD6yJ6sChSS4AoT6/co6XR9ElmkGpoEML3Dq78b@vger.kernel.org
X-Gm-Message-State: AOJu0YyBuqDhyMWp2DedvyI4k/8Jb37psuKOfzkxIHz+1PwNZ+3/VeMT
	RI2woY/aOBeWHAcoKAzMZaE5Vj1Xtan5ow0QAJW/aCs8c9t5I9VYJ0nK
X-Gm-Gg: Acq92OEkgYJ5+1Y9RESgOylhx2k8gCQtyW51dbqZ9+MzUcR6iPXvf9nZMbyk2X3JTYX
	hb6dFtzUADWGo1eGtvnOYer4pWYzYm2BKpLmwt1FnpItev2pcL72F/p8oXrfa41du8yoJCtVPRX
	f40k6tlk42DY2BHMzYJXRItx3DMAtt+pQfWjS5kkC/G9Hhi8yAIIa6e+3TrhdkRaiGSGqMJEEbw
	msb4kjJiQT0Q/asFY7nmeAtbKCmbMg3yZdzU8D9CWQdzsTjrrxrVoqiBBn+nycw1r9FN2O6WOgZ
	FeYOqQSfye3ZkbMG8ypp7WriqTY6/Qb4TDp/LkMauppRwddjjHESXQ1NgAIQfUWMY2wsrYinPNp
	mjC/UOKso+RZ9i/m0vdDNdBEgUGEY8f4OLwAJI5Sm/mizslSgLU40sYKWoQaY4DAOkEeeKpBLsE
	Gb39i5Jsak5IOvSxUxaITY+JINw8xSJQzFJPbqcMQ9FMOVOoRvlDF22UxOqVSryUorVhwqdQ==
X-Received: by 2002:a05:622a:2282:b0:517:6804:1fb3 with SMTP id d75a77b69052e-517fe230d82mr191301451cf.18.1781486450189;
        Sun, 14 Jun 2026 18:20:50 -0700 (PDT)
Received: from localhost.localdomain ([2601:985:4601:5df0:2106:6ce9:6b1:8f70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb854290sm91326681cf.31.2026.06.14.18.20.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 18:20:49 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: pali@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] KASAN: slab-use-after-free in smo8800_misc_release
Date: Sun, 14 Jun 2026 21:20:48 -0400
Message-ID: <178144969601.60470.2802762361760676957@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Kernel Maintainers,

I hit the following report while testing current upstream kernel:

KASAN: slab-use-after-free in smo8800_misc_release

I reproduced this on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/0e7f7e0272ec4df28a7070a6e757b03b

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[   54.037363][ T8372] BUG: KASAN: slab-use-after-free in smo8800_misc_release (include/linux/instrumented.h:97 include/asm-generic/bitops/instrumented-atomic.h:41 drivers/platform/x86/dell/dell-smo8800.c:95)
[   54.039643][ T8372] Write of size 8 at addr ffff888120aa1c90 by task smo8800_oldfd_r/8372
[   54.042358][ T8372] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   54.042364][ T8372] Call Trace:
[   54.042373][ T8372]  <TASK>
[   54.042379][ T8372]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[   54.042393][ T8372]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[   54.042436][ T8372]  kasan_report (mm/kasan/report.c:595)
[   54.042454][ T8372]  kasan_check_range (mm/kasan/generic.c:? mm/kasan/generic.c:200)
[   54.042463][ T8372]  smo8800_misc_release (include/linux/instrumented.h:97 include/asm-generic/bitops/instrumented-atomic.h:41 drivers/platform/x86/dell/dell-smo8800.c:95)
[   54.042471][ T8372]  __fput (fs/file_table.c:510)
[   54.042487][ T8372]  fput_close_sync (fs/file_table.c:615)
[   54.042523][ T8372]  __x64_sys_close (fs/open.c:1507 fs/open.c:1492 fs/open.c:1492)
[   54.042534][ T8372]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[   54.042549][ T8372]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   54.042621][ T8372]  </TASK>
[   54.064208][ T8372] Freed by task 8372 on cpu 0 at 53.931664s:
[   54.064831][ T8372]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[   54.065319][ T8372]  kasan_save_free_info (mm/kasan/generic.c:584)
[   54.065842][ T8372]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
[   54.066340][ T8372]  kfree (include/linux/kasan.h:235 mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
[   54.066752][ T8372]  devres_release_all (drivers/base/devres.c:50 drivers/base/devres.c:547 drivers/base/devres.c:576)
[   54.067280][ T8372]  device_release_driver_internal (drivers/base/dd.c:598 drivers/base/dd.c:1357 drivers/base/dd.c:1375)
[   54.067908][ T8372]  unbind_store (drivers/base/bus.c:244)
[   54.068376][ T8372]  kernfs_fop_write_iter (fs/kernfs/file.c:352)
[   54.068920][ T8372]  vfs_write (fs/read_write.c:595 fs/read_write.c:688)
[   54.069355][ T8372]  ksys_write (fs/read_write.c:740)
[   54.069803][ T8372]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[   54.070280][ T8372]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   54.071132][ T8372] The buggy address belongs to the object at ffff888120aa1c00
[   54.071132][ T8372]  which belongs to the cache kmalloc-192 of size 192
[   54.072546][ T8372] The buggy address is located 144 bytes inside of
[   54.072546][ T8372]  freed 192-byte region [ffff888120aa1c00, ffff888120aa1cc0)


Best,
Shuangpeng
