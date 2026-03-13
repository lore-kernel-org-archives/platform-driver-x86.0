Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD31A683D
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 19:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773430806; cv=none; b=lPrzUDPXVukuGObVHAoeueLWrYz2i1ZYGnCVjyXL1go1HzgilHT0eoamoksaYB3spbwxm+JRkY2kvqMaamypL89GmNi0a3n9EpMwLpp3jooEBwlf/pOZ56m6RCpBa85BqrTBsTPBSZSL9FyHIrSzR+5D+iYKY2o8Z6LRIhpuJIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773430806; c=relaxed/simple;
	bh=X4VxjEIWH78MtyhSZXqTaDqGtmDattYz9tNK8YYO76Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bu+kjt6ggbB9bK/9+QlDWKMlZnkLHdD+AoyAMC34mVgDkgM2Hqlj6sJftR9JLtIePfoosycjDqNmuYaCyxRvbFxQXalKELT8vLV9qj4qQ8DrG/oMs/tKXXbWbuh75nrj6o5p/BI3BLuLttz09EK5V38sVflivCJVahYcortW6W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wzrln8o8; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wzrln8o8"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c73a12af63cso1536969a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 12:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773430802; x=1774035602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X4VxjEIWH78MtyhSZXqTaDqGtmDattYz9tNK8YYO76Q=;
        b=Wzrln8o8V+6B44/Un7EfcubqGxv1/zJ3BuLLoZdqKZesbsstkttD2NbOk6wb3thXg/
         Z8St9EwT+z6Xlzmw2H4SyWXifqmS/8R361mCQy5z44q7AUQPIzStVmdTsVuPiV856xHX
         PdabnFAYKRgHWf1WTQm1+8jX3QIUvzqK5EPAsM97NOv/Srj+P+Zf+KXfxSFIizxa2U4D
         eH2By6yEUQd3pORlF2addnadjivTSbqzjm1euhuJxGRGerK33eKSAkRF5NIQ3DvYRkbQ
         iRB+gl4vrd0RwYgf2iQ5c4s7q8wgVbqwJMWhKcXRlTpZfBwDluTTZsAjeg599TB49zXI
         PjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773430802; x=1774035602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X4VxjEIWH78MtyhSZXqTaDqGtmDattYz9tNK8YYO76Q=;
        b=Od9gsJBRNBmWGda5oACkTX3K/ajDBC7BokUKAW/4+3++FEyVvrUr5omTd1nOykliP6
         8aq0QneUcKDfmZLclQBZHwF+c+zP5swNeK+I6t3dBSVULMF7T0FgbMJtQdfdixX4g44F
         E+3uI/APcTUGk4JDu9ojswRC4ZnR6zyiYGFoz7xTzyN0vqXm2zA6+k+iMKKLCIxDRIiH
         WbV1T947Bp4pCO5tjqPAeZF3PnmMwEFyQCDyeej2swm0nLxHJdMAtVN4H1gDGTFXXprx
         Je6JPpnritA5cWZKQ2jsJpOloZA4Qstl8uAd5wNBJaGa5NKIf6EzcqVkj7QHyNmjE5YW
         O+1g==
X-Forwarded-Encrypted: i=1; AJvYcCUly/vxSy8gxCM9+COiUm1b6auyxD6yiX+oF7bFD8zMd4oL7m0zDNNAUKLMn0ZJRzzpkDEqCFUFnefCPIwlX2SIS+xm@vger.kernel.org
X-Gm-Message-State: AOJu0YzqSOOBXalbCU/eskoQvv/mN8Cb4lVrnjt2S/KZrPmKG68Sjr6d
	91BIZqCu0O3xU6gr5EHdyP53xvfedCqMf+DYLCrcNhXkyRf/9P+Yd68=
X-Gm-Gg: ATEYQzzWZOAReiAN6jNSXn46NLIm5A9ndEl0E4aSj0HUuWXu0m5MRssUNzrK52Sv0b/
	SNeYnvKEV4csWW/Fw38dm9fEXKJd63wQ+BwysmrnKmWJURgJlLyy64n/XiOac0auzfaJXEHGPS9
	5EnENv9iS8riPWzWqnthDdGCEkfaqdNQorkgPeObI3o4OIUiFTD0cai26tFBvNMFj1p8xnceHdQ
	yADQ5h/g7WkhUwzwyYG17H4esAEYdYmADoI2D9u7OpYEZpzkmVNJCPSSDBfa/WVaF4w0z9Fji3d
	zf4sDBZd0lQEiTZb5dMgSWNblR7fRFJ3O25JEHT74imwsAguIlR2bZw3BTbjT0EtTJxk/8920N1
	EF1WbLvjQiJuLznSmBjBHXmVE/P7Gmt7Edqu7iZfXxHdc7CKrR1rzK2gI7bdsmT428U4qApq9lh
	dvldjpoiIPF9yho62HJW3enW/d9qn942+qSmAm4FMH/dd8UF2H67UbqYmGfdV6OQs=
X-Received: by 2002:a17:902:d484:b0:2ae:d427:d3ff with SMTP id d9443c01a7336-2aed427d732mr24698955ad.36.1773430801911;
        Fri, 13 Mar 2026 12:40:01 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.161.137])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62c733sm40303325ad.35.2026.03.13.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 12:40:01 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: hansg@kernel.org
Cc: atharvatiwarilinuxdev@gmail.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Date: Sat, 14 Mar 2026 01:09:56 +0530
Message-ID: <20260313193956.1375-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4ba400f8-34a1-4f00-a500-2775a09391b4@kernel.org>
References: <4ba400f8-34a1-4f00-a500-2775a09391b4@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Sorry to disturb, but its been 1 month since the patch,
and it is still not applied. can you please apply it.
