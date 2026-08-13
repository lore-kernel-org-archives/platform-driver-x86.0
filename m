Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0604B48F840;
	Thu, 13 Aug 2026 15:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636227; cv=pass; b=T6uLv6mD33WF1PERKxFna0nmXLFjRjS53duGDfTAKdUDx/4xz/GNrfgdE/e0T6kaIa97kcDa+psRB6livF7bdblT2Wx+RxeFr0eXBLuHuo1U6jRQLIhEkFSBCAyt1/o6QHH2wGKW6Y53brVcxDOSlZRllkOSOX8/41Bxfh43JeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636227; c=relaxed/simple;
	bh=5EtXuUL7c3ssaG5GvLlZPFyzeWMwZWNHS/qXlfbu5/o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkqCuG14eKByuYztzDon/EPNDiRzMZk1pqu5NApve7S8P/gw92tupVwy/EFpoFfkPg13jmEW6JBO6+45H9eE2SJ3LHbBBtfROHyiBrAt1vHc80n3UK5Vv5kgkAA0T8ZxwSuWbNetezk5T7PB/evjPtOEUbB8OCmvSB152b+pcr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net; spf=pass smtp.mailfrom=moh53n.net; dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b=E5aM5aKA; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moh53n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b="E5aM5aKA"
ARC-Seal: i=1; a=rsa-sha256; t=1786636214; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bATxCV/Nk7ahyOjT8kIGwk3/2aLb+MP4DKxpIR7iGecU/97ae89o8/N3WCQR7f+CwKl2DsDvw5QHv6tkUVXX3fYDOgRYcACKAvph4TmN0vaD5SRwRR6tYqr9FpqgZTeR1Bc2skQgxM1cBN2PM9GmAPplVcKW8BfnRV3mPdQEFf8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786636214; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nZT+a2xg6kcXGbWDxRaoQ9owBQmLTVctWoYYtf/kOiQ=; 
	b=TH5MARwju+GOPCMA0s252+JJu0//plll9M0VnBTZKTRyTG+mTpnvXG/XO3lM862ZkFk7z4IGpCKzjazBcW5ujfr5sYrnEnAd7znbGKUkDHQwZfDKUVHOFwar3lBkFal9zZxw/oURxNYwCg913ptCcFqm94AOoougFiZjBslVJwM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=moh53n.net;
	spf=pass  smtp.mailfrom=moh53n@moh53n.net;
	dmarc=pass header.from=<moh53n@moh53n.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786636214;
	s=m; d=moh53n.net; i=moh53n@moh53n.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=nZT+a2xg6kcXGbWDxRaoQ9owBQmLTVctWoYYtf/kOiQ=;
	b=E5aM5aKAccqcpNhV1Ugjlqo41rvjhKKq9AnrFRN+Q/1/iO3ZM7rqNrlz1475WKTT
	wr3Ng/fgUl8yxnB77ogOcDELUBXQIe0HTp6OtBaSNm7/hr5SfOaWeFxXXFw1dWw7aoy
	FbzyuJv4jd+HEBJa/jYAxAc50fd0GJoQSOf6JALo=
Received: by mx.zohomail.com with SMTPS id 1786636212085741.3590698813425;
	Thu, 13 Aug 2026 08:50:12 -0700 (PDT)
From: Mohsen Tahmasebi <moh53n@moh53n.net>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohsen Tahmasebi <moh53n@moh53n.net>
Subject: [PATCH 1/2] platform/x86: acer-wmi: allow hwmon without predator_v4
Date: Thu, 13 Aug 2026 19:19:36 +0330
Message-ID: <20260813154939.9850-1-moh53n@moh53n.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some Acer laptops expose the same WMI sensor interface without necessarily
supporting other predator_v4 features.
Currently, ACER_CAP_HWMON is enabled only through predator_v4 quirk, but
this quirk enables both ACER_CAP_PLATFORM_PROFILE and ACER_CAP_HWMON.

This commit adds a separate hwmon quirk so ACER_CAP_HWMON can be enabled
without other predator_v4 features.

Signed-off-by: Mohsen Tahmasebi <moh53n@moh53n.net>
---
 drivers/platform/x86/acer-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0eaaefb13d..83448561189 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -403,6 +403,7 @@ struct quirk_entry {
 	u8 turbo;
 	u8 cpu_fans;
 	u8 gpu_fans;
+	u8 hwmon;
 	u8 predator_v4;
 	u8 pwm;
 };
@@ -421,6 +422,9 @@ static void __init set_quirks(void)
 		interface->capability |= ACER_CAP_TURBO_OC | ACER_CAP_TURBO_LED
 					 | ACER_CAP_TURBO_FAN;
 
+	if (quirks->hwmon)
+		interface->capability |= ACER_CAP_HWMON;
+
 	if (quirks->predator_v4)
 		interface->capability |= ACER_CAP_PLATFORM_PROFILE |
 					 ACER_CAP_HWMON;

base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.54.0

