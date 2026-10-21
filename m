Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586132;
	b=wTCMKikhWKELGUYRe5dXwTS/ePcd7ePu8OrAQ6GF6jIF+mFSQL47Bkn3Wc39v+DzEnUc
	 K1POBbCa1yx/BEb6T93uceOKpOyat0dnkKZJXM6EfHa6DppSRyXaHqRxl7ps5lUI9yPwo
	 hIG45N/Dwl+HjbN6lntVhyKtIYOWT3hl7VKoKLC0xZbIIQZT2tQz3+T5w5VIt1OVJk+CE
	 /GyN0IqsPGjMzhuaBPlgpabfQTMB5/OZz4C9S4I3PmBI7LYZOb/mWQ2hsCS7coLitKdue
	 aVv5g8uY0fPrgCTOU7F09HNsA16J67JBmAT2Pe6ZkGi1MeR/BKCYus+Invqua1sjX+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wu1qxZELmS9rWT/CuocSgQnLIE8sXZ1eUSoJrMvKaxI=;
	b=dd8eKdXnIwrNplBfbX0pXYsI32s7ZuRZ+a9Rwv6Ntmv/MQxCWqmhNcycqO7P0HflRTAt
	 FZFtDFTQ7s3R5kvZoDZTEQ+d70eBoTThYUZHEXDSn32OndR369/elWlTgVpKtucVJVDDl
	 aP126uebsOthZLGtbra9NFOQisD6pBkhp3hvXDzn+EuzMH0j/1VlESXmFaVO4UbKn3P45
	 H63uG18iLimgw/tLPkOLW5VY7iilwAGzhIAeJ8JdZJyhPw2lh6nM2ScnhN/2HiDspnnuH
	 8xdE3WXl5hF2D/HCSjzIm/zLbDbzOSj7NZdBmTxSxtco81oWjKNN6jQP0xTVwyXvK8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G7D64tsG;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5199606ABC1
	for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 12:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5199606ABC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=G7D64tsG
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so702450a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Oct 2026 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792586131; x=1793190931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wu1qxZELmS9rWT/CuocSgQnLIE8sXZ1eUSoJrMvKaxI=;
        b=G7D64tsGDl66QqN8Sz1fWlom/DCu2eemXsPvx8ILE/DFYzM1apBcPN7JF9qZ25MurD
         6mNITetmZdNE9pTP+sA/vxzC53MLjBAoHcMbUTl7ah6OrKfhlLK+jvwhYlLI5Vlb0uhu
         1H9QOHB+4J7OtUg/Kkh/u6mUY+efs8jGigG4ZSHPH6zxe/NJdsL9AsdaHdKDNks8OHS6
         Z41esGAP6zSqGyNHUE5XCzTLfADGrK05TSpjlTIOiAAcCbwGNluhijsUU89xZvblCy5c
         pEBaO/nwtAu4opN4lBab4E0QYpiPjXltPXNVD5ENKKd8cDFl8kJtMeW6t2wo8nrW84EP
         +kDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586131; x=1793190931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wu1qxZELmS9rWT/CuocSgQnLIE8sXZ1eUSoJrMvKaxI=;
        b=ypSV+bSDUP7I4XOedDFOkHrhkjJ3DXZJ8791tE4QriGvBL0wSfeHlm0Fh3ZI7i2grV
         r8FZTrfKnf/cZMg9LExzHHo9LmZPSF0jBlJlJjz4Iiqk7S890LakcXO7YR+3eTZh87hQ
         mXOoL9glpSUYKjPm5ESux9lvwgeBtveRCDQrufMmjwyiyotDox3zgMmyixAQrv/1ak9b
         kNuh99zP3hDG1tk0hKKE3mRzevEo+8MiLsMaUhv5EdLXo4IeUd6yhKt1lkV6i42kgSG1
         CBevg+vxFxrDGIm446yVTeyiAzhzmobfooPrvsWE4KyyzLSwd8aHJLeQPIK9gO2f5i48
         qiIw==
X-Forwarded-Encrypted: i=1; AKwUvBw6EIHgCrmlpBaXxsi2OZ9gEernqGejzEOjDaMUckzq5YTLUEzmhvEduPaH+LyhHB/0gN19vf99WuyH5gIKNmoYQg3Y@vger.kernel.org
X-Gm-Message-State: AFq9FYIpfUbW52p6FeQKu5Zx2LK9DSLdOShWmpCORRukzNWZGv0h+3X6
	MoJs46S6p0wV1ILXJ37eMUW2DoSKyWakx3aL/rCc4hP1NHkEbw+NVb6U
X-Gm-Gg: AYBFou186liFukcivF0Ilz499C0H5/PWDMUBQ2dpDgcNgeJuZ+TXauJKRriL78sKTRM
	qiBEbzYs+hScjy5pLR84NAck3uOlyQ7tNYRlv33hEJTq4EiXXdhrGnvyfAU8SqhcYakQO59BGQ8
	bW2+wlhPdR7+DOJTSBE0iqlpeLu5QxNfBIFDaDjOJdDDh2i4t1UjpgXYn3ydd0G3FNNyw2+eDVL
	pefRUVt5Z55DNEPt8xA0gg/XCu2xzPIYmvaEA12deQwqyTQvX6cRe8BBPywNCG3uYcbHlvFszOp
	qvzJy+SSq/i5Ub/2cEHwq4mTwmgPWJnL4BywQcSbtO1ikdgm06z4c70zD7kILxAL/pjVNJHPRDK
	E9Y5AlwywOcT0zAMUaN9W3wixkoCPzwCV26xv4J72yUFgrloVtObMW61joM9ezCa5eXH42gNceF
	v1MVSB4Vc8NKKUty2rP2TowDb761PkD8oLe9/4SUJonXS67dJ+QD1a2Dwjs3BVDcYxsc6fgEdHA
	c6/jFr/ar0jVInykF+KIve+P1L3xQ9f+MxOecL50O1Kv/Ty8/usXGWO
X-Received: by 2002:a17:90b:4c8b:b0:3a7:96d:feaf with SMTP id 98e67ed59e1d1-3ad86ec6e0bmr1005629a91.16.1792586130463;
        Wed, 21 Oct 2026 05:35:30 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f56b03sm1823615a91.3.2026.10.21.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:35:29 -0700 (PDT)
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
Subject: [PATCH v13 7/7] platform/x86: bitland-mifs-wmi: Permit zero on SET functions
Date: Wed, 21 Oct 2026 20:34:14 +0800
Message-ID: <20261021123414.25516-8-qby140326@gmail.com>
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

On Bitland laptops, the ACPI firmware returns 0x0000 for the function
field on SET operations, while setting the return code to success
(0x8000).

Because bitland_mifs_wmi_call() expects the returned function to match
the requested function ID, these write operations fail with -ENOMSG (-42).

Allow a return function value of 0 on SET operations to prevent false
error reports.

Fixes: dc1ec4fa86b2b ("platform/x86: bitland-mifs-wmi: Add new Bitland MIFS WMI driver")
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index f4f37ae2f424..a4c341ffbb9b 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -258,10 +258,14 @@ static int bitland_mifs_wmi_call(struct bitland_mifs_wmi_data *data,
 	}
 
 	if (function != input->function) {
-		if (!(data->quirks->accept_zero_function && function == 0))
-			return -ENOMSG;
+		if (function == 0 && (data->quirks->accept_zero_function ||
+				      input->operation == cpu_to_le16(WMI_METHOD_SET)))
+			goto fn_ok;
+
+		return -ENOMSG;
 	}
 
+fn_ok:
 	if (output) {
 		output->return_code = return_code;
 		output->function = function;
-- 
2.56.0

