Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D23B13777E
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2026 00:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773965408; cv=none; b=E9grxwlkpXCRRQWZBVOuqdJRxaiu5x95yDGVIu4vlDZKmSaa37fzo7k0i4Ljugg0arO7k7VJ0wMJPrjFK4SQIV/Czq3AdgFVzWQRmXagk0DzoEzOAKh2laF38G3yHiDracWEU2LgVxuUuqomBq99KfCZj9j+3yjox+ov128LZZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773965408; c=relaxed/simple;
	bh=kn4gRyG2CWdohr2zODJVwJLXxsAV9GOcDFXCGFJSgyU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dKk7k4Rh1W6TlcNV4/RNyxjBmXCtWbHjheLkKPDKMVN93DI5HkOsrodIOEsuk3R2hrTRgRCILA9OhWa/B7kKIAGdS/p2IwdazW920bGzvbXAkuPB6W0NBSxOerohx9Z3kPy0HS90ZP5fdkrnVmL6I/kDZbBIz+kqofPmPjtDrEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEfI2I6i; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEfI2I6i"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so132561eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 17:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773965407; x=1774570207; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=TEfI2I6ilO80tW9Xbiu8tMde//mXla2kVH+ZKdr79mCUU/wmicYqYFKohM2U3/7uMD
         Ef8vrHnlF1ny4vehNWkgSe31jWxUkHdPzL9v/H0VjSypv3yR2UPGCWaEHo7mDZvZ/ZKn
         h29Az11Kp1mWgzwnSQQoDTRrJkyvBH1btq1+h7AREOOFC7mnNfmyjUc/uputGb7PSvus
         0bKBvR2SmTRMvI4EZW2tQ+BxPcTVuetudjqNUZ8jPk4+ipSlf2zjpOZs9I1Bz2yWqrfq
         vPOQ20rFG4T5j2C9AkK85oDiL4xeOhkHnRRgX0NRD0UuKYgfEKZNCHu/vmc19nb26YYj
         h1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773965407; x=1774570207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fItzBPGWBSGQf6v7HfvNDUYpHiJWqdhO3Tr8TUmXrPk=;
        b=VU6VORtVyJDaDcslOQM/+Z7rKFDZl9UKyDZDJ+2nzkLMX52V0DHL3sVBdjAYmph6Wc
         oWeeZ5jDPkV0ubSifcEpf9ykLP2WQKECL/6UTkXEMVM3qaFy7KT73X924jks3CFtMGLI
         gKDzWHg0euI2vyxnkEkRQxXJD+7+XIEFsojCwY+x3cnEYdUtKqI7Fzjv4OdBWc/OOxqw
         0CvheV+iSzCnle7SomJjzUjOqwsQZAnuNfKpVS1jQ+TemvDbzk2nToXIXZ8isCA7SnCB
         0x/oELAfWNgzY72gOb56Zu7sg9gydFqfnAcCjH6IOWOsYQhUSWcVbgAXPi46rMinl5Fs
         3tJA==
X-Forwarded-Encrypted: i=1; AJvYcCU0Syoqc+H4PEhZm+cuwikRuY6f7tqOZIff3RR3NJNKcs8wzYpBTF8vfH7tFZ8fKaArBEK8raOPfRrZgdXCpixK7jc+@vger.kernel.org
X-Gm-Message-State: AOJu0YxZVlUFljG3OHE8JVvymjvLJrvy98mXoXxG3/676K5t0IJualYC
	ygLdSqcKLSzqyrlvvmcNIkldb7hfze29r+EaKi1ry5XKprbllM0pNnYs
X-Gm-Gg: ATEYQzzPl5zGJ/753Wi9IAGt+IfURxqHdxF+Zk1+VEVcUw+Lcb+4qLd/AjMu6D/7a79
	2kmAYW+X90CXdfTT4M8dBbNENbZfg4T+V0nWVlXRQ2VO7BMPv5JE8UveFkDVuPJSe/cszq1ZIEr
	jqxT0R/ypZyEHknCWGYZ1JApSqqkqHHQIL+0a+AZHQyEQ+CgF5nKyVYzNELm//mv5cVDJgXZAC5
	8zC6BkKkrd24M9g2sxtcFybuo+qTLPY5A1I1cuMaqnXNOekTKcXuzXEXnV0pga6wZAJiIICdFqs
	b+zGnt0GleVgz2+Mr+KHYKnz/seYC3HwOECdPnwnVQzaMnJznlxSALn9JnkxsKLLO1fK8NmPPxZ
	+3b/OkJTXdCVwifvvbtVSELUw1D4vHL6AM1OGtolI+kwtumdjYjkg9GPNuyP4W2UCn4qYz7XtBM
	ZsUCQrbNBG4QVmrYvEryd8EA==
X-Received: by 2002:a05:7300:3252:b0:2c0:c482:805 with SMTP id 5a478bee46e88-2c1095fa724mr723316eec.15.1773965406563;
        Thu, 19 Mar 2026 17:10:06 -0700 (PDT)
Received: from TC-LAPTOP.lan ([209.76.64.37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm927960eec.29.2026.03.19.17.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 17:10:06 -0700 (PDT)
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
Subject: [PATCH 5/5] media: ov8858: add ACPI device ID INT3477 and vsio power supply
Date: Thu, 19 Mar 2026 17:09:33 -0700
Message-ID: <20260320000937.9177-6-tchatard@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260320000937.9177-1-tchatard@gmail.com>
References: <20260320000937.9177-1-tchatard@gmail.com>
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

