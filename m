Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE8F405860
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 10:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816778; cv=none; b=Eknv60bvZ5o2EKj2pLQf93caykxht/MEHBGGxag3T2h0lGsHKxNxI7xCV2NfaOgquiWH2JgrplS4obZEd6YPSF+FRp8kaYZsWpbWJ9QSJMUV71L+TPKaLdOsdHRs5oLskLD4ziXuxbqoH7Iu0BV1ym46h1Sj0cszJezimGoSd2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816778; c=relaxed/simple;
	bh=ZGzt5IG+INAc0Z7HeVhKM5dtyeIxmckzQq/YLXhj7HA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/VuXqf/4rEgrWHKkv5VOfvtA2Dyf8zagUcI6zvRdICzbBaC89T6XxYCB+OdN0cuRdIg7SNCoiOuyTn9h6Ax+s6EeWU2b+TjR61CPwXG4nh0TKWha58T39zxtMC47y4uydlfKBuWEqDUJmYQ4BvSLOrPogP6SGlyIxRHlVtzVcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyI0Bpk4; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyI0Bpk4"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-664de4f80d3so1947301d50.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Jun 2026 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816767; x=1783421567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BfF+iXeJWMxuPhgk04zCk6fGh3gRO2aBc22OA8kCBN4=;
        b=EyI0Bpk4mY7MrXdF/3pVKos2TndkWIlxS63pSWMOx/AbcRikvnstFJRGrPUSu7vRhW
         fFpTVtI9vsT1wZakZayymFCmyjoNvg76edEBfCiEOjL4xiwCi4WvVj+ktXFOk6eQu1Ma
         2LXGUdDQVn1pkbq9CU3oV5U3XQo7ZQYb76dd8B2OkcfkSr/6y1YEr2g50nVxHv1WOKmP
         zBuCF8Ksnaze0WaAaa90nN2McLAaTJXAvPMh9SfA/duRLq0q3eX4QFiNfLPRuTmbvtEM
         jNdOLBKg/UOXMo5phy30Yqedp3n4oyHEYGTdqZzGUcO+NYv40gzF4wgX6OrQ3cWNu65X
         oSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816767; x=1783421567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfF+iXeJWMxuPhgk04zCk6fGh3gRO2aBc22OA8kCBN4=;
        b=HIAvHSRR5zUiILoXP88LyTp81zxv0aLiey385eFnvBD4mBjN6ndsrSfX/gR4sEhRbB
         r5YgpfKcpECj40C5DP2SIzESx3JUSCr3sxkEf5EZpxmsQU4zMgVHB3HToMH/Y1p/cLtJ
         qmnOvWOnvchgFowN1DKCHR7ETUHGSQ1DAxBaFaxqy7GNoHjqF9sOMJPNdfN2GcPKpBov
         N/NYQW9nBNrw8r9OPoUvUtkyLQzFsncoDEsYx549OhU6L9CuRXpAHPs6pUWjwwNulLdP
         GFyOLiUdeZROn0zjTNte2EnMJLuBDp/uJnjQ40v1T9WDtgBAbZkFFwtIPKS9qewspjAU
         CE3w==
X-Forwarded-Encrypted: i=1; AHgh+Rre9ZDNydetxfVvuK6pd9vMmlw8+CEqj/wgFocGJuJJ8VD4vnsg+dnWcvlAyDbhZMm4MdUGuoHr7c+0iqbdKgXWKesu@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+pC9MicEOfaDVXmVIs7FFlrjl5fdRK9LeqF99L7TeDZ9vvd+H
	Ny/WIIe27vT1w6s3qT2WxWo/3IJhHpUiKUQq8qVlGCEtGGL1wsPc1To/
X-Gm-Gg: AfdE7clhxYfwkU7j366i47i56pBQi/dCsP3kEQ0rcJduCFJF6Wm6xGSYoCcOQ02BPdr
	1daXry7LbH0ktpZ4TVtyPQa4bRb/4huCWn2CV7WB9xPZhHMFI0EeFdaK7ss55fet3atar5tDy8V
	4JzoxuOh5dYTelwLvcI+X4QDkDNXZH4/2uPgVhxpwD6hMMNgX0ey7FY/Uy/vsTChZgPrOszHdK+
	lZFtxl4VlcomwFnDlVBQbAxPaNcnUhUz3BXAM+pgEBoqpAUy4oT4h/XkESEqKvnPdXrt0X8TCu1
	Roo6zJnrzN+wSGKVlE1qbm6TRd7NoJF/MelVGbA6jerzWBdeIhHJHsF4aS6dasCL7eVFJZjleCT
	xo2JF4YpCxZNiq8In1FXVYXMq+o8dj4l25WXSgeJYNhzlnf1w1t4+EZD67AerAKEyq0pPli1wrr
	7c4kvylkz3XeeamLCIe4EJq8hloSmGh1mjqtVx
X-Received: by 2002:a05:690e:140a:b0:664:aa09:a29b with SMTP id 956f58d0204a3-664f96e482dmr2719441d50.18.1782816767360;
        Tue, 30 Jun 2026 03:52:47 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-665016d577asm693402d50.21.2026.06.30.03.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:52:47 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: handle positive BIOS error codes
Date: Tue, 30 Jun 2026 12:52:34 +0200
Message-ID: <20260630105234.54638-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_perform_query() returns firmware BIOS error codes as positive
values.  The Victus-S profile callers only reject negative errors, then
consume output fields that are not filled for a positive firmware error.

Treat every nonzero result from victus_s_gpu_thermal_profile_get()
as a failed query before using its outputs.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8ba286ed8721..50c5a1e152dd 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -1825,7 +1825,7 @@ static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
 					       &current_ppab_state,
 					       &current_dstate,
 					       &current_gpu_slowdown_temp);
-	if (ret < 0) {
+	if (ret) {
 		pr_warn("GPU modes not updated, unable to get slowdown temp\n");
 		return ret;
 	}
@@ -1907,7 +1907,7 @@ static int platform_profile_victus_s_get_ec(enum platform_profile_option *profil
 						       &current_ppab_state,
 						       &current_dstate,
 						       &current_gpu_slowdown_temp);
-		if (ret < 0)
+		if (ret)
 			return ret;
 		if (current_ctgp_state == 0 && current_ppab_state == 0)
 			*profile = PLATFORM_PROFILE_LOW_POWER;
-- 
2.54.0

