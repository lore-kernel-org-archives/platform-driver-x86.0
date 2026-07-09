Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A40439B49D
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616355; cv=none; b=ZOxPAWsWJ+Otq2ZNPGUYdcqLERoRDKR9yEhjUGLsaRNvgAye3fyCuehDO/Bb/YCZDNlJRQrr2hHxuULff44Y/xhc3TAaMYgxSeohRiPIvuYQN2/jhkNZVl7a1wdOSmUdza3qekKwptocWcKxWowx9+bTLAnsh91B2zfJc0P+RA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616355; c=relaxed/simple;
	bh=uJoYCDCn9PmHieohB5D8uKh80F/3g84Pf60VaEuspDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQtvdTXczNxG3Me0bW4mp3gHkJMmrH1JD4OZzYyPex6+NrLo43PkVwJNNkDHmZUsZjklky0hg+TVOzo8VJ/umyH9jNYTPdeOydMxyGrHJQWcZRvroWTcCm8IneDOxXq7mFSk++dZtBXFMTP0OclXUwGNLFjBt1Cw4XuOjD+aQmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1vsZ4o9; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1vsZ4o9"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso46311a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783616353; x=1784221153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BdQgCcOZ8AsbD39pJ/8+6FU/oteVawK7PRRyjumlzGo=;
        b=M1vsZ4o9xHisNGI4Ucm+gDuW05HosHIl9eHvr5jq5Q6EqyzXN2JI5JaWGbHMRe+f5+
         Tl7sdUV38BoFQM5HUZMTDmrGr1XQS7vsvsjqHobfcd9my6nPPYTubHMYmAaM9wmvuB0p
         dnJTBa+x4gpEszalMZfUs+rWw0m0oIT3iRco3mCvDuKXrU5vWxq36Vb0pjiHFyaR57UJ
         VSjVcMnRUtwhg5ncAkMp5G2pVzXLJpt4zvMxpo1ZxWsn0UtpLCnmSLvBZOri6AyufO48
         9CgnZGGVYbrNDK/8xOFB1+0plJtYo/99khKzBo6JFXVKxeb4+R1+wHabwgjPhdbTAyna
         xl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616353; x=1784221153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BdQgCcOZ8AsbD39pJ/8+6FU/oteVawK7PRRyjumlzGo=;
        b=EH26sL/FInSaY9RKvD8fxDm1yE2o3jBBDMuehgNS4AC1eSMIgkASRRWt/8hw8lgztD
         wHXt30OXjGyAgTBCfLKAQ74FXg/szSdcWFb5B0I5p3Lz7gd5bA3VZyrUFy3tyOZ9jfVa
         TT16sd/1ZkUVugt9XvLth2fQ8abeF2WWTi7pupFMG+M5sw1J+pc/U0+IRgiOXSTvrgN1
         zRIhloWiNUw+xPoojP99zqPFAuh/3h8n6oyGWCQF+Fe2LHpzNefMthm0/L6X2n0Q6SPt
         g4l2b3cfG41inP2yzW3wWd+RV3YKd7oqBFK7hVZwBVMwquucZA4mEzP3LNsTtsztGfM5
         wIkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBpWs83wKKfFSqhJynyJ+lW0Nx1NOhlr0DlaKzq0haKDTAxdV9t36/ZNAntwZy4XvswbcQfS8cZtZJ0pTqNxm6MgN/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0R8lQu8y/yBeSzPShcP9a30W4CSpYhOZK5vaDTfOqrqqG7vkA
	YGDLTuQIycpzkgBiNJoU3NVlePS9N35BdCFNf+QsxVTIaeRMl6VgcU5O
X-Gm-Gg: AfdE7cnOYzWTLhBokCXtDfG6KZ4WLala2VdBNbA5WmQhhwn1jHWVzA5w9i4Q1hGwDC6
	jSfTZkdY7O47DL1OBT02O31Nk+8wN3vQMLgQJbQErBMF3N6toopVz27E/7AwmA5H057HNnVVvhN
	7pI59yH/y36hJ30ywxWJeradBjN4cY8jROdsJ0gtiI3kUlqhkbypdSNsTWmED7Ql/+VsInBPjBF
	J6lryw26tmWt+DMlv+NAat5g5VyFmrtgx3rPhNjt4qFL1W4W8gu0NlcdPScL5NbcEFdxmXJkqS5
	X8BCUneZPt58TyFTk8R8gQnEYQcZvcDDBEsqhNn4aKBMylZvvsKDYBPGNe4p0VWb2ClLPdsRipw
	oOkRajlobCz4ULLtZlp6C5mnBpJMvAIVMYnzsdD3xZUvfanmkvp9k2zDavKQbEoFo8JSPh9R80+
	N/3dZZapvFlCV3DxQBB93QogtmgsILaiK7nmXlJYWUt5lYiI9cwyhGGPLnvMF+UWk=
X-Received: by 2002:a17:907:3d12:b0:c12:979c:5a5e with SMTP id a640c23a62f3a-c15cda428admr403802066b.0.1783616352383;
        Thu, 09 Jul 2026 09:59:12 -0700 (PDT)
Received: from node ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c79f2a3fsm329902666b.49.2026.07.09.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 09:59:12 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v5 2/4] platform/x86: hp-bioscfg: bound ordered-list parsing by the package count
Date: Thu,  9 Jul 2026 21:58:57 +0500
Message-ID: <20260709165900.30615-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709165900.30615-1-meatuni001@gmail.com>
References: <20260709165900.30615-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_populate_ordered_list_elements_from_package() differs from the other
per-type parsers: its main loop is bounded only by the fixed per-type
count and never checks elem against the number of elements actually
present in the package,

  for (elem = 1, eloc = 1; eloc < ORD_ELEM_CNT; elem++, eloc++)

whereas the string, integer, enumeration and password parsers bound
their main loop with "elem < count" as well.

This is safe today because hp_init_bios_package_attribute() rejects any
package with fewer than ORD_ELEM_CNT elements before the parser runs.
An upcoming change, however, relaxes that check to accept shorter
packages.

Bound the loop by the validated element count as well, so it stops at
whichever comes first, the per-type count or the real package size,

  for (elem = 1, eloc = 1; eloc < ORD_ELEM_CNT && elem < order_obj_count;
       elem++, eloc++)

order_obj_count is the validated element count, now correctly forwarded
from the caller. No functional change for packages that enumerate
correctly today.

Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index cc5bebe73a93b..863e486474ad0 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -145,7 +145,7 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 	if (!order_obj)
 		return -EINVAL;
 
-	for (elem = 1, eloc = 1; eloc < ORD_ELEM_CNT; elem++, eloc++) {
+	for (elem = 1, eloc = 1; eloc < ORD_ELEM_CNT && elem < order_obj_count; elem++, eloc++) {
 
 		switch (order_obj[elem].type) {
 		case ACPI_TYPE_STRING:
-- 
2.55.0

