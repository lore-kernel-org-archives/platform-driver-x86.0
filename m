Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049AF3EF0A0
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 10:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799574; cv=none; b=SlvxOh0gr07FlxNypQ8+ddtNRgaM0ZC22kNV3iAfCYFrPs/OSziFJqhGILTdmJ7nqhqrJ7wtnsVstayrjP5QF2ejb2SKKu6Dlk/o4V6kkRD9JWzd/qb5RhT2nqbrYQXKTtwBM62zaPsy6Kfv3WAh9KwK4kzod3X2wEfA/KMCbus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799574; c=relaxed/simple;
	bh=mD6dZoP3ZagEhLT8en6JZ2TEnxmI/QAwfBdTaspPZtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsbrMg1URJdbV8wSEZ+JxadFnz5kiWiqLZpul7IySpmAmQPuDS16weV7yL8urAyJzpqlRDUBfdxj1xe6eg/jtAQON4TzOY1Tqg/Ln2qLbOekbIdb14eHF0fHRbfiC1GGAeSLkKCEm04KmZjLp2aA71dHUBmBf+oJBHt1MXlNWcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/Qm6ZMA; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/Qm6ZMA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso1261765a91.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 03:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799561; x=1792404361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=T/Qm6ZMAtSg+179AvlMK47FWRp0K3mJd9ErXROGGyvaSHVZIxrzFf8bjIfEGS/vaGx
         qWZH18ONBGW9l67KAd3se5ghz99yXiWzT7fSlpMRRrHb9dhIHz8oncxbaNlg0Ho1PfY8
         VliL1zoaYeAx3c7gt6sLn02ZXcIOY4ysWqBNbzCQZMRGpIOQ1qh7Yvih+IO81pt511hI
         RGRerAng7N6v4bn6lLEloM4HyW4fHj6w8rAinhhXdFVT3CXfMqGTwLY+AJiDeLAlOJ2a
         9CZ/mQJd0edRbacNVfiJUJbx7ijEmczFL7oWCycRme2K4IkfNpfimmyW/KGS6LV40X1w
         4Eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799561; x=1792404361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6dJ7hRSQIEyiDrhx4pqjl/RoZOTZG8NADNLqENX3HhI=;
        b=qZcknZRtONRx+H1LMmu2fuKn0BBJhk6+2qddCzV+LjqI4lkSQ8q9Y0tYVE5vPFZ7Qy
         4qvbfkrhM0JK65FTIGj0cmB7A8/FZFBOL4csvn8Wxzwx5n1rtttH1f8ngqzDh2qzrX5M
         5zeV/AiyZfuK8id8tfiXY7BDeb/QPDMrz4I7jih3/mFmhpKG6QzFyN/nUN2KQOkTOt3i
         0vt3Qzy5hDbvYuAwOrGehIuWg2I51nSXGDq3YFY6g6fbOC3rJSK2b2k3J2FeqzHTsMdA
         OiShDxMb5C1w2EujX2Gd/Jew6DPCCicUBtzj0dPKFRqHA6UyNJ6E8ru0vOu/x9PWE4Ki
         K0GQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5G/m9sUZdmmEXsYHyhZVQVjMKR+EAWOM+gAeroyOdj/jJgxQOa7uKBkD65EdFhqtelQJSEhBWpv7SF4xMFex8tOK2@vger.kernel.org
X-Gm-Message-State: AFq9FYKHjkUtZPHeBnyd3AtCFJCulAqO3LF0Jfw9D6HwGIMxok8KHu9x
	oCqstJ5XDRljI5wSxdvU32tbhZkQKNZ2FiKW8WxbX2RgKziMp/ZmuPP5
X-Gm-Gg: AYBFou3BoyIJVAY3EuLYTmV1rgEe6ky2ufxI7Y7pZbvyb96e6P1awCpnZdlQISFs99A
	FvXIHaJ3FPENzdzQj4LuO7jLfHyRIf27oC5+7G9ruKSmEmgCX89/7sS642SG1xH/2UANV6GwmxW
	VZL27wBlbBTSPS+71yK0/fnpWTpsM/GFwUta6ENmkO76OX7EYhNWmF24S0nuzZtdOvuu00gDOAg
	1G4N7Zoq/RXtLxQRm3ufS4jyEdl5Wg5vOxJYymTc7DkLD9Cvr5N47tiXmKVfJCWS+Brrxgr2Ony
	DE8xmm9k9Rub54Wg8rOWe02AAaFFNYd2/roCphqzjazWvfMSDstmhKwqmx5qucZgJKPlF+xZsxC
	V1yIVFi9LbSPD7UQH/6IwzD+dhb3h0fekmqrYrcTSJoxyDdlqpo/Rdz/dh9ThFGZVjrBbNIpSMd
	veUvhGpWVvEQAoMT7/PF/D7B5rKd0kXDWbWscixQMMH228HI913iG3q/80AoZE6i1cuDE7brU=
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr8544966a91.38.1791799561006;
        Mon, 12 Oct 2026 03:06:01 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:06:00 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v11 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Mon, 12 Oct 2026 18:05:27 +0800
Message-ID: <20261012100532.19612-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012100532.19612-1-qby140326@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fa0571a5e479..0874713f262b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23042,6 +23042,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0

