Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483D57E9
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 10:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465990; cv=none; b=F9WbJmTpEshXIx6jpnrykX2soAsKxXOhEXzgdv1YwQlkgqHo9AI/fBkumlyXiqzkR70merq3yTVzKOrFE1O2ebkg//1BvSxCJo/CZbIWrIy+KgE/2ELcoGOiW9+AvxysmaAPbnRk7GUhKzj7xJ/xWLf7g98sqWzPDpIB0elJclg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465990; c=relaxed/simple;
	bh=DI4t7vpioQF/iUOvsC4FLIfkadopIPWDrR7pQnrGtKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tuyYNYae2IC5t2O35CC23pTWml50ErNnd0YK9JIYsBZ4spnSygCY6OSmHtEDHuGd2Jq8XuuhOynQ2JGUSopG73EsOoJuNag+kt0hjPiE1xsvhQUWvAupQhS0cpmyEgVpmbumVFSMG6ZfVZenXqWpRMYDoInfxWX09KcrtxiHsNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qUb/U1J2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qUb/U1J2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EEDFC4CEED;
	Mon,  9 Jun 2025 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749465990;
	bh=DI4t7vpioQF/iUOvsC4FLIfkadopIPWDrR7pQnrGtKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qUb/U1J29NkDxgojfqX1+i9fej9xwww4SPkBLzfZhXV96bTV6mwoa0EI9mVEOdzrq
	 FMlTlsum4cuqL9dXSmyO9T8oIBAPRdTPbWcT8raEQruZq+9q+jf7cdO9ktAlTb6E+s
	 4VynOpAxmLHIY7804YvDXk6Mw8T3+o7B/ihMlPGsryOzk0ugcq0a55Rc+5pKTQxDTk
	 VCqZ8yT8Y1vAzt3dyAXuYlvNo1l3vOYo/9cyhI4ib46m+LNNq7a5fq5mVB6ChkSzhf
	 Wc1YDZwL7q1oWjlE1wVgbMMOHdxyjDneQky632Bcp9cbypo355u/B9B7DNsTavjKNP
	 8E8AFoLzlRQbw==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/2] platform/x86: x86-android-tablets: Add ovc-capacity-table info
Date: Mon,  9 Jun 2025 12:46:20 +0200
Message-ID: <20250609104620.25896-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609104620.25896-1-hansg@kernel.org>
References: <20250609104620.25896-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ovc-capacity-table info to the generic battery nodes.

The values come from the ug3105 driver which currently hardcodes these
values. The ug3105 driver will be modified to stop hardcoding this and
instead get the values from device-properties.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Changes in v2:
- Remove final comma at the end of the table initialization
---
 .../x86/x86-android-tablets/shared-psy-info.c | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
index 55da57477153..fe34cedb6257 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
@@ -39,6 +39,58 @@ const struct software_node fg_bq25890_supply_node = {
 	.properties = fg_bq25890_supply_props,
 };
 
+static const u32 generic_lipo_battery_ovc_cap_celcius[] = { 25 };
+
+static const u32 generic_lipo_4v2_battery_ovc_cap_table0[] = {
+	4200000, 100,
+	4150000, 95,
+	4110000, 90,
+	4075000, 85,
+	4020000, 80,
+	3982500, 75,
+	3945000, 70,
+	3907500, 65,
+	3870000, 60,
+	3853333, 55,
+	3836667, 50,
+	3820000, 45,
+	3803333, 40,
+	3786667, 35,
+	3770000, 30,
+	3750000, 25,
+	3730000, 20,
+	3710000, 15,
+	3690000, 10,
+	3610000, 5,
+	3350000, 0
+};
+
+static const u32 generic_lipo_hv_4v35_battery_ovc_cap_table0[] = {
+	4300000, 100,
+	4250000, 96,
+	4200000, 91,
+	4150000, 86,
+	4110000, 82,
+	4075000, 77,
+	4020000, 73,
+	3982500, 68,
+	3945000, 64,
+	3907500, 59,
+	3870000, 55,
+	3853333, 50,
+	3836667, 45,
+	3820000, 41,
+	3803333, 36,
+	3786667, 32,
+	3770000, 27,
+	3750000, 23,
+	3730000, 18,
+	3710000, 14,
+	3690000, 9,
+	3610000, 5,
+	3350000, 0
+};
+
 /* Standard LiPo (max 4.2V) settings used by most devs with a LiPo battery */
 static const struct property_entry generic_lipo_4v2_battery_props[] = {
 	PROPERTY_ENTRY_STRING("compatible", "simple-battery"),
@@ -48,6 +100,10 @@ static const struct property_entry generic_lipo_4v2_battery_props[] = {
 	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 2048000),
 	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4208000),
 	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
+	PROPERTY_ENTRY_U32_ARRAY("ocv-capacity-celsius",
+				 generic_lipo_battery_ovc_cap_celcius),
+	PROPERTY_ENTRY_U32_ARRAY("ocv-capacity-table-0",
+				 generic_lipo_4v2_battery_ovc_cap_table0),
 	{ }
 };
 
@@ -64,6 +120,10 @@ static const struct property_entry generic_lipo_hv_4v35_battery_props[] = {
 	PROPERTY_ENTRY_U32("constant-charge-current-max-microamp", 1856000),
 	PROPERTY_ENTRY_U32("constant-charge-voltage-max-microvolt", 4352000),
 	PROPERTY_ENTRY_U32("factory-internal-resistance-micro-ohms", 150000),
+	PROPERTY_ENTRY_U32_ARRAY("ocv-capacity-celsius",
+				 generic_lipo_battery_ovc_cap_celcius),
+	PROPERTY_ENTRY_U32_ARRAY("ocv-capacity-table-0",
+				 generic_lipo_hv_4v35_battery_ovc_cap_table0),
 	{ }
 };
 
-- 
2.49.0

