Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248FB335067
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 17:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753788; cv=none; b=Ikae9J+AJjCbsPEfKod7U7dpVRIhpvccVxZjyqUzM/+R9unQpqmqXGJeh4BxMcMOJj/vMramGsIdSZb9t2Bbb3uAidpi4usDiqx5R4LIsjSsePfpwTpSoEtoQq2l9YV6R7yuvwX+XWoMKone7g0o7j0xde9mmYKzEG+7973Ovdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753788; c=relaxed/simple;
	bh=h6ecCdzVkVjlxVlT4ai+EtAdCw3KVPz82Euv81wB8Bo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FdXgAkXL++R7LH1cqz5+VDdUeFb7Yvy7jgQskny5/kisI+PkE7MIL/Z7t3dBXpRQ3b79rFnJ4dpaWHIqJHgsogN1o1TJuJRAc36zN7GF6Z0NvydVclCHDGbta8mxLMP18848JWBdWtSTIfrNJddEfTrsgN32aCC4t0bZPcu11Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZF1wQQr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZF1wQQr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso7253895e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 10:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753782; x=1790358582; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/T3ltQU1FLtxx2/oqUFI8aBgDM/RZh5NaEtdMXmwnA=;
        b=gZF1wQQr0Ssg52YBGj6o+QWU7JEyhYueA3IePkB872h5QsbMU1SlMIJDlnY+fcGXOO
         4rJh2R3ns5YtJCO2QgcjSPRuT5TTD6gqOL24+Q1CnF3r60GCUWFfyeCgt3oPudTZbvut
         syq/NRob5oI1EDyUGyrPYJkyZs/f+xEAxX+TheZJW21r5ZcoHIng/rRHPbK/LW+BCW78
         +mojhUHLFLc2DN375axoRZvRzPIUPiX9mK8BosLLB0UqKSemytiYddTMQ0LJLfaD5Moo
         hz9WRmytfTpvUJIFrndHPSD1D/cacZmOS9xE5jONitb5DTVHYLz+uwAfTWm2H1/3+ce7
         Z76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753782; x=1790358582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3/T3ltQU1FLtxx2/oqUFI8aBgDM/RZh5NaEtdMXmwnA=;
        b=LLnKwm/7FZ6Dq+tms+wHe3yKMC9PqETFrDxqIV04EHg2/mVUbccxw6rG48HKcPcjXk
         JvWl2GCQThTxthVPxPTLUzgYPQqb6FdMkg8vDINDMdeklDvOvSA2gBeCf9WaZuEw50uA
         eqDzJW0wbTfV8Oaoir7W0b0ZhlARRm55OvNkVl+NqHCOJGLVhD7FH+AE5OMDG1ZW8cJf
         io9AWWT/qhtQJZU40Brs0BNwiAji3kY6JsST2JpB09AmeQekJlDatsd3q4HLenb9klF2
         ierVKbtT8DD5wkCIoHJneylLYbP1KZ4fq7YZvzJNGbPPqvmg9S7oEuQsSAXWg7T3JafS
         wuZA==
X-Gm-Message-State: AFuF++ka6iNGWvIyKOHFzO+s0Kgatear652gEWO4URwpzdqznW/aXOEp
	GRcRLJABJ4Wdc9SyGk6YZIh/GjCZGV2ctXRRVtHNhGmWpLwafa0zFMWV
X-Gm-Gg: AYBFou27ZQzHWh3VjvVIpAw1yevzrTscm50q7hxlgnEXPoFSzFMJX1Tu+SRfTRaQvun
	FphZ8aWeUF3NV6bQPTDv7RnRqVlcRUFQ8PwpUIY1G0rswQxfNzEQP+uFH6qVl4wDbgEZUefDxlM
	YhZGt8qLGRLJlPJFlO3WaQ5EHIlRjNI2a7Vs3ppwPhOVGOU/T/I84KOcITPix88tcG5t0Zqaov/
	Kz8PqkRzWrkJy3VJLfwAYcOtm+1Ce+HHq5ZLXLYBkbrm/0qmxNtSDFA7eHSblv1e+ew5prI52Ny
	SOvNYn8Xhoe+v+Zz6IpgPNxMqgsXuIV9t/fZkvbWZj4OHfN9tn+03tQ0ZTx1YOFnQ2kOY9LeG1l
	4CUC1rL37D3nMWketQ+dtn7S578vCR6qlAs+A8wBG2nQkdqTbRXpaR+ltA43yMzzL4fqQqA2trI
	XxpxKYUcQfsvHYIogwZ9AgMORYeNAyo96Dyyef+zXl5ceR3WkxrTqn95+zrYlze1dQ7fxAUcZpt
	fCMllT/DWfX+dZIkxLH+dM8AFyL
X-Received: by 2002:a05:600c:3ba4:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49fc57414c4mr56499925e9.27.1789753782051;
        Fri, 18 Sep 2026 10:49:42 -0700 (PDT)
Received: from [192.168.1.7] ([185.69.144.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm9867425e9.9.2026.09.18.10.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:49:40 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Fri, 18 Sep 2026 18:49:29 +0100
Subject: [PATCH v2 1/3] platform/surface: aggregator_registry: Remove
 sensors device for Surface Pro 11
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-surface-pro-11-aggregator-registry-fixes-v2-1-c4ed9335814a@gmail.com>
References: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
In-Reply-To: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789753778; l=1083;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=h6ecCdzVkVjlxVlT4ai+EtAdCw3KVPz82Euv81wB8Bo=;
 b=4RhtcisEmcwx2YpRaHHGxuEGb959Lt94d8SoXuYRSWcTIgZYkmDKoPvLE2h+/jMGCzYBVF2bo
 e4YHCphDeryAxc7jiIud82hw2mwyj30gzyfLDxNcZ6wiZhTFdayFhi7
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Remove ssam_node_hid_sam_sensors as this device is not present on
Surface Pro 11. This fixes a probe failure in dmesg:

surface_hid 01:15:01:06:00: unexpected descriptor length: got 0, expected 9
surface_hid 01:15:01:06:00: probe with driver surface_hid failed with error -71

Fixes: c4a069095395 ("platform/surface: aggregator_registry: Add Surface Pro 11 (QCOM)")
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index d37a7e4c6b02..82c2144e10ec 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -415,7 +415,6 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	&ssam_node_hid_kip_penstash,
 	&ssam_node_hid_kip_touchpad,
 	&ssam_node_hid_kip_fwupd,
-	&ssam_node_hid_sam_sensors,
 	&ssam_node_kip_tablet_switch,
 	NULL,
 };

-- 
2.55.0

