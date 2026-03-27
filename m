Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD1C3246F8
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Mar 2026 15:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625811; cv=none; b=es7945rGLEuq4X2Dvc/42xooAgmPYVlQlCK8NpwC+2PpCZC71XaAokKqud0Bid5nJVUEM0wV7ixb/5/qzOiQNOxv2QIecHNvY9nwoXlPpku0UTGfjdWQUUyoOiNiMthwV+mbhuaeVHaQreIr3h6NVPS/A7VpzNJEI+anfC/jMTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625811; c=relaxed/simple;
	bh=Fiz2Y+9j/J8MubymvxlEdwjLc+ogkzIUb6zWwFqJidk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L8c3/Njo7zP4RSanhcFziZSRzLjr9tcxgSWQIiq4MAgOSA2VCcncuIH+6QO02TRmwJq9uYPdEvxuyB/fX30/+i5fKgCcTRHWNRgy3IWa71nodZDkqTO8Kp9XrOyvT7Vm23JzxA8wxXJ1kId26m/C5Ch1hS2ygl38mD/NHoKfO/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ZCheKsfL; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ZCheKsfL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774625801; x=1774885001;
	bh=d3HJVwdifOyBtPcjlWIlUHMIwXGohNhMNh/3j3nqeO0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZCheKsfLUffWzB9gJwWFYanr+2cR3EhOLSEbgtY3hfidjaPeX2ET12lID3v/ooyg8
	 LDZfgM7MuZNJpt6hTzWuoi5fYbYiA3220vJAreOGv2AHiWsoe24og22zl0+3Dw+62O
	 XzO/5///bjT1hDsX0IzRca2ZAMiRN8XMmOixg2ii9fUNbOrfMee5dVTWVV12DndWC8
	 wdOqgJ0QdNcc0N1PLA137Zt5f73lJWoXxoFU+qJnEc1b0xRGch8IMhctYMWExAtdnj
	 kkh0SFN+UksPmxBKdK/7sGecvu6vWYzudDCc81gqcn/KR1wosGkg8c/BXh/Fj6k6/O
	 GC846mX4nBabA==
Date: Fri, 27 Mar 2026 15:36:36 +0000
To: hansg@kernel.org, srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, dedekind1@gmail.com, artem.bityutskiy@linux.intel.com, m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Subject: [PATCH v1 1/2] platform/x86/intel-uncore-freq: Rename instance_id
Message-ID: <3c02a8e3c1d4f07fa7f37740c33050c4e1d3f6ee.1774625521.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1774625521.git.m.wieczorretman@pm.me>
References: <cover.1774625521.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 7e566e30aadb5d9c769895aa0c0737cb7cbbc02b
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

The "instance" word has a specific meaning in the TPMI uncore frequency
scaling ecosystem. One TPMI device can have multiple copies of a feature
and each copy is called an instance.

The currently used "instance_id" uncore_data struct field is a
sequentially generated value that's used for appending to uncore
directories inside the /sys/devices/system/cpu/intel_uncore_frequency
directory. It has no relation to the TPMI device feature copy.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
 .../x86/intel/uncore-frequency/uncore-frequency-common.c    | 6 +++---
 .../x86/intel/uncore-frequency/uncore-frequency-common.h    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-c=
ommon.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-comm=
on.c
index 7070c94324e0..71c47aa77d3c 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -268,7 +268,7 @@ int uncore_freq_add_entry(struct uncore_data *data, int=
 cpu)
 =09=09if (ret < 0)
 =09=09=09goto uncore_unlock;
=20
-=09=09data->instance_id =3D ret;
+=09=09data->seqname_id =3D ret;
 =09=09scnprintf(data->name, sizeof(data->name), "uncore%02d", ret);
 =09} else {
 =09=09scnprintf(data->name, sizeof(data->name), "package_%02d_die_%02d",
@@ -281,7 +281,7 @@ int uncore_freq_add_entry(struct uncore_data *data, int=
 cpu)
 =09ret =3D create_attr_group(data, data->name);
 =09if (ret) {
 =09=09if (data->domain_id !=3D UNCORE_DOMAIN_ID_INVALID)
-=09=09=09ida_free(&intel_uncore_ida, data->instance_id);
+=09=09=09ida_free(&intel_uncore_ida, data->seqname_id);
 =09} else {
 =09=09data->control_cpu =3D cpu;
 =09=09data->valid =3D true;
@@ -301,7 +301,7 @@ void uncore_freq_remove_die_entry(struct uncore_data *d=
ata)
 =09data->control_cpu =3D -1;
 =09data->valid =3D false;
 =09if (data->domain_id !=3D UNCORE_DOMAIN_ID_INVALID)
-=09=09ida_free(&intel_uncore_ida, data->instance_id);
+=09=09ida_free(&intel_uncore_ida, data->seqname_id);
=20
 =09mutex_unlock(&uncore_lock);
 }
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-c=
ommon.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-comm=
on.h
index 0abe850ef54e..915506de4ebf 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -35,7 +35,7 @@
  * @die_id:=09=09Die id for this instance
  * @domain_id:=09=09Power domain id for this instance
  * @cluster_id:=09=09cluster id in a domain
- * @instance_id:=09Unique instance id to append to directory name
+ * @seqname_id:=09=09Unique id to append to directory name
  * @name:=09=09Sysfs entry name for this instance
  * @agent_type_mask:=09Bit mask of all hardware agents for this domain
  * @uncore_attr_group:=09Attribute group storage
@@ -71,7 +71,7 @@ struct uncore_data {
 =09int die_id;
 =09int domain_id;
 =09int cluster_id;
-=09int instance_id;
+=09int seqname_id;
 =09char name[32];
 =09u16  agent_type_mask;
=20
--=20
2.53.0


