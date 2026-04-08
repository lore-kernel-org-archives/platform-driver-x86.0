Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11753AEF3A;
	Wed,  8 Apr 2026 16:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775665679; cv=none; b=Yr4Uhaen6gJHeLirBY8adJ9NgYOQgAOHBQ4Wc1th77tK4t6rBg35PNMrzfITnQp8A1LE5fO8GGGDwEgoG8bBS86VEAJj7c63tA9jGD/oWM4r6Ub4ecZoLcWFUJ0ZcJ13x5ddZXgtXWmisDyCie868wJodJVW1TX5CAMaH9RRoUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775665679; c=relaxed/simple;
	bh=riQCmPz/YRZQFAxixoC856ZnzKOlPUkU6SrpknoncaM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PXcI3DEMfwGuGXSwI7qxvgmTk1L7Lh+jLFzeV0z6h4EA8DaMgHhpw00+YOGVWw/Ny+7TVcFbxh9BstZtYAWeIoV2Wwi+DXszKYdPm8Y+cqovEByoIRpFZoI+D0cC/RbJBYheJimMOnfg/TCtf9a/BRkfvJ9DqiklUpFA5UIoCwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QvU3I+Un; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QvU3I+Un"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775665675; x=1775924875;
	bh=jYWkV8HkUkjj0VDQ4arrnM5cPTT1orgpOAjTYpZWlUw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QvU3I+UnnFTRBcQf7sP7Wt4X/8Ed+UKRyv9PK8jkol49D3vOQKOmirph4tk21KrhS
	 lpPDljc6Rm2NkaS3FaKf/XV2tOMZ+ukluwUtpKUBkMUkW8J6fyrTjpLNkA6peImet9
	 wJB3N92eZE1bfwBrvfgGaQBZhYfAaX5kt53yYroZvO6a314ZGBoOLt8k8BlxLj3KOv
	 hUsvdr4f2s+/Y+c0eCD1Ai2o5+Y2ymyP+cjT8nGdLcjL/+RVAGOMKNbUACmKDJd7V8
	 EK80GYgM8VY+BpITWf/28FF0u14ScBu9PG0NqT+6AC4tvT3tXANUIdQBkGXSGfaPAo
	 bNxWQsXy3zpRA==
Date: Wed, 08 Apr 2026 16:27:51 +0000
To: skhan@linuxfoundation.org, ilpo.jarvinen@linux.intel.com, hansg@kernel.org, corbet@lwn.net, srinivas.pandruvada@linux.intel.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Subject: [PATCH v3 2/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
Message-ID: <b9ae8d5f1ab86bcdb1a8636fa48865a9e49e2e21.1775665057.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1775665057.git.m.wieczorretman@pm.me>
References: <cover.1775665057.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: fcbb3ae2662d1b1562ffa7b408728a4b9a1fcee8
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Insufficient data is exported to allow direct access to TPMI registers
through MMIO. On non-partitioned systems domain_id can be used both for
mapping CPUs to their compute die IDs and for mapping die indices to
their MMIO memory blocks presented to userspace via TPMI debugfs.
However on partitioned systems the debugfs association doesn't work
anymore. This is due to how TPMI partitioning influences domain_id
calculation. The previous association is lost on partitioned systems in
order to keep using domain_id for mapping CPUs to compute dies.

Expose the instance ID in sysfs that's unique in the scope of one TPMI
partition (and hence one TPMI device). It's a physical index into mapped
MMIO blocks and can be used by userspace to figure out how to directly
access TPMI registers.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v3:
- Change sprintf -> sysfs_emit in show_instance_id().
- Change part of patch message 'MMIO memory blocks mapped' -> 'MMIO
  memory blocks presented to userspace...'
- Change assigning function to static inline.

Changelog v2:
- Redo the patch message.
- Redo the function comment that assigns instance_id.
- Modify the documentation.

 .../pm/intel_uncore_frequency_scaling.rst         |  7 +++++++
 .../uncore-frequency/uncore-frequency-common.c    | 10 ++++++++++
 .../uncore-frequency/uncore-frequency-common.h    |  6 +++++-
 .../uncore-frequency/uncore-frequency-tpmi.c      | 15 ++++++++++++++-
 4 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rs=
t b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
index d367ba4d744a..b43ad4d5e333 100644
--- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
+++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
@@ -88,8 +88,15 @@ and "fabric_cluster_id" in the directory.
=20
 Attributes in each directory:
=20
+``instance_id``
+=09This attribute is used to get die indices in userspace mapped MMIO
+=09blocks. Indices are local to a single TPMI partition. Needed for direct
+=09TPMI register access.
+
 ``domain_id``
 =09This attribute is used to get the power domain id of this instance.
+=09Indices are unique in all TPMI partitions on a given CPU package. Can b=
e
+=09used to map compute dies to corresponding CPUs.
=20
 ``die_id``
 =09This attribute is used to get the Linux die id of this instance.
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-c=
ommon.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-comm=
on.c
index 25ab511ed8d2..3b554418a7a3 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -29,6 +29,13 @@ static ssize_t show_domain_id(struct kobject *kobj, stru=
ct kobj_attribute *attr,
 =09return sysfs_emit(buf, "%u\n", data->domain_id);
 }
=20
+static ssize_t show_instance_id(struct kobject *kobj, struct kobj_attribut=
e *attr, char *buf)
+{
+=09struct uncore_data *data =3D container_of(attr, struct uncore_data, ins=
tance_id_kobj_attr);
+
+=09return sysfs_emit(buf, "%u\n", data->instance_id);
+}
+
 static ssize_t show_fabric_cluster_id(struct kobject *kobj, struct kobj_at=
tribute *attr, char *buf)
 {
 =09struct uncore_data *data =3D container_of(attr, struct uncore_data, fab=
ric_cluster_id_kobj_attr);
@@ -200,6 +207,9 @@ static int create_attr_group(struct uncore_data *data, =
char *name)
 =09if (data->domain_id !=3D UNCORE_DOMAIN_ID_INVALID) {
 =09=09init_attribute_root_ro(domain_id);
 =09=09data->uncore_attrs[index++] =3D &data->domain_id_kobj_attr.attr;
+=09=09init_attribute_root_ro(instance_id);
+=09=09data->uncore_attrs[index++] =3D &data->instance_id_kobj_attr.attr;
+
 =09=09init_attribute_root_ro(fabric_cluster_id);
 =09=09data->uncore_attrs[index++] =3D &data->fabric_cluster_id_kobj_attr.a=
ttr;
 =09=09init_attribute_root_ro(package_id);
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-c=
ommon.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-comm=
on.h
index 0d5fd91ee0aa..e319448dc1a4 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -36,6 +36,7 @@
  * @domain_id:=09=09Power domain id for this instance
  * @cluster_id:=09=09cluster id in a domain
  * @seqnum_id:=09=09Unique sequential id to append to directory name
+ * @instance_id:=09Die indices or feature instances for a single TPMI devi=
ce
  * @name:=09=09Sysfs entry name for this instance
  * @agent_type_mask:=09Bit mask of all hardware agents for this domain
  * @uncore_attr_group:=09Attribute group storage
@@ -56,6 +57,7 @@
  * @elc_floor_freq_khz_kobj_attr: Storage for kobject attribute elc_floor_=
freq_khz
  * @agent_types_kobj_attr: Storage for kobject attribute agent_type
  * @die_id_kobj_attr:=09Attribute storage for die_id information
+ * @instance_id_kobj_attr: Attribute storage for instance_id value
  * @uncore_attrs:=09Attribute storage for group creation
  *
  * This structure is used to encapsulate all data related to uncore sysfs
@@ -72,6 +74,7 @@ struct uncore_data {
 =09int domain_id;
 =09int cluster_id;
 =09int seqnum_id;
+=09int instance_id;
 =09char name[32];
 =09u16  agent_type_mask;
=20
@@ -90,7 +93,8 @@ struct uncore_data {
 =09struct kobj_attribute elc_floor_freq_khz_kobj_attr;
 =09struct kobj_attribute agent_types_kobj_attr;
 =09struct kobj_attribute die_id_kobj_attr;
-=09struct attribute *uncore_attrs[15];
+=09struct kobj_attribute instance_id_kobj_attr;
+=09struct attribute *uncore_attrs[16];
 };
=20
 #define UNCORE_DOMAIN_ID_INVALID=09-1
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-t=
pmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 1237d9570886..32d03bee09a0 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -385,7 +385,19 @@ static u8 io_die_index_next;
 /* Lock to protect io_die_start, io_die_index_next */
 static DEFINE_MUTEX(domain_lock);
=20
-static void set_domain_id(int id,  int num_resources,
+static inline void set_instance_id(int id, struct tpmi_uncore_cluster_info=
 *cluster_info)
+{
+=09/*
+=09 * On non-partitioned systems domain_id can be used for mapping both
+=09 * CPUs to compute die IDs and physical die indexes to MMIO mapped
+=09 * memory. However on partitioned systems domain_id loses the second
+=09 * association. Therefore instance_id should be used for that instead,
+=09 * while domain_id should still be used to match CPUs to compute dies.
+=09 */
+=09cluster_info->uncore_data.instance_id =3D id;
+}
+
+static void set_domain_id(int id, int num_resources,
 =09=09=09  struct oobmsm_plat_info *plat_info,
 =09=09=09  struct tpmi_uncore_cluster_info *cluster_info)
 {
@@ -686,6 +698,7 @@ static int uncore_probe(struct auxiliary_device *auxdev=
, const struct auxiliary_
 =09=09=09set_cdie_id(i, cluster_info, plat_info);
=20
 =09=09=09set_domain_id(i, num_resources, plat_info, cluster_info);
+=09=09=09set_instance_id(i, cluster_info);
=20
 =09=09=09cluster_info->uncore_root =3D tpmi_uncore;
=20
--=20
2.53.0


