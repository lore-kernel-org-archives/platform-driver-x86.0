Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D151A8F7B
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2026 05:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784094148; cv=none; b=RBEzyRFgqZXe7bwkLk6mAkblGUopm6iBzXzlV3l8SHYa2NDG+BvL8c6ZO7ro/Xsj+kmmR7sEHiJrv9wYc8y1O9fn70R63O5Btm1O6xlzuiW4G1g30BWwafJz3K4KcLhZwstcssgAKxej3bCHchnLeVYvTqBSbVWzAMqwEdJFtJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784094148; c=relaxed/simple;
	bh=3bPhLDGbWOmTtWrpnmGN57m2PA8lZOwCGME8OXNCEd8=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=jO2d0g8ML/p4ErzulxIrQlmCSaflVXYSiwzJ5/fFvwDTYaoC7YY+t9h0OtK6VwFLYEVUbg0G9I3t8OPElzqPJDXj8BQVTtOCA8RLpc56Y8SPJJAS+kMizbw+kJNI6k6ZLTM58EW7r7q4r5uqRLrbmVe7xtlWBRpPWtHrF8xV0vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidrodgers.com; spf=none smtp.mailfrom=davidrodgers.com; dkim=pass (2048-bit key) header.d=davidrodgers-com.20251104.gappssmtp.com header.i=@davidrodgers-com.20251104.gappssmtp.com header.b=gMXN0NyW; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidrodgers.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidrodgers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidrodgers-com.20251104.gappssmtp.com header.i=@davidrodgers-com.20251104.gappssmtp.com header.b="gMXN0NyW"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8051ad12d23so16812287b3.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2026 22:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidrodgers-com.20251104.gappssmtp.com; s=20251104; t=1784094146; x=1784698946; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R6qEG6fJET8On7DfjD65+6lcE/pVRwMU1AfHR/cJgTs=;
        b=gMXN0NyWTaXmJbA68jirvTy5+H0J/N1bDL+wMhDx1B9pbzZWkHBJG4MHxoB64qtabI
         /KHJaKrGzNF5DvgG6NU6PIkCYP8TFUcUssahKRVNBRlrM1dAmhPQ8kOvMZ9cZXxOAyxQ
         09Kfl/T1TTY/gLB+4VRXo4AX/ExF6DiUCTVuFH4yJUOy/VOZGW2qTe9jBCH2Uy+MFvZv
         K9AaP8+R/S39KcJ73zeDQznINkHv715RwAliDTX0QCmlzxhVsQZCQK1LgCnMZ6DQdnKc
         VeFMo/YisYawOqPe+xQh7vaSOm4Ywqnd/5JKXo8rZgwCOWpX6tpAHzQHP5eglE9VQrAa
         baFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784094146; x=1784698946;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:content-type:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R6qEG6fJET8On7DfjD65+6lcE/pVRwMU1AfHR/cJgTs=;
        b=PpxF/ckBlqVKjjsl3B0i77EoRD6Td0eAteqMeWUHWimLtZSkb4Y8drF4/s1BOtd2pL
         xOndvMjG2tL9pMdPPpErO8Im9sCnpbdHGFEU0JWrpy64klGGOGLS5OaX1u3/FEKEyyvY
         msbZGOHsbP9CWfqX34xAXG0mXLQuVsiQyNCQin/nkk60Zm0YONOtUq+YDY6C8RmOnm/T
         JswJ1gK++wZs35dRuCX/YgLcHnemi8Ip2O2dn+epCfKJ7ErAmPnV3Sv8kO1ru7sPin0l
         6K4hwEXRN7yDeXAOpGV9gd6fZQL0iDK/kRVfOC0io4xkyW59PRLDmF+k5Y6R8MnNs6Uz
         BkwA==
X-Forwarded-Encrypted: i=1; AHgh+RqAv/TuRmq6vpnHLQ3o8DumajNE9yYs+JwgyvA3C0007uw53ouBYQjXRPGV7ez0rJpfa4J4uaYimjQfbz21PgLhlVjJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/VHH1ucf3ja2Wcsqc9Y9DECjvkhBti+4uivQc65iU7JBVBdCW
	rTeNMI7O4yv3gqjI2cEy4w4mJGELIqeCNEX2njUA6RKJ+9vSTKvxebBtMrgW4FZAWQY=
X-Gm-Gg: AfdE7cl7OrIsi0Hxe7usFw/Lau+rSNwM2ODfXmnnu3YO/oqvl8cTLQpVJiyqW16SKQw
	uwcutp65zpwWhktPGfABv/RpC06pKASWH0grj6RUznlWx6wy0lxQjtOKF/CehZI4QwLT1VULxsd
	or5MjwimXXOkKsWJAkdr5SNEMRr1qNFkcFRmDDMn1gd4s2+MJPd4GF9B4mzaPyQ9hROnVB1Ob/H
	llUnqHWJLwzcHQDvNUausYEJGnemGXTv9YznRNizweIz/lWhE1JUqnhfJM+Y1KJAYNYgHtM1ApP
	bRNuHZzqRK2mjsCP4yyTS09kyVDku0G5Ofvyrq81cI7zeppX3qTHy+DWaSQb0Kr7nkfpmtgHsaM
	etaONQ7e0FAF7ef2RaAPRl/qd8IMdGfxViA+063jdfgBB154RTSI4Y49DgSoDb0LaukoR0VVwcw
	hFQabXwdY/AubaYvBqQ74km9+t6FoSRviLPylEg/U=
X-Received: by 2002:a05:690c:ed5:b0:81e:89b2:91ae with SMTP id 00721157ae682-81e90033b3bmr128896577b3.21.1784094146085;
        Tue, 14 Jul 2026 22:42:26 -0700 (PDT)
Received: from smtpclient.apple ([162.230.155.43])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6be9834dsm160690227b3.9.2026.07.14.22.42.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 Jul 2026 22:42:25 -0700 (PDT)
From: David Rodgers <david@davidrodgers.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: amd_halo_led: writing 0 to brightness bounces to max and clears
 multi_intensity
Message-Id: <B1A2836A-FAAF-4E5A-8F39-166E51B926C1@davidrodgers.com>
Date: Wed, 15 Jul 2026 01:42:15 -0400
Cc: Leo.Lin@amd.com,
 platform-driver-x86@vger.kernel.org
To: superm1@kernel.org
X-Mailer: Apple Mail (2.3864.600.51.1.1)

 Hi Mario,

I picked up a couple of these =E2=80=9Cai halo dev platform=E2=80=9D =
devices and I've been using the amd_halo_led driver running AMD's =
shipped image: kernel 6.18.35+rex+2-amd64, BIOS 03.03 (2026-06-10). I =
think I've hit a bug in the brightness handling, and=20
since the driver is still under review on platform-driver-x86 it seemed =
worth reporting now rather than later.

Writing 0 to /sys/class/leds/amd_halo:multicolor:status/brightness does =
not turn the LED off. The value bounces back to 100 (max_brightness), =
and a moment later multi_intensity is asynchronously zeroed to "0 0 0", =
losing the configured color. Because=20
that second step is deferred, an immediate read-back looks correct and =
the problem only surfaces on a later read =E2=80=94 which makes it easy =
to miss. Every other brightness value I tried (100, 75, 50, 1) =
round-trips correctly; only 0 misbehaves. Writing=20
multi_intensity "0 0 0" turns the LED off reliably, so that's the =
workaround I've settled on.

  =E2=96=8E Repro from a known state:
  =E2=96=8E
  =E2=96=8E     # set a color at partial brightness
  =E2=96=8E     $ printf '0 0 100' > multi_intensity
  =E2=96=8E     $ printf '60'      > brightness
  =E2=96=8E     $ cat multi_intensity brightness
  =E2=96=8E     0 0 100
  =E2=96=8E     60
  =E2=96=8E
  =E2=96=8E     # write 0 to brightness -> reads back as 100
  =E2=96=8E     $ printf '0' > brightness
  =E2=96=8E     $ cat multi_intensity brightness
  =E2=96=8E     0 0 100
  =E2=96=8E     100
  =E2=96=8E
  =E2=96=8E     # next brightness write reveals the color has been wiped
  =E2=96=8E     $ printf '50' > brightness
  =E2=96=8E     $ cat multi_intensity brightness
  =E2=96=8E     0 0 0
  =E2=96=8E     50

I can't tell from userspace whether this originates in the driver's =
brightness path or in the WMI firmware underneath it =E2=80=94 =
everything above is black-box observation via sysfs. Happy to run tests =
or try a debug patch if that would help.

One unrelated question while I'm here: the driver shipped on this =
platform registers the LED as amd_halo:multicolor:status, whereas the =
version posted to platform-driver-x86 uses amd_halo:rgb:light_bar. Is =
the naming expected to converge before it lands?=20
Anything hardcoding the sysfs path would need to account for that.

Thanks,=20

 David Rodgers

