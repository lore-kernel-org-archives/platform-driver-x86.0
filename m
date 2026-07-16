Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6578C3FB077
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 09:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195709; cv=none; b=IfueV4bzvXRZy944+iDrtZotiYB1TDehVTUC/lYBMtgopG42aOzUl1318XfIyY4RidINFdkzsZRkwwd0Fgo6dn8PmVnO8WvMHTkAXuQ9FXj1DgoA+YrqAUk0q3s+fSqc+C4JvnOfEZdmqbGtqb22eIqzlTJKSeiIj8OuWCvEpGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195709; c=relaxed/simple;
	bh=A3Z6RhlbIglJq+u8zHoBltF1VWTw+p6nAPSSC3sMd1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKUPWxKvtjpRd9P+HixS5SjppKYNZiEwvtuREBj/+onTBnS1Fziw7TtrMKskHNUD8jx5t1KoCtBdHRxrhjuc2oE3IiwAW0BxHUr4DEBKnmxTyQNdulBASvREXyvPnr+TmaGN0yphAaJXaIJxqRI+mrZV1wHz/78vFXz6hUN/Vl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dE17dxoS; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dE17dxoS"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15f025146dso84021166b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 02:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784195706; x=1784800506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXPk9SNKfAtonBREMRo3neIdcmM3Zy3llxvKmTjH3wQ=;
        b=dE17dxoSNSQs9ilsFcr1nnBIqYWJxNXxbug/U08rc99Qd8HLip9Y/UJt5oHoqh4/+5
         YktT3BPmL31SdGrUfXJel5gpg4xZfa0uO8P6EK2BMtnjM0QFE2lCmWIuPxGTGYStila5
         jjSv2+ekFvZhgKLXdIRw9HabkvtVqSW4Ql89tAQqP9OB7/uvSitCCfz7VRzQKeRjai6h
         KrS1fyThRDNB4mMUKjUfNdPhInENJZgBhTqBFHxNSYWg7a9zFs4waVtnOIvlFpD51h77
         IIMdzLbqXrl7O2ti7PMh67E/eLesbe3YFjZZWPqEu+HDX8e+nGvPHXs+cSU5O5+vBYE1
         Ygow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195706; x=1784800506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXPk9SNKfAtonBREMRo3neIdcmM3Zy3llxvKmTjH3wQ=;
        b=VpsB1hklwpJCjPSp+yJYDPMIJGAnjTNQnws9mF7bOSwN/woNaaDy4quVZaV2b9TNIR
         PeP/yTOtNkco9zXcKjF9Kmx8DbZz4Nc6aCVGzMiJIR4V1t1Y4TBYxgSi821UB/vmXgB7
         4tfyJ//kz2pnyFhPACGs2fSj+LIh8RfWSBdqWO9KFbBxRunTHHRgmv5GagtUnxiJPqvC
         CgZtmIxyJiZjhEHYCbwgIMUZT5A7+G6TYGtw852jGNKPifwaanet1rhIkHHz/SE1SRR8
         FrMiGEJ7KFA8fjBVuVLlXkgWpYf53m2bIuNOKDVCVlOZE0jpFw09OxvINKJGGpeANyPd
         1ftQ==
X-Gm-Message-State: AOJu0YwKTxmWotO8sfNrobi2KuG4PnTs2tZKZuDX1yyMQ6PCl0eCmUdA
	yJqXht0qp44rAaTswM/QFrou1xzlTFfKnn2/SXzX6LdkPEp7UTwABcjCpGIPty00eAWFTNWL
X-Gm-Gg: AfdE7cmlCN2p0aomvsRyrp1V6LzpRma9gAKGy6wH3jRdeaIfQdqxqri+MCCvHNScEL0
	0cPkoppK1/sOWzEVwcclWRF6x1nOQXRtJdMyumS71L/WQ0pesqnqfXvT6FGwpeaFZXhdtF4TZGJ
	bD5c/9Nwj66nc8Uvb+JOP9HhRWMj3O3PqMW+coS0+hW+jjr5ThuWZSpAZ5HA9Z56H2EaF4aNCaZ
	HIkqZxRFmX8IVf4Fi6RGy9uSAWFJNNPWTkw5zbBwPvhES0QOAubKR2MdmhX1epMn1gE3s4Nshcl
	M7yZ0tdhxZabKutTN91iL2pYU3REA4oNFM9ABqJSZNKRGfIaFmKpQuDUfgl/7ufed1QW+feQsDP
	tuR4YEChz/C+5RuJkjGPlNJafCwa5QqxHz4ry7BTNJCqR1xhmneAM2Nrpt48g8gyVwpbe
X-Received: by 2002:a17:906:4fd5:b0:c12:7f37:ab92 with SMTP id a640c23a62f3a-c161e9a4576mr795020966b.4.1784195706538;
        Thu, 16 Jul 2026 02:55:06 -0700 (PDT)
Received: from fridge ([193.32.127.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744e702sm178454966b.47.2026.07.16.02.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:55:06 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com,
	edip@medip.dev,
	hello@kursatabayli.dev,
	mjg59@srcf.ucam.org,
	akpm@linux-foundation.org,
	jorge.lopez2@hp.com,
	jes965@nyu.edu,
	mario.limonciello@amd.com,
	julien.robin28@free.fr,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 5/5] platform/x86: hp-wmi: report fan speed command failures
Date: Thu, 16 Jul 2026 12:54:18 +0300
Message-ID: <c441b3dd6688040fe0154aad185e6e4817ccf124.1784195117.git.emreleno@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784195117.git.emreleno@gmail.com>
References: <cover.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_fan_speed_set() passes the raw WMI result to
hp_wmi_apply_fan_settings(), which only checks for negative errors. A
positive HP firmware error consequently reaches the success path and
schedules keep-alive work for a fan speed that was not applied.

Convert positive firmware errors to -EINVAL before returning from the fan
speed helper, matching the other fan control commands.

Fixes: c203c59fb5de ("platform/x86: hp-wmi: implement fan keep-alive")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 65c3bac17ad6..8f8da31bd5ef 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -907,8 +907,10 @@ static int hp_wmi_fan_speed_set(struct hp_wmi_hwmon_priv *priv)
 		return ret;
 	ret = hp_wmi_perform_query(HPWMI_VICTUS_S_FAN_SPEED_SET_QUERY, HPWMI_GM,
 				   &fan_speed, sizeof(fan_speed), 0);
+	if (ret)
+		return ret < 0 ? ret : -EINVAL;
 
-	return ret;
+	return 0;
 }
 
 static int hp_wmi_fan_speed_reset(struct hp_wmi_hwmon_priv *priv)
