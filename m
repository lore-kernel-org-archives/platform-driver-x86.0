Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F853090E2
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jul 2026 16:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783097107; cv=none; b=OkW4AQKIibEzsDaQU+lz8dQYQ3geMcXRQG0rBVN+20dRqS5AK87kJPVVSTReIlwPtXiI8njMwb0BIkzyMZ5ZUMXb92l6qZX7+9vH1OTiv++Pnc2g5F7TzLmqi4QgmRKXIWapNwt2QoXhjq+a1+c5orpB+JURqa8V8TNucdDeMI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783097107; c=relaxed/simple;
	bh=dlrvmnT/ChXGFNvexSsSPLbbwN5V83PF1JtaIvjwm4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTAfSvzJyaxLHCLiO7WWkxlbe4EEZj9dEU2avS1O5Og8/8AWjEB9nh/KQsALc5UGKrUQDIpIsz90AjUpZQ/oxW45SuK4Ymnb6v78hZU8U2UKaLDBqau3F2SNgkEaRZ3dJkBFQlbpAB8frF59V/BxX3re9l/JPVkOt91dJlTNpJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Chuj8+MB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Chuj8+MB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493b7612475so7219725e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2026 09:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783097104; x=1783701904; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w6wByLmzF/eovFmpc1VkbiQzifybQZsWs1mIadmXZpY=;
        b=Chuj8+MB6XPz1ri1pl+BABLYIJU7gBKjCgRRYPDAZuin/yexBvI15Ug5DkWuXyBcoo
         6HHcpcC2/eEPQtgZz0BdU0TQYol83vd95+BFsUUm7QX1gSG4r8NBbsGVmWcK5Iu5It0u
         yvXaVxu9eB2kN+o59wFsPmTdPn+gqdR1dPLvgVSc6tGxLS4nPPbdPmLxDLotnoMkgLBq
         L06Gzsi4FWK0gS/QSu1kifBYbJ7dGy79KW1x8FyJOOikqLc/ScBEUjEgMAw/lafadn99
         P1CSPexqAt0y9NTc+epTAnHke5bXDyXaRFF4DyUqbPdtn2ymwBpcSa5ZRpLHZVybz/dP
         F3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783097104; x=1783701904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w6wByLmzF/eovFmpc1VkbiQzifybQZsWs1mIadmXZpY=;
        b=o0Gid8AqLuyeMHYvixhaleuSH4YXCyNZkclbPkVAHA0xidlzfwAXS2U1If1ZA0vkaX
         IDvo+nj7X9Hgc8/VxoGJ3cSH07KeI44C6CrwVpHj+J/560CV4yLZS5hqpM+5+Bwmc2Ws
         604/ZM5nWrd2cA48FT+7gYMKKzQH5MgRH8ts2dlZVuI4WSupvy0d/1El/PfCS6pafMpn
         ZHETt34PtRGlnPv784kFOWOfR97VsUqwgJj0yOKPwgRlXJi5GyEjST7E/1SNB+rxhnVy
         9ZJsirMEMFqmUoFNfh1vMOC9nx9AynvF77hTcjoIGG9mBqyMnskPGO/ZETeNlQTkToan
         GtQA==
X-Forwarded-Encrypted: i=1; AFNElJ9AeBkVQuiO2EPe1hWhkHnrpaXjzJb5prlaHkemSKtGERw+sF/hwRDmBQxygsZUwZbK7QtPgzb7AE+sHzmt9v+/EqoD@vger.kernel.org
X-Gm-Message-State: AOJu0YxI3y17crwl1Ay+8J2GLQlkM1r4Fr7ycjQUdSanXMuSy053ZUXV
	0FimT5RKw0yAhOULF1fgS1BYqg87AgIUUR2b36NP94wM2/1wl3VqlL2p
X-Gm-Gg: AfdE7cnwccJKT+jHvXGleBjgxosSlT02jKwN+I8YeNI96ClaVmCPWuk0IAbNURUIiRW
	w39paW8Hl7A4Tm/lOEShLa+7NNjGvoiPWs2gZIhn6JmgMP4KZMHEmrfx6rnQm7XAQMBJsnZPD/G
	DtHcUSFC9IGk32R/X6EGJGPw4WiRQHx/bbzqZ3ykw0uaqb5w5sJptc6oA2HNEFFByVwWaySvRSC
	Wzl3J0ryLdd7xOj/b8xZeS6rqlCMsmZnookeo73+KbSWzGv1khju2SAr+4bx85bw1uRVnABLldh
	2UIoaxB+aV+Qv5uzvbJPQLgPMLNvP668TTchwCpdTqNGsohvLTazCPhwAPfMhYKzhUHoadl9b6w
	QchwT462lcg/Es4IqMnoxlaDPwp5o/Y3IFrQhe0FbwUsucLUCclai13qwOYgUg5hILnk/TDKriX
	brPbFn7s4yM7A=
X-Received: by 2002:a05:600c:4e93:b0:493:cb96:7658 with SMTP id 5b1f17b1804b1-493d11cd1c5mr1218855e9.2.1783097104218;
        Fri, 03 Jul 2026 09:45:04 -0700 (PDT)
Received: from user ([104.28.162.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef183e7sm246860895e9.2.2026.07.03.09.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 09:45:03 -0700 (PDT)
From: yahia <yahia.a.abdrabou@gmail.com>
To: ilpo.jarvinen@linux.intel.com
Cc: W_Armin@gmx.de,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] wmi/core: fix use-after-free in wmi_add_device()
Date: Fri,  3 Jul 2026 19:45:02 +0300
Message-ID: <20260703164502.41721-1-yahia.a.abdrabou@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2df479ed-7a3d-7f89-9f2c-77d5a8270837@linux.intel.com>
References: <2df479ed-7a3d-7f89-9f2c-77d5a8270837@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Thanks for your review, This patch is no longer
required, please drop it because DL_FLAG_AUTOREMOVE_SUPPLIER
is essential because it will always produce -EEXIST if
we later rebound to device PNP0C14 and  wmi_add_device fails.

Best regards,
yahia
