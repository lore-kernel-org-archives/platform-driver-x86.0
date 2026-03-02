Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80658383C97
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436935; cv=none; b=mhsndRNweCg7/8scW8A4ckAKnvI4q6PUGTEIi/bJ+VINJedq/XQG4lf/ES80KSlNnTP2vpiHnXexB7qu0IWEB69hzWfKcSzx1cLgdqsGWHwAd2mO96hknw3dfuaVU/ueZirWggWCvlR+AI71CPk8mCdItsGSOi3ontsHTpojk4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436935; c=relaxed/simple;
	bh=lLr14EA7kHEbiCwadz/f/PHAHfGxiqtI/2NLU+pVv40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BQYm/bo26XSjhVEH3j0s9jdg4YV09QdpweJUsAjpwxpA6ugE2whlcDcfdUlE52+uUPqqPJBypWVmD8x/PVSIoCA6Kck4L8/qzd1lOMGv29+AF+W6cSmte++2DB4R8ngalIiVKBT806MCIpOrCzCASFt4MQ2vy2II4urQ/gvMJ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRI7QOGD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRI7QOGD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-824b32875e7so1910386b3a.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Mar 2026 23:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772436931; x=1773041731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+h9hvtsHIfws7XQJOTU6AMBe6iso9u33nFs581ZVH4=;
        b=aRI7QOGDcV8pyVHk/IkXKBJOTMRBvJp0PrwK5ZO2KiBTU/m1frS2IS2yX92dv7+0c4
         l84RqAqVwA5iUUcMfPZB9Bb57hCXK2KFHWN6NrJYSU6VUDGr2xdfnq/1qnLG5gqSh7gD
         cwgbWaIl1SvYykATXbVRrmnusW5W74eb06EBGsnFZ/EAlZVZ+CNYwwei/+Q579361TjT
         Wg3sv/h8oRYTPLsgSIIX1k9gJNsQPiQUmYep2Wd7lUs7UgBn5fFirvjRub24EcwNG/z+
         f6c9m2CtQdfMsjLSHz+DtQpTHJleCM9tn/hjrcPXNDC/Ok80OADzrvI+mZXO0dXl29B0
         BhOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772436931; x=1773041731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+h9hvtsHIfws7XQJOTU6AMBe6iso9u33nFs581ZVH4=;
        b=sQa/aumZLedcqHo2MkF9XDRKN5tRch8qYPJZ6Q8ND2vnUZvXDkOE9fCbdZ1w2NpBBG
         nHu6FG504aJaKQBVD/Yraz4/EdHrS/P2+3nr/Pky4q08+Yxph70DQYPM5Pwo4BD3KPZC
         eJQHjZrBhHd9YYxPOXSMGQRqUougtSnOrnCVrSegQFHIIvwlJhGYiyz8Rud0MxaHiHgO
         PxZd6gp2SjoRVS5TGL5S7H8HyzEVPKq4uHUBWLohgRW60R8AEYAPrItcqcCmHlopWRkQ
         ZUGvxLw3wRT0ENwwXVaBdKow44QUXmF1/lchCkTR+axYNQijrOjXsdm0sd9yn8oq3pwP
         a7nA==
X-Gm-Message-State: AOJu0YyVEOdR118URgRch9aE0YRgs26VNU4UFxs3SKdthgx893G3HQ+0
	yOdr1ujSu/FqpBd+JdkMcOh+KpbKq5PzEcVaOjS2w4qXcMKqPVHI4aX+5xj0eA==
X-Gm-Gg: ATEYQzwcvxgfLZKk1cwt62CAERNYoT3H+lPjQNNSXAgjWjea4ZBiH42/54X28HZjACe
	ZiDFJXon/kx4GbpT/VZGf9Dsgtm4sfI4qPCwnlvXwiUr+epK4alWjOW8BcbBx9eb2ASzQQ7blm2
	AlG7Ik9xNedgdcQ3RXOfDzGAmfIWceJBHqR8yGJ+YuoUOOhIu8/50edPsrQgtToIXeOZaKaDfNs
	UFURknTZztOicOPimksOfPQOmkrAmo+Sf6fGs9Bm6MNhOJkE5Y9wrJ8zy6287C0rUk/hxmZTEju
	HLZ6qcTxLehpvHJ9KPBTz7GiYWhDIQNax01ldFhfZHUGT15EJhkidynBTqtiE3naj1i60kE2ZXF
	UgIEfJ0OWFd8979hQOzRRqWtH+ieIar9OybqQwNtjUwg5PqpO3KYT4ib9Pfa5VsP25VDVU510uN
	8UfNnBK/Ap0xUrKyGciu5A7dDysxQSNcOZdkcui604BahGatkSSjMHwfSHoMC+kyeLEXdNPCh7L
	p7pDBi0ktDJPEzIdmGkNaq7P3cpoKI=
X-Received: by 2002:a05:6a00:a85:b0:824:18cd:f2f6 with SMTP id d2e1a72fcca58-8274da23795mr10565750b3a.59.1772436931439;
        Sun, 01 Mar 2026 23:35:31 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8bcb2sm11966586b3a.22.2026.03.01.23.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:35:31 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qwqgong@gmail.com,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add support for Omen 16-k0xxx (8A4D)
Date: Mon,  2 Mar 2026 13:05:25 +0530
Message-ID: <20260302073525.71037-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Omen 16-k0xxx (board ID: 8A4D) has the same WMI interface as
other Victus S boards, but requires additional quirks for correctly
switching thermal profile.

Create a new quirk omen_v1_legacy_thermal_params which allows a board to
use Omen V1 thermal values, but rely on the older legacy
HP_OMEN_EC_THERMAL_PROFILE_OFFSET. Add the DMI board name to
victus_s_thermal_profile_boards[] table and map it to the newly added
quirk.

Testing on board 8A4D confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Qinfeng Wu <qwqgong@gmail.com>
Reported-by: Qinfeng Wu <qwqgong@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221150
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 304d9ac63c8a..783e37cd05d9 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -120,6 +120,13 @@ static const struct thermal_profile_params omen_v1_thermal_params = {
 	.ec_tp_offset	= HP_VICTUS_S_EC_THERMAL_PROFILE_OFFSET,
 };
 
+static const struct thermal_profile_params omen_v1_legacy_thermal_params = {
+	.performance	= HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE,
+	.balanced	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.low_power	= HP_OMEN_V1_THERMAL_PROFILE_DEFAULT,
+	.ec_tp_offset	= HP_OMEN_EC_THERMAL_PROFILE_OFFSET,
+};
+
 /*
  * A generic pointer for the currently-active board's thermal profile
  * parameters.
@@ -173,6 +180,10 @@ static const char * const victus_thermal_profile_boards[] = {
 
 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
 static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst = {
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8A4D") },
+		.driver_data = (void *)&omen_v1_legacy_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
 		.driver_data = (void *)&victus_s_thermal_params,
-- 
2.53.0

