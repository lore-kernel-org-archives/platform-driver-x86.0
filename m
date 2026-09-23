Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068BA46E01C
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 08:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152204; cv=none; b=o6198t8aL9ONa7ZA/Zd3Kk8pr8lm5r3DAgNgOY1QwKHu4s46aiMkeaLuba+MR2SyFkz7cwD1sJzqD0rKef5EeUGuYBTbA1QVkX02oOfckHy4vZxdB1XhfS8lG7UzxOcZbYwwD48rl0uIbUHlC0a89sqHbDmv9nM9HQ37JDA6U9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152204; c=relaxed/simple;
	bh=KWVFcR8axhKHBUEznO09Np4NmCs9jEUEVgGXBR1vWJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hr0fPwvb+4rclt4KwS4+4SFFcPrBCLD14+RLbvucf/6rxO5qPHV3VxxsH+wqRoTtZb+MU9aJC5l+fv+SwB7ixJJ15JF/cz8wsP6CvrSML+tFqyEkOJExzDNoyWacb/FlrXmuH/tUx+KT6A2R7TqJuce9M8xQv3K7iF1cNt6OKPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJthJzRp; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJthJzRp"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso398881a91.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790152199; x=1790756999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWVFcR8axhKHBUEznO09Np4NmCs9jEUEVgGXBR1vWJM=;
        b=HJthJzRpgb8kctdVoMy42oxRTnEvxrHzUkm1mzLloMN5TjM5B6Oy7Ttjnv+xB242uA
         aW3iNk/7kmsKAaQeOxxoBC8EDuRrNKhWoqXdWkHqz4IAzoDpBXFiPYU2rrGNhQv6eRNi
         2zAWZmAs4zRYI0AAf8lvdKdifeSdvHNzvMuBIyO3UBN0zED/Pc9i4MusXev0Cfga0g+w
         ADUJLMpj+5NlIrofzXAQj2Zr8UT3mhECJA0wNHEC/ihmR9w3g379HIiI+6oMvgYPINt9
         Zcg8hFph2h51zBT80rpUtoln23FO43fmkuGq/ddJjw68goGyyiCSXF8LV3M3Fqdz4YPI
         zUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152199; x=1790756999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KWVFcR8axhKHBUEznO09Np4NmCs9jEUEVgGXBR1vWJM=;
        b=J4QNh35EUcQlhnYvojE6dKzHUSyu4SCstZ5OuvEoTehxDiuR4tTjfOcyaCjB9qb9Jn
         XeWMLdaAzdxCUGj4JAf+BuDB8xqG7W+TAR/dFRcyOe3Ab+Fg/gEviFZgw5c9xrNBoLDM
         +ln/GccefsGLK22kfhSo3tNi9yhO/GWszpOYtANtwe/hNiG4nxSAu0irW6MvqDVxvzoH
         j82Wm7H11RG+fxj2HLvq1aG3w81OUSMypsl7MA9S3foVI8hV2SnNCMbjPnPkBjPcFKAg
         5MpfuEL8Y5LWn7uTY+qIeIU9VGYa2w6rKxl0wSdPhkmJgQVTEt01ADjLNyA9epwq5j57
         l0lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsP/kFSTosWUNk2vZvc8MHD61GrWg4ltm4K7ibyHLOdkev1yxgoec4VrGK+jZraDMz9h6BxZSPqRcFGSrW9mo2spE8@vger.kernel.org
X-Gm-Message-State: AFuF++mX4ikZ3BKAw1zwlVCYlRytsw0num8kP9hqCpssdEkdCKlq6D7D
	/rEy5i2GBNaWpTrF0dx8z1bMX38skPuyDNg95ChfCMCx1z3NNuwjYzmM
X-Gm-Gg: AYBFou3IHeqCUwayEqAH/HE60r7Qac+IMiMZuNITwJpjWPD+NbuYByuLK7UEZPo2FgV
	rWrPezd7PZXDXrc9qQLIhApoYKRc+JrdX2dC/DcpN1TnP0aKLkEpfqjoiBaWEGD9npnLluU3pD9
	hmdyObpVu17CoqDKbopMGFOTNUjhIwZTcfC4QRnq7CRfFAzdYWNv51zDuwKowGl9NXZsS7FtS7+
	Dw+1A6DJt4zPhNeNEUjXTYuidgE6ZPKnwa4GgqDm0m6qxy4UOLz2n6SfzgQ0s1Rg4ubED22XBJr
	wpFtrxYwnq3QgEil7GlMmfEr/665DgeBmSbdwXL5G1vp6C3z/gqPmaqAxmedEjBLxZBy9OKjo1z
	ntBUnMX7n4xJLqf19gYXUPiEBK6ksOAs05Pp+Lr3RBzw0ui6TJmcF2inQFeHJcznE5v69ct7REW
	t77MFt4/XCoOHemxDskXiuTVZCdVhjO0MloGlsgoBnjOOzszGLjwHI5ey7x6mVTp5SsSL3+DqYz
	8fsFlbKNBtuUJ4f41kB+KkPu1jhv+8HIqI=
X-Received: by 2002:a17:90a:fc4b:b0:39e:6a81:c91f with SMTP id 98e67ed59e1d1-3a07e640fc0mr1490714a91.18.1790152199191;
        Wed, 23 Sep 2026 01:29:59 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc01df8sm3706355a91.10.2026.09.23.01.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:29:58 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	scardracs@disroot.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/wmi: Move ASUS platform drivers from x86 to wmi/asus
Date: Wed, 23 Sep 2026 16:29:23 +0800
Message-ID: <20260923082923.154732-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <202609221954.123456@gmx.de>
References: <202609221954.123456@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Armin, Hans, and all,

Thank you for the feedback, Armin!

I completely agree that separating WMI core infrastructure from WMI client
drivers makes logical sense. The reason v3 relocated the drivers to
drivers/platform/wmi/asus/ was based on Hans's earlier suggestion to use the
WMI subsystem hierarchy. However, Armin's point about keeping client drivers in
a brand-specific directory like drivers/platform/asus/ also provides a very
clean, cross-architecture solution for all ASUS platform drivers.

Regarding the background: yes, the RTX Spark is indeed our target platform.
ASUS plans to provide user-space applications on Ubuntu to control platform
features via the WMI interface. During our bring-up on ARM64, we found that no
ASUS WMI modules were currently available for this architecture due to the
existing x86 Kconfig restriction. This patch series aims to enable
cross-architecture WMI support to address this gap.

I am happy to go with either path (wmi/asus/ vs. platform/asus/). Hans, Armin,
what would be the preferred target directory before I prepare [PATCH v4]?

Best regards,
Chipang Kao
