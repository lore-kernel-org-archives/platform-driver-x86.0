Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA8F4F5E09
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958859; cv=none; b=Nax0LtFt7pNSQLWOkEUnlaZd2ybnCC7Fl9Fxk91yMAD5gcNl9BnZOZbhItCnk79o/vI45XtGjnyweepjVfHN/IvGfdQ0TuGbSsinpqDSHO6wacZy9wF8AGE9Og1vUXA0b3H2kGf8AqwffQpprTeG2R99Ev3Ut7W1TjV+lZ4mj8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958859; c=relaxed/simple;
	bh=VoN9LZYARNtj3K7W/qeZWGG2+FgDrivkgZiIN5ARaEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NSEoLN2mvCMebcrUzr5nUwqAyUJRAJM0bIO8eZKpzHRTavLVp/PwSCSRCQQKpegwYYY/YSpji2rAiinwUMMBWXHeZRTefrNt1vqMwNdm6ikioeAEMnXecc44ltld7IenqiBJVJ/osxie7BBhShIFg5Avt4348wobEVkC1vlc+PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiYTdiwM; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiYTdiwM"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-88826f3ff80so1057177b3a.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Oct 2026 09:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790958857; x=1791563657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7E5pOjdiR1yz0d6QZ9BdcaXjT8yEwjeuav+vuRWBi0=;
        b=eiYTdiwMVb4ztS0iN6qFKzFK4jer8xCchxdsPbGoxYWTofrhZrxaf8Odvdm6SGMRli
         y0z9tgfZrelgqxArIzOr04oyCUFX3b6PkxvIUIXUmVLVg1PxCLPAGN0FasLAOaVSCXyq
         whvwve34LwwPPG9OeYi+LWgN8tYK+QYWZE8j+st1mChH2HC9Uy/CigHz9+2mBXnjnwIK
         Huq3ic7zNW0V4Y1wanqFbvlrFHHWANvkDTO5hggPBQDiwK6KDetzYsaGxdXFiX3P1LsY
         qDemGor/pG2Lr/M05zea6J/xcac0jF5ojuuOp/G5IUNVaXJ8F8FfwppPidW7xruzJtSn
         FuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958857; x=1791563657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7E5pOjdiR1yz0d6QZ9BdcaXjT8yEwjeuav+vuRWBi0=;
        b=EHeDoF8kB7Tv0P+S7W1kGtF1tmd8wnKqKBZqoaE5sQ6vDWpF6VAZWgQbBKZlHiqPoq
         jOhtTO/z9OQbtEdDqx9tHLmuNNL1SQUvycyZXGjPOCoCN483hfI3QILz2Ka185oVF640
         J6ewoq42qTC2Q/oL9CqyrVUbd1q3rm2SeSJ8+3kLHLb426i4jKgGaPyNqpU4a0jR8G1k
         vk24rR5KxsTWEvnRu+MP+z/INLf8BhW4Npcb14GSmmtrUCytAjM8AoCcUUuLSZ+J5wEr
         7yH9hUAayMLZykPLMmpRBluZYKT+tDz46C2PK3TO6uJRJC8xi/bZxkt56xV4lCPzCsFF
         4zvQ==
X-Gm-Message-State: AFuF++lj2DnE7au4DUzS+RJcgtryf7HNvT44XZ43oA33vdR1KBjo6nfL
	y4cd1X1AopX2iHOdemk9Fd3upjOrbICrUImJAMM52E9C4QWkj+KSNfp9
X-Gm-Gg: AYBFou3KzogzyfTN9cZaCP7w+r23c5YyazTOQFmKrcqaT8GpeV4lsA8zOaHMCFCdVLN
	l5BexpqiaI76usq8iJriQE9Rqs2JcUeM8VrhbuQu4JNFkvmqAT//SJpVTNAGt4Zl9eqkQMuKebE
	9wueiKc4IglAxdOne1H6YwO11JuWbkPg3xZ1b/wNP5pMTTi88SBTqbVnGSLh45qphO/O4fGYv+f
	biqE6BeQKouTYDZ4tr0jFJvcYfOICJ0uMB7TTesrunVCU+GM4/Akeodtu1+rNdFR4+E1XTbmKeP
	dqeo2N96gv0a3IiFH848NGN4sSvnxr16JbS4jxGEz0DzEVpLLm6kEnpeLLebTMtnkdoJCZK9o7r
	Jo8C/S4BKPFK+P6xESPFuf8xmu+PUGJmeAkiOFhBGSHCj23aD4wBDqrzcgA/b5J5dKWZa7yUyam
	Umz7ZqFqSNjy+la49e24mKhaA8rAwdRhOq83EB+GfZg07+AJGuWNODve74hEC45IKIjunQ
X-Received: by 2002:a05:6a00:238b:b0:881:c881:96e8 with SMTP id d2e1a72fcca58-88af4b47075mr3177893b3a.23.1790958857251;
        Fri, 02 Oct 2026 09:34:17 -0700 (PDT)
Received: from TC-LAPTOP.lan ([99.30.92.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968b6absm1135149b3a.2.2026.10.02.09.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 09:34:16 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	lee@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andriy.shevchenko@intel.com,
	v.vitovt@gmail.com,
	dmanresa@gmail.com,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v12 6/9] platform/x86: int3472: tps68470: use a common always-on VIO regulator init_data
Date: Fri,  2 Oct 2026 09:33:47 -0700
Message-ID: <20261002163350.1248431-7-tchatard@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261002163350.1248431-1-tchatard@gmail.com>
References: <20261002163350.1248431-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The surface_go and intel_nvl board data define byte-identical VIO
regulator init_data (1.8006 V, apply_uV, always_on). Replace both with a
single shared common_tps68470_vio_reg_init_data so new boards with the
same requirement can reuse it instead of duplicating the definition.

No functional change.

Assisted-by: LLM
Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 .../x86/intel/int3472/tps68470_board_data.c   | 21 +++++++------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/tps68470_board_data.c b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
index c53542465..c2ec802fc 100644
--- a/drivers/platform/x86/intel/int3472/tps68470_board_data.c
+++ b/drivers/platform/x86/intel/int3472/tps68470_board_data.c
@@ -75,8 +75,12 @@ static const struct regulator_init_data surface_go_tps68470_vcm_reg_init_data =
 	.consumer_supplies = int347a_vcm_consumer_supplies,
 };
 
-/* Ensure the always-on VIO regulator has the same voltage as VSIO */
-static const struct regulator_init_data surface_go_tps68470_vio_reg_init_data = {
+/*
+ * Common always-on VIO regulator init_data. Its voltage must match VSIO;
+ * boards using the TPS68470 I2C pass-through that need this exact setting
+ * can share this instead of defining their own.
+ */
+static const struct regulator_init_data common_tps68470_vio_reg_init_data = {
 	.constraints = {
 		.min_uV = 1800600,
 		.max_uV = 1800600,
@@ -123,7 +127,7 @@ static const struct tps68470_regulator_platform_data surface_go_tps68470_pdata =
 		[TPS68470_CORE] = &surface_go_tps68470_core_reg_init_data,
 		[TPS68470_ANA]  = &surface_go_tps68470_ana_reg_init_data,
 		[TPS68470_VCM]  = &surface_go_tps68470_vcm_reg_init_data,
-		[TPS68470_VIO] = &surface_go_tps68470_vio_reg_init_data,
+		[TPS68470_VIO] = &common_tps68470_vio_reg_init_data,
 		[TPS68470_VSIO] = &surface_go_tps68470_vsio_reg_init_data,
 		[TPS68470_AUX1] = &surface_go_tps68470_aux1_reg_init_data,
 		[TPS68470_AUX2] = &surface_go_tps68470_aux2_reg_init_data,
@@ -339,15 +343,6 @@ static const struct regulator_init_data intel_nvl_tps68470_vcm_reg_init_data = {
 	.consumer_supplies = ovti13b1_vcm_consumer_supplies,
 };
 
-/* Ensure the always-on VIO regulator has the same voltage as VSIO */
-static const struct regulator_init_data intel_nvl_tps68470_vio_reg_init_data = {
-	.constraints = {
-		.min_uV = 1800600,
-		.max_uV = 1800600,
-		.apply_uV = true,
-		.always_on = true,
-	},
-};
 static const struct regulator_init_data intel_nvl_tps68470_vsio_reg_init_data = {
 	.constraints = {
 		.min_uV = 1800600,
@@ -364,7 +359,7 @@ static const struct tps68470_regulator_platform_data intel_nvl_tps68470_pdata =
 		[TPS68470_CORE] = &intel_nvl_tps68470_core_reg_init_data,
 		[TPS68470_ANA]  = &intel_nvl_tps68470_ana_reg_init_data,
 		[TPS68470_VCM]  = &intel_nvl_tps68470_vcm_reg_init_data,
-		[TPS68470_VIO] = &intel_nvl_tps68470_vio_reg_init_data,
+		[TPS68470_VIO] = &common_tps68470_vio_reg_init_data,
 		[TPS68470_VSIO] = &intel_nvl_tps68470_vsio_reg_init_data,
 	},
 };
-- 
2.53.0

