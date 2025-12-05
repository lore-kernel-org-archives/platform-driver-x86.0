Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57874362AAF
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Dec 2025 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764960647; cv=none; b=pEe0S1DdFhxH5vrYdpiKwzQsDClZzpP1T+FGRNpl0FbRLLq+BnXl09GnMr+rbaSARLjtC2jrqMMX0s6TL9q+AP6kUUv+7QHFcrR2gTKXtrUTzbbmu+zXHeTNn1BhXVAL1I85pXXKxy+A1SYLOx/wc3iZKDjjbkviunvg5gMTDe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764960647; c=relaxed/simple;
	bh=wVWV9v2dndzW9G7C9zHZu6Hf5HnBKJQnlI/RL0C9pFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WqrHgYR8G2spJ0+tSWYi5G2XijMFGjlrrMONTLDQ/dCk/hGBTv4b5TnpuV/a/R6jSUiwS/nEZVyIxswYTNM3ys0BU9Mp5zdssBWMA+zrLpTSdYDjOvlnTQDiZ/2aHbtSFJ07u+k/7GUTHCPxfi+P5NiF/RXlp/xJDLeU9HEsHrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbvNVe8a; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbvNVe8a"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78a712cfbc0so28598717b3.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Dec 2025 10:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764960644; x=1765565444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+4FC9ZR4LnrPLjRGT6F+4FkLOaJCr0tyBTJeZVKrvaQ=;
        b=hbvNVe8aqZDkvqvIbTrt6cul8beqitob7GEz+4k6EmBOieS6v5eh9kHLQ58cIYLwRy
         OUh6FGF0dbzagHa1Yd8uHOGyjLn/GjxNJ+K2UnjKjQuUbIBU5c2ILTrnqQn9sfwPS9X/
         K2g/t9a1JjU/PcF9VgbrSDUPOZEvFU3aAz82/Mc5I4TRS9al4T7Ck7T5rOn+7WXRaaIS
         LX4kd/UgnG9jPSfg5WbQfNpmCl9u4DWPsMaDJbzsqutkzPyU+LOzmfz/1ppu7oE1K6Mi
         OGkD+5xlj8aCVVJ9ZF1wgPWuf3luoctXwb5+b3XaXKtXNj6O7fhrXqHN2eKc1N0KzxBh
         cpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764960644; x=1765565444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+4FC9ZR4LnrPLjRGT6F+4FkLOaJCr0tyBTJeZVKrvaQ=;
        b=WyPegfTM1PZ06fIgaRr/jEUXXWpNRvvnLwsGAe7P2KrB/GCZgoUBVwLnTUlpxi/gnZ
         oh1qkLYeaPyBj8c5knY8Ow84I+LzM6o9t/ODxUvbtryRkXwqOPD69mk8Ac/pQNfRmX6Q
         7E2F7ea8QQtQ5CjTiLwLyXClvDm4WvcBJwsQHprVHEr6F+Gv9x7nXHEeVYVM9Ie16Xip
         pVX7VAWLt9bF5693AVUkOCF4KWhTZKBicFmfAE7IAas8dVYI+rB4mwvYk8gHbLSu55R+
         rwzG/KmO3ICWpZzMCwp/Qa1aAGeCJxOUn8IsZfvSGX2A3ZOtSxnVi6DuJJD3ae84C0PG
         Iweg==
X-Gm-Message-State: AOJu0Yyot7dY/C8V+g6xltdhnDhc6xZgNgWlqDfhaV+v1hkkKeMH6Zmd
	g5bXOPv7L5JCoPIkumVFkmgfr8lI8PP/ZP7YicceOO755L/8k6AGGPmVAdrp+w==
X-Gm-Gg: ASbGncstaOuCFvLjUoqD0ddFiuQP8jILTiu6CHLUm0/eoRyjqietZIIo0CSS+vAfWXz
	Jk9v3M00PRKvvWvSMulfeNt/Uo4hBvx57LFdLDMuhA9tThcrCxJK2RLGM5OtN3gK0KN4ima5EC9
	Nl7Th/hjzsiQKWo05G/J/zcSol097pTEajPPUcP3apcr8553X86q5zTNkYKbLWo8La1OPf3/XNL
	9w1S1d9uLFx/lmNauVoQzar5RSPIpXnqjzuLqi311NpcYGJSASry0eGrUgMWbpBBfHziOyj9zjn
	l7im3dKcbN8cSHExqHrZRO4klBp5gFTu/Yo74co/VI1LWgyo7YIoYqSIwjy5NE59Kw7ZvddfeUo
	gTNOCN4tPXr1OWZjNuOE4HV1cmmGYZY9HKu/fX14dxqsiqggFyyF9eAkeCAbT9Gsex+hfGX1sBU
	P3jxWgV/3C8UGk
X-Google-Smtp-Source: AGHT+IHDnDPvUbYlQgcriJvfjhySPybGA4/BWIL9b6ubFJhIXF54dFxJRTUU+VR3u85g8j4D/Pioig==
X-Received: by 2002:a05:690c:6982:b0:78c:2a2e:e9fa with SMTP id 00721157ae682-78c33c1612emr843437b3.32.1764960644095;
        Fri, 05 Dec 2025 10:50:44 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c2f0aaf83sm4586407b3.32.2025.12.05.10.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:50:43 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Fri, 05 Dec 2025 13:50:10 -0500
Subject: [PATCH 1/3] platform/x86: alienware-wmi-wmax: Add support for new
 Area-51 laptops
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-area-51-v1-1-d2cb13530851@gmail.com>
References: <20251205-area-51-v1-0-d2cb13530851@gmail.com>
In-Reply-To: <20251205-area-51-v1-0-d2cb13530851@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=wVWV9v2dndzW9G7C9zHZu6Hf5HnBKJQnlI/RL0C9pFQ=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnGmg0mC5S4r26qK3v/SPf5xYCQ0xM0XSSMcs8q/y755
 cdSfsmoo5SFQYyLQVZMkaU9YdG3R1F5b/0OhN6HmcPKBDKEgYtTACby7QbD/8TA60qv5t/3OTN/
 5hYb4ef5Dbp3l5xsazi0NbLu/9/g3z0M/4MmNLrM/dy07s/kzzf1tG+cSSmdaxy8aF3Us3m68m2
 LnnIBAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add AWCC support for new Alienware Area-51 laptops.

Cc: stable@vger.kernel.org
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/alienware-wmi-wmax.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/platform/x86/dell/alienware-wmi-wmax.c
index fadf7aac6779..b7b684fda22e 100644
--- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
+++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
@@ -89,6 +89,22 @@ static struct awcc_quirks generic_quirks = {
 static struct awcc_quirks empty_quirks;
 
 static const struct dmi_system_id awcc_dmi_table[] __initconst = {
+	{
+		.ident = "Alienware 16 Area-51",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware 16 Area-51"),
+		},
+		.driver_data = &g_series_quirks,
+	},
+	{
+		.ident = "Alienware 18 Area-51",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware 18 Area-51"),
+		},
+		.driver_data = &g_series_quirks,
+	},
 	{
 		.ident = "Alienware 16 Aurora",
 		.matches = {

-- 
2.52.0

