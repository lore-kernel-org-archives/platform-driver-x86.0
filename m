Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D450153D9E3;
	Tue, 13 Oct 2026 19:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919727; cv=pass; b=AfwmIugTlcsEjpI0G3/A2d4c2ztx34VHKYM2OL/1t9+ywccQyxHDG4nFuJapZ0K6Uejqo4CwuP1e+o0doebYWHq9QYDIm9K+xvUdS4ljdKKvglOj4Y3opWesAsVVTvFW1as8b5mwtvqtoI3vAVRp6fp+z70PV5ZSpVUGJS9qFe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919727; c=relaxed/simple;
	bh=p8itfBwQQrpNtZMXufhAA2/3Td1V+kLJrMDgB/Lvfao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CiIlwoDgugX6129c+j9WyDIlEAT8IMb5PZ+pTxIF9J9MX2tFSOIbFKRZBpvfnraBJ1wF2q+IkejDtwqveSrlXFEXeG8C+8XLCQW6ua/UY2AlftjlkLB91m7qIBrqpuAJXRTCWS1gMSyjHVfEs8Bnvi6SyEN59DAX93R5HQNYpTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=O2hCtFgo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="O2hCtFgo"
ARC-Seal: i=1; a=rsa-sha256; t=1791919630; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kzOWDmeLKJHq7hoxIpqhQgrN5lZIBmXERBYL/WqSmwiJrBk96qbyEPFjghRPOWTtT/Wkr2FcmHaMeSEqA+VZ6KJ4OsA5oEfx3eswRxDwz5Di4Y9Vys0J2YZ9CdcBIi9jMV0ASZaATI2iheG/VsltbK4w//DWuYl33uI7FlOwm/M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919630; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E9TyccREoFHGrLehmnX0JYXkP4kY0q7P0mosXdR41L0=; 
	b=KzaBiIWu+iXzxBe7Sh7NjfXt2qD2edelIx7Zsm4eWSJRfIxnBisIgnXjygZxOcD6lpY01+FB9iRXJZ47E+n7YpocJEHjTAKTJUXDrVebCWArVz9bStLnde6/tDpNFozFqXcrK+5yJz+F2dax6kRTSebEJeuiHvdf2LRKA3RKWZs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919630;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=E9TyccREoFHGrLehmnX0JYXkP4kY0q7P0mosXdR41L0=;
	b=O2hCtFgoXcVteZHW9HmvUA63fYJ9qN+q5Q63jg3YNhIoTtFj4GihDAZW/H5H2zkL
	4xTgLdS3WzggGzcJv2H3qZjtAYVmt5o4xSAOeNYRJC1Q3jIecJTs5rRHPg1B56zymZl
	zIgs5DC6XR7wdntaULF3bhfzXVv4nWOR0UfOq8yKSqDkWyTsj/Nf5mrAXwTg6EqLN5S
	eLGVrZ5BZ6p/XluYM6sFaiKfQ2kFNGI6UI/4ryFkELwS/E5QzaP/XQHZuoYDXllgeyI
	WGKeI3+OGBQsiYiVkxZ9J9D9wsBamcbu+hwvs88VxHfWeHvhbPxBCYJj0iAWYzjj0Ng
	nVDbIhmXHA==
Received: by smtp.zohomail.com with SMTPS id 1791919627138884.0484964145857;
	Tue, 13 Oct 2026 12:27:07 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:53 +0800
Subject: [PATCH v3 10/12] platform/x86: lenovo-wmi-capdata: Do not match
 missing components
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-10-e1032bed1c81@rong.moe>
References: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
In-Reply-To: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-73bef
X-ZohoMailClient: External

Some devices do not support LENOVO_CAPABILITY_DATA_01. They either do
not have the corresponding WMI GUID, or do not implement the query
method.

In both cases, the WMI core does not create the corresponding WMI
device, leaving the component master (i.e., lenovo-wmi-other) waits for
the missing component forever.

Identify missing components using the new wmidev_exists() interface, and
skip adding them to the match list, so that all components in the list
must present, fulfilling the binding requirement.

Reported-by: Navon John Lukose <navonjohnlukose@gmail.com>
Closes: https://msgid.link/20260928190901.1369497-1-navonjohnlukose@gmail.com
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Link: https://msgid.link/9789f452-d7eb-4f1e-8a13-7335332193a7@app.fastmail.com
Tested-by: Navon John Lukose <navonjohnlukose@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- New patch in the series to solve the report made by Navon
---
 drivers/platform/x86/lenovo/wmi-capdata.c | 36 +++++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 39fc7a52cdfe..c55b65e8750c 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -49,6 +49,7 @@
 #include <linux/stddef.h>
 #include <linux/string.h>
 #include <linux/types.h>
+#include <linux/uuid.h>
 #include <linux/wmi.h>
 
 #include <asm/barrier.h>
@@ -75,14 +76,19 @@ enum lwmi_cd_type {
 	CD_TYPE_NONE = -1,
 };
 
-#define LWMI_CD_TABLE_ITEM(_type)		\
-	[_type] = {				\
-		.name = #_type,			\
-		.type = _type,			\
+static const struct wmi_device_id lwmi_cd_id_table[];
+
+/* Save some .rodata space by reusing the GUID strings from the id table. */
+#define LWMI_CD_TABLE_ITEM(_type)					\
+	[_type] = {							\
+		.name = #_type,						\
+		.guid_string = lwmi_cd_id_table[_type].guid_string,	\
+		.type = _type,						\
 	}
 
 static const struct lwmi_cd_info {
 	const char *name;
+	const char *guid_string;
 	enum lwmi_cd_type type;
 } lwmi_cd_table[] = {
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
@@ -153,24 +159,46 @@ static int lwmi_cd_match(struct device *dev, void *type)
  *
  * Adds all component matches to the list stored in @matchptr for the @master
  * device. @matchptr must be initialized to NULL.
+ *
+ * Missing components are not added to the match list, or else the master waits
+ * for them forever. For some components, their existence can be determined by
+ * querying other components, so they are handled as sub-components and thus not
+ * matched here. For components with no existence declaration, wmidev_exists()
+ * is used to determine their existence.
+ *
+ * If all components are missing, ERR_PTR(-ENXIO) is returned through @matchptr.
  */
 void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr)
 {
+	bool matched = false;
 	int i;
 
 	if (WARN_ON(*matchptr))
 		return;
 
 	for (i = 0; i < ARRAY_SIZE(lwmi_cd_table); i++) {
+		guid_t guid;
+
 		/* Skip sub-components. */
 		if (lwmi_cd_table[i].type == LENOVO_FAN_TEST_DATA)
 			continue;
 
+		if (WARN_ON(guid_parse(lwmi_cd_table[i].guid_string, &guid)))
+			return;
+
+		if (!wmidev_exists(&guid))
+			continue;
+
 		component_match_add(master, matchptr, lwmi_cd_match,
 				    (void *)&lwmi_cd_table[i].type);
 		if (IS_ERR(*matchptr))
 			return;
+
+		matched = true;
 	}
+
+	if (!matched)
+		*matchptr = ERR_PTR(-ENXIO);
 }
 EXPORT_SYMBOL_NS_GPL(lwmi_cd_match_add_all, "LENOVO_WMI_CAPDATA");
 

-- 
2.55.0

