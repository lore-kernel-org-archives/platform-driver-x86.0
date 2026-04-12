Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF483822AB
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028288; cv=none; b=HSg7KwJcUN1gmYlt7G71LJWyNS0P43W0gvjz52IH2mJ2E/WHoKq/eLLlXFOa3bPwx/XqiJaF6zOV4QiBnEQCeqJntGZpkac+NaV2tA84CtYH4j9t5Lj/NSjkxJ3TMBVR1ZRNTioQTTQyMU0udhHSeP2UUgoI2ddtlb4rPIICKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028288; c=relaxed/simple;
	bh=6uvm7kxcoZxl4SJop0VuYLP778pizJEeCY5iHUnRujE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OS0LBlRbhxAJvOTUDOv71gMbianX9j3ipTucz7rVzbBeg+w0wN5M7JsxPGmpeKruu6YEbtBrLw26mWeSZvbqtrkTOJNlMC35EfIZMiH3OiekZNJpeZj8HiqApGeG8veJgqHsqLJk26LnJI12r8GPc+9v+W+HOa8XN/aDToyY27g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlDBPag+; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlDBPag+"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12c42a23c8eso1124598c88.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028286; x=1776633086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ki2zpxXcCZiQ654Cm5JOUD1c7/Sq7YjZSIjBtyxJhk=;
        b=XlDBPag+crpA0I4J8yPdJSXHpcmpVRVrPr5wixEHYBcaYrTSjJ5BokwgjaSbZLkX2u
         d9iAwUS5ywUnDV6yOcyUcEdJGLogfKAXbZ0VDn9lPQ/omWuwAKUanr7T3M+kJfI4ml7J
         QPXgrHiqPVhxa9H8VVEfCoKUIddvFu6G67izJeJGWf/m3wakhgs+y53w4h8efiWs+An/
         t1r4u7Tv5+rxYH/iHt40oJYWDKukAnvdjVrcj5sgWPxBM4SOQ6s4SkHUcj6k3xzzqJVn
         LxRKxgO54x1642ZKK8aRaIhChWGCWjlYcMDwUy2X5yfsYQO7A0j0yZEvDe+cgX+3diOG
         n7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028286; x=1776633086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ki2zpxXcCZiQ654Cm5JOUD1c7/Sq7YjZSIjBtyxJhk=;
        b=m15SiAaRMgBPATffTMTRzmrZem4RSnR0ECfEYlc6RjtNSXZyl+jPsmGWf/+L1zfJ3W
         NR+mYAh9xNHCtf2nnixjzjcXepq2K4vhiXgW++C32AueltppXPc7mfqnvfPrGp7hnJgK
         2sLXFqVmifwLpMpFqORgrgQjZVAkuu2US2aWD7xc2zJWBILaVzUQlNPD5saX3dznVM82
         pbdL/Dn4bwGCtLzVZCGr0rohLHoEP+9VNUNh75nmDIGD7aKkEU9CQM5suCHlDIg4Hb5v
         eioL1lteGQTeJ+oFZ67G2U+27wXMv27Zb/Ofgla7Yfij6Y0B3OnsFnCRuAtq63DHcXLu
         AuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiXH+ZmnQ49NOlBEYNKoJTkN0n4KQFJuzct8oOJ1N2zOCHZjDLa7NbTfpA/XFSLjkKpXLzT8D6pCuC4s4pgg+Q99LD@vger.kernel.org
X-Gm-Message-State: AOJu0YzPTMCBGUZ5g+47ZqadA981vH0BLW2+6VLtElP7eqaoQz4e541V
	EEwSa94g6IBNjmt2Mhskuz4DVvhmj7kFPQ14TUqJLbOdWHo02QiaB7VA780+Wg==
X-Gm-Gg: AeBDiev+K2KUkhOTsJ84wvAyRVy2deFp8tHVKw7Atp+4GsVEIOGGSAYB8XEqpLCKyhr
	kzge4ewi3yg68uT1ySH4G7b8L52v1B//d3alR2YV3QeFHCU6FL8E0uphkYQpE59TiOxhPUGloTA
	bbf9zcCI6k5JeFeL3JltXCsqvhgbm/3wttJWCYXpHrJTI6XRXiCSQrnIl4EOgXOFVsLnGOw6zSI
	5OHzKHOUQPV7iyoU8hcrXDNhFABAm1wRg1/h+shZDnEItTqR0Mq011szZMER2gTVvbEOVs6jJiS
	R8qekpDfsmD4kElHmwmGK099SWmwMUQvNzktUBJRmp5z+DEMyQnxUQP6MJk8cypjhUKSD5O0zvN
	GWNxaDPejLzofr2H+skD/UahGMT6ViHNUSjGVr48nMQQcw0lZGtp5JljBt5t02O65DWVEU+34P8
	DPrqnlwP9rakxDpVeryW1uZqoSUTFaF/fZ8KX3gp8HE/CKJukPdKVEmMWq/cYscnTkx66a8826J
	9Dm6yzzZc1Iw70=
X-Received: by 2002:a05:7022:4a2:b0:127:9ece:c47a with SMTP id a92af1059eb24-12c34f160e8mr5235469c88.36.1776028285938;
        Sun, 12 Apr 2026 14:11:25 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:25 -0700 (PDT)
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
Subject: [PATCH v10 03/16] platform/x86: lenovo-wmi-other: Balance component bind and unbind
Date: Sun, 12 Apr 2026 14:11:08 -0700
Message-ID: <20260412211121.2220556-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
References: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

When lwmi_om_master_bind() fails, the master device's components are
left bound, with the aggregate device destroyed due to the failure
(found by sashiko.dev [1]).

Balance calls to component_bind_all() and component_unbind_all() when an
error is propagated to the component framework.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index be3309d74e03..a6be3463341c 100644
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

