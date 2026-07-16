Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8613F6C3B
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195708; cv=none; b=p7PGFj5wSjS3bWYOe+aTiOawYiuudaMltBAsF5PeS/CBYuIZtRzFBkofgWsVcy/TPLnnW3HzYXSlFzZrnb1pjEBkQdThqcJTy3Yso/4jzMI1EYhL6OSsuz5Dz7lixF9iD3aYpfyZSirJTa2Ca9Irx7S88XB53QnnsSlWMX+b/rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195708; c=relaxed/simple;
	bh=ihO86w6M9J9Q8YyLob3qKYfIJFOjlaZ6jRgiyygV+dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dxMNJG5D8/LDDAIfV67HzUDQntagyTiuWLszVhpIY8uCFH7DAQ0AR4Ck/kLHY+dxztA/TUxrZrBLo8Zn/cx5/liKEl5H+04u97SVu3aLQ3tJ5CqmDgVykIjEH83+htZgdXR7H8IVJjVc8Xy6/nB6sxk+/iNduQif8If9KQlA3tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6YY9h8W; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6YY9h8W"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c082647cd0dso62794966b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 02:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784195705; x=1784800505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1ld0Bt1YKle4YYay4jF7nDW7TUGiPBFgsLEe/VJ0Xg=;
        b=P6YY9h8WR5M2oDPlyfIbXaYCeUsIAN3aJAysiqG+vA97TAtp7U46jrsO4SF0R8t2ys
         DHjUWDzNqP+rIrL0ZdT/TaOqKKLozw0HSIei+FBZPmjvzmdOuGe2jCHykXDUSH2Yj9d/
         RenRb5OSt6jSr8R5xCfGvN6HFnwHZzAd3uv1luWAAUwK/KObgaMqHHbLN2lFuPQE5CHC
         1lBuPxNYsOLLcWg6MDUp0w5VU+T5uF4CdZ59xOXjl+ZftiCtH4ZEuFfFvsoIbOSKyIet
         k0L3h84Sd2uZ6oiYcaBZt3kaHCxOjEcGu5hgrqXbhxe2WwlI58vtxc3oPjvZn637fUn4
         TH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195705; x=1784800505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1ld0Bt1YKle4YYay4jF7nDW7TUGiPBFgsLEe/VJ0Xg=;
        b=qowY2QBVTxIsdcCH3CkBh1ntIveR6RoHzhvcy1BpUYfyn1FcrVbDZoZJv0wGMGYE2o
         xqgHQQha6f/k1iqJ59buTA/AdCzASjiNG0l2CA6GYLAioIL0DwnAi+qm2Od1nwvUGjx1
         0X0lxNAqcBu0MBCXoJQw5xCMtCxnhddFstksQj1d4IzZVhKPesSY6YzsQ1ha7zfxmS8T
         Ph5Y7MBo6S1xP9tQWf1q0JAHphBZ6yihcgg+j8yrqzVgIWIwqp9OQmG9Tw3qA7OuNGdf
         n0QtK57u8509pP4uTUiIvA5JyZQD5Rx+q5hi5+qdRTwYJb/xVVbmlnhiQc2KZOqstL8N
         ckiQ==
X-Gm-Message-State: AOJu0Yx3dqJN2ylNpOBxC4znRhMIdMRsk2dsOcj20bxycQIh1y0efrnV
	crcevjZnXAW9csRJygAyI4Yz0RrL9CEypK2/NJxyFxVajfNJP4J1EiCStJNIeN4DABsaJ4Gz
X-Gm-Gg: AfdE7cmkPw1kTpxvBlK+bd6VGYr4nO3qxxtFcu6sqez0w8lIOHO0Y+MHiMEW+2nnaFH
	Yu6KeChg558Hn7ypvdoG7hFzTdD1VYVlUg1/IOu9wWQnjuMT3kYxQ7fYyAN1EoD4Rfgsk9NrQdz
	cXcn2+E96BaE6MzY7snQBqkUV08fp0bwta9JyYwAmrTCs7UGZgQzpBtCn45JA8DF4v6xR9NfdLi
	O1vwXHXaGK5mNvY0AJ/dQTUJNSJYpjRdXxGHC/ODIvIVD4OSTRvRmfExUEzXXugUMz5DdSscG7E
	Lh0CJI7xNZFsvbg78AWvv+jw8mfxgIOPi7FCT+aykmQSkvb4bFXN0ubOxipapjnWPeeb/JVTXeU
	5rFsGk1Wf/tv3Uz0pdUJBC27k7+taasFOHcnT1q605YCx9u910ACaoEDPz6ah0xAmNwW+
X-Received: by 2002:a17:907:60c9:b0:c15:a667:81eb with SMTP id a640c23a62f3a-c161ea8d0b3mr675990966b.6.1784195704576;
        Thu, 16 Jul 2026 02:55:04 -0700 (PDT)
Received: from fridge ([193.32.127.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744e702sm178454966b.47.2026.07.16.02.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:55:04 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com,
	edip@medip.dev,
	hello@kursatabayli.dev,
	mjg59@srcf.ucam.org,
	akpm@linux-foundation.org,
	jorge.lopez2@hp.com,
	jes965@nyu.edu,
	mario.limonciello@amd.com,
	julien.robin28@free.fr,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 4/5] platform/x86: hp-wmi: normalize GPU thermal mode errors
Date: Thu, 16 Jul 2026 12:54:17 +0300
Message-ID: <4dcb4c0b0aac63d03b8e8a3c68e41b88b8d303e6.1784195117.git.emreleno@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784195117.git.emreleno@gmail.com>
References: <cover.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPU thermal mode helpers return positive firmware error codes, but
their callers only treat negative values as failures. If the mode query
is rejected, its output parameters remain uninitialized and are then
used to select a profile or sent back to firmware as the GPU slowdown
temperature. A rejected mode update is likewise reported as successful.

Zero the query buffer and convert positive firmware status codes to
-EINVAL in both helpers so callers never consume missing output or ignore
a failed update.

Fixes: 6e4ab59b8391 ("platform/x86: hp-wmi: Add fan and thermal profile support for Victus 16-s1000")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 29881749aae6..65c3bac17ad6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -1885,20 +1885,21 @@ static int victus_s_gpu_thermal_profile_get(bool *ctgp_enable,
 					    u8 *dstate,
 					    u8 *gpu_slowdown_temp)
 {
-	struct victus_gpu_power_modes gpu_power_modes;
+	struct victus_gpu_power_modes gpu_power_modes = {};
 	int ret;
 
 	ret = hp_wmi_perform_query(HPWMI_GET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
 				   &gpu_power_modes, sizeof(gpu_power_modes),
 				   sizeof(gpu_power_modes));
-	if (ret == 0) {
-		*ctgp_enable = gpu_power_modes.ctgp_enable ? true : false;
-		*ppab_enable = gpu_power_modes.ppab_enable ? true : false;
-		*dstate = gpu_power_modes.dstate;
-		*gpu_slowdown_temp = gpu_power_modes.gpu_slowdown_temp;
-	}
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
 
-	return ret;
+	*ctgp_enable = gpu_power_modes.ctgp_enable ? true : false;
+	*ppab_enable = gpu_power_modes.ppab_enable ? true : false;
+	*dstate = gpu_power_modes.dstate;
+	*gpu_slowdown_temp = gpu_power_modes.gpu_slowdown_temp;
+
+	return 0;
 }
 
 static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
@@ -1929,8 +1930,10 @@ static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
 
 	ret = hp_wmi_perform_query(HPWMI_SET_GPU_THERMAL_MODES_QUERY, HPWMI_GM,
 				   &gpu_power_modes, sizeof(gpu_power_modes), 0);
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
 
-	return ret;
+	return 0;
 }
 
 /* Note: HP_POWER_LIMIT_DEFAULT can be used to restore default PL1 and PL2 */
