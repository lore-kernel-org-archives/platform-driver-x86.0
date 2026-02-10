Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3A0311979
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 23:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770767269; cv=none; b=TLTxoZUFu8PTTyi1f5JAF6YbP77emBKNuRlRtK4SvEhE8SobmcoU1pkNB2Wn6FxdIvoyNb+Y9+rDPTlDXxD0nPEh+AtP8C1CCHtBbMx4qGK+hdhjENAFOMRADp/0nsxTRpv8o26Z2cp1cpL66sM5EtfMbUEVHTZJVgPo8opjvfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770767269; c=relaxed/simple;
	bh=KiHb069cxX13tq9laowpn82Zdv8sPY8CBAugnGM+YRM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=j/2UVxqEaPLno3fxKt4Q7MLwcxMZDXvSM1uutSXQDOic0VcNuXRBzB8L+6JRP3yeoGimt1ni3XgRBUvW6Nm7+tz9G1SiE2QyOLmSMcT+1gvmSfKU4XgMOzD2OyttH9JLFg1gnS8rtaRKCGPiW1dIitDjNfMREyJsgfwfL4ggF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MEBpeC46; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MEBpeC46"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-5faa8a9d7b7so1807322137.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 15:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770767267; x=1771372067; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvES4/ZrFPGQlEWluGB4LJCYwYnKS2zQigi3ndfuU14=;
        b=MEBpeC46h2f6d2KCnuWKf/Tlg5KyVayJPTYKBUzZfz5seIBCdA2J4FOyARdwirpllm
         1Teebi0I8v3K/WQCCgAxtWEjN1d/5XvE3mAsGlAkxzqF0zY4nkYagrLIIo6x/cCKQ83Y
         lk9Pg1bzTUVoO3H9Gsykp1i0IO01P6E7jQQEXlfZHhuD2uOxoqgVA286Y/SZ22oD1UqO
         7OkQ2uuDwnxlo8d9UTDhMmCDwtY+ZoF68vGsSefuoeH6x5hEGm4a5RDbqRfc4yANKVuZ
         7JKRBdEHHMOpX8Q9S5/r/303b3EnxQt4T4/mNhZX0RPCNq4ImF/3GN24SL35EUrADlqE
         F5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770767267; x=1771372067;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QvES4/ZrFPGQlEWluGB4LJCYwYnKS2zQigi3ndfuU14=;
        b=Pr/a9WfwrNoUB205bjq9oJY/NU7lSBD1QL6lDu7G3yw/kmqGmcr7mH7pK+eNudYlba
         NlhS7vEPiS1bhTvzHkOxl1xg4gyebIy3AtUj5+gjo8ZRgQoRnF6MkUNLHszRT6ydzrVW
         Gu/fliDmyHw8WJgxntYRRw0ubFm2KAUVf4EysHw0iBKD7kemzO1x1JNmPVp/VLRtklDX
         sXPMQm5I5zlWos9iHE5Ak4KsbYShbtdEBAmnkeV0qRwoVcKMRC+OUq4NZALnq6UHIxKb
         O8ZDwZYIAQzetdmjgHmNwgWaak6TOo7MKbbQx9C4cYdGeYs4dTpe86kOTv3JDGHF7Oyk
         SyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHAwVa7Jf517T1xF4yOVcg4Ddy0KRsAb02pTmn+M6rWiFpAD4lTF8F/wlkEGVXJMbMfAIUMsX/JONRdg7jB/7nOKRG@vger.kernel.org
X-Gm-Message-State: AOJu0YzQfh+s7zV24hzBV6QLHIVIO/N+J7a+XhLQQeK0XByB3i7rrvni
	q+oF/2WfhbV1nIMT3ZhBXcy8tk4VUr7wKkb3rzsAurj+7isz9MrAYaLj
X-Gm-Gg: AZuq6aLvdWibNcFojXtemLrxm48oLjYT6IL9eJ0n57HfOBevg3jOpo9GtCYLNJpeGVo
	HU2gfTjzeALntvcmo4Y8D8kaSoJrKzz6B73hjiFcKqXIOEOi4ChzTCpPLLFO+AyNAzcXM3NavGi
	d4zqFVvDaxWPR7nlsm1/U83VMgSPElUiCIOuN7UTB4BpdayDPxn8vc6HuMClZhJfKutb2+h1Gc9
	u2kmTf6HfP0+KTlv8GipPo5vsU8nmVF7WdRatg3Y62BFMu5Eth1qTpAiXG5sJrWGhFdkPuj0NZN
	zXFKXKDGs5g0N8sGidoGyBz3e8s0DNQ7W0vJnBwsX+4uMWlDploTfJPUuHsMr1bJpgfxJIU8kaT
	2TIlQW8d9k3NkR3E7LwRR9is+/ClUwKcKY3F4eg8BEryAE59yRnOPGIGVUjh9FHfuBkx/KI5JZZ
	yKcwDLYRskbPlCadTO1b23g4qqcLswbQ==
X-Received: by 2002:a05:6102:38d2:b0:5f1:b7b2:8929 with SMTP id ada2fe7eead31-5fde90ef296mr35257137.15.1770767266845;
        Tue, 10 Feb 2026 15:47:46 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:c903:2904:3cc3:8b4c])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd14e0b7sm133791241.3.2026.02.10.15.47.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 15:47:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 18:47:44 -0500
Message-Id: <DGBOLV4DTHCL.G3737VW5ZT9C@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, <platform-driver-x86@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] platform/x86: lenovo-wmi-capdata: Add debugfs file
 for dumping capdata
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Derek J. Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Mark Pearson" <mpearson-lenovo@squebb.ca>, "Armin Wolf" <W_Armin@gmx.de>,
 "Hans de Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260210191938.137234-1-i@rong.moe>
 <20260210191938.137234-3-i@rong.moe>
 <34161A06-2732-4819-B986-4B471B98EF44@gmail.com>
In-Reply-To: <34161A06-2732-4819-B986-4B471B98EF44@gmail.com>

On Tue Feb 10, 2026 at 3:38 PM -05, Derek J. Clark wrote:
> On February 10, 2026 11:19:37 AM PST, Rong Zhang <i@rong.moe> wrote:
>>The Lenovo GameZone/Other interfaces have some delicate divergences
>>among different devices. When making a bug report or adding support for
>>new devices/interfaces, capdata is the most important information to
>>cross-check with.
>>
>>Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users can
>>dump capdata and include it in their reports.
>>
>>Since `struct capdata01' is just an extension to `struct capdata00',
>>also converts the former to include the latter anonymously
>>(-fms-extensions, since v6.19). In this manner type casting won't be
>>confusing.
>>
>>Signed-off-by: Rong Zhang <i@rong.moe>
>>---
>> drivers/platform/x86/lenovo/Kconfig       |   1 +
>> drivers/platform/x86/lenovo/wmi-capdata.c | 121 ++++++++++++++++++++++
>> drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
>> 3 files changed, 123 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
>>index f885127b007f1..8357971c76d80 100644
>>--- a/drivers/platform/x86/lenovo/Kconfig
>>+++ b/drivers/platform/x86/lenovo/Kconfig
>>@@ -236,6 +236,7 @@ config YT2_1380
>> config LENOVO_WMI_CAPDATA
>> 	tristate
>> 	depends on ACPI_WMI
>>+	depends on LENOVO_WMI_HELPERS
>>=20
>> config LENOVO_WMI_EVENTS
>> 	tristate
>>diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform=
/x86/lenovo/wmi-capdata.c
>>index ee1fb02d8e31e..ca478b45119bc 100644
>>--- a/drivers/platform/x86/lenovo/wmi-capdata.c
>>+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
>>@@ -32,6 +32,7 @@
>> #include <linux/cleanup.h>
>> #include <linux/component.h>
>> #include <linux/container_of.h>
>>+#include <linux/debugfs.h>
>> #include <linux/device.h>
>> #include <linux/dev_printk.h>
>> #include <linux/err.h>
>>@@ -43,11 +44,13 @@
>> #include <linux/mutex_types.h>
>> #include <linux/notifier.h>
>> #include <linux/overflow.h>
>>+#include <linux/seq_file.h>
>> #include <linux/stddef.h>
>> #include <linux/types.h>
>> #include <linux/wmi.h>
>>=20
>> #include "wmi-capdata.h"
>>+#include "wmi-helpers.h"
>>=20
>> #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB=
300E"
>> #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE01=
8154"
>>@@ -88,6 +91,7 @@ struct lwmi_cd_priv {
>> 	struct notifier_block acpi_nb; /* ACPI events */
>> 	struct wmi_device *wdev;
>> 	struct cd_list *list;
>>+	struct dentry *debugfs_dir;
>>=20
>> 	/*
>> 	 * A capdata device may be a component master of another capdata device=
.
>>@@ -118,6 +122,8 @@ struct cd_list {
>>=20
>> static struct wmi_driver lwmi_cd_driver;
>>=20
>>+/* =3D=3D=3D=3D=3D=3D=3D=3D Device components =3D=3D=3D=3D=3D=3D=3D=3D *=
/
>>+
>> /**
>>  * lwmi_cd_match() - Match rule for the master driver.
>>  * @dev: Pointer to the capability data parent device.
>>@@ -471,6 +477,116 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WM=
I_CAPDATA");
>> DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan)=
;
>> EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
>>=20
>>+/* =3D=3D=3D=3D=3D=3D=3D=3D debugfs =3D=3D=3D=3D=3D=3D=3D=3D */
>>+
>>+/**
>>+ * lwmi_cd00_show() - Dump capdata00
>>+ * @s: Pointer to seq_file where the capdata00 is dumped.
>>+ * @cd00: Pointer to a capdata00 struct to be dumped.
>>+ */
>>+static void lwmi_cd00_show(struct seq_file *s, struct capdata00 *cd00)
>>+{
>>+	u8 dev =3D FIELD_GET(LWMI_ATTR_DEV_ID_MASK, cd00->id);
>>+	u8 feat =3D FIELD_GET(LWMI_ATTR_FEAT_ID_MASK, cd00->id);
>>+	u8 mode =3D FIELD_GET(LWMI_ATTR_MODE_ID_MASK, cd00->id);
>>+	u8 type =3D FIELD_GET(LWMI_ATTR_TYPE_ID_MASK, cd00->id);
>>+	bool extra =3D cd00->supported & ~(LWMI_SUPP_GET | LWMI_SUPP_SET | LWMI=
_SUPP_VALID);
>>+	bool get =3D cd00->supported & LWMI_SUPP_GET;
>>+	bool set =3D cd00->supported & LWMI_SUPP_SET;
>>+	bool valid =3D cd00->supported & LWMI_SUPP_VALID;
>
> Hi Rong,
>
> I have something that will clean this up in the series I'm working on, LW=
MI_ATTR_ID, that pushes all the FIELD_PREP into a macro. Perhaps it would b=
e worth combining this series into mine that so we can use it here as well.=
=20
>
> My series also addresses some fairly significant bugs, so I'd prefer to n=
ot have to wait for this series to get approved to post it as it currently =
conflicts in other areas.
>
>>+	seq_printf(s, "  id:             0x%08x [dev: %2u, feat: %2u, mode: %2u=
, type: %2u]\n",
>>+		   cd00->id, dev, feat, mode, type);
>>+
>>+	seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->supported,
>>+		   extra ? '+' : ' ',
>>+		   get   ? 'R' : ' ',
>>+		   set   ? 'W' : ' ',
>>+		   valid ? 'V' : ' ');
>>+
>>+	seq_printf(s, "  default_value:  %u\n", cd00->default_value);
>>+}
>>+
>>+/**
>>+ * lwmi_cd01_show() - Dump capdata01
>>+ * @s: Pointer to seq_file where the capdata01 is dumped.
>>+ * @cd01: Pointer to a capdata01 struct to be dumped.
>>+ */
>>+static void lwmi_cd01_show(struct seq_file *s, struct capdata01 *cd01)
>>+{
>>+	/* capdata01 is an extension to capdata00. */
>>+	lwmi_cd00_show(s, (struct capdata00 *)cd01);
>>+
>>+	seq_printf(s, "  step:           %u\n", cd01->step);
>>+	seq_printf(s, "  min_value:      %u\n", cd01->min_value);
>>+	seq_printf(s, "  max_value:      %u\n", cd01->max_value);
>>+}
>>+
>>+/**
>>+ * lwmi_cd_fan_show() - Dump capdata_fan
>>+ * @s: Pointer to seq_file where the capdata_fan is dumped.
>>+ * @cd_fan: Pointer to a capdata_fan struct to be dumped.
>>+ */
>>+static void lwmi_cd_fan_show(struct seq_file *s, struct capdata_fan *cd_=
fan)
>>+{
>>+	seq_printf(s, "  id:             %u\n", cd_fan->id);
>>+	seq_printf(s, "  min_rpm:        %u\n", cd_fan->min_rpm);
>>+	seq_printf(s, "  max_rpm:        %u\n", cd_fan->max_rpm);
>>+}
>>+
>>+/**
>>+ * lwmi_cd_debugfs_show() - Dump capability data to debugfs
>>+ * @s: Pointer to seq_file where the capability data is dumped.
>>+ * @data: unused.
>>+ *
>>+ * Return: 0
>>+ */
>>+static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
>>+{
>>+	struct lwmi_cd_priv *priv =3D s->private;
>>+	u8 idx;
>>+
>>+	guard(mutex)(&priv->list->list_mutex);
>>+
>>+	/* lwmi_cd_alloc() ensured priv->list->type must be a valid type. */
>>+	for (idx =3D 0; idx < priv->list->count; idx++) {
>>+		seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type].name, idx);
>>+
>>+		if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_00)
>>+			lwmi_cd00_show(s, &priv->list->cd00[idx]);
>>+		else if (priv->list->type =3D=3D LENOVO_CAPABILITY_DATA_01)
>>+			lwmi_cd01_show(s, &priv->list->cd01[idx]);
>>+		else if (priv->list->type =3D=3D LENOVO_FAN_TEST_DATA)
>>+			lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
>>+	}
>>+
>>+	return 0;
>>+}
>>+DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
>>+
>>+/**
>>+ * lwmi_cd_debugfs_add() - Create debugfs directory and files for a devi=
ce
>>+ * @priv: lenovo-wmi-capdata driver data.
>>+ */
>>+static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
>>+{
>>+	priv->debugfs_dir =3D lwmi_debugfs_create_dir(priv->wdev);
>>+
>>+	debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lwmi_cd_=
debugfs_fops);
>>+}
>>+
>>+/**
>>+ * lwmi_cd_debugfs_remove() - Remove debugfs directory for a device
>>+ * @priv: lenovo-wmi-capdata driver data.
>>+ */
>>+static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
>>+{
>>+	debugfs_remove_recursive(priv->debugfs_dir);
>>+	priv->debugfs_dir =3D NULL;
>>+}
>>+
>>+/* =3D=3D=3D=3D=3D=3D=3D=3D WMI interface =3D=3D=3D=3D=3D=3D=3D=3D */
>>+
>> /**
>>  * lwmi_cd_cache() - Cache all WMI data block information
>>  * @priv: lenovo-wmi-capdata driver data.
>>@@ -773,6 +889,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, con=
st void *context)
>> 		dev_err(&wdev->dev, "failed to register %s: %d\n",
>> 			info->name, ret);
>> 	} else {
>>+		lwmi_cd_debugfs_add(priv);
>>+
>> 		dev_dbg(&wdev->dev, "registered %s with %u items\n",
>> 			info->name, priv->list->count);
>> 	}
>>@@ -783,6 +901,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>> {
>> 	struct lwmi_cd_priv *priv =3D dev_get_drvdata(&wdev->dev);
>>=20
>>+	lwmi_cd_debugfs_remove(priv);
>>+
>> 	switch (priv->list->type) {
>> 	case LENOVO_CAPABILITY_DATA_00:
>> 		lwmi_cd_sub_master_del(priv);
>>@@ -822,6 +942,7 @@ static struct wmi_driver lwmi_cd_driver =3D {
>>=20
>> module_wmi_driver(lwmi_cd_driver);
>>=20
>>+MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>> MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
>> MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>> MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
>>diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
>>index 8c1df3efcc553..034a6e48be071 100644
>>--- a/drivers/platform/x86/lenovo/wmi-capdata.h
>>+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
>>@@ -30,9 +30,7 @@ struct capdata00 {
>> };
>>=20
>> struct capdata01 {
>>-	u32 id;
>>-	u32 supported;
>>-	u32 default_value;
>>+	struct capdata00;
>
> Doesn't this also require some significant changes to the usage in wmi-ot=
her and in the query function? We're accessing these members directly.

Hi Derek,

Recently, the kernel added support for -fms-extensions, which allows
anonymous struct members. These can be accessed directly, as if the
struct was defined in-place, so it doesn't break direct accesses.

--=20
Thanks,
 ~ Kurt
