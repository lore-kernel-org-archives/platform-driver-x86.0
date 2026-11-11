Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390009;
	b=viQquKPHpzjYUYCYPwrtD8Ob8G9BTNhCiFXxSyRVEXp3fwT4LJGF3PbTY32x0ua8oMbk
	 IhDl3vnPmr4wbATd1lAqgy+6OdTPMgpw3P9PtCtUWu5U8yMw4thB+e/RWk0ulM3onNFph
	 BNgxidE6u5z0FTnlzN3GsVtNc7/K9FLn9icfqfAjntLWHQ0EOBiqRj7ZYtZLBm3szQhYY
	 LzY92SqTFLNmrTXtkb5++RLtZkBT3j9NVId78bAfl1uEu9nWPk4tvCNr/0ICWtzFQ/7vC
	 FKh20sXrcp80NcR6Rf01hfvFJMroZyPQiMm3rRZYB3W9yX/CyFLdLZnJsABUZSlRS3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390009;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-ID:
	 In-Reply-To:References:To:Cc:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-Debian-User;
	bh=MVJPjMxmN2nOeNa5Dr67R3ua1wfb6HA7ovXBQPytLxA=;
	b=Cn5iRUliCDbYzLuNuOYSjR6uJGj7tHEdbelJS4O0qWPydwluCpBG8PDMw9A4kjJzAJ/N
	 V2QNOfQSgVFAkyYWjEChOJYcoYEHVLwdaKgG+JMtnGk/som6Q3a53qIqLanqgs2DNTdhS
	 r/ANRovM8z+KGLtHBeFBVLPGv/A0DsYedGCfrmbHyfjaZpPQSHRnjVYsPvAootT2FnjqT
	 qhniXHmN/gyyWn/2zxAlDrRkmQzaRajog/G7WqGebpQwAs1jSgb6fnhtjjTKv9d1jcVhB
	 g4L7nSnO8c7B1nfOtURKrLv6tqACqD9Z7BrElNsmVCGouSrCVMC7araQTvbB2ooIL3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=RdYnwNcZ;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2524560A260B;
	Wed, 11 Nov 2026 09:40:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2524560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=RdYnwNcZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Transfer-Encoding
	:Content-Type:Cc:To:References:In-Reply-To:Message-ID:Date:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=MVJPjMxmN2nOeNa5Dr67R3ua1wfb6HA7ovXBQPytLxA=; b=RdYnwNcZFUa4eGwTDkgE6ONbZv
	/87oavnpNjA1eKANx5Fbks5PMzDPIzahtjlg2cEWSZpenMliv8N9DWiOka6zfgs9jGl/4+TqCj2+4
	QJHsbdnqjD+vlajg3K9UnNVu+/gLW/9XKnLYDRX4G8HCi7Y09aogVxNpskTkfBbNmXVA7877acfSv
	hJKzKKsy7yrs3dKYT7HiRFSGieDxpyiJ0HeentJEKWBB3mTLcqTNm7uFxeDY2ntgDXOMcgjzbSAEx
	YuGlTioZmfn1M5YplOXpqHvN2mBjt3kXvr2441KBl9tffRexVNoAEXdIuYmzHf+bSBLXxbhNfTQwT
	6lGS2pLQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <emfox@debian.org>)
	id 1xR4nz-00D5c6-02;
	Wed, 11 Nov 2026 09:39:47 +0000
From: Emfox Zhou <emfox@debian.org>
Subject: Re: [PATCH v4 0/6] media: Add the ST VD55G0 global shutter sensor
Date: Wed, 11 Nov 2026 17:39:36 +0800
Message-ID: <179438997668.7.9005518768995826598@debian.org>
In-Reply-To: <20261110195454.48176-1-lsa.uz@pm.me>
References: <20261110195454.48176-1-lsa.uz@pm.me>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>,
 George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>,
 Fernando Rimoli <fernandorimoli11@gmail.com>, D. Manresa <dmanresa@gmail.com>,
 Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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

A Surface Pro 8 (Tiger Lake, IPU6) is also SMO55F0:

    _SB.PC00.I2C3.CAM3
    I2cSerialBusV2 0x60, 400 kHz
    _DEP ICL2

I built 7.4-rc2 with these patches applied and have it running on this machine
now, so the notes below are measurements rather than an ACPI reading. Its ICL2
reports four lines:

    pin 0x83  type 0x0B  POWER_ENABLE
    pin 0x0A  type 0x10  DOVDD
    pin 0x4A  type 0x00  RESET
    pin 0x90  type 0x0D  PRIVACY_LED

(_DSM's pin field for the DOVDD entry says 0x0F; the _CRS pin table says 0x0A,
and 0x0A is what the driver maps and what is live in the running system.)

3/6 covers it as written. vd55g0 probes on 3-0060, and the two supplies it ma=
ps
are enabled while streaming, vddio and vana both at use count 1, on a device
that has four lines rather than five.

6/6 needs one more entry, and gpios =3D { 1 } is right for this machine. With
DMI_PRODUCT_NAME "Surface Pro 8" added to sensor_leds_dmi_ids[] the flash
control appears and the illuminator strobes: at a fixed exposure (600, AE off)
the Y8 frames average 15.8 with led_mode 0 and 40.1 with led_mode 1, peak val=
ues
17 and 75, unchanged over three runs. Without an entry the driver does not
register V4L2_CID_FLASH_LED_MODE at all, because nb_leds comes only from st,l=
eds
and nothing else on this machine provides it.

The clock wants 0 here too. The SSDB asks for 24 MHz, INT3472:02-clk reports
rate 24000000 with prepare count 1 while streaming, and the stream runs with =
it.

One caveat that has nothing to do with these patches: on this machine frames
only arrive after working around a 1-lane receive FIFO problem in ipu6-isys (=
the
i-wake watermark). I am reporting that separately; it is not the sensor.

I am happy to give a Tested-by for 3/6, 4/6 and 6/6, the last one with the DMI
entry added, if that helps.

Thanks,
Emfox Zhou
