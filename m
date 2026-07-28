Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1E93921D8;
	Tue, 28 Jul 2026 17:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261234; cv=none; b=Zbn7reZWDa7pFV6IQDp5r20C728w3EAgmtDe2ctb0ONxHRJHyIItJy1V1YHkJ/TPa4IeVmO/GYfCR6DCIl930OH6hMDLMJaNMKoQw1fMxieOS1PzDEoauI33WuZPuv/07fgPK52qY/7tlsbdsOla+l++LnhEFmcJQr2xo/Ut4R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261234; c=relaxed/simple;
	bh=h0bUOrXiKGdJGnAxa6lQ2zpOD67aTGAm2JnIbUhiRK8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Afccrh1bfsJB71J4oAf7grbRfEBhHFLiSVTjYsHyyZoWK+FCx0vvV0nGy/1CSFJiBTwszCerd6gIdIb+l2iDIUQ8nCSV9AN6k+TzC7ZgxuUsPv/OxSeWJY3lZ2STjRFypnGMo/skeNyzVmsNMxu65+iUQZoxd52t9jsUi6IW/qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=bDCHehNp; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="bDCHehNp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1785261226;
	bh=aCRwCM1akQmUB/mXOuJKEbkZhGgT9OY/Rnvwj4FaNTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bDCHehNpSA0FasBtJ2ygf02xa4cAtbKDTsu+c36lApsK3FkEcHSFCJ5s+IbbeCzeA
	 hOyPagk7SUOrW20uVrDcyPBUruG1SKSZ6QncL5ae+CGokXtmMuO7fpmacIQ3rxjZo/
	 /0jAdVlEl8r/aOIUl+C2a6btUeRy4T2yuo6KtvT8=
Received: from max-laptop-cachy ([240e:3a1:20e0:1ea0:2fa7:34d4:60dc:c367])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id D6A85AE0; Wed, 29 Jul 2026 01:53:42 +0800
X-QQ-mid: xmsmtpt1785261224tkp4q4awn
Message-ID: <tencent_D045C063B22D28D805B9FEFDB882D5C67C07@qq.com>
X-QQ-XMAILINFO: NmhoXJR/eu5x6/kuszAdB8SjId/j9CYCeJundjoQp9NFx5cNdqXCvpFUvQtpRh
	 pzgfAEscY4wSJCMWqORGn/PKxJtSh3QvPCf1R974PS1EOEzjNKDBoNLrDoGSx8yyHTryo3sXlXoM
	 GccQrHWCIDbJXnLwW9y2Gcvirx8/UgA3X5fq5BRYIWIs0mcjvMCEpkjHvIcAdMnAgGPa+nYIW+7B
	 Q+xSdpk86533FYnbwLh5ydcqAwp5aGs1xBELuKlrl77A8zEpI6sVho7dbsmPuQ8l2V72/ECLDHwk
	 GHllu+/+1KJdZcWByTNpV8wFSebKRdpKlLCx2+KpQiHMsYqCJn/oh4kPxnv/aQLVflkWjqbZkhJg
	 Ixue+zgLbG/mZAce33maQnB1dawZvDu+VBq9xazid1KsDpVcKhLTLVtubO6eJl6e6N6OBO4XMvVI
	 FAzk4KtPsekshUPKcgEHuFgBhPytYT8ycGMwfmKTvquQx4Zd0ib/ZPWUP+aal1vYkgch9Hr4E++q
	 gX22wb/tZj4w3BfTTeYBdzfEMfgMQz86kN8CAA7rN28wsCfYdg3MHxs+Rj/CaMLzv8aXZppzh0HL
	 Q5fp1R/RFIOHFnzaYjBlL2wynZNqCXFQt0CiOWZa11RuRVp0oJvjBKxzwx38Xy0xpckfXkgJvUUc
	 g4e+LfwU8bVVt+jI6dAi1w6jfKGTx53fALZhVoQTuAhi2OIfMmV/MWG+2lAdYk6qjhDgkORPfdE7
	 UCXvUrgd1aFqBNGk8dDMOx4hEXO2D3u+/N0UAz5MuAcqx5ljk/FZsMb6c3QGRG3gC3I4e6FanV7R
	 GtWPMg8w5vcTPoHzonKiH+NpUahPymJyv4/q5/WHnXt+UylrSYt34scHaKcM2T7lDqntPodtrlCK
	 4l7FeKrt/4QPFJQVMM2kn4BH1C7zr5Hmm5ULSpGuCJMh9EMC5okAe4hVKfALl78uU2mlsrvoZgtW
	 qGY9tUNVQPlNrwrXLCVefngyT0xR72I//vBkP2WAcYSmR9eaETXRB1VqaodT2+L+Xz2iz2kXfF68
	 i8Wc1kiKMCJZ1/CITaj+XAHINRThJCbamHtW5MLTvCm+sGcBXM9Jk9Y6YuqDNRd8IZjLnFSA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: wolf109909 <wolf109909@foxmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nabil Danial <nabildanial.93@gmail.com>,
	Yuming Sun <wolf109909@foxmail.com>
Subject: [PATCH 1/5] platform/x86: bitland-mifs-wmi: validate WMAA status, never abort suspend
Date: Wed, 29 Jul 2026 01:53:37 +0800
X-OQ-MSGID: <20260728175341.45927-2-wolf109909@foxmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728175341.45927-1-wolf109909@foxmail.com>
References: <20260728175341.45927-1-wolf109909@foxmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yuming Sun <wolf109909@foxmail.com>

The WMAA firmware method signals "unknown/unsupported function" with
the status word 0xe000 in the reply. The driver never checked it, so
calls to functions a given firmware revision does not implement
silently returned zero-filled data instead of failing.

Worse, the platform_profile suspend hook propagated such errors: on
firmware whose perf-mode query returns values laptop_profile_get()
cannot map (e.g. MIFS v2 firmware reporting raw QFAN codes, seen on
Xiaomi Book Pro 14 2026 and REDMI Book Pro 14 2025), every suspend
attempt died with:

  dpm_run_callback(): bitland_mifs_wmi_suspend returns -22
  PM: Some devices failed to suspend, or early wake event detected

Return -EOPNOTSUPP when the firmware reports the error status word,
and make the suspend/resume hooks fault-tolerant: skip saving and
restoring the profile when the query fails instead of aborting the
whole system sleep.

Status word semantics verified against the laptop's SSDT WMAA method
(SGER=0x8000 on success, 0xe000 in the Default branch).

Signed-off-by: Yuming Sun <wolf109909@foxmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 31 +++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 3a373184..12426d11 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -129,6 +129,18 @@ struct bitland_mifs_output {
 	u8 data[28];
 } __packed;
 
+/*
+ * The status word of a WMAA reply is formed by the first two bytes
+ * (reserved1 | operation << 8). MIFS firmware signals "unknown or
+ * unsupported function" with 0xe000 and success with 0x8000.
+ */
+#define MIFS_STATUS_ERROR	0xe000
+
+static u16 mifs_status(const struct bitland_mifs_output *out)
+{
+	return out->reserved1 | (out->operation << 8);
+}
+
 struct bitland_mifs_event {
 	u8 event_type;
 	u8 event_id;
@@ -159,6 +171,7 @@ struct bitland_mifs_wmi_data {
 	struct device *hwmon_dev;
 	struct device *pp_dev;
 	enum platform_profile_option saved_profile;
+	bool profile_valid;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -181,6 +194,9 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	memcpy(output, out_buf.data, sizeof(*output));
 	kfree(out_buf.data);
 
+	if (mifs_status(output) == MIFS_STATUS_ERROR)
+		return -EOPNOTSUPP;
+
 	return 0;
 }
 
@@ -298,17 +314,21 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	enum platform_profile_option profile;
-	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
-	ret = laptop_profile_get(data->pp_dev, &profile);
-	if (ret == 0)
+	/*
+	 * Never abort suspend: some firmware revisions answer the perf-mode
+	 * query with values this driver cannot map, or fail the call
+	 * entirely while the system is going down.
+	 */
+	data->profile_valid = laptop_profile_get(data->pp_dev, &profile) == 0;
+	if (data->profile_valid)
 		data->saved_profile = profile;
 
-	return ret;
+	return 0;
 }
 
 static int bitland_mifs_wmi_resume(struct device *dev)
@@ -319,6 +339,9 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	if (!data->pp_dev)
 		return 0;
 
+	if (!data->profile_valid)
+		return 0;
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
 	return laptop_profile_set(dev, data->saved_profile);
 }
-- 
2.55.0

