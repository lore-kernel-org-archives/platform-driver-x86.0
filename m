Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F141B3BD246
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Apr 2026 14:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775571942; cv=none; b=tZNURajnmqvi2lmStbKQaHUSpm6p6kxod77PaLvnWGsAXBTCxLNZM0jp+L7dF+MFlPpnFgha2e69Omk8kc9WCw7nDyOwGdX25fCLDPAWvcLDmIbFN2WLRSSl2GD5fvfhqTsMDzqq8WwkOAstfJhRn1VQslpxrh0+tAXgLYmF1Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775571942; c=relaxed/simple;
	bh=TfNxeGb9nt4qVFEDy3vSP2vU6t/UvG2YByCxEcAn8sI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCi72PuE/e6vOHeSZalj27ZcZK0MoSpu+w6I25NSWW0Qtlx/yk+sOQop4m34RHCgQvP9qCJwS6Hwkdh9UZ+ScNiEsoOzOKKeVFBexwMVbH/+tVX/5thJoZrxAdLA7e47TVx5q8gqsAEZD7B7avYltNhJtbZ20sRsJtyR/Yx971M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjAWmBzV; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjAWmBzV"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b8822fc05so290149f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Apr 2026 07:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775571939; x=1776176739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kTb1nxrmvzDufvOzlr6MJ8Yqsu0pkzDYB5uLfxFM34=;
        b=QjAWmBzVzs2ez7jWQUrLqzEWHpl8yx5qG8Sq0j05/QWL9X6gMr/GCHeVHeGRY8JsFl
         FAtJnsMZOFaO7CqgU2b/8qNerctEgOZzyECGHyR52AQiDGnLyDDsI9laokvGYxabRDvf
         OVvU8Vj8jxJzB6ObNYf+9lWE8gdnS3cP9jEeQkhnB9GIlXn1GLb2PPfel7Fu4cku6pwn
         nu1x2Kma/8h5iiICWYcsiAQEpbpeU0NiMKTU4/Ke8MH9pnXytHwZ7/bVSBmrejiZ+bLa
         NJX5q+PpzGK3wLVRErXGvU410tH5IPgOAdnB1XDbKnKcYwce8evyQmQeruPAC0zSDezm
         wBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775571939; x=1776176739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8kTb1nxrmvzDufvOzlr6MJ8Yqsu0pkzDYB5uLfxFM34=;
        b=PKFj2ju7eX1iLnD3TM9cBhIgo4gHrsBKaUPPrjGNA9VVMy0kUR0vErkBVpMQLzQ01x
         NrkKpOSP94kOOfTPcUJWComPeIMPlomIXXYNYvE6CX6ZHGBbUbFNgWvZVlXbfnELJvYz
         EaMTATEc50UMcPtqcHbIMmlekx+l6L53ZroyZkCUc7+9JNaeoKPkqVJlfYEp9Tae0mLS
         vmiIFxW/p1xOErdDHCtnxxxlHhnrR4R8s7cro614gFih/F3JiMeJy3LZgeMcE9Bbwpjz
         kyQYlbP87rZSPqiUib/4oz+t0tZz6W36l7IgZgAuCW18AHu04RfQWZ4iumCibTJfyoyH
         RmHg==
X-Gm-Message-State: AOJu0YzO2cRaRb+57KBMwIcza2gQ05wz9RzlcLOxrwy/nWs0nyHd4I0H
	kjFnU4sUHrwGnpoimyempJ5kdMOJwRbQD0P/qIQwLZzr/6QPjDjIDtaGTdc/mBHP09waCA==
X-Gm-Gg: AeBDietBBvl4U8oJHWiH+h74Sa3faEp4+pi+eCOd3BW6ahlB4Se5hT+DQvXRoW2wh7R
	BTQ3fa8tUjVSU87yMnTcQAqYMJr7+IUA5AhH7zwtBa2t/Ys6UQn8LwNV+aRh62bJWqXaJrEK+Ep
	KGBg9I3u96F/BnBomHeBS7oO2/Bb6Rt4HXPRcEuF+cAUzZw8esRvaCVa9QbYqJGoWxU+OidTTnY
	7Ae7nIvx7HgjZfIwHCUBZ9o4qXKEICfzHPZe9pTmuladzoeJM63mFfhF+nlAfcNMxMO68U2JFIh
	o9DEJ0LItKiBaY5/eECw7Q6CnV9JfR1EEJZCjERSH9FP8vNNgwOWMRrCbKFj4jcYUmSxUxI/9Uk
	dQu7RAmueBUM6ymztKxXwM+FYeSngVmJueCb8GI0xRRCaAyhd+DybujpMdnJ8BCCbLI65GZ6xmh
	cWiU2L2HvuKm3QYpabqa9nROqTvvsWcgiJVSpCd6OsvwMEZUQbg12JT4WhJJf/6A==
X-Received: by 2002:a05:6000:186f:b0:43d:4c34:6668 with SMTP id ffacd0b85a97d-43d4c346772mr1883002f8f.0.1775571939138;
        Tue, 07 Apr 2026 07:25:39 -0700 (PDT)
Received: from localhost.localdomain ([31.7.38.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f1a99sm53489990f8f.32.2026.04.07.07.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:25:38 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	edip@medip.dev,
	emreleno@gmail.com
Subject: [PATCH v4 2/5] platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
Date: Tue,  7 Apr 2026 17:25:11 +0300
Message-ID: <20260407142515.20683-3-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407142515.20683-1-emreleno@gmail.com>
References: <20260407142515.20683-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_apply_fan_settings() uses cancel_delayed_work_sync() to stop
the keep-alive timer in AUTO mode. However, since
hp_wmi_apply_fan_settings() is also called from the keep-alive
handler, a race condition with a sysfs write can cause the handler to
wait on itself, leading to a deadlock.

Replace cancel_delayed_work_sync() with cancel_delayed_work() in
hp_wmi_apply_fan_settings() to avoid the self-flush deadlock.

Fixes: c203c59fb5de ("platform/x86: hp-wmi: implement fan keep-alive")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index eac39f68d762..79d6bc3cd223 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2384,7 +2384,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
 		}
 		if (ret < 0)
 			return ret;
-		cancel_delayed_work_sync(&priv->keep_alive_dwork);
+		cancel_delayed_work(&priv->keep_alive_dwork);
 		return 0;
 	default:
 		/* shouldn't happen */
-- 
2.53.0

