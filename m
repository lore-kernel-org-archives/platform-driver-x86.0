Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF0E3DDDBE
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 09:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673790; cv=none; b=R96JP6rC7lROFs7aTXl3JbrgrC0CQzQwXvsM6JgUxDEYikhxYwq38PrnAMBpP46UBkFUQdQVEZS6MyE4kBQNHcKdHd7rS+woJiSnjSnir8c6RnG24tGwhgt4Cwl4FRSqaXwv9GVz/ZnRp/ya4/+hhGxZx9NBbPlc3EJUzqgSWh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673790; c=relaxed/simple;
	bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4CQXvYcaJeGf1lGitxMZHBZMdWtMaG9yYYKpYUz+RR/DEKoAsLs7RTBljUV3C/5zpvN01mJmdagSdYLkDpXffNCp+MOe7bYnwsnJxdyR8SX3a4QE5ZwZPnB74Owo/WbQ21ifZL9sJNeMQOqfZs7S0SWNIR26uSMCk2YYbsTiVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Srj2A525; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Srj2A525"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e6ec4dd4so2996041e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 02:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790673779; x=1791278579; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
        b=Srj2A525OvevwTMHidJmtVDgHePcc17wpKwTu3gLwrb0ogJezUQQllSydx7z9+OkLK
         qlNt7iHCr6Jgbbx5wxUppI9iDnF2fskOU1exXyqmQg3P/y7EtA4+VTudflh1HqzmaPTl
         4YbWc08UwAFSWExy2EQzjv+79EDGG2MBWX8KAFseIK3QHT4/bwmxsLa4bQsxBZEj2Ez+
         Be3i9IOJN5f1LGWkqByA7lWOhRxh6waKXf1tMC2aiNBs2wOv0t4BUqq2dumdGP2ajxEB
         eoPN5DXT9nuKoGHrHlpGuelrA8b7nv/I2oV2s27eyMq4zGGhkuTYYsHirG8ws8Fx1/1b
         0gFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673779; x=1791278579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yvv4offk/A3nngbeY4OC0TNI33ABSFCQo9LNH+QTLbc=;
        b=xT6BB78PW+YUyWK3d4acDh6ZEhAl6rVU8ynOk3LBdSiExVRpgRpLwHKEHHfGx4ul8W
         2OGVDVlIC/GdQxwULpL2cFXu7KjuVQBd7IZQDWLWW7yi5W7q14sh5z+nssyhLbhclOHB
         yVtjyqmxONsrrLUf90oE+bd6E46zn6jRetdWdhMvXW+0kZV4LQyrDUf/CnaqTrMs109T
         kQzglz9jC8CQc/xV2H9K3O9dAMpRcNFuSXYN4Kg+69JzTX/DhmZMoj/WXLyrRtJaZTK2
         0X0Dwd1ohRbBvOlG85/tK40OyVFW1/QHr5KUqgo799sbuewkyj0Se4UQeB9x4jQm4TOK
         VcbQ==
X-Forwarded-Encrypted: i=1; AKwUvByi98eHfKcCm5R8YZBYDd7x68P/pBLz9CiumAyk5Xzt3F5DSkFQS+wNZ/KQXjEsbnIaEeUF5zTFP0ZQhX8qi6yA3B5T@vger.kernel.org
X-Gm-Message-State: AFq9FYLJwRaq2PMb7z/z+yW742E/S7mAR1rOn9oRNO8FhFyJqCXP4p83
	Cd4qoiskIEqqbmULgkLxeAzw7MO1Ikh6ZgFbKvn8X4Qhi2KNitkBKDSI76SYOYRpJu+wkljO
X-Gm-Gg: AYBFou3djvtNofdJVT9uD0tspO6tuYsarRc4/+sD6FD4sqmfhM18Hf1X9yInh0hoAgg
	bwp3+8vvqZhsLnmQz0KBPwHn5573/I0GO4+hovJYeX5m7k7JMpgNCy/lq9Un4Ue+V4iVghqGCHX
	vxOCCn9dKmAIVDYgEzess3wQJV1z0UB4+85CLy5azV+Uaas3Rf/1SKFN/3OnpinyVXzwty7zEUW
	Wxsb7jrpDbQPM5zGBfUpDc83Qkt1HKh2ydp6aDuGQ41WoWePhLPvqzKnV75pKvoTVwglVQfRtB+
	5HbfLT1l09Gio581EyBO1vKbQ/BuOaRPHM+Cw1m8FgELX0JZj9ayGigAsOr88QCYG/dyTr62imy
	pXtHNlY+Fm78KGY1GCGcUf2YNJ6bJ/dOOoQK7TzDLq3kCPWOaVzFkAMnIYtelBKtkWY1QFIDQ3L
	ecD5rsXqyqfglFBY5Q9sf4aYKG79VXRQlybdLkt7lTkmLqi6ZEiQPjBN1YHeUlBMkWkxPONCdTF
	jq8KNCNbtQ=
X-Received: by 2002:a05:6512:3096:b0:5b8:ef88:d56b with SMTP id 2adb3069b0e04-5b8ef88d614mr3358193e87.18.1790673778535;
        Tue, 29 Sep 2026 02:22:58 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826f9fbsm1262160e87.12.2026.09.29.02.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:22:58 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com
Cc: benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com,
	mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pm@petermarshall.ca,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: Re: [PATCH 4/4] media: staging/ipu7: Add monochrome pixel formats
Date: Tue, 29 Sep 2026 12:22:38 +0300
Message-ID: <20260929092238.1765758-1-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arY2CULvwXGyVvH_@kekkonen.localdomain>
References: <arY2CULvwXGyVvH_@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Fri, Sep 25, 2026 at 11:51:21AM +0300, Sakari Ailus wrote:
> Can you try doing this with the ipu6 driver instead? We're about to drop
> the ipu7 staging driver after some smallish number of kernel releases.

I wasn't aware the ipu6 driver had grown IPU7 support, my base was
7.3-rc5. Tested now on next-20260924 with the ipu6 driver and patches
1-3, the vd55g1 one reworked as you suggested: the sensor probes,
ipu-bridge connects both cameras, libcamera streams Y8 804x704 at 58 fps
from the VD55G1, and Y10 and Y10P stream with plain V4L2. So this patch
is not needed there; I'll drop it in v2.

Ruslan
