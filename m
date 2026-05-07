Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45D9423A82
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177126; cv=none; b=OPWcKNYMZcv04GNHlTDPEjnwwzgoIwxGDZn8JNkoFB4WzKR+Ajr4YNSGk4iMSnOz7iUTtlZVw/XH3Gs6HHE3zQZJFEpvnvV8RMr7ilfLz8sUz+UpMkk1xiHtgc1YrbRbvr7XRREbJ41fRpqMouTMAq1MiDpJYInwGRjV46PabxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177126; c=relaxed/simple;
	bh=6uvm7kxcoZxl4SJop0VuYLP778pizJEeCY5iHUnRujE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oCRV4Ir0aOOYeQlZ5uvgxqPUR0VTS84+LYju5es84OwQOy+DgceIlKP3g5PapRK/RnIBT7NF7OMQNUk6LrxkaUHZI5LhMLg4XWrAc17MyWnuRbIw8LyHsxzln0qm1LFEeiVBzOpOotopScF/K4ta3hr3g11EIJPqBNJ82f3qj8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAbJzQBV; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAbJzQBV"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so2975163eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177124; x=1778781924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ki2zpxXcCZiQ654Cm5JOUD1c7/Sq7YjZSIjBtyxJhk=;
        b=ZAbJzQBVI0cLGmwvL10G6q18zhdo8D4tLW2JaIVPv62Q0sd3lkm5WaEGSRgCqPakDD
         gMJ7XxQk22EExn/wquItvA7iItdR4zvtXI6R1fden0+wSKwCSsTfsvSUYCOmqHVNGE5u
         Zqnq5r5jSol/aCE95DJsdXMsgm/FZv1VY6csxjT5ZmDKYJGYv5izFz9x+nXurrENXnXl
         TokzK3kG0XARajmZNTxeJXtQ/6IdvXfoMPpD5rq3NKf7HFHCwSPU9R1kHW9vs+Ii5qQP
         g7jM2irEwrB7KDPm+/yL0mNn2c14J12ssaSc5IVJptacVB+dX3VHLII7YxyVI2B8DTaz
         V9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177124; x=1778781924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ki2zpxXcCZiQ654Cm5JOUD1c7/Sq7YjZSIjBtyxJhk=;
        b=iAdQf0n0SB8FBUF/wKxp01blmF1W19k/6ktOaFOcDQDSZSMHeYj+bLfsvgEjAnzkOg
         W101JE5BLtRk5WAeUm/ZBD9z+tn5EaDbvwAMK7HYIkjc4cMzt0Dj5/9iRElTzCMtZzc2
         yXPqq8GS40vOEqcavJFiYyTCDKna+pwZZF2TQk3+d3a7TzwwM0sP54UvpHR76dK6n/t0
         N9bdio8JoqqV7QGlTOCI4fGZlcCG/AF88NOjtixCRNcWXz6GttovN6Xp1GBxMdjW/DvW
         5vfajIMFg/u3XvabcuB4Lmlnw2IiVwSD8Hyh7xkbC2dVmXe78DAH5/X2InPwdeWcJhlb
         pjdg==
X-Forwarded-Encrypted: i=1; AFNElJ8SmHCTWx7/J1icJFg9wVKU8k41cekguol0W+nQLGe8kb9ZuSA16FD06Rm80p5Rl8SAKEAJuM9tilbt98m559wxPzE3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hi3a9FnLX180YrhycYC1zShrtClVEoikDo0Gx06SFv9ZArQx
	NmRtxz03b9JIWJnKYxJBiDaD0HoWC3rCchPIiwFYBplQ2N8VSVN8b0EG
X-Gm-Gg: Acq92OGS2Js8tZtpmE+WZVa4pc1hOOCe+RyPPScT+L3TWj2oX4u54eRj0G8tEX9wOMd
	zmPjF+kVfoyNouve5DhK/odPu1vm914PlbYH40f82i+CZx+RJdmoYwTsnTcDbkVu0fXhyVhVVeV
	v7N7JhINkW8M3gFqy3Mzqb5SfggGcDRWwg9/yokTZBpYbC9bPyAscCfmuY6OQxW0Tf5YYiHZVsl
	ODlCZTe9ypOPcQN7WUjCFjQdl9rvPAYJbOntlg4/EtJMGAhQt6WXH3h5n+iJZzoEGGUdBUS9RVi
	QLC8GRlQYWtssZyNXC1uUqTSHs00wHX1Rud3JxBdDV4YoIWISEabsL55iWM0vzCgzjq7bq21j3H
	iUrDez/L6dGhXShijAluD8exUWzkjq5xfxMXVn+TFd4VlCZO/zs+rD5+sz3T6nGJGyNZw9aYyY0
	vj54f6/MGXVvbPnmO18pUl/SPdfxia4+FRCf8L4n1BN3hCcBoSART547A5R/McohphoMTQc9tWi
	jjDKVr/BmzcAEE=
X-Received: by 2002:a05:7300:72d1:b0:2f1:6252:f8ef with SMTP id 5a478bee46e88-2f548a9b30cmr5316897eec.1.1778177123686;
        Thu, 07 May 2026 11:05:23 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:23 -0700 (PDT)
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
Subject: [PATCH v11 03/15] platform/x86: lenovo-wmi-other: Balance component bind and unbind
Date: Thu,  7 May 2026 18:04:55 +0000
Message-ID: <20260507180507.912966-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507180507.912966-1-derekjohn.clark@gmail.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com>
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

