Received: from relay15.grserver.gr (relay15.grserver.gr [46.62.234.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A562D97A6;
	Sun, 20 Sep 2026 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.62.234.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789930697; cv=none; b=KbbyOzZuTfGfRs52CabY48tVuxQ6shRoovSZWfAw5fjqDfsfofD7pnHLIYXP/OmP0HKBuTB8eeUobcU+Nqk33aPa8GoSXTf9eFmVBEcYfaX1NWXuRJkV1oW+/EXbVg5PPb6nw0ule8D4li5BvjzKaKdBXHBOFL5cXJlMT35cnvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789930697; c=relaxed/simple;
	bh=sfvZxEMgovNZnn4twPZMIQd92MJ8XyCf4scs8NDanlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PGdEJ2n9C21ho81OtYdTouwoYNuQmmLOyfATMtBRtZuk54japk1TBLMM9DoAQ9GMqaoFVZxUQr2lqAS3wki/m5Y/f2AGRyZVsBdDKpQXtNqx8hrPWKOcqyC4+fMbyxK9UYOOAiDJiI3xQPHIdswGRwojPyAgBLqfxAfenrAKfhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=LyjSjPlq; arc=none smtp.client-ip=46.62.234.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="LyjSjPlq"
Received: from relay15 (localhost [127.0.0.1])
	by relay15.grserver.gr (Proxmox) with ESMTP id B143C3FA87;
	Sun, 20 Sep 2026 18:58:05 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay15.grserver.gr (Proxmox) with ESMTPS id C11F43EAA3;
	Sun, 20 Sep 2026 18:58:04 +0000 (UTC)
Received: from t14.cm.kolding.net (unknown [IPv6:2a05:f6c5:43c3:0:71d:3f4c:4885:3ab1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 162341FDA07;
	Sun, 20 Sep 2026 21:58:03 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1789930683;
	bh=vrklPTZvPch2HnTPGrV3N7W7mx20cwZeHxYrVl82fUI=; h=From:To:Subject;
	b=LyjSjPlqFldIC0E32tvr9hIKAT+iNUV6Vw29ysw8/7Q1LLD8lXIuFTkExH7LF4Y4T
	 zkvGqxynXYV1lNriTQAXjeM7Uz6fExi7YUE6jVBHqlFoZdj7qtmFbE+7qQP1RC0aGb
	 pbaxReBckFml45XC+EIxCcqFr5aE3ZdKK6wVjtFLdOL1/lOfH35Z9ca0hfbthAozSn
	 BUSde8QqeL/2dzN501M+MrQphQF43yBF10TrG5fDWYsVgzuDANwwPHZHgk0RPQZ5a0
	 7NB7oq4PutwXz0KbS9qe8YO2/mq+ywGZ518sP/RdQItEb3ziNAKtMJojSZrjqiZhNp
	 uy1XsPQN6B2fw==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:71d:3f4c:4885:3ab1) smtp.mailfrom=lkml@antheas.dev smtp.helo=t14.cm.kolding.net
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>,
	Tiago Silva <tiago.paulo@live.com>
Subject: [PATCH v1] platform/x86: ayaneo-ec: Add AYANEO 2S charge control
Date: Sun, 20 Sep 2026 20:57:59 +0200
Message-ID: <20260920185759.3426627-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178993068357.1664346.17705031083463011378@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

The AYANEO 2S uses the same EC fan interface as the AYANEO 2 and
additionally supports charge limiting. Add an exact match ahead of the
broader AYANEO 2 match so the charge-control quirk is selected.

Reported-by: Tiago Silva <tiago.paulo@live.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/ayaneo-ec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
index 41a24e091248..81dac81262e7 100644
--- a/drivers/platform/x86/ayaneo-ec.c
+++ b/drivers/platform/x86/ayaneo-ec.c
@@ -76,6 +76,13 @@ static const struct ayaneo_ec_quirk quirk_ayaneo3 = {
 };
 
 static const struct dmi_system_id dmi_table[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AYANEO 2S"),
+		},
+		.driver_data = (void *)&quirk_charge_limit,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),

base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0


