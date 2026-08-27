Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F731E832
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 23:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787874758; cv=none; b=ZggAWU6E5/Zyfmu2iX9WFlJYxojI329Y6WT8KNHP3fPEjIawVXPqCqXcWDXx6oe8QXXDLD2FaPwmTmceoamt8vYtIqKzHA6/cOwTz5u3mBemOLVwOx0ai7nZTB6TzqpEBFMBfBnpEHn/Hjy2NiLbCPpAAQ0fndlOrS1C1l1m4q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787874758; c=relaxed/simple;
	bh=R/T2E3R24ceiWrscXHi19ccUmt/H/KqN545pYvOp2KM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fLjrx82bKKMEQ1nRzYCLKUxuAR2QjxLDsNky525i8B4qCKdYlFgZz5/01XrXpZyVK1KrbCUNR5YhjaQIb88obDx8PqJM4zDyOetWRxR6wfqEvwEiT3SKESGfmk+Z7WUP7LEkH6BGWkk/Z6yV4YQR/o7nDUmh/CuuMKv38k2EdSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5UDEmSj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5UDEmSj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f96c5b722so238973f8f.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 16:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787874755; x=1788479555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY4A2HRHPLdlxueRqz8ws1TBH55WZRrXuoNB9eDCsvs=;
        b=M5UDEmSj2ACEoOqjwtD4fmjmVQUvqiRVmJMgEHBRIFhzvK42DVe//50De2InfvXffz
         btMRAiVeeGZ8SLmjkEu8xXmrfh61nkiXFjP8HuIuDN46UqnK8lWLGM+pcwqYuHTbRQEu
         7OQu1fpYe6+rd2s/PBuY0RavKKhKsoES1arSUlOK1oDy1MvdDrQrhI7WFj9RZl9zJZ0h
         CYTjeBgE7YupOivX8D0GDZd1nOT7RUZZYtefTJXOGEXgaQYIuG2EI3WXxwqsFb21s7aE
         0CQ+zsAdDzKQK+1uacij8f/4X5HVOiTsp92S1xjpEc/hA7aHqn9UyukWV7KbBFQ/GQwF
         Uj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787874755; x=1788479555;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jY4A2HRHPLdlxueRqz8ws1TBH55WZRrXuoNB9eDCsvs=;
        b=gB9oUTVkCbARWYekQCnjiwLJFOVFN/jQppTEm1MS2/kVFnabbLs3G8OjdCZ8ORru/Q
         xYKtHWIacDmavWueyFwQavMgYomkBCG48x3BOMNGT7A+NMiqcJTHkJ6d9KnZHbu6apN6
         /TEFmqsN1ENDkRmUANW5KnXAOigiKjGy7aArsr44BaXOR1gGl5FLjN6un6qAKW7hh8Qg
         RblllwzGZt7M4k4qdPxxEo5cvZnsidIwZ2l560TdWgC9uNjAcM7CgpMXZHXDAv84m3eO
         B8W0+bzO2v/f8sfUAaQ8cYWjy/YXu/Lkij1CegaQy/oGX/Gu/ZHP5nua34AKHfv+vRJ7
         7hKg==
X-Forwarded-Encrypted: i=1; AHgh+RprkYtLDuHuJ6Y/rDLO17WoWAz4kkOl+ogcHYYEor6mRPi8ZfpqNpGpgWbGlQ0pcmKjvf7oQ4SSTDjeGzOkabwfyVp6@vger.kernel.org
X-Gm-Message-State: AFuF++n561h5r3PVybz+YMyGiG88TLv/cRkR1+e8N2O2/X6VVq1HXzrP
	SC74B1l7dwjplIUcUaeGg9JjKkywjiWE0UOOPMk2nJXooTBmL7cDceF6
X-Gm-Gg: AR+sD10nGHGPR7KBiUkKQbIhMdso8homuBS5eZuJ9HS0usreOUzcRs1T09tDMRExe5u
	DO2DvYBGbPmHmDZO9liizhBOECmTHy1jJ54SjwSX14a4Ke+bYAUVGrR424nEqGcTC2ggv3mG+fO
	BdFb6sirHJ8r3ZEAW2PMbSvI+sc3gY8GVVSK9OrYC1/kfSaUahOwcs/8ZhAh5iiVQ9b7x0OtFbo
	4SfzcAtX6uSFykPTPXThFhZt79Zm/e5LgZXZP27ozMLryY+LsiMwr/w4oWhDFuxDu3fE/gOzYER
	qGf4/KWDatx4Cz06XaP9zYgMA/vMShyhTsD4UbEn8hBCq2eg0SaPraxvLuS//ha/jTH0cCC8M1C
	5Ae7KAknvjjQmq79WJTk+2qnR7GiWPRNMGZXFC+h2mYaR/A2R4vjpRgDTzum39Q4ZKBGl1IszPo
	EW0M2lTQcitBxgLJj4QHkZ4vVZ8fS/ITa6LZSwyq8eCP7heMTVuhknX7VADRoeIPbhcJxr0VpOW
	FOl3mE=
X-Received: by 2002:a05:6000:18a6:b0:482:f724:f4ba with SMTP id ffacd0b85a97d-482f79de104mr3017541f8f.19.1787874755297;
        Thu, 27 Aug 2026 16:52:35 -0700 (PDT)
Received: from archlinux.localdomain ([88.230.97.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279e8b7sm12853191f8f.7.2026.08.27.16.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:52:34 -0700 (PDT)
From: =?UTF-8?q?Arda=20Do=C4=9Fu=20Ari?= <arfeliousheres@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Arda=20Do=C4=9Fu=20Ari?= <arfeliousheres@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: Fix board_params typo for 8DD6 board
Date: Fri, 28 Aug 2026 02:51:39 +0300
Message-ID: <20260827235139.154462-1-arfeliousheres@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When adding support for board 8DD6, &omen_v1_no_ec_thermal_params 
was passed as driver_data instead of &omen_v1_no_ec_board_params.

Because active_board_params expects a pointer to struct
hp_wmi_board_params, dereferencing active_board_params->thermal_profile
results in a type confusion bug and invalid memory access. Update the entry
to point to omen_v1_no_ec_board_params.

Fixes: a7320d6eb9c42 ("platform/x86: hp-wmi: Add support for OMEN MAX 16-ak0xxx (8DD6)")
Cc: stable@vger.kernel.org
Signed-off-by: Arda Doğu Ari <arfeliousheres@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b2773fc1aca4..615b4cf6fc45 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -337,7 +337,7 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8DD6") },
-		.driver_data = (void *)&omen_v1_no_ec_thermal_params,
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
 	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8E35") },
-- 
2.55.0

