Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EA418A6D4
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Sep 2024 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726667324; cv=none; b=Su0tDYi3eIbEWMqqiDaltf3G6M5phFo4uYbP3gkvqVoTrsNR1Tqm7Hhk6HI3wXMOxQP5MfChyHn35ypxw3lyidkpy/HdWwcKu0+odd2nr6gar7n5fndpY0I8zKP3cbH8nWVaKmiLURPDYxKqVqjPGHBsztXL5bn11t+caO26jGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726667324; c=relaxed/simple;
	bh=7XpONltFSrOAvHeFN/NzI7O7BMebKuDb+KCCjbP63ew=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tnKrTaXvq1I//wtS1FsUMbUGZFFB49l+xXX6kU4cfVHyuQdc6dJ01u0oFpvwqYjylLjCVeSzEQfyHHJ1LM3aDvvWRtaI2G5Rxzqdgh1YsdETU1zijWmM+JGmuclJsGAqyX4POKW73N00pNHnpfC/o13kAepXABps+KBqkvfn/tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLUfMHYD; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLUfMHYD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726667322; x=1758203322;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7XpONltFSrOAvHeFN/NzI7O7BMebKuDb+KCCjbP63ew=;
  b=SLUfMHYDirb4QamfnIVm6fVrhXi0yJgUdpnoWi0MQCp32hcLOzLjMdR8
   Bnkk9Z0c/jjlXKuhcFBI6sTWSM5B5Y8+IVQtDp107Lxwrq7u+NdcL2gj1
   YsmRLqLkeUg9ygKNP92oZlppLd9YMvF8PMHb6eD9HC97qhbZemRT2Q74u
   otOvdo+SDzQcKdu5jvjwP+6+g2KwuyFMH/FJooN/0Spm5K3977ydWz7MG
   X0wrpMyfRneg1840isu1frk3lrPC5ZoUcERXhVya4d3NwwNTAamObvdFs
   qO8mEGi2yhagAgcVilFqthkGC5ur0qMctN60MrUY2ZIeJK3ySy8ip3wbD
   Q==;
X-CSE-ConnectionGUID: IDhwBGyGQN6L8X+vUvgOOw==
X-CSE-MsgGUID: OewFefe8QFe0CkDGqo+6tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="43052381"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="43052381"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 06:48:40 -0700
X-CSE-ConnectionGUID: WdKB/RJ1SoSc09xw20bUXQ==
X-CSE-MsgGUID: YQ8mpGSfT120w+iJVrqOXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="107029776"
Received: from rfrazer-mobl3.amr.corp.intel.com (HELO [10.124.222.188]) ([10.124.222.188])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 06:48:12 -0700
Message-ID: <c983ec3aeefcabc080f51958eb11275c84bb9506.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86: ISST: Fix the KASAN report
 slab-out-of-bounds bug
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Zach Wade <zachwade.k@gmail.com>, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Date: Wed, 18 Sep 2024 09:48:10 -0400
In-Reply-To: <20240917180350.4061-1-zachwade.k@gmail.com>
References: <20240917180350.4061-1-zachwade.k@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Wade,

On Wed, 2024-09-18 at 02:03 +0800, Zach Wade wrote:
> In my vmware virtualization environment,

How are you using this driver is virtualized environment?
Did you assign this PCI device to particular VM?

SST functions are not supported in virtualized environment as PM
functions can't be isolated (There may be some private implementation
where they can assign all CPUs in a package to VM). Even if you assign
this device, there are other MSRs needs to be virtualized.

Here on the virtualized environment, seems the
topology_physical_package_id() (from CPU APIC ID in non virtualized
case) is assigned some big value, which is more than max packages in
the system.

But your fix is good as topology_logical_package_id() should be less
than value returned by topology_max_packages() and hence avoid this
issue.

Can you confirm the value returned by topology_logical_package_id() and
topology_physical_package_id()?

We can change commit description based on that.

Thanks,
Srinivas

>  after loading the=20
> isst_if_common and isst_if_mbox_msr modules on the 64 core, the kasan
> report was triggered.
> After consulting the kernel manual
> (Documentation/arch/x86/topology.rst),
> I think in _isst_if_get_pci_dev, topology_physical_package_id should
> be
> replaced with topology_logical_package_id.
>=20
> kasan bug report:
> [=C2=A0=C2=A0 19.411889]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=C2=A0=C2=A0 19.413702] BUG: KASAN: slab-out-of-bounds in
> _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
> [=C2=A0=C2=A0 19.415634] Read of size 8 at addr ffff888829e65200 by task
> cpuhp/16/113
> [=C2=A0=C2=A0 19.417368]
> [=C2=A0=C2=A0 19.418627] CPU: 16 PID: 113 Comm: cpuhp/16 Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> E=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.9.0 #10
> [=C2=A0=C2=A0 19.420435] Hardware name: VMware, Inc. VMware20,1/440BX Des=
ktop
> Reference Platform, BIOS VMW201.00V.20192059.B64.2207280713
> 07/28/2022
> [=C2=A0=C2=A0 19.422687] Call Trace:
> [=C2=A0=C2=A0 19.424091]=C2=A0 <TASK>
> [=C2=A0=C2=A0 19.425448]=C2=A0 dump_stack_lvl+0x5d/0x80
> [=C2=A0=C2=A0 19.426963]=C2=A0 ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_i=
f_common]
> [=C2=A0=C2=A0 19.428694]=C2=A0 print_report+0x19d/0x52e
> [=C2=A0=C2=A0 19.430206]=C2=A0 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> [=C2=A0=C2=A0 19.431837]=C2=A0 ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_i=
f_common]
> [=C2=A0=C2=A0 19.433539]=C2=A0 kasan_report+0xf0/0x170
> [=C2=A0=C2=A0 19.435019]=C2=A0 ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_i=
f_common]
> [=C2=A0=C2=A0 19.436709]=C2=A0 _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_=
common]
> [=C2=A0=C2=A0 19.438379]=C2=A0 ? __pfx_sched_clock_cpu+0x10/0x10
> [=C2=A0=C2=A0 19.439910]=C2=A0 isst_if_cpu_online+0x406/0x58f [isst_if_co=
mmon]
> [=C2=A0=C2=A0 19.441573]=C2=A0 ? __pfx_isst_if_cpu_online+0x10/0x10 [isst=
_if_common]
> [=C2=A0=C2=A0 19.443263]=C2=A0 ? ttwu_queue_wakelist+0x2c1/0x360
> [=C2=A0=C2=A0 19.444797]=C2=A0 cpuhp_invoke_callback+0x221/0xec0
> [=C2=A0=C2=A0 19.446337]=C2=A0 cpuhp_thread_fun+0x21b/0x610
> [=C2=A0=C2=A0 19.447814]=C2=A0 ? __pfx_cpuhp_thread_fun+0x10/0x10
> [=C2=A0=C2=A0 19.449354]=C2=A0 smpboot_thread_fn+0x2e7/0x6e0
> [=C2=A0=C2=A0 19.450859]=C2=A0 ? __pfx_smpboot_thread_fn+0x10/0x10
> [=C2=A0=C2=A0 19.452405]=C2=A0 kthread+0x29c/0x350
> [=C2=A0=C2=A0 19.453817]=C2=A0 ? __pfx_kthread+0x10/0x10
> [=C2=A0=C2=A0 19.455253]=C2=A0 ret_from_fork+0x31/0x70
> [=C2=A0=C2=A0 19.456685]=C2=A0 ? __pfx_kthread+0x10/0x10
> [=C2=A0=C2=A0 19.458114]=C2=A0 ret_from_fork_asm+0x1a/0x30
> [=C2=A0=C2=A0 19.459573]=C2=A0 </TASK>
> [=C2=A0=C2=A0 19.460853]
> [=C2=A0=C2=A0 19.462055] Allocated by task 1198:
> [=C2=A0=C2=A0 19.463410]=C2=A0 kasan_save_stack+0x30/0x50
> [=C2=A0=C2=A0 19.464788]=C2=A0 kasan_save_track+0x14/0x30
> [=C2=A0=C2=A0 19.466139]=C2=A0 __kasan_kmalloc+0xaa/0xb0
> [=C2=A0=C2=A0 19.467465]=C2=A0 __kmalloc+0x1cd/0x470
> [=C2=A0=C2=A0 19.468748]=C2=A0 isst_if_cdev_register+0x1da/0x350 [isst_if=
_common]
> [=C2=A0=C2=A0 19.470233]=C2=A0 isst_if_mbox_init+0x108/0xff0 [isst_if_mbo=
x_msr]
> [=C2=A0=C2=A0 19.471670]=C2=A0 do_one_initcall+0xa4/0x380
> [=C2=A0=C2=A0 19.472903]=C2=A0 do_init_module+0x238/0x760
> [=C2=A0=C2=A0 19.474105]=C2=A0 load_module+0x5239/0x6f00
> [=C2=A0=C2=A0 19.475285]=C2=A0 init_module_from_file+0xd1/0x130
> [=C2=A0=C2=A0 19.476506]=C2=A0 idempotent_init_module+0x23b/0x650
> [=C2=A0=C2=A0 19.477725]=C2=A0 __x64_sys_finit_module+0xbe/0x130
> [=C2=A0=C2=A0 19.476506]=C2=A0 idempotent_init_module+0x23b/0x650
> [=C2=A0=C2=A0 19.477725]=C2=A0 __x64_sys_finit_module+0xbe/0x130
> [=C2=A0=C2=A0 19.478920]=C2=A0 do_syscall_64+0x82/0x160
> [=C2=A0=C2=A0 19.480036]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [=C2=A0=C2=A0 19.481292]
> [=C2=A0=C2=A0 19.482205] The buggy address belongs to the object at
> ffff888829e65000
> =C2=A0which belongs to the cache kmalloc-512 of size 512
> [=C2=A0=C2=A0 19.484818] The buggy address is located 0 bytes to the righ=
t of
> =C2=A0allocated 512-byte region [ffff888829e65000, ffff888829e65200)
> [=C2=A0=C2=A0 19.487447]
> [=C2=A0=C2=A0 19.488328] The buggy address belongs to the physical page:
> [=C2=A0=C2=A0 19.489569] page: refcount:1 mapcount:0 mapping:000000000000=
0000
> index:0xffff888829e60c00 pfn:0x829e60
> [=C2=A0=C2=A0 19.491140] head: order:3 entire_mapcount:0 nr_pages_mapped:=
0
> pincount:0
> [=C2=A0=C2=A0 19.492466] anon flags:
> 0x57ffffc0000840(slab|head|node=3D1|zone=3D2|lastcpupid=3D0x1fffff)
> [=C2=A0=C2=A0 19.493914] page_type: 0xffffffff()
> [=C2=A0=C2=A0 19.494988] raw: 0057ffffc0000840 ffff88810004cc80
> 0000000000000000 0000000000000001
> [=C2=A0=C2=A0 19.496451] raw: ffff888829e60c00 0000000080200018
> 00000001ffffffff 0000000000000000
> [=C2=A0=C2=A0 19.497906] head: 0057ffffc0000840 ffff88810004cc80
> 0000000000000000 0000000000000001
> [=C2=A0=C2=A0 19.499379] head: ffff888829e60c00 0000000080200018
> 00000001ffffffff 0000000000000000
> [=C2=A0=C2=A0 19.500844] head: 0057ffffc0000003 ffffea0020a79801
> ffffea0020a79848 00000000ffffffff
> [=C2=A0=C2=A0 19.502316] head: 0000000800000000 0000000000000000
> 00000000ffffffff 0000000000000000
> [=C2=A0=C2=A0 19.503784] page dumped because: kasan: bad access detected
> [=C2=A0=C2=A0 19.505058]
> [=C2=A0=C2=A0 19.505970] Memory state around the buggy address:
> [=C2=A0=C2=A0 19.507172]=C2=A0 ffff888829e65100: 00 00 00 00 00 00 00 00 =
00 00 00 00
> 00 00 00 00
> [=C2=A0=C2=A0 19.508599]=C2=A0 ffff888829e65180: 00 00 00 00 00 00 00 00 =
00 00 00 00
> 00 00 00 00
> [=C2=A0=C2=A0 19.510013] >ffff888829e65200: fc fc fc fc fc fc fc fc fc fc=
 fc fc
> fc fc fc fc
> [=C2=A0=C2=A0 19.510014]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> [=C2=A0=C2=A0 19.510016]=C2=A0 ffff888829e65280: fc fc fc fc fc fc fc fc =
fc fc fc fc
> fc fc fc fc
> [=C2=A0=C2=A0 19.510018]=C2=A0 ffff888829e65300: fc fc fc fc fc fc fc fc =
fc fc fc fc
> fc fc fc fc
> [=C2=A0=C2=A0 19.515367]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Fixes: 9a1aac8a96dc ("platform/x86: ISST: PUNIT device mapping with
> Sub-NUMA clustering")
> Signed-off-by: Zach Wade <zachwade.k@gmail.com>
> ---
> =C2=A0drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git
> a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index 10e21563fa46..80654aacd5bd 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -316,7 +316,7 @@ static struct pci_dev *_isst_if_get_pci_dev(int
> cpu, int bus_no, int dev, int fn
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu >=
=3D nr_cpu_ids || cpu >=3D num_possible_cpus())
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pkg_id =3D topology_physical_p=
ackage_id(cpu);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pkg_id =3D topology_logical_pa=
ckage_id(cpu);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus_number =3D isst_cpu_i=
nfo[cpu].bus_info[bus_no];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (bus_number < 0)

