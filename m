Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5782BCF46
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387154; cv=none; b=TsA+/bBhZTVmf7J4HpHYbljNTdwvH99Xqh012UzSqF2ErDS6tPrV1mZtLNenq87M7V7v6FsekpirP342eqFTfFdNrjdpHL5LmgbPaHMYsMnJ1cAZ/JdCtAruULmPRYXWFBygjZW19QJ0zgOO6iXGqdmcyJ61tsFsBDzFZ0qpitA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387154; c=relaxed/simple;
	bh=6uvm7kxcoZxl4SJop0VuYLP778pizJEeCY5iHUnRujE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9SgD4X/INYVHLVKC4jhq97nROWcSqiyX8zLe7v8/m7vshOFBuXGnxXOqZW1MOR9g0hyHva+OYDaUB6jOdZFdxCoPSTBoz0xY89bCWbLURE2Fr+L+vBDc+4M4RnnqOgPY8OZRpaEz5HFJONNArF+c54v76GSVPQEkMoK8UUR13s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dms11K2j; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dms11K2j"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so8709071eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387152; x=1778991952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ki2zpxXcCZiQ654Cm5JOUD1c7/Sq7YjZSIjBtyxJhk=;
        b=dms11K2jMcDfQbw8xdMgaYe88MJgln/XfhDTd4/L2OnwUbq0H623qiTK1lbl4pRsdN
         F72mDZcMBXNrIKGy6jTnlIJ8I4PhqZnH4vx0yckkCSbl3Byfd0sl5ia27rADR+0Kgriy
         ivoLDZDVTMC7DPwJVTkHw2EWgPC0er/Hc50zq1HGYNbCXE59GZwnVgYHF3RK/VJzpEzx
         JlJoCQWJMUoy6JZHpDHpkGy3FnrWcKAQzOxnxx1Jz0kM+qsoIZA16UwKqamof6DUb1yO
         CgCitzl/r3ax5m9jlEsX9ao6PTvKkr/tnmJtmvzyc6XiJV6NvGEn+rWgu4EOcm372eJ2
         BVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387152; x=1778991952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ki2zpxXcCZiQ654Cm5JOUD1c7/Sq7YjZSIjBtyxJhk=;
        b=h0yToQHotDYZUoEXPwsPmGhQ4HrH9lArRA12yIoEzOKp19kbyYmtS49CeQChW4ZI/f
         JZk7so6T2OLvfiSTShgHc+4f3QiKGH70BD4PmERzf6ZuOE2gMB2+foXynR0nh1pYfW0L
         DwB4O10pWZj8brFqgnIFm9c3git21V6dkMu9DdnYvYNmuDE35S21Klg1GbwmyPzMYuvJ
         3V13JD1PEfadQ55Kh+aXwypIA2U5V771ng7dxVgoFbflYa6qtw+lYnoe8tbrARv3IjVv
         +7bhhkZdAbiW4UNRncuIJq1vn3l2MPwcM3+AispoHQ/iLBVN6wGeeijhm2rG4Grbo33Q
         puYA==
X-Forwarded-Encrypted: i=1; AFNElJ+Y3Ofq10cp0bQWJYR4gG8q1LwbGsF6P2UMPf4YHxE82lz3vnWe+Q5ZHrlBTttruSqr9lDO0/iaBL1a46FdchJSoMzq@vger.kernel.org
X-Gm-Message-State: AOJu0YzZsuUnOJGB3gVZucDyV/LNcD7nvyaEhVnEvLF2RYhuhUonNatj
	8j2KqRPR3kOk5gaxiz8I8pKS46sojzFCV+AJ/tvmxVMzyR7lRLU4PtxS
X-Gm-Gg: Acq92OHEzdlSOe9viJAzmZrhh6gvzgAW47eJIAXwx1bv0fR14SK90Uy19mQo2JptW1a
	hD/VdSXAq2axp2aXprQP8pTb932hRtIraHZhrNVbcfI5EpvVN7THGFXPYswOTK3ab+EdbtHoo7n
	AVoIjzw5ySU+U6sMcQygN3ywVsdYL+1kdt8SOK98shpznCNNxVQ4dQa1EVUjYZxlEb2h8QASKPm
	CDn7iTAuNUZYagSTz+KSWZw8xYZQMxIgv8GT7k5fDVmziV5/4apoA0laU0omrzm1808jYA51bVz
	q5R6WIX1E3gpK8RTR4HghjwQJtxpo7qWIs/U2Sl8EaU+KyaZ3vWLNp4zki4QewgJShzkoCqT+ly
	89Jm7ImjkuIOj8sxoo7L5p0S4KTXSwWORBl3KcvqBNB71B10l/MfI9NDKIOnd92uIEgopOIvWVM
	pUg6DkrXUwUSEgDvkXc90sT1rIMk8dinj2UFOZKu7ui33prd9vyqp91zyZPFIZ1uW3kgYXTdZvF
	CO3
X-Received: by 2002:a05:7300:434b:b0:2ce:3aa1:d39b with SMTP id 5a478bee46e88-2f54c97128bmr9262664eec.20.1778387151815;
        Sat, 09 May 2026 21:25:51 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:51 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v12 03/16] platform/x86: lenovo-wmi-other: Balance component bind and unbind
Date: Sun, 10 May 2026 04:25:33 +0000
Message-ID: <20260510042546.436874-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
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

