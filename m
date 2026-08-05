Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2B3438A6;
	Wed,  5 Aug 2026 18:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954717; cv=none; b=odJon3mSwRJeYag7Bb3vmGzmJ/tvo0puHfoPu7IzTzU9deUlxQLm1ecDBgjL3g8RNuSqbkNYvLwuYwuzpp1cDuVsCeVTeNEXasAkwaqs8Gnj73qBtG0NHafE/Eq8aUyIs1OlctcK9hzu4gF1oP6P9bnoCavkF+zyIkhLvZNYAC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954717; c=relaxed/simple;
	bh=/1xd9FcrcuoZEf0AG2YzECqSMJoaXrUJV3FPwrR9cfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2Bf0uYfBZMSXPGd5D8ufmNOnp37AYD9zwIPvkFFSWUIf7As+dsc0+rT2KqHpVdFxRxDkrWoURfBt7iweJSJvtRiqFMZyU2UKfR/Wfj4uUqOgz3JBF2u2KgWs/On4vEhDN2DQpNozkJ1/mKkn+zqfTRBU2IsIUy0ePviIzZ02Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=K4Kr0nOU; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="K4Kr0nOU"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 32590C2AD3;
	Wed, 05 Aug 2026 20:31:48 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLTtvQBgWqNd; Wed,  5 Aug 2026 20:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785954707; bh=/1xd9FcrcuoZEf0AG2YzECqSMJoaXrUJV3FPwrR9cfQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=K4Kr0nOUGDO94ypW6ZhHUNX5ArfCLcyaWqdYL7zLasqwZRsdKiu9Lx4uWxYO8iIXb
	 sLCX9LBe2I2fjJyaGIB4qwLN4rAcoTwG/e0qH3vExmO89UDrQS5gHqPlA3L8/eMg4K
	 EcnUP4W1aEHLPBQKUBJnV2vhAjXMuIVl96RCygOZV7aOdKq2DxPS7yDOM7fpuUQRDQ
	 oBMbznSqVZForEOMxbE1kXRLgBeBltDD3bJcDeMyMMkVUu2Bmaae2bGJF5nydJ67MU
	 171DEKahZPKwNtcGFOpO80iVFQIJZb5yXXyc/4PqYnJn7tqwXfbAAyLLYhmMZLEsOI
	 rFoF59wKuuJ8Q==
From: Marco Scardovi <scardracs@disroot.org>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 1/3] platform/x86: asus-wmi: Add ASUS_WMI_DEVID_DGPU_POWER_STATE define
Date: Wed,  5 Aug 2026 20:28:06 +0200
Message-ID: <20260805183131.3075-2-scardracs@disroot.org>
In-Reply-To: <20260805183131.3075-1-scardracs@disroot.org>
References: <20260805183131.3075-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add WMI device ID 0x00120097 (ASUS_WMI_DEVID_DGPU_POWER_STATE) to the
asus-wmi platform header. This device ID is used on ASUS ROG laptops to
query the discrete GPU (dGPU) power state level.

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
---
 include/linux/platform_data/x86/asus-wmi.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index b5ed8c83ace1..289be6ac7335 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -140,8 +140,9 @@
 
 #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
 
-#define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
+#define ASUS_WMI_DEVID_DGPU_POWER_STATE	0x00120097
 #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
+#define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
 
 /* gpu mux switch, 0 = dGPU, 1 = Optimus */
 #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
-- 
2.55.0
