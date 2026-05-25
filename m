Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0AA2F7EE7
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 10:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779703315; cv=none; b=LuAN0akR5IYBtFr45qTSYm5weJGa/PU6trYuiOetvXn8AUfM780kTKLdqMNR2QoYqhkPWZYYUrIIIXPKMOsJAme9bGVEKsyW2WOoOrZ090mwLaKUC4Kh2NSMVp3QKbIXhC+gOwjZpEY4D2bF3i329sI842iAE+ZJhC9s6B07yWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779703315; c=relaxed/simple;
	bh=XaUik8r9RVpC2RC55aua4lGKMtDpbQOmquwbW6IqBx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DUUIo9uSAtf11JKV4e8n+iRcK9Hf+Wjlfq68vJWOvKJWZsq84FM5KiWaHhNtl2XYac+xeUO9tUtIOeMOD1vsH3rRO2Eb5zgGSbdL0o4fRIKFiNoom1cCBtqXR/bgNXoqnGPRoGoUV4HRu27sZmBpdAIlwnJKT8uo+SpetsLsC1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhesMD9J; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhesMD9J"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa21fa024cso7015060e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 03:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779703312; x=1780308112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFlJyIGslUHXmHpxj2/6McIIq+IKd5/lpNvRUgEESi0=;
        b=bhesMD9JRkdIc6B1IJrDAxmg8H4P4N7HQ71+cQ8hm5+PfV2iJhQToRXbppD16xDecC
         aTk8tSHnSEM3d/jd29ZWjMgyo8/es9FopmYTp+GivRbKYYdNWCNASrlhAVg5JWSZvKG4
         v/bmiP36sSXnpc/eIK0F3K2DoTpQfyL/VHux4JG1X18wd9k7M2h4ggz8RibVF/YaDEG8
         2x/koURgidl0VROQzPTlVOXj2ShmFG0AyrL6QVioV/ZD1uLIhTNIMBeSjHOHdrjRpZMC
         D8ESVu0HdI7kIm2PHgh1WjjSBNoBsH4yl3gcLj1yng0ijVlu2DaKRnDBdh8kauXVUhKs
         fMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779703312; x=1780308112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IFlJyIGslUHXmHpxj2/6McIIq+IKd5/lpNvRUgEESi0=;
        b=Ieu4OililqxwULJapJfFhzw70CAXpWzo/4Kg3OkkvPHf/uu+VbGp+O6DkKDZLt+OVA
         fguCEtI6yrPjKlxO2OW68iks1+lSZr9CytcRdppaoIBS5sJak5wciIaVlsuV6KMoIMxe
         MHezhp5YKmZS3tobY91UW+rwSuexUj/WgzZEoCpGf8EnQSc3uOxbAJALo+JqoAj8ewMp
         E7e/41m3pmygZdu7oz52jwXBY54evMvzrUa343Kn7Ua+nWxqr200DKTU1k3pOjSphCHB
         /JtQfczzol4k263i4oF4fBIcMf9QfiZysOxfgdRNtLi760Jj9NZqZntM6BGZmDqfORtp
         DtQg==
X-Gm-Message-State: AOJu0Yz6GSpZWHKdJE4S1FqkMng/HaCs7OHSA9k3OV8dItDZdhnqdorj
	uNTEZD87kOjez6dNqSWiymdHh7ol24U0Q5sNp44bNaHkhq/cwfpKyIaSJ8lUEsgMB95T/A==
X-Gm-Gg: Acq92OEeOVCzn8+Li/+PJUUzqQKaBrLT4LYAoZ2bBdni85mMh4Ba6eoABPlk8lWo8X4
	qvv+V5Shwpv7SL5MzrfvOpKq8LoUfME5eGsb/q2KPsoAHkXW7g/gtlEwXGTepBhu2VHu2ZLWYB6
	7lTf7j9vxa0L/HW8yReJJGi+ffE3T8SueWeBD8VLSDxN+4u9Fi/5P+BbPzhQZNIfycRQnxcuDtK
	7bhP8qtEYDXrClAblMFMOubHjs3ZDJsVpEd5Z5+WkQweNqoaFG5oU7YCWQkoKe43VaL7iRryP+r
	r8ETqvTXB38QLa7H9YNqbH9wXeQYndM0wqlfV5Lz/gwsaOOYATpLcufJiyEM9FbV9IApgoRng3x
	fso5b/cTZMLf3g4a0a1Yu9+kISz9zZ0zicYbxXLh9O4TtTsos0GmupBtn2qXeQDii4SzigUoqzs
	piBMv8zSRfflAkhft7I+ZqRsYVp4pM
X-Received: by 2002:a05:6512:65dc:10b0:5a4:1902:3d17 with SMTP id 2adb3069b0e04-5aa3239b51emr3114043e87.12.1779703312148;
        Mon, 25 May 2026 03:01:52 -0700 (PDT)
Received: from Katana ([89.208.127.113])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc0a4eesm22287831fa.27.2026.05.25.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:01:51 -0700 (PDT)
From: Gleb Sonichev <sonichev555@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Gleb Sonichev <sonichev555@gmail.com>
Subject: [PATCH] platform/x86: dell-laptop: add Inspiron N5110 to touchpad LED quirk table
Date: Mon, 25 May 2026 13:00:47 +0300
Message-ID: <20260525100047.20046-1-sonichev555@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Inspiron N5110 needs the touchpad LED quirk (Vostro V130 quirk)
to properly control the touchpad LED. Add its DMI identifier
to the existing quirk table, next to the similar Inspiron M5110 entry.

Tested on Dell Inspiron N5110.
The touchpad LED works correctly with this quirk enabled.

Signed-off-by: Gleb Sonichev <sonichev555@gmail.com>
---
 drivers/platform/x86/dell/dell-laptop.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
index 57748c3ea24f..7fc3bbb8c4a4 100644
--- a/drivers/platform/x86/dell/dell-laptop.c
+++ b/drivers/platform/x86/dell/dell-laptop.c
@@ -222,6 +222,15 @@ static const struct dmi_system_id dell_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_dell_vostro_v130,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Dell Inspiron N5110",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron N5110"),
+		},
+		.driver_data = &quirk_dell_vostro_v130,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Dell Vostro 3360",
-- 
2.54.0

