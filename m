Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D3B1C9DE0
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Sep 2024 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726681300; cv=none; b=Gwp67DO1UEubhwGLgS4iZoCnvBUPIw4yniWnj1wEFPIPUpELv7l2sI9m7miojFzHe6YuhpD7HahmS25uiVlSCpgc0HrNFyfFhEBD+RFVcStWlq/YtDHBgBuoeqb4/Q/FJAlPos00R0A13T6t4Ogr6fkOboDvIqzMjRTmFndgXto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726681300; c=relaxed/simple;
	bh=KQKa6JXcjNxXCnbZFZeyOdMxYNoY7BccL4e4hauCkQI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dPa5me7/sMs6+E9EfSxeF9Be+ycI9pMPVkfW/ThjpTAyf3F4JL6EdvQ8sB39HhV02JarHWxDCInSnFsk64D7rx70Gs4k/p4kFBXI784sflQI1iRe8Tm5RaNGLFL7hyLOLSjw27Ob6PfqBaBqLB8hwXN2eWEUd9P8UJ0MBenjDVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MAfL2xMM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MAfL2xMM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726681298; x=1758217298;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=KQKa6JXcjNxXCnbZFZeyOdMxYNoY7BccL4e4hauCkQI=;
  b=MAfL2xMMKCoJ0ZUW991JdEtdOO0Aw9x6dnAe2vjVPnqnc6n2WI857v2e
   AgLHloQpITrNPJbmNy/uDccXAdt+bH+GMxyByc8OREqZP0Mks28/s5IhU
   VZFfWlr+VFJs3vrJSPYZqCdGLHp6YmTgobnJmsZaF1oyodIP/wFMg9JDN
   SGxdMShdF3tKB9V+JKPtXECoJ8j+RJu2BZIZTuKRkOrlNkT8fHsfOwaCk
   PKA6mlbI/6PsHo9XLCVOnKV83Z0L0rBYWavhwwNrcZto7vi+neO7wQi6Y
   j80f0eMtVPH6vAmfPLt5NRDiQWZg0417Al4YZ7+ArnMykQnmN3FSnppvr
   w==;
X-CSE-ConnectionGUID: AXeofffnQyuWEUuDz+xEUw==
X-CSE-MsgGUID: +0lXGDkEQ+aH+tkY1b6qvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25436333"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="25436333"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 10:41:37 -0700
X-CSE-ConnectionGUID: qAqSv62mTZmCd/n5g6dftQ==
X-CSE-MsgGUID: EQk1iojWRJmDMLaAXgWO8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="69276903"
Received: from bjrankin-mobl3.amr.corp.intel.com (HELO [10.124.223.7]) ([10.124.223.7])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 10:41:37 -0700
Message-ID: <c9f3758e027e06aaf5776904d6e7a0de0bf916c2.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: ISST: Fix the KASAN report
 slab-out-of-bounds bug
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Zach Wade <zachwade.k@gmail.com>, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Date: Wed, 18 Sep 2024 13:41:34 -0400
In-Reply-To: <10f32b33-4c41-44a0-8f37-3cd1ae68a6ed@gmail.com>
References: <20240917180350.4061-1-zachwade.k@gmail.com>
	 <c983ec3aeefcabc080f51958eb11275c84bb9506.camel@linux.intel.com>
	 <10f32b33-4c41-44a0-8f37-3cd1ae68a6ed@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-09-19 at 00:37 +0800, Zach Wade wrote:
>=20
>=20
> > On 2024/9/18 21:48, srinivas pandruvada wrote:
> > > Hi Wade,
> > >=20
> > > On Wed, 2024-09-18 at 02:03 +0800, Zach Wade wrote:
> > > > In my vmware virtualization environment,
> > >=20
> > > How are you using this driver is virtualized environment?
> > > Did you assign this PCI device to particular VM?
>=20
> Hi pandruvada=EF=BC=8C
> Sorry, I misread my previous configuration. Please update the virtual
> machine configuration to 32 core, 64GB. I have directly connected two
> physical hard drives to the virtual machine.
What is the dependency of physical hard drive?

> Unfortunately, the lspci
> -vvs "PCI ID" did not detect any PCI devicesusing the isst_if_max_msr
> driver.
>=20
> > >=20
> > > SST functions are not supported in virtualized environment as PM
> > > functions can't be isolated (There may be some private
> > > implementation
> > > where they can assign all CPUs in a package to VM). Even if you
> > > assign
> > > this device, there are other MSRs needs to be virtualized.
> > >=20

Do you need to do anything to load this driver in VMware VM?
I don't think lspci in VM will show this device.
Can you send lspci -k?

I want to make sure somehow your other VM PCI device is using same ID
as this device.


> > > Here on the virtualized environment, seems the
> > > topology_physical_package_id() (from CPU APIC ID in non
> > > virtualized
> > > case) is assigned some big value, which is more than max packages
> > > in
> > > the system.
> > >=20
> > > But your fix is good as topology_logical_package_id() should be
> > > less
> > > than value returned by topology_max_packages() and hence avoid
> > > this
> > > issue.
> > >=20
> > > Can you confirm the value returned by
> > > topology_logical_package_id() and
> > > topology_physical_package_id()?
>=20
> cat /proc/cpuinfo | grep "physical id"
> physical id=C2=A0=C2=A0=C2=A0=C2=A0 : 0
> physical id=C2=A0=C2=A0=C2=A0=C2=A0 : 2
> physical id=C2=A0=C2=A0=C2=A0=C2=A0 : 4
> ......
> physical id=C2=A0=C2=A0=C2=A0=C2=A0 : 58
> physical id=C2=A0=C2=A0=C2=A0=C2=A0 : 60
> physical id=C2=A0=C2=A0=C2=A0=C2=A0 : 62

>=20
> I calculated topology_max_packages() * sizeof (* isst_pkg.info) in=20
> isst_if_cpu_info_init, and focused on pkg_id and bus_no in=20
> _isst_if_get_pci_dev.
> The printk printed result is as follows:
> [=C2=A0=C2=A0 51.879700] Allocated size: 512

Here topology_max_packages() returned 32.

> [=C2=A0=C2=A0 51.880148] pkg_id: 0, bus_no: 0
> [=C2=A0=C2=A0 51.881242] pkg_id: 0, bus_no: 1
> [=C2=A0=C2=A0 51.884209] pkg_id: 2, bus_no: 0
> [=C2=A0=C2=A0 51.884571] pkg_id: 2, bus_no: 1
> [=C2=A0=C2=A0 51.884931] pkg_id: 4, bus_no: 0
> [=C2=A0=C2=A0 51.885313] pkg_id: 4, bus_no: 1
> ......
> [=C2=A0=C2=A0 51.899134] pkg_id: 28, bus_no: 0
> [=C2=A0=C2=A0 51.899511] pkg_id: 28, bus_no: 1
> [=C2=A0=C2=A0 51.899909] pkg_id: 30, bus_no: 0
> [=C2=A0=C2=A0 51.901012] pkg_id: 30, bus_no: 1
> [=C2=A0=C2=A0 51.902160]=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=C2=A0=C2=A0 51.902936] BUG: KASAN: slab-out-of-bounds in=20
> _isst_if_get_pci_dev.cold+0xde/0xe4 [isst_if_common]
> [=C2=A0=C2=A0 51.982707]=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Package ID is 32, so it will overflow. There seems to be only 32
packages.
If you print topology_logical_package_id(), you will have no gaps, and
will be 0-31.

Can you also print topology_logical_package_id() to confirm.

topology_max_packages() returns max __max_logical_packages, so
topology_logical_package_id() will be better here.

> [=C2=A0=C2=A0 51.985453] pkg_id: 32, bus_no: 0
> [=C2=A0=C2=A0 51.986569] pkg_id: 32, bus_no: 1
> [=C2=A0=C2=A0 51.988501] pkg_id: 34, bus_no: 0
> [=C2=A0=C2=A0 51.989616] pkg_id: 34, bus_no: 1
> ......
> [=C2=A0=C2=A0 52.059749] pkg_id: 58, bus_no: 0
> [=C2=A0=C2=A0 52.062331] pkg_id: 58, bus_no: 1
> [=C2=A0=C2=A0 52.066039] pkg_id: 60, bus_no: 0
> [=C2=A0=C2=A0 52.068503] pkg_id: 60, bus_no: 1
> [=C2=A0=C2=A0 52.072018] pkg_id: 62, bus_no: 0
> [=C2=A0=C2=A0 52.074375] pkg_id: 62, bus_no: 1
>=20
> > >=20
> > > We can change commit description based on that.
> > >=20
> > > Thanks,
> > > Srinivas
> > >=20
>=20
> I think the changes are minor, so no more content was added to the
> patch.
> If you think it needs to be added, I am happy for you to help
> supplement
> it.
I just want to be clear how to reproduce this issue.

"
Attaching SST PCI device to VM causes "BUG: KASAN: slab-out-of-bounds".

Then you can add the kasan bug report.

The reason for this error is physical_package_ids assigned by VMM have
holes. This will cause value returned by topology_physical_package_id()
to be more than topology_max_packages(). The allocation uses
topology_max_packages() to allocate memory. topology_max_packages()
returns maximum logical package IDs. Hence use
topology_logical_package_id() instead of
topology_physical_package_id().
"

Also we should add a check

pkg_id =3D topology_logical_package_id(cpu);
if (pkg_id >=3D topology_max_packages())
	return NULL;

May be VMM has holes in logical IDs also, then atleast it will not
cause BUG.

Thanks,
Srinivas


> Thanks,
> Zach
>=20
> > > =C2=A0 after loading the
> > > isst_if_common and isst_if_mbox_msr modules on the 64 core, the
> > > kasan
> > > report was triggered.
> > > After consulting the kernel manual
> > > (Documentation/arch/x86/topology.rst),
> > > I think in _isst_if_get_pci_dev, topology_physical_package_id
> > > should
> > > be
> > > replaced with topology_logical_package_id.
> > >=20
> > > kasan bug report:
> > > [=C2=A0=C2=A0 19.411889]
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D
> > > [=C2=A0=C2=A0 19.413702] BUG: KASAN: slab-out-of-bounds in
> > > _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
> > > [=C2=A0=C2=A0 19.415634] Read of size 8 at addr ffff888829e65200 by t=
ask
> > > cpuhp/16/113
> > > [=C2=A0=C2=A0 19.417368]
> > > [=C2=A0=C2=A0 19.418627] CPU: 16 PID: 113 Comm: cpuhp/16 Tainted: G
> > > E=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.9.0 #10
> > > [=C2=A0=C2=A0 19.420435] Hardware name: VMware, Inc. VMware20,1/440BX
> > > Desktop
> > > Reference Platform, BIOS VMW201.00V.20192059.B64.2207280713
> > > 07/28/2022
> > > [=C2=A0=C2=A0 19.422687] Call Trace:
> > > [=C2=A0=C2=A0 19.424091]=C2=A0 <TASK>
> > > [=C2=A0=C2=A0 19.425448]=C2=A0 dump_stack_lvl+0x5d/0x80
> > > [=C2=A0=C2=A0 19.426963]=C2=A0 ? _isst_if_get_pci_dev+0x3d5/0x400
> > > [isst_if_common]
> > > [=C2=A0=C2=A0 19.428694]=C2=A0 print_report+0x19d/0x52e
> > > [=C2=A0=C2=A0 19.430206]=C2=A0 ? __pfx__raw_spin_lock_irqsave+0x10/0x=
10
> > > [=C2=A0=C2=A0 19.431837]=C2=A0 ? _isst_if_get_pci_dev+0x3d5/0x400
> > > [isst_if_common]
> > > [=C2=A0=C2=A0 19.433539]=C2=A0 kasan_report+0xf0/0x170
> > > [=C2=A0=C2=A0 19.435019]=C2=A0 ? _isst_if_get_pci_dev+0x3d5/0x400
> > > [isst_if_common]
> > > [=C2=A0=C2=A0 19.436709]=C2=A0 _isst_if_get_pci_dev+0x3d5/0x400 [isst=
_if_common]
> > > [=C2=A0=C2=A0 19.438379]=C2=A0 ? __pfx_sched_clock_cpu+0x10/0x10
> > > [=C2=A0=C2=A0 19.439910]=C2=A0 isst_if_cpu_online+0x406/0x58f [isst_i=
f_common]
> > > [=C2=A0=C2=A0 19.441573]=C2=A0 ? __pfx_isst_if_cpu_online+0x10/0x10
> > > [isst_if_common]
> > > [=C2=A0=C2=A0 19.443263]=C2=A0 ? ttwu_queue_wakelist+0x2c1/0x360
> > > [=C2=A0=C2=A0 19.444797]=C2=A0 cpuhp_invoke_callback+0x221/0xec0
> > > [=C2=A0=C2=A0 19.446337]=C2=A0 cpuhp_thread_fun+0x21b/0x610
> > > [=C2=A0=C2=A0 19.447814]=C2=A0 ? __pfx_cpuhp_thread_fun+0x10/0x10
> > > [=C2=A0=C2=A0 19.449354]=C2=A0 smpboot_thread_fn+0x2e7/0x6e0
> > > [=C2=A0=C2=A0 19.450859]=C2=A0 ? __pfx_smpboot_thread_fn+0x10/0x10
> > > [=C2=A0=C2=A0 19.452405]=C2=A0 kthread+0x29c/0x350
> > > [=C2=A0=C2=A0 19.453817]=C2=A0 ? __pfx_kthread+0x10/0x10
> > > [=C2=A0=C2=A0 19.455253]=C2=A0 ret_from_fork+0x31/0x70
> > > [=C2=A0=C2=A0 19.456685]=C2=A0 ? __pfx_kthread+0x10/0x10
> > > [=C2=A0=C2=A0 19.458114]=C2=A0 ret_from_fork_asm+0x1a/0x30
> > > [=C2=A0=C2=A0 19.459573]=C2=A0 </TASK>
> > > [=C2=A0=C2=A0 19.460853]
> > > [=C2=A0=C2=A0 19.462055] Allocated by task 1198:
> > > [=C2=A0=C2=A0 19.463410]=C2=A0 kasan_save_stack+0x30/0x50
> > > [=C2=A0=C2=A0 19.464788]=C2=A0 kasan_save_track+0x14/0x30
> > > [=C2=A0=C2=A0 19.466139]=C2=A0 __kasan_kmalloc+0xaa/0xb0
> > > [=C2=A0=C2=A0 19.467465]=C2=A0 __kmalloc+0x1cd/0x470
> > > [=C2=A0=C2=A0 19.468748]=C2=A0 isst_if_cdev_register+0x1da/0x350
> > > [isst_if_common]
> > > [=C2=A0=C2=A0 19.470233]=C2=A0 isst_if_mbox_init+0x108/0xff0 [isst_if=
_mbox_msr]
> > > [=C2=A0=C2=A0 19.471670]=C2=A0 do_one_initcall+0xa4/0x380
> > > [=C2=A0=C2=A0 19.472903]=C2=A0 do_init_module+0x238/0x760
> > > [=C2=A0=C2=A0 19.474105]=C2=A0 load_module+0x5239/0x6f00
> > > [=C2=A0=C2=A0 19.475285]=C2=A0 init_module_from_file+0xd1/0x130
> > > [=C2=A0=C2=A0 19.476506]=C2=A0 idempotent_init_module+0x23b/0x650
> > > [=C2=A0=C2=A0 19.477725]=C2=A0 __x64_sys_finit_module+0xbe/0x130
> > > [=C2=A0=C2=A0 19.476506]=C2=A0 idempotent_init_module+0x23b/0x650
> > > [=C2=A0=C2=A0 19.477725]=C2=A0 __x64_sys_finit_module+0xbe/0x130
> > > [=C2=A0=C2=A0 19.478920]=C2=A0 do_syscall_64+0x82/0x160
> > > [=C2=A0=C2=A0 19.480036]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x=
7e
> > > [=C2=A0=C2=A0 19.481292]
> > > [=C2=A0=C2=A0 19.482205] The buggy address belongs to the object at
> > > ffff888829e65000
> > > =C2=A0=C2=A0which belongs to the cache kmalloc-512 of size 512
> > > [=C2=A0=C2=A0 19.484818] The buggy address is located 0 bytes to the =
right
> > > of
> > > =C2=A0=C2=A0allocated 512-byte region [ffff888829e65000, ffff888829e6=
5200)
> > > [=C2=A0=C2=A0 19.487447]
> > > [=C2=A0=C2=A0 19.488328] The buggy address belongs to the physical pa=
ge:
> > > [=C2=A0=C2=A0 19.489569] page: refcount:1 mapcount:0
> > > mapping:0000000000000000
> > > index:0xffff888829e60c00 pfn:0x829e60
> > > [=C2=A0=C2=A0 19.491140] head: order:3 entire_mapcount:0 nr_pages_map=
ped:0
> > > pincount:0
> > > [=C2=A0=C2=A0 19.492466] anon flags:
> > > 0x57ffffc0000840(slab|head|node=3D1|zone=3D2|lastcpupid=3D0x1fffff)
> > > [=C2=A0=C2=A0 19.493914] page_type: 0xffffffff()
> > > [=C2=A0=C2=A0 19.494988] raw: 0057ffffc0000840 ffff88810004cc80
> > > 0000000000000000 0000000000000001
> > > [=C2=A0=C2=A0 19.496451] raw: ffff888829e60c00 0000000080200018
> > > 00000001ffffffff 0000000000000000
> > > [=C2=A0=C2=A0 19.497906] head: 0057ffffc0000840 ffff88810004cc80
> > > 0000000000000000 0000000000000001
> > > [=C2=A0=C2=A0 19.499379] head: ffff888829e60c00 0000000080200018
> > > 00000001ffffffff 0000000000000000
> > > [=C2=A0=C2=A0 19.500844] head: 0057ffffc0000003 ffffea0020a79801
> > > ffffea0020a79848 00000000ffffffff
> > > [=C2=A0=C2=A0 19.502316] head: 0000000800000000 0000000000000000
> > > 00000000ffffffff 0000000000000000
> > > [=C2=A0=C2=A0 19.503784] page dumped because: kasan: bad access detec=
ted
> > > [=C2=A0=C2=A0 19.505058]
> > > [=C2=A0=C2=A0 19.505970] Memory state around the buggy address:
> > > [=C2=A0=C2=A0 19.507172]=C2=A0 ffff888829e65100: 00 00 00 00 00 00 00=
 00 00 00
> > > 00 00
> > > 00 00 00 00
> > > [=C2=A0=C2=A0 19.508599]=C2=A0 ffff888829e65180: 00 00 00 00 00 00 00=
 00 00 00
> > > 00 00
> > > 00 00 00 00
> > > [=C2=A0=C2=A0 19.510013] >ffff888829e65200: fc fc fc fc fc fc fc fc f=
c fc
> > > fc fc
> > > fc fc fc fc
> > > [=C2=A0=C2=A0 19.510014]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> > > [=C2=A0=C2=A0 19.510016]=C2=A0 ffff888829e65280: fc fc fc fc fc fc fc=
 fc fc fc
> > > fc fc
> > > fc fc fc fc
> > > [=C2=A0=C2=A0 19.510018]=C2=A0 ffff888829e65300: fc fc fc fc fc fc fc=
 fc fc fc
> > > fc fc
> > > fc fc fc fc
> > > [=C2=A0=C2=A0 19.515367]
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > =3D
> > >=20
> > > Fixes: 9a1aac8a96dc ("platform/x86: ISST: PUNIT device mapping
> > > with
> > > Sub-NUMA clustering")
> > > Signed-off-by: Zach Wade <zachwade.k@gmail.com>
> > > ---
> > > =C2=A0=C2=A0drivers/platform/x86/intel/speed_select_if/isst_if_common=
.c | 2
> > > +-
> > > =C2=A0=C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git
> > > a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> > > b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> > > index 10e21563fa46..80654aacd5bd 100644
> > > --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> > > +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> > > @@ -316,7 +316,7 @@ static struct pci_dev
> > > *_isst_if_get_pci_dev(int
> > > cpu, int bus_no, int dev, int fn
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 cpu >=3D nr_cpu_ids || cpu >=3D num_possible_cpus())
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> > > =C2=A0=20
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pkg_id =3D topology_physic=
al_package_id(cpu);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pkg_id =3D topology_logica=
l_package_id(cpu);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus_number =3D =
isst_cpu_info[cpu].bus_info[bus_no];
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (bus_number =
< 0)
> >=20
>=20

