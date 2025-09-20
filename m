Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391BD26B75B
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398871; cv=none; b=G4l3IQzoP4XGpOKOhRuYZMhqqunoid7hx3Y0+E/Wn/9RuS3Se6EANwxfvJ9JsqgOzjvfxjY7l4vq7GoCOGC63VYBgD/k1j3ChdKwJEzWzvIuYv5Rk9XL+3gPiSTS1Tz2Efk91sA2hqCCISF6vw7+HLbbmcbKYGrhDqpgOB7priU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398871; c=relaxed/simple;
	bh=ZzvGGiYpfQHJ4MvGXjQ8CRUmdUdtKZ3WWFhz07krTKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYmT1MvbS0ergDyfjou4I2bTr7IER5VD3r6Dy+0/OzADe/e+W4S4bUN/yKZYIR8px0bsVevNHOTth3w6y9Gls6w6oUQOruzA9gHYebCBC4b5b+4OZ3rMgbHKTe4siHHWETeMffao5gPDRDj40UrQZWH13d7120PgLy4ryW/lE1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=le/lY9/a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="le/lY9/a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64228C4CEF0;
	Sat, 20 Sep 2025 20:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398870;
	bh=ZzvGGiYpfQHJ4MvGXjQ8CRUmdUdtKZ3WWFhz07krTKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=le/lY9/aPnIiSN8F8JfP8mqGG+dyT2EwnVKW59bie9kbUJaqEkiXC6NK15/dv/an5
	 17/jrATc5sj8VpOoYBOagWGsoNFnFdbA12pTrCcEHz+7pcFzMMFc8QjABTAHptKZSK
	 6iiG88XMCJ1UhVwLPEijI+B+bDhUIThGy7nJilFA5Q1U5HQ2FBOH2oXuC2tCwzhkj0
	 aLQlTFUVG+iJHNk0AdONdFEKXhnVvuW4cdu+ySXP3G28bhPJnfcFo9vB+ubKOI5v6P
	 ROqS1QwvzdnrVs1/ssBFLG+qva6hj8GZhd4Yo3FxGxCyIBFTYnNpZTyPWUK93Fsqa3
	 Wk3GV10R8LRjw==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 18/20] platform/x86: x86-android-tablets: Simplify lenovo_yoga_tab2_830_1050_exit()
Date: Sat, 20 Sep 2025 22:07:11 +0200
Message-ID: <20250920200713.20193-19-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920200713.20193-1-hansg@kernel.org>
References: <20250920200713.20193-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lenovo_yoga_tab2_830_1050_exit() only gets called after a successful
lenovo_yoga_tab2_830_1050_init() call so there is no need to check
if lenovo_yoga_tab2_830_1050_codec_[dev|pinctrl] are set.

Also change the exit() order to be the exact reverse of init().

Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 832be02495b5..08cabaa5e0c0 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -594,15 +594,10 @@ static void lenovo_yoga_tab2_830_1050_exit(void)
 {
 	unregister_sys_off_handler(lenovo_yoga_tab2_830_1050_sys_off_handler);
 
-	if (lenovo_yoga_tab2_830_1050_codec_dev) {
-		device_remove_software_node(lenovo_yoga_tab2_830_1050_codec_dev);
-		put_device(lenovo_yoga_tab2_830_1050_codec_dev);
-	}
-
-	if (lenovo_yoga_tab2_830_1050_codec_pinctrl) {
-		pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
-		pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
-	}
+	device_remove_software_node(lenovo_yoga_tab2_830_1050_codec_dev);
+	pinctrl_put(lenovo_yoga_tab2_830_1050_codec_pinctrl);
+	pinctrl_unregister_mappings(&lenovo_yoga_tab2_830_1050_codec_pinctrl_map);
+	put_device(lenovo_yoga_tab2_830_1050_codec_dev);
 }
 
 /*
-- 
2.51.0

