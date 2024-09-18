Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A46152790
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Sep 2024 16:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726677483; cv=none; b=Lqq65tG7fyKu2Pzwk+s88XzqL5/Qyivi2xTSzs9UX4P/2b+DWvWSmNohOoZ0QNVvviRrPKQRwis5evqWO7Oxm9K0uXaoDuu1LYvDZXbnh5pKMfVe3fPpe3fFx4TpeNbstfgLgDfpDSrYGptQyoBWmikgS3h2lHDlKNB3P8c0fYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726677483; c=relaxed/simple;
	bh=ce9aNv/6C2GJknCHjNUwz5lyNRuHZ4ZViqqqUFzWb64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWdwYY7MbQWoEFooLehkloZtohdORD68YfUqgrmiErBLjKH6FZp9cXti7Y2OrYAhUlkLVGAQ6D8GrCwaYzdhfEKVa9ei9B/36eq/44n8Wn8APLGfNpzlELxx5hHypkcqZVOhm2RwiO53TdtYUOvocufCMn+pMpXxcZezsVsaC0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCSFOm1F; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCSFOm1F"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2d8fa2ca5b1so4687713a91.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Sep 2024 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726677481; x=1727282281; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1PxC8U0NjD2xqlVsstp+uFG6OW9bTzrVCedh76/HBS0=;
        b=FCSFOm1FGhfbkzmhFRpGRW13KSixJE3jKIl9Pkg5wH10rn8H3rhJXmxHlLXpS+vY4Y
         xX671MYmtqxCkyQoxLskMqaWnzOYckkeOCZEQqrlGfueD7u+QhuCfO+rg+PP7w3f9NDs
         zLU9PCkw8GwWskczukDDrq63C63vTY+hXxEV1F360BtVxYJfH4CsoBwpnxhfwu5Y0PTN
         nK4PvcivY4wpWxmgx6/fODRwRX6qdXyBfa2w9XhtgyS4UhNygaHAwwaGeSNPaTkhGe3e
         33oDwWs7h8heRgvVIvJHQN249gd5Mb5Z2q0vjSwhrZtI6FKtTPNmzazbQkdkbi7bGrvT
         65LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726677481; x=1727282281;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1PxC8U0NjD2xqlVsstp+uFG6OW9bTzrVCedh76/HBS0=;
        b=p78phNb6q3G3DqRQIyzt/zfQQsy5v85hZZ2PohbUktHGt2zP81WtPC6NmyW6SEQFXF
         JKIQk8ZQqguKfPbd8134RaOCZgZ2faBgnpGF8kdsX2dXxKwPduwmUKtxmxIUvF4eLIlP
         1ixkot7BT14mehHN6vYe+5viQpqZdKzVQQ670GmgPUvGgkIgx6bTJmolydS4+leSYzhU
         m+xYEvCoJgkaO1dX7cMh+ImOyAKpSvZmeOZJG1OyFtd1fUnUim8tTmERTD/T5De4yvZs
         iA3OCd5BSxda1HKKzppXywsctWGVeoB9BNwDbsl++d2sEP3gIemGeFhILnPB7YoXeRtl
         Suuw==
X-Gm-Message-State: AOJu0YweNYR09/CMfZnua5aAcje0laEG7gjwwZOXvDTckJ/49DEYzSrf
	kaF2fD23Q6/MVGnutG3sGGIxeuPgHgr0KOdLOpKA8xzL/llABOoo
X-Google-Smtp-Source: AGHT+IFiTLzUvBDuxDBpq5E4RgaZ/6K9KiKMckRdcIoGWxvaBorQP2vUSxJKdPX8l3Iu9dbz3NRJjQ==
X-Received: by 2002:a17:90b:17c4:b0:2d3:c4cd:245f with SMTP id 98e67ed59e1d1-2dbb9e22e37mr23171515a91.17.1726677481141;
        Wed, 18 Sep 2024 09:38:01 -0700 (PDT)
Received: from [198.18.0.1] (n220246094186.netvigator.com. [220.246.94.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd60919b66sm1876355a91.45.2024.09.18.09.37.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 09:38:00 -0700 (PDT)
Message-ID: <10f32b33-4c41-44a0-8f37-3cd1ae68a6ed@gmail.com>
Date: Thu, 19 Sep 2024 00:37:58 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ISST: Fix the KASAN report
 slab-out-of-bounds bug
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
References: <20240917180350.4061-1-zachwade.k@gmail.com>
 <c983ec3aeefcabc080f51958eb11275c84bb9506.camel@linux.intel.com>
From: Zach Wade <zachwade.k@gmail.com>
In-Reply-To: <c983ec3aeefcabc080f51958eb11275c84bb9506.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



> On 2024/9/18 21:48, srinivas pandruvada wrote:
>> Hi Wade,
>> 
>> On Wed, 2024-09-18 at 02:03 +0800, Zach Wade wrote:
>>> In my vmware virtualization environment,
>> 
>> How are you using this driver is virtualized environment?
>> Did you assign this PCI device to particular VM?

Hi pandruvada，
Sorry, I misread my previous configuration. Please update the virtual
machine configuration to 32 core, 64GB. I have directly connected two
physical hard drives to the virtual machine.Unfortunately, the lspci
-vvs "PCI ID" did not detect any PCI devicesusing the isst_if_max_msr 
driver.

>> 
>> SST functions are not supported in virtualized environment as PM
>> functions can't be isolated (There may be some private implementation
>> where they can assign all CPUs in a package to VM). Even if you assign
>> this device, there are other MSRs needs to be virtualized.
>> 
>> Here on the virtualized environment, seems the
>> topology_physical_package_id() (from CPU APIC ID in non virtualized
>> case) is assigned some big value, which is more than max packages in
>> the system.
>> 
>> But your fix is good as topology_logical_package_id() should be less
>> than value returned by topology_max_packages() and hence avoid this
>> issue.
>> 
>> Can you confirm the value returned by topology_logical_package_id() and
>> topology_physical_package_id()?

cat /proc/cpuinfo | grep "physical id"
physical id     : 0
physical id     : 2
physical id     : 4
......
physical id     : 58
physical id     : 60
physical id     : 62

I calculated topology_max_packages() * sizeof (* isst_pkg.info) in 
isst_if_cpu_info_init, and focused on pkg_id and bus_no in 
_isst_if_get_pci_dev.
The printk printed result is as follows:
[   51.879700] Allocated size: 512
[   51.880148] pkg_id: 0, bus_no: 0
[   51.881242] pkg_id: 0, bus_no: 1
[   51.884209] pkg_id: 2, bus_no: 0
[   51.884571] pkg_id: 2, bus_no: 1
[   51.884931] pkg_id: 4, bus_no: 0
[   51.885313] pkg_id: 4, bus_no: 1
......
[   51.899134] pkg_id: 28, bus_no: 0
[   51.899511] pkg_id: 28, bus_no: 1
[   51.899909] pkg_id: 30, bus_no: 0
[   51.901012] pkg_id: 30, bus_no: 1
[   51.902160] 
==================================================================
[   51.902936] BUG: KASAN: slab-out-of-bounds in 
_isst_if_get_pci_dev.cold+0xde/0xe4 [isst_if_common]
[   51.982707] 
==================================================================
[   51.985453] pkg_id: 32, bus_no: 0
[   51.986569] pkg_id: 32, bus_no: 1
[   51.988501] pkg_id: 34, bus_no: 0
[   51.989616] pkg_id: 34, bus_no: 1
......
[   52.059749] pkg_id: 58, bus_no: 0
[   52.062331] pkg_id: 58, bus_no: 1
[   52.066039] pkg_id: 60, bus_no: 0
[   52.068503] pkg_id: 60, bus_no: 1
[   52.072018] pkg_id: 62, bus_no: 0
[   52.074375] pkg_id: 62, bus_no: 1

>> 
>> We can change commit description based on that.
>> 
>> Thanks,
>> Srinivas
>> 

I think the changes are minor, so no more content was added to the patch.
If you think it needs to be added, I am happy for you to help supplement
it.
Thanks,
Zach

>>   after loading the
>> isst_if_common and isst_if_mbox_msr modules on the 64 core, the kasan
>> report was triggered.
>> After consulting the kernel manual
>> (Documentation/arch/x86/topology.rst),
>> I think in _isst_if_get_pci_dev, topology_physical_package_id should
>> be
>> replaced with topology_logical_package_id.
>>
>> kasan bug report:
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
>>
>> Fixes: 9a1aac8a96dc ("platform/x86: ISST: PUNIT device mapping with
>> Sub-NUMA clustering")
>> Signed-off-by: Zach Wade <zachwade.k@gmail.com>
>> ---
>>   drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git
>> a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>> b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>> index 10e21563fa46..80654aacd5bd 100644
>> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>> @@ -316,7 +316,7 @@ static struct pci_dev *_isst_if_get_pci_dev(int
>> cpu, int bus_no, int dev, int fn
>>              cpu >= nr_cpu_ids || cpu >= num_possible_cpus())
>>                  return NULL;
>>   
>> -       pkg_id = topology_physical_package_id(cpu);
>> +       pkg_id = topology_logical_package_id(cpu);
>>   
>>          bus_number = isst_cpu_info[cpu].bus_info[bus_no];
>>          if (bus_number < 0)
> 

