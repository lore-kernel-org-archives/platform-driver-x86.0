Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543A6542EF6
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791921217; cv=none; b=exb7cKn11/Gf0jcS+kP+PLS4lLVOdsx6tMHyBYUgqpoqWz8WjkzqjFbsdoi23lGCauM4GIldQPtDitSzHB3kyFaNCaxyk9uZqkD94+jARhT3B51DkfUoLuFK631xY6G4UNh2j5vSyg9yGJ3mHBLRYMJLNHHKxEvp7/PfQLyrvkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791921217; c=relaxed/simple;
	bh=9X+B3VzuP6c2+GbMDzQKaInOmGWlAa6Crsdlsjiub+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rOXdKIhCmaVI4kRojfLmIpP9RNq0HTISXt/5e/9LU1XNJxEsSD2ta9h8PsaeT2PAOxv3pAbfLUEzTvxFO7YOe+h+Rj7FIPPZKA1nH1POpQeKikXDmwIrCFI0g2FOM2g2UnLqgDm/wB5paQbGgZ9dp5KDchiR2H58LK8v8mWolrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=EPUCk5Vh; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="EPUCk5Vh"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-917d595138fso25589646d6.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Oct 2026 12:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1791921214; x=1792526014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HcBu6oPAez1ljZeSMUFIBe+d1rm2GYp83jcwBgf/ZWA=;
        b=EPUCk5VhzC4xZLPu5RJNFkGJNQIaQGlNdADxDxWxR//Q6VGL5HifvRB4F1j3YoqkIO
         D997XkDKGrvbKBkYRhUaDKBlUsJKe3qweZTasPrGov7LJl6T9VnlZ/jVEL3do5ifowEv
         KFFBa3pDn/YlhqbEdcjCbEbwnQAYj1+yfWPEn6L6CDGymP5DPD3zhoRoqvLcgCmEBvSW
         6fqfOsaR0+AOsXCEIIGG7hdUpfMQPJ8BTW+dXRpg266MqkkZ0wmvoV7/Q2/4++21uc1S
         vBq7Wsoi5aVZFMUOpNeRoHGu7kvF3OoQIT0d4xY1dE/HBSO7RL9fVox9wAAAgDxo/q9F
         FSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791921214; x=1792526014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HcBu6oPAez1ljZeSMUFIBe+d1rm2GYp83jcwBgf/ZWA=;
        b=YjfP9IY4oliJ6vmUK9Mdu6R67mWOqvDsjiyixjcfkAj+5j071Cnk9b5QoC6X6Nmg/S
         7BmI0nWh+lVd5MZZgW8rW4idRppZzmW40l7eV5mZRDweINixzH6DUNcfvKRErEC4MIH6
         +/wFluDfw8mvEj82lQeBwKCGeGSwXpGagrVZkZbdsZ3zQK32O1/lTHLHnWDYNbGjj9Co
         xIB0hl2JlWjr6Fum43NYOIW5kIGrtlnfDFiBDGR1qQdIWEW3wzCKnuIs5obEB1yaxA+g
         hlN7SZ2kR3K2i8CbW4MkAyNRqvA+ol+0GJCQc0q0/ynlXGAvUvi/iZOnCls7ZwjT+Tms
         DtBg==
X-Forwarded-Encrypted: i=1; AKwUvBx6LDDvxF/6xavgjIjWP5XG9ndvD71pVZ2gpqS0lWFsF+7FbE7V0SivLKjdPY526ehZsEpAY6bZeTEfVXugvgCxWtBg@vger.kernel.org
X-Gm-Message-State: AFq9FYIzbYBV2RgVImW5dfhf7bUQp4WJ5MOJsqGkTJXsova8JA053CYr
	BWOkx8pCEk1AGriNzSfhFKUh+c1By7bwuJ6+GvT6qh2g3e+QjUGWjmxOYDWVZtRG63LAN7Aza0L
	IiQRDeiETTg==
X-Gm-Gg: AYBFou1gp57Jwj0BuTV4wyzpMlA6LqrNU15gyIodI2xiLMAnlWkpeyQ6h4Q1bU98c+X
	Y7GsM0G30R/4j+qrRqEeSNem3W9l2M8RqiG/kTcoDY9eBDbcLjZFeT99yaiJtoTRIBE+wquVKtk
	QvBSTWDp54eckVcmLYXQ768CwChGNMK9AoEFuQXOdomZ+KuPAZ94cTbW99df15uh3OEviAYO4uB
	hmP4WQfQS/qM1D2KQiDFQJdWpyUbii84qKxiI/fMhvwCrxBc3bsPinAe0gKdU/lSF7fZXBajw6Q
	xSncXscdOP7wzQBS206hO0P6TNbqFhZVQ2dON5K6veausgZPEJAA7W0WXduMc0GoJ01oEhXRdwX
	6+tirobCb5a/XSxBs+V1wo9SrABhWaViXvKnsExT7Qr61pYR8ZOZNYabUXFWnmFHa5yilTVGJoR
	mu4DS1RiizuTp3ah0oMraucjndrtesvI1sCebnZuXzgHpstD1xkyh7lRwGtAATbFA1SD1mRg==
X-Received: by 2002:ad4:5fc9:0:b0:91b:8d12:bac9 with SMTP id 6a1803df08f44-91b8d12bb24mr93591896d6.0.1791921214109;
        Tue, 13 Oct 2026 12:53:34 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a61d:7a00::11])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97c35bfcsm33085666d6.42.2026.10.13.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:53:33 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Michael Burch <me@michaelburch.net>,
	Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Tobias Heider <tobias.heider@canonical.com>,
	Val Packett <val@packett.cool>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-hardening@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC
Date: Tue, 13 Oct 2026 15:53:27 -0400
Message-ID: <20261013195327.19571-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013172718.12355-1-me@michaelburch.net>
References: <20261013172718.12355-1-me@michaelburch.net>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 13 Oct 2026 12:27:16 -0500, Michael Burch wrote:
> These two should be AMUX1_GPIO and AMUX2_GPIO. My unit (BIOS 2.14.0)
> shows what Liviu reported [1]: 0x14c (lpddr5_therm) reads 130.048 C from
> boot on, and that is the value the EC is sent.

Same here, and the ADC1 table settles what my readings left open.
On this unit (also BIOS 2.14.0), with all four GPIO channels defined
in one DTB on a 7.2.6 kernel:

0x14a  38.6 C        0x14c  130.0 C (constant)
0x14b  32.7 C        0x14d   34.7 C

A charger on the left USB-C port warmed 0x14b by 1.6 C in three
minutes; 0x14d stayed within 0.1 C. So usb_charger_left_therm is
AMUX2_GPIO, 0x14b, as your table says; 0x14a reads a board
temperature and warms with the SoC.

> +	sys_therm0: channel@14a {
> +		reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;

One note on the shape: hamoa-pmics.dtsi already defines
channel@14a and channel@14b as pm8550_gpio_01 and pm8550_gpio_02,
with gpio3 and gpio4 in high impedance for them. The EC's io-channels
can reference those two directly; redefining the nodes in the board
file only adds the labels, which the EC node does not need.

Happy to test a v7 with the two channels moved.

Liviu
