Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16E435028C
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783883499; cv=none; b=jkjoNSbDxdWpzKUf6wYY693nAc2nieo0GF5dEdbhaUPhOoddg5s3VRfJqLxiOH7zYE3nUTVntng7JnTtgn0hRdj98j9GWT8hnY6N/IKRta9b64G4Chc17DD2eqpID0DM2tTpofEuJtl6tvoP+4sG+qf8NIpA5Ny3roqbOHb8/FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783883499; c=relaxed/simple;
	bh=t/m35JUSACnE94ohq+nd4tq1ENlBcpeTR/iPJ9G2YeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwaYmDbKZzBkJe3iWNHcHHaJUvZJ0cmKjcVLYj+cveIroMt5Y8xb4ECJ4B7ezVlhLz0Hv+663nfUnhKl7ce8m8S53+LJOGosqceduim+O8c+F/X2cY+3ueGGk5HX9vRJyA5wocqkOq3uC+4XLt5hKsmmMnVEL/eIvSnHe1odLys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=La0jYSLG; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="La0jYSLG"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493f75f7172so13516925e9.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 12:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783883496; x=1784488296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qIN9VrLLdg+UKPx3Xza+cYYtwwUSeUCdvapUeqgoEX8=;
        b=La0jYSLGkMDoRBt62TZNYRwsqqGbEGO1MiP3LQk0bSP7N0y3VWY1fdncTayTI9YL0t
         aUuBRKekU0He1989kDPw5UgPBzvbi9nylDuBSFNPrVAuprcPZYvU+Cj9jv1UYzDsykFm
         U+2u44aQTaHYVxotlejjkiLWX5kPM97ICYskrTNoR3ykHvY47wY6x+gJIABJ5dJj1oVm
         1TvWI27AmLLhAfuOha7n+vECVkPBNkkTP5SelEe5IrzxzqrkicLh7kbQ5tc5k9ceFkVS
         SGhWE5BKV5VH8Ac31RXfYNu38dI2s5Lm6zKYJg9pKF2nT76FqaIAKZ6LxAHhNIxKgX3q
         cu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783883496; x=1784488296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qIN9VrLLdg+UKPx3Xza+cYYtwwUSeUCdvapUeqgoEX8=;
        b=Lq+5Y2CZUH2NvSHSRaSre0nSmF1oXk6deTwD1PxWoNTz7FF9cbdYFeJkGbVWsCtlOW
         1zXJkjhtEaU9V7IV9RuxdF809yD8ryB3O8jHfeyqx/IFzZnMZ22KkMIp7MQ9HdmGYAHj
         yZVi+JYBp6WpSuOX8UfLno0RfgQZyIb9afQtWy7hwOBr00Ljn3Xkc4KPyscyl5Ud7PyN
         Xd+jE+RAyVp4/KBrbHJJcOmtrmnHISNkZ9UfuatDvJM0qsP/mHsiCi4OgPTtYxOyhV1s
         ZOVQDeO8d9h82djTw6II8XR+J0eWMBWEWfYP1kCecYb3eEiS+kVTDOxY1UEfPrGGdlrL
         +q+A==
X-Gm-Message-State: AOJu0Yz3ghA82U0KIIVsq9iohdAy60AeKot0cU/7vKS2CMzJML297WQv
	aRE1UHKn9OCDLLzfwkCX2+BXM5WwYphCKzcd3CdzjvvZnmF8yUUaRA9U
X-Gm-Gg: AfdE7cnzVXBmrE18+vmVvkdwTNYAu4YfI0xZeAW0lSK1bLnLXwL8h0PGYB42I5N0j+d
	OLnALitr5g4ALrh4G250AwG9Vv2SUqi+ptPWjvf1QhsdHIH+OMM5nRs60QJu/ooUnT16LgoHBHJ
	fW1O2sQ5LMeDnBo/b3uknr+nFaqYeCWWS5JqEoYGAWqeeaDTWcqHvfKwINdQ8HSbuO8/p9QURUf
	q5N2rM/KUHkTwd+a63nVzZx1veOC9Sjwn4Y9u36+5aRqtU+U2piv7ph/c6IXDCXDX2OhdcH/5Et
	0LRNh9qyy4g6ENWvvV/2b1iHsdvxZllkR5enM+B2Ktyt+KjYCk32q8tSUzARyjMpIH4krnCi0TE
	BclCaG8OwOa15aVtysDqWzNKf/1NJMwiangkLMWweBSiMYd+dVNBeQnkNWzONg3HiaYThybTf+e
	ycQW+scjnf8xSuWA==
X-Received: by 2002:a05:600c:5493:b0:493:f262:b8 with SMTP id 5b1f17b1804b1-493f87d666bmr65020525e9.1.1783883495770;
        Sun, 12 Jul 2026 12:11:35 -0700 (PDT)
Received: from user ([197.197.151.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2a2e499sm234468265e9.0.2026.07.12.12.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 12:11:35 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	yahia ahmed <yahia.a.abdrabou@gmail.com>
Subject: [PATCH 0/3]: hp-wmi: fix various issues with
Date: Sun, 12 Jul 2026 22:11:27 +0300
Message-ID: <20260712191130.41183-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: yahia ahmed <yahia.a.abdrabou@gmail.com>

hp_wmi_perform_query() currently has potential security issue and
doesn't use cleanups like __free.

Patch 1 adds the __cleanup attribute to arg and obj variables and
removes the out label.

Patch 2 addresses a potential integer underflow flagged by sashiko that
hp_wmi_perform_query() currently uses the length reported by bios and
bios_return structure blindly, which can cause issues as passing an 
small buffer or a bios returning a value smaller than bios_return will
lead to a large number being passed to memcpy, Fix this by adding a check
and exiting if bios_return is larger than the length reported by bios.

Patch 3 addresses a potential security issue flagged by sashiko that
kmalloc doesn't zero out the page before handing it, Fix this by using
kzalloc to zero the page and allocate enough memory rather than 128
bytes.

yahia (3):
  hp-wmi: refactor to use __free
  hp-wmi: fix potential integer underflow
  hp-wmi: move from kmalloc to kzalloc

 drivers/platform/x86/hp/hp-wmi.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

-- 
2.55.0

