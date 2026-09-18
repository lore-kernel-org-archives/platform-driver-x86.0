Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAD143E06C
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 17:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753791; cv=none; b=C6+VwoFlpa5Og+e5sY8C030+EJF+WNa1/bHF0mG291B8skLbCEkwIrLANdUCtrHiIJOi02ov5mTsGdQVvA0veWEO5RRqEWXtkbodubBtgUx1cIyyZnchLvpKh4yPihsZVys6EkAxzYN5VI43QgxRjtOohTtop4fR1vefyNw+IeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753791; c=relaxed/simple;
	bh=vyCh1a/9f+HWTyY1McW6nzBV+qOi8oUrXthPikpGcDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o/VX3iHlrW+OfuNIFW2GsLc1J2mO/XqjbbOEZxFsp3k4IDxGofr39B/Tww5FTDzGqNhHoduHBOOH5y+9psMeDCfVSkDPSgWsSPaGI8HDRPl/h1zm54dHefq9MI4Z6UgHvZFSjH7enTXISxfj8IQ4gXwpmxcj0uFVO7C5QEuELv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyB06HAv; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyB06HAv"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so5288445e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 10:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753784; x=1790358584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wuDpNUGIrjwH77k9nZgATZRXnq+7uzbWIulgX39iog=;
        b=hyB06HAvLDt7dWss5SFDnpSt8Z718KO0FlmDbG5Aor6JOI4zaEy8Ui8x8XrqY+GNWh
         MIS+V/D+Rb7KM1P4+BYUcT3jpXPfESLn5QjbxqVle6A0jYObN6Xgj4b2w0xpbdUsFqPD
         9kDtZe/vnLRcmd7WQZiDZKJkVzZwef52ehBk5vFAcS+UtiNl2uxkNvUXF4AFYfutmx42
         pfZlWhAnlHagtiK+gyFzeyQF2v7LunhDFAxc8yUJyAFkSwa7eDs014pDBUuWd+OFaD3n
         W06t1++P2Khvlt7hzTDjwNwnckuMDjmuIAhh7ww82QZ5WuIq9pYL2n95M1MM2eWDL+pV
         NJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753784; x=1790358584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wuDpNUGIrjwH77k9nZgATZRXnq+7uzbWIulgX39iog=;
        b=yxQVTf+EEndKfGOC0tTt/De+ZDTx6lE7TsgmRGw9xkQjWVAMgAgcDWmCpmA5uGFzTD
         L8SguGU/TiuYQ9dbX0ZO1Nm3RhkNNWmQaK2OAzxc2YIHOST832yZRQupqRjo30SKH3g2
         cxZ75M8SOaAtwxdfnIqCWbdcXHqc9kPXJ4VL4gzTHoKx5ny0tRFSUol1ThcKOHurVPjq
         HdXbWtHGRLmn6O4HczPHnUvwaDqLQG0JgbHupwGfsDJbpvbeR3Wxp12kwyMmUlB3K3Bf
         DqgvGddl4077SMAFIT8zmmcl98ysx8IMOA1YLAXIgptCItrsJYg31PQkOy8J6ET1h9uC
         EiWQ==
X-Gm-Message-State: AFuF++mtttlpqTpGO5cfTxy48wAeMcGUYgZhbWQ3LxCxeuG+cg0Ki4MK
	SbmsxuLMNYfs8lJEiLV4iT+7VN/NBcTLTodA6gETIZY+OHkDC0UAn9hh
X-Gm-Gg: AYBFou2dA4iNjBjFp9J9GyBXSRM0HNdZgc+58Ol2wiYjG+zAf7S/HcmuJ1H+7LlaGXm
	IQ4BXu5LQBQCpvAvYp54yL5RYKQit2uUBRLBqb1RJDGckNqBL196DGJ8EQG16WUF7LHC4rpBIlP
	ASIghF0oHa85DUOP++mWlxu5CluZh5C4WHMkQSsgsmNekei6eM+zN1ZbisorkPrLHBqrIeC5OLn
	PjD0fDRPNxC578vfn99w9Y71uCjtTuAK+/pCqjCTJZoL2qS65jYP90FHQSPMYfdLCr4zRqA7Yqz
	8LJMhTqwzDsFGFnkM27HrxaXl3oJQXm0pdKs6KKEYI23rFs+GQV1P9+raOQEKDwl7yB/T2m8kpA
	5MVUarBqHxYxYbUxos4915J9iC6CVC5hVtj5rFVbUtLwfHMtItvHnqxrvmCkenXGA6o4iP3b8Ll
	cpVbf4IY3EAZEWNarvu4BltD0Uk0nrBaUBqAWYEIlYq5tPZt0TCez6J1C3YxWAE9xvYvruKXfG2
	BOd0ZhZZo42Yyosm7L2gxVNx4np
X-Received: by 2002:a05:600c:8b61:b0:49d:e0c:e55e with SMTP id 5b1f17b1804b1-49fc574a635mr48839075e9.23.1789753784289;
        Fri, 18 Sep 2026 10:49:44 -0700 (PDT)
Received: from [192.168.1.7] ([185.69.144.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm9867425e9.9.2026.09.18.10.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:49:43 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Fri, 18 Sep 2026 18:49:31 +0100
Subject: [PATCH v2 3/3] platform/surface: aggregator_registry: Add
 performance profile and fan support for Surface Pro 11
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-surface-pro-11-aggregator-registry-fixes-v2-3-c4ed9335814a@gmail.com>
References: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
In-Reply-To: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789753778; l=918;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=vyCh1a/9f+HWTyY1McW6nzBV+qOi8oUrXthPikpGcDM=;
 b=2m9ivocYiMCJ+kj7/8Mgm6+As4HChJGwre9bOebwxo/aMaE3pM3BpuIfOgc2BV537G6wz0JY8
 HQWwnJEXB3YBjUBOOr1IpdSONOHkEUhMuvEhrC8/c3MuZ3q4ASFml/3
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

The EC on the Surface Pro 11 exposes the performance profile and fan
interfaces. Enable their associated drivers.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index 2cb8278d98ea..061d4a567a06 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -410,7 +410,9 @@ static const struct software_node *ssam_node_group_sp11[] = {
 	&ssam_node_hub_kip,
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
+	&ssam_node_tmp_perf_profile_with_fan,
 	&ssam_node_tmp_sensors,
+	&ssam_node_fan_speed,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
 	&ssam_node_hid_kip_touchpad,

-- 
2.55.0

