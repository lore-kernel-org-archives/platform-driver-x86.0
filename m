Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646CC8287E
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 23:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782861010; cv=none; b=B6cSxWVBc4/F7nH2ZZ3zEFm4I9xI+GHu4fBua8Wg/nBX/fZWzv96c3mr8WGqVZnOD6drvhsYXJegnlj1CFvkbp2gIyNrP5YBMRBi4nHBo1WFqdp992Q3GtfPsLY1MLAyMQrtSsuVQhaYGFeONtXvu9s4G7ffwnOH795pMngLwpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782861010; c=relaxed/simple;
	bh=3MU/0iHs3pZwgTlUh1T/Py+33g2KZrtA8+QLMMqrgds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zng6zh0ngHYWovO37sN2z1Wp3dj/yEKbeQpMc2P/ssetnYJAlJJXjhewuBOkQQYYVB44UsL06qafi3LWuuf9o2nyoKaf80p2vsmdWJu8QORZBGNWvw+Db+m65+fu6YWU/Br3VfXAwq+VltNkHTZPYESLS94klQMrxfD6FA+EK3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kgVLNKCz; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kgVLNKCz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782861005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AGLZ0TdVGvK9pd7kgB+UIqwG+s9EtANagWkdkyXya3I=;
	b=kgVLNKCzL8566ikThEMicD9haMCtuuB1+PZc8F1QMRtY2JTgP2Y/hfe2nvM3E4NGLR6WgV
	Gq4fvK17tdvLToWxkv7MyGJjrq3nAUj8biK85nHt9J5Uy30Otl83tgalwN3EQsaFI52YhS
	A8JTvnooW50A9iXT56iHBLxbM9RCGII=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Travers Biddle" <traversbiddle@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH] platform/x86: asus-wmi: temporarily revert to setting a charge limit
Date: Tue, 30 Jun 2026 23:09:40 +0000
Message-ID: <20260630230940.612532-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

A userspace regression has been observed leaving the battery charging
threshold unconfigured, so while the situation is being sorted revert
the change keeping the infrastructure in place to return to the
preferred behaviour whenever possible.

Link: https://gitlab.freedesktop.org/upower/upower/-/work_items/347
Closes: https://lore.kernel.org/all/CABsFS_g+V_Owum6knLhenhM15EXJRrsF0FcLiw30WZxarsTpUA@mail.gmail.com/

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 3c9ef826551d..e835779b6f5f 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1618,6 +1618,8 @@ static DEVICE_ATTR_RW(charge_control_end_threshold);
 
 static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_battery_hook *hook)
 {
+	int ret, rv;
+
 	/* The WMI method does not provide a way to specific a battery, so we
 	 * just assume it is the first battery.
 	 * Note: On some newer ASUS laptops (Zenbook UM431DA), the primary/first
@@ -1635,12 +1637,30 @@ static int asus_wmi_battery_add(struct power_supply *battery, struct acpi_batter
 
 	/* The charge threshold is only reset when the system is power cycled,
 	 * and we can't read the current threshold, however the majority of
-	 * platforms retains it, therefore signal the threshold as unknown
-	 * until user explicitly sets it to a new value.
+	 * platforms retains it.
+	 *
+	 * Setting a negative value would signal the threshold as unknown
+	 * until user explicitly sets it to a new value, however to avoid
+	 * regressing userspace, we initialize it to a value of 100.
 	 */
-	charge_end_threshold = -1;
+	charge_end_threshold = 100;
+	ret = asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, charge_end_threshold, &rv);
+	if (ret) {
+		pr_err("Failed to reset battery charge threshold\n");
+		goto asus_wmi_battery_add_err;
+	}
+
+	if (rv != 1) {
+		pr_err("Error in battery charge threshold reset\n");
+		ret = -EIO;
+		goto asus_wmi_battery_add_err;
+	}
 
 	return 0;
+asus_wmi_battery_add_err:
+	device_remove_file(&battery->dev,
+			   &dev_attr_charge_control_end_threshold);
+	return ret;
 }
 
 static int asus_wmi_battery_remove(struct power_supply *battery, struct acpi_battery_hook *hook)
-- 
2.47.3

