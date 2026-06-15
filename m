Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362423E716F;
	Mon, 15 Jun 2026 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525962; cv=none; b=I1UgL9x3+rAzQ6xfDiUXl8FId3i3vnPohIT3uqpvhYrAPkinIgufarvC79Ipju7i/oMSM84dO5E4m7MIuu5a2MjM/lrwUlwMv7cq61r3+jCQ1a8uV2KnX5TwjK0y5muaAOOglWXX7/sWwvyZJU12myLrSMNWx5yql6yQYoLgj5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525962; c=relaxed/simple;
	bh=b065dUNDkdhipyyvDXLoG8bZ+0HCjcbXXIhE40RLc+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZEOckTgvHd+GF1XyWe+cb27exZsjjf0a7x0JCUo0fULMkGBuPMhEoRS+pUhEM1zgshG5pGyLme8zR9ogV91cx4BzVzGMHBBJgR3EsJQ/X0h8JlbLpdAbYv4CEz8eKIP8bOZ7NIkJpo+w/RpC0CoeHC3RHE2i48safrwBZZsf28c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=t9DiSAZ8; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="t9DiSAZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781525958; x=1782130758; i=w_armin@gmx.de;
	bh=kXj7WfZcqO7QS9gXq5kRvhwCvS7NPg+iUV/UGqmX+Pc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=t9DiSAZ8deA2SlGIgtaxp6gWt3m4Y9TJEcNTvS/wxps3+Ard2bAtgEPdDKaSxJVy
	 xyAg+EyGslkoxT7jb62sPLqiRpRWpRVWxNik43ldHUfa/yOFsDt+S4ZZ2o+a8RIOe
	 Ph8Y4sUoyxCa1m4OHlBg3uB1VSMjeWpkKmw9lK6w6o9jDZi2c+2uXyGJ6ffOlB+co
	 gCzEpkbV+BDHMizrXlotEnsfVYZiOhyNGHh6jp3DOLlGK6b1M/lOptN7EC+Anlvdt
	 g/O16HcjJdvQcLG2bnsik327jxjvabnEPGp3pa3u7+/FWT+7zKuOIhdHPdQ1788U3
	 svhZ+hGGDX/JZ2x8qw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzhj9-1xTpZf1V9l-00yYbJ; Mon, 15
 Jun 2026 14:19:18 +0200
Message-ID: <543e7c0f-ae4b-49e4-8bdf-6bf7d0dc4775@gmx.de>
Date: Mon, 15 Jun 2026 14:19:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] KASAN: slab-use-after-free in _copy_to_user from
 platform/x86/dell-smbios-wmi
To: Shuangpeng Bai <shuangpeng.kernel@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, Dell.Client.Kernel@dell.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <178144969601.60470.13396800403157907003@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <178144969601.60470.13396800403157907003@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:kVJkq5/Sz6L7/pSGEG9lxiX8GWuMKcZhEPnTCggKFAgTcuzMv1X
 gSZjqB6Uz/iBQrS6KvDzfHMPzt4oyWkVJDZajpq93IjqgjUd62oDDsIpvzcLIUmCzqxKH30
 ha9HrlIQ2yA72/VwFU2SnQTFe+YrvdYi6I2OBYZMv1/2Udb9CumVo/C17W6zffWPfGBfh0l
 oYMOLSJT7bjH11x3hEdRQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Cio/VNAyNo4=;E//scZKRnUzTxojv8dQUHyAf+QX
 +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
 uXhv+8Quo=

Am 14.06.26 um 21:15 schrieb Shuangpeng Bai:

> Hi Kernel Maintainers,
>
> I hit the following report while testing current upstream kernel:
>
> KASAN: slab-use-after-free in _copy_to_user from platform/x86/dell-smbios-wmi
>
> on commit: e8c2f9fdadee7cbc75134dc463c1e0d856d6e5c7 (May 25 2026)
>
> The reproducer and .config files are here.
> https://gist.github.com/shuangpengbai/f5b15c099e80897486b4238ddb91df79
>
> I'm happy to test debug patches or provide additional information.

It seems that unbinding the dell-smbios-wmi driver races with any outstanding
file operations on the misc device, causing them to access memory already freed
by the unbound driver.

I do not know if the misc device synchronizes file operations against removal,
but i do not think that this is the case. I added the maintains of the char drivers
to the discussion, maybe they know this.

Thanks,
Armin Wolf

>
> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>
> [   92.502430][ T8394] BUG: KASAN: slab-use-after-free in _copy_to_user (include/linux/instrumented.h:129 include/linux/uaccess.h:205 lib/usercopy.c:26)
> [   92.504528][ T8394] Read of size 8 at addr ffff888126eec360 by task dell_smbios_wmi/8394
> [   92.506899][ T8394] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> [   92.506905][ T8394] Call Trace:
> [   92.506914][ T8394]  <TASK>
> [   92.506919][ T8394]  dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
> [   92.506931][ T8394]  print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
> [   92.506956][ T8394]  kasan_report (mm/kasan/report.c:595)
> [   92.506972][ T8394]  kasan_check_range (mm/kasan/generic.c:? mm/kasan/generic.c:200)
> [   92.506979][ T8394]  _copy_to_user (include/linux/instrumented.h:129 include/linux/uaccess.h:205 lib/usercopy.c:26)
> [   92.506986][ T8394]  simple_read_from_buffer (include/linux/uaccess.h:236 fs/libfs.c:1155)
> [   92.506998][ T8394]  vfs_read (fs/read_write.c:572)
> [   92.507049][ T8394]  ksys_read (fs/read_write.c:717)
> [   92.507072][ T8394]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
> [   92.507095][ T8394]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> [   92.507163][ T8394]  </TASK>
> [   92.530149][ T8394] Freed by task 8394 on cpu 0 at 92.299564s:
> [   92.530733][ T8394]  kasan_save_track (mm/kasan/common.c:57 mm/kasan/common.c:78)
> [   92.531183][ T8394]  kasan_save_free_info (mm/kasan/generic.c:584)
> [   92.531673][ T8394]  __kasan_slab_free (mm/kasan/common.c:253 mm/kasan/common.c:285)
> [   92.532133][ T8394]  kfree (include/linux/kasan.h:235 mm/slub.c:2689 mm/slub.c:6251 mm/slub.c:6566)
> [   92.532509][ T8394]  devres_release_all (drivers/base/devres.c:50 drivers/base/devres.c:547 drivers/base/devres.c:576)
> [   92.533000][ T8394]  device_release_driver_internal (drivers/base/dd.c:598 drivers/base/dd.c:1357 drivers/base/dd.c:1375)
> [   92.533574][ T8394]  unbind_store (drivers/base/bus.c:244)
> [   92.534021][ T8394]  kernfs_fop_write_iter (fs/kernfs/file.c:352)
> [   92.534531][ T8394]  vfs_write (fs/read_write.c:595 fs/read_write.c:688)
> [   92.534950][ T8394]  ksys_write (fs/read_write.c:740)
> [   92.535364][ T8394]  do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_64.c:94)
> [   92.535811][ T8394]  entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
> [   92.536610][ T8394] The buggy address belongs to the object at ffff888126eec300
> [   92.536610][ T8394]  which belongs to the cache kmalloc-192 of size 192
> [   92.537941][ T8394] The buggy address is located 96 bytes inside of
> [   92.537941][ T8394]  freed 192-byte region [ffff888126eec300, ffff888126eec3c0)
>
>
> Best,
> Shuangpeng
>
