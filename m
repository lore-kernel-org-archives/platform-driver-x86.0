Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841D3F7A9B;
	Thu,  2 Apr 2026 19:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775159986; cv=none; b=ZDqFfpg03USL8jn4RcjxP3JZA2eZPlCnnyInrQT3DJVgFPnWrAmzVJCubiWlGMXdb+BUMFfEbeyW1Lo87BNLQNpBZ9aiDJK0R0161w7c4xnu+nRTlvt8NOr/6QuJEgKEIemI2oaQExkET/6OZvIKfAYJbHMhuYDEQngyhkutUgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775159986; c=relaxed/simple;
	bh=aSLgoUdV6fPrMqd3JYKKdJXpGU/+gGrOMfE39wiEFOc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iZvxsNiZoC2fPhr1npOXfPFwImYAeodAwGpTyqG4MDOYXmbv9ZbkfOcg3CFcAIN9Vwz177UHYmwCHYpW1HRbBx0Rrk3nQxflH3czNwXn3QJaS6fQWBwfif5Xa7CF7uBZlWQsRXcVfYfzlIdYj5UwKBVbIPMBIZm93qNtD1aWb8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=YH7Qsayr; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="YH7Qsayr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775159977; x=1775419177;
	bh=JaZgqln+i0uwiK9eU+T0j4tPbhjPino1ptQo6hxHowM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YH7QsayrGSDbAGKRsjcc8alF/YD9R//aIOpl8hjrhD45nw4N3+XLjHMWBg8/fkukv
	 RqEeqqmXGSxhogRs+ijrVwjuk0yyjsuO3U4uRps9davXYT10cQVXvcufN8aDM7cw8T
	 5mYsXa3aGbFUkht+Uxxd/5AvaeVfjsfmYYWCbCqKjow+Lx/DNCgk1mq+z4f/6uafJ8
	 feYyxMBNH5uRNHoP9DHxY7ggpiIEGAT7Uqz9SdCmQHVXJF18MBkmb0lNRriqu5EkEN
	 qAxTrZ+9Pk6fgOi8Gko5zkryHH8rYA3n/OCNWmSEesY5ZSsf8/RB8l3O1IojHA/JUQ
	 t8wIXLVImC46A==
Date: Thu, 02 Apr 2026 19:59:34 +0000
To: hansg@kernel.org, srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Subject: [PATCH v2 1/2] platform/x86/intel-uncore-freq: Rename instance_id
Message-ID: <00eb8abdbbbe607724dbb09481513686bfbd14aa.1775159775.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1775159775.git.m.wieczorretman@pm.me>
References: <cover.1775159775.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: b41ac48e8c40d05143c84dafeaa8a2fc8b8764b4
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

The "instance" word has a specific meaning in TPMI. It is a physical
index related to compute dies and IO dies present on a single TPMI
partition (which is also a single TPMI device). It's used for mapping
MMIO blocks for direct TPMI register access.

The currently used "instance_id" uncore_data struct field is a
sequentially generated value that's used for appending to uncore
directories inside the /sys/devices/system/cpu/intel_uncore_frequency
directory. It has no relation to the physical TPMI elements.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v2:
- Redid the first paragraph to better describe what "instance" is.
- Rename seqname_id to seqnum_id to emphasize it's a sequential number
  not sequential name.

 .../x86/intel/uncore-frequency/uncore-frequency-common.c    | 6 +++---
 .../x86/intel/uncore-frequency/uncore-frequency-common.h    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-c=
ommon.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-comm=
on.c
index 7070c94324e0..25ab511ed8d2 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -268,7 +268,7 @@ int uncore_freq_add_entry(struct uncore_data *data, int=
 cpu)
 =09=09if (ret < 0)
 =09=09=09goto uncore_unlock;
=20
-=09=09data->instance_id =3D ret;
+=09=09data->seqnum_id =3D ret;
 =09=09scnprintf(data->name, sizeof(data->name), "uncore%02d", ret);
 =09} else {
 =09=09scnprintf(data->name, sizeof(data->name), "package_%02d_die_%02d",
@@ -281,7 +281,7 @@ int uncore_freq_add_entry(struct uncore_data *data, int=
 cpu)
 =09ret =3D create_attr_group(data, data->name);
 =09if (ret) {
 =09=09if (data->domain_id !=3D UNCORE_DOMAIN_ID_INVALID)
-=09=09=09ida_free(&intel_uncore_ida, data->instance_id);
+=09=09=09ida_free(&intel_uncore_ida, data->seqnum_id);
 =09} else {
 =09=09data->control_cpu =3D cpu;
 =09=09data->valid =3D true;
@@ -301,7 +301,7 @@ void uncore_freq_remove_die_entry(struct uncore_data *d=
ata)
 =09data->control_cpu =3D -1;
 =09data->valid =3D false;
 =09if (data->domain_id !=3D UNCORE_DOMAIN_ID_INVALID)
-=09=09ida_free(&intel_uncore_ida, data->instance_id);
+=09=09ida_free(&intel_uncore_ida, data->seqnum_id);
=20
 =09mutex_unlock(&uncore_lock);
 }
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-c=
ommon.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-comm=
on.h
index 0abe850ef54e..0d5fd91ee0aa 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -35,7 +35,7 @@
  * @die_id:=09=09Die id for this instance
  * @domain_id:=09=09Power domain id for this instance
  * @cluster_id:=09=09cluster id in a domain
- * @instance_id:=09Unique instance id to append to directory name
+ * @seqnum_id:=09=09Unique sequential id to append to directory name
  * @name:=09=09Sysfs entry name for this instance
  * @agent_type_mask:=09Bit mask of all hardware agents for this domain
  * @uncore_attr_group:=09Attribute group storage
@@ -71,7 +71,7 @@ struct uncore_data {
 =09int die_id;
 =09int domain_id;
 =09int cluster_id;
-=09int instance_id;
+=09int seqnum_id;
 =09char name[32];
 =09u16  agent_type_mask;
=20
--=20
2.53.0


