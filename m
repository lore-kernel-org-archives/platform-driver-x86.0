Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A3936606E
	for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134722; cv=none; b=PTCGEkaE3BMwNu9u3AC1pmo1XytdMqDLV412HqoT9LIe0tchvA4+FEILwXj/gwDI21BrwRxXTG8U/SMp+prGQef2GFxV4Y9BmwD8J2d3i7h2DGnxer/JbgcLog8uJh9GUs3KjuaTEHQltd+5WWIbZChZps7UK9Tz8d9dxPLbHnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134722; c=relaxed/simple;
	bh=JeFAGlclU046JIgSg4OVyBoSGPhLkEXsWzJ0ES221g0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hOBJgCr6frYf3aOr1xccs01I8BwjYp3WvOyFXscfl0XQ4u9Cp7+kYyb0lbEoNAPrKQeIku6RVyJyagNkFGICyzkXBQQq/QEc56ijmfd26wIOIm6ITVjOzzqpI7dLpY1sRoKz+z8w8UTDqbXpcHtCYReR9N9H0QlA4ugSBGC1xIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HlGCA5xV; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlGCA5xV"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so266017eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Apr 2026 09:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777134720; x=1777739520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDF8n/DtizrT4QllCHI1cUw7JqDkCzaU+Ja6VBXSysk=;
        b=HlGCA5xVch97pywvv4d7rQOR/7J261BZd9UbKLz18Y+I9fB64uG06scuzCdEHgPXlS
         D2sNts09R836qNfWLP/FefeZOHMhw6y1Ds2zfxw6CTJP3ZeomYmEr2+BEgCl5lDiCo0m
         +Ph7Su17ZEC7BtXGaOr0l8s2R6XNUBKOI9A/IogqJWP85PBHlyyd/KsvIx/C+BkaBHu5
         c5MC4sWuK6Sd5Xh9KZU3PlOLBw9v5OJUY2xvBLFxIMLphJcuOz4WSryQhb0f4JkGRpxT
         8vRTIC94qV8bMPWKlc9nXvVQttnL7T7imaz/P27P3t5a5baoQO77Ou5AaQQ9PB3DiCjL
         gUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134720; x=1777739520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CDF8n/DtizrT4QllCHI1cUw7JqDkCzaU+Ja6VBXSysk=;
        b=tBObjST/khNIHF1KUY1Z9SoYjBYu/ZnB6B17sdOvwgHUFSstVKLsZ9YbG+rk0uLGTU
         JLzdcymbObipOUFPtguctRXK06ph8T4aDP9V4frT2EVxNM7Pvi4S6qGozKL2NuqFa5HQ
         Cf+HsCOWwsa174n5ctEuEFzjPQxAqA6zpBlYJrKPq4XyZO0A4FCr7nqDI3zH7skkNvrO
         P+2Ak5Vb/HK9hrkUEtAAlk0eXrxLiUNwV86kqB0AWd5r1mu5alw1ci1Fkyn9tc1/cU2A
         tokW5vBmBkmO+QpVbJGUsfjhmiMFEUzof1OInGobdNmhKseeNQrlvTw56ZjGgirYGB0t
         L06Q==
X-Forwarded-Encrypted: i=1; AFNElJ8A+2outCUlyh+AqFx0hLxqkP3EmEuhPxGuqTXi4qYRXq6tEwUu14bnQZprXsk4u5DNA8Qv9oNeCSw8oM1jyWlzoVtX@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/1KBVqnNhFJTedD9jz7JzxPIKezgruIt9aKHv00YYik22vsL
	uk1nBXtFKMnaBYHYitBphmgD+6AzTMQ2MiP05mCecuyCAFAwpAtdLe6a
X-Gm-Gg: AeBDiesIhU8LP+QCc5UNivt5TBiWFHMEIahFPg1XLZUSulZmoPzpHCvn3EAlgD213E8
	gUmjwh68bHJp/hGSsvyNubN9Dc6GWnRyg/njSdM62l9nfHDRSreKDcGOw/rbhleCROkOAHvhvzg
	7+kVZwBTwheCn5CoSyJKFevPyV9WcgSb282HzKXNOmQgiXQYil4/pbt2BThUSjC34gw2IUvz98B
	9It9SDhJYMPdMfBTrDohKatSke7CMjvV1J3mU/RGYwjl8rBhjPXCGyo7R39kmTSRW4I/2fiTXxW
	KBBR3JIOyAzfHfs/wFrHlK1foeAAPkUBvWyb1omGnrhq9kts9jrTCimtuSz1C1CkmDk2usaGYyb
	nK7e6QPnykbIhGPvS7baewvT1YMpWHCVNrzfGIUh8jmul8YcHJK7klh3h9OCK3sKoDN1LhtKqlf
	2ckPcXi8QCQdOiI01sjl541fPwXDyQHzDXHA==
X-Received: by 2002:a05:7301:6096:b0:2e1:f72:3f18 with SMTP id 5a478bee46e88-2e4648c5f75mr22676084eec.1.1777134720156;
        Sat, 25 Apr 2026 09:32:00 -0700 (PDT)
Received: from TC-LAPTOP.lan ([66.143.226.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a8bd2sm35922547eec.11.2026.04.25.09.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 09:31:59 -0700 (PDT)
From: Thierry Chatard <tchatard@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: hansg@kernel.org,
	lee@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	djrscally@gmail.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	Thierry Chatard <tchatard@gmail.com>
Subject: [PATCH v6 5/5] media: ov8858: add ACPI device ID INT3477
Date: Sat, 25 Apr 2026 09:31:45 -0700
Message-ID: <20260425163145.8474-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260425163145.8474-1-tchatard@gmail.com>
References: <aehzn85IsUI-bcKW@kekkonen.localdomain>
 <20260425163145.8474-1-tchatard@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

The supply names are reordered to dvdd before dovdd so that core power is
stable before the I2C passthrough opens (on this platform dovdd maps to
the VSIO/S_I2C_CTL regulator, which gates I2C access to the sensor).

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..a1fa0be52 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -79,8 +79,8 @@
 
 static const char * const ov8858_supply_names[] = {
 	"avdd",		/* Analog power */
-	"dovdd",	/* Digital I/O power */
 	"dvdd",		/* Digital core power */
+	"dovdd",	/* Digital I/O power */
 };
 
 struct regval {
@@ -1981,11 +1981,18 @@ static const struct of_device_id ov8858_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ov8858_of_match);
 
+static const struct acpi_device_id ov8858_acpi_ids[] = {
+	{ "INT3477" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_ids);
+
 static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
 		.of_match_table = ov8858_of_match,
+		.acpi_match_table = ov8858_acpi_ids,
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.51.0

