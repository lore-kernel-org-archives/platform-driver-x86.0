Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AB03D45D4
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781514659; cv=none; b=AUEOI8x+EkGgS46ATyGC2RrjxGN0Mun90g/FcPapRb9joazFDpjpIcXgOROQQmluUQFxP3G8mxoO4lYz1syXSgBo3UAuWAqrFfy8R3e9YaCW/vlSBDIS2GqZVLJB+DSKT74nXH3+CdVWQ12DSd95PKzOi9c7BcKZ8MfBg9BR6MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781514659; c=relaxed/simple;
	bh=KBdIJX6CsxhgZXPDXOxipAlb53aPZ4MD+Wb+Il+I/l8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBTOa3A9YblRzK3hZVh+OY8yCCLAX/G0ORpdtLB6TIfcu4W9ht6JzfwgnAtQ+Wdxy8NyrbDJYJzpFdHZ0YlM+AI5GQottnwF2Hbz+zU4RJXtrUyQPiWTsuHT67yV9nusNbE3iFEzuMBYJQsZfTrcwObbj8RI+gZvlekuloqzQOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szGZOObE; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szGZOObE"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so1498961b3a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 02:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781514657; x=1782119457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAMSs4k+8FM9Ue/Dq7rGjRYuTh3u8CNPNHnVp1Lxz6o=;
        b=szGZOObE+IoO2qp9U+gN1FGKKsJ3KI6FyjNSlmM8WlGxPy/QUyHGONtG+JeNYX68vo
         7tXCSFogjt6QYuL5Pnwqzs5NLzu3qmkqfqFTsVavu/fA3l9XnrpQvPb2OeJMpeqJbAKr
         OxazDZVRNIFzEl31Sof7sIt/YkvW7X7045XVXYGcW5J8nOmc1f5A/st592iJxA/RnQbz
         /Gd7fx/9rcwA71GZLmJlEOOV7Rys0dMceZ2UUuziDvckyTuYu9QlUFksJ+7JPewREiEO
         lQ7X2/rPvV6dWi/2AZY3XnvKt+HZL4oljJhpK98OK5JiRc4ZCqQDxE4doz6Vy8ynlozM
         XYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781514657; x=1782119457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hAMSs4k+8FM9Ue/Dq7rGjRYuTh3u8CNPNHnVp1Lxz6o=;
        b=Rit0ATNPuZUCsTTNpwpv+ZUi2myP6i700n3GCmNoGO+nV/JyjeedKTkxNfUgV7cdd0
         gauHvCwXYT0/c3/OrpxS5unHkzKFpqwEa9ArTtEnLqTODJgD9r3zuU3191XWlMq8xnAe
         +XTf6uA26aX9Kohpxk6C4002+sUTwq07W+ZaH8YbwAevDSK2SEoTtL3A9sjVgmSVMYRB
         nbF5XJEya9gH27vbQZr8V57MkfI1aKEcBEM+VP1c0WjQt8wfBJUEJsOmPI/NPk6PmZ7+
         DGQ7ktEV/KqvlbKIGs6apLhH25CMC3NRGKNfYe8svgWmwUihhE4/0XJtZTXeXLhgNmgd
         fE1A==
X-Gm-Message-State: AOJu0YwvTGuhbnEWskdg0Oheqr7kDeT9rGo+FtOM5CwO3/yvjkTKqYCy
	ShV9UwMZPcnqFPdZbwkejDqK11mt8iyzimOfBAsuHmlsVLksVQhYqTHas5GpqVei
X-Gm-Gg: Acq92OH0RSCMN3eltH5eSHOH/be6TGY7hSVydsnN02tM/9aMZg4CH4aizpf81sG5myV
	8GlVKeIp4TqZQY5ZZhfEV8UjXPMt0b0e9EonUfl/glH14Nh792T6b/gMQk5AEKhk3Vyou78jO3g
	yYfcRkaLpMtAap94Xdb4Dnr2lBi0cEWzICKdoue28Fk0+xx0qWAAUKMFAV8ynH/xvxzcuQuMY6d
	Ubc5XBsXHHqlClqkINmef+pSeEG5U2XzzNRw7rwdvauNwebdSiC5WPpg0J1byng1UO1MZ/0iz/M
	RhWw2nb3dQFUhwXfdnGoEwUb1NpWS2HcepHvG3VxDYEmtRpu+OiTG2PtwhgF3IYKiOIqWM+rNQo
	qrbZAihc7iUavvOt4i39S1VmrGRUuzkebRpg3EO1z1Y+E4a185PANlz3eItPM86/tklJjG6ZT/5
	CdUC83rQe5jdSBpwFP48YxC23zTTZ/kYA46+k=
X-Received: by 2002:a05:6a00:1148:b0:82c:1cd0:2f7e with SMTP id d2e1a72fcca58-8434d0d088fmr10210628b3a.20.1781514657493;
        Mon, 15 Jun 2026 02:10:57 -0700 (PDT)
Received: from pico-cachyos ([2401:4900:1c39:172b:de82:f342:993b:860a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b00d4c7sm9392459b3a.40.2026.06.15.02.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:10:56 -0700 (PDT)
From: Radhey Kalra <radheykalra901@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	krishna.chomal108@gmail.com
Subject: [PATCH v10 3/3] platform/x86: hp-wmi: Add Victus 15-fb0xxx support
Date: Mon, 15 Jun 2026 14:40:34 +0530
Message-ID: <20260615091034.987029-4-radheykalra901@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615091034.987029-1-radheykalra901@gmail.com>
References: <20260615091034.987029-1-radheykalra901@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HP Victus 15-fb0xxx board 8A3D exposes the Victus fan table and accepts
the existing Victus fan-speed WMI control path. Add a DMI match using the
Victus S thermal-profile and fan-control data.

Signed-off-by: Radhey Kalra <radheykalra901@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 11de5c70c..0dcf29012 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -234,6 +234,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8902") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A3D") },
+		.driver_data = (void *)&victus_s_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A44") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
-- 
2.54.0

