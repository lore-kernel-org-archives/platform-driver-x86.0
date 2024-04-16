Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D46812C81A
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 21:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713303303; cv=none; b=QAC4U3F9reB2idK9yq73bM7JrFuAGo4B9N4Tkh9pPsBrV1dcUpaAuNtMR/fqQLa6lAG4D87trxqM9HB25YW/81JBpGOUm6i8Jrl214g1oGXTilTwSHk6WNq04tGRGq7spqjX7cOCuf5aXuQN1qJ9yqSTGMDoL55+li9S3z4PcQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713303303; c=relaxed/simple;
	bh=AbGUTIr93cIZBICMTdcgi4m66F6R94LZwRvkAx0ybN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=EuwmpCbsizFtwpdsnTdT131zBPamiyrdHEgNU8Im/4tNdqzacM9z3GTPygMA91b2l4JsMhrUSY2CxpChWrPm2d5po8sLoJ7emuLG2shzA8KC/NSZYr2VHVxkLlIyWcJ54YyFn5nexBodnRmHR+VnwIQ8uMThwd/L7X1oykahOvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=X3BX3xxB; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="X3BX3xxB"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4376157292fso2047541cf.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Apr 2024 14:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1713303300; x=1713908100; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AbGUTIr93cIZBICMTdcgi4m66F6R94LZwRvkAx0ybN4=;
        b=X3BX3xxBdfZyLm2Y7uCzFrunCUEdaIQJYFUNYrgsuZV0URPn8HN6hGiaZZ6r1oJT0u
         Utge9fWhUY4s7yOVYneuf4Fz14j0ZcE/RLTuDzu/jVRRzodKavKPDEhEH6au4d1sDovN
         t98mjnzqZWWanHx2WCgd4uHfGskwTtsEPatls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713303300; x=1713908100;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbGUTIr93cIZBICMTdcgi4m66F6R94LZwRvkAx0ybN4=;
        b=H1rbrqLCYJSiDnDFnF2H98IZncAw7H6PQ4bSJQjSZJXwvV+UDGmIt5y4EUBQgOzXMV
         AMhvkxaZ0UgQSCGd7xqffIUWWGUNUcCPNhOVnXdavv7yEXkgiQ5uRuXq/bzJSjQn2PQV
         IPc5B7qpg3nV/RH+3yBM4KeCrG26ot/CidcnvpiqveaKKQbKtZjxKrcIEDYiyfcsaf35
         3uyynDlhXPsK4/wrjE3gxtsaz3jyEyqs0Zv/0Le34AtuP4RM83M3S17ks+Ie3xdzhezC
         VLtoymVJfsHgLJh1Tc/TntMP00VW5MR28wSsyH0o/hqVXP8n4eF73ng6GBmCkdkiNAtu
         2bgg==
X-Forwarded-Encrypted: i=1; AJvYcCWPwNVw/2pVY6EVohN0Jc9TehqIoGGHNRsRqWu9jx2R/jWpYLCASbDJzCDEIKL4B/RBaldbgEstt62aPM6JPKBtIJFaW2mg+z2I3AZgM+5YLXGLow==
X-Gm-Message-State: AOJu0YwgPilfIpkn85AvZmmNRVBGn3CqFxFY+6YKTIoTMIG4OsLjN1j6
	6rTe7D49iMFMLfgo+SMgF0btsjyO53frFcTgf9TJ9nL3Roxr/nGiVWRy57VY7H8=
X-Google-Smtp-Source: AGHT+IHDjh9+d1ObR8Ij8WEXEfjPgBM7QNiW7UwML0UelHwkd95ejcMfHejXGyIypHi5JcRJDdmBKQ==
X-Received: by 2002:a05:622a:40c:b0:434:8f14:d24 with SMTP id n12-20020a05622a040c00b004348f140d24mr19186828qtx.62.1713303300063;
        Tue, 16 Apr 2024 14:35:00 -0700 (PDT)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id s11-20020ac8528b000000b0043476c7f668sm7566740qtn.5.2024.04.16.14.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:34:59 -0700 (PDT)
From: Ivor Wanders <ivor@iwanders.net>
To: luzmaximilian@gmail.com
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	ivor@iwanders.net,
	jdelvare@suse.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: surface_temp: Add support for sensor names
Date: Tue, 16 Apr 2024 17:34:56 -0400
Message-Id: <20240416213456.3214-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <97d0f68f-63da-4f72-ae8d-89fbf9aadf62@gmail.com>
References: <97d0f68f-63da-4f72-ae8d-89fbf9aadf62@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

> Ivor reverse-engineered the interface calls to get the sensor
> names and wrote the vast majority of this patch (I only changed some
> smaller things and gave advice, hence the co-developed-by). Therefore I
> wanted to give proper attribution to Ivor for his work and not squash it
> into a single patch.

By all means squash them in the next patch revision to make things simpler
to review, I don't think it's a large enough piece of work to worry too
much about attribution if it makes review more difficult.

~Ivor
