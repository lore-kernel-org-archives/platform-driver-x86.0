Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC023DDB02
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 10:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786874922; cv=none; b=dOQ2R2ej3oDGumnFtleL2MeEaZaShMiT8emJh0RmyQkloXKCkeOQJFZQ03tBpAGqXFyhT1TUIFQJHxbzQwkE8s++EDT1sYb/zPPBPPD0QIHH2YVSbCKHMNwwTY807WrYjUjfUUeKfBURWH/Y6ufLgHGM3W+n9CBfz4+JoOE3Y0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786874922; c=relaxed/simple;
	bh=QY5aebFr1evE8tRE7OmTPb6tag7jx6XNKxf+rMRmOXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orl+Q+HXODbekLuXYvojsLgqJgf8pL606lhjku/SRy2Hoebm6DQLueT6vbntbbKKhip1hsYtVFnJLUBSck5WseUpvip1Nkv8Bc9PRfb8T85n0tOuo99UktDz+/SSzXDqK+h7U+Lrx/F1BSXqNRJudiT1kAYzK1wrQes41NVXCjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1nVFUkr; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1nVFUkr"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84faf87d19dso2531454b3a.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 03:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786874919; x=1787479719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3guaqxr7NyyvixOm12MKeegXbSzy/kPgiJ95xUExEc=;
        b=M1nVFUkrdeskYZcbeJBJnCgCyQ78ny7g/e6z0ZZ0QG4HMEmS0rKcEBdo6cLlEqQ7CP
         9JYq7IXjHhWfeqffLGMmOdnwxAEfum3bnANmAe9ASxajIDU5J05QzCxc2y9rdNFYQ+7V
         6Ck9Ezyaz2NABIRG1kNS+pHSUqqpQgR+d/DdvZ4t6lV/PyYSLawdiXqeSFCNgkkowD7h
         bDl4Q7n46XGLyWLpLc9npkYXYRkAMSg+Oq+QZl7XSnVmxVUbGeuUNoNtFiMeRHH8OJ1W
         Edznd0rGztolbX4CUX4aj+9THm4fZ//QtXAtGv1tly0+zF20FFvWw2f7LOGjK+TqTxQk
         WPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786874919; x=1787479719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A3guaqxr7NyyvixOm12MKeegXbSzy/kPgiJ95xUExEc=;
        b=UnKmZhrVNOunxgyxgo6QDRByfXL7ifpDyafwvFstY8L+hOZ+blYe5rOsHIOSabtBFO
         FjooCAhkdW57fQcWq+ntHs4cbbpx1QySgrmp9QQyZ31er+E783nVIg0o9Iqb15raUhRv
         Ka+r0zyHVnAqaI9LXJY25tsNXau2hnjec4/ifwcBGBeYqFF92EOFpdRTkZpY/YBGWqFs
         hMksvu/GRUWqYVYKmz18zLlkQws7pWEx2G3o8IJGh7qHQC+4lIysZC1ore6DGBnbNTUh
         xMfHPGHHJlVuVxIsjWEVTlIA6oOv2VA1KlH6gmkIIDheEkZTU3RijKh7Su0UFKTJTgdo
         8Ztg==
X-Forwarded-Encrypted: i=1; AHgh+RplUK2+Sam0mR8B1dmZwp2n2N2NsmhCt7wi9pH/LAgVrUfChhkkWvssGv4JwF6CbGe4N2tSQle5M6ydBk/SIez+xNux@vger.kernel.org
X-Gm-Message-State: AOJu0Yz84t6Sno9tMizKmx9VWeaaBGa7XodPjhvvMTE4W3cHTzzL+nUm
	i8k0ZQZv2aj3eMQq/+P65UvAwtANKrvFTB70loJ65VVbcWwMLwcIyY7A
X-Gm-Gg: AR+sD10aRXElb5S3nH/Q1szrEORaIOMZ/yb/mOS6wPIixYTvbdUs85hEQHHYwBTyOSe
	Rdb+UE42Bcz/YTqmQU/9xYyfR62HVIbuTiKxxPlX8sOU+C9QZv7FiNAaXWyK6MBubpUxWx3/YPD
	B8zsgvT6QmL2wn7DZZ6ezdsp1Y4+Ctl8AkFrfzmZUxFKBtdBrLf8Od6t+OyoqRf20sKMMIwXdst
	BVFyQR1bovy1Z/kfpJXigzbsfqljpg/XFuYum0W0g10wdji86l06kSVy8RZTQ/LBc4F24xqHguB
	m2OmjvSi0IJPb0uNtGGp952vDn4SZIfAszQfM7qKPEIOharhWT+RNISJ416dHINn07ggPVrwps3
	pJ+f8L8dg7y6mi10oqwWDqeDOl8+tc6mMcqsLShU4oc0Izetfb3RozJp3b7SVZ4fPqJKW1ogVy9
	EnfS6r+eZLUgQVuxwFzQa96S8Nasi7sYsiK44=
X-Received: by 2002:a05:6a00:1902:b0:848:7552:3d86 with SMTP id d2e1a72fcca58-84fde1fb61bmr16755397b3a.23.1786874918925;
        Sun, 16 Aug 2026 03:08:38 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01f15dsm1759601b3a.20.2026.08.16.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 03:08:38 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com,
	rahulbheda131313@gmail.com
Subject: [PATCH v5 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Sun, 16 Aug 2026 18:08:08 +0800
Message-ID: <20260816100813.300450-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816100813.300450-1-qby140326@gmail.com>
References: <20260816100813.300450-1-qby140326@gmail.com>
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
index f37a81950e25..af86b1df1a94 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22774,6 +22774,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Gladyshev Ilya <foxido@foxido.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.55.0

