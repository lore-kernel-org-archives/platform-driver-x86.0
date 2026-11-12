Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502492;
	b=1L7iJ13SeDMKfEqcm0pIdse6NcG4FCnggugMLNNHi110mf7XegWdZLpuxy6S4eukh1cI
	 UE1Q7P0kbpnMayk9ugWtzwtKuSjcKbsXFSk6nWygt44s7j8bGX02FYCC/iroW9Y4kdodc
	 sC4+aGhtHI48oyLcOk8ZXI7F76z9uZd82gaY2WCLhqc/mG0k90BLxFwVjTMB6eLuTLZQd
	 7ygqFd/ZtWBjLHjZO+Kw2ALZeoX94k4NJahnd1roP6NTXiG5MEpYRcVF6IQBILfPUN76h
	 43xiDKH7rLnNHj0nUtqU4gIe5CT0p6wl2Kn9K428C2AxQ7sC0l2Wg3s+Hn2cSglJpjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fqqhsv4HNVlwlDwd/MGgk5Abc7qDWDaQ0rMfWr6u7Ms=;
	b=odQkjUGZCsKaoxBaP//fZrNDA1DWYxNv3lkOhlgjSaKyOpeXFgvOuQvxAokmm7sMpvrB
	 xp3A6+P0ITtqeK4jf7xpeC5cK8k4S6BIP+dZXfwoIYaYUNUu6SsEf2tGZTTwplGvRTObU
	 hIpgMebWXXkVgw4s0N6aToXgHWmUHcWwL9kj4g2K1db0m/EwLogmP4zzYtumHxrBunSpu
	 NDBX97tT5NL1kJ0Eda8PmXBa7DVSXLjYrav+QeOSt1LaII7AtDlzKl94qXt4AwWcjh2UG
	 RITnH37Xa64uStc4zKgKOhjBSc7Oh0kYH3DahnlZUlPHZnsiRZXoQF10gs9MIFB/vIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xtwj/7nB";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129FF606A327
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 16:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 129FF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xtwj/7nB
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so3297966c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 08:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794502491; x=1795107291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fqqhsv4HNVlwlDwd/MGgk5Abc7qDWDaQ0rMfWr6u7Ms=;
        b=xtwj/7nB6IzT+eKvlx6Vm43h+xfCwnWN/lGVIPTbiPNj38G8BAwDbdPde+nLaRu2ao
         B6W696dENvc30r8NzhdXvLebPnOkJWNUQsbi2WPOBg5PJJi8aw8CuR/VuvjFyV5gb9GX
         XvYB7h5OUTHesjQjsuxR56vez1Sab9M4Qq8G39ywpM2APZzlcYCBAZEKHAnWmScxmGXJ
         0vv2LX95vMnt5/knfwqwW15ACi2bXGWSThqnwAFqsgPnVd5dItvu/4Lm780hsporRRa4
         A1DxT0UcPRPgujkpTyeBlC3if61c9pOiKItUUMrtz4beGK4ZpJTfQXevC+E6ea8wmTUq
         g+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502491; x=1795107291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqqhsv4HNVlwlDwd/MGgk5Abc7qDWDaQ0rMfWr6u7Ms=;
        b=WPIZH6zu1ifrNTzo7ZCGaKqcLQ5lzLW7vzagWNSK6hNIlieh42Tfyn1sF7yktQXZY2
         LD0qdJeQe8TBmAFl6mNspoWASYe84sK99THmhLp0f4gDqCRygBOdznZbMw8E4kZjtHSl
         YgbgTuDKMPxtuvRH2etx4QWGh7Odn9XTt3mBnm52dRWIRC3S6tSXZgUoXtgAsa1sSH8F
         jZ7hx58V+WvT6iS5AyCR1bdlta75or4fmXh6O+JctAgaLJo+4LXC0TNj3JaR6Xc2AWPC
         Hp5GGdogqHOQ1Ch1h/yGJwVFs+sHhzQxYQtCcmPh8zHuvXgkQsDjfUccdXhm3RQlJm0l
         QzGA==
X-Forwarded-Encrypted: i=1; AL+hErHZ0aIRknQrgSYno4Ra/iRqK6Dn9+D3msawBeE6yWD+lUW9XV+9+b8eCIrDV2LC2I3v8VedXxhDyvw+Q6eTvp/I6MMB@vger.kernel.org
X-Gm-Message-State: APuU4Z//FSKuKJvjhA4lzSJfF5WEzgLgTOfQ0xwL2oVgfjABzrE+AhfS
	nqx8CfqIefUAsyR1+Va7Q90OobRRXa7qVlHQoPaPAZEx2MKRiMyE6I6i
X-Gm-Gg: AYBFou0kayliqVeXuf+4a7A7LhaV89PVcvISWC49JoxxUYWJDG3FhjWv1E11hl0qxG3
	Z8Kb3e7CZ1lfYcHzfWNproQlQUQDjS9qnX/KutLNQVG2CT4Z6ln6RDsLru/wRr62hw1I2Iw4EDq
	27PM8yzT5uFoUx0Wu0kXpGXeWlrlP88nYPQnURJ3z7MltkMWKW8iOJrOGY6HhbSXcREV1GzDqmH
	1iAgIth4MhPbybaQhxGDNFW4R8uvhHcfgUrl+JNSJZxR96r1lQfM85Ix9XD5UWZnVMYi5Nk7BRP
	UgyCCe0YdP8+qButT3VywA3usf/B1U6iZ6jF+TMdJhvN453odXNls3UFkFEDByyf48bOVJFcqln
	/EzivU8opNM4w9nQy2P5BLPfDbuT3sVBEGQyO4yKOmKNlh66cvXafYGw39WXpi4c1qtOykxk2Ye
	B4jbD8ZGUnBr1/VuXDmtwqAwexc4LeW3DA3Kqzpmu6m64AR1K9X2uRutLv3XTLdW/z/7fWJyTG1
	MdU16c12wqrfzp6PbUpjGBJldS39zIyqoKPK/G2JL4aDv9kvu8j0uaUODAMmBPxr16yddKuiqTu
	XonBDFRmlXNA7IkD5fRHO1aWQwkjogCs
X-Received: by 2002:a05:701a:844d:20b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b50312ef36mr116784c88.19.1794502490931;
        Thu, 12 Nov 2026 08:54:50 -0800 (PST)
Received: from omarchy ([157.10.22.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm332905c88.5.2026.11.12.08.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:54:50 -0800 (PST)
From: Jamil Khan <khanjamilahmed202@gmail.com>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Jamil Khan <khanjamilahmed202@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: samsung-galaxybook: Re-enable ACPI features on resume
Date: Thu, 12 Nov 2026 22:24:32 +0530
Message-ID: <20261112165433.64461-1-khanjamilahmed202@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver enables the ACPI device (SDLS) and its features (notifications,
power management, keyboard backlight, block recording) only at probe time.
On a Galaxy Book4 (750XGK, SAM0430) this state is lost across hibernation,
and after restore every CSFI call fails:

  acpi SAM0430:00: failed to execute CSFI; device responded with failure code 0xff

so charge_control_end_threshold, the keyboard backlight and the
firmware-attributes all return -ENXIO until the driver is re-bound.
The performance mode (CSXI) is not affected.

Add a resume callback that repeats the probe-time enable sequence in the
same order, and use it for both system resume and restore from
hibernation.

Tested with a hibernate/restore cycle on a Galaxy Book4 750XGK
(BIOS P11CFP.025.251116.HQ): without this patch all CSFI calls fail after
restore, with it they keep working.

Link: https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/12
Signed-off-by: Jamil Khan <khanjamilahmed202@gmail.com>
---
 drivers/platform/x86/samsung-galaxybook.c | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index b150e1f..27a2d27 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -1381,6 +1381,7 @@ static int galaxybook_probe(struct platform_device *pdev)
 
 	galaxybook->platform = pdev;
 	galaxybook->acpi = adev;
+	platform_set_drvdata(pdev, galaxybook);
 
 	/*
 	 * Features must be enabled and initialized in the following order to
@@ -1432,6 +1433,49 @@ static int galaxybook_probe(struct platform_device *pdev)
 	return 0;
 }
 
+/*
+ * The firmware forgets that the ACPI device and its features were enabled
+ * when the system is restored from hibernation, after which every CSFI call
+ * fails with 0xff. Repeat the enable sequence from probe, in the same order.
+ */
+static int galaxybook_resume(struct device *dev)
+{
+	struct samsung_galaxybook *galaxybook = dev_get_drvdata(dev);
+	acpi_status status;
+	int err;
+
+	status = acpi_execute_simple_method(galaxybook->acpi->handle, GB_ACPI_METHOD_ENABLE,
+					    GB_ACPI_METHOD_ENABLE_ON);
+	if (ACPI_FAILURE(status)) {
+		dev_warn(dev, "failed to re-enable ACPI device on resume\n");
+		return 0;
+	}
+
+	err = galaxybook_enable_acpi_notify(galaxybook);
+	if (err)
+		dev_dbg(dev, "failed to re-enable ACPI notifications, error %d\n", err);
+
+	err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_POWER_MANAGEMENT);
+	if (err)
+		dev_dbg(dev, "failed to re-enable power management features, error %d\n", err);
+
+	if (galaxybook->has_kbd_backlight) {
+		err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_KBD_BACKLIGHT);
+		if (err)
+			dev_dbg(dev, "failed to re-enable kbd_backlight, error %d\n", err);
+	}
+
+	if (galaxybook->has_block_recording) {
+		err = galaxybook_enable_acpi_feature(galaxybook, GB_SASB_BLOCK_RECORDING);
+		if (err)
+			dev_dbg(dev, "failed to re-enable block_recording, error %d\n", err);
+	}
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(galaxybook_pm_ops, NULL, galaxybook_resume);
+
 static const struct acpi_device_id galaxybook_device_ids[] = {
 	{ "SAM0426" },
 	{ "SAM0427" },
@@ -1447,6 +1491,7 @@ static struct platform_driver galaxybook_platform_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.acpi_match_table = galaxybook_device_ids,
+		.pm = pm_sleep_ptr(&galaxybook_pm_ops),
 	},
 	.probe = galaxybook_probe,
 };
-- 
2.56.0

