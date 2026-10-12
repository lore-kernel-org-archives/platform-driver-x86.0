Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2727A47CA6B
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799608; cv=none; b=NZUrk6O+2D5/mBuZZu/BSfOJcq8nk1qY7YK+btOqTqyJpFr77MxPsNoNOWljqK/7bX+jPwrHTN5ZABPKHOhPH0WOAYB9eGbCT400o038UF5+dt1OEErvmG9IKOHhMGFUeyXm9u8uxuKlPQ8V5gtTP/My+ATpUQtJ9yzjSb9BqL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799608; c=relaxed/simple;
	bh=CyBZnoL9cID7mi6579NOEOhskoy3tNCIc6rw4QdlRHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NsKSSPvCkSek/9r7GNA4rNzILRB8FjkZm0ZIyoB1VgrOcO8Y6PhjwR71MIYI4SLj6mWf8PUWuMHNmJuHEx3HkKN2RYAWdGNci2MdAUaM2e8zw62+BqqX0Xdjb9INPIqji0CY9/mi1QOuVbxDeyjgV48G8DuEM1k2C/tkcNOM3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bAUooeAo; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bAUooeAo"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so890846a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799593; x=1792404393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOkAEGZ38cExqY4JKO5ThXkSV4YfBritRUgr2RuPIUk=;
        b=bAUooeAoLsJLofZbCEpsazYVHsoAcUA1bELueSB3NVdib50OvYVe7JuiuAGpsX3uVe
         SvfbghUlkq2IxcVajJTWgMRAkiXHfnH19H0EaJpx1IhO6fDwXtw04gtkxIQrEkxwyL0I
         11QDDnA2s5T0H2gP+hKm8NSn41dhBtwcg7oPdAosXGLVr3T4vvrkE9R6c1IEoWoiFj96
         bhfvL4aZSSYs1WtHOWgsqD1wfL8ee6P2VcscvumD1V9pjZhM0Pr5tE+eNjJT8P147Xrz
         IcGH8OCnAQVzPFUUlBKgzwmBnvsrOC0DlQ+lgDE1TMMQI69Pc8rAkD4FiRakq+QBG3eA
         aOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799593; x=1792404393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOkAEGZ38cExqY4JKO5ThXkSV4YfBritRUgr2RuPIUk=;
        b=Er093CE8bXqegZS65ZJVy6Wb0vSrTkfzkP/Irh/pELagfVyUANTmguAUdhABVdr9KA
         alEziQOlhUTr802FVLolg3VW5SvPQq6SorSpwG86OJzlICY/i3H17oXCApF423IHULVP
         NZN02TGGip1CyWJjXHdNcjMxvQ2lpy+ZxiEKsBSLEQG7wz6reOoFWq+pNIT88f0LnQ68
         HNlLhkD0rRJc9wbbP8MszC434xZgWCUuKiIN6xm5z+33Nag/s1V4Wwlj8MZvJgDuO8qU
         3Z/HJMi2AY0mKDhY5jUkmquwnuOkFcrbuafLSnbTC1VrxdaNBd2OMimAe2D9nXZn2vj+
         D35Q==
X-Forwarded-Encrypted: i=1; AKwUvBywwiyvCya+s6GvC9oBSiREss38y1vFVMGIT5G25ZMpLtki9GtPVdQure8xQt5XREYZfxws0RLpg638RK0PUDynL62F@vger.kernel.org
X-Gm-Message-State: AFq9FYLKsKxXlPhPhxRDIW1DgbDarKcRWmz6yXQeoOCPrlpD3PKEMsj9
	RwX932kRX+MkJ3U5sq9S1jaf1LPicf/Z9vS6EMFiUGH1/ELPXkSebbx3
X-Gm-Gg: AYBFou1B7Z/CYcbiFOJ15Bz/ScxEuCKTWJTaMUbJD5wUCQ8NJv533T7BpuKg6KYy2hA
	/SbkqpyAZedabPNvXNssb0mhbr3WgcpDTvzQSmKEuUoJE5xjWs4XsB+reWZ+yWW4be+/dKFuqto
	/f59gdP2RNUvWliI+JR2vzoLGvk1gCNFR8nVtp/RZwicdI81pMegURu8sx/G6YBCo8odZkDHQUq
	79tiF/i64a+Kdprt2xDwp6aoj78rECQlS0IOZOq5Vbz4adQ75LEUqEK345WNcmafyQ3Rl/5infN
	bsbgNSD0rDo537F+pzILgdJxeIJBgdG8MMeeASKx1yXqQZ5roXtZl96dsjG1dJIHfEGUc1mvRPG
	6tU57xExJabaxdV2HvbwtUaG5BsMRwSCOgLgLkaRwcHxKib5uj55ANMw1ghswblPOZCByDMHpkq
	wrFfOrOvOKyiIAr8IhxzobrWf8IAsplcrOWeRVY7mnJMeUMPYMZOOfPwW33fJH6octno6Z7Q5/
X-Received: by 2002:a05:6a21:46c5:b0:3e1:1689:1eb8 with SMTP id adf61e73a8af0-3e16baddb4amr8423622637.2.1791799593094;
        Mon, 12 Oct 2026 03:06:33 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:06:32 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v11 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Mon, 12 Oct 2026 18:05:32 +0800
Message-ID: <20261012100532.19612-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012100532.19612-1-qby140326@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
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
index d61382ad4a0b..7c950e688988 100644
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
2.55.0

