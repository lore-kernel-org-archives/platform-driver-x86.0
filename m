Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6380135AC0E
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100272; cv=none; b=qPUl6dDKTNMaBPnswjUddBFwAxhdO0gonhYfqH/4cH774lIexqSlFICVqUr26RnYS4V9xWencJ5JNLxVDiKsF6hBzecDBgIw7V18zNb7Jx7dZzOaPMJYcvVSMHLuUkGEyUsc6iwQBMScVsaEwwcFydv7hRBUCB37rvkEJyYhdig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100272; c=relaxed/simple;
	bh=A5nBMBkWkafHNY7USWwQbGA1Gg3Rjn8l3CkT7z4RWhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltR4VhYSU4zXStYJTv5yKSpa1iKq09rrrYfLgJ3Z2X7uDdC+ioc5+l6inoE1CTkdv/v9DZ6jbRaMUPb6VZmt0/lZq8QJErzHv5DTIZip5hCQDUooMsSlyhs8VX4sEAJvXGvNfYHJruDOV4eslpMYZnZ3u0EA6GeaZSODSytlaQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUw/J7E4; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUw/J7E4"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c160cb021cso533097eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100270; x=1775705070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2sfsoM3eXXD/i3TYQHRzXUhUiniPGPfrTop9I4lCjo=;
        b=hUw/J7E4U1BhrHIYa3Pmfgd/JKI+CLxkxZpt8bWa7Y2tEcOA+pF3rpncf6Vw6fU1to
         ujNF6k9XWW1RSGFW3S8JACg4lvAi1pfYQyYXShDXOm2d3ZhiptWXJqj7p4flMKACo3gK
         7SDluwTG2VfGwvjM1xLtYCHoDOoxcjoqHhVF6aS+rKsI8BF3fwFNR9N5Py1vXIV5kSDe
         0Op7IPpw9J1Byo1wQrUoqVLWoaUhS+cZCtJGdKDJMqxVpJTcDQFkO9dilkSIXuz8U/QF
         Rx/zFC1Lf0fPEAbCTfXgooml3m2yZYk56jRgtKIPyrcKRfvbHDDGbHnsE0C3xnvsUf4c
         JWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100270; x=1775705070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2sfsoM3eXXD/i3TYQHRzXUhUiniPGPfrTop9I4lCjo=;
        b=HfXbbeZxy78uYAhKquiCX+Ycl+qXa6l/K/hfpLcZ6elMMGnld1I/X/IUBViv7k9a1Q
         zWAK/T96lcI43UhsYG3JtJdJzjHIqy/R72orAe4r+B+48d618y1U1jO2SWJKvqxCJkOC
         xqkl8bHBXjrxRA3XR2eIZKYQHImimes48T2qNPA7GJh7QXqok+ZMQTVwGo6QArHlmGnJ
         xC5LkeO3EowiwBAeR+wnmZReg1sGeebmDFR+fqQtFuT/nSJuX56zbvt1P67C7FuoIHJK
         JOzwmi7bnfbmiTMo4t49AV8g7Ss9blRBlsxLgwur2a73ugfgKujrc1pvsSkW6DtscxeD
         Q8GQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpeggVtUD+Q0VvOVRGLvWN0AgJpadIer7o9fJXC4lRqqQRN47r+mgF8jA4CTfuBYpLoZLrHYgkT9xbuAQ9P/4jzPzB@vger.kernel.org
X-Gm-Message-State: AOJu0YyAVT9aOuLf626Qbo3n0iUnjNUuJMzQLDxE2PbhytzHFcc9S1sM
	9MhNBgudQiOJvf1GyEmzsieJJeblKkkN7pdTQMfETPqtV6M4JY0NU21Z
X-Gm-Gg: ATEYQzytqOOhtUM2MG6wF0OWdovq74TjpdMKcbZOIO+Ratfia87gVmO1RuXNimbhZZZ
	Vi+XxVAzaWvFZ4m6a+DRSZ06rqLkpoF0AoLhEmoLzv+5sJKu76AG1+LwvgMrrNgM6E+lQiXSl5M
	hqCy8i8O4z7dhcxFKgxlX4yCg+Gzr21XAOP6VjIyiDrBGxyTY6nif2h1sOit6Lx6gnuUVl1lbDV
	FlCg0y2s3++vG/a1fyRHWuPlmBxIdER1AjN6r3MpRMvzy9fFpUA/nTtrhyjqpjn4ncud+E7gRqn
	0ESsUpsANidtTEbhDDt3/hM0NR++PpMYFxORUNnl6+LsztSDKmAavEI0y0Dv97tslRIAytYYB/m
	xxZJddv6VAV04h1A7+QG/jHhrNXLgFxBvAcLcnwIq7vK4f6d0jkDZ3BFFcw9wlJBGNQzacgsA7x
	kq49nYTZSoNV6DmzVJhMlqEhVfM2v1cXYGRroX3n5cm/AcI42qx07YVCw0vH3hImEm4rOKPKKxG
	E0e
X-Received: by 2002:a05:7300:6413:b0:2c0:dc7e:ed17 with SMTP id 5a478bee46e88-2c93116f5d6mr3146575eec.10.1775100269336;
        Wed, 01 Apr 2026 20:24:29 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:29 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7 03/16] platform/x86: lenovo-wmi-other: Balance component bind and unbind
Date: Thu,  2 Apr 2026 03:24:11 +0000
Message-ID: <20260402032424.678528-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

When lwmi_om_master_bind() fails, the master device's components are
left bound, with the aggregate device destroyed due to the failure
(found by sashiko.dev [1]).

Balance calls to component_bind_all() and component_unbind_all() when an
error is propagated to the component framework.

No functional change intended.

Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-other.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index b47418df099f..4b47b5886e33 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -1068,8 +1068,11 @@ static int lwmi_om_master_bind(struct device *dev)
 
 	priv->cd00_list = binder.cd00_list;
 	priv->cd01_list = binder.cd01_list;
-	if (!priv->cd00_list || !priv->cd01_list)
+	if (!priv->cd00_list || !priv->cd01_list) {
+		component_unbind_all(dev, NULL);
+
 		return -ENODEV;
+	}
 
 	lwmi_om_fan_info_collect_cd00(priv);
 
-- 
2.53.0

