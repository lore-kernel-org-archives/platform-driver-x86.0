Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381823B440F
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 04:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015499; cv=none; b=dMZdVT5imOm/yzbdEAgOmWqbU+FPZ17hhRQ1tGQ9r7V7py0LlOJZcFf0YtABH4JKsO+TqXmzILR4+5UNzxDNqVS6Ph5AQx26IvSnUhycKmbENqNbXe8qH7qDKzozbuAeJkZ75HZp9yS7luPA4Hwmh2sL9gEuGDHv8aMxGOWX4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015499; c=relaxed/simple;
	bh=ned8Xd+jYD+au5qlWbCyATJxda5xlf7aMTyVCxHleog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9a3xtOMMW2AUrkmXp/xjuJFGXZdkM161/U5NjVSpIgKZVBnoiKabPuFk6KEhsGQpQAH64xjeAN0JgJ/ucLuGL1W7RWXMbnxOMtZz5n0GY0BEvsu6FYl+mst4zJdzHtaiYPAaEwk9HskBPQcdkkNfycOZMbVh6ROAd2ASaT6noU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DenEnDku; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DenEnDku"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25187so471531b3a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 21:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015497; x=1789620297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/G/XQxY0D9MMJrqs9kzQqPGg+nQIyZT0ewQHseBA1dA=;
        b=DenEnDkuXOrq2rTXjwSA7R4zMnHz1IP+Z+v3uH1HL7EtOIygJeNzpjNVy6lYuCK91H
         x6ED6WZf7/LBw/JYZi6aI7GjBF2tybFwkFgtseH0WgeQBxkPKRbo3K0h8Bb2iOxQAnFp
         5D01ozYlspBCQ2L4cGVy8SZewrkiPb4lhPP/qhqcYdcduBRNaXR+Os+K54lrF2MQnu1p
         9Z09fc6mbF1puMYeqO+BlNqCLk9w/qU7cwltXY0vSoe1ZAVfdCPBSs74nG6FIZ8NTshd
         hK3+k3R/rHsYZjOnbEorqFrBoreGjJYskzZkrgHSOz7Zu9ABAYFamdA2wWwSDle3GeoS
         O2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015497; x=1789620297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/G/XQxY0D9MMJrqs9kzQqPGg+nQIyZT0ewQHseBA1dA=;
        b=Qy37hMMUKdz6CfhLZS9BkNzUYLWwu7ehJtrcQcYQ6EGM9sLUqUNRc7gkpS0FW0yygM
         gnm+N3SNhKAE0nkd1vukDwPudinN3XknLqleTHrgQDkXvRiddemMoeemQqVu5RmapMsY
         qgGXp1UXYoweFOjj2JodDCcO6SQ2rV4rAOXOGY97v+su7MmfA5jOJnC8Az5+9A4ZD4X3
         7zP6s72KrKIlzofQaGMMfajhc+jyM2BhYfZ/9oUS/YQGVRoViWbgb1gojUQY7A2ZIq4Z
         prwht/Izpsbp9NZ9jejgIJuBXmE/cTrUoNgpjgRNk7rAnCfESMQVP3xEYrorHjJrlSRs
         TEgw==
X-Forwarded-Encrypted: i=1; AKwUvBwk2N5PjH+mcfv+fbhmYZm9noCIXHoeAPUeyqeKXsfYxiJeIX30RWwmdPBderSkLVW0UdwRZvUNXoTwBM0Hr5+LnAh0@vger.kernel.org
X-Gm-Message-State: AFuF++nelTcHfBXesvCnvq+VgtqvV/XW+dLJGP8yFboDoPf4gyls60/Z
	Bc5bJwKG8v7tTvcdp9KCcRxnSv+LOwS6992XfkmuQAXayYJFRicmS/op
X-Gm-Gg: AYBFou3iN+tPlQBdM0hrgLcJvXWcLUZiQeJA12KJnf8MozQfIQ2YF0QUBojJlMSZ5M9
	hZEo0ht6rTr00AznTmP+ag++485SuhjCwSNVBYB2KrLNDBfokBr/noVPftFZi0LFVFMKA2qw9qz
	jONDnhRc04FE3WfjmovVyFQFVaK60WFmNeEz/ysFvZj7fLXhoVLvOjzpGUqvQOFzT/kBxxiZPbB
	Nv1sLTuJrYowYLbGRVK2C+W9OZGl3ycunEp+mLYtErpNUxYLr8S9eG+ejUzI7YjyreIH4At9u08
	TBuQNfulbtV38EBXznJ6UjMSG/GFLnUHgfek2hQNeJ03uC3ALFOypazg2pGFv4Xnpbg3DarQOqx
	YFxFGDr0vptTahTW7R7JPF071YaoLuXUCB3GfV2ohOSt4PNWtlA0VigxIayXA7TgIH6q0SmLFAP
	fa9tgo/wDnHxMBMiPGHc3j8ku7zEoGFaKqSaFdLWVVFHZQ7dBKRmvFsQPULwiNhqRC2oMaLGCWo
	kWXbdR7CIBYyPNAkqM5QiKSLQ==
X-Received: by 2002:a05:6a20:e18b:b0:3cd:9f0b:f7a2 with SMTP id adf61e73a8af0-3dacbdaa8e5mr8493294637.11.1789015497445;
        Wed, 09 Sep 2026 21:44:57 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:44:57 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] platform/x86: asus-laptop: Fix typo in infos_show() comment
Date: Thu, 10 Sep 2026 10:14:36 +0530
Message-ID: <6a9f827d1135258ac0e75ce2dd6d05e1cded6d44.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "informations" to "information" in the comment describing the
HWRS method.  Comment only, no functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 449addd1ac7a..de607edb9490 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -865,7 +865,7 @@ static ssize_t infos_show(struct device *dev, struct device_attribute *attr,
 		len += sysfs_emit_at(page, len, "SFUN value         : %#x\n",
 			       (uint) temp);
 	/*
-	 * The HWRS method return informations about the hardware.
+	 * The HWRS method return information about the hardware.
 	 * 0x80 bit is for WLAN, 0x100 for Bluetooth.
 	 * 0x40 for WWAN, 0x10 for WIMAX.
 	 * The significance of others is yet to be found.
-- 
2.48.1

