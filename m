Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF66D5218A3
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 15:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904547; cv=none; b=oQUU3UOibk9jOMsehG6UXI9OvD77UMob0/f8jE6Hr37gpxueborymb3Sonmgqv5f0qUKxhGs4MR3R1bMKCR1sP6bchrfCkipnPz7MFJsrCiRwlS8PUlDW0pzkRVALPwDoJTJIiQjpq38rsNTG6tPfhjAKLze3T4tpOv1Ix+A/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904547; c=relaxed/simple;
	bh=4oUcfn/aG/2LlccdeXopD+FbwSKNU7W6lskF/8Ob8uY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Suur5JCvLU3InOCEfrGwyQvVSgeswbuaQUZ7bnLYi4COb4DDYIcXV6kbmvXQNYOt3aFDSgKGzOzP8dEwnSJOow8F3wUd+N9c/VNICAu8zp4LioemjFq7ifkfFeYEtVk0dZxgBapSG0XRFmSPQUnehvSGHW946anzWnJWF+8wa5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Gi193gQM; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Gi193gQM"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33c2520ad38so7093403eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1791904545; x=1792509345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YzTa31p3mVN/sH8ialORwNcbJ7+oKPie6pSClyvLsIA=;
        b=Gi193gQMliDZwYnnckZGPQepqq/6mTtLmHehvxcuqmUwtbZncJAx00gZIHuEL/q/8+
         MDkvwmdMAyMmMvh/KFI4GJzN9iSyOOXOsJYj0fYbsfaDBN73jIXNqz2U2N+/hW32Zf58
         hYKVoogrEyB/t1KdjLJ06e83kRGaoHwy2C4rLyG0ndgHfU9FNtSGShOI+/GTufyMDI1A
         RH4R9sdwhbUlaibW7jdKFwWjzqRImhtY9ZWCzGh3sHa+fT+T1bu0/aBHCxRU3NN1Fv7+
         C8jzLl46o65mhKdXC+VwT09TvPhL0cmKyzZ4gU/dB301hebxSFOiFdMy1GzKCTtFbyc5
         En1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904545; x=1792509345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzTa31p3mVN/sH8ialORwNcbJ7+oKPie6pSClyvLsIA=;
        b=rYMG6dMjY4ocFfawPJfq6Sa2SWe91VptPi1c9n9ZRFIgEhHqxnpWO6JPy+C9cHo4Si
         xx3VXfeTDcbr6dLb1kqmlJOQ4x9tkZoXE18DMxjGGx5yUa2hyCyZ58TRpM9h7TGP07My
         L7loe7tpo1hLj8n6p/Akb9QmGVrs9sHPgEguOg89933CTSnGo4QxyTSVvLfsEjV0U9Rs
         +b3LKM8FoORjLVKHefFQ/C3SvpgkYOyul6lFnoeb2tCZvaPKyK3k2uAShhiIOWC7DkiJ
         7c7NpbP/+SChATQYIWe9IbQQzwv+67Uyv+Qdmt9suKeo0Ia/5XLsPG1/kZYP1uM0coiB
         brCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLrADurSGQWbg0TOumVDYQnEZLx8WfGnCLrgy5FvOYtk58U2ZOKlYS3e2cz5X2lnG1Dj40nVBwsr2JG/uasIqvlw+0@vger.kernel.org
X-Gm-Message-State: AFq9FYJBMWq2oGNY9zFV2IU6RdRkbeD+0RDGwWIG9WJNxLyovSI2j32u
	HbjFLIjQKRt9Md4t1VjgkT6+pPcCbSRDslvuas5ybn2WZd896NygpCSnaWUlEM+BWHtDqKvjuKz
	oBjUQdcg=
X-Gm-Gg: AYBFou3kjlMpsn0EUTDPvKLu7TbyNuqnMRtVYplbMQoGy+2ENrU7ai1nhc4RS3lLT67
	kxwEFSCdXuzdoMQGBKUkHrqSjFBJjba/Pbu9sutbH4lUF2ZTJK6+8jONs466kimFoOqqXMh7sPl
	N940lP/AceNNYCjKcBiId9r9Ph/Ee2yHFvNJV+AHcecdVZglwOweqJBlHZVrt1MhWeySK3ID9Be
	2eRFLaTxYYOAQBFAk9UqmtIvdB9BK98c5rXDFiE0xHutxxl1HKPNn5VVoqdixfeFsyyDiA0L+b8
	uXh/3+nSIOCzqrm21mNWx05gSsyrEEKRBbzBgkfkwskMs6XjbBrL3zRyEqMPY6aeLBnZDIJ+KYq
	QNP9bFyfWpTQJpVpjJTyD3hrBO5/IXANseLZhQpssVDiCug/zVcseFqQIykDmTkBMU3XeKuIOAW
	omWdpjuF3Y26h8w1yz23EbWFhttjaL4Md2JpIAMpn6tXpo3X4FGUtrVWDA7t1NBPxBNOA4hBRVX
	DM0ywwRpjoEUi4=
X-Received: by 2002:a05:693c:895a:10b0:351:1e72:7470 with SMTP id 5a478bee46e88-3537e04414emr18187121eec.13.1791904544676;
        Tue, 13 Oct 2026 08:15:44 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:49b8:4c98:b3d1:72aa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358de54fe47sm30691751eec.31.2026.10.13.08.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:15:43 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 13 Oct 2026 16:15:23 +0100
Subject: [PATCH 2/4] Input: misc: use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-acpi-input-v1-2-53ad09ba82b7@thegoodpenguin.co.uk>
References: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
In-Reply-To: <20261013-acpi-input-v1-0-53ad09ba82b7@thegoodpenguin.co.uk>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Nick Dyer <nick@shmanahar.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791904532; l=2702;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=4oUcfn/aG/2LlccdeXopD+FbwSKNU7W6lskF/8Ob8uY=;
 b=Os3WfFvBA/IGfHGvBo8P3yLDwk4fQu1+7P1UF52NZo5URi93Zzs6fHaSN1TE3h7WSbX2hxsK7
 h4dIysiLhVCBQYdMK4hWkNpieqUR9Lrjflv8qN83NRWPV99bwlmvJcC
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/input/misc/atlas_btns.c       |  4 ++--
 drivers/input/misc/drv260x.c          |  2 +-
 drivers/input/misc/soc_button_array.c | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/atlas_btns.c b/drivers/input/misc/atlas_btns.c
index 5805a1a3bb05..e77e53ee9d41 100644
--- a/drivers/input/misc/atlas_btns.c
+++ b/drivers/input/misc/atlas_btns.c
@@ -128,8 +128,8 @@ static void atlas_acpi_button_remove(struct platform_device *pdev)
 }
 
 static const struct acpi_device_id atlas_device_ids[] = {
-	{ "ASIM0000" },
-	{ "" }
+	{ .id = "ASIM0000" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, atlas_device_ids);
 
diff --git a/drivers/input/misc/drv260x.c b/drivers/input/misc/drv260x.c
index 6c5c4c53753b..8a3d74d65d63 100644
--- a/drivers/input/misc/drv260x.c
+++ b/drivers/input/misc/drv260x.c
@@ -640,7 +640,7 @@ MODULE_DEVICE_TABLE(i2c, drv260x_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id drv260x_acpi_match[] = {
-	{ "DRV2604" },
+	{ .id = "DRV2604" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, drv260x_acpi_match);
diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
index 064243677fcf..dbf86ea778e6 100644
--- a/drivers/input/misc/soc_button_array.c
+++ b/drivers/input/misc/soc_button_array.c
@@ -603,14 +603,14 @@ static const struct soc_device_data soc_device_MSHW0040 = {
 };
 
 static const struct acpi_device_id soc_button_acpi_match[] = {
-	{ "PNP0C40", (unsigned long)&soc_device_PNP0C40 },
-	{ "INT33D3", (unsigned long)&soc_device_INT33D3 },
-	{ "ID9001", (unsigned long)&soc_device_INT33D3 },
-	{ "ACPI0011", 0 },
+	{ .id = "PNP0C40", .driver_data = (unsigned long)&soc_device_PNP0C40 },
+	{ .id = "INT33D3", .driver_data = (unsigned long)&soc_device_INT33D3 },
+	{ .id = "ID9001", .driver_data = (unsigned long)&soc_device_INT33D3 },
+	{ .id = "ACPI0011" },
 
 	/* Microsoft Surface Devices (3th, 5th and 6th generation) */
-	{ "MSHW0028", (unsigned long)&soc_device_MSHW0028 },
-	{ "MSHW0040", (unsigned long)&soc_device_MSHW0040 },
+	{ .id = "MSHW0028", .driver_data = (unsigned long)&soc_device_MSHW0028 },
+	{ .id = "MSHW0040", .driver_data = (unsigned long)&soc_device_MSHW0040 },
 
 	{ }
 };

-- 
2.53.0

