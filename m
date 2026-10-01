Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CCB377010
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814792; cv=none; b=XXVNb0sEL78zoJibdOos939CnO2ASyTWHUROhoR8OD3uaAhSQ92X1JT56OwcLvf3qJnOo214KVBPmMc4AMhQfO+ow3bOcsCgx+cFmoM9QPhfTZqlopsPPV9yBgJOJcaMk449x741R1w6LIFUETRlnMNPZehsf87uSDqWzZ5B2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814792; c=relaxed/simple;
	bh=Rp1WZBUeoF/Y/bHb4HFHa7Ec10D2a+zX3lGfOaKCM80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0gt8aUZTLzrfVRhxWE/PAFYKEBvNSTLZS6ttSD69Zx7R4Gst04GWc98ZZmptzmySVGw8XO2GV4UsyFphObLQmDx7oPO3bHvlmz+HViQdVbSZjrH4j7wkBeCgVJTBRmFsY/H6PaOt4+t8nOHmjh+WzjNlkZpXIHOy5tT5oM9kBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srY0sF0M; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srY0sF0M"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2caced6038eso1368735ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 17:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790814772; x=1791419572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C/x4U6h0R+Ycs7vP3rbjmSILj11/wYTR/tBgTHYxKW0=;
        b=srY0sF0MA75thiVLd0H09V6OOqrFKY8tHmLeXT4AaitzXEOMEcwwUQV4DhkS7zV0KV
         DMPCzNRrTZkXovTtStXP8rhTw8KWEf+bWxO8SijcootLoyTr1ILd4Vreq/+JoYakLpEV
         z45jfVukYYLd1e04xtdvSM8soQc8rGnNIhIGXbpGHR3/RcvU7UochqL/mlfZkoYdrNBL
         SID7dD4yLA85GWM+NXlu5rd3aZabIn87ty6BpMQy2Y7girDjcjnPQkaAEvbxmEvtpenT
         gds7UT8dr4DNAAvEzvprbvtvCDCggs4cEJll+SMzX0txSTR0vihZGli8BbMx2Iq7W5Jb
         GLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814772; x=1791419572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C/x4U6h0R+Ycs7vP3rbjmSILj11/wYTR/tBgTHYxKW0=;
        b=CS02S2av4Of4dfjkNAsZC5vX4pKrLlaiGaVi7Fu4aa8K8s6HlGrexF576vms9Sds/7
         vXNoBwbRp/tdT7ghk0D+mLsvr1zt3Ff8A3wuzR31PuiES8RA0O9sberqTyubIi2+YA50
         JNle7maM+arH+YZcoo9WTHbtFrBvLU+YBDN1rfJWW0w8DQmaGeGRBYTfxfLoIidusOYR
         ja4akbTo0AID3LPhZzrFPn97joPcBMWuhGTrxMxxgH4HroRzmqoSZu6BcmoghX+oViCh
         0DoY5udBKPCFA+mxTSFmuEj/ag+zad3rp/c+XAlPyHwon3A2MDzAPgpxrVpYCn8lSKFc
         PuYw==
X-Forwarded-Encrypted: i=1; AKwUvByNXK8zCawWej6yPlq3y64Ol+3Jw+m/fLdneBBt6X4RnzA/N+spTdM8vDo1ui3yLJXuFx8MIknGDMa2K3s1uwQO2Pu3@vger.kernel.org
X-Gm-Message-State: AFq9FYIoXY8uYF17MCMbidLNJONjb+WxIGlsURnHz9XiwNZvSpA/Ehfl
	XEE3azRJZAaluP6ep8TWqvK1Q6GS/ovU+Y+Ae2mUGivbKOFgmn92jdPb
X-Gm-Gg: AYBFou1p/Yn3xLjP84av/r3mpWqVmd87RmF8oJlRtwI2f8H0dYSjoNxlPU6jWPKZyD+
	azipdzTmLNmiAr1wKTFXJuP+ZtA5xVFk83EV1+aw6CK8DUop5fKxOB1GasvoO5qOapFi68mRGbk
	5TYIpgFT12X/SeFKavBgvq4Zrg2kmU9Sb+k+mx/xmJVkTiclKe9mO6udaYeRl5k0553VgOScw1p
	qotclAR92n3PFMrHwy7K1euyIZjF2YrgQwvjQ8EiAeDeeNQyginbGNQZ3vmautuuoqHk5LUknWA
	aiVccCKdjhl/XKP/ZOKrNYHuE+ROnS9oNiWKHYYplYmHWQCI36BPTFSTAzlgT136Gy/ViPH5Oc5
	VVmUcWlfQin4TL6n6OlR1ZF43Lz5yhLj6YPNZ9An6wmrrPG08f7wTmr3vKxHI6bfV/4TYSkD9yd
	C573Qo8UoTqQMGbZ8XBckZxav7Zj7y70qUVMN4T7fAJcFCH9Y2g1Un+e7JkPdHCL4=
X-Received: by 2002:a17:903:2b0f:b0:2dd:a937:9bfb with SMTP id d9443c01a7336-2e3000ecbddmr6606795ad.10.1790814771975;
        Wed, 30 Sep 2026 17:32:51 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b58345sm3161615ad.66.2026.09.30.17.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:32:51 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v8 3/5] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Thu,  1 Oct 2026 00:32:16 +0000
Message-ID: <20261001003218.39421-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001003218.39421-1-qby140326@gmail.com>
References: <20261001003218.39421-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 85683eb116c9..e28df14d4b8a 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

