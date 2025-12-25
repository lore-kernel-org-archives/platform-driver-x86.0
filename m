Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EC720B22
	for <platform-driver-x86@vger.kernel.org>; Thu, 25 Dec 2025 14:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766673017; cv=none; b=MhTkuBxVZyWkFuc4u8rFrg0ccsIxYZJpjJ4XR4mCixhj1dWtdGStGHIQ3blLcc48gGxo1LSAAgrEVqwJqbPsRi2KD7EyAM6LGxkwKQYxJj/psWvPOOY/jnNXxx7jcTM1W/Ynu7F0m0lOCGOrt1SShMQOBqGOGpKZYDv93GNd5To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766673017; c=relaxed/simple;
	bh=X/L3uuVFYSgyBij6ji1XU7UH7su430duIjXhDgZc1+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LjtjkwmJp3XUWsWXQ9wnaGtqukrwHLFTL7nxSr0lI0h310MwIpyXNjQtMYN+h7rPuzRvzfuViH7de9nFUZt6HU536tN6Od3SlWy8bgcTiK6+OOqzbAK1Na0W5CsWo45OMkLKDoYPGvEFKWFO25+iX05jk6gbwDgmNGxQ8rHZSy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EkpNdX4r; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EkpNdX4r"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766673013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O047kvp7XWl7YkggHvF0RN/6JImVsvXOkwpYjNSppcM=;
	b=EkpNdX4r8zis0XVjU4UZW3j7MEOj7blorGNBgd5mEAKIjTKwryMJ+zUEmkYPvbkLfFQm6f
	DIDwoViW3n8e6GK+aZPlhuKwNxiOO6tuAmeuvBNbDg/DpdF136VIx5AnkAeSfqSQsaVt8C
	iLO1mmgjpPmC2AtmypiRl9ubahOWurs=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 2/3] platform/x86: asus-wmi: fix sending OOBE at probe
Date: Thu, 25 Dec 2025 15:30:06 +0100
Message-ID: <20251225143007.2684239-3-denis.benato@linux.dev>
In-Reply-To: <20251225143007.2684239-1-denis.benato@linux.dev>
References: <20251225143007.2684239-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Disabling oobe is an important step to be able to fully control
the hardware in TUF laptops that supports this feature,
but the command has been incorrectly tied to deprecated
attributes: restore sending the OOBE exit command.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a49447eff4f4..8dfdde7877a8 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4899,7 +4899,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus->egpu_enable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_EGPU);
 	asus->dgpu_disable_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_DGPU);
 	asus->kbd_rgb_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_TUF_RGB_STATE);
-	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
 
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE))
 		asus->mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
@@ -4912,6 +4911,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 		asus->gpu_mux_dev = ASUS_WMI_DEVID_GPU_MUX_VIVO;
 #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
 
+	asus->oobe_state_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_OOBE);
+
 	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
 		asus->throttle_thermal_policy_dev = ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY;
 	else if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO))
-- 
2.52.0

