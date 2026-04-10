Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B72344D8D
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848271; cv=none; b=BjIOTl+kooJpwQHWmrb28bPZXXH+2Vxg720xQlpfJcQUC745hOQNhhvMiY5sE6kc5zaR00NKhcKZhfvYNewC1ZWT84jctwOFVn6VvSnZH6LykQbiqA8jh9IglNPQZOSvqfe8y1bg8gMNy4d7hTl/8hTL+cQnPHu9I/s/HJgmbAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848271; c=relaxed/simple;
	bh=vkgZPPf6JHkVhZ1w+KsVicjX2uihhjmWnJ+iMxbJTdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWSzkLBxjNFQIC+130gfnPR90ZdelNhTZ2qEORizNwylWRAUqR0sOdjyo7arxMFKI5CAHEhIKtYyt44kU84ykwB7VCsM8ACFm+TjrMst9LM04Z9lHMNtWbxE5VQnN3RMXm3X7DDWYDI2uAN10F+KR0YLKOWh8hTmgeUt5dflZdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXZgJ0Kj; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXZgJ0Kj"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82cd70febc7so1612781b3a.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775848269; x=1776453069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0X8rqWM5nh+y9ILiN2utnoubERLpoCrbo466BUTVjo=;
        b=sXZgJ0KjqR7KZddkatxk86wd+q3VMd1KlfN0EdK5Ore0PzX9b/GYfLYyAcqtmO+MeK
         2qJYGFPgYs9WIYsj+0+YI7Oqi16/EsIYpeY+INgXfvoc2bG9rIPG5uSCoG+YEaOP4vtL
         Sv5OQU3oTo7RQM6z2HsWLVfizAfe4uHQB52OdUcVA8cICkChWGMgDCybI8EqFhu+o5j6
         XQuzgxj3OLVOCCdF4ZrrukMqVi4LKiYcks16uZKTSz58aVUczTR3cPdQsI+MXzH8coeP
         CKOvEizC1F1lbC2DHUshbNy0HnTMrQJ+jsGvHsTjTYenz23hXitlD9PxoJwcEhJM/uJN
         Kr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775848269; x=1776453069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H0X8rqWM5nh+y9ILiN2utnoubERLpoCrbo466BUTVjo=;
        b=J96j6hLeTymBWaWTdc1/NIWSHfgnb1YVNH341SGDsYAOv14dRFeoihsN6Ct4UUX5UZ
         y/vKBcGLgZ3c8ZzX+YpcHy9BiXMfrvufUICp7doWXMSgO8GVtvnMq1KsoUeqOX8waR1y
         Vi9/l9thIfr5YoNEvKr9TmgXgYgwYlHPRQRH4SYz9uf6u5WhkFXL/TPrlOhPb12mgDNX
         nccmqkLSZ/H3wh40hBxDO/2snnexJFED4HwRM4HYO2rnbBmGd5dKUNTXwDhq7H12sqPp
         oMCqp8fFH2LKNE70TPGoAhNzCio0xPyWwSpY04OwEgzUVXWDUl5dfNJfBq7nPdwbYbTE
         Fk8w==
X-Gm-Message-State: AOJu0YxGlxu9/Zrrc5BWih0Mp5mFOIwHRaQWbo6FMTKsVGvQcityYm1W
	+xM13+PK6bu7mZPzEGwEGgdah6PLwTGUiarA/TwGwi6neLjdSQx2m/gh
X-Gm-Gg: AeBDieuU7v/1PMR/+Z7B6IxoKn7gt4jyogge8ZhtzIXO+Ey1H8M+N99IJFs9JQENp57
	9oL7u6KQMzA4x2MODoO5ZQCeEPZxdVVduaORirocI42aNUu4On8fwGzKoWKxVjBy+4GPg7kTYXf
	wRSFMofoKJGNa+Is2RLPXCOut64S7SGw0ex5nJBegdZD4bdwlisP6WzNsLXALePdn1Zz/7CRRMS
	g5Wv+dJzYIgV36CSVGyENQ0H5FhcJz0FYxg7eHOtDaJYsK9oRg8wMCY9xlYLCiJUSAs+9xQqGHX
	PXJ/2StyYrnAEq0r+X7RzECz/CHmmW2jpZuANA0bJOb6Scm3zW5NFBRLpxaZ6+X+2IJ9ymN3/sp
	YnCPjv9xKAxJzhUZAqwHji5TWycwqKA9kdFngat8nCT5gQeJ40NvlslfMpiPD7xls2NsrQ7Aobt
	ox0M+DJOR5ts3QzLrWL/P1rv8sc9erTWEMUUcz3OwJTaf3DlJSwqUpXqBRkUQ7GtDCA+5Tvktyx
	Wm8X4zXMrAgLSqASU+I
X-Received: by 2002:a05:6a00:4b50:b0:82a:7f6b:3fa1 with SMTP id d2e1a72fcca58-82f0c2a0179mr5108493b3a.33.1775848269439;
        Fri, 10 Apr 2026 12:11:09 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a70csm3400739b3a.55.2026.04.10.12.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 12:11:09 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Prasoon Dev <prasoon5050@outlook.com>
Subject: [PATCH v2 3/4] platform/x86: hp-wmi: Add support for Omen 16-n0xxx (8A44)
Date: Sat, 11 Apr 2026 00:40:38 +0530
Message-ID: <20260410191039.125659-4-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410191039.125659-1-krishna.chomal108@gmail.com>
References: <20260410191039.125659-1-krishna.chomal108@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Omen 16-n0xxx (board ID: 8A44) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_legacy_thermal_params.

Testing on board 8A44 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Prasoon Dev <prasoon5050@outlook.com>
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 9460e07202bd..2185ac858b44 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -191,6 +191,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
 static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
+		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
 		.driver_data = (void *)&omen_v1_legacy_thermal_params,
-- 
2.53.0

