Received: from mail-106105.protonmail.ch (mail-106105.protonmail.ch [79.135.106.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6311740F734
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2026 11:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915588; cv=none; b=DP5CZlW+DCCZKczHSVU5hMAz4LD1kesMB67DPhk8pI6U28m4Qf37hlidrbzIrHfmPnwq1vUekWLimQQkLVK7bb2nTnPFZ84hCUxnNfGdmgbmn/9UnxYFx2k67GdcMEndueJyCc/08j1ecQJ0tJZU8tLcehK8U0k4o8G/gxGavr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915588; c=relaxed/simple;
	bh=90kfdl3Vt/u20dWyXJbhdRy/WO5ClBlvoUXscpeaH9I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gGUgCyESgRpMe0vFicH98r/CTFDgAYh85iEJic48UMqyagdbvaDYJhjrttYfSUWFvIfgBbf4q08InCbYuovJdXX/8GtD6xOCj2Cz5tkEOBryytDP9trKxurNEl3pBhmwYN/ezkuttqrtYbbcbHEnMbwKMCwdVe77/MHtrViI+VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=F+YftigE; arc=none smtp.client-ip=79.135.106.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="F+YftigE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1787915574; x=1788174774;
	bh=m82QTLBfLeO+3FXnGtmCqVrD/5KDXhi8qHpmWYKbIW4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=F+YftigEKSuX6r/SchVPbnEIkyPA7oFgzKSu3ek2f8GZUl7opyeP4IBzMFS0zk1Uy
	 N1ndNELyzPnggjpGJzq/fzc8U92m1KfgoW2QS4w+t1NQ5XPLuGPqLqjFMtGalU5/dg
	 KQfvzKlUm1B+tSy0CE1nuhDtKXs/e1aT9g0Ogk9GEXu6pVZ7l+TCLgxULH+/pgvNR5
	 nBOmUdlBODoFRg6YFBn+QOnd6nOxfFP47oWxb4gQ3aHH9h4AoCeLD3ZPsCtbx0YMOC
	 pSZzNwwG5gQsA9nL4e+vghe8shpyzLa5fQnQtG5nlxh7tgHlMhCi2hAQPpByKEmWj5
	 LK3zrSmLBekOg==
Date: Fri, 28 Aug 2026 11:12:49 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH 1/2] platform/x86: asus-armoury: fix sysfs_notify() of grouped attributes
Message-ID: <20260828111232.74443-2-yaseen@ghoul.dev>
In-Reply-To: <20260828111232.74443-1-yaseen@ghoul.dev>
References: <20260828111232.74443-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 569006fe34558643b7cf283c0c8783a5917f8194
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The store handlers call sysfs_notify(kobj, NULL, attr->attr.name), but
kobj is the "attributes" directory and the name is always
"current_value". Named groups get no kobject of their own, so the
lookup finds nothing and the notify quietly does nothing: a poll() on
<attribute>/current_value never wakes up.

Pass the group name down so the notify resolves
attributes/<group>/current_value. armoury_attr_uint_store() takes a new
fsname argument, threaded through __WMI_STORE_INT() and
__ROG_TUNABLE_RW(); the hand-written stores pass their own group names.

Fixes: f99eb098090e ("platform/x86: asus-armoury: move existing tunings to =
asus-armoury module")
Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
 drivers/platform/x86/asus-armoury.c | 15 ++++++++-------
 drivers/platform/x86/asus-armoury.h | 16 +++++++++-------
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asu=
s-armoury.c
index 93d9665717af..8e85fb08bd59 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -295,7 +295,7 @@ static int armoury_attr_enum_list(char *buf, size_t enu=
m_values)
=20
 ssize_t armoury_attr_uint_store(struct kobject *kobj, struct kobj_attribut=
e *attr,
 =09=09=09=09const char *buf, size_t count, u32 min, u32 max,
-=09=09=09=09u32 *store_value, u32 wmi_dev)
+=09=09=09=09u32 *store_value, u32 wmi_dev, const char *fsname)
 {
 =09u32 value;
 =09int err;
@@ -313,7 +313,7 @@ ssize_t armoury_attr_uint_store(struct kobject *kobj, s=
truct kobj_attribute *att
=20
 =09if (store_value !=3D NULL)
 =09=09*store_value =3D value;
-=09sysfs_notify(kobj, NULL, attr->attr.name);
+=09sysfs_notify(kobj, fsname, attr->attr.name);
=20
 =09if (asus_bios_requires_reboot(attr))
 =09=09asus_set_reboot_and_signal_event();
@@ -443,7 +443,8 @@ static ssize_t mini_led_mode_current_value_store(struct=
 kobject *kobj,
=20
 =09return armoury_attr_uint_store(kobj, attr, mapped_value, count, 0,
 =09=09=09=09       mini_led_mode_map[mode], NULL,
-=09=09=09=09       asus_armoury.mini_led_dev_id);
+=09=09=09=09       asus_armoury.mini_led_dev_id,
+=09=09=09=09       "mini_led_mode");
 }
=20
 static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
@@ -496,7 +497,7 @@ static ssize_t gpu_mux_mode_current_value_store(struct =
kobject *kobj,
 =09if (err)
 =09=09return err;
=20
-=09sysfs_notify(kobj, NULL, attr->attr.name);
+=09sysfs_notify(kobj, "gpu_mux_mode", attr->attr.name);
 =09asus_set_reboot_and_signal_event();
=20
 =09return count;
@@ -531,7 +532,7 @@ static ssize_t dgpu_disable_current_value_store(struct =
kobject *kobj,
 =09=09=09return err;
 =09}
=20
-=09sysfs_notify(kobj, NULL, attr->attr.name);
+=09sysfs_notify(kobj, "dgpu_disable", attr->attr.name);
=20
 =09return count;
 }
@@ -653,7 +654,7 @@ static ssize_t egpu_enable_current_value_store(struct k=
object *kobj, struct kobj
 =09 */
 =09armoury_pci_rescan();
=20
-=09sysfs_notify(kobj, NULL, attr->attr.name);
+=09sysfs_notify(kobj, "egpu_enable", attr->attr.name);
=20
 =09return count;
 }
@@ -747,7 +748,7 @@ static ssize_t apu_mem_current_value_store(struct kobje=
ct *kobj, struct kobj_att
 =09}
=20
 =09pr_info("APU memory changed to %uGB, reboot required\n", requested + 1)=
;
-=09sysfs_notify(kobj, NULL, attr->attr.name);
+=09sysfs_notify(kobj, "apu_mem", attr->attr.name);
=20
 =09asus_set_reboot_and_signal_event();
=20
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asu=
s-armoury.h
index afcb517dc5bf..f55dc2a5ccc0 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -25,6 +25,7 @@
  * @max: Maximum accepted value. Above this returns -EINVAL.
  * @store_value: Pointer to where the parsed value should be stored.
  * @wmi_dev: The WMI function ID to use.
+ * @fsname: The name of the attribute's group directory, for sysfs_notify(=
).
  *
  * This function is intended to be generic so it can be called from any "_=
store"
  * attribute which works only with integers.
@@ -40,7 +41,7 @@
  */
 ssize_t armoury_attr_uint_store(struct kobject *kobj, struct kobj_attribut=
e *attr,
 =09=09=09=09const char *buf, size_t count, u32 min, u32 max,
-=09=09=09=09u32 *store_value, u32 wmi_dev);
+=09=09=09=09u32 *store_value, u32 wmi_dev, const char *fsname);
=20
 /**
  * armoury_attr_uint_show() - Receive an uint from a WMI method.
@@ -72,13 +73,13 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, st=
ruct kobj_attribute *attr
 #define __ASUS_ATTR_RW(_func, _name) \
 =09__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
=20
-#define __WMI_STORE_INT(_attr, _min, _max, _wmi)=09=09=09=09\
+#define __WMI_STORE_INT(_attr, _min, _max, _wmi, _fsname)=09=09=09\
 =09static ssize_t _attr##_store(struct kobject *kobj,=09=09=09\
 =09=09=09=09     struct kobj_attribute *attr,=09=09\
 =09=09=09=09     const char *buf, size_t count)=09=09\
 =09{=09=09=09=09=09=09=09=09=09\
 =09=09return armoury_attr_uint_store(kobj, attr, buf, count, _min,=09\
-=09=09=09=09=09_max, NULL, _wmi);=09=09=09\
+=09=09=09=09=09_max, NULL, _wmi, _fsname);=09=09\
 =09}
=20
 #define ASUS_WMI_SHOW_INT(_attr, _wmi)=09=09=09=09=09=09\
@@ -121,7 +122,8 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, st=
ruct kobj_attribute *attr
=20
 #define __ATTR_RW_INT_GROUP_ENUM(_attrname, _minv, _maxv, _wmi, _fsname,\
 =09=09=09=09 _possible, _dispname)=09=09=09\
-=09__WMI_STORE_INT(_attrname##_current_value, _minv, _maxv, _wmi);=09\
+=09__WMI_STORE_INT(_attrname##_current_value, _minv, _maxv, _wmi,=09\
+=09=09=09_fsname);=09=09=09=09=09\
 =09ASUS_WMI_SHOW_INT(_attrname##_current_value, _wmi);=09\
 =09static struct kobj_attribute attr_##_attrname##_current_value =3D=09\
 =09=09__ASUS_ATTR_RW(_attrname, current_value);=09=09\
@@ -251,7 +253,7 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, st=
ruct kobj_attribute *attr
 =09static struct kobj_attribute attr_##_attrname##_default_value =3D=09=09=
\
 =09=09__ASUS_ATTR_RO(_attrname, default_value)
=20
-#define __ROG_TUNABLE_RW(_attr, _wmi)=09=09=09=09=09=09\
+#define __ROG_TUNABLE_RW(_attr, _wmi, _fsname)=09=09=09=09=09\
 =09static ssize_t _attr##_current_value_store(=09=09=09=09\
 =09=09struct kobject *kobj, struct kobj_attribute *attr,=09=09\
 =09=09const char *buf, size_t count)=09=09=09=09=09\
@@ -268,7 +270,7 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, st=
ruct kobj_attribute *attr
 =09=09return armoury_attr_uint_store(kobj, attr, buf, count,=09=09\
 =09=09=09=09       tunables->power_limits->_attr##_min,=09\
 =09=09=09=09       tunables->power_limits->_attr##_max,=09\
-=09=09=09=09       &tunables->_attr, _wmi);=09=09=09\
+=09=09=09=09       &tunables->_attr, _wmi, _fsname);=09\
 =09}=09=09=09=09=09=09=09=09=09\
 =09static ssize_t _attr##_current_value_show(=09=09=09=09\
 =09=09struct kobject *kobj, struct kobj_attribute *attr, char *buf)=09\
@@ -284,7 +286,7 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, st=
ruct kobj_attribute *attr
 =09=09__ASUS_ATTR_RW(_attr, current_value)
=20
 #define ASUS_ATTR_GROUP_ROG_TUNABLE(_attrname, _fsname, _wmi, _dispname)=
=09\
-=09__ROG_TUNABLE_RW(_attrname, _wmi);=09=09=09=09\
+=09__ROG_TUNABLE_RW(_attrname, _wmi, _fsname);=09=09=09\
 =09__ROG_TUNABLE_SHOW_DEFAULT(_attrname);=09=09=09=09\
 =09__ROG_TUNABLE_SHOW(min_value, _attrname, _attrname##_min);=09\
 =09__ROG_TUNABLE_SHOW(max_value, _attrname, _attrname##_max);=09\
--=20
2.55.0


