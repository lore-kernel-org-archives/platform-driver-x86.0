Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BBB472F78
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 23:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785453317; cv=none; b=u0+g7bWl9esvVIpzyBS+4L0x4RPMenqEPUQ1uVTRqXTFGKRXbTWkgpbi7eEdIavaQz5TLleBLcT5/jR2MtHd+/TJuqzClcbTuf3yf+ia/AMHQcT3vKCS6wsr2pwWXUyiSml58Tx8VwCCi2V81z7Scm+Eq4632CuGrljvoKX+RS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785453317; c=relaxed/simple;
	bh=gN6OlrVCMOZqyC4Y/Ea3ACjPp5S0h17Bkq+udVEKnVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxqX05quNWtUvl+HW03a1ACxS2lv1krFUc5Lw1Abc/l/VTUPcQLN2lRgxIjay3aiKqF3/hiq8xDuWRqaj0nCVrjeTj7qw6uKaYxilLXeNpiQDyoG+kpfFEZuAgqjFYY6xRzICUM13TTiKH53xpBzC5NwCxEh6kt1R3wQJ33FDKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYIRolud; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYIRolud"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956242332dso2152465e9.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Jul 2026 16:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785453314; x=1786058114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gN6OlrVCMOZqyC4Y/Ea3ACjPp5S0h17Bkq+udVEKnVE=;
        b=mYIRoludjg3akc7ZgIXlZLqFGbh9TKtg67rRnNhqL6+/frnsL9e2S2cqeceSDC1cJR
         aRIfBMjqHpbAuJ0b/tYVm2FsxO+ZoiXxZGHOsu99hrZ1507XgErdqrWXZpuZhyIJ6U8Y
         znLgQ3DqrDimX1MSOYB1f8XZl4kK+W09y8hRNNc7n5LbtwzurJt4xB0vy4CGDFQAVYXo
         jGzTX8ny/iTmTdanqYpdH5FuF64owxmbCle6IjL2OIIhjQOyviP0LDJNvQHcVFs+Sksx
         OPS3GFYd0mtSs2yCfmxthZXR3kKkrQ1qPaGT2Om8rjCPhakAH6g/N2HuwWLVIymle92c
         AJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785453314; x=1786058114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gN6OlrVCMOZqyC4Y/Ea3ACjPp5S0h17Bkq+udVEKnVE=;
        b=L1YAiMRIMmcILzGvl09WrJobLfXWPrd9REsTVhMW9ZXywfLnIwzR8hJzdqYoDLqZu2
         xMt/c+egTn3muJZcTEgp7FDeE3ZRrM8yg1UU1k6jIgT1dH8ezGZGnGTPoOvPNTAHZiQz
         cpoxJeXQ36F50HSeLYaig4ore8K/72/dn1g/RKZTyRx5Z3fUzDy09I0KSSvTgBOS9Y63
         v3wLbtqVBVfC/sFtP9LxgvodY9+HzYsN4kiiiXOHtDehLWX9I1jRgNMHgxifVWN8lxTL
         QHqZaeef5VAQZNo9KV1ldajiZfcA//KP/AhD9p4LVNigQ87bJfrGtpuNaG5Ye2O5GjsD
         byrw==
X-Gm-Message-State: AOJu0Yw2JXCBoQJYxZqNMIbWgOF1i3D96+11/Swexhr/3FgU7DHtj9eW
	fsUx2vWIiuxdfLnPTLYqGVOpafzBuZaAR8j4zZmXzixHgJvUa2wXSb8m
X-Gm-Gg: AR+sD13ToA97txzNvhiTYSxwm2zuSEt5IlLSO2fygHYCeYPFFKcGFXWgLePNqNC9zBH
	lyNi65tAt59/JwwdrmGcV6sobejEUOJDKA8HV1UqNumGD0Wos7GGB81A/oymcqnAld6VWzKZ2H+
	X0BlKsvx23WcyjroU+bU2Lck8uogyDIpLQEXPcbWKdHPfZzwNQDxaFUIvieSSZa9zEq0bEFE5R/
	amLl13ckxfRdxcuzTvoGh/tjwU3U67y+N9NxnOrLTLWvUMZ7E9Aa2gPJkzVOKeWS7K3iq642gt6
	4SpPQIlD1zSd1bWnYX6LCvJrkwLEPGZmsKsgyQ29hjXGXwDedYf9VJiIxcn0Wd5ig9zRWkgj3FW
	pPCOPkb1DQvubVqzFBUEuGGrMV+IXgX39a/N5f9h6PFPLeknPOhHKWjXndsHxRiltoeDGVcDA/z
	uzuEdAsDlGryBFBGi2jhRFVICiTiD5/fsHXX0stQwBPTxIJedWp+liSCIX94qtXlUIKX/Tgmdc8
	kPpHmwmZwvNttyH1nnH7YQK0Ilxm07y0e/kBObhRZ5GeeuqT7Evr4MiqvWu5D9dxD9X1D1o
X-Received: by 2002:a05:600c:46cb:b0:497:fee2:f54f with SMTP id 5b1f17b1804b1-49800eb74famr64874395e9.28.1785453314292;
        Thu, 30 Jul 2026 16:15:14 -0700 (PDT)
Received: from fedora.cable.virginm.net (cpc89770-stok19-2-0-cust13393.1-4.cable.virginm.net. [86.23.116.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010a051csm92022625e9.11.2026.07.30.16.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:15:14 -0700 (PDT)
From: yahia ahmed <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] hp-wmi: Modernize hp_wmi_perform_query() to use the modern API
Date: Fri, 31 Jul 2026 00:15:12 +0100
Message-ID: <20260730231512.9807-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <eca5ecb2-7306-4dc6-bda1-faa35220b79b@gmx.de>
References: <eca5ecb2-7306-4dc6-bda1-faa35220b79b@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Thanks fot your review, I agree that that we should refactor to a state
container based setup and move initial setup to a probe function.

Best regards,
yahia
