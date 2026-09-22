Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6101347C0EE
	for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 11:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078399; cv=none; b=SkrlLkVUg0/+wXifqtP7b4s/6RYI9jiv0nuBA46pedhZeJdvR7m2dkO4cCGrSfr1qeKh9Z+EWdgdCRiAfHcVhOFvfL2l3C/DCvc0B4XxrL55tVlWD5z/fzRgUVxXTAYXpYVJ5NSmuVZBTc6PPw0tzkRBuZkOYBMJK/bInTlvoiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078399; c=relaxed/simple;
	bh=A3cfgSSjM7zT5+N6SC7mBOZftfLAvGW04DIU1iyvdUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=BCGePvpiRe1ceUhffTkvKcpBi/AmZ/s4hRMMw6l1dWGqgF2hWRJTv3GMnbWg/1zyNeBJjEeq0FM9bw010HQgZeZfq3fztBgrqAUbl0VSi2qXnzIoRw4DKFOqAx62GEcG/DViRrbGNgXPAFAKYDkVM3Nyz/1O88BEAliKgJxNc30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CWvJ/yq3; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWvJ/yq3"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebcb8d7so1259119a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Sep 2026 04:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790078398; x=1790683198; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=A3cfgSSjM7zT5+N6SC7mBOZftfLAvGW04DIU1iyvdUY=;
        b=CWvJ/yq3JP269/AApB6OIfLaCMBeiGrMGK1Y58VcJdJFdNQ+SVxgAIas0NbjFR2For
         2ZPJodbtUPBpxiCchYwos4RiVJ0BKnr7dx7sYcCmg0HXziWJwKpo2Wq6ua5/GaW7v66c
         lGVWZEXugGSEnSkpGz4MkzY8CYNTygvSNRgNJ2vJ5s+t/k5avmCgw08XghB7QvOw9C6h
         GvpzWkt66oLiDiSCvqjEAcMOGvOh5RBe5qp5UHqIE92J2aB75fo/19K6VFAy7bkcA0l3
         vXEP3IEbMB5WEmcXTyMAwfGJRasddDOJ8aK3J3FIaol+M85gEcEht+xRRZ44cOU9LDNa
         5kow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790078398; x=1790683198;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3cfgSSjM7zT5+N6SC7mBOZftfLAvGW04DIU1iyvdUY=;
        b=K8KH9c6y9p3s+FmJRdJBFgmBhnog0Hp7OsvJxS1GZzm2Lbhsm+m+2XrjQjO5utLZXd
         TCXyRGif6OtUQ8jJtPwFhVYeqaRxryPbp6PB+nd5vGqW2m3C84AJ8lIixSTyhxNEf3uM
         30gEctemzU4mRjMmgj5eKaeh5XBFJ9sOAUWONDW47QbxCkokNOYxwjmYx2VYs2qPoLLj
         OWPLfdceOYNsFSQcjStVe5Syext0f0lsBW0gDNLj9ArBDCYVDBARjDGt5F7TMBARTuOy
         oGbRfYOkRuQCOyxdVlvSZOw668NKFGf7XtCK8lCNB0C+kn+haFO2UIZ970tlxcTD/ENt
         7FaA==
X-Forwarded-Encrypted: i=1; AKwUvBx8OnWHY/pOOTjV5snLivFZVfmVVoM5CWB72kUXRYAEXIiIlyVDGVf7tU6p6mCLRPm7GEClVbPD8YikRl3EDLmEKc90@vger.kernel.org
X-Gm-Message-State: AFuF++mZZcNdEDi9kq0m8JJU0iCiV9R9hIYT7H+7meppL8GNvjuuM1tg
	KlbRM/rbeheHP2aHW95iCNuUCGcVMpMbK9euSCxWtbubHRyuQb2D4frg
X-Gm-Gg: AYBFou1KJRGOnbXjkQ1sfYiUzY1Qy+u4RAIAwlgQIV25n6kXwxNJsCiQ0mMznXAJyfN
	jh6ybXQX967BcqdXu5cVkOYwzYSj9oVAyVmCjwPbwCrP3d/6ihww+73gGmu791Ki0Ug3hN5mnx6
	ZzwV6AwI4z1KgLUt1m2XfIg8hdJZcXJ5b0+vnc2xjJA0c6P50DLlg/CN71l2oEgfgJGiEshDL55
	4YD6LRRK/biGDC0TFnRJiAmIXq1yxjXAgIhJXJOBSi7OZUzyZJQP6imcKigjSCI9JNLIij9hYhv
	w3g0qvYHEuvka7aUSrtv/juA22fjYhff+TCPllb/TuPt+d1AVPf2wFbn4NuHqrRg4/pKAcvFVz7
	eUyDscwaMA32op3tbMlfxtrtm18ClHbueKmPpX2M6gj0N/lrhziujwPhuJcHwom1PLninh4/bWs
	hOObyWACgwmoXVoqDLsBu43W3E6ea1mpoV3+Cm0PnvAxXuUdXQtZ6h0OSo6maCcqUak7MOvQ==
X-Received: by 2002:a17:90a:d008:b0:3a0:797b:443e with SMTP id 98e67ed59e1d1-3a0797b4639mr38937a91.3.1790078397173;
        Tue, 22 Sep 2026 04:59:57 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e5cdb48sm3050144a91.17.2026.09.22.04.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 04:59:56 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Denis Benato <denis.benato@linux.dev>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, Derek J. Clark <derekjohn.clark@gmail.com>
Subject: Re: Placement of ASUS Aura and platform/x86 ASUS files relocation
Date: Tue, 22 Sep 2026 11:59:51 -0000
Message-Id: <202609221855.ReplyIlpo.lhw@gmail.com>
In-Reply-To: <7b4c6859-aed8-6117-5d80-1ad1f1470260@linux.intel.com>
References: <0ca263c3-7885-4a5c-bfe5-0e8e4d189666@linux.dev>
 <e0882d84-f5ea-44a8-881f-4095129e4d2d@gmx.de>
 <c26da468-9a5a-46c1-8dbd-1784b69b3c73@linux.dev>
 <8e8168cd-4f6b-41e0-81c5-5d7b07b1df13@gmx.de>
 <7b4c6859-aed8-6117-5d80-1ad1f1470260@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

Good to have this settled, thanks.

For completeness from the Arion side: the ROG STRIX Arion enclosure
driver is unaffected by this. It is a USB mass-storage device with no
WMI and no ACPI platform device, and the LED part is going through
drivers/leds per Armin's earlier suggestion (an RFC is on linux-leds
now). The piece of Denis' shared Aura interface work that matters
here is the SCSI transport helper our driver would consume, which
stays under drivers/scsi; only a WMI-based shared interface layer
would land under drivers/platform/wmi/asus/ per your mail. So
nothing Arion-related should end up under platform/asus/.
