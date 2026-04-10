Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C027A33D51B
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 19:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775848275; cv=none; b=OsOmDUdsNFFhRt24tAyw+TYJMg8iwG97AxotJtZrdStN4UV8Kg74+RnlTRIKhAgZuzL6cnexbeYHL2E7sp3jsjhYpwW9D509LtgSnyx1QWUJOqdg2Ryv+NEj6tDFZX72UPnN2uJD2Ck8Hc254jLwtkELIMGsd1epxlwax1wNQ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775848275; c=relaxed/simple;
	bh=yB+j83xQLdYZ3vRG7vuuTjwgqlpov06ipOrp7gjWWv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vc18r/SqkU4C8Jzvqn3Zde/tyRcYEDjgqpmyD8ecgJtGrt1q81htgwpjsGTcpycbA1zsWYj/qKzQGsbAZTWn0jxyO57auDfnFc7G+DZtjbF/24gzPjhuBtmbtJWg0kaB1LubiR4wmy2NOTeUa7sEQxzVhP7BjlyGcNl/IKJuZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxJd6q7y; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxJd6q7y"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82cd70febc7so1612819b3a.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Apr 2026 12:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775848273; x=1776453073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GbMT2CZvbw0uf2AhrgXlVq+eTBCRP81wvM666brLGI=;
        b=TxJd6q7yTpd+m5QyrP1KalnBiz8RHWayoiV4S+ogy7KyHp5rhT7IaeGDP3P1kp4D4k
         aYCHxeKrQ0tY2psElCLv5w4GQAvPISRgP2SWqtjU4PPL2pgya7m2RhWmHxLfPwZKNQ/Z
         QEFWcqq7uIljxE88AmkCICuePlr3NLgRE2WNoGiG239Gxd20iKNV8Gp+8G1xa+8iFFwZ
         FJexkyCVvr/VonTiJEGRskm4rHcLqAGs0ixpY/bfckDGOtLt33MlJ/ejrKwQJ4GdvMI+
         /bAfeprCcltQ/xVX8gY8A1FdTTIRXtKFPX1rua29t2CPxXPArDsJkX/Qn32FJNixs9YJ
         QGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775848273; x=1776453073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0GbMT2CZvbw0uf2AhrgXlVq+eTBCRP81wvM666brLGI=;
        b=QOm4lYE5gHbJ3arydwjHD7YvXWrPq6GkCaO8McmiZbBS3pa+cpUjahVp74q4dHGT2X
         rKdmjzqPWrSMxjkWXE2nuz4RAatMybnI2i7OcoY/1VnNh2w7cU131owQQJE2t1JTPZ7W
         KrUQMgDEngyJySWEhVDtzPxEEWvKGtJqKhVjvdGkSppp5dXltRp/q9syHOZnsdvol/Pz
         A5ULoEJTZ9aVM7ghuvHuCLWsGqzpR2DJvSB8Jm1Jyqs+dSgv6oQlY4q8t/56+jZygHQ3
         Z2F8TwSZFpusyK9a+7N91TULXt5fS1DyEK2FFX7xcpzjWCMqk4EgstJqntv4IPZbJbGa
         0p0w==
X-Gm-Message-State: AOJu0YxpKZwyI6ijyxWyMMKp+A8PXrNCsfiNwoL7DGXXVnwHZ1gfThZJ
	R90t8AHwMkFArYMYb4oqAqRdrN0XmlsOZhGxMWy8IaujBAmtCybfTuH6
X-Gm-Gg: AeBDiet/V83xRPKtOOXf6oQR/mSb/8QjU0yDW8H3WrXkDllDGrzhxxDzf1F7GIv3Mpq
	sjPJtB4dkawxUUIksQTSMS4vGkCtWv5ymH+/XQ4yRJ9h/1nkHLsbWPIFCdaFmuv3rebv7a6W9qu
	nfB/mfAGGPFU3usDoKDBiy1/Lu7tH90AUIZe/wBbs7xScK3aHYPDr/PqpWva/yHY2YZXEUuub65
	K/i14TSo2qZZ/q/61C28PNSlrlcc/VM8UbaaVNzATXQiXwYS+ZIT14SE50xJ4c+VjibUoH18UME
	ZXIuREb5+arPyrZLdNpg4w2ZM4lCt00cRjBKKIP19/XtO78+wFk9c56nqOy811njO6BrieJzVwa
	mloV2zDpaVcAy/z+mBMBfMToHrLFiwkVzYMwSHodhl8f4PKr+FuTuI7KlVFmUHxOMK203umOoGO
	SWs2UC+R5goexRc6OkcjfrDiW63kckitrXuCSwM7rFv2BZOWF3LykLiPlNfuF5EWDlMRnIyU7tM
	L/PzIvABICNZzfIa9N0
X-Received: by 2002:a05:6a00:8d43:b0:82c:dfea:9e2c with SMTP id d2e1a72fcca58-82f0c1dab05mr2971408b3a.9.1775848273065;
        Fri, 10 Apr 2026 12:11:13 -0700 (PDT)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a70csm3400739b3a.55.2026.04.10.12.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 12:11:12 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Thomas Arici <absolute3d86@gmail.com>
Subject: [PATCH v2 4/4] platform/x86: hp-wmi: Add support for Omen 16-wf1xxx (8C77)
Date: Sat, 11 Apr 2026 00:40:39 +0530
Message-ID: <20260410191039.125659-5-krishna.chomal108@gmail.com>
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

The HP Omen 16-wf1xxx (board ID: 8C77) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_thermal_params.

Testing on board 8C77 confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Thomas Arici <absolute3d86@gmail.com>
Reported-by: Thomas Arici <absolute3d86@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221300
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 2185ac858b44..83614f2f9f22 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -227,6 +227,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
 		.driver_data = (void *)&omen_v1_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C77") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") },
 		.driver_data = (void *)&omen_v1_thermal_params,
-- 
2.53.0

