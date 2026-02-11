Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCE81C01
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813025; cv=none; b=baqRJ9+2fCbgj8Q38wHJKp8ITgMydYkTOdDvrwQU0dLdYzC3mst1M9LbpN8mQxq6bW0NsUEFDo3rwmw9uXAV4oXVKAIqehZ+GZVuLBLqTPIF6oMrYiVdKV9GTP5HNRWQdH9wJUx4Gp4vUgH92YMkXjubCPWugNsom6PiYJncDyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813025; c=relaxed/simple;
	bh=u6PDWNUZJfyPGeEgu+/+dqpCMhP69axS1zEdXbPaDuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FFU412hQDEOiC32EMDZRIraEYRE7Di+VJxYbcU5SfoZ+YuG/yo9t2uwFTawsKYFFLGCqJ180xT25pj+/FKcJw1Akesrh/SoUMwyJfcCeolHhGdYEzWh5txvLzb7UJI/yyMnt6KSdoMt11VvqC57ekE8yLVafEisrKT9DmnF4GEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6tdITy7; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6tdITy7"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-823f9f81da5so3664333b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 04:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770813024; x=1771417824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6PDWNUZJfyPGeEgu+/+dqpCMhP69axS1zEdXbPaDuU=;
        b=M6tdITy7Nknpg8pwj1D5Q4hCApkNnWEtMAl5gFeWyGIriIqDKOn4D38ja/YbfKMdna
         ghsUGDV2L8aSzvrVtstwos8N6OH0kSOO1O7DBQAPPpY9DCX+BrnK+7RNbVbcln++PC4b
         ih8TIobW576J7xXXYyTHutcq5dv+hdQtKylPprceepWm3Vy9jaDmIYoAxsbl2ShsqIs/
         X9/KZ1qfxlBiWEzytfjgHnZPKHykakwTMGyQJdVpSLclIDU2ckdB5bYLSiI2ZS9ZPzMs
         ndlanDmUD7v77BKqDQmfJer3wC/0A3V5Yr1cDAolkAIsLLqpDo60VvWhT/2Xl+B7rtpw
         AXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770813024; x=1771417824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u6PDWNUZJfyPGeEgu+/+dqpCMhP69axS1zEdXbPaDuU=;
        b=ax+R+iB25erG5GNtw2WH+xtjIgh5gZCgL1UhSKwCQISFC6ZYhXVT1tuY68tJmaAiAd
         pUWQSfGoadUH+lVX30wnd7mpncGiecJOpCU8fhnmtNOkkLidXr/MyU5gRNR9etfCSGmS
         bFRLjJCYO1vTHMHysYTMKmoGHUy5/+Oc/Jggfp/WzRjW3+/DclExTYmkQgfkRkU0jwlg
         atPQ/TXdxDeFJJwiOsOsg8mcVXYEO99ePazPmD/NsWKfjQxBhIWN9EWqHYPmdcfYCULm
         fLAllpk4j5De2t7z5UmsaYUV+MaF9h6T3QPlJUOzgqG+HaFFgXxWPlhLNkrAkCNx2xug
         9WGA==
X-Forwarded-Encrypted: i=1; AJvYcCVwmMzZrA6J0hpjLp/rQb3iSjXRa9VRl0NRAqjzaWcE6t41//B5HQVUYJuYKH6OHgDrWRrZEi3CRQ7je0dNpelCMgz9@vger.kernel.org
X-Gm-Message-State: AOJu0YxdT1p39yNB/HyGTcLmHNMe1VStMEjYbjzgEHicSn5axZ+MC4LZ
	IV9I/8ebyC7STQRXaFJqDaVBn5KHNAWOcT/P7PETmJUookRyvZj/k7o=
X-Gm-Gg: AZuq6aJw8NE5b6IN7GRCbGE5Q6jmeYdOBf6/+B07fJYU64b3AsumiAZf6Q6IPZ45deM
	SG6FTpaABmCgbsN/vCrGQ5YiCaAO7TlH2aIfLq+Uscziy0Js83f6J+nyQiPAOsIdPVldSecLwzL
	Ds2fMRKN4mAzZjOT4CuPgCPJc/0FOuMoZQ5JKs2yGKnHZ7Rg36+ad5n59EmEQGh3ghES92cjq9b
	42K+fTjv04fc3XypM6t9HZWhhTI9CeTHskRPWLnXALNRgJWDGzXr3QLIJzSnC4/uHiwa6U/MGyT
	/giFDAfd1QlIYxHNf1dSTWVs3WL4cNaQ06T96dFsCjpPfplCWd3x/KSd1+n1WcPewWog8yY/dJ2
	mK19NxDk2g3iJ4VqHyO58SiQJ1AnCK1knfDgPG0UfzBuw653sMKBac885vkYE/SZsnXOLZV5l51
	0uKh1KzEfCd7AQ9wPkisWP8Egj/h4pSNoJdHMZliI=
X-Received: by 2002:a05:6a00:10d1:b0:821:80d7:2ef6 with SMTP id d2e1a72fcca58-82487a96730mr6271427b3a.42.1770813023892;
        Wed, 11 Feb 2026 04:30:23 -0800 (PST)
Received: from at-iMac.. ([2401:4900:8fee:b355:955a:194f:87e2:8df8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e366a98sm2484774b3a.3.2026.02.11.04.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:30:23 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: hansg@kernel.org
Cc: atharvatiwarilinuxdev@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Date: Wed, 11 Feb 2026 18:00:18 +0530
Message-ID: <20260211123018.4910-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <44e9e403-55f6-4601-9ba5-991619d09d88@kernel.org>
References: <44e9e403-55f6-4601-9ba5-991619d09d88@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> I think this is missing efivar_lock() + unlock() calls ?

actually, efivar_set_variable already holds the lock, so efivar_lock isint
required.

See: drivers/firmware/efi/vars.c:242 and drivers/firmware/efi/vars.c:184
