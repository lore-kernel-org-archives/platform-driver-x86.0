Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795646020;
	b=UhW+6L/LlTdqeUd+0PrFUbU14y/F7rQyTJDfW8NOVBf+gZGywLmhLh2Kyq2hNLy22JCQ
	 j83lU/nAtmJx4jID2tc+AoicsUBbFbrUIAtiWFTqEAFKNIfaei1M97wQcchm/9UuOsYpC
	 /ur+zpxHC7eJ24/nQIBT7y1jaM0/q+FyCUwdxgoIY7Sma5Hhw5ascguVGpJJGwNM4gD1o
	 mn32qN1d4D/DKPWfraJyEMePJv5eKpgV3Aj2CS4FNU/vao9zVC2iujoMxso4lLuaJfBWi
	 XrfxKrZ6DlGMd4R6Cq+7bDA0HhcnELpOLLQwGQRsy87u8MWfXCQDCtZq84WH6Ypf+LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795646020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OMJjrlQAA5OxnqC8ZYE1EnS7m2y+hQ1Luhj6opN30CI=;
	b=IcmZI1PP+zi/Iwc+v0JLwD8Xiq+V4HYLLlI1mdvAhmnPsNGxBB8AU2A30ZHn3zR16Iap
	 QmPsJ0PPuy8K+axFKFBSw7jXFc3bppD4m+JGFrxBQCa1cl2N/MQ/fXKp7BXWfepJIZS15
	 GpzRzC+epzhi6HG4MYaYsblBp+UP8g7rJb+CXZeuqSjwZtigpjAXlHSqS9wF9XgznDHZI
	 yI+ut/MDogHw6YxyFijiHjC9aTlMLB4pOI8mysV29wl3jzzdrLR3lplISs7x3wB9YvJNZ
	 Surs5OksVIgoXEtHCXR0A0kWlFoTn1L+dEnNMZe8vIAitEtQiC8GmTxm7qx5cQR9h8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvbIU76Y;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8504C606A323
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 22:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8504C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uvbIU76Y
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so3713731f8f.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 14:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795646019; x=1796250819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMJjrlQAA5OxnqC8ZYE1EnS7m2y+hQ1Luhj6opN30CI=;
        b=uvbIU76YmRbB2UhE9D1LZZBa/l8dRxut0yxVt2071vvI5AcMIHK/ZU250BdANmVxLJ
         CBCbLMNkNzt6e2LoHOrS+0tu55XSGDiR8UjH2oeGnAjp+tAiHGEmcWQhaPo+zMo2huEW
         DAzkB4sCvP0yDkbimY4BbPA+G6WTRvK/ADHhmW/55NIjJU6ZpaSWnVI35VkrlXAE8wqg
         BSHUd7LdZZ3hCsQgxgdwhH59P0ZaDbkdZwhCOwy2J3LdmxCEFbPGXwyvb8brtoNMvJU8
         7cztvg+WU5t6V8dZk76tuDfjverFh6VRX1dQHsA5Kaux0aGngxwB1697P0KsmC7tRv1q
         2SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795646019; x=1796250819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OMJjrlQAA5OxnqC8ZYE1EnS7m2y+hQ1Luhj6opN30CI=;
        b=XXgpnjVO9JsBgqN33QF+PqVcCQ5DKOewmow71kRWHZxqcH1zfBhcS8v4+dWXDa4DOc
         h1cj0MbEH/KYrjiFgwp6S8mlgO70Ap/ORKMl1BjkjuLi9zzNnPMywvr6s9eGaALPvmLs
         O44Uwu/FVBxY9B9jWi/2b3C65onuK37Ku8sR4Qir8tAveK3cJ4RDhzhnUcS20DX3sdrR
         Q+VncEnFcr7eBue39JmnOf/065MkmsDZ+yuBOh7ap/hKHDekdNkskjoSFyaDvrgidt4+
         RpISvjMj5g+wmKgFe4Ou8LRCaoRJGB/IR3EViubyxucRrEA7wpiF2NQpGWAR5bhi0Djm
         7ETg==
X-Gm-Message-State: APuU4Z+ZFhX+aX8uHUAzQRjUhwOsvOIsD5lKX++wYihUG7/FU5LTHkQQ
	yoyuj59r0lI+a5Ki86nI9qxHenRByZGYCcu4l+2XZ+QnOk9kmnfMHDT3xDRXSKmRIWhRkw==
X-Gm-Gg: AZFdTZczos1pght4TUgmD54v6aCc2rv/TCQ21RsAoSA1eOTPUZefBzyhgBudu+6neHz
	v/FfLdrdbvqfJF9P/ooHunnzu0mx9KMiCAFWqYDtpnreS1pz3kwRyblmoqnhglvtJz3EvQczRgG
	9X/O0e8+kGF0vX47cV7sRqxTSHkihSYkzllJjbNIvrtgKjayUO/drW1BGWSnYOKR5iCn9m69ir8
	3bw6z7eDfZ50wSRBCDS1bpDNAXr1rQbna4rJk48Lqu8bxAIkHAo2arbymtHKyhCglu78OirRsT+
	JNkhiT4On+w3pXsqoUwBHUkb3uOx1K/F3RNTs3jYjP4tadcSO8V71Yu63yxp98N4a3eRM8ZwCGB
	ZWqM8o/Mz5cs4Dt16FSdiw53XvmjplcnGcI5nzMOfo02b8tU7mKcxYXJLMeDCZ0v68+h+QutUIw
	1Jr/u8zsO7BfwMyFW/g0qrPUyGJIAg6MidehwiWOzqnZhGvVq9iwli6sv/ymEajZ4lkPrbV9k9Z
	ElNuAiM7qBcWUXdI3QGDWI9rs/tOfxShqqiz/EzDXnjB9ptjhzWOseQw1TCDDCFwMOWiC92vW0o
	fGXxaafJ/cHxoP62O0op4SVA+xA=
X-Received: by 2002:a05:600c:1d0a:b0:4a2:59:f568 with SMTP id 5b1f17b1804b1-4bb8880ef6amr415788395e9.14.1795646018700;
        Wed, 25 Nov 2026 14:33:38 -0800 (PST)
Received: from archlinux ([135.136.39.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm503423905e9.2.2026.11.25.14.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:33:38 -0800 (PST)
From: Martiya Aryan Mehr <martiya.ar@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Subject: [PATCH v2 1/1] platform/x86: bitland-mifs-wmi: add profile support for Xiaomi TM2309
Date: Thu, 26 Nov 2026 02:03:22 +0330
Message-ID: <20261125223322.3720-1-martiya.ar@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <6610f046-b98d-06ad-2fd9-183ce33ad88f@linux.intel.com>
References: <6610f046-b98d-06ad-2fd9-183ce33ad88f@linux.intel.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Martiya Aryan Mehr <Martiya.ar@gmail.com>

Add platform profile support for Xiaomi Redmi Book Pro 16 2024
(TM2309), using firmware QFAN values 2, 1, 3 and 4 for low-power,
balanced, performance and max-power, respectively.

The firmware can report QFAN 0 as a stale balanced state after
resume. Map it to balanced for readback, but mark it non-settable
so selecting balanced writes QFAN 1.

Add a battery-specific performance entry and skip the AC-type
check, which is not implemented by this model's firmware.

Link: https://lore.kernel.org/all/20260930015058.3076905-1-uselessfire@gmail.com/
Signed-off-by: Martiya Aryan Mehr <Martiya.ar@gmail.com>
---

Changes in v2:
- Move TM2309 profile definitions before TM2424.
- Move the TM2309 DMI entry before TM2424.

ChatGPT (GPT-6) assisted with analyzing the existing profile-entry
implementation, interpreting firmware observations, proposing the
TM2309 profile table and DMI match, and drafting the changelog.
The submitter reviewed the changes and tested the profile behavior
on the device using the local development driver.

Both patched and unmodified driver objects were built against
linux-next-20261120 without compiler warnings. The exact standalone
patch was not independently loaded as a module; full modpost and
runtime testing of that isolated patch were not performed.

 drivers/platform/x86/bitland-mifs-wmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index f71c93a..e0f7911 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -139,6 +139,22 @@ static const struct bitland_mifs_quirks tm2135_quirks = {
 	.skip_ac_type_check = true,
 };
 
+/* Xiaomi Redmi Book Pro 16 2024 (TM2309) */
+static const struct bitland_profile_entry tm2309_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER, 2 },
+	{ PLATFORM_PROFILE_BALANCED, 0, .no_set = true },
+	{ PLATFORM_PROFILE_BALANCED, 1 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 3 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 3, .battery = true },
+	{ PLATFORM_PROFILE_MAX_POWER, 4 },
+};
+
+static const struct bitland_mifs_quirks tm2309_quirks = {
+	.profile_entries = tm2309_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2309_profile_entries),
+	.skip_ac_type_check = true,
+};
+
 static const struct bitland_profile_entry tm2424_profile_entries[] = {
 	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
 	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
@@ -169,6 +185,13 @@ static const struct dmi_system_id bitland_mifs_dmi_table[] = {
 		},
 		.driver_data = (void *)&tm2135_quirks,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2309"),
+		},
+		.driver_data = (void *)&tm2309_quirks,
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
-- 
2.56.1

