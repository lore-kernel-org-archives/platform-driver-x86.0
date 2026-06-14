Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0B2264A9
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 19:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781464525; cv=none; b=WiSd4wYHJsJtsCiEIcLoySZ56KOgQf1TQGBP3eblGggKxDXxN8K8bDCL174VRC+Ue79mxNKtu84QrspqtirqOorvawzYsAClu4XgE15ehq9qJ4ydy2iD+N4vdFEJHmeP0pLF15ROkPCH6U6R8IZqKX4ZOuLEtTHDnDwyt/dKlH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781464525; c=relaxed/simple;
	bh=f//meuu8g3borS9BCVOmV8Pd6VXY0RXkofVVO9G16TY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o0+Ui93G5zWwUuHceIALLK9N/Pl4OHEmyfufZT1y9HVLiUaeeG1Vhhz0PpiiWARC8jQFo/9FMjy2tlTRCjY3nzzrSHAiuGUhP6BtnujV3ya7XiDV1+0DR8ZVHGCvb9UvCnEaNg3Ta4C8wVUrM5UIACpIFcw98BNncwYH+QmLm/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifvxo6rd; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifvxo6rd"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51778069c31so23942801cf.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 12:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781464523; x=1782069323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqeTJ2Fy+KcFc+nmN5+7/jAkUKl2tFCO/H9BcaEfm74=;
        b=ifvxo6rd8RtCH/8fQh8uu0vtdmVRbNTnhR+8fcf2uu5icAaooni/qy/t2BQybYztrv
         J0odYqKUzVyjMEUO6JtuPK3F3JatzAZpLrtlmcGXS3IsOiHbwSgramIPOu1aJ8F1w+t0
         McO2W3lm8fSHxRCa3EhdoLetB8MnRfEQpIx8hDbdGkrEnfsFJEQL/OGyh2g5gdf0GwaT
         gOn2OgGFYc3ex1HbMzsqvjHkFzPLBppk590kG/AQuWuhifO43LqXNBFRWnqjRwEiqWYG
         AqQDm08MKW12+3UMj/9s1rmtnh9Yx7FaCwuMW5nvkOa/gvK8dVI98UNzSP0cPLRtqmFs
         aSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781464523; x=1782069323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqeTJ2Fy+KcFc+nmN5+7/jAkUKl2tFCO/H9BcaEfm74=;
        b=V8qcKSxoGU4p34LbLx89Jio/FV2xgSWFMgy8f26tyd/msN9kS0bc5wPISydPUSUwFS
         y72nHGH594ZPEjqMMcQrPQg3LSad9V9RNTnuyRnhtkDIuzHzYYaI9dBB7e6YsqcX/cSy
         KcHiSPDWKF8CgF4ZME595Mq0UwK8LhD5O7MmarHjeRQZoIQysaiCIWN0rUhEDEylVRic
         YItspwJi0FeUUPIm4mdER8pWbKebp/fD1Za36p68mAchFiR7PGcpClM+hsb1r8a8FDHa
         g71jhZa0dVaNaCWCRNtWpkn2r1qnmtefwanqLcvT/xtJ7HQukl+HfEVd5xveAPJ/Ey4o
         m3ug==
X-Forwarded-Encrypted: i=1; AFNElJ+Fl+syeRdPOtzOPjGFo6TWaKKjkLskYPODLliIcGzxuwNPXWxOYFOD8ddXALwmxleL5aPp80/BPM3U0op1FQ1FWMrd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/hTfbHmXe6H+59vxt8Aib66mf78XeuSXUmNUajPhtgDYxzw52
	8+TdxRL/Kwdq26UvP8FdZ9wiZT8+Iv3YIwqwDAHJsdawBaitOvwOrmxW
X-Gm-Gg: Acq92OE1F403O3Y+LgPHBLCWz9RftLIgOeRDD8KiUHQNk819d7Nkxg5nPz1kU00wtuu
	NMKGIVAu2YB6UK+w6N4d6ajp0++UJbmR6J/nkxn0DX21YfqOWwGBUweN0zhQX0FF6A47GWKjFv1
	LU/5Kj8t4A18/WJ/5KPMX4gN0eP33UZ3pxiskH8QVWf2glhlo8y4fwaU35wGjIUCCL3OLUh7mdy
	EjcEyTgVn27ztoZV71rCn0XlvJpVftXZo1UeIkv756/9nzL3Y1nDB1KsFdERmb/XtMyNkD3tHS7
	kNP6jSXb3sYJk6U0XBAyK2uXbPC0Mq+JqIbVANleDxZIhoS0WVKLMWhhOWict6OaMKUcf1APmpN
	+tc1W7dfF+PSB7aFutv2gQ8DYOPH/0EMUErI564EbJWGmTW6VTDnK4Shizbjsc2wQOwhi+5EZID
	AMW7FZDEbNaNj8ja/al2Ghp0qSAmxb9fTELMPI6D/dj88odi/NERJt0SfXHK2za3urmiF+W7Vx0
	w==
X-Received: by 2002:a05:622a:164b:b0:516:dbf6:f8e7 with SMTP id d75a77b69052e-517fe22fa58mr169493721cf.17.1781464522577;
        Sun, 14 Jun 2026 12:15:22 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:a8d1:8eec:5c3c:2f7e:d7e3:b1bd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb61eaf4sm81619901cf.4.2026.06.14.12.15.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 12:15:22 -0700 (PDT)
From: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	W_Armin@gmx.de,
	Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] KASAN: slab-use-after-free in _copy_to_user from platform/x86/dell-smbios-wmi
Date: Sun, 14 Jun 2026 15:15:20 -0400
Message-ID: <178144969601.60470.13396800403157907003@gmail.com>
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

KASAN: slab-use-after-free in _copy_to_user from platform/x86/dell-smbios-wmi

on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)

The reproducer and .config files are here.
https://gist.github.com/shuangpengbai/f5b15c099e80897486b4238ddb91df79

I'm happy to test debug patches or provide additional information.

Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>

[   92.502430][ T8394] BUG: KASAN: slab-use-after-free in _copy_to_user (include/linux/instrumented.h:129 include/linux/uaccess.h:205 lib/usercopy.c:26)
[   92.504528][ T8394] Read of size 8 at addr ffff888126eec360 by task dell_smbios_wmi/8394
[   92.506899][ T8394] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[   92.506905][ T8394] Call Trace:
[   92.506914][ T8394]  <TASK>
[   92.506919][ T8394]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
[   92.506931][ T8394]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
[   92.506956][ T8394]  kasan_report (mm/kasan/report.c:595)
[   92.506972][ T8394]  kasan_check_range (mm/kasan/generic.c:? mm/kasan/generic.c:200)
[   92.506979][ T8394]  _copy_to_user (include/linux/instrumented.h:129 include/linux/uaccess.h:205 lib/usercopy.c:26)
[   92.506986][ T8394]  simple_read_from_buffer (include/linux/uaccess.h:236 fs/libfs.c:1155)
[   92.506998][ T8394]  vfs_read (fs/read_write.c:572)
[   92.507049][ T8394]  ksys_read (fs/read_write.c:717)
[   92.507072][ T8394]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[   92.507095][ T8394]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   92.507163][ T8394]  </TASK>
[   92.530149][ T8394] Freed by task 8394 on cpu 0 at 92.299564s:
[   92.530733][ T8394]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
[   92.531183][ T8394]  kasan_save_free_info (mm/kasan/generic.c:584)
[   92.531673][ T8394]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
[   92.532133][ T8394]  kfree (include/linux/kasan.h:235 mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
[   92.532509][ T8394]  devres_release_all (drivers/base/devres.c:50 drivers/base/devres.c:547 drivers/base/devres.c:576)
[   92.533000][ T8394]  device_release_driver_internal (drivers/base/dd.c:598 drivers/base/dd.c:1357 drivers/base/dd.c:1375)
[   92.533574][ T8394]  unbind_store (drivers/base/bus.c:244)
[   92.534021][ T8394]  kernfs_fop_write_iter (fs/kernfs/file.c:352)
[   92.534531][ T8394]  vfs_write (fs/read_write.c:595 fs/read_write.c:688)
[   92.534950][ T8394]  ksys_write (fs/read_write.c:740)
[   92.535364][ T8394]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
[   92.535811][ T8394]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
[   92.536610][ T8394] The buggy address belongs to the object at ffff888126eec300
[   92.536610][ T8394]  which belongs to the cache kmalloc-192 of size 192
[   92.537941][ T8394] The buggy address is located 96 bytes inside of
[   92.537941][ T8394]  freed 192-byte region [ffff888126eec300, ffff888126eec3c0)


Best,
Shuangpeng
