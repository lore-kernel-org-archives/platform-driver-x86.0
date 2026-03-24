Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9663624A5
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 21:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388537; cv=none; b=MkYeyTDabh0POAQiNQuep7CuXQT4g2FmOLz/10sRyhzS/7CGR5iJDve7ogtFaVuLuC9Ed3QQCaoAa4qSuqZmYgC7c1mnqOStfzqKnR4hNoxA3GIgwCvuHkyhTZnq6uHGax1q7uw9YYSXUvQdsyQDewIyuHXj5DHHSKrkL5IdUt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388537; c=relaxed/simple;
	bh=wde4TF8CgNzn8si/JL9P12OCZloroRuFEPIxq/TcvgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cKGr3eq7OJzjV5aRZ/mU0iIGbUdVEiumW+qcKV5mi2KxJAVD8pePuSrtxbcjZAI2sD0cjWy+rhK4HibXZqUxe+/CieA8W25XIXbJAi7nsPNoH3H1X2cql/KOArVKZP0klb1yAGSz0X2VHFMFS6LeignKky8XGoxSLRfPttxojvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dLHSwrOG; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dLHSwrOG"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c160cb021cso88364eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 14:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388536; x=1774993336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=dLHSwrOGeT+W1RndkcpEeocleSNzFV/+NM9sjKqUlIGxqRTJ592xFEnC4n6peBvrl5
         pdoCq5YyL5N7A2goP3n9dXESTmFaQOJ1B7GupQinWxPXHkqtR+Lo9ZoK7ywDvw78sZGC
         vrXuFWlqnJhqd+sOWxjifn7y4G/ACZbdbzP+1CI2jk97InT0weCiiqeppcMcJNH/+DUd
         AjTQs3AYC2zzanpHWnOEslyzSUakbw5PmCeqte43bi1o+EKLTWroLit48l0Acrl/wKHE
         qHeCPlUAgjWK03lofsMTRr+CiOMlYwt40NQK2wbNM8hvOu1DwEvvBoyeFFsKMB2vZboO
         aVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388536; x=1774993336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TVHeDChmbK7H9JMCFb+9pqFytvxF0fdzrozCeGR4L7s=;
        b=svSD1G/c4clLqCBJanzr3FeVPqne6c3SbKq2ZQm77I1LH35LuTKZv3LD0OmrnC5dDo
         j7RBcSEhF3UWQSQk9xI8g5o/Re1cST8KiyKEveNDpW9sX36xgiaDl4HGumP3QsVZFIe5
         b8OnqzjkNL0IpreEI457s3+hDYX9Sql7rTLGptc8YwCX4zKKkNjjtS/4x6L7FX9ad/TK
         Adw5n9ipwIWKNuycnqQjCVwaLz//McHokrYQx7CH68dKh61VmOih9bYjZLfLbCfSXtAe
         MyVpPLcprIysUkYCVYa1DxZepnQdXxSVBKgt4aLZeUXL3F2PBwaqmT62GWKZ/no9dmzo
         w8gQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/2lyuQ+MwYfR8g194VjR6FcZxNREv8VqMUMSCR3yC5U5R5738/gEvJEyn7eSLAI5iJF2TT8iirT16w3jPy1ZFKHe8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw9Smeu11YInkdOADHHuaaqEdnUTZTyiM6coJQouRwaosu1Kth
	TMz6Npt0kU1cGn6kX+1wLYedo5vbvw+wo1ul8hqgzGRL+Tix88R+98T8
X-Gm-Gg: ATEYQzzi7BARCTrWgBkd8Zyy3vASYLixwGBB11ddOi3Sbszy/TpJXmzh4J33I19WgPV
	UgTHLhpZXPmS787esvaYtAvsY33Ix4Hha5kvT9mPeFfJPToNfi9hZq4C9sdE3mPTo7qhCHBhcpf
	/N0hEcT1XPIQ10p3QykrHtFs7T+Gms2DZW8bxTuFFw9KcCJPsdPXpRFPinQiZ0LfaT0u49F9Uus
	F7CtkvSiMloaG/7VhAQrXaDHDNkty6VRJA2bxsmwvKJZWxjI9+HE44xlFDeVJ/0MvMNwOOVP1TN
	n8Nza8iXVqNWJDJZyUNlPp7rifHUSXPHQG27qjKWTz2gz5Q/8dknhmn/a/s3RzHvn1zpLfBfWZ6
	cNcd45rodGAv2s+qmGSVFRx1aXYk11uRqOBxKmCV3wvLh3et8KdbOIKiOIyHcgZ162acg5dIVYz
	QRReFUqQT1/4s8NhOYmbhZ8Q==
X-Received: by 2002:a05:7300:dc04:b0:2bd:cfce:4c4b with SMTP id 5a478bee46e88-2c15d32b6acmr432688eec.2.1774388535594;
        Tue, 24 Mar 2026 14:42:15 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:15 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	lee@kernel.org,
	djrscally@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v2 4/5] media: ipu-bridge: add sensor configuration for OV8858 (INT3477)
Date: Tue, 24 Mar 2026 14:41:28 -0700
Message-ID: <20260324214129.17300-5-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260324214129.17300-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
 <20260324214129.17300-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 is used as the rear camera in several Intel
IPU3-based devices (e.g. Dell Latitude 5285 2-in-1). Its ACPI HID is
INT3477. Add a sensor configuration entry with a link frequency of
360 MHz to allow ipu_bridge to create the firmware node for this sensor.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index fc6608e33..f51749d0f 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -63,6 +63,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
-- 
2.51.0

