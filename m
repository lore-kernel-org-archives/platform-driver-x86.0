Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE7B24DD17
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767103545; cv=none; b=UThUX4QLRPc1bIElufcPUiS/yNM4UTCSBWEtwK3isVZFTzC57ZSiVIdFYvirp6TXGN/xFdLY1ncNvNbAP0yZunVyS55ZhXeZUcuLM+N6Inf+5CM9QWwpC2Lu14BrG4eR+BZUuwfBjOqnAfvlI//J+uNxp+hd/He/T4/gV/KKfs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767103545; c=relaxed/simple;
	bh=Wwye0FsDRVXWDOz++6Ke8qWHyTppsRDMifFkqC+YIVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QIQw1mYEfe7Xi5hcXu4A7ANm4vcgFO6CwoeckewQN+aL7gxTOaPn5dVDfXGdVpexQ9wHoxC8lazw4FY7Kcd+v5qK2x61+44KP6+BvNORgXdYp1LHCcATbNEhiFkmT3u3UfNAD5QTgUbMBM5cWMzuA7q1Pp7ZU23KgVjv1BCgVPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AF0HGmA+; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AF0HGmA+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767103541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73Qdq6BpDKBize+/jsCa+St3KAGenr/DhYHuWo7BcQQ=;
	b=AF0HGmA+rfncTijiMhcX6gc0O2InG6n5ssLq45NeCL8QmtAHTzguomoIYoZ5H9VhqDOVWf
	ddDAdSg+DxblBVzL4xO7yIZ8MmratI9uB31/ppihCW75cBp47QD/9dylKi3sHD2f6+Ts79
	u+GynwGtk6/oYAEtKUUhkgHB9/Dfzog=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	=?UTF-8?q?Merthan=20Karaka=C5=9F?= <m3rthn.k@gmail.com>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v3 2/3] platform/x86: asus-wmi: fix sending OOBE at probe
Date: Tue, 30 Dec 2025 15:05:24 +0100
Message-ID: <20251230140525.42017-3-denis.benato@linux.dev>
In-Reply-To: <20251230140525.42017-1-denis.benato@linux.dev>
References: <20251230140525.42017-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Disabling OOBE is an important step to be able to fully control the
hardware in TUF laptops that requires this command, but the command
has been incorrectly tied to deprecated attributes: restore sending
the OOBE exit command.

Fixes: c683651b6791 ("platform/x86: asus-wmi: deprecate bios features")
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

