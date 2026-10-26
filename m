Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010129;
	b=jNo3i+T98TBxpGukdbAx78zeIjX8nLrqS8ej0XKHWSOxECtFaLtlTBk2kq3lcgCHR1i8
	 ZnBy5l3VlCaIX1RbwBnqDhbXnDIwX7A+iqXB6hctLM1zY/ESU2XcLtwxT9VsPX2Zlil4n
	 PQml6c3T0TULNho7x6t0jC4U7K3JTy+sPkDcH10wdFOcFSg0cN/NPTfVwy5/w9Mwb+k+j
	 X+fY3QPUuGSOrJowiOhfThF1goqOsgNBMJKNIJirFCO7uEbA5vA8iOnnze5UnyIe4rtU4
	 4dghHHbTE+pKlAOzmPyS4JfQ4jceSV9YwlrwxSLRbQ7k4BgG2H7RMskb4SoEYDf97yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
	b=s4mWTeiFZc2ubI5tQCH2p1JG75Qay9lF6RPDs1C7aXYl5O1RfIvA/GmBkA9FyYWJgPuJ
	 nNv4XBL44SFAytwxYNHi2WuRfuldVm/PYfXYTNW91gsedtnTjsxXvTM85JvoQB2XKfBi/
	 fSM9NyNPKia/pmaYf4Frl62HmcQGgwCJ3g5AfV7MiGCLhqKfJuq8pVwrQG0ioKjnBbrQX
	 f20G1iMnR8La3k/wiucPvbh02UTOkWXd8odm1oEpLIWbOWKc6AwgAz3xbJGQZTco6bnO0
	 T5I2Pq2zgeVh7+hn3515YK8x/2Zfl4EoPiZvVPPnCRSXRHW84QfW8bhx+hezjwaFMXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU3+1lmO;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7A460A260D
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD7A460A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gU3+1lmO
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1725438a91.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010128; x=1793614928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
        b=gU3+1lmO8MRBjumstxABnQkjClXrqaJybo4d1B19kkjLJtiGB9wQ7y76/6i7+eNGR7
         BjfkLu5vBgC6KyVur3vp0k1UWNvaHhrGhuJdIpcH/2Sgk1cQFzdYuMvmk5WJi872AEco
         /Qup1xEDoOOyr66xvZFEqIdx+1wA9cG/c37L25CxdZGlLDAwvbMT0hD8gFUfi+d/4sY4
         IcGgA0TRqs/CbqqX7QaSrksXoaH7Uf8vxl02tUMGsE41Y4TqPmJmpPz5VEHmjMmh+C0j
         zETptfoR0Rm8aXaylNMvqVmh5vRiKiBWvrnUrZNGzi3l4cHPySJFYXJ8pSjetm3GvRaf
         EbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010128; x=1793614928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
        b=PvMxzT+cH2euqXQHhpFjQ+JcVpYleUSTtNBaWTzYT5IRzSaIJ6vhrG7tLrBelxw9Q0
         Em3Pon4yWfosJzs0p4wL22Ob854zQcWcfh8yWECAgaRuxCzFxmtmjCS0sQrhJA8YC7o5
         hS9XWCP2msvfAh+HGTkqhMKw8xVFW0+JkfB6BscNcJ/npG1KX5M6ac6J5unVQE85vATK
         rM2agP41Rergfro5pKeD3NCWLcQ/RI+17kQ9g+fWRi5C/FIfhhdvmx7sT+tEa2pjfCG8
         6a9EHdLE954vfR4pXgtxqX4Zrql3XPhJHHU0TUYZ8LLcbGhCsX5Zg9zoqvnWNTaKBcgl
         qlhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzAlSEGJeELe35khWsPi0SvmHCOFYBqR6Dp5luPaWrdW6MJWl0DbiTM6FZBkeHnHyugiOTmkD3etPTEASLn/MWWU1H@vger.kernel.org
X-Gm-Message-State: AFq9FYJYReB+UyTmHLfgxY4teAP0YcCEiWxgqRFzJGuWrrt/lqDPhFtI
	GETZSLpa3mvm1LCev+EsHSl708HklJ/fxbHrHkm7OTbaVC8aGTVknVgu
X-Gm-Gg: AYBFou31mF2p0cF+GYNvh8NWmsCILkWQ/qG8tY63Ov+COjHHY0LZKnqZqRVFmZqAFwg
	Ff0x5Pa3W01epJloaOnVpMM/1w3pniwvOIzWvzq6xRW+3Twi9jl8UEIlv9J6Xqyi+yli9gEXX16
	TDQKMqvZow+RZtF3rNEDC7hcTdJCqdM1wnbCt70P4yfKFHh4pkyV5ghnwQMQdryzZL61u6/46CN
	apgUw/cy17bjK9Tddb+7p6ndyU6e1scr9HgIAM69yhZKgDehCizyw0Sa41a1OeQ23scvEsyWmwM
	rSZWjooNmxovuawMCEOr8R8yV94VE8wBh4XiGz1+IONihM26w57S7wOOgj8uVDLaP8QcHYEdqu5
	oTBMRt81vlgabqgMq5F2WCgBX9XyVsD9SF1NsIf9hajk8KIJ68CwLO+gu1sfPdbfwSRelBEp9ub
	66/txaMbwUlgAHTvVFsfrUbk2W5iLGSGDmIcftdyt9u2LvakaEQVTeU8m2H6660ldxkXxzFNXrC
	WhnwV07mk/plzWZQIcoFN3nxtKf3jOcuh+WoA==
X-Received: by 2002:a17:90b:2b8f:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3adeb5a57afmr3846519a91.21.1793010128168;
        Mon, 26 Oct 2026 03:22:08 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm7877467a91.5.2026.10.26.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:22:07 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v14 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Mon, 26 Oct 2026 18:21:01 +0800
Message-ID: <20261026102101.224568-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026102101.224568-1-qby140326@gmail.com>
References: <20261026102101.224568-1-qby140326@gmail.com>
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

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 3f8f1ebb10fb..a431d3fef774 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

