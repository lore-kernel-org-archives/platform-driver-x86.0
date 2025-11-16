Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFB72F656A
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 18:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763319214; cv=none; b=Ik1lD62oOnDArqEo7pDs3X391upHpGW4nmclk5NNdQ2IAM6ZzpXC0URB5dqI8WZZk6zzrkFFVJDeMc/ZUyxnrpyAlHIA5mbTzmleqbMuXh7Ukr4a4DYKC2NZOMlJbJAvG/92J9yVr+8l+mVQbTe6DHbBMjHAAAQ1GzpvsQ0/sgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763319214; c=relaxed/simple;
	bh=oxj1wwYxVbThvOniJHLCzFHa58TZX7NhJQv0iT0dy30=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GYYSBoqQogZLf+geh6GBMJb92PwQvwbqM/RJujtTf47Poy7FpD2SnCb+uVMLBkHaQIBO4yjSQ+wiOzGu5aE7DNDsjK+5Bk3GoCLPA/Le7DtUq1uDucAVRObuT0eyk4LXlwYvlUtzH3q67XxZ/8tihgiF8XBHcCUQnKF5cGbxooY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=EToLk8k3; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="EToLk8k3"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 74DA53F520
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 18:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763319204;
	bh=EFJSWMgWfA/jaVDxy9rpobv57XHmTrvDqbuJ5fsLK8U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=EToLk8k3TzAlOM0/+NikSDVWYcRRuAXJ9tU5I+cXgf/+iV1JzfrFMhggRBT71Cs+b
	 xa2qGpM0390ZLJs4fVzsJKHrYe9Mvzku2mhZXhdx70yMayPlTm8a0VqmHQ3Ar5/tmE
	 wuARu9wVyEK+7RNSleQKTeukTUAHISwiBBevLsJrqNmMsK+0DpreC+MMcNxZeHSZzV
	 QsgmqvHnB1Rg8cJP/XHBoSC8TqTa4fGIAi7lEWG7BYL7NUfDpsOAou28HmISuhhJvc
	 4BP1JJyn7iW/OszV57ryMJozbeqsfO0LeBbzV6xVIBuQcH/bL6a7VMGH2tKjIW7oTs
	 Bq5DN6xJAlJtWGyns+Gm0YpUCIy6/8owX970jwzAsb/Zg8ta7SwDP/4XhKIk7Akbha
	 Xb853V0udNkqg1aVjszEoPjXpTyl6aan2AXv8pddEQpgEK2yu7Ak3Wr5VyDz9tjIlk
	 O39Ap0dkWUtkEvTun3N540YuH6ip2LMHt4FFPKzpvervGSwjWhJuL811gZ7cSKKrom
	 Hw9+qvilgon9hpWWvRnS0XDW4eHFvDLfelL/x0LotEolV/P0yDwwr83z+6c/GS02YP
	 gR5e2G1WMMmytgtUBorLXikDqR7VL15rth2ItPBtX16luRfAfCUHh++c5S3F70G8bQ
	 N6N4qaeiXvQ4OCIqmRJbhOgE=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42b2ad29140so1591760f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Nov 2025 10:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763319203; x=1763924003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFJSWMgWfA/jaVDxy9rpobv57XHmTrvDqbuJ5fsLK8U=;
        b=vJHLxHG+/eZw9FpBvzRFaJd4u2O60DgQf1ur8jZaEis14c7epgdzpjXyYSl+bnS8If
         i2gz9c7jhrKXlWP8/1B6qbrcZEPBImKymwNAGsftY6XTh8n0AzGpuxqfUvxrJ9OKWbzL
         u2BzeWhytP7jojdEl9F/tx97Q9Ypi9oa1vZtcnQbt8ZBn2RyOGEQVDTABsOU8+ZVe84y
         H46z/QxAZX7DCqG7ElplAZkbxVVKl75NWaunNV2UC3v5o7fOVVJX9fw0kZJWGPC7XmsA
         yGE6u2ZZ0Mofh+3yBmbq73VFUF7w+4r11Q97kFCA1NXc7iNZfy0/6rGnrjOksUEG4cGv
         S1Tg==
X-Gm-Message-State: AOJu0Yzhyn5hiqy5UHtH00g6CXlwdIj01ixvoGS6Gbkpj7aSSIuS4yn3
	HWXzS4M1yX2OizRCp6G71N6nB19pkDMu1wpy3nvOcafVz6fuInr9pkSEkbAMllCDtq32FEHB/1A
	GKWgUgdXptU43ERd5Le1AtyqM+T+0+DCMJMewQiVRD6xcDiRFYs32vlNxawVVUoLkAYXSu3HE9V
	2Ra8cfoMImcsDPpHJNKorEx5Zi4g==
X-Gm-Gg: ASbGncsDpQzrUD9lZPdIqC5Uu6NL4o9ENpt6Ci+njcQJUuBzdAIF1Cq9ppIWaH2TxOn
	wI5/THZuUusv20MIERVFgLLk9MpJ9S0i+8HucP2jNKpysQMd2gJURLdmD/VJOBN/7+QXmYEtXc2
	UO83e+of7gGLok+0KlKnwPjojHSo0wLnolfhHPNhXOCjFz9m2tBmFTap2P2GrY1OLcVXqkwBNgu
	SMbiC8QcKNTFIPiOo4T2KHyMKxw58rjagN05Cn65qudRMZQGZ1OMDMw2D/GFhbly7uHzuiJQG5f
	E6WgkJN+nHtTeqkC5mSUXn79qlZpJxjYWlswWmWtci+//P07xn3/KeYSDu0a+mY6QYaQpuCmrUM
	NVPYnttGC/LMY2xjal51CuwUmMU3KKkAO3q1Npzuk/3XQ5qolwnlHaOk=
X-Received: by 2002:a05:6000:228a:b0:42b:4223:e63c with SMTP id ffacd0b85a97d-42b5932346amr9883802f8f.11.1763319202859;
        Sun, 16 Nov 2025 10:53:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgmerUuR30xGULPniPQQPGkGXW3P2IBr9Bpsv9rwR6mcsU+F37iv42QtzH33o6+tHtfB95HA==
X-Received: by 2002:a05:6000:228a:b0:42b:4223:e63c with SMTP id ffacd0b85a97d-42b5932346amr9883786f8f.11.1763319202509;
        Sun, 16 Nov 2025 10:53:22 -0800 (PST)
Received: from mac.home (host31-49-244-250.range31-49.btcentralplus.com. [31.49.244.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206aasm22326162f8f.40.2025.11.16.10.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 10:53:21 -0800 (PST)
From: Anthony Wong <anthony.wong@canonical.com>
To: platform-driver-x86@vger.kernel.org,
	kuurtb@gmail.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2] platform/x86: alienware-wmi-wmax: Add AWCC support to Alienware 16 Aurora
Date: Mon, 17 Nov 2025 02:53:11 +0800
Message-ID: <20251116185311.18074-1-anthony.wong@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony Wong <anthony.wong@ubuntu.com>

Add AWCC support to Alienware 16 Aurora

Cc: stable@vger.kernel.org
Signed-off-by: Anthony Wong <anthony.wong@ubuntu.com>
---
v2:
* Drop "AC16250" from product name
* use g_series_quirks for G-mode
v1: https://lore.kernel.org/all/20251007084734.25347-1-anthony.wong@canonical.com/
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index f417dcc9af35..a1ff63d8dc12 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -89,6 +89,14 @@ static struct awcc_quirks generic_quirks = {
 static struct awcc_quirks empty_quirks;
 
 static const struct dmi_system_id awcc_dmi_table[] __initconst = {
+	{
+		.ident = "Alienware 16 Aurora",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware 16 Aurora"),
+		},
+		.driver_data = &g_series_quirks,
+	},
 	{
 		.ident = "Alienware Area-51m",
 		.matches = {
-- 
2.43.0

