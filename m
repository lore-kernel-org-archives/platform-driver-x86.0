Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C2D51DB07;
	Tue, 13 Oct 2026 19:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919746; cv=pass; b=ENIraCtEKh5uQuEft9O3MTVC7k8D5JtzgepstjMRM22kq5K9uajvd6R3fBS4IemLfLqgv+4/U/SQeKFDldy9ycFmwbkOfJ8K/XeYjCBWkT+43OxiVFyRpzI5OSH64McJGD9m5q+mUKMJjnd2XBJJZhdSH2LhBRHfH9bLH73Dphg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919746; c=relaxed/simple;
	bh=A0rRh/QeYtmdUgAhUuqkGkSk2dzuMp4cLDqwyVGPelM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q5fTrl63UFES/NHB1YB320iz7WEJjdXTS+FGyFk80pw/iMrQHQ6J6whL4jH320x5nbJEOq8Q4fwmc5W6KaIwSb1TzZdHBV+pvBs5WXko2TKPgN6VlowhzxmsX7aGfGX5k8oP6nq1u1GtnmqOhkEEwAYh3NHWMQeWuNCurFcUnjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=YE/wBb2i; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="YE/wBb2i"
ARC-Seal: i=1; a=rsa-sha256; t=1791919634; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=K2QcfHuMcfp50TbvsAnwV7RLWaj8VwGTrxLhcsOOAh2i5ylhAPpc6pSyWRcThlktEjKTQbM1s4KxAGGEniC/KmtFIKA/SVX+o4PnTxpvRwktV3l9GqA3Oj3Oop6ee4m1rsZBXX/s47hTTBohCb6QijM7WSDjNAMK/Y5z97klHlc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791919634; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cu0Ku63ibtiD8dSCNBVjWGKMrJyfLPEWtMUvr63+F74=; 
	b=Mb4xZHNfi+zc+Lczo67y1a8HCqI4fFIm/c0+5A85x5635mLchqw8V+ox2x6dlCqoaSIPUhnJAaKS8doHvN1FCphPqNeFIQrvBMLWXH7v4mKcDs/r8bVut+dmc2TG/ISjZa1Iz5+G5KRetP3RmmGTSNoDX7US8lZWpVR6wU/bYIY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791919634;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Cu0Ku63ibtiD8dSCNBVjWGKMrJyfLPEWtMUvr63+F74=;
	b=YE/wBb2iImwU+TmPa2PLVaZ6jBDUbIL/3zr84EYjxleGb+ug9gY2MEHDtdTpSEZS
	sBwTRLJ6lLChrvxQUHq/QYWUjMtRr/PV0deZV1wZxiqKU+LKOoiMduEoTanVVa/Mxh2
	NLrLmjz0cAn2qUwH4zMRrxCsGku7sjOcP1hHkn2nUlVwibqg8suLIiHguAL4CjkSN/m
	19fIPbE2CRWukUrL0DPuVk2okaQZC3EZ6xEdC0i3JmQJ5nnETGQ8xOB8xXLK50JotoW
	/snjuEHJab60/8e1cZfvip27F8hmp1mEfzAuz7/1/TTWp0fG1u+LKt/NDlJRz3lRbVe
	PRv8UVEPhw==
Received: by smtp.zohomail.com with SMTPS id 1791919632384990.8018042401861;
	Tue, 13 Oct 2026 12:27:12 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Wed, 14 Oct 2026 03:21:55 +0800
Subject: [PATCH v3 12/12] MAINTAINERS: Add myself as a LENOVO drivers
 co-maintainer
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-lwmi-wmi-new-api-v3-12-e1032bed1c81@rong.moe>
References: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
In-Reply-To: <20261014-lwmi-wmi-new-api-v3-0-e1032bed1c81@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-73bef
X-ZohoMailClient: External

I regularly review patches and resolve bug reports posted on the pdx86
mailing list or the kernel Bugzilla to improve LENOVO drivers (including
lenovo-wmi-* and ideapad-laptop) along with Derek J. Clark and Mark
Pearson. I've been submitting patches to add new features and fix issues
on my devices, too.

Add myself as a LENOVO drivers co-maintainer to reflect this.

Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Link: https://msgid.link/782FE636-A06A-4E12-9563-786374805947@gmail.com
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..fa576b4b5919 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14808,6 +14808,7 @@ F:	drivers/usb/misc/legousbtower.c
 LENOVO drivers
 M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
+M:	Rong Zhang <i@rong.moe>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst

-- 
2.55.0

