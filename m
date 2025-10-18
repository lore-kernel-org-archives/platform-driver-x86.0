Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1164519006B
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Oct 2025 11:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760785820; cv=none; b=A3N2J4A+O4VSppl7CTP3tmT5zEzp9dxorXGRNnMvaj75dkoOHZkc/ODAdsf1vHWKQi937tyFb3IYiw1jPktivUU3RAfVIeJP+tqQHXFrb14IJC1eev1EXE7dNJsWiHLARNa5cTQpVVfuLonkje3bJSD8vvmEHRR7gm/36Rk83WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760785820; c=relaxed/simple;
	bh=MLxqorXdvcv7lnsXASS4c5Irld6fzMTb/EY6v1VT920=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mE8zusR2fVS5qaNvihxVuLJA2hHrDBhJa5i07K3GIcOlfdNCsKQPE/aV/zUOMMD8wMvkmemmhUb8X7y5lRcsw/L7aDRbZklXKABNLUmmhqyJWiD3DuE7/wCM85NN1gnM4QwpyP9WFQfn9fXwSgVlWuV/bH3Fn3jSy+YVddDF2o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mH2H+2l0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mH2H+2l0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2697899a202so26358195ad.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Oct 2025 04:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760785818; x=1761390618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=debOBBhLS/T41VMYsoca2iRTO//ldaNhfWag6mugk3A=;
        b=mH2H+2l0PrChjCqjj+ZUbd2Zj+wcZw6Pu/N54nNl/uXuveW0KandwC/aCQZWZ1hCP5
         kkjUI8j4gURzaNRAch5mwxiycCe+UUODL4vLNDglf4r/ctBSuz4klglVwWBxUD672S+v
         CZyHm15Ylkzw5MOI8OIv2Xlnm3OhJkB+LYBpmZMjdRLzx35CAP5yZIm4QTtiBHTdYam7
         AzZlXjexGli+BhimezORsNEQy7xLOlZn90OmANo5ax8BS8FXV98raGLB2NYfKDbeR/fE
         CpuIj712sRof4V84+bCY9LMK1slEbHV1wq5ryYzuw2CcoGXINjNlir0sDTCsXokeQKYM
         SJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760785818; x=1761390618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=debOBBhLS/T41VMYsoca2iRTO//ldaNhfWag6mugk3A=;
        b=JRqkF9f1irq6z9iFLNTSQ3qhW18zh2FlERYv62lyeBsJh2LDP/Oe0pHwxPEg6j3DkK
         LFHsKBnNLGbVAlqzVx74SLRnZs4Dp43VPOWY4ehRvq+Kp1BewCuwfJGhNqhPj2728d6W
         35MAOuq0kqssyFPfoAWy52qnDJjcYO/oi6xgQDHeelBaqffPYpM/GfPB9D6kNHtZTumr
         y7cH2DN23DAveKqv3g83AHW9OA+1IWQy95Da9wniCNTJDEusxa+4PPnDa4xWcFz4oufw
         vjctjew2lx8Jqg2dkD4iwnBTxprzc+hFov5X/35rqf7tt7o2Sq/XvqqYncbVXUzYpy+2
         +iRg==
X-Gm-Message-State: AOJu0YxLqi670Fg5uTvyjTWH8UMtQ7qNhm2Bzu3UUF6ceI4CuimMUfoh
	S1PLdl/vcoPp9W93hZN75Z6aBlEoQJW+cWLaQb+zGGA3zcpHKABzXTDr53yTq6CaG3Y=
X-Gm-Gg: ASbGncszfJycM3IyMQSsjYveSV6pNzmQpH9bYkrD2PO0FLxTpWLzOnZ7xhZzyUfmeoW
	4aUIEPxNOrKXGZSJ2ErZdH9v1zXJsdslfVgNL911k0GaiamtNEW9eWO7fuwFEuLtEuWo4L5ax8q
	Kcw99IQgQKv3ziOX6g0iAv2t9mL1IEgtu8PnWLhzpc49Suo8pueYxmdeGDPuP4taY9Vf+nWLbxR
	iVM3ppkX7hmrmeDjsl556shMZiQQwhcBLgtk7695Ndaif3d2WMkmKrdOrI1AO8WbWAkdpL+UASI
	UYliislQspRoO/s2SCdVzfDfMy72LQpGuLS7mSRj+8SPIed2EVRDmLS8xy8TiBZNZZ2o9ia8MzK
	x9CPKLITI+GSVMpBqNw09tmDWhr2p+43718R20HBJyXQ4iLq3FFnq2QRoNTwj79tPxu9cYI/IwN
	tD8GmabM87
X-Google-Smtp-Source: AGHT+IHeLfXi5/LBkKRJJSY/OrLC73akNLogCWriuseeF+35Bp/pV4QSbXkBJEeW/NAUJ3a9BxqfxQ==
X-Received: by 2002:a17:903:1252:b0:267:c1ae:8f04 with SMTP id d9443c01a7336-290c73ff868mr68917465ad.20.1760785818210;
        Sat, 18 Oct 2025 04:10:18 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:9e18:7101:be84:75eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5612sm22993455ad.65.2025.10.18.04.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 04:10:17 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add Omen 16-wf1xxx fan support
Date: Sat, 18 Oct 2025 16:40:01 +0530
Message-ID: <20251018111001.56625-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The newer HP Omen laptops, such as Omen 16-wf1xxx, use the same
WMI-based thermal profile interface as Victus 16-r1000 and 16-s1000
models.

Add the DMI board name "8C78" to the victus_s_thermal_profile_boards
list to enable proper fan and thermal mode control.

Tested on: HP Omen 16-wf1xxx (board 8C78)
Result:
* Fan RPMs are readable
* echo 0 | sudo tee /sys/devices/platform/hp-wmi/hwmon/*/pwm1_enable
  allows the fans to run on max RPM.

Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8b3533d6ba09..596fbdfea64c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -92,9 +92,11 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
 };
 
-/* DMI Board names of Victus 16-r1000 and Victus 16-s1000 laptops */
+/* DMI Board names of newer Victus S series and some Omen laptops sharing the
+ * same WMI thermal profile.
+ */
 static const char * const victus_s_thermal_profile_boards[] = {
-	"8C99", "8C9C"
+	"8C99", "8C9C", "8C78"
 };
 
 enum hp_wmi_radio {
-- 
2.51.0

