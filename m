Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EE73D5666;
	Tue,  7 Apr 2026 17:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583969; cv=none; b=tmDLr1bJtp8wUFAmxz4t+iAraB0OPq3IRbHGakCTm2hEtav7bwIUpCrw8W9kgD2HAlgbvSIuN0GZ/HjXZ0+nFOIxjotnUqFJqrJwDtDqzZ/Rs4V7viRH1peWAZcHFJ9XfVZW4wkxDqdH1PJx226MSy6bIZgBlhEQ4qyei9h39Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583969; c=relaxed/simple;
	bh=CKhq3jVtAhnbnvQNJe3hVbTEtge0L/VqPRJKVHAmgZI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MMMwlKWC5uNvZrW2nWB2iDIg22mA5DS5RJyvQal3IpLc4HM2bzRHUBCMidSssgShbQBhw8zmQ47X5pFNK4DRzQSOBRrn5fwQ6o9EHvW2oVtjkiv1m6lOi/mH5n0qctnsI4JqqURk5dV6APvgzEqmo8Y1LbGReOfdJRK6hizZGeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6m8Uwef; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6m8Uwef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775583962; x=1807119962;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=CKhq3jVtAhnbnvQNJe3hVbTEtge0L/VqPRJKVHAmgZI=;
  b=P6m8UwefRnDS2a0oPPydSgdsMWh7Nuz5cKCtA4j7N+sspJ5ihZbn6zP9
   HV6iCavTgfSr+FKOkS0CROgXVj4xfyNQbvJHhkKeVANWhFic+7LC4gw6+
   Zq/btQl7ATnHmOk1LVuDoe3/LKOVoNMms0f9dMpCtoZ8JHDWa44zvm1xC
   rn2K5R6UaKUqb0IVYMqYb4RcbEjHAYSw2VnTJtKzuL6K4EUH9U8i3Wkyn
   16tZtvH78JYWD8ATxN6amMUDu5q99wGzX1++Im/OwaraOnfB7ivo8alQl
   T0mp+peGSoVIQDmJLDaReOMD1/wcq8VysSJiBQWGHJZoR06VGkL/R355f
   Q==;
X-CSE-ConnectionGUID: 6RhzYfPVT02FqWtoiTJhEQ==
X-CSE-MsgGUID: Y4mp5HBdSKOA4eW96JP7LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="93944078"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="93944078"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 10:45:59 -0700
X-CSE-ConnectionGUID: ReQMdKzZT16vLthth0lhcA==
X-CSE-MsgGUID: f7EyRpIOQ9Ckqr5Oup2TXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="225478520"
Received: from spandruv-desk2.jf.intel.com ([10.88.27.176])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 10:45:59 -0700
Message-ID: <e96c61877730f624e8ab9793c17f485538dde545.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/2] platform/x86/intel-uncore-freq: Expose instance
 ID in the sysfs
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	dedekind1@gmail.com, artem.bityutskiy@linux.intel.com
Date: Tue, 07 Apr 2026 10:45:58 -0700
In-Reply-To: <cover.1775159775.git.m.wieczorretman@pm.me>
References: <cover.1775159775.git.m.wieczorretman@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-04-02 at 19:59 +0000, Maciej Wieczor-Retman wrote:
> --- Motivation
>=20
> This patchset is about exporting instance ID, a value used to
> uniquely
> identify MMIO blocks in TPMI devices. Userspace tools like "pepc" [1]
> can use it for direct MMIO reads or writes. It's faster than the
> alternative legacy approach which is interacting with MSRs.
This statement is not required. MSR is not an option. This allows PEPC
like tools to do some platform specific turning which is not supported
via uncore sysfs.

Thanks,
Srinivas

>=20
> Currently exported information allows doing this on non-partitioned
> systems, but partitioned systems require additional steps to map MMIO
> blocks.
>=20
> [1] https://github.com/intel/pepc
>=20
> --- Background
>=20
> * TPMI MMIO organization
> For each TPMI device a direct register access is possible through
> MMIO
> mapped blocks, where:
> - Each block belongs to a different power domain.
> - Each power domain is exposed in sysfs via a domain_id attribute.
> - Power domain scope is per-die (either IO dies or compute dies).
> - Compute die blocks are ordered first, before IO die blocks in
> =C2=A0 MMIO space.
>=20
> * Domain ID mapping
> For compute dies, the mapping is architectural through a CPUID leaf
> or
> via MSR 0x54:
> - Compute die IDs directly correspond to CPU die IDs
> - CPU die ID can be obtained from MSR 0x54 or recent CPUID leaves
> - Example: domain_id equal to 1 applies to all CPUs with die ID 1
>=20
> * IO die mapping
> For IO dies, the relationship is generation/platform specific. It's
> generally not recommended to assume any specific IO organization but
> uncore sysfs provides an attribute to differentiate die types.
>=20
> * Partitioning
> In partitioned systems multiple TPMI devices exist per package.
> However
> CPUs are still enumerated package-wide and so die IDs (domain_id) are
> unique per-package. For example a single partition (single TPMI
> device)
> Granite Rapids might order its dies in the following way:
>=20
> +---------------------+-----------+
> > Die type and number | Domain ID |
> +---------------------+-----------+
> > Compute die 0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 0 |
> > Compute die 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 |
> > IO die 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 |
> > IO die 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 |
> +---------------------+-----------+
>=20
> While a two partition system may be numbered in this way:
>=20
> +---------------------+-------------+-------------+
> > Die type and number |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
omain ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > local in single=C2=A0=C2=A0=C2=A0=C2=A0 +-------------+-------------+
> > partition scope=C2=A0=C2=A0=C2=A0=C2=A0 | Partition 0 | Partition 1 |
> +---------------------+-------------+-------------+
> > Compute die 0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 |
> > Compute die 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 |
> > IO die 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6 |
> > IO die 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7 |
> +---------------------+-------------+-------------+
>=20
> The cd_mask value from the TPMI bus info register can show using a
> bitmap which compute dies belong to which partition.
>=20
> * Instance ID
> Partition ID is not an architectural value, meaning there is no CPUID
> or
> MSR to map a CPU to a partition number. Therefore to allow mapping
> CPUs
> to compute dies as well as mapping TPMI registers in MMIO mapped
> space
> two numbers need to be exported:
> - domain_id
> 	- Whether the system is partitioned or not it still allows
> 	=C2=A0 mapping CPUs to compute die IDs.
> - instance_id
> 	- A per-partition (and hence per-device) physical index to
> still
> 	=C2=A0 allow mapping MMIO blocks to both compute and IO dies. On
> 	=C2=A0 partitioned systems mapping IO dies would be very
> difficult
> 	=C2=A0 since they are only indexed after all the compute dies are
> 	=C2=A0 numbered.
>=20
> As one can see, on non-partitioned systems the instance ID and domain
> ID
> have the same value. It's only on partitioned systems that both
> values
> are needed to keep all mapping functionality. To better show the
> relationship this is how values on a partitioned system can look:
>=20
> +---------------------+-------------+-------------+-------------+----
> ---------+
> > Die type and number |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D=
omain ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 Instance
> > ID=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
> > local in single=C2=A0=C2=A0=C2=A0=C2=A0 +-------------+-------------+--=
-----------+----
> > ---------+
> > partition scope=C2=A0=C2=A0=C2=A0=C2=A0 | Partition 0 | Partition 1 | P=
artition 0 |
> > Partition 1 |
> +---------------------+-------------+-------------+-------------+----
> ---------+
> > Compute die 0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0
> > |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0 |
> > Compute die 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 1
> > |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1 |
> > IO die 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
> > |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 |
> > IO die 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7 |=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3
> > |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3 |
> +---------------------+-------------+-------------+-------------+----
> ---------+
>=20
> Maciej Wieczor-Retman (2):
> =C2=A0 platform/x86/intel-uncore-freq: Rename instance_id
> =C2=A0 platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
>=20
> =C2=A0.../pm/intel_uncore_frequency_scaling.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
> =C2=A0.../uncore-frequency/uncore-frequency-common.c=C2=A0=C2=A0 | 16 +++=
++++++++++-
> --
> =C2=A0.../uncore-frequency/uncore-frequency-common.h=C2=A0=C2=A0 |=C2=A0 =
8 ++++++--
> =C2=A0.../uncore-frequency/uncore-frequency-tpmi.c=C2=A0=C2=A0=C2=A0=C2=
=A0 | 15
> ++++++++++++++-
> =C2=A04 files changed, 40 insertions(+), 6 deletions(-)
