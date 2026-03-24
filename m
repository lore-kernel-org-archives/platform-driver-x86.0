Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300403C5DA2
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390238; cv=none; b=HIKi3qT3GrRnWiGE5Pb1N3tdHWJ4c0LSNaY5oXBR7DDYsfdjuAX5hbqKnNHRzdUben0iV90Q+WwCoPANXma72xN0uicx4RewuxPgp5gFGcYMddG/HfrGtqr7D5Bu5kvgKp1DOmam+5V3s5DcyslhJNfUYcZhyo501ZOWwqTpuXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390238; c=relaxed/simple;
	bh=qqWzkRLXexyACYfoPu91Z2Zg4QrtfEree/Xfmn4eCzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHwpdyu6pfJFLs3XUlNQLpcRbDFROFvp8z7cNhjnVmypzRgyWdxS7oCuEVDFj9QeEJY2p+7jygi0N4AkvCamN+AEFqlZa9QKo0S67ALJgCDdCM6TqL0qA1Kr/AXCLo1NSoXjlWCDIp/2wIOPZYKQt+FGwLEU+hwyAj+kW9BlECM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDSmOw7V; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDSmOw7V"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c160cb021cso116780eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 15:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774390236; x=1774995036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7frXpjkjCejQVH5HN0YDV6bknAYxJzfjcY78d3zLEg=;
        b=VDSmOw7VC0gfS9OrKh6doqc7Lkert+6hvmWMRQ+M215E/2oeCkQ1Lu5cDFje868mlP
         Meac5wdOq7fmUxg2N6t8UqC/MJKoC1FkHlSwVKxz6XefEdFrkogH258onEMaQ02rSgck
         1hpjAk+O2hN+Z3z5ACGvWbJP3BFo/4041ZSz9hc6oJSthY8fXUmCXpVeysaPR9oI5aJw
         V3uG9NhFs18FP7TyfCg5egkcNz0kJHk5Lnz5UmB5uyoyv58IWbqEUPjOxwpkd3iQeqkH
         a5XzcfAUv6O1ezqCJMc8aavmUQSHjpNdCeUgo42RcoRg7OWGV41IawExTTJ3duA8EB7S
         7nSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390236; x=1774995036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B7frXpjkjCejQVH5HN0YDV6bknAYxJzfjcY78d3zLEg=;
        b=Cxvac0G4+oMR6zZYSnw5OrzDq+CVxCOMyZcr8EG4XU/GFVXrlePe1olU5L2B3Q67Sk
         H2hmSt2VSDDyoKR8Clp5HQrhDO2+wt3RhByP09mXH8LXymE0MYgc0IbJJWWY1GTmOOGR
         No46Jc+ON7LU/xoFr4R1aDYI0+T+qO+T7J/g7lfax8SRI+t2rodsuZk2JSrykLX5WAMw
         N6M5WvTRYRxeS4vQKkWrIUuWKjtrdVmWsU7ULmWuq2wMb/K/OmdnzrV8pgCO9o5/eY3d
         78hdNafJ7VGRBV72XwllwSgB0NVHL94bl2SnmOMzZ5PYWo17/UVGJ2BG8lMF6Q8NrlU1
         rTOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUujCg/7M46DpCF/FYAlBTGtzUMuXXYSNZFdN714N6tHiASFCVXHUlxTLLEHhx/CG0TaMPXNs8pwh+FZIQG9Kv/JUDG@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6x0+zj/XQVxVfBG7CHzu+HCaIw8q8XaTMOsiblC8BWR5kHCMy
	sPuCLW8HXri2lBfgKFnbCQE87DBmRg8jZ2KyOxdUGApBBv1FxqRV8Ud/
X-Gm-Gg: ATEYQzxNjjM716uS/rcY2cf75PmCItrhEvkOfr+vv4dAMXsvTw9N5xW+tFLkMEcYKxW
	5yT0z8Yi4CXhGVn15CO6wNLK5OGI4fCPdj9uOlpHMJfSCluQ4PgmAl6M3i0Fg/4RmSMiI8/qsTI
	6RWXj6JtTrKqhle52TXqq/gwdK7DaNT5MUq76UftGinV16fk6gQxNef9zs8AN05IYgG1S2cX7fr
	KLp4eqbNV83FC2fW/kB6/VQw4FuUVfODG9rQ50ycrEp+KK4PHzpKR1n77JZwm98AqmN7DOxMhK1
	WPl61VatGcswVg2w5ofU5OElVXPV5r/GbDQqx4Nv43/CzTlv+NS3snjEP4A4aNnX7gUxDWgywEB
	Rzdo44MD40NPWAuI4lh+q0lADixO9kTx1NNFnYD/Yrzk71NNB7mG9nlYwQAAbD5w5CbTYNRGsFu
	gdk/BYcckf+shqSX/Lq5qtzgCdpob/oup9dH/HUF6PeOWgrkjV4P481Z9+33Lx+wte8kJy/Ll/L
	1ODncmkhpHrLoY=
X-Received: by 2002:a05:7301:644b:b0:2b7:32a6:82bc with SMTP id 5a478bee46e88-2c15d46c9c2mr581391eec.26.1774390236146;
        Tue, 24 Mar 2026 15:10:36 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm16282832eec.6.2026.03.24.15.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:10:35 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/8] platform-x86: lenovo-wmi-other: Move LWMI_FAN_DIV
Date: Tue, 24 Mar 2026 22:10:25 +0000
Message-ID: <20260324221032.1333636-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Later patches in this series will add additional attribute ID macros.
Keep the fan defines together and permit attribute ID macros to stay
together as well by moving LWMI_FAN_DIV.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 6040f45aa2b0..caf360b76fc5 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -71,13 +71,13 @@
 #define LWMI_FAN_NR 4
 #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
 
+#define LWMI_FAN_DIV 100
+
 #define LWMI_ATTR_ID_FAN_RPM(x)						\
 	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
 	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
 	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
 
-#define LWMI_FAN_DIV 100
-
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
-- 
2.53.0

