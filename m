Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6614F98
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Sep 2024 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762975; cv=none; b=CUvj05Oo5qG9ih/gmx3jsyxINTV0mBcUdgNx1CzToITiyX1S36iBSAQl3GD5r95tsKXApKOR2Kbnv6ZjVW1qZbPO6zFl+QLiRT6UDhgn1KL9Ws5HC/k3EO+phDbQ1pixz0//vF0QNKQH7oqJ0TxKjBz00e5c34fOHl1EvnhyFB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762975; c=relaxed/simple;
	bh=11EDxTxrK4SPeI+Tgz7XmfShypGrMGfPfC6ku8IhHqQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BH4JZsOgcGGnM7UvlnIMq4pIDYG61WMuGTeIVbN3wDhStDr2aGPgPmYGE/yB55rof3IJtMLEoKkUs86zZmwrEjaJmrFSn5agWp+PlGEn3kdhHzlqRf6d6GHsjm4kkTAupOF06SjNL4/UV0/UQWxKpf7/DZHAV3d7kWRKscK07Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ejm+WDb4; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ejm+WDb4"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2053a0bd0a6so11650175ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Sep 2024 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762973; x=1727367773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHURfcZS3KZK788VURSstr61F3hgnA28LrYhc7qNzH0=;
        b=Ejm+WDb4pfAo75j8hw3TN8tzncwvf3LtX6u4kPgyw8XB+b244xzM3GN/RPlfnW5QRS
         jo7dnbjUAhxSeP1SQ26+aUOoELTVx0aNimRIr6dP2lt+jR2xWuK7MLdnSkXOVkm0PdC8
         jZIVrmGshB24rm6qXEvtV+F+Klt1BMtrDi2B8FurPnG5sEdfYrh9gHyRoGi7MKaBAb1Y
         2FDBgCWE9GSJCTtQCsEi36ZqX3PfA+WpSHbF0g98jw7P1c/bdcYVA9ozAQdyCwQ80o+s
         Y/nTEPGtZ2rdu3HjwMW0r/cqoH6ilfcshWfn30ziXmgLCUg/bokJwX1njSkyXEPenAVw
         nOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762973; x=1727367773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sHURfcZS3KZK788VURSstr61F3hgnA28LrYhc7qNzH0=;
        b=RizO2YgrPrEbvVILbh3Bn6kTD6Yo7xCD97RnKV9G618dl2fqAhkTOy28k2i7pCfshO
         QkjNWH7qUHpb89uP+e3pBLwbhC2EsivQ2E/iLEwul+jnYRvNho6r+r5UBfndFaqjbVDY
         HUcNHvfXLz4Eor0Fntm6ICRSmgG8dVxHgQsUI+wOyS5UxYcUaZ7vsA++YW3/imEd7bCZ
         z/2+TUQk2dp6zuVzX1/u3xDaKuldwbqvZkvrw11nyqz+4BW8NkgbT0tLh74yPVqFXjlr
         Wa4NkJ4JD23VGdMdvAqNUlJzJF6ujNaXKXLWq6YwitSqqYpfVLGl/tDjciEEAgTTvQbP
         Dmfg==
X-Gm-Message-State: AOJu0Yx7CoApwG7jifz67LAceYvMbx09VH2zSAIRAYzQb0/rSBRaoiBO
	LdA9CQoFKEddLrVFDTGlLv9W7Rnj4XOxez7LKVf0ds7rjNf2uW3c
X-Google-Smtp-Source: AGHT+IFjH3vtDHVqjSZpHmUBSuoPOF1CXO9CpvYbqp9GMpKLrHRw1KvrSdx2H+aa0J4oex5roq15EQ==
X-Received: by 2002:a17:902:da90:b0:205:9201:b520 with SMTP id d9443c01a7336-2076e44e005mr412137415ad.58.1726762972838;
        Thu, 19 Sep 2024 09:22:52 -0700 (PDT)
Received: from [198.18.0.1] (n220246094186.netvigator.com. [220.246.94.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946029b1sm81721785ad.110.2024.09.19.09.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 09:22:52 -0700 (PDT)
Message-ID: <8b83c925-17d2-47e1-a278-998c229c02f1@gmail.com>
Date: Fri, 20 Sep 2024 00:22:48 +0800
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
 <10f32b33-4c41-44a0-8f37-3cd1ae68a6ed@gmail.com>
 <c9f3758e027e06aaf5776904d6e7a0de0bf916c2.camel@linux.intel.com>
From: Zach Wade <zachwade.k@gmail.com>
In-Reply-To: <c9f3758e027e06aaf5776904d6e7a0de0bf916c2.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2024/9/19 1:41, srinivas pandruvada wrote:
> On Thu, 2024-09-19 at 00:37 +0800, Zach Wade wrote:
>>
>>
>>> On 2024/9/18 21:48, srinivas pandruvada wrote:
>>>> Hi Wade,
>>>>
>>>> On Wed, 2024-09-18 at 02:03 +0800, Zach Wade wrote:
>>>>> In my vmware virtualization environment,
>>>>
>>>> How are you using this driver is virtualized environment?
>>>> Did you assign this PCI device to particular VM?
>>
>> Hi pandruvada，
>> Sorry, I misread my previous configuration. Please update the virtual
>> machine configuration to 32 core, 64GB. I have directly connected two
>> physical hard drives to the virtual machine.
> What is the dependency of physical hard drive?
> 
>> Unfortunately, the lspci
>> -vvs "PCI ID" did not detect any PCI devicesusing the isst_if_max_msr
>> driver.
>>
>>>>
>>>> SST functions are not supported in virtualized environment as PM
>>>> functions can't be isolated (There may be some private
>>>> implementation
>>>> where they can assign all CPUs in a package to VM). Even if you
>>>> assign
>>>> this device, there are other MSRs needs to be virtualized.
>>>>
> 
> Do you need to do anything to load this driver in VMware VM?

This issue was discovered when the hard drive was passed directly to the 
virtual machine and the driver was automatically loaded.

The virtual machine executes lsblk internally and can see the physical 
hard disk I am directly using:
lsblk -S
NAME HCTL       TYPE VENDOR   MODEL                           REV SERIAL 
             TRAN
sda  32:0:0:0   disk ATA      SAMSUNG MZ7LH240HAHQ-00005 HXT7904Q 
S45RNC0T166451
sdb  32:0:1:0   disk ATA      INTEL SSDSC2KG480G8        XCV10100 
BTYG84910BR5480BGN


> I don't think lspci in VM will show this device.
> Can you send lspci -k?

lspci -k
00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host 
bridge (rev 01)
         Subsystem: VMware Virtual Machine Chipset
00:01.0 PCI bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX AGP 
bridge (rev 01)
00:07.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 08)
         Subsystem: VMware Virtual Machine Chipset
00:07.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)
         Subsystem: VMware Virtual Machine Chipset
         Kernel driver in use: ata_piix
         Kernel modules: pata_acpi, ata_generic
00:07.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)
         Subsystem: VMware Virtual Machine Chipset
         Kernel modules: i2c_piix4
00:07.7 System peripheral: VMware Virtual Machine Communication 
Interface (rev 10)
         Subsystem: VMware Virtual Machine Communication Interface
         Kernel driver in use: vmw_vmci
         Kernel modules: vmw_vmci
00:0f.0 VGA compatible controller: VMware SVGA II Adapter
         Subsystem: VMware SVGA II Adapter
         Kernel driver in use: vmwgfx
         Kernel modules: vmwgfx
02:00.0 Serial Attached SCSI controller: VMware PVSCSI SCSI Controller 
(rev 02)
         DeviceName: SCSI0
         Subsystem: VMware PVSCSI SCSI Controller
         Kernel driver in use: vmw_pvscsi
         Kernel modules: vmw_pvscsi
02:01.0 USB controller: VMware USB1.1 UHCI Controller
         DeviceName: usb
         Subsystem: VMware Device 1976
         Kernel driver in use: uhci_hcd
02:02.0 Ethernet controller: VMware VMXNET3 Ethernet Controller (rev 01)
         DeviceName: Ethernet0
         Subsystem: VMware VMXNET3 Ethernet Controller
         Kernel driver in use: vmxnet3
         Kernel modules: vmxnet3
02:03.0 USB controller: VMware USB2 EHCI Controller
         DeviceName: ehci
         Subsystem: VMware USB2 EHCI Controller
         Kernel driver in use: ehci-pci
02:04.0 SATA controller: VMware SATA AHCI controller
         DeviceName: sata0
         Subsystem: VMware SATA AHCI controller
         Kernel driver in use: ahci

> 
> I want to make sure somehow your other VM PCI device is using same ID
> as this device.
> 

Are you referring to transferring this hard drive to another virtual 
machine? The action is too big, unfortunately I cannot do it this way.
This physical hard drive is only directly connected to this virtual 
machine for use.

> 
>>>> Here on the virtualized environment, seems the
>>>> topology_physical_package_id() (from CPU APIC ID in non
>>>> virtualized
>>>> case) is assigned some big value, which is more than max packages
>>>> in
>>>> the system.
>>>>
>>>> But your fix is good as topology_logical_package_id() should be
>>>> less
>>>> than value returned by topology_max_packages() and hence avoid
>>>> this
>>>> issue.
>>>>
>>>> Can you confirm the value returned by
>>>> topology_logical_package_id() and
>>>> topology_physical_package_id()?
>>
>> cat /proc/cpuinfo | grep "physical id"
>> physical id     : 0
>> physical id     : 2
>> physical id     : 4
>> ......
>> physical id     : 58
>> physical id     : 60
>> physical id     : 62
> 
>>
>> I calculated topology_max_packages() * sizeof (* isst_pkg.info) in
>> isst_if_cpu_info_init, and focused on pkg_id and bus_no in
>> _isst_if_get_pci_dev.
>> The printk printed result is as follows:
>> [   51.879700] Allocated size: 512
> 
> Here topology_max_packages() returned 32.

yes.

> 
>> [   51.880148] pkg_id: 0, bus_no: 0
>> [   51.881242] pkg_id: 0, bus_no: 1
>> [   51.884209] pkg_id: 2, bus_no: 0
>> [   51.884571] pkg_id: 2, bus_no: 1
>> [   51.884931] pkg_id: 4, bus_no: 0
>> [   51.885313] pkg_id: 4, bus_no: 1
>> ......
>> [   51.899134] pkg_id: 28, bus_no: 0
>> [   51.899511] pkg_id: 28, bus_no: 1
>> [   51.899909] pkg_id: 30, bus_no: 0
>> [   51.901012] pkg_id: 30, bus_no: 1
>> [   51.902160]
>> ==================================================================
>> [   51.902936] BUG: KASAN: slab-out-of-bounds in
>> _isst_if_get_pci_dev.cold+0xde/0xe4 [isst_if_common]
>> [   51.982707]
>> ==================================================================
> Package ID is 32, so it will overflow. There seems to be only 32
> packages.
> If you print topology_logical_package_id(), you will have no gaps, and
> will be 0-31.
> 
> Can you also print topology_logical_package_id() to confirm.

After adding printk to _isst_if_get_pci_dev, the changes in pkd_id can 
be seen as follows:
[   18.078652] pkg_id:0
[   18.078669] pkg_id:0
[   18.079215] pkg_id:1
[   18.080920] pkg_id:1
[   18.081847] pkg_id:2
[   18.082756] pkg_id:2
[   18.088928] pkg_id:3
[   18.089839] pkg_id:3
......
[   18.185462] pkg_id:30
[   18.185471] pkg_id:30
[   18.185561] pkg_id:31
[   18.185569] pkg_id:31

> 
> topology_max_packages() returns max __max_logical_packages, so
> topology_logical_package_id() will be better here.
> 
>> [   51.985453] pkg_id: 32, bus_no: 0
>> [   51.986569] pkg_id: 32, bus_no: 1
>> [   51.988501] pkg_id: 34, bus_no: 0
>> [   51.989616] pkg_id: 34, bus_no: 1
>> ......
>> [   52.059749] pkg_id: 58, bus_no: 0
>> [   52.062331] pkg_id: 58, bus_no: 1
>> [   52.066039] pkg_id: 60, bus_no: 0
>> [   52.068503] pkg_id: 60, bus_no: 1
>> [   52.072018] pkg_id: 62, bus_no: 0
>> [   52.074375] pkg_id: 62, bus_no: 1
>>
>>>>
>>>> We can change commit description based on that.
>>>>
>>>> Thanks,
>>>> Srinivas
>>>>
>>
>> I think the changes are minor, so no more content was added to the
>> patch.
>> If you think it needs to be added, I am happy for you to help
>> supplement
>> it.
> I just want to be clear how to reproduce this issue.
> 
> "
> Attaching SST PCI device to VM causes "BUG: KASAN: slab-out-of-bounds".
> 
> Then you can add the kasan bug report.
> 
> The reason for this error is physical_package_ids assigned by VMM have
> holes. This will cause value returned by topology_physical_package_id()
> to be more than topology_max_packages(). The allocation uses
> topology_max_packages() to allocate memory. topology_max_packages()
> returns maximum logical package IDs. Hence use
> topology_logical_package_id() instead of
> topology_physical_package_id().
> "

Thanks, I will make the necessary modifications in v2.

> 
> Also we should add a check
> 
> pkg_id = topology_logical_package_id(cpu);
> if (pkg_id >= topology_max_packages())
> 	return NULL;
> 
> May be VMM has holes in logical IDs also, then atleast it will not
> cause BUG.

Great suggestion, I will add it in the new v2.

Thanks,
Srinivas

> 
> Thanks,
> Srinivas
> 
> 
>> Thanks,
>> Zach
>>
>>>>    after loading the
>>>> isst_if_common and isst_if_mbox_msr modules on the 64 core, the
>>>> kasan
>>>> report was triggered.
>>>> After consulting the kernel manual
>>>> (Documentation/arch/x86/topology.rst),
>>>> I think in _isst_if_get_pci_dev, topology_physical_package_id
>>>> should
>>>> be
>>>> replaced with topology_logical_package_id.
>>>>
>>>> kasan bug report:
>>>> [   19.411889]
>>>> =================================================================
>>>> =
>>>> [   19.413702] BUG: KASAN: slab-out-of-bounds in
>>>> _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
>>>> [   19.415634] Read of size 8 at addr ffff888829e65200 by task
>>>> cpuhp/16/113
>>>> [   19.417368]
>>>> [   19.418627] CPU: 16 PID: 113 Comm: cpuhp/16 Tainted: G
>>>> E      6.9.0 #10
>>>> [   19.420435] Hardware name: VMware, Inc. VMware20,1/440BX
>>>> Desktop
>>>> Reference Platform, BIOS VMW201.00V.20192059.B64.2207280713
>>>> 07/28/2022
>>>> [   19.422687] Call Trace:
>>>> [   19.424091]  <TASK>
>>>> [   19.425448]  dump_stack_lvl+0x5d/0x80
>>>> [   19.426963]  ? _isst_if_get_pci_dev+0x3d5/0x400
>>>> [isst_if_common]
>>>> [   19.428694]  print_report+0x19d/0x52e
>>>> [   19.430206]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>>>> [   19.431837]  ? _isst_if_get_pci_dev+0x3d5/0x400
>>>> [isst_if_common]
>>>> [   19.433539]  kasan_report+0xf0/0x170
>>>> [   19.435019]  ? _isst_if_get_pci_dev+0x3d5/0x400
>>>> [isst_if_common]
>>>> [   19.436709]  _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
>>>> [   19.438379]  ? __pfx_sched_clock_cpu+0x10/0x10
>>>> [   19.439910]  isst_if_cpu_online+0x406/0x58f [isst_if_common]
>>>> [   19.441573]  ? __pfx_isst_if_cpu_online+0x10/0x10
>>>> [isst_if_common]
>>>> [   19.443263]  ? ttwu_queue_wakelist+0x2c1/0x360
>>>> [   19.444797]  cpuhp_invoke_callback+0x221/0xec0
>>>> [   19.446337]  cpuhp_thread_fun+0x21b/0x610
>>>> [   19.447814]  ? __pfx_cpuhp_thread_fun+0x10/0x10
>>>> [   19.449354]  smpboot_thread_fn+0x2e7/0x6e0
>>>> [   19.450859]  ? __pfx_smpboot_thread_fn+0x10/0x10
>>>> [   19.452405]  kthread+0x29c/0x350
>>>> [   19.453817]  ? __pfx_kthread+0x10/0x10
>>>> [   19.455253]  ret_from_fork+0x31/0x70
>>>> [   19.456685]  ? __pfx_kthread+0x10/0x10
>>>> [   19.458114]  ret_from_fork_asm+0x1a/0x30
>>>> [   19.459573]  </TASK>
>>>> [   19.460853]
>>>> [   19.462055] Allocated by task 1198:
>>>> [   19.463410]  kasan_save_stack+0x30/0x50
>>>> [   19.464788]  kasan_save_track+0x14/0x30
>>>> [   19.466139]  __kasan_kmalloc+0xaa/0xb0
>>>> [   19.467465]  __kmalloc+0x1cd/0x470
>>>> [   19.468748]  isst_if_cdev_register+0x1da/0x350
>>>> [isst_if_common]
>>>> [   19.470233]  isst_if_mbox_init+0x108/0xff0 [isst_if_mbox_msr]
>>>> [   19.471670]  do_one_initcall+0xa4/0x380
>>>> [   19.472903]  do_init_module+0x238/0x760
>>>> [   19.474105]  load_module+0x5239/0x6f00
>>>> [   19.475285]  init_module_from_file+0xd1/0x130
>>>> [   19.476506]  idempotent_init_module+0x23b/0x650
>>>> [   19.477725]  __x64_sys_finit_module+0xbe/0x130
>>>> [   19.476506]  idempotent_init_module+0x23b/0x650
>>>> [   19.477725]  __x64_sys_finit_module+0xbe/0x130
>>>> [   19.478920]  do_syscall_64+0x82/0x160
>>>> [   19.480036]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>>>> [   19.481292]
>>>> [   19.482205] The buggy address belongs to the object at
>>>> ffff888829e65000
>>>>    which belongs to the cache kmalloc-512 of size 512
>>>> [   19.484818] The buggy address is located 0 bytes to the right
>>>> of
>>>>    allocated 512-byte region [ffff888829e65000, ffff888829e65200)
>>>> [   19.487447]
>>>> [   19.488328] The buggy address belongs to the physical page:
>>>> [   19.489569] page: refcount:1 mapcount:0
>>>> mapping:0000000000000000
>>>> index:0xffff888829e60c00 pfn:0x829e60
>>>> [   19.491140] head: order:3 entire_mapcount:0 nr_pages_mapped:0
>>>> pincount:0
>>>> [   19.492466] anon flags:
>>>> 0x57ffffc0000840(slab|head|node=1|zone=2|lastcpupid=0x1fffff)
>>>> [   19.493914] page_type: 0xffffffff()
>>>> [   19.494988] raw: 0057ffffc0000840 ffff88810004cc80
>>>> 0000000000000000 0000000000000001
>>>> [   19.496451] raw: ffff888829e60c00 0000000080200018
>>>> 00000001ffffffff 0000000000000000
>>>> [   19.497906] head: 0057ffffc0000840 ffff88810004cc80
>>>> 0000000000000000 0000000000000001
>>>> [   19.499379] head: ffff888829e60c00 0000000080200018
>>>> 00000001ffffffff 0000000000000000
>>>> [   19.500844] head: 0057ffffc0000003 ffffea0020a79801
>>>> ffffea0020a79848 00000000ffffffff
>>>> [   19.502316] head: 0000000800000000 0000000000000000
>>>> 00000000ffffffff 0000000000000000
>>>> [   19.503784] page dumped because: kasan: bad access detected
>>>> [   19.505058]
>>>> [   19.505970] Memory state around the buggy address:
>>>> [   19.507172]  ffff888829e65100: 00 00 00 00 00 00 00 00 00 00
>>>> 00 00
>>>> 00 00 00 00
>>>> [   19.508599]  ffff888829e65180: 00 00 00 00 00 00 00 00 00 00
>>>> 00 00
>>>> 00 00 00 00
>>>> [   19.510013] >ffff888829e65200: fc fc fc fc fc fc fc fc fc fc
>>>> fc fc
>>>> fc fc fc fc
>>>> [   19.510014]                    ^
>>>> [   19.510016]  ffff888829e65280: fc fc fc fc fc fc fc fc fc fc
>>>> fc fc
>>>> fc fc fc fc
>>>> [   19.510018]  ffff888829e65300: fc fc fc fc fc fc fc fc fc fc
>>>> fc fc
>>>> fc fc fc fc
>>>> [   19.515367]
>>>> =================================================================
>>>> =
>>>>
>>>> Fixes: 9a1aac8a96dc ("platform/x86: ISST: PUNIT device mapping
>>>> with
>>>> Sub-NUMA clustering")
>>>> Signed-off-by: Zach Wade <zachwade.k@gmail.com>
>>>> ---
>>>>    drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 2
>>>> +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git
>>>> a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>>>> b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>>>> index 10e21563fa46..80654aacd5bd 100644
>>>> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>>>> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>>>> @@ -316,7 +316,7 @@ static struct pci_dev
>>>> *_isst_if_get_pci_dev(int
>>>> cpu, int bus_no, int dev, int fn
>>>>               cpu >= nr_cpu_ids || cpu >= num_possible_cpus())
>>>>                   return NULL;
>>>>    
>>>> -       pkg_id = topology_physical_package_id(cpu);
>>>> +       pkg_id = topology_logical_package_id(cpu);
>>>>    
>>>>           bus_number = isst_cpu_info[cpu].bus_info[bus_no];
>>>>           if (bus_number < 0)
>>>
>>
> 

