Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795040377;
	b=CJB1WGFLzoZYzqT9/NXfeZOMb586lCb2vJc//8384dx/uvOj99Al4myAAcO8MpjnzfNQ
	 sQCHGLKf22t6Oy4/2kB+r52moOew0NleeqzBtoJyLUVcoGtQ718GuSRdzHcCRf6iGyY+s
	 5eZ1TU2YAe9iEtQfV186/z7vK9zKXsFCNf49od/5NpGYLDevCGqCl8goeMVDLQuUjX1BV
	 kKSfOYZFx2log/PXAg/qPvZokmZ2illztUUy6iAZmwx5/S2apq1LMdK+T6WXsb/7RKIdA
	 fPOrsFCQZ2ep8ogadWJo429IvP8uCKpYun93BE4Capm+6AouFcGPBZiWla6yh9L0U2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795040377;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=+lFM4ZsuMBbLesPe40ZnmgY2XTZ9R+nt1JOpPkNTo3M=;
	b=qRFb1gyIX4R5juuGgpfsXXtkyOVhSqljAiMwkHj3IcdexmBuTrtJrEwKatXKz2sD3A6H
	 BNWkAJXl0fLsPJcEEplABc2sPuarHJsM8py2pexrGDNmm1qqOVsOaaKx3mI7g3mTpIPWG
	 8Ci2HcoEXxksMOMrzpWOsmew0QMixEIm7+MGjAwUvKIvT+6ImIOhfb7q2mmRkrPN7wVe0
	 7t/uzhOhOnGptyUbg8sPAXAeiMz4wDWBUAvQokN5YFab2GbvcLrPiGKQ+mkTYxUa7LM7g
	 gO1eeuWwQgMCSj2UFOnUFRVKwhlmcnBdZ/w/vk7BOL534WX2C4ejY3JJa6JM7010OQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=XhprnfMl;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D200D606A32C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 22:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D200D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=XhprnfMl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795040374; x=1795299574;
	bh=+lFM4ZsuMBbLesPe40ZnmgY2XTZ9R+nt1JOpPkNTo3M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XhprnfMlRv6T65/iPHzseiPCzJO7rxZPKKBco6OarKfmCU9jtU2qm7RYzhvW/qQT9
	 LQKyw3bW74dZeY4+gWoVB76Q4W1MxQgl/xSv+xRPDNh/xRpaFLBn5PWzaHOWGBpIUq
	 +idzoE8F1zJ6fWffc5pckMDIz02H+Mu4QV/Tn5oGGSMATqA1RYqdkhHFMszhVKjLBU
	 MyrZNPBqiMNlZhER0efwRN1w4e0Vevq6nBMNDP2WW46bBPG4goEjDR99xVehMoIZQp
	 +xPjPeFBfYjqztMJD2J8XguTKy2QJ73qA2Jp8LJ2PTtFaW6hgQU7FPqRc59PkA07+Q
	 imuD/ZDsqH0Kg==
Date: Wed, 18 Nov 2026 22:19:28 +0000
To: Fuwei Xie <12313607@mail.sustech.edu.cn>
From: =?utf-8?Q?Eren_=C3=96zen?= <erenozen@protonmail.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] platform/x86: huawei-wmi: native Turbo profiles with capability detection
Message-ID: <3SOm0HnyWN0AInTQy7p6wOD8l4wLWAG5XId6wxxr71aki2UhLFy10kdFLiGbqSynyet8MIDJCMo0qZr-pMeOflOi_l1fZ0Xkzr8Bxk-DHCM=@protonmail.com>
In-Reply-To: <69C3BBDEF214121E+20261118161311.17252-1-12313607@mail.sustech.edu.cn>
References: <69C3BBDEF214121E+20261118161311.17252-1-12313607@mail.sustech.edu.cn>
Feedback-ID: 19860221:user:proton
X-Pm-Message-ID: 57b35ab4070d4ef3ecd50264f54a4c4b28c9f30d
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Fuwei,

I retested v2 on the same HUAWEI MateBook 16 (AMD Ryzen 7 5800H, DMI
product name "CREM-WXX9", BIOS 2.32), this time without any DMI entry.
I applied both patches unmodified on top of c339f4010dea and built the
driver as a module for a 7.2-based kernel.

- The capability check finds \GTUB and \STUB, and the profile device is
  registered. Loading the module did not change the firmware mode
  (checked by reading \GTUB before and after).
- platform_profile_choices is "balanced performance", and writing either
  value switches the firmware mode (read back through \GTUB).
- GNOME's Power Mode menu (tuned-ppd) switches between the two.
- Fn+P updates platform_profile in both directions, and 0x2a0/0x2a1 are
  not logged as "Unknown key pressed".
- When the charger is unplugged in performance mode, platform_profile
  follows the firmware back to balanced.
- On battery, writing "performance" fails and the mode stays balanced.
- After plugging the charger back in, platform_profile still matches the
  firmware.
- The driver logged no warnings during the test.

One small thing: after Fn+P, platform_profile changes to performance,
but GNOME's menu (Fedora's tuned-ppd) keeps showing balanced. It was the
same with v1. I haven't checked whether tuned-ppd listens for this
change.

About your first question,  on this laptop the capability check is what
made the difference. v1 needed an extra DMI entry here, and v2 works
without any change.

Tested-by: Eren =C3=96zen <erenozen@protonmail.com> # MateBook 16 CREM-WXX9=
, BIOS 2.32

Thanks,
Eren

