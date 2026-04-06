Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0864631B83B
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775471186; cv=none; b=YpUhIxl/OEwIdcvgdMfZoNeKE3NZLylAdp2BqF0B41YCSo8JdiT/hwwk1iFWMH8QI+acrcfnEN0sUg18tUX/ocZXQcH807lsL1clKpufwjnFkwBIEzelNPZtFxsuFUrr2oJ8oYYzEyyzr1Xm/YlVydcdGHjkzXrGdKGEy8Epzsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775471186; c=relaxed/simple;
	bh=pkKh0bscQakv2Ey9UpOYuHJ95C/vu5bablwlg+7c2PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gPFK8FZm55RPFYF1Fmi/TpY1sgYUmtkeCFkgOrZXAC80/ZL7rLphky2+lmecwAvOyRkUGI7DCVadTQCQ8vRL1vTRwMYzAcuSYMlxxbF83lKSHbT83prMpGJ01ZGTuJpnfZSy78zJv+MUF44bySNLUMzaY1Bx6wnijZKvRaL/zJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVobY1yh; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVobY1yh"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so3630128e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 03:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775471183; x=1776075983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DpOHfZPSKid5DwyyV58HBLJITsfUDBSjGV4lT8xuUc=;
        b=qVobY1yhuPfriJRV5L9MwUupHBTeDeAGC/+hQCXysjecc6cmws4mxR/aoxfAqzxw9K
         TfhpQNsMfXMJq5EKxXwXSAnO09UpqkLk08urnAROQO3ADrvdWlksKUyZ9Cp/+/0Op49N
         0e1N6fgE2uYSLpRVVVhyY9qoeeiBIefZJWT9/M7m00U/uK8zrnjVEbv/eUqQcKWGNhlW
         fWc9339cW9O8wlDEr/eECGtjyP+rNABNBRJHRlmcaXtucLrzzZRyigvKZgk+5a0+hDzR
         KpF5Iva+mREfeYPleuxT4kVuE7Duv/8EmF2WJuCBtr9nQV6nc+iK4RnOdx5GLMMtCcHJ
         Vw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775471183; x=1776075983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+DpOHfZPSKid5DwyyV58HBLJITsfUDBSjGV4lT8xuUc=;
        b=SFZGMKJaXEZK44fdTa5jRYl0WPwpNo4da3hokottyUcm2WnwyzkH+6ERRQhl+AfBZA
         PbAMfAvMLAoCPVu6aqhoCE4/KGWSxFfFwzvv/pXEvzmFsgi0A6Ufh8z5imI6dkGNdTcq
         XaL0//Cy7a+HMHEeQT8B80lQ9ddmJYrAinYp6oImNxO4V/URcTVhnh/OP+LKFT7P+QbI
         3IP23oMQdrSIskwqb5en3vaiyuxyVD3eoqtEAXPlR1fw9QVYRn0HG94BchqKYsVlOvcY
         ky/IHJNHyFLBL9oAWuOz2ldBQ6JNTQek5fwpDF6JoE7kEeF5n64Fv0jYUP44CmeR0w8+
         m1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQOw1nMdNYMa7ADEdFSQVfCjlxypgArz1ViCst9SekCO6M5WUgzQb1FTD89wtt39ZT7kALbroAP4EicUOZWpKUyteI@vger.kernel.org
X-Gm-Message-State: AOJu0YzYEbMXGRL8ISU9y4Icq/eRon5UBZkN5xH99Ms+6ZBJanp6MktH
	RRHeL418iaa2GxMqeRk3bXZ6a/zrmjYfccSZ2I3KwQfreYhF/NewndxksT0d6OkS0DSqhQ==
X-Gm-Gg: AeBDietXq0ETD+lMNeiM1ISzVDMXv/b+dHH323syRZRhDKjBshb4NUaZEOxCI+BZb5N
	GXfr/VsR4JSYNs3NEjCGEbev9Qqu7ZhCOSylBF/nj2tQ6M1NQN6jiAvatWNehRtd/jFK5kpsmZV
	haY54O245tJQeHrOOFHP27bHTxMFiAskkXEkh/gEt11J3jNNcoU7K/aiKVdE3r2aNEP+NjhNVm1
	edR8p9JSs415KjPe9RBDAXkU8kNWY/n1XGcjzru9feIXfSgGSLeRMoGExdTbgu5utlBDhPdSqnB
	PIoAblfxJMWYJC5RpSvL1R1V4IOTclN8Mcj1HHUacQg2VkhcCc+JZGvYL3WaQ+F06kY5OPPv4rA
	/zZr9VJS1AHXjZqris6pJbuKduOJjwI9KKGJ6319YBlpM5N3ot+N9p1KeAkydTam+DHCDDOurXE
	B37rP0V4S5i2ZY/mqzZECjHwxtWwdJqQVNKs1ZybY=
X-Received: by 2002:a05:6512:6d6:b0:5a2:a8ab:ab4d with SMTP id 2adb3069b0e04-5a33758079bmr3893269e87.22.1775471182813;
        Mon, 06 Apr 2026 03:26:22 -0700 (PDT)
Received: from fedora.dev.gazprombank.ru (yeal.ru. [94.103.95.240])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c9c3b6sm3221443e87.19.2026.04.06.03.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 03:26:22 -0700 (PDT)
From: Alexander Egorov <begeebe@gmail.com>
To: Antheas Kapenekakis <lkml@antheas.dev>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	ps1x <ps1x@users.noreply.github.com>
Subject: [PATCH v3] Remove outdated upstream contact note
Date: Mon,  6 Apr 2026 13:25:21 +0300
Message-ID: <20260406102531.896524-1-begeebe@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329215348.56185-1-begeebe@gmail.com>
References: <20260329215348.56185-1-begeebe@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: ps1x <ps1x@users.noreply.github.com>

---
 README.md | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/README.md b/README.md
index acc4503..67c2915 100644
--- a/README.md
+++ b/README.md
@@ -58,11 +58,6 @@ This project is based on the original `oxp-sensors` work:
 
 - <https://gitlab.com/Samsagax/oxp-sensors>
 
-I could not find a working way to contact Joaquín Ignacio Aramendía
-(`@Samsagax`) directly. If the upstream author wants this repository or any
-part of it to be removed from public distribution, they are welcome to open an
-issue in this repository.
-
 ## Included Components
 
 - `oxp-sensors.c`: kernel driver
-- 
2.53.0

