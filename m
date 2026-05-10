Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BD82C08BB
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387155; cv=none; b=ZiA4wZ5U8LERiT+HgzRGosHtLr1pfi4U87jaq95c4XoE7LAiqUJVjMxLSB6mNdx/t2xEq1N5RwoluSe6VMDNipImevLMAWo3myHjwaEqnRVp10ggoOhTHpStbveGhhqc4wqn+vXUsnljdOnub6QpjihXF1AMi/p+TFSHsaJR9uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387155; c=relaxed/simple;
	bh=pA4TfuBRYBkm06/i9YIAhD/h0U3iNM8NSUZPBNTS74Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WhQOncv4meq3PV3mhq1sJ0Z0JV5m4JP3tsEH98lPM3bgsSXa7yJlR1KrGrvujFNvcDyAEXf76r6AgEy6Vn6Z8q0e6qaomQdisBJxtQQtsDxYb9JYy2nlrdHAQI/zwYyZMW4fAR7LY4WH6mkg47l+R+n7dbAeNf59bRO9qaoBw0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRL3dz6m; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRL3dz6m"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so8709109eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387153; x=1778991953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=td5pnPiFY8lI+NT0TWL0GRlUXHfAOrA1KjpGkurMjvM=;
        b=SRL3dz6mAKhpM97wNPLkGPM6pUFDZdj9+KJBMluwUO6wY9uEdKmQ41xx08h9zxVyda
         gc7dldKgXzC1D3bQydDsxUaQg5aXhFeyFDQVeUbU0pqUIjHcxxaCzjHh5UFtHWouz68Z
         mn5kg/9rZdsj5LNYReXbDXYV9BjTSkLZiXwGuXgqTjddQK0p8DxH7XTcOu4lGCMuz4py
         uCcKs1hNzxWkUmDDfXjZrcLoG9wz8d8bieJPI10/2z2N5OrB7itUpR9fgpeQs/MoLDwv
         T/xmDY43idmGu7lQA4gGzbZoZ6s+q/DrRKyzsOprUvgG3JavCxTRUT89a1atpNaOx5Cc
         uavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387153; x=1778991953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=td5pnPiFY8lI+NT0TWL0GRlUXHfAOrA1KjpGkurMjvM=;
        b=ncWdCclr08Uc9z46LrIHzsNpNKb7xoMmjKF2NHIZPha/tBhfYjK5xqo8wA2eD/MY1H
         RXVJXMgPq4FLdlcY90GU2TrLbh3HwpPiX8hlP0LEmm6kOYBpLzwCOtDr7ZABBSD3DLhs
         JkCFeyKDizlpTpmhvXfJPBAAHaGL5P4F1o/J/U7PF53w5+e073r9SqQgOIlUm24fy3QG
         1O+GsZVCgpajxIPCRNpkQeNcMDh0W4bmRj38gitf/Ax7QkqLS/w9qT+Q6fd2Xd+sm6zh
         WZThpVsr7VH13PO7a9U3SHtbZ0wkmFmscoehXi8O7WF+lWTHsDZjwcteTtcOcHaRUkA3
         mLkw==
X-Forwarded-Encrypted: i=1; AFNElJ8G4s+BqVHOKyoNsLdkwJoLhNs/v5DOS4klXEgzZ5+l1H/HpGl+I6M62p50BAF9cOfIQUUTcpWLE/DXKN9A3D99VfnD@vger.kernel.org
X-Gm-Message-State: AOJu0YzIjPqceCKzb6SvT5a3AwJC6ckm4kWz4ZG70JySmjNvV5an7PcJ
	boGJrTxKn04D64PWYTFUn93jWvQAKXy/uIW2rMa2DqSLu5vWW9t/yvsA
X-Gm-Gg: Acq92OG11oMt6VuH+Wd5hgx7wHZFrIQnP1nFfiD7EeYIlyd1lmDs2afkVjWcIXtGLaE
	AogTUfp5hPVKcesYXYNuli2GW0AVctiGbhYIppbShmg1h05FWw714TPyFwGdUsfrei69TrlPpi7
	3q4s+T0hyPwReBecPHuHctf5xq5z3PzwnhS8k1FhAneGJ5OdaGWquEDBHWqK9BcgFBEeJu5BQ8w
	LwOCExkd84IfiKj7pU+oPH5o1hsxAcwdhq2XeSEmpdR6FyaYWam7qA9PNpS+D752PdXd2MnfH9w
	7baTKoeZ/Y7CzvK+1KvuH3bhnm6Ii/+KddAFumNq9NaILjOmVcEWSY66nyFTODs9Yto5EhfhPi2
	ScVfLdSzcJcz427e1u4srEp82Z9kHHA+X/bdl0WB8/v+gbAdJNxqyr0z7493r7yFPQQF2UjTzCx
	BtUWOG4KrPOYJCCNzpMCEgqUUA9GhGfJIhklLLY7oso1Oe/4KABk7oRVOC99l0ZkfjYHYMKrb/W
	5jd4qS8do97zoE=
X-Received: by 2002:a05:7300:df4b:b0:2be:142f:d499 with SMTP id 5a478bee46e88-2f54c971297mr8865848eec.16.1778387152746;
        Sat, 09 May 2026 21:25:52 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:52 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v12 04/16] platform/x86: lenovo-wmi-other: Zero initialize WMI arguments
Date: Sun, 10 May 2026 04:25:34 +0000
Message-ID: <20260510042546.436874-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds explicit initialization of wmi_method_args_32 declarations with
zero values to prevent uninitialized data from being sent to the device
BIOS when passed.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: 22024ac5366f ("platform/x86: Add Lenovo Gamezone WMI Driver")
Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Reported-by: Rong Zhang <i@rong.moe>
Closes: https://lore.kernel.org/platform-driver-x86/95c7e7b539dd0af41189c754fcd35cec5b6fe182.camel@rong.moe/
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
  Fix formatting of commit message.
v7:
  - Include lwmi_gz_profile_set() fix as well.
---
 drivers/platform/x86/lenovo/wmi-gamezone.c | 2 +-
 drivers/platform/x86/lenovo/wmi-other.c    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 381836d29a96..ca559e6c031d 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -203,7 +203,7 @@ static int lwmi_gz_profile_set(struct device *dev,
 			       enum platform_profile_option profile)
 {
 	struct lwmi_gz_priv *priv = dev_get_drvdata(dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	int ret;
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index a6be3463341c..1e06b894cfcc 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -166,7 +166,7 @@ MODULE_PARM_DESC(relax_fan_constraint,
  */
 static int lwmi_om_fan_get_set(struct lwmi_om_priv *priv, int channel, u32 *val, bool set)
 {
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	u32 method_id, retval;
 	int err;
 
@@ -773,7 +773,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 					struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	struct capdata01 capdata;
 	enum thermal_mode mode;
 	u32 attribute_id;
@@ -836,7 +836,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 				       struct tunable_attr_01 *tunable_attr)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
-	struct wmi_method_args_32 args;
+	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
 	u32 attribute_id;
 	int retval;
-- 
2.53.0

