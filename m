Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6024830CD92;
	Fri, 27 Mar 2026 15:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625815; cv=none; b=O/MB+rhd29/YOnNloiA0nCQIK34wSPzYy0qrQbCX/LvH0IJmdX6NYkoaj/KMsqj/GwB724no5dhuB4UN5ih8DEztjM0FpjsfWJ90+hk+M8tmgTpO8cDpqpJP0vRuAJFVhWmzKaPOmK/jkzoDFVdohjr/AcUJKdhiAdM87b6WtOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625815; c=relaxed/simple;
	bh=MzetXQ4muZZlC6OzAg6zKKucgPcPnufVMWWJ5xdbzbc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X6hWSN0gtPVtVP3pNybyUxEUHZ71dAIzV+lBh7j2lxTTVIE0pZlYwiTQLuFc25FYQWXlhrBI5X9KvgtjSnmRzlzaXHs0F+e5DR3Xzdwntou7Jt/1HLp9RfG4/UL3DW281hFlYm5qZ2O03yElZouJ1e8WihmsfdjaIxRfQhouTGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=bZarGDYX; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="bZarGDYX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774625805; x=1774885005;
	bh=bkwqVcqiEdaappRCb0uou2xuF6m9qsxjhBHdURdbkOg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bZarGDYXaRe7yCN8nDfUXNYnCkQUthFqEwJkq6RK6AfGEFdZ4jmra7DOngwF/F5jS
	 Yqlxtd8AlTgFq5FfeinrCAsmJDgSwzQOCZJNeWw2e8vYCAniwgjghat7Dr3iI7MgLr
	 xUYsz2un06YQCTGpE0CXYwTSWsQdMCFO663IqYK/gp91W5/7xnvHMecO5TITo22Kol
	 vqlrQF0ODd/LItYy9AH1lECVlAktCjW1RhrCxKxG24K4e2LK3PDwCoTjJ6CQr3ET90
	 BB4JtX2Guh8LnkpG0art3LlbDRQy1lzRnmOzqXHtGkU/BEFXFTpr8grhIJL5NVEwc2
	 J6ABrmgShGiZA==
Date: Fri, 27 Mar 2026 15:36:41 +0000
To: hansg@kernel.org, srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Subject: [PATCH v1 2/2] platform/x86/intel-uncore-freq: Expose instance ID in the sysfs
Message-ID: <15529d14563cea09d53278c96c660a3120ad7da0.1774625521.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1774625521.git.m.wieczorretman@pm.me>
References: <cover.1774625521.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: cfaa1ffc870e5088bbc25756cb2d0404fd3b23ac
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

To allow userspace matching between the kernel driver and direct TPMI
register accesses, expose the data required to identify a TPMI uncore
frequency control register set.

Specifically expose the instance ID that's unique in the scope of one
TPMI device. The value was previously available through the domain_id
file exported through sysfs. However on newer systems with multiple
clusters attached to a single instance, domain_id is taking on a unique
value, that's not local to the single TPMI device anymore.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 .../uncore-frequency/uncore-frequency-common.c  | 10 ++++++++++
 .../uncore-frequency/uncore-frequency-common.h  |  6 +++++-
 .../uncore-frequency/uncore-frequency-tpmi.c    | 17 ++++++++++++++++-
 3 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-c=
ommon.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-comm=
on.c
index 71c47aa77d3c..52a62cad35de 100644
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
index 915506de4ebf..5e00030fedc5 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -36,6 +36,7 @@
  * @domain_id:=09=09Power domain id for this instance
  * @cluster_id:=09=09cluster id in a domain
  * @seqname_id:=09=09Unique id to append to directory name
+ * @instance_id:=09Feature instances for a single PCI device
  * @name:=09=09Sysfs entry name for this instance
  * @agent_type_mask:=09Bit mask of all hardware agents for this domain
  * @uncore_attr_group:=09Attribute group storage
@@ -56,6 +57,7 @@
  * @elc_floor_freq_khz_kobj_attr: Storage for kobject attribute elc_floor_=
freq_khz
  * @agent_types_kobj_attr: Storage for kobject attribute agent_type
  * @die_id_kobj_attr:=09Attribute storage for die_id information
+ * @instance_id_kobj_attr: Attribute storage for feat_instance value
  * @uncore_attrs:=09Attribute storage for group creation
  *
  * This structure is used to encapsulate all data related to uncore sysfs
@@ -72,6 +74,7 @@ struct uncore_data {
 =09int domain_id;
 =09int cluster_id;
 =09int seqname_id;
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
index 1237d9570886..e74e7d2e26b6 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -385,7 +385,21 @@ static u8 io_die_index_next;
 /* Lock to protect io_die_start, io_die_index_next */
 static DEFINE_MUTEX(domain_lock);
=20
-static void set_domain_id(int id,  int num_resources,
+static void set_instance_id(int id, struct tpmi_uncore_cluster_info *clust=
er_info)
+{
+=09/*
+=09 * In its base form the domain_id is a per-TPMI device value that lists
+=09 * feature instances for that specific TPMI device (instances as named =
by
+=09 * the intel_vsec system). On newer platforms the cdie system comes int=
o
+=09 * effect which makes domain_id a unique identifier and there is no mor=
e
+=09 * correlation between the TPMI device and the domain_id number. The ol=
d
+=09 * version is still relevant so TPMI device scoped information can be
+=09 * matched with the data from the TPMI driver.
+=09 */
+=09cluster_info->uncore_data.instance_id =3D id;
+}
+
+static void set_domain_id(int id, int num_resources,
 =09=09=09  struct oobmsm_plat_info *plat_info,
 =09=09=09  struct tpmi_uncore_cluster_info *cluster_info)
 {
@@ -686,6 +700,7 @@ static int uncore_probe(struct auxiliary_device *auxdev=
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


