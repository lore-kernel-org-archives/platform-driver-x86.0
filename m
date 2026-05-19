Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CFE3546F5
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 14:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201844; cv=none; b=nhjqtLqodkAAY5KR7SxZwiB84mUqlWLF/3lg9vx36h2wLxgayt4wDUi59PETkwk2ep2dbETu7tzroBB59NkN2mwFERnojBR1/UdJ6YcfoRbfg1lI0U6s2b2OsejTrsvyLEUNBhKlRQc3uElKwHeNIIPwvdT5w5Ikb90ztiDnqRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201844; c=relaxed/simple;
	bh=XCLr4dMNpNmVuqJRON148FEbfiD0spae9YaoXdrizoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RKBHrbTTU5zCoNgzbQCNIjsVLW5oJsyaUWXwBBEH0499IvHOPgYTmDZ7BigPwV9Bg0eB+fJYqcJCpN4LBNHxPTHNnbBvNSZ+rJNvg2MClCN1ugwcsh+VIa8kHUzUflKxtW63Or88wTGd+1L6mcIR9EXjEXEJRU/RE+OTFYz4cG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=jCH8pGy1; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="jCH8pGy1"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so2656038f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 07:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779201828; x=1779806628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vcR5GImXduU7NKlcYNbLjroUBl34TQ/SBpsTJP/4f2w=;
        b=jCH8pGy1jsQZndCzoij3DCAW1khQ67429hjGszL2Ip4+LYTmrZyap+/yEB8W16qJWa
         7yWWDCzRG3oxcsVe9L5Ve2uNdx68ZL1rrGt99CWOCUPCN3wnWd/LPo9Wbq3eZbrNzno9
         jKj7hAJyZN0asxxk9OvTteF4rOOFKke2z7H6n/SVFTKMuqA5SX/dEX0LnOygms8lyvTn
         ki6GD7j22QI7xJSQgXNrCmsohISEL8R4eT1xyYJHooOE5IGRTIMADG7tMOnxo88ChiFG
         BclINXUblozPDv1yjt4ahkznusK1cQ3lB+glMn6IQkcCob/VvSwB9OJY7d+gfoA4Q04O
         gXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201828; x=1779806628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcR5GImXduU7NKlcYNbLjroUBl34TQ/SBpsTJP/4f2w=;
        b=A5F2PbSwoW/FmFXLIOTf/RsckJwA6tQ1B+5vYVXAe/HsEAOTy3NaL20SaxC/S4plPN
         ubQ2e1AmNHaZlRNe8dsVZg+Pyy2ESVnf8xlgfo7c3u+zww9JPxvY4b9StvGIH5qU0TCr
         Fw0lsDnnAx/3Ug5K63na2eZEx+11YP0EMHxN/kT7z66WumhLSTbuEdg9mY61g4kS115b
         glRpv8MReKflfVN42Zl8GNYZ5DXNoz08RHh1CZ+8JNtY6GYjlpCvqJm64cftpyvMLgsK
         ccX3qWWkPQn0UQJ465dRVIC/rpfPwvXe1DEa7Ht/M4BfKRmKUUfztABO2QhIv0UI0wKd
         ngOQ==
X-Forwarded-Encrypted: i=1; AFNElJ8g+eMF+Vlb8vkvQh+UpEEv/TbBZo+f9XASC6dSIShOPi4XwnPylq36IvY9yXnwiAcrexmmPIu1HgKDnYqQMfkV5RvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxX+0RinPX//sAqNr63XVq7s+s9xy3yB7ziQb+noH/JZjte+K+t
	XmMXYhTDRKCBz4f/PjEK7RBxjJrcprSxBM9UBF2xT3Po6GQNfL83c+I2clwGTKZ1KJw=
X-Gm-Gg: Acq92OGdf8MhNzftL8pDoP6q7jAHHrLUm7YUY9KFuhsGoq14RfUylLchg9Bzto9L50R
	ZrtiRbKIhqmhZQV6tX+yp2eaugPucJD5R8vU2McPeISCByC6MVLIoW+h4XJdH0NGyvjrua7/tvw
	AR3sAo2L3QO+/NPx0g9h6n7zyriSjwbKr/mwZAyK46GyyA7g6x/cIYJB5EHtUeb27TVjNfToP4U
	VGXGRDoCytHadMs9EA5i6b7k2ttNReo18WDxW5x5lD+chhe4VEsCUDZil1KftHwASwKv4S85sG5
	eCIPAaNtfqqk/h5EsFhxpj/KWEhUh2Mraivt6xUQBo7C7Z2rHpOMhYGkA0txwEcGE/lzUJiQs7a
	4jf+iQ+oCfwpQ4rUmtu7UoDEjY3bwcwDCFZwknv7tn7QPy0u4OPpihbCaOYaU2OzuHuZE4VKo6v
	GpfMuF+6lp548a3LhYNTPDG7eOOPMFKJT5k8FuAqkpCQCuedJjbcyWklBwLeMWZLva4vHjotv3L
	TSvfKmIdgfE7vc=
X-Received: by 2002:a05:6000:2dc2:b0:45d:4c20:7285 with SMTP id ffacd0b85a97d-45e5c5bbe46mr33707021f8f.6.1779201828502;
        Tue, 19 May 2026 07:43:48 -0700 (PDT)
Received: from localhost (p200300f65f47db048a8dfcf61053817f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:8a8d:fcf6:1053:817f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da15a666fsm45712025f8f.36.2026.05.19.07.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:43:48 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] platform: arm64 Use named initializers for struct i2c_device_id
Date: Tue, 19 May 2026 16:43:41 +0200
Message-ID: <20260519144341.1589034-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3514; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=XCLr4dMNpNmVuqJRON148FEbfiD0spae9YaoXdrizoQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqDHcdbQjH45ldiBKbk4achgWbtU7ir5TShpmj2 keFi47qkAKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagx3HQAKCRCPgPtYfRL+ TrGGB/9QgBHV8KcVOBAy9wZhzQfVbsMmKo1VKwHoM8LoX/mIRnzmuIVTtuURgraExlkxs3GCZom QfYzHUb3gIqH3/qJdugt1tVmTwufx1zhjVlK0WQ9s3Vhj6o9QdOPari45842hCmh2Fpvqt1cqCJ e6WSLyd2M6SRjx0Z24d5MpxK9KMu9NyvxXPN5einFzTEpq+f8jfRZrpIh/npOMzag5UT3tr0ECU AaH2RcbsORuYxiFPux74W+e4QAiRo375GNZiSlv/O2ydbi0s4/+2MI/eemyxtrvAVxiFp75XMmK UKq29hTItRcjnsfPYtI2Vz/CQahvfKck5j7J2dbVqAb2ZsMr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

While touching all these arrays, unify usage of whitespace in the list
terminator.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch is part of a bigger quest to use named initializers for
mainly struct i2c_device_id::driver_data to be able to modify
i2c_device_id. See e.g.
https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@baylibre.com/
for the details.

This patch here isn't critical for this quest, as no driver makes use of
.driver_data, so apart from the better readability this is only about
consistency with other subsystems.

Best regards
Uwe
---
 drivers/platform/arm64/acer-aspire1-ec.c      | 2 +-
 drivers/platform/arm64/huawei-gaokun-ec.c     | 2 +-
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 4 ++--
 drivers/platform/arm64/lenovo-yoga-c630.c     | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/arm64/acer-aspire1-ec.c
index 438532a047e6..08d0b155a197 100644
--- a/drivers/platform/arm64/acer-aspire1-ec.c
+++ b/drivers/platform/arm64/acer-aspire1-ec.c
@@ -532,7 +532,7 @@ static int aspire_ec_resume(struct device *dev)
 }
 
 static const struct i2c_device_id aspire_ec_id[] = {
-	{ "aspire1-ec", },
+	{ .name = "aspire1-ec" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aspire_ec_id);
diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform/arm64/huawei-gaokun-ec.c
index a83ddc20b5a3..80a8ba8b8dda 100644
--- a/drivers/platform/arm64/huawei-gaokun-ec.c
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -795,7 +795,7 @@ static int gaokun_ec_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id gaokun_ec_id[] = {
-	{ "gaokun-ec", },
+	{ .name = "gaokun-ec" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, gaokun_ec_id);
diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..e7acb66b77f2 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -637,8 +637,8 @@ static const struct of_device_id t14s_ec_of_match[] = {
 MODULE_DEVICE_TABLE(of, t14s_ec_of_match);
 
 static const struct i2c_device_id t14s_ec_i2c_id_table[] = {
-	{ "thinkpad-t14s-ec", },
-	{}
+	{ .name = "thinkpad-t14s-ec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, t14s_ec_i2c_id_table);
 
diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
index 75060c842b24..a8600a977fbc 100644
--- a/drivers/platform/arm64/lenovo-yoga-c630.c
+++ b/drivers/platform/arm64/lenovo-yoga-c630.c
@@ -238,8 +238,8 @@ static const struct of_device_id yoga_c630_ec_of_match[] = {
 MODULE_DEVICE_TABLE(of, yoga_c630_ec_of_match);
 
 static const struct i2c_device_id yoga_c630_ec_i2c_id_table[] = {
-	{ "yoga-c630-ec", },
-	{}
+	{ .name = "yoga-c630-ec" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, yoga_c630_ec_i2c_id_table);
 

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

