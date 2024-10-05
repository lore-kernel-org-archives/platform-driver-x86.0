Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAD9136337
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Oct 2024 12:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728132820; cv=none; b=ouwvHhpEMcywtEyfKy4Pi7N8bjZZ6Z9sr1lycacbFgBqCUJxAUnceVaK+xVlCn3+vPiS4QxD/cT2ppWK0yMzrkld0P3aYDXR2wjCNhv4ShoPrzyjPJxJfNmIP+pA/IiPsGBU9Uj+t9ZlvsMNoZVs208zCvD+1NrgbNvnYWQK0Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728132820; c=relaxed/simple;
	bh=BX5GZR1rzCwCUyMm73WQbNjjEGUEhoJy1G9H3WTGkCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLfmWDDJo/ZIXlKl4RCDXPP3QVcyri0+6svL7ON7G7s+AaxZ+FFci0rXnUcHmzeb1lmC6hKgl38BLjG71HvbTRB8NNDnBM9ACzy5RvIeGq2kDMD7/ehD/elAX9C8fyM/qh6/CuW1O50kCYgPmTPVeymAT6Kda4U7kam2RdMFlkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HOPXyadn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HOPXyadn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728132816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dq2vCY9+ngj/SQvmdZHq8eTuzbtcQODT/4DWyQS1xu8=;
	b=HOPXyadn9GTDNVg/30llsxDzL9OqXPEImvwLU92d0ygBvEbi5qoGmCyP7EZFZesnHTAafg
	WZxb0wdMos9mEVJPgXUDcIX8mnLb0Tzb5jjQ4P06C8lg86K2f9UCFKkXj2WZ03LgOrxmXu
	+1Nn83mnGHAvC1E5/PV29brc4RPAwuI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-fcoLsOALPIq4mn3JHJSaDQ-1; Sat, 05 Oct 2024 08:53:34 -0400
X-MC-Unique: fcoLsOALPIq4mn3JHJSaDQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5c8856a75a1so2039915a12.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Oct 2024 05:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728132813; x=1728737613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dq2vCY9+ngj/SQvmdZHq8eTuzbtcQODT/4DWyQS1xu8=;
        b=AYdCjTLssv5Efq1M3524fjUI2YSiOWD2a+ytLtECQBYJicmhuoIioB6h/Tra5K3R0M
         oo7uz5+f/CtZ80Tcc3ekx2x337R4E0fbcNqwwzkFSBK50jTL8VDAG6cpbMRtuM1gJW9g
         kJ6JkBjteRSqT2y3sLxV5C+muM33AuA25/PPEwud7+KtVGliG+dpRek/vMC6Y5OYctYe
         TYsiww5XK1qKtsiXLlzi2kDmKRMwTHovbHeXMHsiir3TIMD6iAU1Cgt0KUGlvLUwSCg+
         NSAEk4GpmDSZ9QYQWH9h3ua89oJjSD/eTs1PAonwdQHQvTatWpdG5BcRSNnhBw+SFqc+
         0lhg==
X-Gm-Message-State: AOJu0Yx24bigj2eDpLUjUlBe9STnThi9WF10JgRHGaLjEOmJMwehHKph
	HaTLQS0bcPi+fyE+e4/DoTxsUqpCUH1IUpkf8Qdv3KelVEiEJBD0MK+Vn+JAmR1uOmjl1eXz2WN
	Mwmg/irWUprK4j6DidqPDX1q91/KYYCn3dq8GDfVX9ustiaZHMbH8afY63Uuc1BChFeIHoUVI78
	AuJnCiTw==
X-Received: by 2002:a05:6402:5cb:b0:5c8:a01c:e511 with SMTP id 4fb4d7f45d1cf-5c8d2e151e0mr4940432a12.10.1728132813336;
        Sat, 05 Oct 2024 05:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjuHje2/+oxNOni9NPU4YDXDO7Up4SitSEzIC0L2dQ50iIX+0ctdP/8SEHzXHbhK3nL/2wzQ==
X-Received: by 2002:a05:6402:5cb:b0:5c8:a01c:e511 with SMTP id 4fb4d7f45d1cf-5c8d2e151e0mr4940413a12.10.1728132812799;
        Sat, 05 Oct 2024 05:53:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8e05bd224sm996277a12.44.2024.10.05.05.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 05:53:32 -0700 (PDT)
Message-ID: <c419e8a8-7e17-4940-8092-f2d8a2d4df95@redhat.com>
Date: Sat, 5 Oct 2024 14:53:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: ISST: Fix the KASAN report
 slab-out-of-bounds bug
To: Zach Wade <zachwade.k@gmail.com>, srinivas.pandruvada@linux.intel.com,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
References: <c9f3758e027e06aaf5776904d6e7a0de0bf916c2.camel@linux.intel.com>
 <20240923144508.1764-1-zachwade.k@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240923144508.1764-1-zachwade.k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Sep-24 4:45 PM, Zach Wade wrote:
> Attaching SST PCI device to VM causes "BUG: KASAN: slab-out-of-bounds".
> kasan report:
> [   19.411889] ==================================================================
> [   19.413702] BUG: KASAN: slab-out-of-bounds in _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
> [   19.415634] Read of size 8 at addr ffff888829e65200 by task cpuhp/16/113
> [   19.417368]
> [   19.418627] CPU: 16 PID: 113 Comm: cpuhp/16 Tainted: G            E      6.9.0 #10
> [   19.420435] Hardware name: VMware, Inc. VMware20,1/440BX Desktop Reference Platform, BIOS VMW201.00V.20192059.B64.2207280713 07/28/2022
> [   19.422687] Call Trace:
> [   19.424091]  <TASK>
> [   19.425448]  dump_stack_lvl+0x5d/0x80
> [   19.426963]  ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
> [   19.428694]  print_report+0x19d/0x52e
> [   19.430206]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> [   19.431837]  ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
> [   19.433539]  kasan_report+0xf0/0x170
> [   19.435019]  ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
> [   19.436709]  _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
> [   19.438379]  ? __pfx_sched_clock_cpu+0x10/0x10
> [   19.439910]  isst_if_cpu_online+0x406/0x58f [isst_if_common]
> [   19.441573]  ? __pfx_isst_if_cpu_online+0x10/0x10 [isst_if_common]
> [   19.443263]  ? ttwu_queue_wakelist+0x2c1/0x360
> [   19.444797]  cpuhp_invoke_callback+0x221/0xec0
> [   19.446337]  cpuhp_thread_fun+0x21b/0x610
> [   19.447814]  ? __pfx_cpuhp_thread_fun+0x10/0x10
> [   19.449354]  smpboot_thread_fn+0x2e7/0x6e0
> [   19.450859]  ? __pfx_smpboot_thread_fn+0x10/0x10
> [   19.452405]  kthread+0x29c/0x350
> [   19.453817]  ? __pfx_kthread+0x10/0x10
> [   19.455253]  ret_from_fork+0x31/0x70
> [   19.456685]  ? __pfx_kthread+0x10/0x10
> [   19.458114]  ret_from_fork_asm+0x1a/0x30
> [   19.459573]  </TASK>
> [   19.460853]
> [   19.462055] Allocated by task 1198:
> [   19.463410]  kasan_save_stack+0x30/0x50
> [   19.464788]  kasan_save_track+0x14/0x30
> [   19.466139]  __kasan_kmalloc+0xaa/0xb0
> [   19.467465]  __kmalloc+0x1cd/0x470
> [   19.468748]  isst_if_cdev_register+0x1da/0x350 [isst_if_common]
> [   19.470233]  isst_if_mbox_init+0x108/0xff0 [isst_if_mbox_msr]
> [   19.471670]  do_one_initcall+0xa4/0x380
> [   19.472903]  do_init_module+0x238/0x760
> [   19.474105]  load_module+0x5239/0x6f00
> [   19.475285]  init_module_from_file+0xd1/0x130
> [   19.476506]  idempotent_init_module+0x23b/0x650
> [   19.477725]  __x64_sys_finit_module+0xbe/0x130
> [   19.476506]  idempotent_init_module+0x23b/0x650
> [   19.477725]  __x64_sys_finit_module+0xbe/0x130
> [   19.478920]  do_syscall_64+0x82/0x160
> [   19.480036]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [   19.481292]
> [   19.482205] The buggy address belongs to the object at ffff888829e65000
>  which belongs to the cache kmalloc-512 of size 512
> [   19.484818] The buggy address is located 0 bytes to the right of
>  allocated 512-byte region [ffff888829e65000, ffff888829e65200)
> [   19.487447]
> [   19.488328] The buggy address belongs to the physical page:
> [   19.489569] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888829e60c00 pfn:0x829e60
> [   19.491140] head: order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> [   19.492466] anon flags: 0x57ffffc0000840(slab|head|node=1|zone=2|lastcpupid=0x1fffff)
> [   19.493914] page_type: 0xffffffff()
> [   19.494988] raw: 0057ffffc0000840 ffff88810004cc80 0000000000000000 0000000000000001
> [   19.496451] raw: ffff888829e60c00 0000000080200018 00000001ffffffff 0000000000000000
> [   19.497906] head: 0057ffffc0000840 ffff88810004cc80 0000000000000000 0000000000000001
> [   19.499379] head: ffff888829e60c00 0000000080200018 00000001ffffffff 0000000000000000
> [   19.500844] head: 0057ffffc0000003 ffffea0020a79801 ffffea0020a79848 00000000ffffffff
> [   19.502316] head: 0000000800000000 0000000000000000 00000000ffffffff 0000000000000000
> [   19.503784] page dumped because: kasan: bad access detected
> [   19.505058]
> [   19.505970] Memory state around the buggy address:
> [   19.507172]  ffff888829e65100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [   19.508599]  ffff888829e65180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> [   19.510013] >ffff888829e65200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [   19.510014]                    ^
> [   19.510016]  ffff888829e65280: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [   19.510018]  ffff888829e65300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> [   19.515367] ==================================================================
> 
> The reason for this error is physical_package_ids assigned by VMware VMM 
> are not continuous and have gaps. This will cause value returned by 
> topology_physical_package_id() to be more than topology_max_packages().
> 
> Here the allocation uses topology_max_packages(). The call to 
> topology_max_packages() returns maximum logical package ID not physical 
> ID. Hence use topology_logical_package_id() instead of 
> topology_physical_package_id().
> 
> Fixes: 9a1aac8a96dc ("platform/x86: ISST: PUNIT device mapping with Sub-NUMA clustering")
> Signed-off-by: Zach Wade <zachwade.k@gmail.com>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans




> ---
>  drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index 10e21563fa46..030c33070b84 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -316,7 +316,9 @@ static struct pci_dev *_isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn
>  	    cpu >= nr_cpu_ids || cpu >= num_possible_cpus())
>  		return NULL;
>  
> -	pkg_id = topology_physical_package_id(cpu);
> +	pkg_id = topology_logical_package_id(cpu);
> +	if (pkg_id >= topology_max_packages())
> +		return NULL;
>  
>  	bus_number = isst_cpu_info[cpu].bus_info[bus_no];
>  	if (bus_number < 0)

