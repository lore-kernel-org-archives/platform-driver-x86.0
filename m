Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C3D51CF5E
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793101; cv=none; b=BagBxa9kzEseOewufrYPlTCihGGX9EJvAdBae081sZco8HXJQCiraWz7SOXBZOHoskzUHVo1GikFZDNzNy0bjyWp24k3fhiA+y8+0cBc+R7ey3tIFkur90sLB61NJxT+di65D0lRs5T+KLigC9RZMYMG/iF/Y85j528IBlTXPWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793101; c=relaxed/simple;
	bh=7gYzO9xANaW+GQ0pOVtXr+MstdzOHT2PWbr8BgiB2vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FxbT8mONWHjtENzuLlEn42BQrlTTLUOG4SKyYVutoa258wFg+BpeMzOOqY4R5+YpcMaiOIaj+M1M9kO0PAClwSYIwiLrhAv0jTfLPi1gtk+Ydx+QPTbPLf4BZDME2fbQJJVK6aDkffg8o3KeGfkYMgsZzA/OBZQt3EAs4Nzfd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ7ttFna; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ7ttFna"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so31238045e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 11:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793098; x=1791397898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNtRQU0kHw7yMy5S6NDAzNgYXNVQererbxMxfyyIy6M=;
        b=CZ7ttFna/inPfqqThTqsgy2uKMDdHNpTPIpauKllPX/KbCWzappzPq6bzEJHt+kDkR
         apVtLRIJ79tWJZF1HbgUyLc3hrj6mYx3LSMHd39KwWXcVckhL5aRkl5gvCWDidjW8wNX
         g6NaL1lZpOeER7AeAfVhJ6ADMXlztr8SSvAo48gukPZ0vlqsJaHTfMU9vPQtNwCF7H3U
         MPFw+N7jYFOk+sMvSLogT9xFkQJRXk+nVO16w19mfgDzigp0K9Cgmso6+Ov0la1dng6u
         QMWeZb2YC8gZ2SoBhCLyBSwlm9iN2M7qwqg16xlbyuihZto8uijBHci398ou+txoW8Ug
         eCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793098; x=1791397898;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNtRQU0kHw7yMy5S6NDAzNgYXNVQererbxMxfyyIy6M=;
        b=FBCo3l3Ql+2BN2M8cPtyhlI2JIdgrFIIroMCo4o/H9CWN0oxP6r2YI5jOWMUo16UCZ
         a4TOrwsu+z5SsOK22VLIH8sBK8xiPlbZMNmBXbPSXAzwqxOo8jhh0dlp3L/IIG/k66dX
         sAlmuW9dML9CnKcgSZ8Y2SV4sREmhjZqKjSbbN2yiZvvLSbCGYPMbAGqVoBimAwEX6TW
         4+P7hBW0oVvziHuztCzOaJo/j35Kgwkm2toZcNTCWfNQ3lG438sLHDuHqGY4IMtIsNpm
         b4e9KGGjoLPMYjXEZbiM59Jpz2sNrlsQdXB7IQvKFuX+4pJieaOaM4j5/zFzQvxbcaSS
         e8OA==
X-Forwarded-Encrypted: i=1; AKwUvBwXukKlDzuVdj/OEVIkHz7HWr3pJevMp3ZVUMkbp0Cr5rEpkP0YK2JTaTT+WPw10KmYEJPESHYj98grW+2cntQBXdC7@vger.kernel.org
X-Gm-Message-State: AFuF++mpOcOIt7nNK0x6pNP76OuUmHRUef2/zJ1MeWBASrBOHA1pB0RD
	lh4xltNvhBMbihmSd4iZ5alE5YwlqSds2K0ZltGGWu6KsnHKbobvovxM
X-Gm-Gg: AYBFou3l9FraYsRl0Ynat54MfIAYv4DxgCbhL5lPqSVK6IC0gvpEa4NHRzjyZ53vR3U
	QzO4ZB/YbFzGL2VH6XhcwJm7LWIZQdkOraI8Mb3Twi6BrIkojsVd14yA0Zl7T8uhI3KhO3eloqB
	k9P76HyeVXvZHqGxy1x1iOYzVfW/rIT7M4NV1Egldww5CgQ5fsDlSHLqWRcAB1yvW0ae78aip3f
	7y56wulhn5+zKKa5yRba2EikUyu8rZkhoi1fnvSjuH98qEjTDf3Ucq4kem3WISffTwHvOAEWtaO
	OMl7PaLqfR3qGN6gsQEp9rLyveP1R8LjDjpPWiDLritLp+hac5OyF9jkmOv0fI/H2tTZZ05+KM+
	ZgjtsJDII2BOzA+tH1Nhuebd4M6rVNcVxNDdJQmo5893pTpW6YVu6O01lsGDdeWWOht69iXXE9W
	fJ4V47a+F1QpKsWxFItNgXAoSeNttpSb+Swch4EmXsx3ZGwsiKhKG1Nzrvj5y2UL07TRRoq/q9h
	ImvtiGtyRiR0gxasF5cDjb6zNfHgwGU5RzBEoSw/mxgfnHVM/bWTiuskZafTgrUX1f8+a0MVQ==
X-Received: by 2002:a05:600d:82d0:b0:49e:7c4b:1753 with SMTP id 5b1f17b1804b1-4a01ade8ebdmr47115115e9.12.1790793097909;
        Wed, 30 Sep 2026 11:31:37 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f90cd4esm3294525e9.1.2026.09.30.11.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:31:37 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 0/3] platform/x86: hp-bioscfg: string buffer and password fixes
Date: Wed, 30 Sep 2026 23:30:15 +0500
Message-ID: <20260930183018.49629-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix string parsing in hp_get_string_from_buffer() and make over-length
password writes fail.

Changes in v3:
 - Drop Suggested-by: Andy Shevchenko from patch 2, tidy its includes
   and declarations (Andy)
 - Return -E2BIG instead of -ERANGE in patch 3 (Andy)
 - Drop a blank line in the declarations in patch 1 (Andy)

Changes in v2:
 - Split the hp_get_string_from_buffer() fix in two (Ilpo)
 - Drop the lib/string_helpers patch, use @only of string_escape_mem()
   instead (Andy)
 - Add patch 3

Muhammad Bilal (3):
  platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: fix non-ASCII truncation in
    hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 79 ++++++-------------
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  7 +-
 2 files changed, 28 insertions(+), 58 deletions(-)

-- 
2.43.0

