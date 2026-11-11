Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416660;
	b=1OFxaToBN5nRTGyooFFMhnom9MCJyAxmlQxsHc7sGD5lvHHJuu4US30/WXA9uda6NzDq
	 WAeL4jYF7CLOOE1Fvyya6H6clytZSl9YexhaZu5QcDTyl+il4TuATXLb5ofi+Pgo+dVda
	 hBs+bpmm6K8Oxwj/SjzSauJc/wNQ+tnTZsNnXMVNndfkabdwwr6t6S+TUfwLepd2SCO3/
	 mgqSMYJZ2+TJJuIJxKoedtQdps1W9aYBflEFgbhgR7cXuLkyzaFwgIVg9t6P51p8ibE4c
	 cm+errvozY0MAd0cEGyqynM3UP4A4pfJMU2EJoZ8ILjGZ1WRXpDCJCotMAehe4tPHqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rMEmv/A6Duu7pnLPFNCUIf+98+KnW9o/Ku/3It1i7Ek=;
	b=Hnzfk32DXxYsXn+FbEQDlBvFO1U3/Ln7lJJzlc3rKxXTofSjVNS8ycGlUmmxvo3k3oKG
	 2OZN0M3wwyd9OGgrJj+6+zTEDVWC2YqJrrQZdxhhElBVcZJQLuqr/447DtM5MWG9sxrop
	 VdYnCJ0v9Waj2ODHb+xWqpQuKl/vmS79odToOEsYbKwSG8mPCCuv3Pr4LPYmypmSmuYn8
	 SdjFV//dZPNQ0XUMCoQsFFj7Egq0Y1tK7guZpCMXIhuUGRVvaL1RzMTmTaTAUCkcoTF3N
	 Wi41Na4sbAO8dI5eBcwQkLC+dHhE10PRz6O+fDoOq+c/t4ncpF06wsIdPQrsteNsWkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=PtKhmspw;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E2D60A2610
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 17:04:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E2D60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=PtKhmspw
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso7406214a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 09:04:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794416659; x=1795021459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMEmv/A6Duu7pnLPFNCUIf+98+KnW9o/Ku/3It1i7Ek=;
        b=PtKhmspwNsbtCwC/6OG7PqT/BSroPZoFWcH/5NLTSgNnhZx0+0dxkAh6ibiMB38RKL
         pZ5P4MgqclfbXqf8kK+GHk3RV/CiWdCYX8LoYuqIyHgbueVK0nRRm+UfwdSsHgB0d8GT
         C5vx5A/oCRxtYnJH6yVEow41XrkYFv9ic1xJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416659; x=1795021459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rMEmv/A6Duu7pnLPFNCUIf+98+KnW9o/Ku/3It1i7Ek=;
        b=dfUGAlkQNgDiG5YSXheaemTcB2Xa3J5/B8+DasFuf/s6kFGsihKAFLctAan++AdEor
         WNQTLKYNp7zdf5MHp76BaVCgWfAawIf6AzY9Hy6js2nre7bxGqElwE6ORnhVLI9E14xK
         rYfrS4P5CW3Ibmc4rgM+FXa1qCg12Vcnv0sF65E4iobxqjG4ac3okesOjnPAh5m+j+8k
         FRDbHD2O9Agepr3m50rKt8JUPbpZ9VMybkaTz30R25POsiZkJzBfEhmtC9Y2xljNFRNh
         yJQoomLpN5IiJnfw9wJYUg9Pe5yV1jA6gNSzB0GGWqsb4dRZmnW5fZyJvwM8ixbZMDo3
         XpMA==
X-Gm-Message-State: APuU4Z+2aPHJ0kEdSYR5sOwf+2vMBv05UrB4MigP1ct7+2jsE/sjFg48
	dWg67WHI+ccbO24aC4R8EnB0moPlT0E+yJDrklTOcBXy1zLIl+GDGAZrMu49hSzEut4=
X-Gm-Gg: AYBFou2x558R1fGpNwKl3AM/EyOL9OoKWS8PqfADXATWqVSNMNgY73TwMVf4nM21xNl
	q/QILaXUajCXqlQE/uY1PKMbFJHnx874peTqGHUqEANKfhMoi5QbpDkJDEpjsDcxO5+HKS9no17
	cwet7lsDARlJDRbIBou5q8UI3jdzM0vrhJz2HN+U385qT4p9VLqqktndRZx+6IKV8rzzzwtvJX9
	1D0W4OIbPWsGnfEt3RRB9FOQgT83XRLKl+xUH44aB76/UsCvC3GaH0NhOXHbpaflB1Cl21rdDlG
	CYN5o8F+/yNSrqZVaHaPM+3BV93C1E44JZsOiIHBzRWK4BIDW1XkHHByFz4fCx2Ofr6p0Ah8bDP
	1xW3E8z9mtlmPza91IFMvvaQOFwbyvtOgktO6XNz+kF1g9ddJKXQw7S7FAq72KF7eInPbX0lhNa
	i/8h1pyie74VJwc1Z2mSrK0w9XtRNMgNHGpWszZyV/gVWznYamvmBXFgzwymlCpR7sTgK3wRh3B
	ztO7wtooPi49kZnteb5H4cTa+ZqOqQ/dMyEcXm21SPnBsImRGXqyEZksW4Cy0e2C+SA+N2CxU1d
	D/Myh5Ftb6iJ9WuEeJ2ulVoogbb3qSikwmnsI+A3AC5QDtJaYSna+Ai7kpHVfs21jdoEsJu7NZ7
	I784HGGbtQlB40QkEFcjupQsGnrQhqh2T20ds/eVk4nV5FDvN6DIy5m2ckA==
X-Received: by 2002:aa7:c618:0:b0:6b1:a647:981e with SMTP id 4fb4d7f45d1cf-6b77780e335mr1822613a12.24.1794416658629;
        Wed, 11 Nov 2026 09:04:18 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-106-110.play-internet.pl. [46.112.106.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm871660a12.12.2026.11.11.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:17 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Yun Wang <7z0423arsenova@proton.me>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v5 1/4] platform/x86: bitland-mifs-wmi: Don't fail suspend or resume on profile errors
Date: Wed, 11 Nov 2026 18:04:03 +0100
Message-ID: <20261111170406.1634428-2-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111170406.1634428-1-chris@miget.com>
References: <20261111170406.1634428-1-chris@miget.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitland_mifs_wmi_suspend() returns the laptop_profile_get() error to
the PM core, which aborts the whole system suspend. This happens on any
machine whose firmware reports a SystemPerMode value that is missing
from its profile table, and on such a laptop with the lid closed logind
keeps retrying the suspend, so the machine stays awake and drains its
battery.

bitland_mifs_wmi_resume() likewise returns any error other than
-EOPNOTSUPP from restoring the profile, so the resume is reported as
failed although the machine is fully usable.

Saving and restoring the platform profile is best effort. Warn and
continue instead of failing the system transition, and skip the restore
when nothing was saved, so resume does not write a stale or default
profile.

Fixes: dc1ec4fa86b2 ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Reviewed-by: Mingyou Chen <qby140326@gmail.com>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Unchanged since v4.

 drivers/platform/x86/bitland-mifs-wmi.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 517bc241cdef..6217486fece8 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -213,6 +213,7 @@ struct bitland_mifs_wmi_data {
 	struct device *pp_dev;
 	const struct bitland_mifs_quirks *quirks;
 	enum platform_profile_option saved_profile;
+	bool profile_saved;
 };
 
 static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
@@ -383,10 +384,15 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 		return 0;
 
 	ret = laptop_profile_get(data->pp_dev, &profile);
-	if (ret == 0)
-		data->saved_profile = profile;
+	data->profile_saved = !ret;
+	if (ret) {
+		dev_warn(dev, "Failed to save platform profile: %d\n", ret);
+		return 0;
+	}
 
-	return ret;
+	data->saved_profile = profile;
+
+	return 0;
 }
 
 static int bitland_mifs_wmi_resume(struct device *dev)
@@ -394,8 +400,8 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	/* Skip event device */
-	if (!data->pp_dev)
+	/* Skip event device, or nothing was saved on suspend */
+	if (!data->pp_dev || !data->profile_saved)
 		return 0;
 
 	ret = laptop_profile_set(dev, data->saved_profile);
@@ -411,8 +417,10 @@ static int bitland_mifs_wmi_resume(struct device *dev)
 		}
 	}
 
-	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return ret;
+	if (ret)
+		dev_warn(dev, "Failed to restore platform profile: %d\n", ret);
+
+	return 0;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

