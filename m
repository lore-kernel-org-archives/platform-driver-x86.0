Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F27B274FD0;
	Mon, 30 Mar 2026 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774890609; cv=none; b=BFbhyhWZjGQNU5cH4q9b6HXQ3Ooqndw0e+rKpg3RiS8tbcWw2AHMhYqF87cjT4nWYnFwxT7L7OLXDgXDZL7IISHO3rhaf+vf+5wyFLMMzkLWB4/RLBmohtrjXn6g8eV+80zYddhF4C8Q0YqHn2zGuUiC/lDsLeSVklGQqZLDO7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774890609; c=relaxed/simple;
	bh=s64Nxeid+i65x0HHENiYpGGARkaMilXR0iodsOeKAW0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S7UaE4SMdWS8jBZhtK9/Q+fVX5IrazBDj1g7CVpwSPyyeQhGiQCNb6dI1P49WdM1JY2E+He0BkcfbDIVdbdMaJiqy4uMh4k+BUVKsq0A6wiNgkVXpNUsbzuE7J7snSRNURvMw8ja1/zNx+CwiTRVTRBa7FrW1RYvjWyBZHMxl80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXUT9z1P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXUT9z1P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774890607; x=1806426607;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=s64Nxeid+i65x0HHENiYpGGARkaMilXR0iodsOeKAW0=;
  b=XXUT9z1PEJXXZgOIqdiBFezCSiD1U194uCwdYRZLX1+grhxsspxNWdHi
   z9UX7iJLWCQzA/eJaKGdNmq7ire6fVQ6yIPEkv/PQ/HRZDCkE5/vZNYb7
   3TH8R8imQ8HeRKRoOR2LS0HDYV2FAZY9oQaVKd9G0M9XzNyAKZ1FiO9EE
   L4YZLg9dTfeAypSk9esw0tIdik9mb2JF3pt9exAsWsATOglwODS74cCLq
   cW21AI0EC5Pghav1J5SYLYW0QNTP6PjQO6q7AQgEH3isNgMl98DtpOSYS
   BHkZlK3bEWTmkipKPSjwG9f5Z5A2l8Xsp8Iw7SGjkSDhESAW6Et4xoM05
   A==;
X-CSE-ConnectionGUID: 9d47Oa2ITsC/4tH7Ze+U4Q==
X-CSE-MsgGUID: q0J/4W1ET+CQLnz1EXlMtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="87282528"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="87282528"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 10:10:06 -0700
X-CSE-ConnectionGUID: U6CMeJNeQZuL+5bV+vYmRA==
X-CSE-MsgGUID: +cR1YIXyTxe6gVE7DIOn+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; 
   d="scan'208";a="226364839"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 10:10:07 -0700
Message-ID: <b81d9ed63dc435e08d496fa6f5eba8c144767d32.camel@linux.intel.com>
Subject: Re: [PATCH v1 0/2] platform/x86/intel-uncore-freq: Expose instance
 ID in the sysfs
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: Artem Bityutskiy <dedekind1@gmail.com>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Date: Mon, 30 Mar 2026 10:10:06 -0700
In-Reply-To: <acou4kv56NmP5nXx@wieczorr-mobl1.localdomain>
References: <cover.1774625521.git.m.wieczorretman@pm.me>
		 <4a19dd6c2ee07bf70ac136747e1ea5bfd8e41888.camel@gmail.com>
		 <acbwMA43StTa7kCM@wieczorr-mobl1.localdomain>
		 <edb2d0df79c1b29b83bfa0e5a36a70814ceee505.camel@linux.intel.com>
	 <acou4kv56NmP5nXx@wieczorr-mobl1.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-03-30 at 08:11 +0000, Maciej Wieczor-Retman wrote:
> On 2026-03-29 at 12:30:59 -0700, srinivas pandruvada wrote:
> > On Fri, 2026-03-27 at 21:03 +0000, Maciej Wieczor-Retman wrote:
> > > On 2026-03-27 at 19:51:54 +0200, Artem Bityutskiy wrote:
> > > > On Fri, 2026-03-27 at 15:36 +0000, Maciej Wieczor-Retman wrote:
> > > > > on newer systems that can have multiple clusters on a single
> > > > > die,
> > > > > the
> > > > > intel-uncore-freq driver behaves differently and the
> > > > > domain_id is
> > > > > a
> > > > > globally unique value - unique on all TPMI devices. Therefore
> > > > > it's
> > > > > difficult to match a specific instance to a set of UFS
> > > > > registers
> > > > > for
> > > > > example visible through /sys/kernel/debug/tpmi directories.
> > > >=20
> > > > Although, I'd say that the key point isn't that "domain_id is
> > > > globally
> > > > unique" (though this is true), but that it's a synthetic value
> > > > generated by the driver rather than representing an actual HW
> > > > instance
> > > > ID.
> > > >=20
> > > > Artem.
> > >=20
> > > Right, that's worth emphasizing. I'll try to rephrase it when
> > > updating the
> > > patches.
> >=20
> > I think the purpose is not clear. Also need to update the
> > documentation.
> > Let me write one tomorrow.
> >=20
> > Thanks,
> > Srinivas
>=20
> Would it help if the purpose was stated as:=20
> 	"this domain_id value is not attached to a HW instance ID
> anymore"=20
> and then I could show the debug tpmi device mem_dump contents and how
> it
> diverges with the domain_id - hence why the instance_id needs to be
> exported?

But why you need to have such information?

I tried to explain. We should add to uncore documentation in some form.
Hope this helps.

"
This change introduces unique identification for MMIO blocks in TPMI
devices, enabling userspace tools like "pepc"=C2=A0
(https://github.com/intel/pepc) to provide additional controls through
direct MMIO access. "pepc" directly read/write MMIO from user space
when possible.

While this was straightforward for non-partitioned systems, partitioned
systems require additional steps to map MMIO blocks.

Background

TPMI MMIO Organization
TPMI defines MMIO maps organized into blocks for each device, where:
- Each block belongs to a different power domain
- Each power domain is exposed in sysfs via a domain_id attribute
- Power domain scope is per-die (either IO dies or compute dies)
- Compute die blocks are ordered before IO die blocks in MMIO space

Domain ID Mapping
For compute dies, the mapping is architectural with CPUID leaf or via
MSR 0x54:
- Compute die IDs directly correspond to CPU die IDs
- CPU die ID can be obtained from MSR 0x54 or recent CPUID leaves
- Example: domain_id =3D 1 applies to all CPUs with die ID 1

For IO dies, the relationship is generation/platform specific and
requires special user space if any control are desired. This is
generally not recommended to assume any specific IO organization.
But uncore sysfs provides attribute to know die types, if
required.

Single Partition Example (Granite Rapids)

One TPMI device per package with MMIO blocks ordered as:
- Compute die 0 (domain_id =3D 0)
- Compute die 1 (domain_id =3D 1)
- IO die 0 (domain_id =3D 2)
- IO die 1 (domain_id =3D 3)

Userspace tools can directly index MMIO space using domain_id, and
tools can correlate CPU die IDs with domain_id.

Partitioned System Layout
With partitioned systems, multiple TPMI devices exist per package:
-Partition 0:
	Compute die 0
	Compute die 1
	IO die 0
	IO die 1

Partition 1:
	Compute die 0
	Compute die 1
	IO die 0
	IO die 1
=09
CPUs are still enumerated package-wide, so die IDs remain unique per
package.
So for example a CPU with die ID 3 can map to the first instance in
partition 1.

The partition ID is non architectural and there is no CPUID leaf or MSR
to map CPU to partition number.

To maintain a consistent interface without exposing non-architectural
partitioning:
domain_id remains logically consistent (domain_id =3D 3 controls CPU die
ID 3).
Driver internally organizes domain_id. This allows existing user space
to continue to use domain_id to map CPU die IDs.

IO domains receive logical domain IDs after all compute domain IDs as
it has no architectural meaning.
But direct MMIO indexing via domain_id is no longer possible.

This patchset introduces "instance_id" as a physical index into MMIO
blocks:
- Single partition systems: instance_id equals domain_id
- Partitioned systems: instance_id provides the actual MMIO block index
enabling tools like pepc to perform direct MMIO access once it knows
partition.
"








