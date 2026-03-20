Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56C43A0E8A
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 23:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774050987; cv=none; b=rZcKFZUr8TmWl2RIMcd4WSP18OuAsxA4qQMuOsQ8LYllw0KysP2yrE0wWjSFNdPEcKz/MVjWIZd7dmVvw3nwgX+Zca57InxVtEfIhXqCde1MfIIPk3DFyas/YY7zsLRLzaYCu32oafsEVBI7BNAtbXutaM1XV1I+/Nk8pV8JOM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774050987; c=relaxed/simple;
	bh=cUQdFgJp+vRzURST+mEj40buJgJjr19u5nHUQ/zSxsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i5rvaJZBGmyoujNtPO7+LVzxT0Xr+Wwkui1uJFMhHL0RmSpYvkNxeloRBv+BblD+xCBjpTU5rP4fgiQC/9sYsn08eza95WQIItCnGOwIt6IzTIqOgC4My+JDizarCGIxqmM3rXHGv2G5MD5sNEatZP3uXc/IEFKYyHTBlmU9c9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gfIszpX1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gfIszpX1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48533a598fcso3396585e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 16:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774050970; x=1774655770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMegNoYPQ15g9bb1XM2RAfuMgiTFEwFZRaFEUS/laHQ=;
        b=gfIszpX1THsfW7/L0pT8qtX/636+zxwq7Ne6oduRu2N9F5YlmG0Rztk7O77kowwoiv
         NG1i6eA5aCJJkFtRWXJFKr/SZO0YbknBtnYO4uRzVF5TpZkdBeu/SOOXpi4ps0wiTwW6
         A+qbkYoLd0HjCTxiCljaMFB/hdo9PCubY6JKtViL80Df2TQprq4VguxF4Mn/8KScfWLf
         XA0vA9NAydB6U6LZcVoQzDGTVfJ9UMNiBYPtm93SfwcyvIYovhjGjzNUNA2Pw1swf8fX
         Z5ZT5x+hgy0reJQQMfSdesK1Ouy3sE72ULNzqPFtf4nUHQgKlskLOmjsHdE8p0qrOCBU
         zY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774050970; x=1774655770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SMegNoYPQ15g9bb1XM2RAfuMgiTFEwFZRaFEUS/laHQ=;
        b=TmKyRNs9ztrVb1biKynIumuRbtX2GfSj9lhr8w+gM8U2Fb4HJgMjo+HT8mG2fZ8bnW
         fuBYge6GWJ9/fvaeK3pPSEh1Fre58VmwzgrUfa/T9YhtXOQJA0zENjRIxFaZnTMAbwUM
         78dejtsbjDzt4QrFggcC8yJxAsNTgbH3r+lmJ5iT460FsIiVBL+1HXo8hmrFTEmR/8d2
         4R5/VGjwr0jC6cKDe8rcRt11EVlRGjyjATjkARHqK7dMPV6mykl1KdPyKwEHFgSqb7d/
         qftS+x3RmLAFtDuhS8iLdSkfi1WbSKroQMGzNQiUGvF4CF0+quTuch81lC7LnYDTFx0G
         NRTg==
X-Gm-Message-State: AOJu0Yy/LqQpbb3WOm0TaXWiaT921H+B20h7GVwCE/Qxaw5fu3qydsIq
	gXU9gE75FSTZtULMgQthDaoitA5nYnt9CYAGOBIhDDmZhqPuP3umBdLfkBuw6Sh9pys=
X-Gm-Gg: ATEYQzzC4EaiPMEGhtX5wb3ln4P96cI6AaqEbI+VuS61bYh4p62/uO1fu8hQSmlEtHy
	oaEWYqxbc8mkX4DijRmkGT3gIqP6mQXBgJDmRV33IfprcgCPQ/I28OHm8MhYYHT9yjCIXZS7JYe
	LIBZ0lH71RM+GKXWn3m+WjJodd2CCDk7OLAYoxOlJwmUVoNHcJcuioATqvAd7VMNYJWzNoQaTpu
	Jh8KHcwCdME2MbqKQ7yaiaPHQHKBNbz2clSQV/CuPOE73j/N3CrZC0Okoudyv5s2E9wdqbTupxe
	WcPwypcjVzo6V0Ne012OrI/izmWUsmdCmcdBcL06SUVJVznQ+rjQxgctzFmpgpu8D3ZBj6XGBii
	FOtAFf4/cqi9Dibpf9MiTkkNCkSp2lTcnkUNOvwSbytYM83FNEASfRTPv+4CsA7NdSLSDCQfKOC
	kej4d/RzO+/kgwOHoVti/Pgsek7tJdDcGR8i9zkGtPcEL98A==
X-Received: by 2002:a05:600c:138a:b0:485:3177:d805 with SMTP id 5b1f17b1804b1-486fee29279mr39897345e9.7.1774050969662;
        Fri, 20 Mar 2026 16:56:09 -0700 (PDT)
Received: from fridge ([195.174.58.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470c239sm9663418f8f.27.2026.03.20.16.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 16:56:09 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com,
	linux-kernel@vger.kernel.org,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 2/5] platform/x86: hp-wmi: avoid cancel_delayed_work_sync from work handler
Date: Sat, 21 Mar 2026 02:55:54 +0300
Message-ID: <20260320235557.56298-3-emreleno@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320235557.56298-1-emreleno@gmail.com>
References: <20260320235557.56298-1-emreleno@gmail.com>
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

