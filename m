Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF77F337105
	for <platform-driver-x86@vger.kernel.org>; Sat,  1 Aug 2026 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785600605; cv=none; b=syLnc8+NO9Ai6pgrsf2RnYRwlL8p9Egubt3b/eJUiTHgFcwCdURkCS3n8zyy47GwEgggCoFrZoCwFLBxqB9r5/Bkpdm7B+8RByhIqkfI6bo1UaVyz+QHyGlj1jemCzIiipaqqCpSLAjL51hQVZZVGQ8LSVZHEyoiltb5Eb+ZrsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785600605; c=relaxed/simple;
	bh=ImvklLrI9a1aWjQk23cEhnp1QH1DUC9t1ZtAFSsExKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c8UIFAWEsH5uK3NUEez/hA7Gbxj5dgv1zMZk+T0o4TPZ7UEq0JV9jAE7OlCHdV85tnsU5+LM6sO1mWyA4heCca2mvPYjaQDydv3fhFUgQc6Eca4RRHLh/6VWzV3dmAKrCdN+W/J+UghwV9qFQx/1ijGQWUzp6+y1rHo+DwJ4log=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eumSfSBY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eumSfSBY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4957eefd361so4990705e9.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 01 Aug 2026 09:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785600602; x=1786205402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImvklLrI9a1aWjQk23cEhnp1QH1DUC9t1ZtAFSsExKQ=;
        b=eumSfSBYGbq4vefebj+iAKuDuibym/7dpiLOeOklTLQwtmQ8zPYFHi1Dbigv3CBJOo
         Rs4Ml7REP4Dpe/dTzGrx377pemiyEodMfN+5d2NzJZPUct5cqz/JF50cqt0M9/TeBPPP
         jpDHaacg8Kiv/IVhxtSoNnofw/yPgxaHf7tGfkI4GoFQMuXthMKYEguAcCHVNGl1qenx
         UZf9xB0fIyFv/5aIM0fAOj+pN4I2B1JduB8V12K3ryvjWV3EQpF3/HBGNuJfLrAGZ0/0
         s2zmjQet3mgDVi8ZUkmpjm6t9VkqCXRsHANuhcMuPmOzFUR8lKVdkok9wMhwN7VJnHUX
         ttlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785600602; x=1786205402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ImvklLrI9a1aWjQk23cEhnp1QH1DUC9t1ZtAFSsExKQ=;
        b=Nm4wg19wcMJBkdU5lfyTiAqmjHuqQmGfRbTJq3Jh55l4vzPl8e7vbO0fheh8isRlqi
         SXG+V2qAJC1bWgIg6wKn60J00PfuHMOPYxYw+U/H9HtRq47KwGXulpVhSlw/EN/AbFFU
         kUaBxFbYfeaJzSfw+xNYJZxPBJHhJT/U8t7c4QHRXkvXAZ8PiuVzrK3urYZgsvFAG8b4
         ZEEZ+fnTcmo3s4JFnwziMJctLWcdPSPnwNEV5C/0iJhL9eo1N0JTQsZVFIvFmx6YqLev
         Y2DhXDnDMuKT3h32V/KBb4jKq9gyaPToGJTYtOovlDF+brJLhigbhQP1BwMNiyTogktd
         RsZQ==
X-Gm-Message-State: AOJu0YwLDIH6LWuEyzCAfuCVRPSCYmvLXaCRYVnHoM1U74CahfMIq2w4
	fKEHqz/J9TsKvDZWi8mNUU7MIfqR++oUWSiqeh7ZsZUKqbjrvMSUPruS
X-Gm-Gg: AR+sD11fjYcxfrKGXveMV3v1yglign/RWSpzz9jSXxGlYLfXQVpM3ZMktgWnE50mCEB
	RH8JZ9BnVK9WZIFfBdggnc82top18miGe0gUfTz2QBA4xR8etlfjmGYEdnAGAQhSZ6r9jAUDMV6
	HOr58k9q6v0mOO7eK/5eqdSw/lJ/3Trx+/t7BWjAPUfc7DTY1yu4UolmdCFgBMUgNiAoKVF2R4v
	Q/H33jM9Gl1gEZZkGVBOzp+2e7BdZ5CFAotdOsidQr+2AHfRQXhNOGQ74+/wA7cdlK2Q8mmPBuv
	w/4jaExKz76pQPrQ3S1JCSH6oEp3k1E2EeV94habx297aYRaIjI6St+gRx735ipSZgOcgkzYTs8
	p7KYux6/8WVSqq8BfQTHJMfJHW7Q9+xDCQn+eIc02vwzDK14bA5tMVQLS8u9CY7sjF0AVISjUhv
	6kAWD/QmB/Poxi2YG+z8L5F7yThFI4PkDXczlhleRWo4hXoPnjlXl9S13NhqNaMUL8X1kmUJVpj
	bN55ux3rU+6tG7lygk43wz4N67Ym8+ciowaclu93wUqUrVdxvMuqv5ev4eDASsSZYqkPJCM
X-Received: by 2002:a05:600c:4454:b0:493:bd2a:93bb with SMTP id 5b1f17b1804b1-4980c64b6cdmr63181365e9.3.1785600601927;
        Sat, 01 Aug 2026 09:10:01 -0700 (PDT)
Received: from fedora.cable.virginm.net (cpc89770-stok19-2-0-cust13393.1-4.cable.virginm.net. [86.23.116.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b5f007sm63578705e9.6.2026.08.01.09.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 09:10:01 -0700 (PDT)
From: yahia ahmed <yahia.a.abdrabou@gmail.com>
To: W_Armin@gmx.de,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/2] hp-wmi: Modernize hp_wmi_perform_query() to use the modern API
Date: Sat,  1 Aug 2026 17:09:59 +0100
Message-ID: <20260801160959.20382-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <6284ec25-cdf8-4e40-9a5e-0906d4ed1222@gmx.de>
References: <6284ec25-cdf8-4e40-9a5e-0906d4ed1222@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I think that the component framework will be better though I dont have
all the hardware to test stuff like legacy RFKill, I agree for now we
should remove usage of wmi_install_notify_handler() though I will await
ilpo's response maybe he has another idea.

Best regards,
yahia
