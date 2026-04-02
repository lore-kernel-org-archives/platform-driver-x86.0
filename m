Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F2E3F7AA5
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 19:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775159986; cv=none; b=ACm2Frym5xQ27IiMH2303lDAvajfHrnKokYX6XFnftgp5dKYRvg6nqG29r2mll+Ahzi897xS0pYdHtyRrphcC5HN9d6HEL5MqPtAo7REyFLfVMM4I/tlkQZOK5OCSBThNKnJKPJxBXuqs+5pksdcUM9MzHNIhYUHG2Ec8s82O0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775159986; c=relaxed/simple;
	bh=qPJkpJuFWs3EHY9a0AQ3+qxGL3p+XtBNPrtESC/3ESA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RxCz8dKQgPHZyn8SpunqhZL4eiaKEb3jNUebIvcAit/s/XBxGn00NtJAWXjPw9ceooJs6xPVLlvSAufcfB6LY9t/OxRqyN0S8kgzNXRIxD5M0cPgvN9ntWsytxKpgFfmaeVxvL6oqCmPf2n/Jef8CxWKvhiUbhQKneTb6xTCv9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lDzx9d46; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lDzx9d46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775159973; x=1775419173;
	bh=DlJRcXZGAASr+061HZSodmeTjUFYvTk0BZGKDyZhAKQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lDzx9d46bzW4X+w1u+qWxQ2ab3JtnvwY1qAe29M3EDyJqrkvNFglqRrww+zniV2AF
	 sQ5cWmnJmW0SXQYZ27YeoQcZjd+DIyDcQcqavbZd1017vzPahdFj7HGhUMuFYLhn30
	 G0DfubZ4OpuszI0WRaP6w5DqNoWpYKOmErCd4D5Wy4iSZS4UTCWcwQDMoLMYPWB7XI
	 BtLbi9FTBzzzU5xBWpul4IjyuY3uqTV019fuxN1ZQOstcbF9ryCqvPaEZVVYJrN5X6
	 GKEiFBmiaB1sJEoBdWW2XFyhCHp7iV9b8Wd2RMmJ+QDuobqwfXhD39r/pWsIVZH7WR
	 A/LprNH30H3hg==
Date: Thu, 02 Apr 2026 19:59:27 +0000
To: hansg@kernel.org, srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, m.wieczorretman@pm.me
Subject: [PATCH v2 0/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
Message-ID: <cover.1775159775.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 1e1c582f0a0bea3d8934c13b65e4ab428de91200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

--- Motivation

This patchset is about exporting instance ID, a value used to uniquely
identify MMIO blocks in TPMI devices. Userspace tools like "pepc" [1]
can use it for direct MMIO reads or writes. It's faster than the
alternative legacy approach which is interacting with MSRs.

Currently exported information allows doing this on non-partitioned
systems, but partitioned systems require additional steps to map MMIO
blocks.

[1] https://github.com/intel/pepc

--- Background

* TPMI MMIO organization
For each TPMI device a direct register access is possible through MMIO
mapped blocks, where:
- Each block belongs to a different power domain.
- Each power domain is exposed in sysfs via a domain_id attribute.
- Power domain scope is per-die (either IO dies or compute dies).
- Compute die blocks are ordered first, before IO die blocks in
  MMIO space.

* Domain ID mapping
For compute dies, the mapping is architectural through a CPUID leaf or
via MSR 0x54:
- Compute die IDs directly correspond to CPU die IDs
- CPU die ID can be obtained from MSR 0x54 or recent CPUID leaves
- Example: domain_id equal to 1 applies to all CPUs with die ID 1

* IO die mapping
For IO dies, the relationship is generation/platform specific. It's
generally not recommended to assume any specific IO organization but
uncore sysfs provides an attribute to differentiate die types.

* Partitioning
In partitioned systems multiple TPMI devices exist per package. However
CPUs are still enumerated package-wide and so die IDs (domain_id) are
unique per-package. For example a single partition (single TPMI device)
Granite Rapids might order its dies in the following way:

+---------------------+-----------+
| Die type and number | Domain ID |
+---------------------+-----------+
| Compute die 0=09      |         0 |
| Compute die 1       |         1 |
| IO die 0            |         2 |
| IO die 1            |         3 |
+---------------------+-----------+

While a two partition system may be numbered in this way:

+---------------------+-------------+-------------+
| Die type and number |         Domain ID         |
| local in single     +-------------+-------------+
| partition scope     | Partition 0 | Partition 1 |
+---------------------+-------------+-------------+
| Compute die 0=09      |           0 |           2 |
| Compute die 1       |           1 |           3 |
| IO die 0            |           4 |           6 |
| IO die 1            |           5 |           7 |
+---------------------+-------------+-------------+

The cd_mask value from the TPMI bus info register can show using a
bitmap which compute dies belong to which partition.

* Instance ID
Partition ID is not an architectural value, meaning there is no CPUID or
MSR to map a CPU to a partition number. Therefore to allow mapping CPUs
to compute dies as well as mapping TPMI registers in MMIO mapped space
two numbers need to be exported:
- domain_id
=09- Whether the system is partitioned or not it still allows
=09  mapping CPUs to compute die IDs.
- instance_id
=09- A per-partition (and hence per-device) physical index to still
=09  allow mapping MMIO blocks to both compute and IO dies. On
=09  partitioned systems mapping IO dies would be very difficult
=09  since they are only indexed after all the compute dies are
=09  numbered.

As one can see, on non-partitioned systems the instance ID and domain ID
have the same value. It's only on partitioned systems that both values
are needed to keep all mapping functionality. To better show the
relationship this is how values on a partitioned system can look:

+---------------------+-------------+-------------+-------------+----------=
---+
| Die type and number |         Domain ID         |        Instance ID     =
   |
| local in single     +-------------+-------------+-------------+----------=
---+
| partition scope     | Partition 0 | Partition 1 | Partition 0 | Partition=
 1 |
+---------------------+-------------+-------------+-------------+----------=
---+
| Compute die 0=09      |           0 |           2 |           0 |        =
   0 |
| Compute die 1       |           1 |           3 |           1 |          =
 1 |
| IO die 0            |           4 |           6 |           2 |          =
 2 |
| IO die 1            |           5 |           7 |           3 |          =
 3 |
+---------------------+-------------+-------------+-------------+----------=
---+

Maciej Wieczor-Retman (2):
  platform/x86/intel-uncore-freq: Rename instance_id
  platform/x86/intel-uncore-freq: Expose instance ID in the sysfs

 .../pm/intel_uncore_frequency_scaling.rst        |  7 +++++++
 .../uncore-frequency/uncore-frequency-common.c   | 16 +++++++++++++---
 .../uncore-frequency/uncore-frequency-common.h   |  8 ++++++--
 .../uncore-frequency/uncore-frequency-tpmi.c     | 15 ++++++++++++++-
 4 files changed, 40 insertions(+), 6 deletions(-)

--=20
2.53.0


