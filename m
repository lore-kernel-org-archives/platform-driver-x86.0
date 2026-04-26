Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B8C224F3
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 16:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777222256; cv=none; b=bL6rPfZNfB/m2JCKOAZaU6ADfmdcZI5ZHKJxdKQpqX15+PAYiov1TiBiqJXHedQOQGn7BEQNml+2gOIDDCtu2bd8ifiMseveQ+q/YeJC7ny4ruugRkuSRWuv8M+dL6+fM1AYzhAAwLsD7dfCdkAJWBvDBW6ut9wNfhSr+7293w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777222256; c=relaxed/simple;
	bh=V6Nfk52TQQCQjoetYj/INSS3ZdBJaRTflIgoGUHmLu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JU0nP97/jplq+k2Eggszwqpl+Sh0v/3rwFLs10JAsc/d/pMdX4KWlhtw70LQWlcUtBJq8lwlm20Au5oBjoFzcSUMImZjljRJSoVmpfY8wu6O5FC8ozo+0qaqpgnyKtWUR2tcwXpGPH6TlRe04gBSajS1sxz3jVUMWCvIaV1IvlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpCVYNC7; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpCVYNC7"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso3419668a12.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Apr 2026 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777222251; x=1777827051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKPk8+mfHJCvfB6gJz0v484ZpE6x/XUkKSomVW1TQVg=;
        b=fpCVYNC7It/clzcVjApDpkzL6E+TIA/4ce+WayATk/VYOJKOaGqJFfEdmmrNMynIBv
         Ygq3Q9odXURHkPPBEr4tTT2G4fh1vIsqZOb1nqNMYY33rXWVA4sANu08BlHg2TIlzwjy
         zg4rEifaY4kkfp18qQkF2ol3xa5amqAP/VZPjf+vgPsDdmq+1DHmaqAkHWmif1suK373
         CZe7C8XU6nP8AOXK9ayfPmhzKTKMXhq456bh667HNs0r4lwSTWSAFGTd00Ojpac8Myjn
         J2Wlux/q0GaDen2w/SCH4lFixc9kclXGX91vgcWA6ulTGJ/8zOLt8sJGs4lgl48Y7oN9
         XnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777222251; x=1777827051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lKPk8+mfHJCvfB6gJz0v484ZpE6x/XUkKSomVW1TQVg=;
        b=onfPVF7yZWo96gydtyyxD/fz03s4xYdptkPVisbV/7eR/HGig0cpzVakpwLCTt3FCk
         hw5cxsWHWqgaragYqZIZZnFQ5JPRMOm3iXN7cpoxlQd2+59wpbN0Z+qsO8d2mvEqYalJ
         iC5Qf+NnADOdbfVfeX4nKjExlHTTw94MWavkv0T9DUR6WdcJr8FG8eNHZ0wdmpoghpNW
         vE0YMqG8sBxiUSfx7p4IAJLp979tgrhVf9x/olzwpJMiNp0Cq9+uYlAC+I0bp0H2+ECv
         eENQUmyi26fXiPnUc74ghcASu6s3IBQu2EB9uP04UFIRPrjZhsNqaLzuTdGOqMFFQnmf
         I6cA==
X-Forwarded-Encrypted: i=1; AFNElJ99WTfmpFW0+iK5wztHg3JtT2bqkcGuHBGOhmBd0DuG/PdPXW8i4w4BblQrz2A3hjNZbpE6M+tnJ/fXN6KoKnzda6hZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzZHqF63M11OrHQEW24AoKBW8HKbxJ9EHRl7aZDrMhYCwT8/xtB
	Tj30NDEfdlF+Glp2NlwETD/kFu5LZiijOUBAwfcbEKSV3cD3VBElKiD8
X-Gm-Gg: AeBDietH0ypxPF9ppQYzjuqek0nI5QWfX/6zsjuyzHqXhDesbG787jHbv4fo0W7x5eH
	Bw8afzIVF8ypaQ/eo4JFJD5W1giXD4dTbNw9d26oL6J4IFikhSy27zNI2UHxA1iWhWjcNHWNz+V
	0W4YbQYivkWRDhpsrS9x6NyP1RN1HVkerFeH6GWdrb8pXsVdV3lH28RPpKcCJsyP8fZeWyr2c4I
	DvyI0kajEVQfYSb2pNV0XAoffnAUAKjtE74Z38TMEVY4K3J3O73WjcsPkgDEmsF0kusZtzg5wo7
	2ScvvIRQMlzMWvfi+0bH1/AqNunijkz5t+MfBYENbp2JwU5tUSW8Crb7Toz5BelvzeMrsHo/WqT
	AmzwYYxcsJnGG/6ymQBZVjusxolIAv54oTnYLLmJ3G0A8SKtoz6GRd41OGKpBno9UKU5nHWh8Pv
	bvJMimSpDRB5iKd9H1vY7px0vY+SW/Da1bmJ/cNWkPGvwAepE=
X-Received: by 2002:a17:902:bf0b:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2b5f9ede672mr282186845ad.15.1777222251037;
        Sun, 26 Apr 2026 09:50:51 -0700 (PDT)
Received: from LAPTOP-DV5I1MV.localdomain ([27.19.123.93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa30047sm289178955ad.28.2026.04.26.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 09:50:50 -0700 (PDT)
From: Yufei CHENG <cd345al@gmail.com>
To: mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	i@rong.moe
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yufei CHENG <cd345al@gmail.com>
Subject: [PATCH v3] platform/x86: lenovo: wmi-other: Fix uninitialized variable in lwmi_om_hwmon_write()
Date: Mon, 27 Apr 2026 00:50:34 +0800
Message-ID: <20260426165034.9073-1-cd345al@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426145907.7295-1-cd345al@gmail.com>
References: <20260426145907.7295-1-cd345al@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the flag relax_fan_constraint is set, local variable 'raw'
is never assigned, and lwmi_om_hwmon_write() will pass uninitialized
value to lwmi_om_fan_get_set() resulting in undefined behavior.

This flag allows user to bypass minimum fan RPM divisor rounding,
but assignment to 'raw' only happens in the non-relaxed path.
Fix by defaulting 'raw' to user provided 'val' in the else branch.

Fixes: 51ed34282f63 ("platform/x86: lenovo-wmi-other: Add HWMON for fan reporting/tuning")
Reviewed-by: Rong Zhang <i@rong.moe>
Signed-off-by: Yufei CHENG <cd345al@gmail.com>
---
v3: fix broken format
v2: rewrite the title to be more specific

 drivers/platform/x86/lenovo/wmi-other.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 6040f45aa2b..6c2febe1a59 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -349,6 +349,8 @@ static int lwmi_om_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
 			 */
 			if (!relax_fan_constraint)
 				raw = val / LWMI_FAN_DIV * LWMI_FAN_DIV;
+			else
+				raw = val;
 
 			err = lwmi_om_fan_get_set(priv, channel, &raw, true);
 			if (err)
-- 
2.43.0

