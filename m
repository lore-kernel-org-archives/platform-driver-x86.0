Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E93425776
	for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jun 2026 04:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781412856; cv=none; b=XZzke8kDTyAd4RsKjR2I3hJ2WmSb2AQZ77dqbRgr0841JUVZt8bxHm2i2F3oXqvZLSM0wkZbchkEy3kV8T2M45G7f8Msy32qhkZSbz6wx1w3yhHV/qmspPP5/hi/X3k1bVgg6TCcOycuagVQdFJUcXKWt29RUJU59H6QLfi2s5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781412856; c=relaxed/simple;
	bh=c4pEfoWDhWE8jZi9anj93tJ4F8Zl5tOqhA7faMzyB+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAYNo9ZBS8ln72nLXjQFdfPcKNZ3yeK9eJvuZ+qNAyLNe9LAdphwIUnA/JyIq8bBvttC4j2hYWIwCWGVRn8f4QQOI4pugECkmW47AfDRg2zKmZVskr3adPuuJWjDPxmGRsZQfzPmC85ZdsoYsfPcxiUqywffZdmoT0TmE8SUprw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyxTxYUc; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyxTxYUc"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84229481d44so1090690b3a.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 21:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781412853; x=1782017653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PDspLBWU0zmhscYIXZ4nd2JbJSwrZkIPTEIbvNZ/tPo=;
        b=iyxTxYUcKtxH0InJeOUP767xcP3BOBWcsUWv11jjbAveZ3e/W5srA1A010Y4UwBoaZ
         7LyiXt1BP0TDGzFYZDHVxH5C1INMu0juqTImMNV/enVMpsPABIq3xJ0I2KPKMjj9u695
         T35YcK9Mg6TMEWcVX1nELB/4b56/EDx2IJ0Hp4YOc+Ju6ZxXWvE2cOGxWEyoMQ1tFPe0
         Wen1duT7+cngCf6u+rLZo2/a0tp8/gkRtFvlDET1NzXiPG7S5fnPur/SkHQcVcVYN26r
         tkkiW7ZfLQNMq7aR37KTHtKL0WQURIN7ZDRgI7r30JfMJzPOaFDKj2SEqMW/osvbzMa1
         7CMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781412853; x=1782017653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDspLBWU0zmhscYIXZ4nd2JbJSwrZkIPTEIbvNZ/tPo=;
        b=SB2wKCrbFhdbo96RuA5R8/5AVy/OkHwsX0ioTcqXU1ioD0834b89eGRtg2J2oOaMWB
         c3XZ6nPAmGPkgKPRYYe1VJ+o2enAY9zvkSGfpVt6gX+YImiSxZ2VPkNNnp4QvqxLxuAN
         HnHvAcvDrEeqSM+4JM3hpYJ9bDep+7LWiI+fjR9/y/hIW5TaMkkG5NqGhfnvhSd2WuWT
         MM66WrVeb1ChwHnOs83NPQEGongYaqlkko+mAVvLyGgeySUrcjJwfl4iO9ztwa9w3wgM
         OmVJby8CTkfWTP/3RhE/qQHb3A3QDFV81TNP65+j232FqyJN+SKlvAj9CophUU0Ro2Rx
         PtJA==
X-Forwarded-Encrypted: i=1; AFNElJ+P5SC4LnqMaWkleU+DCYHGeOxLNMeRQJ3ZuEP3ADvZ2pkz9WNVdzLBSLyRctw3V1OFRwjS57AdCDKfucgfCySatDuL@vger.kernel.org
X-Gm-Message-State: AOJu0YyKmtpOJMTvrR6qdZDdwM/VdDQuM6QM+FQBGqOa5bWiXDXnSyCF
	ErFWQJSezPSJ8n4myoxX0PRUPbK7nBue1oC7cALAokC7QRStUWAKC9k2
X-Gm-Gg: Acq92OFOViR6iXjF4kQSNA9MFlgdSfFEWQJNjUMtFaUU7/8wRvAJhvVYsIT5VZ3ZUSj
	qQP4VEzQ5XJxX55InsrphDWn6d2+bErXJKplomN1LGA5LX/ppLkxhkgv9SddN9XdXa42aJCAkAI
	gamw8z5rgIeK1rJ+pJps6oP2zwIA+zT5HcvRHvv0AV6cyUpiX2R6M59Dn5s+U6lBubmhBt/0xMU
	8hby8+EGSizO++nXUGwux+dpmphiFbMmy6czC3VNfwWayn5CRQ6soBAPinw3f+x6EkbPvKtSfpc
	LOo6Kkc9MQ+DYJC/8lp7HjIwj20MwGZJVVIhOhESlt06icJtrEkH9iXDoPzGXjTBai1l6ZAICA6
	Ft1SFaLxGDQNbepTs7HKNwo0hvI++Ie88EwTAhp4dXytsDX6jYt/vMVQkaNycpG0/T9DYcktBdC
	4BuoTVxHUBSlGob1wfJLPynTT4lgAiBzxfPEDgHX4u9N2axkFwsfjz1Uh46G1egHWNWl7zWVfHN
	6f71gxROaSCtBGn
X-Received: by 2002:a05:6a00:35c7:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-844e1a3df2bmr6837677b3a.24.1781412853538;
        Sat, 13 Jun 2026 21:54:13 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b00d3f9sm5715031b3a.41.2026.06.13.21.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 21:54:12 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Prasanth Ksr <prasanth.ksr@dell.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Dell.Client.Kernel@dell.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: dell-wmi-sysman: Don't hex dump attribute security buffer
Date: Sun, 14 Jun 2026 13:53:53 +0900
Message-ID: <20260614045353.143500-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_attribute() populates the security area of the BIOS attribute request
buffer with the current admin password via populate_security_buffer(), then
dumps the whole request buffer with print_hex_dump_bytes(). This can expose
the plaintext admin password in the kernel log.

The same issue was fixed for the password attribute path by
commit d1a196e0a6dc ("platform/x86: dell-wmi-sysman: Don't hex dump
plaintext password data"). Remove the remaining dump from the BIOS
attribute path.

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
index c2dd2de6bc20..fea97d6c3bf0 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
@@ -84,7 +84,6 @@ int set_attribute(const char *a_name, const char *a_value)
 	if (ret < 0)
 		goto out;
 
-	print_hex_dump_bytes("set attribute data: ", DUMP_PREFIX_NONE, buffer, buffer_size);
 	ret = call_biosattributes_interface(wmi_priv.bios_attr_wdev,
 					    buffer, buffer_size,
 					    SETATTRIBUTE_METHOD_ID);
-- 
2.43.0

