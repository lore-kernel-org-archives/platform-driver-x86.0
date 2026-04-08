Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D225A3A2551
	for <platform-driver-x86@vger.kernel.org>; Wed,  8 Apr 2026 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775665670; cv=none; b=Dl6cZESPH4GvpB4Y5bA0JizHpkEhJmOkIRkyODsRqiePZTMgYvyuWyQFh5aKNZ3uyXIEvBX+YUiTN9A72UOGFXHkjCrVUYPOWMvbFTnUarmh9fcZW1bKEuPicA7aaZkTca48Hdb9V5jLSpAnubnmf82vzf6NM8X/kr06Ri5UaEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775665670; c=relaxed/simple;
	bh=MSux11/UUR6St6vxzXDrJlR4GeVCUqnGP/5mFGldxg4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Rt8m1Y3gJEOTfKNJ+OackHBZ/Q3+aJghTx8vmu6/c0XgU85dCtqkmYcmTIrkjcWW9vx6HWpP9GCVKVnqBEVdsoJtszzAYkX1uj8EPmxlnwZH+IM8hJQy6K05i7u+vJChP1jXFKB3bexGvE6OyBetQ5GbXN9B+2AvnS65RciXHFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=H6KBDMmM; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="H6KBDMmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775665665; x=1775924865;
	bh=+yLHN79cSdzszCHYWlX9JCnYRBioU96Hc0JclLCYCWM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=H6KBDMmMikQ0Airr3pwJJrVhptfPxex2lmK3xY2mDEZNZgqS8T22ef0Rbzq51LJa7
	 RaT12QSZ/JOfJyZjskZzLKAoZc3w1SLdOoHto6ElxLNBUhALoj43LbUNymyPy2qz4J
	 WvFFGTuNvyd9kO3F47EhM9nql97sgQHSu8DV91ZXETGCySz/JhYjByw2mjA6ivuilI
	 S9Yrk5XX7ePwDhi3bk/fFGvKix7UO1fsr/tPtsBugYpLHIGMaTd/5OAUGRlogpAPgE
	 Y6NL8BZyn33HbFBcRZM/eMUDYiSnRL0aqjkLDgi5vq6YtH8lqkHNnO1CzZSWH0K40N
	 6gx9REJ2CVidw==
Date: Wed, 08 Apr 2026 16:27:40 +0000
To: skhan@linuxfoundation.org, ilpo.jarvinen@linux.intel.com, hansg@kernel.org, corbet@lwn.net, srinivas.pandruvada@linux.intel.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v3 0/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
Message-ID: <cover.1775665057.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 3ffdcd7bbba178a7bb8a82ec494a0c6258adb922
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
can use it for direct MMIO reads or writes.

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

Changes in v3:
- Remove sentence from the cover letter claiming that the motivation was
  to replace doing the same thing through MSRs - that was deprecated and
  it's not available.
- sprintf() -> sysfs_emit() in show_instance_id().
- static -> static inline in set_instance_id().
- Small correction to 2/2 patch message.

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


