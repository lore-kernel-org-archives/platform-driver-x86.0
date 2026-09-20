Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F168B3C9EF1
	for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2026 15:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917336; cv=pass; b=VZ3eBg2b6nL7tIGxbrFgVEv/ld6hUQan58rou89yR2MxcNMoXwvUOtHqypeYAx3ifNcxMrB3Sq1y2rnAaIoBBIM9ZT9fyVleFWsZnMqb31MxI4bcT8a1rqqiY9syqdnUZwlSf4L25vjwLWAKLEWxp3q1CiQP1I2Dxcp8VxEBbrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917336; c=relaxed/simple;
	bh=Mgud08gkPxQ4NnmvGTXskBie38O82h+Pa0pzGaRLVXA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LWAIKoF6CKA83wPhFxfoK8io3u+kyvWPudT3WA7e62i4DlSWVANcRbwYAezHq4oPn4wiP4gDyNx3KNubxoyQY8R7RpZ86XvGCwuXfjrM6bjxaFqATg1vIjBAxcU27cmVSdtFoFBo1SXtwRSIWTsUk3d3Ivk9xEetyfbUyYtU9wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Icwqyh6R; arc=pass smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Icwqyh6R"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b28d9537bcso1447238b6e.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Sep 2026 08:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789917334; cv=none;
        d=google.com; s=arc-20260327;
        b=nAkXUZ6Nk+0XB7RQp1hvktI5BmDgwiAinmrhRPjeiXDOyockhDA1fxmhu9Xl0luwns
         r1u+7LHbLbd8MagCLySIg8lvt6hS4pIcjIteNmQwSas7CpEEdfRFNiUm/SXjrZzX/FdF
         G2C+HZog5u6YCM/IrXHS3JJCI1dD54tUHGTvSdVTWkVjW1Y7wrvQtluii2mcK2qqkfbI
         JGw85MPzdXQEEG1q3/2PzPlR+dU5m+N2qHF+pmANydNriKxPlm83dcv3xMDvuvRuNEre
         R8qecKexb5ozHObEq3GNFAnmdiiyAtzZqZkqHnfFQXVa/7odp+iMn85YDD0mDM05gpdI
         wJ0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Mgud08gkPxQ4NnmvGTXskBie38O82h+Pa0pzGaRLVXA=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=dxWj8XFIrn6xaGbxAHAmTTT5P604lhsaoFCmVbyJlhg21afYBECltFaOjEkz0elVWp
         qFmHhZqBZyiX9/gDmLIS7o6jW7mWe16NuxatNWqVNiCVLwjc1HHxAP8TR5EsGbqmVvZo
         yQc5xB/y6sYnVqypzyy4HEqYYD7wibpBJxphZRsmOIIUrAKz5PzhuqkfhVYrn3ACBBSZ
         Ajym69Wi7/yxLAq3pDEqX74VxphKg490CoQCRcB6EG6s78Kxzy/z2VGgUUx/ygRu6/+x
         NoH7InPgX2HKMjauwVsHjjb/8CBP1vSmGwgGbTkFH6rSwQgSWV869YKHsePERQgUQD+Z
         F0jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789917334; x=1790522134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mgud08gkPxQ4NnmvGTXskBie38O82h+Pa0pzGaRLVXA=;
        b=Icwqyh6RT+QA6T2rzAGQrAC+CHToMcBie+56dbM2x2mAme1vT08ksBxsLUf5WFVuTK
         p/n9pXC+yUX2OelH0/E2dbOcq0g2A5cPjy+4i3JyiK7a3ZpeJ7mrl6dxTnJatPiVoFNr
         I0uRgZF0XQ4XpoOA7NA8xR32M7uP/o/9Y1YV/B3oMh4M7xWXHdJgiSe2JhVekvQRK9XD
         50ovwJgEdlXpP2eAW2X77pL3QAqRQuBAnuc/JkzElg0awgGf7EZ4+9KA63zQJMyk6R4b
         utVRjB71PjcLnDJ7LXllDTm7nbNoBYZSaprMxzF759+isCyMS3MWDThdlcoGN/r84zRY
         ui6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789917334; x=1790522134;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mgud08gkPxQ4NnmvGTXskBie38O82h+Pa0pzGaRLVXA=;
        b=K6hYQmJZUerXMnsJbW4B5Xe+gdStszEIXN8ZCNioTTWTOCzAvOrhhLDl32O+s1pxjJ
         Ri133V3KBJJoFVHduhra1bVTFDf4UuozNXo4UNjWMjYpGS4cN5VbMyVO5ygukyC6BdrM
         BPuerFbSOcv+wgysbDmFJ+GRkVO030Tur/8THiFvwDGCdGNsD7ivEfDXWD1R0RE8ux97
         WPE45CzNFQQny3GloSPpa4N6ARoewtbGuyhBGRqZAtW1+scPyq3F9DoS6713OM38QpF2
         gtjo8J/G64skqeHLtAqbu3LuRcQ5GugzUOFY38ra5+2KtpHyjRCk2eN18kbQsg5r+fHg
         O9Tg==
X-Gm-Message-State: AFuF++lgg7NcIwS5i/Rj7qBisQUlIFy2VRt5UBcuNzVOcc1xfFlDWy6K
	Ih2uV6fON17bJZ2urCtzy0pcGms5nuS6jOjhggI5iwZSp5zYuohpDMqjj9v6Urk+gracFiVHqxd
	NedXfUESoN2ZsdgttNWpNrjiVc9vJenWplbFX
X-Gm-Gg: AYBFou3ZAle6hboy//CMnvviIIcE5LWEOUhBZhYxYGVd4IJMF6bczYgmZX73D/Ytko1
	wfff/oIgKgrC8gu+EMB6lHVZ1oD8QASa9x0/0plcf67NHOstwQ/vZo8U2gq37dxvyNCBnpaLwoo
	Em1Gv2K2S/d991kM8gG3V7nV8K8F49ttHFGUZnFoxx+NiubfnirRuTY3F0DKXr0Y+rN22MTcmMX
	ZAeTlnGuJ/YgNO7ZnfAQ65fZjD5vCsPdBQYu5zRtCTb4EOotZAQ6Pp2VpgwC97V4pu8CaNPoQX4
	p9NHvOMO9tKOVagrAnKz2xinX2uKo7CJgMiEYpuzb/tYxW5vypBUksqLzL8JsX6q2/7eosegOFH
	xfb4+tW0CAg/o
X-Received: by 2002:a05:6808:6d8e:b0:4b8:4703:db8a with SMTP id
 5614622812f47-4cb69b98d68mr10643228b6e.19.1789917333824; Sun, 20 Sep 2026
 08:15:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Dan Z. Bonomo" <d.z.bonomo@gmail.com>
Date: Sun, 20 Sep 2026 09:14:57 -0600
X-Gm-Features: AcwNN1U7Ph_xWQvFErd8UTWH-xee-XmaMh2Vgz4qS9qVQiSe0V7kuRg6KA2NInc
Message-ID: <CAAkqa_bGiUUkTC8M5sQVyL3FGwsEBRkcYKhSMRi92gP_1Dq3VA@mail.gmail.com>
Subject: System76 Pangolin (Phoenix) needs delay_suspend=1 for working s2idle resume
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey folks,

I had Claude take a look into why suspend wasn't working for me and it
ran into a note in the kernel's amd_pmc driver that asked me to report
this:

"amd_pmc AMDI0009:00: Delaying suspend by 2.5s because delay_suspend=3D1.
If this solves problems on your machine, please report this whole line to:
platform-driver-x86@vger.kernel.org so it can be automatically detected
as affected in the future.
System Vendor: "System76" Product Name: "Pangolin" Product Family: "Phoenix=
"
Board Vendor: "System76" Board Name: "Pangolin"
"

Here's info on my system:

Laptop: System76 Pangolin (pang13)
BIOS: APX928_V00.01_T0008ASY1_ms
CPU: AMD Ryzen 7 7840U (Phoenix)
Kernel: 7.1.5-76070105-generic (Pop!_OS 24.04)
Sleep mode**: s2idle only (no S3 available)

A summary of the problem:

Without `delay_suspend=3D1`, suspending via s2idle results in the system be=
coming
completely unresponsive on resume. The power button (short press), lid
switch, and
keyboard produce no wake event. The only recovery is a 10-second power
button hold
(hard power-off).

This also manifested as a secondary symptom: rapid suspend/resume
cycling when the
lid was closed. The system would suspend, wake spuriously (EC in a
broken state),
see the lid closed, re-suspend, and repeat =E2=80=94 causing the screen to
flicker on and
off in a loop and draining the battery.


The fix I applied:
echo 'options amd_pmc delay_suspend=3D1' > /etc/modprobe.d/amd-pmc-fix.conf
update-initramfs -u

So far so good, it seems to have fixed the suspend issue and I haven't
seen it stuck in a monitor off-on loop since then either.

Hopefully this helps smooth things over for other Pangolin owners out there=
!

Thanks a lot,

Dan Bonomo
