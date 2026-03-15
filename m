Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2E437A496
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 22:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773612325; cv=none; b=RG9qffZo+AMHnyd6o/IXypW1hDeEDJId/vsJJaVcjM2wmK78SLsr2nA1h+D0EBrrDYvxvVDjd1Dzi1DtaueKGWGYA6Qleiv32U3D7hiqRFvHIVtsW8JQ8o4gtL3muCjJd+WN8CJJTSvNdlut+nxm2zfy2r+L6C918aI6VzG0E54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773612325; c=relaxed/simple;
	bh=bZBxfwA1NimkSQAq/y3aPsbEAC8/epBcrQVOr03tp7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a7EwYpeMEOQSL7zxd3NTMSDgrQR+fQ7uUl8AEAbZDahyhTa3PLNcj3W5C2ijgRqFvwqDVcggPri46YLXjUH2JFs3UqQpVojIimRw//T440NKGiWCNi2yLrByA5J6HqYNN4GbMb2yUD8Nj1vJBfQimAeO0pa9g+3ccy6BNGDS1xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJy7juCK; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJy7juCK"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8298fad2063so2248395b3a.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Mar 2026 15:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773612324; x=1774217124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yk7DOTVH/vkA/ojA43lMfr5wsv3F5j0GGAtjwoxCDsE=;
        b=IJy7juCKUmq21fCfRd9XbV7B4BCqKBTrogIOj574QYQuqeM4XO5oBNav9/ksAmkLNZ
         kDnuVTkHrJVUrCi0Ro+icb6vm565p8l8FCI1U7i//Cb7sgyYMWl6KzxQtB0od8c3Topz
         dsxANKEFFwMJ6YcU4pNqgLaikaj16asWVnUWRahORH9LmJGjPLKEKeb9xUagYYDaDo55
         TKRWbmpNUFkaWsOEyUBRpX4H0M2s3GV17/OhaEY1Gu6i9afxPQCjADeoe3FKNKfpULqe
         sJV1slv0iHB+hHtDN6cCOofyRsNhEvrKDum7uT2xhgmHvqO7dEmKQW8pZFv3vC4kRVkM
         YwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773612324; x=1774217124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yk7DOTVH/vkA/ojA43lMfr5wsv3F5j0GGAtjwoxCDsE=;
        b=MW/PWtWA4SIon59HsPM+70BCfIBL5NvG0fx3uFvlAg+0Wm6naBoDr/lalSpoedaQ2m
         1hCHI/GRzUwWNVfZX904kzd77GUsCcOjHJnWekV6Hkewse3scRiFoGHyiGKQuPxNMZtz
         K4nlYbGrujPbIU8Ynwr3BEChjD1XcrznrZWXDGLP9PhQlO7cWLiYv+LryLo3/IFTHUNN
         5aDqVCaBDyM3om9WgAZ+oyFZdaxOz4vjD+P9Kg8atdjXgfYF4pBvMJJiEpSq28lBRhSl
         fiH50GU02+QqCeQlycrw/bNgDYNt4lXVdmgzjy1GM1z5DuDH+qoAx7WI6zwjpdOrRnBQ
         ShXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3LARJ+peay9uMJgnv8KnNqsK13zyEbMOs3J4Z3CPSPAZrv3X9UafVU8J49hAVZzs1th9pjJWNesLZxnSHVWtPngmV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Hyqsbsd6XPbRGRMpbHvz6n6bFLcDQw51kx/lUKAxP9U5EOsz
	qINfFy0/BxlqduZauT28GjwUbRzz6vCdCdTLZTm/dm0IPyWJDVhmTGK9N5zk
X-Gm-Gg: ATEYQzyJKrVyQiP3YVUMilXYcTk8kbhCMBNHwONug5E1LudFS2gaXi3sgODyIYQTR9g
	1Tl3S3xxVxxnhVkQaTipTCDt22NVYekLvnuLBaIQSby3HprNT1HfRuvSxaU6fMGv3mCBOLMPOQ2
	OAW4aEAJj7E7XCcpkPxm0hErkMPB709GnwCaMxGx5XhdsIqNbC+HRMZzaUcXUFkF3JF0Kdc3S+1
	nOQXQMfbfmoNovCV5LukBeyxNKF/fVztI8JvANuLY45/OW7/23gz3wRiRcjRlFrufkPe6WAJfK/
	C4acvH1vv94CNa5nMNmO9RKixlRPxnI1eKBXdaPqKOppRo2UEU+QxdVmZXthrWCLvAD6oxsWmrU
	hhNnk+74KsC3dTnu++Nw7mdJom0H77JsVODOW1YTMAE+I0rFLO9/W+nes1065950uQDal4d/B2d
	214h2tcf232ou7JRd7z5/0krqGy7Xn/q99hd48HGMLI8IJa9aOv+EdEyj7yhY56+4=
X-Received: by 2002:a05:6a00:7482:b0:827:2b3f:f9c5 with SMTP id d2e1a72fcca58-82a1992567fmr7437517b3a.60.1773612323597;
        Sun, 15 Mar 2026 15:05:23 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0736590fsm11818838b3a.43.2026.03.15.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 15:05:23 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: lukas@wunner.de
Cc: atharvatiwarilinuxdev@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] apple-gmux: preserve brightness using EFI
Date: Mon, 16 Mar 2026 03:35:18 +0530
Message-ID: <20260315220518.24176-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <abbB8F9WE0kUUzrZ@wunner.de>
References: <abbB8F9WE0kUUzrZ@wunner.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> ... but /sys/class/backlight/gmux_backlight/brightness contains the
> value 110400 (0x1af40), which obviously exceeds USHRT_MAX.  So I'm not

How did this even happen?, AFIK the brightness value uses gmux_get_brightness
and that masks the value with 0xFFFF so this should be impossible?
