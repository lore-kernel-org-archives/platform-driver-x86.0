Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EEB3F7A90;
	Thu,  2 Apr 2026 19:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775159990; cv=none; b=f79RJjwxf/RWg6jHoXWtOeIeCy6pdciYgBNP4mwhzLYgY7DzJXhxpyL3+uGfGqR6Um5bGgSw9b8DVgnPtqsApjR5GgPttD/qkecstbD3r32cmWKskYgJjlgmYd8FJ8mfqqAWD/jOP/wOm7XlYEQTob5djAeve0TytxelUT8Gu30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775159990; c=relaxed/simple;
	bh=EbRjYgy+FrCNn2LkKtmtsNnh9H2TlZHUGjoE5XhhRxg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZSDKm9UdBpWkI0d4XFX6vpvA/jIFLHRTTKz/kxxz0OTtc+TiUCP19AHVcKM1hmhofjlzPN6O2iEAjzeUMBOwK3J6YqLGJzF7bRnG5m6ZbXfDJLiM70NHXPYAlRx5CW1lCvv/aRkUY0A8DS8MbKsZSWA1MsC2U13khNiG47+lfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=MxU+KGnp; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="MxU+KGnp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775159981; x=1775419181;
	bh=zYgzVU2N/t1QzqJfb24JN2Lu9/ycG7dl/U3m5TJ5InM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=MxU+KGnpq5SFv9Awudm0beCbVbibMjDL7ZzDO4abPcPcfHs8lKpWMZFJ0CB+gFJM9
	 d5KLv+06qEvH8po+7QP1ukZfNPDMyOeZTpFW9Cio4TTotYwc3iCOyZ7qt8xYkHdiuX
	 NEvi0GK/PQswm23wdDaEnpfF3vBNLZ8o/Vm2gI7SUoJAhFDm10spPttmhM9pywDzOd
	 yNv8v9Y8kdijTttIsBT1YqYQaNSKUnhIq6CJz7EPV33g+zXi/VjObNnKO3pA5GxgqT
	 W+/wjk/p6qneZK+vObMcokkEz3IgybQZYXGdLwkfjmLR492d1qjIfm8+1WTUwHFnBd
	 YcLiUE3cLWfyQ==
Date: Thu, 02 Apr 2026 19:59:38 +0000
To: hansg@kernel.org, srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Subject: [PATCH v2 2/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
Message-ID: <191ea429fcf60aa6612b89dc9357c6d452c50be4.1775159775.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1775159775.git.m.wieczorretman@pm.me>
References: <cover.1775159775.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: f481f315030f8e04dc3f1dba1ba3404949d6a7c2
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
their MMIO memory blocks mapped into userspace. However on partitioned
systems it can't be used for mapping MMIO blocks anymore. This is due to
how TPMI partitioning influences domain_id calculation. The previous
association is lost on partitioned systems in order to keep using
domain_id for mapping CPUs to compute dies.

Expose the instance ID in sysfs that's unique in the scope of one TPMI
partition (and hence one TPMI device). It's a physical index into mapped
MMIO blocks and can be used by userspace to figure out how to directly
access TPMI registers.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
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
index 25ab511ed8d2..7141544ee94b 100644
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
+=09return sprintf(buf, "%u\n", data->instance_id);
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
index 1237d9570886..1676a2049aad 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -385,7 +385,19 @@ static u8 io_die_index_next;
 /* Lock to protect io_die_start, io_die_index_next */
 static DEFINE_MUTEX(domain_lock);
=20
-static void set_domain_id(int id,  int num_resources,
+static void set_instance_id(int id, struct tpmi_uncore_cluster_info *clust=
er_info)
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


