Received: from mail-wr2-f31.google.com (mail-wr2-f31.google.com [74.125.225.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C974AA3E2
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 15:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005982; cv=none; b=p8KIbfZ5j6dRl3qF9uBCzjCd2tbCvZ2QnfpIZKLEiprDj91Ai8EqMz0lVzmDalCJN0Z87TiAHGPxW0kmL8tI0qlhyRuEr2CjaRpFWmjY+eOd/HZOxIL05iRFJblhRP7z7tinMD4U6p91X3V9BciChO4DEhZW38XYMnnVZEHTbu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005982; c=relaxed/simple;
	bh=uxSodr+5g5LhPeuMJLPaJWB2Wbyi9PA19/nxsZvoglk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W3axWNjwrdc7YwXZyOMGFE69brRCIp994u4ovC2uC+c7lQsgfzpM71b86I0VWIHyMwbP9ab9dwmmeD3IWLQzkSUIdA2VzEMGF/Egq0ss8CmPmuT2GHL3zTebJ+z3sTTUVQWqQGRGLoPKLSgBX1NEfIwTXTBeSVTQUB19ws3mnyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCwdd/EI; arc=none smtp.client-ip=74.125.225.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCwdd/EI"
Received: by mail-wr2-f31.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1924054f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 08:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005978; x=1790610778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0ME8UIp0+YWwCcJhu2EyuXifWZmH76ARjccb3bgJVA=;
        b=CCwdd/EI0Gnxf3ehSmpAf+WKHqxJuT/SEdiQz6nfa1BSrXAr3lvGDCbqI4Q+aq7M4M
         gkNeeewB+SQZM7xPtR1rbcWaP5BJzlA5eK/VNnVLgCqodKO6f40egdqKtB1716YN7W6I
         ao17i0zNBWaGwe7TehZfRSvJCwSlqz5izCRrMpuxe2IlypAV1yGJ20Xj3QQf50T9c4Qn
         9mH8UXQXMJl6gBNJ88qk1zwg8TRfqCfosA68LFVZ7eQVhlkg2HhfoD8dQmf2KTx1ydCX
         dmBNAifocPTsZDUGwvK/mddW2jOVubu2DUB+ri6LZStUSCBA7/Hvmd6zxBU2YidTrIdS
         LeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005978; x=1790610778;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0ME8UIp0+YWwCcJhu2EyuXifWZmH76ARjccb3bgJVA=;
        b=blZIqTqI29HAzMfl2qOXZKsm7erT23Ncv6G99wPjwlckq1+PvLmB8vkOIJAloWPkDS
         QiAftxkvLt3RL3UTqbdFT+qbKq+FMARlr4JPOpXmFSdhSu01HvbrIzg8q+R0etoR5avL
         xCnrynl9F97EHvRfQL7mNuZ+doJcjimXEzMk9ICEacVSa+We6xpgFa7qoznMnPA/KCbC
         iNv/OV8fnMYcUNBdX9H33s6J2aFlsFsDg2UBuw6wPZIQFQahb+PTg1gfHGzs4OGg0imZ
         eLhv+iOikAiFj2EKfMjArHdBNpABgcQRMXiYorLMZqwvA/pyfaG08sOvxZ6Q8OBKJYm6
         x//A==
X-Forwarded-Encrypted: i=1; AKwUvBxPRQacoTEUt0ekbr+MSMrGujJTy5sJXFPBDO+g9dvb0Zhx7m4W5HCojeKOjRhAGr6zNRbOINrbe5Gx5OnOJA51kdrZ@vger.kernel.org
X-Gm-Message-State: AFuF++ls26mIBXHWO78UL7Qj1fVOGRnJ+C5m8OR56+5Xuo70JWyTO5wu
	gIAavEFuo5T+dBvNgLWxgosOszo0/B5eclcucweRF2t/oapORGQ/ixfd
X-Gm-Gg: AYBFou3Ksr9AXXzxW0N6DgaQC8QIiUaGsQ4ao6p3V9qs2rgroFZ47So1f45Eu2j+glO
	k5TRVb4WUFmyiu89uIxwASRKH6VsGAjmlISQyrnqorIJg0p64BeXw2+c8taL9NJlwGJPpBHoRah
	ZP8P3mIHb0ZDJKwnI3rQ0oohyvEEaw+mCnr/H3iLhuEJB9QP3kiMRpAsPuUYvi3xvqUnHonM3Sn
	Y4cWuJEwhrY0Y/es+0/nSO7ZDKK3MZCRAAeLa6npKWOB8pxWOjaE7IYh6oXUjUlPyLPTiX/TEyP
	z4vmeKP+lgZgXrlrKiBrjGxNTooZ/owpLkHKI2seh8M7L7nsbshaW7qLo90ZHKj95rmWUGtA6iT
	30TvJ2reOMn6OC+uX+O3JLTbmABYwB3gbR3b7+cziNzh4h+dzRcHOpSPiw5wGImH2ocO9Q8KujC
	6n9EEA/MvRukI2UHiFdHyv2cUzi3qYDClanbvX0T1EiUvb/k2k7hXZ0Eie94kVRJiAWA2acWKxi
	dOWjmUVzMLtS4d0Vdn5Zg==
X-Received: by 2002:a05:6000:430d:b0:487:27f6:a4d7 with SMTP id ffacd0b85a97d-48727f6a748mr10341971f8f.39.1790005978215;
        Mon, 21 Sep 2026 08:52:58 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4885a0549c3sm11159401f8f.25.2026.09.21.08.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:52:57 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/3] platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
Date: Mon, 21 Sep 2026 17:52:49 +0200
Message-ID: <179000596924.25968.9295838488330037392@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <55181989-11d7-ce0d-f9c3-e9dceaaf1fb4@linux.intel.com>
References: <55181989-11d7-ce0d-f9c3-e9dceaaf1fb4@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ilpo,

On Mon, Sep 21, 2026, Ilpo Järvinen wrote:
> > +Date:		August 2026
>
> ??
>
> > +KernelVersion:	7.3
>
> This ship has already sailed.

Will be September 2026 and 7.4.

All the other points will be in v4 as well:

- the missing includes added where the symbols are used
- the cache and stale periods defined in milliseconds, with the unit in
  the name, and converted to jiffies at the call
- lockdep_assert_held() in the command path every EC access goes through
- each EC read checked right after the call
- ARRAY_SIZE() for the cell loop
- MILLIDEGREE_PER_DEGREE from units.h instead of the literal
- braces on the multi-line returns

Plus two things not from your review: a shorter i2c id that fits
I2C_NAME_SIZE (the bot's finding), and the symbol prefix renamed to
slim7x_ec to match the driver name, which makes the v4 diff larger
than the changes are.

Thanks,
Oleg
