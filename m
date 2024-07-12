Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F64117C79
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jul 2024 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720805212; cv=none; b=Fv2VJtWYFC3X9sdqhcvVtoWIbCKiJg635rJZeY2ApHYt+x64luL2uA3R+LlAcK+3r5LyVitC0LosnzIWJIZLhkhWvkFgA51bmuIKjq1fAi1Tx3AhjyFkVZ4p4AcivCc1pk33LBOQXIYp5oLrSSGc2bV+nlzrD1XzbAVokiwOC20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720805212; c=relaxed/simple;
	bh=7eLu9I0bV75lGKr9rxeG3bTFl6X47J1U1eUz7q8f0pY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pIQRuKvMO5n0TrFU+BTSJZ5KZVIB/8m2DPO0AsKWKZcWFg1NENbxDYMo8F7Djw2zkBUtOe8AxtdgnSggOMLwZqoEiIOoHfha9mT1yj1gS0oLQ1Hp7hhnzC9q7WwvDdZTbvcVm6aK/ZYjv3p1fl/8PMARAF8uOR1d3zD74VtDEno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtu0c1WW; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtu0c1WW"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52ea7bdde68so2459738e87.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jul 2024 10:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720805209; x=1721410009; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CQIsjPcydrCdY3Tyi5NNbfzMiUOaXq99BCNGr8szlXY=;
        b=mtu0c1WWrc7Y3LgMahHVUZQ8hqmYO4M0f5D2Una9Z76MIjVFo5Cwvmlfa0tVVs2npL
         wZxAmS+EUeFu9iRQUdPmsP5Af6mI44Sgd9DdCTKMpUFoCnWO0IEOqTXCJRGnT0uAivuU
         oRJBnV+Ot0yVryPka4aFBQj8WR0pWZcaakRbhLcNRpNkQZsTgmBQnB8avCz/xCDwJrzp
         p0DYQtVuCniwM1pc6VkfRWziuashx7hozpyeRqTkTp9wQQZAxoZapxyWwy5MNJFb1Fvp
         VbzLeozAD3fqw4W2uzCpXYZtNdPO5eeV4elnR+aRncizgHgGTWw0mqOTamMPQZhXejaj
         7FJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720805209; x=1721410009;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CQIsjPcydrCdY3Tyi5NNbfzMiUOaXq99BCNGr8szlXY=;
        b=fkmFxI40YwyhWEKSvacxFPeI113jVX9pfgkP6GpJ2NDw1N9dzf2NetWOP6Le7O+s6o
         l4UgCmI9Kip9mUU2rH/dEvS5gIiJFQjPuVJU6cn+K2MdhG39CWFULdajsJJPjTQK3y4d
         VTBgwOVFIw8cs35jdLZGYyySY+c9tvpdbm5DO3Pe+jyEpzlz/QWWBAGMV+wBAbcgUyaQ
         HZ/53937kD+FLuLxx++jSX8lOF6VkZtlXFV2EKmEzjY+u8+St8PYOpOc0psVo/5hucPg
         Cee4zstSN0P+TV64ZnumZpM9xVGGAQ2UHSCXezwXZfXaip/Wrwnj11FNMh6nLba0BQr0
         cFoA==
X-Gm-Message-State: AOJu0YxMTh+++6a9mjweC7wDIuN2rYuDCJX7GWBFAql08m9yS0y43WsR
	W98wAocFxWJvIeMGbrPEYNKa2I+TTaGr6etBRtPIqTfkLPNLvvvG
X-Google-Smtp-Source: AGHT+IGN8TYgRvHMvKbTVfSYoRrj97a1JHWNnhizFCHQn9fGldC985CcKRCjnK2syKty31BvUT1qKA==
X-Received: by 2002:a05:6512:114d:b0:52c:dbee:bdb0 with SMTP id 2adb3069b0e04-52eb99d4e86mr9634609e87.59.1720805209030;
        Fri, 12 Jul 2024 10:26:49 -0700 (PDT)
Received: from alexis-pc (cust-west-par-46-193-0-235.cust.wifirst.net. [46.193.0.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f264911sm28745835e9.12.2024.07.12.10.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 10:26:48 -0700 (PDT)
Date: Fri, 12 Jul 2024 19:26:47 +0200
From: Alexis Belmonte <alexbelm48@gmail.com>
To: ilpo.jarvinen@linux.intel.com, hdegoede@redhat.com, W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: Fix implementation of the
 platform_profile_omen_get function
Message-ID: <ZpFnV8w1558BW7iZ@alexis-pc>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix ill-formed implementation of the platform_profile_omen_get function
introduced by patch "platform/x86: hp-wmi: Fix platform profile option
switch"

Signed-off-by: Alexis Belmonte <alexbelm48@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index c8bcb3e2b344..876e0a97cee1 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -1238,8 +1238,6 @@ static int platform_profile_omen_get_ec(enum platform_profile_option *profile)
 static int platform_profile_omen_get(struct platform_profile_handler *pprof,
 				     enum platform_profile_option *profile)
 {
-	enum platform_profile_option selected_platform_profile;
-
 	/*
 	 * We directly return the stored platform profile, as the embedded
 	 * controller will not accept switching to the performance option when
@@ -1253,9 +1251,9 @@ static int platform_profile_omen_get(struct platform_profile_handler *pprof,
 	 * See also omen_powersource_event.
 	 */
 	guard(mutex)(&active_platform_profile_lock);
-	selected_platform_profile = active_platform_profile;
+	*profile = active_platform_profile;
 
-	return selected_platform_profile;
+	return 0;
 }
 
 static bool has_omen_thermal_profile_ec_timer(void)
-- 
2.45.2

