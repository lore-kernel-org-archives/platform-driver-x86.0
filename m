Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446174;
	b=34yNw27v5FxJPFdGMQymOICew9+svBNc2aSobpcl90+jaKo51AGR1Ih+E6HK3g4QdeQc
	 ISik+GLa/hloT3fMvQWWI+6+a+H0FTaCpzblNxZ4gk1wudBiekPDl6HyK2Zx3fLH10fVH
	 5hiHmsQ4sjl8XV+kcHuHY/EFockz9G7Dpv7Dzcj/2g0FwRrITRUNCp7j5qm2azURRxpe8
	 ZCncA05jIfkaEClECze1vsYDpKFTuFU8hpFrb3V5RTliReMoQoYlUFL7TU9prxAuxSLSM
	 AUggy9GASUVqAWkjs1MO6VDBbZZ4aNfoRSL3g1QRNViR5e4Up0DUQV7scyoUY+MSDug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446174;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-ID:
	 In-Reply-To:References:To:Cc:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-Debian-User;
	bh=A27strc+vx+SreuAtd9NNyIFIWfOeuK3jQu+JcHdaQ0=;
	b=YxxPqhs8L/PuMPxhc97w9y6DVK6FKB1k11rZukE4psQC5rR2cI3k5TcqAJLpbTJA2Im2
	 zBzyfhvCfHTbW1oagwUCgnTjMDK7oxq9DQIL7dbhvhSgYS91BnYg8waOkAe7XYD+XYPmM
	 PZsZxaFQTnqRXTnH4PCo9Oqv8K9lUoQl49xACb/dt9pnxTnY4F1RStvoMDTKMtujgEKMo
	 BQbPesEVlE9XNS60r+YNpE/pRaEOrC517MrlMTguOdoDCA7gFVaZCMpSR5orJvBfuiHxH
	 k/0hcoi9LuRv7nK1ii0aDg4wzPw8iGtirrpUcUOApYhf6M9kFvUQD0/irdMJ/dRd9PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=ViQd1kjj;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D8606A321;
	Thu, 12 Nov 2026 01:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B2D8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=ViQd1kjj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Transfer-Encoding
	:Content-Type:Cc:To:References:In-Reply-To:Message-ID:Date:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=A27strc+vx+SreuAtd9NNyIFIWfOeuK3jQu+JcHdaQ0=; b=ViQd1kjjsk22qRNBh6y83V5kGs
	wz6z3H+kQksXLgzYUDkq6AwaNrJZ+LjkaT9M4Ez6BMmPyvvoUUxLujTZQlzEi+EdT4zyP/KmefiAZ
	XFlUSww25kJuasLgEPLcjrA4FMa+Yi+5Iwlb5182jD5BJ7+291q0+Xw+YgW2429dNRyzCGuoAZrmh
	QpTHxHqez7Ch9WdfERPiATM1QESN9pmYb6jkUnvSIGmXk+mMIfxgYhE2nKWJY9WQgtkPj06uxLDVL
	I3N40043783AW+LWUQ9cE5Ddxhu8lmnYY+h1bbI1C1scuiNoGxhB7OEQJU3GWCP3cBTO+2LTZ8glo
	+AD6L+1g==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <emfox@debian.org>)
	id 1xRJQ4-00Db8z-25;
	Thu, 12 Nov 2026 01:16:05 +0000
From: Emfox Zhou <emfox@debian.org>
Subject: Re: [PATCH v4] media: i2c: ov13858: add regulator, clock and reset
 GPIO handling
Date: Thu, 12 Nov 2026 09:15:57 +0800
Message-ID: <179444615762.26688.7521541692261098193@debian.org>
In-Reply-To: <20261016210246.58562-1-lsa.uz@pm.me>
References: <20261016210246.58562-1-lsa.uz@pm.me>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>,
 linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Debian-User: emfox

Hi Sergey,

Tested-by: Emfox Zhou <emfox@debian.org>

Surface Pro 8, Tiger Lake, IPU6 8086:9a19, OV13858 at OVTID858:00
(\_SB.PC00.I2C3.CAMR). Kernel v7.4-rc2 with this patch applied and
nothing else changed from mainline.

Without it:

  ov13858 i2c-OVTID858:00: failed to find sensor: -5
  ov13858 i2c-OVTID858:00: probe with driver ov13858 failed with error -5

With it the driver binds and libcamera finds the camera:

  ov13858  24576  1
  v4l-subdev10: ov13858 3-0010

  $ cam -l
  3: Internal back camera (\_SB_.PC00.I2C3.CAMR)

I captured 1056x784 SGRBG10 through the ISYS capture node and the frame
has a picture in it, not a black or noisy buffer. Colour is off, which
is the missing ov13858.yaml rather than this patch.

One detail that might be worth a line in the commit message: this
machine only has two rails. The log says

  ov13858 i2c-OVTID858:00: supply dovdd not found, using dummy regulator

because INT3472:01 registers avdd and dvdd and there is no dovdd here.
The driver works fine on the dummy, so there is nothing to fix, but a
tester on another machine could read that line as a misconfiguration.

Unrelated to this patch: the rear sensor here is mounted upside down and
its SSDB reports rotation 0, so frames come out rotated 180 degrees. That
is the same situation the Pro 9 is already listed for in
upside_down_sensor_dmi_ids. Adding a DMI entry for the Pro 8 there makes
the frame come out upright, so I will send that separately; it does not
affect this patch.

Thanks,
Emfox
