Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794979564;
	b=2tO0YCH7jL7Ve8rXv3ZhX1FoteaV8glFOK4c1EVcbBpF0ubaBKN2eC/eTaUjC+TG2mdq
	 sAGTtKy+BuNKrCzyRhcbhGLLhjg5MYp8joYYc4t4lsTjsPKPTIJGH75rl37ybhLDvRdKv
	 Qc0mJrC7kiO04JCE6/e3u3Ugv9bPlmb7A/PRwU2/6UcoSKUPVyyLLUjnaBDSMXEmiHol7
	 3/vx9tiODS7Oawk3N4bfknPkvpj3oA+xJvcb7505dmJnSgOvY8SE4keBlrM4xLbvQ8yRY
	 Oxkx5QA8ABfpqOYJsbYRDIQeUy2txhN4P83eHy+4VXpr33Me8XCuISdJLFySGnA+Jcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794979564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3AyTfnrhKZnHoi5Vb+f14J/Ts9S7W1zXvJeyABxivT4=;
	b=PrG6Aq6uN3B6Xg3FMdkcB859k347bWpWkj1ll9KbvUFHurVJIwYEdc7ZK0ZBKaMVHoo/
	 QEPXwteP/5MN7gv2HjAltZrfDgZxTa1dmz+Qp/A/dbQyzItyBxgXUMMN3OpIYSPoIF/TU
	 3s+izbKaJZd7twKgyS1OZXW9cSmJaJiA+wKmCV/5QnWjSXoP9XM44Iin+ETrN9JMvYy25
	 ymIqHIkKtgSaFnsaH47UEWX+IXTc+STsXZB0oHpESkIjVfmXWCEaY/mO9RIxMemaBFA97
	 8vEhST+WGHTSf1PHOgqBCUb38OnoHo4pgVjoDCchF+RxQm4405E3iz7TeMXLn3lZitQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aletheia.io;
	spf=pass smtp.mailfrom=digital-apathy.net;
	dkim=pass header.d=aletheia.io header.i=@aletheia.io header.a=rsa-sha256 header.s=google header.b=bFRytvO+;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8737606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 05:26:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8737606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aletheia.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digital-apathy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aletheia.io header.i=@aletheia.io header.a=rsa-sha256 header.s=google header.b=bFRytvO+
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40312e2so1796473eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 21:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aletheia.io; s=google; t=1794979563; x=1795584363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3AyTfnrhKZnHoi5Vb+f14J/Ts9S7W1zXvJeyABxivT4=;
        b=bFRytvO+6dq62a8ROc6+xFdyvPlQufe3rlJEQYm8zt3zblUIrCwh8SB3LlewgF0gww
         6ojzVk4tcmFgLRdd+E5QF+hWL3NN6zz82yKoAhVUaxmx5FPGv5iOcTyjTHtC8769ptUH
         ueVLuBAMSE4ignMosFdXIjLx/x4vkWshOf/FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794979563; x=1795584363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3AyTfnrhKZnHoi5Vb+f14J/Ts9S7W1zXvJeyABxivT4=;
        b=opFGXMbj5bVQlOWOwGn4I+YM/q93jOgVI5dG6oOYjbyQgpGHURwTUrwYTQqozbZZWg
         5vzbLyt0P1DUTjjMG4fCtCh6OTZ65mjRIY62E07d+62BwZ5lk5oLsqySgWIVpv4XrQW5
         jr0YwfilhToa9zU2qTDAtuJDfqfUb81riPplYXNjNhhVX88K+ziEHXy8214ibSql4+q3
         wAT8XVxNATrjzWUjZU+dPmk2DpZwXVW2QFn7L6wRp2YJLk5qTowTzH3ZsdTY/6n+1LCp
         beMsi2W/tV71W1Iz3ohEKXOc+hdXkHc2y8f749T0DbzKiDYobAdYfj1q2R60z7KlcUvF
         E4NA==
X-Gm-Message-State: APuU4Z+wkHZbL8erc3VcaX2psZeN9F/j1okMcoD8Rwqm3Hm5ftUWabat
	ffXdzNfhHM9O0ZkZbqrXBNUx0itzaxdkzPT0dapwRMzDjp6eBVaVAIqD61+8WiRblcS8q2+ThZ6
	sLKf3QWi09Q==
X-Gm-Gg: AZFdTZc3YsKpdaTS7VyYfYepqYK5T45JBG3Kp0uEvuDeWBBSL9z0NC9hVcqyAzXuShw
	ASmIE5I1cHwre4XiGvtqEccpP4C+2+R2J2aeR0K7nSOIv8e8Nle+NNBMKZmCQriLe+mnVxtF2s/
	TUa9/rVGNx8DjTFO0dkU06llNTMX1YDwrJeK8fxv7jwfyoszXiQEa/fCJmg4bJp0tiotXX590dQ
	O/KboGQNb5Y75tv3imv66yLSkceUA0yJp2ATlSxw0dvET3XTD8EMKHXE7K5jyypDaUL8KclUTyS
	Eqob3ZP2vF16f7EvJfgjIVxI951yBMubh/TgCSCzw5jJkOoHF9SoaqxKKRoIlPkw+yNodDYI6Xe
	PDvRi5vAKDY9xjTQXFkhZHJjUxf0GRJ0YkL1LmszaMVqmbsxqc84+oNRlOV/y/KxWdGZFHyfmwt
	vv2RFPuYNGk6HwkDj6E08JETH2wJYUpGItW94W1THqPMFaly/ugvyjaLBQbG7RjrmPxuxOIP202
	xMDJh7XhZim/nVn7U5zol+ipubeYtEpGPH6OvTgG5BWokZ6QLDrA14x+OSKfYKQtZG44BT9HgBI
	hz4s7GdXUSlPmehAn7ZsrDbCAhWCtV1xpBng7anW30Cywb4V6RWP
X-Received: by 2002:a05:7301:4d04:b0:381:ccd2:f6ad with SMTP id 5a478bee46e88-3828016ffefmr1459942eec.18.1794979562862;
        Tue, 17 Nov 2026 21:26:02 -0800 (PST)
Received: from flow.local (ip68-104-24-230.lv.lv.cox.net. [68.104.24.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm3590304eec.29.2026.11.17.21.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:26:02 -0800 (PST)
From: Jeff Hagadorn <jeff@aletheia.io>
To: platform-driver-x86@vger.kernel.org
Cc: Antheas Kapenekakis <lkml@antheas.dev>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jeff Hagadorn <jeff@aletheia.io>
Subject: [PATCH] platform/x86: oxpec: Use the APEX charge registers on X2 Mini Pro
Date: Tue, 17 Nov 2026 21:25:57 -0800
Message-ID: <20261118052557.143089-1-jeff@aletheia.io>
X-Mailer: git-send-email 2.56.1
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

The OneXPlayer X2 Mini Pro was added as oxp_fly because it ships the
same system board as the OneXPlayer APEX, which was oxp_fly at the time.
Commit 0ccdf9a1381c ("platform/x86: oxpec: Fix Apex charge limit
control") then gave the APEX its own board type, because its EC keeps
the charge limit and charge bypass at 0xE5/0xE6 rather than 0xA3/0xA4.
The X2 Mini Pro's EC does the same: values written to 0xA3/0xA4 read
back, but have no effect on charging, so the charge limit and
charge_behaviour are not enforced.

Tested on an X2 Mini Pro (BIOS 0.22) on AC power, at 88% charge with
the battery charging at 42 W. With this change, setting
charge_control_end_threshold to 85 stopped charging within 20 seconds,
and setting it back to 100 resumed it. Setting charge_behaviour to
inhibit-charge stopped charging, and auto resumed it. Without this
change, neither write affected the charge rate.

Switch the X2 Mini Pro to oxp_apex, which applies the oxp_fly quirks
with the APEX charge registers.

Fixes: 1b3c0028dc06 ("platform/x86: oxpec: Add support for OneXPlayer X2 Mini Pro")
Cc: stable@vger.kernel.org
Signed-off-by: Jeff Hagadorn <jeff@aletheia.io>
---
 drivers/platform/x86/oxpec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index c4c4bab..a7d21eb 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -305,7 +305,7 @@ static const struct dmi_system_id dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini PRO"),
 		},
-		.driver_data = (void *)oxp_fly,
+		.driver_data = (void *)oxp_apex,
 	},
 	{},
 };
-- 
2.56.1

