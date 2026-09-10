Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC76536B919
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 04:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015504; cv=none; b=Sz10Q39dB1DX/h8KlVm6TIxBUUB5iMd+992zLLb8kPru4MQazx3cVftJyFNJz/iKiarDRUXQ3Uia/YoXW0ZovkjXCsTDjMIZX/eZrce29SMF+ByEBU0vLTBffvxzUhBormtlChHrbUnmc0tAX6v2RTMTUh6hAccJ6GG1HnnQhXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015504; c=relaxed/simple;
	bh=0bNxDq/vogn+h2ZSU9Q7KBh41Cn1MPO7OvkNK0LGHEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sv9Eu/7nwFmUtq5+Arr/dVxKhwCzud9zMoIIRJVFy/sIkQtMQyjexLMnC19eBsWOysJXXTbh7Fqo1VPTWOmwMveJDu6R2Cuv5rYf1GzCiWC7YQaYiOMUzWR97vQ2JvJwrxlOlE0eLUp15OVnsoQmupEVg0AVMr6xlaVXUnvRdpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rIlZBAUG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rIlZBAUG"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d6f9e2f681so75491775ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 21:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015502; x=1789620302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=McHzMY56Wzu/sCH2qesK/hXFVz4O3czH8rhM2GCpBPw=;
        b=rIlZBAUGp/f/1R0x4HOd3CRmAPJyId5TQ+xOToFphzMeaOcP2Mr1v85G8dNILNZcse
         mlAhOVIv83tiWSOcOo9iAdJxcw5pzrvMlBhsfZEf/6RRQ1cTqJSddz8DxXvSEadySNAT
         QPRqgd5akQhzBOFaIFxoZN4bukh3LuTReo6ejbozKG6z+npkStXlfNv88/nU7Rdiwph2
         LH3tdxDZAJ85zN/J83ciL1IFNMLwO92PQdDR4S+LjXUjtRVCNh1b7JcxXp2gtSeEIHiA
         sJsXH5hJ1jhKx6LID910741gA8EyEs1suO7rRL2mgzLI85Jfi1X19xNW7Yh2tHMkjyBi
         Iwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015502; x=1789620302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=McHzMY56Wzu/sCH2qesK/hXFVz4O3czH8rhM2GCpBPw=;
        b=puIZqJqrs8ZrCVV1ttQlyQiSVk/lbEm3aOIA7Z6EmGw3BaJeTN0KHpB578hHGty9D+
         y8vXkMUgeq9aTKC3wb07LZe9bCMVP5Okn28g9rcvsEZy2GShF0Q8KkWrs0F8tBBOyyK8
         Ktvhu5eyVH4eaYTJziME7S03yU2bHNYSAeLl2DCFLfZk/isO0gbZQ+HJKf6SXKICvgV5
         GpizF/VAlOJeVBkSfmeaQakgxlL8IT4okjIp1o5Wpf7D+GgSkVRKoZW5D0savtK2CfpS
         FLYCSvyUTGeeD5VFnzoeHHJj3pkizDOfs6gUTmOgRWG46UlFMDXyUqfLgPb/qX6uvSPZ
         VB4w==
X-Forwarded-Encrypted: i=1; AKwUvBzCa3EYssZr4s2G9NkPSgEFtip+0jB4c2LWbajJaCztWid7FE4bwLf9a/oLlYZIJ6v/DqrTO6f71DaZ5DTNgaIcfX/r@vger.kernel.org
X-Gm-Message-State: AFuF++n88m16SMI6UvgpyJoCdJlyIhTAIow/2b0K/kbps5UsFpzRTPMw
	0HfNQ/pCy7KtvsXEUkeoxz6RSqDJYnYhnQLnHPUt7aa7vK3AyzuBTliv
X-Gm-Gg: AYBFou1FgECUQJnB/xhRSYqXGVha4m4LuQ4XWl9yjMC0OUBwuR2vqNiSvezGIrZA4C1
	6R2sTvV0XI1gZKdI/RiRonhpNqlQ0tl8GIgTpMygfW3cws9fAbHsc/pfACOZojQkCesxrnqDvO8
	2GaKOS2lRpOMdnF9lFAuSYIpvmC7YhJ/YYOb1IliiK6kXjK1AVXqOfjQusoYj4KoVvUMdbM5LTY
	suH5xnq7uMtgHI4fKBIBbm0aJrsqkDqMkJRBstzRArOBGRYqQuTVyUygAVwmcFnMeiZminP3zz+
	fqPMYUgdR8VDlmEKIXJIzRmsxyJmZ0xRL9rFXO74omeVAZPHEX1ANzTZ1Y9Oa4Y+sqcIO10Geph
	vcvmwP9JdROIhQysfX7OkCoGAg1/oMyv9k0G8rAZxhz2kSlEhVIjbfzSRo6bv+woJJH+ipjDIl4
	pOmpPAxg9g//kdBfJVOzROAdY+qT1c87WF4f+AOR4SVVQPvzqfJTsUqxKaiU3pi28biAHyUmTPs
	xMAUNVh04tYuuGMBN/ClOna/g==
X-Received: by 2002:a17:90b:538c:b0:38e:b400:a860 with SMTP id 98e67ed59e1d1-39b26204a3emr61559578a91.13.1789015501917;
        Wed, 09 Sep 2026 21:45:01 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:01 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] platform/x86: asus-nb-wmi: Fix typo in asus_nb_wmi_quirks() comment
Date: Thu, 10 Sep 2026 10:14:37 +0530
Message-ID: <accb5d1622035aadc423ceafab32f3e6f74bffb2.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "paramater" to "parameter".  Comment only, no functional
change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-nb-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index aeb461b1644d..9b729afb34f9 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -573,7 +573,7 @@ static void asus_nb_wmi_quirks(struct asus_wmi_driver *driver)
 	driver->quirks = quirks;
 	driver->panel_power = BACKLIGHT_POWER_ON;
 
-	/* overwrite the wapf setting if the wapf paramater is specified */
+	/* overwrite the wapf setting if the wapf parameter is specified */
 	if (wapf != -1)
 		quirks->wapf = wapf;
 	else
-- 
2.48.1

