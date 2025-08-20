Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D78C33439F
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 15:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705599; cv=none; b=nIfncOl3agsl3ZtFNzFys6rq9w+uGJd76TrOgrv1QRd+ujcGKvg5m0bYAy9OQVONa0DLzhWusCFT5pKmpQJx0GhtEmbRiqFzwZ6HzIwJzQKZKgLotcUMM4kvB2+Xaw5SRw1EUPmmekQqfxzOdGkjSXQunsWpAHpI9/kImnLp1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705599; c=relaxed/simple;
	bh=nIypl1ykODERwxC+sJ9vhNg0TKnMww6pPFYnDB3p4Lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ITOm68GXVGFuqMwIICc+7JsrWsgyAlz3JA/nhcb16+InZVobzkI+BNtvPPlQHjxKAOLfjwsyCF55GiG++ssRWPAFCEwVdKQUyuceGltqUfkldJyWfxFwTJTn2+YIehPjTUG+Rp11im11f4eVn5jb0qzPrS1U3RBG4Jl4+yiIOtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGAhjt2Q; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGAhjt2Q"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb732eee6so6239866b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Aug 2025 08:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755705596; x=1756310396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O/kD6SDXu00rWD2E4zF7s0LVKDHyHggVTHrfvP7QIfM=;
        b=bGAhjt2Qjpb7FHXo4Vt0NgYHD4kKDzU6oY09fEMGrhwx9/52e/LoGChYM+Hr2RsBMH
         gXRlvnjqcg2HC/r4T6Ws/edPvfwRkZPu72zWZ+Y4WfkTlHcv7b/HWF4aNFlK7LzBUO/D
         zYEQ9lWk13RHHKwM3YFoeuGAnunIJl+LX/rkA6EefYKdqR4pLnTBArfsRBgQncbPrP9A
         ebDicRnxJ8JaeDxoNrpK8qEn2xOlGnALKa0e18eGwUkx/BA91ofelLmszuLImVyj2Qze
         /794LWhBJzmQ9m9xtKB67wOTTfVOemDfDVn+3yJWjIFoOUz8K/pzKGojmHd7v7vQUis/
         mVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755705596; x=1756310396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/kD6SDXu00rWD2E4zF7s0LVKDHyHggVTHrfvP7QIfM=;
        b=P/lrmwcdtLOCcnQkX+h5EmxkX1TBvSa6L/JB3pdzMxXKNddMLPe3dCTnp1syDZ5xnI
         I4NczUrHe5oO9cdWWEnXF0lEsgWClPPxTFjwOeuEdoSa5nxSUVMTIMv7uwuZ7fKQ5QZq
         dQNYi48B/VDPBQ7tJw25zNQl2ninb+vNTpvNcfdftOTywqPzAOW+qfKf7B9F34wgtd8t
         jeNttwNTjjgc0btbKeAHjn/RO5yWfwaFhn+I5gxI2zX9fVZdQ535vDbERBQq6zdw6Hg2
         Fq8lQGW5FeIePT74v2I1BakvYZLgYw9nZqi1q36FVewY6aU4xaG6trWoAe+usT1Ytwr1
         7IbQ==
X-Gm-Message-State: AOJu0YyGfs8/PXWNwNeJfn9qjyDxpNiWinv6ZPnZLulO+NNF9CBrIDPB
	OIge/BuJWzN1NoWAoFqsR4OB7z6l7F3Um0bZIO5nQBysDDR6Lk2hoxLu
X-Gm-Gg: ASbGncsYGDxUG23fIEamH01jLgtueWF78kO8hC0TjExAW7I973tjA7b002qaOXhcM/E
	z53pmXNpnzdCbhw2WcTYxQnrF0DD6oiwukxaxVa8tsCVssrWqIhtj7Q+JvNKgeh6a6/lSv8YWy4
	3f5QbuS8gstD7DsFvKWFd95s/hTrRhPhiPnppeQsdpWCageriN20Jds47wNHLQ4KtP/iEiroNHu
	FGRHbu6UpbPwd4scANmRMeR/PUSDh5SoQ5dVQbC3gAhtFwCBB28NzFGpk1eW6hyfgt/GUDTdZ3M
	IbQRLwzUGO/uHnNlY8Uu42trGjoGH04eKZa6fbhEtX9hOSyXEOKKvL8SwoPESVW8+fQgpDe4Eiz
	s8lLtW2k3lxLNRnWQs2DdCjGZ0yIp
X-Google-Smtp-Source: AGHT+IH9aBKzJZPrEV7YyFfECG8WNpeoRRWd+CwdR5R3M8ebRmWchAAgVtuOQEsWT5L/zd16l3z4uA==
X-Received: by 2002:a17:907:6d04:b0:afc:d209:37f2 with SMTP id a640c23a62f3a-afdf0284ebdmr270162966b.61.1755705596334;
        Wed, 20 Aug 2025 08:59:56 -0700 (PDT)
Received: from vagrant.. ([31.223.98.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2ba596sm200912566b.8.2025.08.20.08.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 08:59:56 -0700 (PDT)
From: Alperen Aksu <aksulperen@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com
Cc: platform-driver-x86@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Alperen Aksu <aksulperen@gmail.com>
Subject: [PATCH] Documentation/wmi: Fix Typo Error in doc
Date: Wed, 20 Aug 2025 15:58:35 +0000
Message-ID: <20250820155904.32685-2-aksulperen@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix to correct spelling of "Hardware"

Signed-off-by: Alperen Aksu <aksulperen@gmail.com>
---
 Documentation/wmi/devices/lenovo-wmi-gamezone.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
index 997263e51a7d..24b027362e93 100644
--- a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -126,7 +126,7 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void SetIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Description("return code")] UINT32 Data);
     [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] void NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out, Description("return code")] UINT32 Data);
     [WmiMethodId(67), Implemented, Description("Is changed Y log")] void IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
-    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
+    [WmiMethodId(68), Implemented, Description("Get DGPU Hardware ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
   };
 
   [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C6C628FBD2}")]
-- 
2.43.0

