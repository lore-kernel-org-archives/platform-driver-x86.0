Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180CE4B8270
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Oct 2026 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861853; cv=none; b=N9BKOSF8xBzz73g6Fv1H9jyRJXjP9/wkak3MTAgfeKtqZstNtzFD40n1GEwFOvyN2zscVPwDB3o0s/3FZWOetn7KKpTVUaYJ6Nn+X0cH6PC5KVswo3jsMM9tXT97b7Bb3kieJMOVufNj4N2OHlizpDLksqjSY1KyV2pGorySDrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861853; c=relaxed/simple;
	bh=q3qWhoHCW0OCxysSDjAVLOk4TgRNoDkbod4CsnVmnts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgyWzZnyBGMdNB+GFFyTxHRT8CnpMAXupTP0BtRJ3BQKCH2qMNGyKL/QW5FJ3l4VQQ7Y3Fr+dRNShC58cXbcT2O9Tuj9ba5spJRh5jQO4L1MfrYuYoTTUwp89BMn9b/aklcaW1/O7AqiKNIitRzr1pzqC0oTLd1ciIjzzp20e+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMcXOdJO; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMcXOdJO"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398beb616f5so2949825a91.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 06:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790861848; x=1791466648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEIZHla1irZwv8AHiBhcKBWg0BZcEIZ5uU1rHiSqS7U=;
        b=RMcXOdJOswsLb5CTzRKQWAW5l7/Dd9aDuKH7gSLuUok9fvXTqnOPl9UzMfJpLgZrn9
         SXNmXJYmbsnoXlIuC/KNlWiEC57ia/4Krla1odMzyYRAqaeV2gOmc2W+A309ywL5ydq0
         fEi45uKDEFh0VLpiWhnURdPTLFh1nbKqoQoshkPcS97S4MLEoDs8zhs5485upd5t8Fhc
         OenzM/JtvebrpzVqmiy5EZ+PD8avPS3O/xqLVf+Na156QMqJ0rcaBuTRVaWBRhwvf8G9
         Te+6Fsh2y3xRnL6y6CnZL+w6rHqNYZ6rnLG/Q3Yf0aOf52icGVgo9UBYP1gNq/SzIzUv
         RKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790861848; x=1791466648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEIZHla1irZwv8AHiBhcKBWg0BZcEIZ5uU1rHiSqS7U=;
        b=ROgdAMG/okuEgG0MGsehYgn4unpg1aALIdgjlxzKxIsmf4d6pDm9Kd8XDciW9JHhHx
         WgVkc5xx9FfcDNn9yZqnnrXaOAKTYrP/Chh2nK/vwIW7yj26Wvt0SRI3i6jBAiB94AIq
         zOEE5+WQwG+KFG471rkqCKk8X+9Zy0FZouKXdIZPOrWc//MymtzfwisnCkuEi6X1zjXw
         z59MGurUsOXP+exT6LQdRHCewpdlzpHziaH30gYLkAMZtbBENhZDMADY61yr2gEC7H32
         TNXM5j+0zPVdOR4ZcdyO12v/o07g+BcPnUy++HGI+ryw4TjP5w7oegSClxVttmXQW37a
         Mmtg==
X-Forwarded-Encrypted: i=1; AKwUvBzp3P5s3cUUqeTMAOtwxa3grnKsEKMdHbp1t4TrTdInwM2dgEl9kA+wqLy69rjvjQiLkTu2ZKDSEpBXJxlRxAOtkNSQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJujN1hUX0HK7lF72RRGkAM1S55qHYdzWebC/LpiSnMwoyDC3oQ
	QWwo24lw2XRclbNqgIEwip5Hdb+WX6G9oU2IBvuUZrN2Leemy325PFSc
X-Gm-Gg: AYBFou3C5CDrBIdXuUxG4jqCGQQl2UzoRmOaVsF5Ix+FVnDVyhEIlNTur+Vohetf6BP
	3FPlJe4xQAnyNOta34hCRJO8Bfj4zCEwgB69MY4L8idl0c0njbD2Pu/Hozr8VPk9JcVVGsAv10w
	gNC7rccBzKzXQDk8eapXS2DhJaz4np6CPyfBbx9VigOJLyffTRO3MDXPvKK5T/Q44Z8JExbvAKj
	LffehZDhAS8S5tpKy/lRE1Xvv8UtoQ80cqEvxKTdbANkOYXkQwlM4IUX5hmhUeGajF/Mb/LZlcA
	lbG/WAhfWsYdp8YeyqX74ZFJVvk5aLbnQQH3hE60Dfc697+dXhOS0Ijzc1/TVuJG7f+F0ZKb9J6
	fFinBu+m5+Ml8e5iyAczJ9Q0athO/+MEU6LsQOojVrJ+ok4lfAzO9Gn1MjvXpNBXTk2+UgVvTmy
	C2H6DHP3zfitCbwjSu9jAyorcNgTY+CZvsJYwPS+lMjwUM38pMy+NhVNU4XuG22YqkfdTQLKE=
X-Received: by 2002:a17:90a:ec8c:b0:3a4:e735:b3a3 with SMTP id 98e67ed59e1d1-3a4f32d2c17mr1550221a91.40.1790861847715;
        Thu, 01 Oct 2026 06:37:27 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46b6bc6sm4715737a91.6.2026.10.01.06.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:37:27 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v9 1/5] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Thu,  1 Oct 2026 21:37:01 +0800
Message-ID: <20261001133705.69244-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001133705.69244-1-qby140326@gmail.com>
References: <20261001133705.69244-1-qby140326@gmail.com>
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
index d55b637c32e1..7592bfa24062 100644
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

