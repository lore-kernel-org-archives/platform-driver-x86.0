Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBE9364959
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 21:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774388540; cv=none; b=Hag2gyiIGQxtHEP0GWMNIxCYkzhsNqTRCKDXEd1DK2Ep/EjARW9v3/EAKNNLTzqi4gxiBsl8X8eCoSOFTQBEfoX47xi8VdHJVf4sNokx/ClyRh2UrT2pQK16oedug1VUB6ISvahaWZXAvUY+6wKs8cVld4QvPCLLqDyaDMc++mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774388540; c=relaxed/simple;
	bh=kn4gRyG2CWdohr2zODJVwJLXxsAV9GOcDFXCGFJSgyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OixFFna2G+YRS/5nbjdDsLMiP7bnC81KuydyI4sK5BeeyNfSrEHeglROgigP14iCukNJKJT4q2BFkzcjukvdjl+YFUn/OIdRcyQckTFFxWdzdATUebS03zhwyoKmn2/Ra4KJa4k3S2HF+coCzlZ+GXfR3tWaWX/L8ljY4TQuLTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkdD2LIZ; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkdD2LIZ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso4194045eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 14:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774388538; x=1774993338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=kkdD2LIZ4aEz0CpE5rvhgIx0dSaoQyHak0gSs8XerBvnsASADHDWM9CUoaogcpEi6I
         HqEAVbSmVhItqvo3HhYggrztrOuslhW5p9nIe1fO3QKrwJPVoLbRmp9AFO3KIzTYsSy9
         ExvGzIJpTjAXYUiuCiZiN0nw2mL1+Yaus3LQzaWUwQuPa38NLCVTD7DUWp4CkOGoHOMW
         v25z4je4lJuybWXpJZ6Wrk7R13FUcwj9WLNjIRNMZZzTE6Co7W43yHjq4VzpAVm3hqZn
         rNzZUbF5PO4Sul1BD8+QdVddGqCdi74omxPZe8+ItkFnB174oaYsaUKwAvVd3iOlES6z
         SyOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774388538; x=1774993338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=C0e2+uq9n5+2/jJvDd1F4BmadnOt/hNkQNtm3gUU8pIm7nMSDQ9qM7qQpddsBxpFD0
         V1uMIecWj2H2aTV723xgDgDItIRvgPMWBCvu5bknreMJHPRQkcYWUn9qtvArKJFB+j4Z
         4d+GTRW+Qphsy/3h9OF+o6W3JvHYkjdan+gg+rsSKTplvntYkEmRyFw5OV5Hhzy3edjl
         4TbxTLFjwf0+kSQA6+6Wtdunli2o3wkfjHY/XxWfyzmHNxneDAJ7UIOGlBa5ROuuXkoP
         8Af2ZdVqX1PSRltZfGWhkISj++2PgA4L6WL/s5MmtYjUFKEMIjsTtSDQfeiy2SlQ9M2Q
         436Q==
X-Forwarded-Encrypted: i=1; AJvYcCXq6TVPPKQaC14s9n3aCfD+g3AtNH30DGXb1EYaAkcNYxVEaTh7wvciCo2/Ash7IG3hp2b683TL8r34qzGEdrSNA8R4@vger.kernel.org
X-Gm-Message-State: AOJu0YyEsRy5DWd9H0NB91mARY9GnMRTCCvmQ2Oo4NV/YQRZWVwayLxO
	W11GBaHXkh4H3SULW6+qGk8QWj8AvZN6oB8P+aSxwUq831vOTnaj3zkx
X-Gm-Gg: ATEYQzz1XVwCY2M+73r1ea3gf9nXZm0iITHSWCjWp8zhN/IGfQ6OPLUJILwCfO0VNOn
	gDSdsLirlCY6rOw2C3UBTQGmmxX9J7z+AwQJ7t93ji+6pC+4B/q+WILvpxRktmnjg+/Eai4yyZ4
	olsESXo/IHcIIS+KywD7FHeEiwUvVNM4PcZD5T/EM3U/VtEhcBGJlueXKeyp592tjN2/ZOYPmsX
	gmFWuzRJx/qZrpU8frQn/6Lkparom4f6OLHdrg+kOdTrExZHhdvonCGXsB+DnQM8daDKyC40Zuc
	KVmc72hBIqijszWQAQSzyq0x1VuEBPdMpuoUZP/hbRrvNYbU6rT+wvnI1LyY4lg138UBCAmgWU3
	ag9FSnqr2W0qL7n91GQnIX/TMa1ESGFbSBAJFMvd12o3PLRaYGqGuEOmrP/to6kKSOb1DGmBA+N
	80G/YMgPktOl14xp5BJji8vQ==
X-Received: by 2002:a05:7300:fb97:b0:2c0:dc7e:ed0f with SMTP id 5a478bee46e88-2c15d329d54mr514614eec.3.1774388537637;
        Tue, 24 Mar 2026 14:42:17 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm3284180eec.2.2026.03.24.14.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:42:17 -0700 (PDT)
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
Subject: [PATCH v2 5/5] media: ov8858: add ACPI device ID INT3477 and vsio power supply
Date: Tue, 24 Mar 2026 14:41:29 -0700
Message-ID: <20260324214129.17300-6-tchatard@gmail.com>
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

The Omnivision OV8858 appears in ACPI firmware under the HID INT3477 on
Intel IPU3-based platforms such as the Dell Latitude 5285 2-in-1. Add
INT3477 to the ACPI match table so the driver binds when instantiated by
ipu_bridge.

On the Dell Latitude 5285 the OV8858 is powered through a TPS68470 PMIC.
The TPS68470 VSIO regulator controls the S_I2C_CTL register (0x43) which
enables I2C passthrough to the sensor. The board data for this machine
maps VSIO to the supply name "vsio" for INT3477. Add "vsio" to
ov8858_supply_names[] so the driver requests this regulator at probe time.

The existing supply array had a duplicate "dvdd" entry; replace it with
the new "vsio" entry and reorder to: avdd, dvdd, dovdd, vsio.

Signed-off-by: Thierry Chatard <tchatard@gmail.com>
---
 drivers/media/i2c/ov8858.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab..5bfea237b 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -79,8 +79,9 @@
 
 static const char * const ov8858_supply_names[] = {
 	"avdd",		/* Analog power */
-	"dovdd",	/* Digital I/O power */
 	"dvdd",		/* Digital core power */
+	"dovdd",	/* Digital I/O power */
+	"vsio",		/* Secondary I2C / S_I2C_CTL enable */
 };
 
 struct regval {
@@ -1981,11 +1982,18 @@ static const struct of_device_id ov8858_of_match[] = {
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
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_ids),
 	},
 	.probe		= ov8858_probe,
 	.remove		= ov8858_remove,
-- 
2.51.0

