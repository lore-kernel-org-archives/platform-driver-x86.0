Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97F637C91F
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 19:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774206436; cv=none; b=nKxm+gTECIlfjNnphNR+nxPaaoyH/yAXP+Oo2rcalfORjBZLGjnT5lnOp7BxTdW2Wss/HL/HOZ3Y3IWzkrGSE0cxtUvQ1ddxNhD6o8YSZIZhIrwHOONSKhYVQEiakZGGHDji4ICg7WFElTb9kYZaWt1U8i4vAe8cWYkXDkN3Auo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774206436; c=relaxed/simple;
	bh=cUQdFgJp+vRzURST+mEj40buJgJjr19u5nHUQ/zSxsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJbY457WhuKctP5WvrPyH6FDky2BcIG3yyufY8sVdPeHQVTBYfpW7KLOnr6xe+pNxLD5O81cO+y3y40sSnF9THBkrFsTYer+hhFTk5e+BsSj+y7CyYwZrl8Buo/z0Fum9G+W0LDh4a6GFyHinHMJ0zlx4jYS+dDb9lxfNFMubuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpE7PO20; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpE7PO20"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48533a598fcso4932905e9.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Mar 2026 12:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774206433; x=1774811233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMegNoYPQ15g9bb1XM2RAfuMgiTFEwFZRaFEUS/laHQ=;
        b=VpE7PO20RaA12vy8qad625wgY5ngwlA/fZLv7AumhMvhQnASbnO9T7fkje4n2Nj9u2
         ++oYH2PkYYo1oBDXnClSWSZ6JSZuFyJc9kFOorMHFTSbDVueN643yUI+JZ+Klm0NX3YB
         Wx7nMw5lzejQ1DS/6D3CnbE4HyG6jfveISMyzSwUjzNIx0Mi7zds572YTUy1KM5Xgnl1
         ZUsRGtszDU2AYa9QXWZBvjmQtGs7a0sibX5iysx+A4XU+1wM+MUSnX9AWs6+4DHU6Nbo
         4OaChUSDAZAoowzYk008HZT3DZQtrEZI7X9uouk0MHylxtuQYeeuqmmnZNfTVRqKGiko
         bsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774206433; x=1774811233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SMegNoYPQ15g9bb1XM2RAfuMgiTFEwFZRaFEUS/laHQ=;
        b=NLZGKmdMdTmkWS84qCXwTtTDMCE2E54+y4rFTkcEgI42ZE4hlSuYpLIBUP0PbwKszS
         VDOnAvZXwLTYUsMaM66MJ8lcJpa5eb6H/hvBAXTKRErUF78FGZ6fpWGbq/NpWn65KAbW
         swltq8ED3HUuIhrOSeGPYrG+HXq2wHkTnIyL84EMAyCqAzoSZRsyP/WOwQGsE1fCsc1s
         CO2u104cJ+2mo6MZmvRSFk0hnRoRPgpHdDdyD0LIsr1FLf8FwC4mYD7jdxjCMgMmpORX
         g2D1RaMdKxsLrkZY/ydooMDpsXM5ahEmyRUbbHBx8lK9jzLLoSO1MnViar7JaT9scfTy
         JiDw==
X-Gm-Message-State: AOJu0YzuU0+lPxjUnaR67T/ZaN+VjQULHVos3NoapDltubfrk8peuANh
	/aRZBHY5Cib83fDZldK5us9BjyzZVilbrP6uUMDYbReSXrtBqUxzfowhFj09RDg3Hjr+8A==
X-Gm-Gg: ATEYQzyuyTYyYIdDr3gPVreWh+dMqRgVIZCRRFDxPSBeZ3I80+/KMo3cecDHareU0Ki
	Lh5OAeH0poxONkptiujC2iVwnPjKoY4k+WkH8JNBdk5nY8rMHJ6Uxzqk8WNxBKUfC4RvB7oI0bj
	xmlfDmvHeaMCAz3edsze6x1f4hJX0y1+VXNfQp7RJ2v39Fenn04wKyKmJK1eKL/VmhcUAZaE82R
	rv/Gq4X97BTMyxZ9OprbM4mj4irSlj5mMOr1kR6HLYOVZiAfNJsAlqoHeIg7wivM25i/emBaFZO
	zOLTV0yz/XVaYDtxapwNcrsae/eLQhw3+gIl6GzzqNFoEOzHXYhPBLFNo5/zcgWVyju0lY24ip/
	sl6iWsGcw15HwQyzFwa5IhUPbtXGzEpBCRv8nPkMkaAtdAbB5dzpP7NunD7uynMNrcRfA6Vh0A5
	XPIwYcsQwqrwfE+s+bXoZck9pDdCKJeB3OlArX9tv88huGe/hNzh3Y3wunEwQFY2zI0Pmuhz8=
X-Received: by 2002:a05:600c:3554:b0:477:aed0:f402 with SMTP id 5b1f17b1804b1-486ff01d81amr85441425e9.8.1774206432823;
        Sun, 22 Mar 2026 12:07:12 -0700 (PDT)
Received: from localhost.localdomain ([46.155.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe868cb1sm63340595e9.5.2026.03.22.12.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 12:07:12 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH v2 2/5] platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
Date: Sun, 22 Mar 2026 22:06:21 +0300
Message-ID: <20260322190624.35162-3-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260322190624.35162-1-emreleno@gmail.com>
References: <20260322190624.35162-1-emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_apply_fan_settings() calls cancel_delayed_work_sync() in the
PWM_MODE_AUTO case to stop the keep-alive timer. This function is also
called from hp_wmi_hwmon_keep_alive_handler(), which is itself a
delayed work handler.

If the keep-alive work is executing and the fan mode happens to be
AUTO (e.g. a concurrent sysfs write changed it just before the handler
read priv->mode), cancel_delayed_work_sync() tries to flush the work
item it is already running inside, causing a deadlock.

The workqueue documentation explicitly requires callers to ensure this
self-flush situation does not arise.

Replace cancel_delayed_work_sync() with cancel_delayed_work() in
hp_wmi_apply_fan_settings(). The non-synchronous variant cancels
pending work without waiting for a running instance to complete,
avoiding the deadlock. The synchronous cancel in hp_wmi_bios_remove()
is unaffected and still provides the final cleanup guarantee at driver
removal time.

Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 0cb2a2b31998..41769c0861e5 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2365,7 +2365,7 @@ static int hp_wmi_apply_fan_settings(struct hp_wmi_hwmon_priv *priv)
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

