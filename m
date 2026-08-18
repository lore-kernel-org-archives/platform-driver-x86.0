Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F494028D9
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 08:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041791; cv=none; b=aPpwRgtZyVZRX6Yizw9o6mauqYX3h1r7PT2ihWs7jnjulySaLjOQdV92sta7W3pFJ6HQz6+Qd6SU4P61xNYylaqlCC3sEJclbLTncqlQTPSPi6VNukRS0LigX6kvFm3BRQUs6slMAZMkcqaoLjdfWs/Lx3rL8vjcNo6Q5TAi6WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041791; c=relaxed/simple;
	bh=b1j8d02SnXPqzPZjvTHQcLZm1J8zA5HnNmDqjFQQ5Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k9QIiRIXa5rWFztt7LPdk061SMHjj3jS8EQk567whyqcxPc5As4ah4Tjz7bTC5eLyAEYEn84nUo77CMXhi9qQJO8tgj+SQCJ7w/NJbmtOPxXyWI/IJSmksoXkHJfKFA8HE+JV4FrkzCF1GBrGkta2HGNRa9bOBRKBMbLd1iHjk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXsQbMYQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXsQbMYQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d58efc7356so23692805ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787041789; x=1787646589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=akMTcbcYeBU31aVMacIUPTcUA5VWizsZ0RTahsbm5BQ=;
        b=WXsQbMYQkhBPnCEeYcHgSotdtAqSO1qv+RFaAaKX9QT4gVcxDN3W3be7uDewYvnaZO
         8FvtaBhkt+Bi8fU5q6B1qEb962YgLLHl1VvLN33Wgzwfz9vYo+Vdd8EfKzWtjbPoV6EU
         XxZGY3qxjIv2ngquviijG7wZ6vVWlb4RUWZkIUW/urWJC2LUrcxlZMclS5HscwtWkZfz
         SkRNUVDYtS2Z2xzqefe9AbCP4+SOxaB9FzZTTYu6mPu5hkuFYJq8XpN0D/SNPzY5MLPc
         pFMZq5ChLEEIGo3rVmGq5NwsUBCz739c+3r14pAUkrRf2UNkjyCyExEcNHaz5E7UAtBY
         YHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041789; x=1787646589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akMTcbcYeBU31aVMacIUPTcUA5VWizsZ0RTahsbm5BQ=;
        b=Z+UuHC2TzgEcESthiWcv/soPXdm1ddOcsv8znJ32SWbvNHosK0Bfghcvilwix/lC7e
         ebHlHXRzG7em/UX3PJaHCaxNi/g06U3AWGayHGqKQxtYOlwGK6eEy7DLR0pZZR18tHIL
         hsVSgNYYRjSPO+ABqMIyiVL7INGbvAifMBWsHHJHDloXHWtHfjUCiBbVP3Z5z/tOhDmv
         5eSDyWpIfQ73eJT2FSRSku8syg15WBIb+RxECF1LBx96O/WoBMnZLp5J5uy9rLzEOC6s
         Qo0OHGAr4CENWCRakH1vIZerJoNNSHVQFd9Qml91lueGU7OwcuZDQz62WkeLRUp6AYTf
         /QFw==
X-Gm-Message-State: AOJu0Yy/A/bNSFlc77HkzuhSS5lBgbWngstkbe4gzdd8m4Jl4El2p/Pd
	lo1Yow0YgY/HJkPjQoVXchxRyIiHqPUci6Eiy6j+XjnYm+9n6DFcMS9J
X-Gm-Gg: AR+sD13esqNlruyt+rgXqTtbeUXbpv7QDsuVbNElnAjW38nwtneVeYCk+uGCdqw+056
	k+zIdPXHXYQ66csM7/woMVXHhBqKKSrhFLqHmQ+zo0a3LuWvdGsKfXCKUSKrriZn+UOeyu/PrYY
	OhWJpKG4/xJQcJptJmRtqnxlPaEII40aGs3HNdl3o7dUHtlnX0SOpcfuR6LyCfht4z/1vS6YvZ1
	qcQb+TSNXg6rGkh8zK0soXOY4vF//j9cmkRPGBvni3//NFI5CodPh8i33mAVbgzg1VhKL8CDmAS
	AHML7Zth0jv/cMu3Qu6FZ7Y5elJLbr/bKeLDWZO5ntvWOeKreETKzc0AJfyD0ypkOfRQwCLgetM
	l7iYpqWTuUTTkiNRA6eB0vfYxVGPiyeL/HYAlQn7nonF9stMjbiUhdYnE2GQmlny+WYaab9nUjc
	a5dGTiaBCVqzGI5hKAPpcDh8rhl54B4iJSDUEwWyIrNDgdtYxHsmEK++KkjSV22CUEsqzY2y1D9
	X3AJHJZhBHnEcAQq7OCWSwHP4C5tToUcQ==
X-Received: by 2002:a17:903:384c:b0:2ce:7563:70a5 with SMTP id d9443c01a7336-2d3b0d1254emr375377765ad.6.1787041789361;
        Tue, 18 Aug 2026 01:29:49 -0700 (PDT)
Received: from archlinux ([223.228.161.145])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267c490ee9sm15680979eec.25.2026.08.18.01.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:29:48 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8A43 thermal profile support
Date: Tue, 18 Aug 2026 13:59:25 +0530
Message-ID: <20260818082925.14854-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN 16-n0xxx AMD (board ID: 8A43) supports the existing
OMEN thermal profile handling.

Add the DMI board name to omen_thermal_profile_boards[] so that
the existing thermal profile support is enabled for this board.

This enables the existing fan control and platform profile
handling for 8A43.

The board has been reported as working with this configuration
in OmenCtl.

Link: https://github.com/yunusemreyl/OmenCtl/commit/39d03b62028555d3014085f0d9cb3eb57a501871

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 49321d7feb93..5551f8134cdb 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -207,7 +207,7 @@ static const char * const omen_thermal_profile_boards[] = {
 	"886B", "886C", "88C8", "88CB", "88D1", "88D2", "88F4", "88F5", "88F6",
 	"88F7", "88FD", "88FE", "88FF",
 	"8900", "8901", "8902", "8912", "8917", "8918", "8949", "894A", "89EB",
-	"8A15", "8A42",
+	"8A15", "8A42", "8A43",
 	"8BAD",
 	"8C58",
 	"8E41",
-- 
2.55.0

