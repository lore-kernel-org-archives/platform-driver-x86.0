Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA1647AF42;
	Wed, 13 May 2026 15:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687281; cv=none; b=aX/kUcUALqwwlIgyrVik3LiZ+fvPua3cG12zs7fIe01D84MLa0pmrxI/BPfIpK/fB0C490LF9jILQt+6dphpzcfX6jR4G7g1Ifjsujh3L14DpDDXHXuG3Q/bAWFBXRT7km7zDzfjHR+NouBICkrwOR50lqg2O1t0jeRv8tvozgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687281; c=relaxed/simple;
	bh=0Z3O/+iBjwk25Sjwj2+UlIX9lnQi9fTRWmCz9pkq6yE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r8ZdZnhCtiHRwnu0VbIgKeQVkXFaust5Fm56Qf3+YDXZnXD6/E0HXM1rkBGcuRzybbGg17ZUaevqfh+rvqtN+5PFztsFbiQKRwrnDbCkWseR5FMFPZnbjLtKyKCQBKcuMxPyf3rg764MNJMDd9pNQfie6yjvgxixyw96JLP5HDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=dVLpHp3a; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="dVLpHp3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail; t=1778687271; x=1778946471;
	bh=Qa/XDdTieujjNbBnzvDVqeoZ6K3OneNDmc+5p2ujssM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dVLpHp3aFOFpiFgQWDnVTTSXHe3jOSQq48TpEmQH6xCJwAzSV7wZIEzXr/JtS2vU5
	 pbGXv1Zwe3iSrUOTcONF/Uq2H4zzVQyitvpaYPxrevEJ0JlqSKDwWowwEK4mVsUENd
	 4aXKWyU5Jxh6REa6WCxcKL1FV6n9+mzZzrC8sGbnhi3j40ziouzmjAmw78preeU/rq
	 PuAFz86jPr5NRwc1BUlmQnCdqnfOKOb/IPiR+gPulCjrGaTJF6iwR1DYR4yL4ZrNf+
	 S0lrxKHkkmynTHYj1XpI2y2vs70EM+8v1yQfVcYDctq8SI5RssOCzkJhxHQlm+pscr
	 96SCQ6q+QoeRw==
Date: Wed, 13 May 2026 15:47:44 +0000
To: platform-driver-x86@vger.kernel.org
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: yaseen@ghoul.dev, corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev, derekjohn.clark@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, prasanth.ksr@dell.com, mpearson-lenovo@squebb.ca, Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: asus-armoury: expose requires_fan_curve via sysfs
Message-ID: <20260513154714.25160-3-yaseen@ghoul.dev>
In-Reply-To: <20260511061901.907540-1-yaseen@ghoul.dev>
References: <20260511061901.907540-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 8693c17f77e42fc502e232992efc58f85045093a
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Expose the per-model requires_fan_curve flag as a read-only sysfs
attribute so userspace tools (asusctl, rogcc) can discover whether
the system requires an active custom fan curve for PPT changes to
take effect, and warn the user before issuing such writes.

The attribute appears at:
  /sys/class/firmware-attributes/asus-armoury/attributes/requires_fan_curve

Document the attribute in
Documentation/ABI/testing/sysfs-class-firmware-attributes.

Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
---
 .../testing/sysfs-class-firmware-attributes   | 25 +++++++++++++++++++
 drivers/platform/x86/asus-armoury.c           | 15 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Do=
cumentation/ABI/testing/sysfs-class-firmware-attributes
index 2713efa509b4..12700a077f43 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -492,3 +492,28 @@ Description:
 =09=09log entry size identifies audit log size for the current BIOS versio=
n.
 =09=09The current size is 16 bytes but it can be up to 128 bytes long in f=
uture BIOS
 =09=09versions.
+
+What:=09=09/sys/class/firmware-attributes/asus-armoury/attributes/requires=
_fan_curve
+Date:=09=09May 2026
+KernelVersion:=097.1
+Contact:=09platform-driver-x86@vger.kernel.org
+Description:
+=09=09A read-only attribute that reads 1 on ASUS ROG models where the
+=09=09BIOS requires a custom fan curve to be active before Package
+=09=09Power Tracking (PPT) writes take effect. On affected models, the
+=09=09BIOS silently ignores writes to ppt_pl1_spl, ppt_pl2_sppt,
+=09=09ppt_pl3_fppt, ppt_apu_sppt and ppt_platform_sppt unless a custom
+=09=09fan curve has been written via the asus_custom_fan_curve hwmon
+=09=09device.
+
+=09=09The kernel rejects PPT writes with -EBUSY on these models when
+=09=09no fan curve is active. Userspace tools can read this attribute
+=09=09to surface a clear prerequisite to the user instead of letting
+=09=09the write appear to succeed at the firmware-attribute layer
+=09=09while the BIOS discards it.
+
+=09=09=09=3D=3D=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+=09=09=090=09No fan curve prerequisite for PPT writes.
+=09=09=091=09A custom fan curve must be active; PPT writes
+=09=09=09=09return -EBUSY otherwise.
+=09=09=09=3D=3D=09=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asu=
s-armoury.c
index 9b1c41a25b38..9b483d7e9855 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -127,6 +127,13 @@ static ssize_t pending_reboot_show(struct kobject *kob=
j, struct kobj_attribute *
=20
 static struct kobj_attribute pending_reboot =3D __ATTR_RO(pending_reboot);
=20
+static ssize_t requires_fan_curve_show(struct kobject *kobj, struct kobj_a=
ttribute *attr, char *buf)
+{
+=09return sysfs_emit(buf, "%d\n", asus_armoury.requires_fan_curve);
+}
+
+static struct kobj_attribute requires_fan_curve =3D __ATTR_RO(requires_fan=
_curve);
+
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
 =09return !strcmp(attr->attr.name, "gpu_mux_mode") ||
@@ -914,6 +921,12 @@ static int asus_fw_attr_add(void)
 =09=09goto err_destroy_kset;
 =09}
=20
+=09err =3D sysfs_create_file(&asus_armoury.fw_attr_kset->kobj, &requires_f=
an_curve.attr);
+=09if (err) {
+=09=09pr_err("Failed to create requires_fan_curve attribute\n");
+=09=09goto err_destroy_kset;
+=09}
+
 =09asus_armoury.mini_led_dev_id =3D 0;
 =09if (armoury_has_devstate(ASUS_WMI_DEVID_MINI_LED_MODE))
 =09=09asus_armoury.mini_led_dev_id =3D ASUS_WMI_DEVID_MINI_LED_MODE;
@@ -987,6 +1000,7 @@ static int asus_fw_attr_add(void)
 =09if (asus_armoury.mini_led_dev_id)
 =09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_=
attr_group);
 err_remove_file:
+=09sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &requires_fan_curve=
.attr);
 =09sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.att=
r);
 err_destroy_kset:
 =09kset_unregister(asus_armoury.fw_attr_kset);
@@ -1161,6 +1175,7 @@ static void __exit asus_fw_exit(void)
 =09if (asus_armoury.mini_led_dev_id)
 =09=09sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_=
attr_group);
=20
+=09sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &requires_fan_curve=
.attr);
 =09sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.att=
r);
 =09kset_unregister(asus_armoury.fw_attr_kset);
 =09device_destroy(&firmware_attributes_class, MKDEV(0, 0));
--=20
2.54.0


