Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586081;
	b=xvy8ilcIVdX5MF2FJn9e9h49vRZ2J/iAPU/DLvrT3aPMJw+fL5BnyoQDLtHc0H152D/m
	 /+7r/GqJTaD6+G5+tvB/QbVodA04zsRQx94WfYoN6smmZau5BulF8BxlvanZEvhtU9gnG
	 UGcLNmFc3+zGAjCw3ud8K5vNeHIsPKlRyzD5/QsM58+2tBkRO3L/KtSvhZnhg+UkgWUc6
	 +UqsD/KsTlZeXEZKaY7aoiGNzXITJmtDxwyFaBgQPvwWJyqI5cLszRnNkZKMlQimP7qGx
	 ZpeueUOIiIN5yuDqv44EpZ8kqaP6qX0VRVCUtp8lxzJJNxYBHVaaeHkjv5idA+zMKKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f4nusZtPfvxWEJGgkitB1nCWYQpN5wwU721sOcYgMrU=;
	b=HcheSEUMDGq1hfmzhgqgrQ8nU8PrcgYoTbesKw2RND60Lj054nS+wtJAaDhDSZq7JlbO
	 TF0L0Hlyxtxf+uaepfvAFhQKC8MEYkl6pKtJd+7yVV4DzN41EIoObZkvHNiRqSYQ35z6Q
	 u/7DCJ4x9sfaxVm9ZK998H4E6SVZndVjTP568AnBkyXI8OBAynkTO5YqV4O5JjUGa2ub6
	 PJgBf4YYSzjh2lCza4MQh7CII4vbGYmWffqdrBg2glni2klvX9sAYx7tplC9+5cYyRH6P
	 cZs1rBNdu9cJlkyM/IJjgRAw72wG5pRDTD/HuT9OYkkANUWLJ7PN+YqVnq9H5182waA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNv+xtka;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A84606A33C
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 12:34:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A84606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qNv+xtka
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so567020a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 05:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586080; x=1793190880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f4nusZtPfvxWEJGgkitB1nCWYQpN5wwU721sOcYgMrU=;
        b=qNv+xtkaj9e8fvQN/Lf6TTHgGBcsZ2dVz5uTfDNP5Zok9HBqV6y01ZfVzhk72M3MWG
         vf1SUBBm8nMDULiTdREYrInujFA1RQe8ZqSY82qzea3WijkG0ULtWczetNnNIqEBWNUO
         FzHVLBpiFs5FVWYW6zyLQks2a0yItZimoNIXbfzMI9Vy1gaU/DqecYfB4NkI9JGQFFzO
         30kRCNTh2QRYQp6kYJ1U3ST4Kzm9w+BLbUl7X7rHIcCpwSoVC5gRCIGKUspLBEtR21wk
         m/JELyWEmJohGFMvHJfLY1I24K+jxSwjKm0od0E/ZKf5I9F1+wEy+4LqbUpzwd31SfQp
         lKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586080; x=1793190880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4nusZtPfvxWEJGgkitB1nCWYQpN5wwU721sOcYgMrU=;
        b=FYH4gmImElysQz5ab8Lw2EJMFoNUJ3Od3fP8hgHFk8eSBv6PH7WVt17+bq6B6mVxo8
         Zw3t9tOGOn8B5LS/MJbKZJ/2SuVgxuUV7EOPpl17232mikenrH5bWOjASCE+cfQL9akH
         5qY1rZCeNVr3XRpy27ke7liGMVbWOPNRSjo5nFJv/UTOHLyzrZrohuUgbaQgl5O43lwr
         UWrmT7JycOCng6yhhzp9UVQWUT0JrR24iMEbCeCFUaz6hj6vjOFloDEzEMptqTnMMolL
         kuea2vxpM3pam+NO03DlI/lBv3Bv8emp+E/7NeoEoZhyPWVHraXFLsCzwFyJlhKEWIts
         3nNA==
X-Forwarded-Encrypted: i=1; AKwUvBxSFl9CpdUVeMK8t3j1AZY1lQ3RH/5ZtNidM4BPEys+rQndepT4bYL1kXR3viJqz8JF3QltBEUkaG+AYypuLfz6T44b@vger.kernel.org
X-Gm-Message-State: AFq9FYKSJyi0CD6KpvCYFj6c6MMGcIos/dxxxWKldrRFJDfBMlLVm3NW
	ywn/RsGTFawBZOhKQ21fhzftSajhjxbX1ZAu1CbCtt8ujxfyAx0IUJAo
X-Gm-Gg: AYBFou3BwdMlDQwGBv8DFppDTWc01DkT2gvn6ClirO3b+6hseIlQAVfw8YzqvYNLGOf
	qy6gi0R3qoSLuG9WjE/CvFsREyEnAaaWIb3TyM3UQ5JnavGMdP0eJ5tT+sPC2vtqhkah5/FKii8
	sfgwQ2F8cka864dK/ntWJ82beZL9M4KGC/wephzb9d4OD4iv7IgsLBFSTHcVI/IgbTd7pdfKLyR
	d9bMTDC05sfgjQa98TK9ja/EB5kcGZQZVT7PL2GUF1PbVgZR9Z5ciy5guSb6OvEzHf39HVqyJOS
	FnSspjSgCkdwf+iR1SaZj4WpA7w0dpcNNSm6AC/nt9dVpJkD87XQ8/4iGMn6UhX47XL4v/Tf+cq
	8/TMmfBV0O4R9Ev/wsckeJsa9S9PBF5NqlwU8K2gHFlHUG0unsyoA15NPOw4UNlU7ZEVPQoXysW
	1D6MJsXbC4CqA3qbbtDD3xtKoCKHxVQjOKc+MC6bBwzlD6uXlHGP5qSQ/vCfj6TqnMWGr+zoxVc
	2mQWj4Egp3RAc9nPRMPwefxwxGy4k0qOY/WsGSXpbN8iYUaT6MWqQKdXg==
X-Received: by 2002:a17:90b:28c5:b0:3ab:be66:ddba with SMTP id 98e67ed59e1d1-3ad86f44cddmr1574310a91.23.1792586079881;
        Wed, 21 Oct 2026 05:34:39 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:34:38 -0700 (PDT)
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
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v13 1/7] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Wed, 21 Oct 2026 20:34:08 +0800
Message-ID: <20261021123414.25516-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021123414.25516-1-qby140326@gmail.com>
References: <20261021123414.25516-1-qby140326@gmail.com>
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

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cfce3571ac01..63d2fec54e86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23043,6 +23043,13 @@ L:	platform-driver-x86@vger.kernel.org
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
2.56.0

