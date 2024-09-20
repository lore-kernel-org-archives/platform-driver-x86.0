Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C126C148
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Sep 2024 16:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726849152; cv=none; b=aPB2HULFPj96S1rzCDBPQdPiiw4zvxrIISDp3naVSHt+74+xIsQYphnMLg9OjlgAKjxI7GUTbx5Mpr1JSfDbdZEJrcB9ojfiwGcCRCQoMbxDl8Ue9qa11XP0MHya0OGumhGBLV3LZaURsPEc28G0M0TcT7f/yKkE0t311vTFgmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726849152; c=relaxed/simple;
	bh=gVSNwKFKksWIUDw5SExe/nhxK/EhPMd31R8Qdh5BzmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=buYAIUblkQVibwIocpNgQoHD8IKjrx1BL4xFiOZjldZiIxPj+eEAINOpnxvTlTTNsz3mXNgDJ79gJjKvCkvDLhyh5tGUMAv4kYdcuenucNHVzqx7SBWJaHaLDy7wvBfAYEjMZvUg+cawCGihjXOr/u1DeWWyEiYpesQdKceTujA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EloLA9LP; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EloLA9LP"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2059204f448so20925215ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Sep 2024 09:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726849151; x=1727453951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhMzuAeK8176K6j45t6OzEv6vQ+A4zzAB2+eLqDK1sw=;
        b=EloLA9LPIyC6tfxsLv9LTiHYp6yUCvsMLWwvwkP2Cf4KfB/u7gNmMzIHGpBtji4C60
         CvUljkIx0N1s1Sgh61rbneQBQsLkFytTIjgqNGjI1JkfwsWQEB00fVl0aIRWkVO/nPuv
         vFr6k4iTNNCKEqBbOtOb7ona/YgWH9dcxUt/Ge7vpleASQyVs+Z+4HpqwmBUBmSu+abd
         zOhnfVyHTBcG6pbPDeiyRXjVShooyx5W702p9RD00ACUlg5LENRpzAFD5pplK6Ykxp+F
         2OLOrUegQoAxq6lH9u3DxHWaAAMZaXoM0pkVqI1ncZyqC6/XP5qVdrrL9uyEwTV/vGIx
         hw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726849151; x=1727453951;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YhMzuAeK8176K6j45t6OzEv6vQ+A4zzAB2+eLqDK1sw=;
        b=tOHPjxnjUb4yzwkCndD5kMam9YHHFWEjdRw0xALTkMirm109teY1oVTmfGiD0uLYBw
         sTxHsXMKQkBqzWpdVrvlpFgf1oaIGC0S8AnWNL618nEneDeE4RysXUdbZ9XHMQQzkcME
         v5N+6kaK8WGBAP9WyMZAXjlZARaggbNe4Hm04Axx36wXoHHDkXmZz0m7FTX3k7HZ8XKC
         QRfdLCRHxoYJEBc4WE3Uvwp7imD61hFft6z2VnSTP6aUHrAy3O6gowUDtWMvToc5Ulbc
         5M7Lfi30kkv60DmrzZQy62RbS5lTt3a9ZOjobEdBEMZfgU9a/CpZ+tS3HM0IVi0dEtCe
         dRmw==
X-Gm-Message-State: AOJu0YyPVCkQIK7ncBgv1A9CxQ4h+yfB4VhZBmtxqtc6Fcn6d1m44VMC
	7Xt+mzq1hPH6xH+WC9l3yr5DjtB3x46LO7G2dyzM0mBCpg12Cjvc
X-Google-Smtp-Source: AGHT+IFfSBNyb/89POK30lt6/eFoBpjEw2K9hnXl2ykbvx2P6e6AY1D0XerW9e84mzHST44x26YMtg==
X-Received: by 2002:a17:902:fc4d:b0:205:913b:d9cb with SMTP id d9443c01a7336-208d97f345fmr51976025ad.7.1726849150455;
        Fri, 20 Sep 2024 09:19:10 -0700 (PDT)
Received: from [198.18.0.1] (n220246094186.netvigator.com. [220.246.94.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079470ebbdsm96680065ad.191.2024.09.20.09.19.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 09:19:09 -0700 (PDT)
Message-ID: <284e9297-95ee-4413-a1da-843b5049d78a@gmail.com>
Date: Sat, 21 Sep 2024 00:19:07 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: ISST: Fix the KASAN report
 slab-out-of-bounds bug
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <c9f3758e027e06aaf5776904d6e7a0de0bf916c2.camel@linux.intel.com>
 <20240919163713.3126-1-zachwade.k@gmail.com>
 <8c8267e5695c8e1b0a0b0c52050c43e22359c915.camel@linux.intel.com>
From: Zach Wade <zachwade.k@gmail.com>
In-Reply-To: <8c8267e5695c8e1b0a0b0c52050c43e22359c915.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/20 2:44, srinivas pandruvada wrote:
> On Fri, 2024-09-20 at 00:37 +0800, Zach Wade wrote:
>> Attaching SST PCI device to VM causes
> You are not attaching SST PCI device to VM. It seems some hard drives
> emulates same PCI vendor/device ID.
> 
> But replacing with topology_logical_package_id() is fine.
> 
> Let's find out what are those devices.
> 
> Thanks,
> Srinivas
> 

So should we delete this description? Do I need to modify the patch again?

Thanks,
Zach

>>   "BUG: KASAN: slab-out-of-bounds".
>> kasan report:
>> [   19.411889]
>> ==================================================================
>> [   19.413702] BUG: KASAN: slab-out-of-bounds in
>> _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
>> [   19.415634] Read of size 8 at addr ffff888829e65200 by task
>> cpuhp/16/113
>> [   19.417368]
>> [   19.418627] CPU: 16 PID: 113 Comm: cpuhp/16 Tainted: G
>> E      6.9.0 #10
>> [   19.420435] Hardware name: VMware, Inc. VMware20,1/440BX Desktop
>> Reference Platform, BIOS VMW201.00V.20192059.B64.2207280713
>> 07/28/2022
>> [   19.422687] Call Trace:
>> [   19.424091]  <TASK>
>> [   19.425448]  dump_stack_lvl+0x5d/0x80
>> [   19.426963]  ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
>> [   19.428694]  print_report+0x19d/0x52e
>> [   19.430206]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>> [   19.431837]  ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
>> [   19.433539]  kasan_report+0xf0/0x170
>> [   19.435019]  ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
>> [   19.436709]  _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
>> [   19.438379]  ? __pfx_sched_clock_cpu+0x10/0x10
>> [   19.439910]  isst_if_cpu_online+0x406/0x58f [isst_if_common]
>> [   19.441573]  ? __pfx_isst_if_cpu_online+0x10/0x10 [isst_if_common]
>> [   19.443263]  ? ttwu_queue_wakelist+0x2c1/0x360
>> [   19.444797]  cpuhp_invoke_callback+0x221/0xec0
>> [   19.446337]  cpuhp_thread_fun+0x21b/0x610
>> [   19.447814]  ? __pfx_cpuhp_thread_fun+0x10/0x10
>> [   19.449354]  smpboot_thread_fn+0x2e7/0x6e0
>> [   19.450859]  ? __pfx_smpboot_thread_fn+0x10/0x10
>> [   19.452405]  kthread+0x29c/0x350
>> [   19.453817]  ? __pfx_kthread+0x10/0x10
>> [   19.455253]  ret_from_fork+0x31/0x70
>> [   19.456685]  ? __pfx_kthread+0x10/0x10
>> [   19.458114]  ret_from_fork_asm+0x1a/0x30
>> [   19.459573]  </TASK>
>> [   19.460853]
>> [   19.462055] Allocated by task 1198:
>> [   19.463410]  kasan_save_stack+0x30/0x50
>> [   19.464788]  kasan_save_track+0x14/0x30
>> [   19.466139]  __kasan_kmalloc+0xaa/0xb0
>> [   19.467465]  __kmalloc+0x1cd/0x470
>> [   19.468748]  isst_if_cdev_register+0x1da/0x350 [isst_if_common]
>> [   19.470233]  isst_if_mbox_init+0x108/0xff0 [isst_if_mbox_msr]
>> [   19.471670]  do_one_initcall+0xa4/0x380
>> [   19.472903]  do_init_module+0x238/0x760
>> [   19.474105]  load_module+0x5239/0x6f00
>> [   19.475285]  init_module_from_file+0xd1/0x130
>> [   19.476506]  idempotent_init_module+0x23b/0x650
>> [   19.477725]  __x64_sys_finit_module+0xbe/0x130
>> [   19.476506]  idempotent_init_module+0x23b/0x650
>> [   19.477725]  __x64_sys_finit_module+0xbe/0x130
>> [   19.478920]  do_syscall_64+0x82/0x160
>> [   19.480036]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> [   19.481292]
>> [   19.482205] The buggy address belongs to the object at
>> ffff888829e65000
>>   which belongs to the cache kmalloc-512 of size 512
>> [   19.484818] The buggy address is located 0 bytes to the right of
>>   allocated 512-byte region [ffff888829e65000, ffff888829e65200)
>> [   19.487447]
>> [   19.488328] The buggy address belongs to the physical page:
>> [   19.489569] page: refcount:1 mapcount:0 mapping:0000000000000000
>> index:0xffff888829e60c00 pfn:0x829e60
>> [   19.491140] head: order:3 entire_mapcount:0 nr_pages_mapped:0
>> pincount:0
>> [   19.492466] anon flags:
>> 0x57ffffc0000840(slab|head|node=1|zone=2|lastcpupid=0x1fffff)
>> [   19.493914] page_type: 0xffffffff()
>> [   19.494988] raw: 0057ffffc0000840 ffff88810004cc80
>> 0000000000000000 0000000000000001
>> [   19.496451] raw: ffff888829e60c00 0000000080200018
>> 00000001ffffffff 0000000000000000
>> [   19.497906] head: 0057ffffc0000840 ffff88810004cc80
>> 0000000000000000 0000000000000001
>> [   19.499379] head: ffff888829e60c00 0000000080200018
>> 00000001ffffffff 0000000000000000
>> [   19.500844] head: 0057ffffc0000003 ffffea0020a79801
>> ffffea0020a79848 00000000ffffffff
>> [   19.502316] head: 0000000800000000 0000000000000000
>> 00000000ffffffff 0000000000000000
>> [   19.503784] page dumped because: kasan: bad access detected
>> [   19.505058]
>> [   19.505970] Memory state around the buggy address:
>> [   19.507172]  ffff888829e65100: 00 00 00 00 00 00 00 00 00 00 00 00
>> 00 00 00 00
>> [   19.508599]  ffff888829e65180: 00 00 00 00 00 00 00 00 00 00 00 00
>> 00 00 00 00
>> [   19.510013] >ffff888829e65200: fc fc fc fc fc fc fc fc fc fc fc fc
>> fc fc fc fc
>> [   19.510014]                    ^
>> [   19.510016]  ffff888829e65280: fc fc fc fc fc fc fc fc fc fc fc fc
>> fc fc fc fc
>> [   19.510018]  ffff888829e65300: fc fc fc fc fc fc fc fc fc fc fc fc
>> fc fc fc fc
>> [   19.515367]
>> ==================================================================
>> The reason for this error is physical_package_ids assigned by VMM
>> have
>> holes. This will cause value returned by
>> topology_physical_package_id()
>> to be more than topology_max_packages(). The allocation uses
>> topology_max_packages() to allocate memory. topology_max_packages()
>> returns maximum logical package IDs. Hence use
>> topology_logical_package_id() instead of
>> topology_physical_package_id().
>>
>> Fixes: 9a1aac8a96dc ("platform/x86: ISST: PUNIT device mapping with
>> Sub-NUMA clustering")
>> Signed-off-by: Zach Wade <zachwade.k@gmail.com>
>> ---
>>   drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git
>> a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>> b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>> index 10e21563fa46..030c33070b84 100644
>> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>> @@ -316,7 +316,9 @@ static struct pci_dev *_isst_if_get_pci_dev(int
>> cpu, int bus_no, int dev, int fn
>>              cpu >= nr_cpu_ids || cpu >= num_possible_cpus())
>>                  return NULL;
>>   
>> -       pkg_id = topology_physical_package_id(cpu);
>> +       pkg_id = topology_logical_package_id(cpu);
>> +       if (pkg_id >= topology_max_packages())
>> +               return NULL;
>>   
>>          bus_number = isst_cpu_info[cpu].bus_info[bus_no];
>>          if (bus_number < 0)
> 

