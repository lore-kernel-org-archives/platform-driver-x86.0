Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9D63B7768
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924622; cv=none; b=qwLC09ZeZLBnL0PjMKisnqW/RVigRKTWcURYYdGqLH207akIIGEfNw6++7jCK9DpcBXs7C1jpx8gHh82buJv9EoW7s3eiCF3uZs1bKrok7bwm2eHMvjCt55vx2EqSvax2A2m8gUx+Amhxe1YoAO2AZyOFTCja6LLNQsC/6nqr78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924622; c=relaxed/simple;
	bh=6uvm7kxcoZxl4SJop0VuYLP778pizJEeCY5iHUnRujE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwC60ocnRDTJrx5ZrzvBY9EjHDerSSoX6ygIplpFPI6IxDdhlRlUwitmE0rmYLdTiJFJviOx2npccU49nQmYAEcyp5TyXYuB7rCCACk4XppKMkZMbWva+OSLMJXdbWQtY5j0JdraN69a2F5NO/y8FWC86X+R0ecyWh8kKPes7Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUzk9Ifn; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUzk9Ifn"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so2629492eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924620; x=1776529420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ki2zpxXcCZiQ654Cm5JOUD1c7/Sq7YjZSIjBtyxJhk=;
        b=KUzk9Ifnj5+YJOpYGDqwGAvQAtvvSO/BeEaFOvino4nA2HIAsIsBc0q6Hcni0HHUvI
         +gXxcOFvjzWSx83/iucAP1KY5j6kUybhqBA53NOKdaCzk14pGfpu4mxNxNIUeZxEH9Lp
         0E6wb/lZDrH72UJ/5Y7l3QQnNh0EtNmZf9D2mQOIcknOWIPMOFqjd0tmyIHQGefrVMYq
         RPDRAlnqr9torRjrDTA+0U8NiEe88sAn5xmwaF2DL4e00xo4qNqn+SHWBOxvJeZT27W5
         v5MLRrQBdmBqHF2gUBRaucOV/Dh2FnGNiaXRVP/jpsWXbtJKXHi7EOguB+PyTnuP8cNM
         e2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924620; x=1776529420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ki2zpxXcCZiQ654Cm5JOUD1c7/Sq7YjZSIjBtyxJhk=;
        b=KTiRP34v1mH7b61JOmXDCgn/Gu8sPFnE8AOrx0QSjSH84ElhcJcpuABBn/KyJ0XOv5
         SpItksBweRzjHalvvo4xtW11JIyX+KhIl5RFVrwTXXkCOUBasMaOxy6bDI4CScc/fvge
         i6GYL4GU9LMTStvOoUbOoEvjuDCqPBjgjQRPzzNJg4r7r8gRyM9yZumo0aw5fpHlUqxb
         +6wlGWWjanBeTgCJ6FM5T+qz43uP7ryUC2Mv1cNTa34hZJf0x21GP5HCgLPP4oKot7MF
         0GSXlv0mtZES3ciMEOXv00o0/iRkSNUYCNl0338u8qCcoe9yzh/1Usbgr8HXCwfZzL+m
         G6zw==
X-Forwarded-Encrypted: i=1; AJvYcCVYoiJsy/Mv1eA05Nq83jZ/n1ix0px48l4HVT9MPWj6Emvsvhq7F5mvh3faspQfB2uU7gEiOAc/HyW0EAMGhJUiS+ge@vger.kernel.org
X-Gm-Message-State: AOJu0YwkmXwwtsTRsXwOGnqhdJaKduwCzAksNLddgo8zkCiSkBcrm87S
	hGaVJS9Uqo3dqdIKX5Id5tqMfvFUdluBo8kobtVbve1SXoB2vKljdeD7
X-Gm-Gg: AeBDies1YfJU+otOU3QbO/gdkuHV26PyWGzYXnfJFHHvRdnEQtkBtRLR1+Vn7uO2bNG
	DE5pdIOD0TpjQfotK0phM1EXjj2zjUKZFdYWnsfYmClAyyn6baUh28EvX3ZHeHtYw8Lnlwgi31G
	vKfR7Knnbq9kk4e74foAYrZLQ/j9E0hqbNPYx2C/IUOK9bEXJCyLwWeDrUlLLgMtPZ8qsrMDkGG
	aLx4h+JRt0TojTLie0MjgXC1JvW/nNU4Matw2U0amJm9rf9/FhR8vAMZnSMcKrG9iRU0uaQ+AWr
	akuVXK40JATB62wincFzVNuLSdVdQMbAtkXR2Ic+V+pF+faqHhhfAn7qlHxNTjPJ9rLyK+sR6VM
	+uP8+LYFST/vk6t74w4iHCNICcZogHS9+fVlLxuGxZLqxnpRLf8WrMRQMEodp98O8/Bow/c1pkZ
	gMC9Jg/+2F5gzOpzf+KRL4OvbtyWhlrgBokb4WAHxgzZN0KBKd4NbdoGRreF5gp55kVWU82njSa
	x26
X-Received: by 2002:a05:7300:d183:b0:2d6:526c:55cc with SMTP id 5a478bee46e88-2d6526c5736mr2258532eec.6.1775924620224;
        Sat, 11 Apr 2026 09:23:40 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:39 -0700 (PDT)
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
Subject: [PATCH v9 03/16] platform/x86: lenovo-wmi-other: Balance component bind and unbind
Date: Sat, 11 Apr 2026 16:23:21 +0000
Message-ID: <20260411162334.25682-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411162334.25682-1-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
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

