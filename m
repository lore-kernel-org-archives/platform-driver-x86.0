Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6999C3ACA60
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 16:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339574; cv=none; b=kCDj9NQbTw/bvyKoK4HOgulpi5IcRSicp3fvDwJbSJs5ojvT05D1SUjgJ7DvZcmzoafsNo+qXxom11LUDAktMv91ewPXMjSfHHq05oGBOWzIF/YAz1+sXhbSWCOe6tA4Lmzi0OCuRFuzoQK8BMgUx3iSRr1dzyYcZKBTnQiF8rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339574; c=relaxed/simple;
	bh=QQJdHbFVBJHFCDrLeChsxHNa8N2aCigs8BUP95r4Zkc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c2oYbJGcf/MkBrKkmbRfibE7inIEn/f3dduyqCwLKGYtMbVxdrANixgaEJVWc2cMvYJavVgXyvhMzNa99D5r72QFl8AuM8VL5xdUBfef8CUHSsWwXCHn/EEMXln+DDw+tG62oPvXPtErv7FRL+TR8v9GakdxcvxPeTjuV6MW7m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G8OQI3m5; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G8OQI3m5"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35f036b17easo3106765eec.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Oct 2026 09:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339571; x=1792944371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7V15sRJ8dwoI31++1uINRuoyJkh6H1c9bF9VyuwB2M=;
        b=G8OQI3m5s3BhyVAfygDNHmLbdcXp4WMO9DX1x1Ltu01yICEbKRZq+M0SJzkO8zBt78
         z1LbVT4Ih5yRIpZGEnybLVdRzCxAGygNiRXakSQJhXtF7JMc1ozrRmce0HVXn6MLJn1Z
         yTO6NrNoffpJ1o2WZjORq2qELRnKhDts9B7JkjVN1A9OQuHBMRJQTMRlVexOdwCieIX1
         5pNRl4KnQIlu7d+QkxuTb2aP4Dg8qOl3qoYjWbKfI3mjsiqb3nqAJnpE/YZt9hrymbH+
         +xok/y14qeYEG5Fs9Fv8qchimmHcEl/bFSOdw/ncIjzE5uMfP9Vg65D1caoHA3gBvYs+
         FbCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339571; x=1792944371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7V15sRJ8dwoI31++1uINRuoyJkh6H1c9bF9VyuwB2M=;
        b=uS3PVUj6vRNoWcJOrOKSuad1ql9E6h8G6uQtTfVLekttkxHFgE/G2FD2pcTK9Y20Wf
         MhTOVmzSQ1rRD+RZiabjWeuek++l8+hAw5QrgoIQAsD4jkLuJYq47JQnbJOlO8u808tc
         CJFTTQJlZqqBRzNsSTXom8uqveeZc2tgjoVmBDX5E5StqWhEJhllPs1jdwNsPnkNWT5A
         J3TKohceJdOGwBfr81JFxwB1XoIYU6VWPnxVCHfga6glETxq61o+o0rZjJuc3Xe09bjV
         i1MdNxYQH6xeftsEQ08Y6MjfyAAnjPpCzF+s2ujeyQ9W63/1rDE/PZ6Uilgmmcr2Fl1N
         Lf0w==
X-Forwarded-Encrypted: i=1; AKwUvBzmcjkJzr6uWkOLrP3ML1BIQSxO5nlF9p7qlNv57GksftmsiLzz287Fa1a0AWujaUBcG4ro/isITRbrwqiNJY5npsaP@vger.kernel.org
X-Gm-Message-State: AFq9FYIl9fhfSiXNgEiDPd+CVa1TWpXh6iQXv2pKhexVn9Op2qUSw9+r
	xarj0+xS8z3QdKnlRbkyRdW/JYaXw1+yaru6H3g9Uz63p5M7f42v1CsH
X-Gm-Gg: AYBFou2y+dGfP1PJeUnwn4jxeGe4ygAoMhmbjXENq6SUhsEomuXY7ZohSM4kLRr0qxw
	XhnWJWiZTApgd8BhVWcWpV9T4iejGseRkSdAkPb2pUXq71tRZoMVXiJ8H+8mj4s/nLvj7p7D8eM
	woV5nGuE2ngyTqnH5zjeU0z1xu5ALjCANEA0PyUK4sylbtMPN/tDIuEgAbWIiZooj8eBQPfvlYs
	IHID9jix+pjxSzBISgD/dtUlin12L6HILF0j9OqT4NiGGj+e2zVs+9E9HHAFl7H3VzLmZGPLhls
	2GBXpIvqpGry31uCK1sKi4MGiAAwCUlBwl0ilT+tMHbfd5+G0PbgJWNtlMxhRoUY6nwWqbPDHrs
	UDuXGpN80OLXd69iE1kwjO5lbUWQhPAPQRCSoYnjkTFmsj3W2USjp75oEh0D7eLy+60k05aLSqE
	owD1kJJI0FnAUrhaXrXt9xT0UOuBKOZjOrOHJHGN7a2eG5/pZbQE3QSqOAnSjJLneHfRm3o+St/
	u8GHdrqLixpRxATpxyJhbHsGNGtxkOT31G0OHe46NqRDbQxrxpHX1vglwViX2zOgUvCoO6Ptos=
X-Received: by 2002:a05:701b:464a:b0:143:868a:20c1 with SMTP id a92af1059eb24-185151be30emr6936126c88.46.1792339571071;
        Sun, 18 Oct 2026 09:06:11 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm21507861c88.5.2026.10.18.09.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:06:09 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Subject: [PATCH] platform/x86: asus-armoury: Add XBOX ROG Ally X 20 Tunables
Date: Sun, 18 Oct 2026 09:06:03 -0700
Message-ID: <20261018160603.65449-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds Tunable table for XBOX ROG Ally X 20.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/asus-armoury.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 5792210b75bd..8f88a979c3d6 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -2697,6 +2697,32 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC74XA"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 13,
+				.ppt_pl2_sppt_max = 45,
+				.ppt_pl3_fppt_min = 19,
+				.ppt_pl3_fppt_max = 55,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_def = 17,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 13,
+				.ppt_pl2_sppt_def = 21,
+				.ppt_pl2_sppt_max = 45,
+				.ppt_pl3_fppt_min = 19,
+				.ppt_pl3_fppt_def = 26,
+				.ppt_pl3_fppt_max = 55,
+			},
+		},
+	},
 	{}
 };
 
-- 
2.55.0

