Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FB67E792
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Aug 2026 08:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787472605; cv=none; b=hzOSJxHzXMCKaalA2ydsQg2EMVJxFH4mUujH6jVGlwcCReif5KQmP3UTsmvDC7sZ1xXOpyP+anzo2nv7XhJdppDlg96Vg4aJVdKZFYwtnEXvZ97nZOBCIMCT7dbxUJn/sTE901epIC6kDYHfMKbtKeyGmQ3zo5saau3jEO7evi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787472605; c=relaxed/simple;
	bh=RDjpUB7vI2pGf8GQpVPPkUy/snyYNbCJCGpp2g9RYg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eshr6QDAuTel83F9PQbcaqfmitljUOk4G/L/x0EHgLScE6Aih54+OoEo2f28UCOGOKxWtHdRg1z5OAW8OWk7968kTSJON3z/xhlggvcPb7qK8QrQE5SbIHew4foAY6jXq8uT6t8GCkTvCEF3VxsW+drTFbtn7u14BwPhHB5h4Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dA11L5/l; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dA11L5/l"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2533190a91.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Aug 2026 01:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787472603; x=1788077403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UEhXBg1fEF/fFeb9MOBKITkAQWONHg+xzCkjTkQHMEU=;
        b=dA11L5/licVy9htpyx6jjO4ALpj49aiSdMAGilc3VoI4vb0t0k8VmdmpJ7LHNQ3EtE
         hRXDBm8ZNwBajiCBsu/uumYEy1l9UuQdmBehsuihKNScpgAcF1+RlKJANofaXDdrjKyX
         qEKwVmNtdN/qdMFlZMxHRsCUXCt4CX2vOhvvZc3X1i+ZKDogPL9Juyi986tjSmbmFIrw
         Q+ajvh7T1ij1Ti/f/b7ZPCG8QGyug5JX49Mvoidz1V+K/hOuq2tL036UmX3e5TatiP2S
         hQrqam2s11LdBR1xjkEhheHa8Q8VGYEv4WI79FtXZE5UgvGvPUZ4mSgV1cq2GJH1dd5V
         yetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787472603; x=1788077403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEhXBg1fEF/fFeb9MOBKITkAQWONHg+xzCkjTkQHMEU=;
        b=TkzB5lvbPEquskqvxMQ4GoOtJMnDl7kPc3gTZUlSJg04AaHZN8ZMlwCR007TZRfLRL
         LLw9HuMhatz7LkmW+EiiJkaGZOXYUCZp7xPvTgZ462mWeO4a2LHQB/j6euQyOR0YlKDp
         w7G7OmJ6qH6Q0FrntNVlFYsg5OOrABtAveo1yOgkvG73q3db1bPQ3FX2/I9uzN04usI+
         8XH5Cthu/DDGGEHmI9de8ew0A3DmbptyFyI5HbRHanH4QcQ7KusPzAqSFZQ8rhL+0uZM
         NPkkPk5DdQ/g06Zxbu3o+97entmmc9LItsKGzN6Uf2S7J4QKs6d5ptbtJXhQBaFp+wK6
         DEAQ==
X-Gm-Message-State: AFuF++nWViIVsJAN0J6ShbZ0ga8K2mZgb4fwtj3xj7CmyoBRsX66DnAB
	Hw9joL8/A/fQ/mFi9rzKsyfPYZqYn1Es+lVtKljDT7WdK44AlgAKJqoWNdBNhR9d
X-Gm-Gg: AR+sD10LGnxFOYkaxBbXYZKhODxbPuWsAr+onYaoqyCP4hVqrbu2HFXxCZU9a+GoWTx
	RIcmbA3y2H6M3wi/S/YRis6QLyt71miVUml+szTetYTwPTZfb9C9A4h+KvLNY1ve/JZpM0naDyO
	ppFjGrRUahuGasi2l3ubZkWK+9yKVqWAGKRpMqesvhFfKqYjWY4kISDg0PNV/W8hd/XssjWt++W
	5WkFMUK53rvGoWDzANk1nDqFXLC5yc1tyiRHaS7a7gFTZAXLBuQvvOtg5lL9oH11BYNBpwkXrXw
	DbWwBSr8esGxG8jiLitEmPyDeshfTTSpeDIkJRs9qpAxUPI0PAt/NFph9L6jjM83+QllxJh1G3C
	jdeadm4Is/ZIkJy+GFGcIpZIUM6UkvyXGFJ5kTCFGQd+C4Qh8GG5Cy+QTdMcg3d+ic/nQhcFXis
	tJQ7utOoLRLiTEBwPlr3wSC468BsFrFuB1IVxWsvFv8pUSlF05JfhwJLxJ3JN+nGpIyNSmSBxGI
	iGGSSsgExYcw4As9Nr9RG8=
X-Received: by 2002:a17:90b:224a:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-395df677766mr15716092a91.14.1787472603377;
        Sun, 23 Aug 2026 01:10:03 -0700 (PDT)
Received: from archlinux ([223.184.221.173])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c31a5sm13624455eec.11.2026.08.23.01.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 01:10:02 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8D42 thermal profile support
Date: Sun, 23 Aug 2026 13:39:46 +0530
Message-ID: <20260823080946.103082-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN MAX 16-ah0xxx (board ID: 8D42) uses the existing
OMEN v1 WMI interface but does not use the standard EC thermal
profile parameters.

Furthermore, it is the closest sibling of board 8D41, which is
already included in the table with omen_v1_no_ec_board_params.

Add the DMI board name to hp_wmi_feature_boards[] and map it to
omen_v1_no_ec_board_params.

This enables the existing board-specific handling for 8D42,
including platform profile and fan control support.

Link: https://github.com/yunusemreyl/OmenCtl/issues/93

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 68ea52045a5d..6ecc033e5af3 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -327,6 +327,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D42") },
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D87") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
-- 
2.55.0

