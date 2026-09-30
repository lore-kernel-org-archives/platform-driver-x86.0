Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837CC78F3A
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Sep 2026 01:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790733526; cv=none; b=ZZ41kjVUFRqMvfs0XKio5oNnaz2lFIZaXjK3eyB6roRxV+CUAW+7wLZkyuMXV+v4AUwp4V4/SaO4yH7DHByrm0GLKX8NSXoXj+nV9lx3IZI7qik4oQsLnz9mVgGzeuKDPRZI9DY6FyY6iEc9xff4zE9n9Y0Fm5CV7T2ndMcf87U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790733526; c=relaxed/simple;
	bh=Eyn2E2FvVFCJNg7yb1TPx9O+fNtB5Oi/TdanUqZxYEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Knt8SOebQCAfKggYiAOskgHQr/JZ8B/acB708YkOSOdqV79kPo7TEnLuQ75O1bvXdIhD6+BFdjq/aSmgJZaiBXciCQfpoqPobwYojtx47ewbfCV7dLioshfp4K8dbzU7ad9ZAuukCMCpbYDPhpgn+IPvFMfYne2PIAzkflWb9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ss7awoaU; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ss7awoaU"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8eb3a9d9bso4294948e87.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 18:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790733522; x=1791338322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1faA/W9nbbijKsh74cTmCcYMwxVC2d4f+A1unM9IIM=;
        b=ss7awoaUAYueGy3JTgmqXLwHIj+LZ8fEyvYNeItGBvXp/kAv1PnTE/mflnzi0kX/My
         RycOz3x0y1PkP8CGSTNqS7OiSRScqDMOQzYiOe9414etcfOw3zo9KqJVqLyw2vV2pxG7
         KhPpOmmZJId2AMBtWJBpN8FKsUz1CVl22JN+boGZd8i6rwBWUj243KzXCsfT2mI39x2d
         jKtDJ9lQWdAAl6S6sxa2bIHP+VhSHzXmU0ykgF/5LmuhQ0X8BIQzXXd5ZNrgpg7g/qO6
         ucI0sKBWal862mY+f4ClWl1o9yVwPSNNpiRDa7FyZRvo6vgfXg4I0xRprIoXyi0/4TY5
         76pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790733522; x=1791338322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g1faA/W9nbbijKsh74cTmCcYMwxVC2d4f+A1unM9IIM=;
        b=Ps7aqspFbzI3yC5B0WSCR5yKoC9wtrHIeNLpjaDtYEttZQ1oYpkE++VJyITr52NcmC
         EB45QrlL0YrDUZuL7noOrBCvGnL3OCJdXLpdhrS8WZOJ40oLIFM80UnyGpq6YaLSzJeY
         abGSgRHEBUZkl7HXJ/OUSECmwHpMMJZpmvmYpucBy3DhbH2lh/y5qB2aOgS3CTNmC2WC
         tMs82s5+HsJHm7jsgQwscbHmuAJMpbbJB/S1z7b0c9z4dyZug9biJj+CTmHtGfdufgzI
         P5mf9Iq60EVDQNoDSGrMlF/hR/75SJMaNxxHWKX1zdCc3T24gr7RDAisLRUMarr0Vp1o
         7nkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwn0RSz3QwQmdxCijXK4syR6W+V+nWZSiyXT4K+VPTjOTyjtlm6eMMO118tvJ9HcX12Z6em+Q6/9QqRrK4Dl85hFGcB@vger.kernel.org
X-Gm-Message-State: AFq9FYJP9PyhiVLowvE+xDc3YAs1tG7WjpX+dLANxBxl1INQ10r5dg/M
	n7mDiW82w5deNpjAMOCVits4bmn4AmVpjdB6HzR+r8nJpDLpmOTH+zpG
X-Gm-Gg: AYBFou3LNoEjtH0EPxuguYSPeIsKcHFUd+iIMIARaw16H0A+KjuBqvlwIh+aOFC8Iru
	Uqq/WyaOwXM5ZdCPYyrJvim+v0cg/whF7BVhB55qa0DSiOy52QpVuBL1lqYLJvZ8NTR9MefkLdc
	zp+L2wbuT+xlw1hIR4XfbGDQyIaOjMbWLoSf1bRnJ4idjWpTtUdTyHnusQ9VfbgVsrzmcsCaSVG
	KEYz108SDksdhMPVOxeuMpW6BnOsA9FmJFmvY4ETbKbRnrfIj2GmYcIIVCSe3VbQ6vY4yLsJg1i
	6wzTRQfaE5O33tWmduRbhx4b7NpnrxBCD3yJH+2eP5sJJuhRD/WdTHE20zg19mZgLmgh++b40+5
	7XDhXG1ofC8ppWdEmNdAXK/Jnqp0hy1GJVbpNk4Rn9m4AEmVUB4tfAJuXmqVFwg9oBHg+dXxCM0
	MkRdgRZ/7EDjC/xH59TidzZekD9btOAa/i9y5U9HYGeIOnhMHmpIMkiaXY3wCx04VFB31a0G7SG
	L+xfCe9GLngf1VQctWGk2om0elBdn1w35d4xpM/sSwK2YiYI2QQBe1W/M5ze4iH54ZC
X-Received: by 2002:ac2:4473:0:b0:5b8:f417:dc00 with SMTP id 2adb3069b0e04-5ba3bca837bmr295821e87.22.1790733521846;
        Tue, 29 Sep 2026 18:58:41 -0700 (PDT)
Received: from wildarch.lan ([109.72.228.33])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3b4639e1sm355442e87.21.2026.09.29.18.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 18:58:41 -0700 (PDT)
From: Anton Karasev <uselessfire@gmail.com>
To: chris@miget.com
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	W_Armin@gmx.de
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Only check the function id of GET responses
Date: Wed, 30 Sep 2026 04:58:40 +0300
Message-ID: <20260930015840.3114671-1-uselessfire@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928154337.154969-1-chris@miget.com>
References: <20260928154337.154969-1-chris@miget.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Chris,

The Redmi Book Pro 16 2024 (DMI XIAOMI / TM2309, BIOS RMAMT6B0P0B0B)
behaves the same way: its WMAA SET branches only set the return code,
and only the GET branches fill in the function id.

Tested on that machine, kernel 7.2.7, with bitland-mifs-wmi from
for-next ("Detect failed function calls" and "Treat
WMI_FN_SYSTEM_AC_TYPE as optional" applied) built out of tree, on AC,
writing /sys/firmware/acpi/platform_profile directly:

- without this patch, every write of low-power, balanced and
  performance failed with -ENOMSG, although the EC mode changed each
  time (QFAN 2, 0 and 3 read back from the EC);
- with this patch, all of them succeed, and reading the profile back
  still works.

Tested-by: Anton Karasev <uselessfire@gmail.com>

Thanks,
Anton Karasev
