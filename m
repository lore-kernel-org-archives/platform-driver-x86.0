Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794743763;
	b=Xd4TcG9HxJLYZHJjfHwu8PVp+lIpwmOplMFq5MCDwIkOZQYZ3h44XC9zfyuCVxMlOPFe
	 qa7yXyHXwGBByNStNmj+MsyzQm3GwvXUY8FOnG2L1mWnGtqXy53TDCb0sIiaVoGHhLDcl
	 /O3N3E2xVxDXXFHmVyleNP6nvPDEenTeVVkFfrRiNVtRCiC4XeWRD6R7jlz+J8BjpWL+r
	 VmQTyDqy4xKSoxGuKy48xaGp+seqPTM9f3F9WvZ3PtoFuq/i3CjqJDPon3y+H42xlfjDZ
	 EwF7xfM1iWd1XGWT5uPaolDaUjMGsxgCXySEIDAL7GdvrPBy7Vu5u+OS+MIH6shv9Ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=DcZj323bZhr2RPb3W8Nx/e4hADQ8eqTgk8RkWPbabR4=;
	b=i16Vj3dneDSCpLbiJzhnB4G34FAvMnqKHQ4l+gAkzr7fKLUVkxMtCGbe36JZgbwNLMMl
	 cW4xTVSQ58/jYJTMQzKJPvgM4JYJ+NlEi5ePaAuOeop4tBVbg3ucL1gXo3q794LEdPgjA
	 6AHbrcm8WBdl/R/oyVL2byr5Kx8yWA6amrEoY5oSC6DIyXz9m9p9w1po1RTRIFUnIh7bX
	 RyBHXf7Cqi3zGVUzm3I8n4d2WE42fkMjnWmygX0DUXClCW0bvir7rOKPPiP4+NJd3vQF6
	 wdbxtVqGN7PvJW4HrjB/kBjvsmix3eVWWIXeUYNXT+26auLggh3EQK29w0WWOHTjXrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9Q+sl4U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3D606A33D
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 11:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB3D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9Q+sl4U
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50cc7540b7so57023366b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Nov 2026 03:56:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794743761; cv=none;
        d=google.com; s=arc-20260327;
        b=JmiThdk2U7SOcE+r92vCTcpgDGOVZnETqbR4K40FwBOIxIoTg2MJjn/RYAwl3lpOQ+
         L6UXhMHfrXZyqI9vxAPldGwMByhRI6qpVnb5cIA0ZYyZNop2RU0wwvPTSrhnWlGxf6Lr
         Em2Vt3KLJTLhVwcd5me9t2OR4KpH/TMi4zYDzxhKoFeWGYpeZJS2VBBXhpBH4WPnX5oJ
         Ko9+tTZhw3jillf4FpkpBSKlMWWnFyiltvKrClAaldKjpfGsFik7pVTo7OOkykBnJXbr
         oMJIaRejhtG1Evxv9nW/CgQZPQA/El0Cb/FAOvFVtcmtfCIY1ueGC8fbohIw+XBF0pc4
         hV0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=DcZj323bZhr2RPb3W8Nx/e4hADQ8eqTgk8RkWPbabR4=;
        fh=z8ob/cwuasDAfa+r4DzpjG6nJftdUT6QynZVuVGs+Lo=;
        b=rKDA651DxzfCb794OFAkRBXlmUEX9WUsEr4reyAcLw1VB7jRHU1/ZRG6qU5eIC6vIu
         GwjnZH1yhmwy+uOb91jXKR+SzQDkWKkbKQIYfC6UDHsUkHLtg3UXmTKpUXCQy6BlPvlL
         AfJEMyE+upE3GgHEU35+PG0H7EzXVTQ3xRI1xtomJl5ddkHSR0tmIr4aAg9H826NRPfh
         sT1esCtB3JaDKpV3kEaW4PdNJNKJZCfma0/qlUqm1hCzU6OaoplT7Htdmf2KlsQY/aSg
         IQTqTEtvfwql4HRKyM8LqY+jGIPC4mU4jCQe0jBj2ZbVD6vOZNZv+qwoVhfr7Rvw/kHG
         Najg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743761; x=1795348561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcZj323bZhr2RPb3W8Nx/e4hADQ8eqTgk8RkWPbabR4=;
        b=y9Q+sl4UDdP1dZ+RGdjjMnFg1HIgE9Gjk8kPMowSI1RTz8naQMREXIHKlXV9N8aX2q
         eZhrPrcocLRcLN9WYCTOsQ1HOddvv/LB0Z8bttXyZMAi3uS2IjYD6TEAIt8wG2lKW5Hx
         i7wVarSD8JGN1r9thN+JGyAxfZdG/vHHwwJF6A0CtDX5KTKsbagnBtJlxHla/RwbBAHa
         mx6JPXQ9a5gOLBs1EDW5IBC9JvVtWd+7qEDdjdrpNe8OmkhzDSbZn0gsce2/wK9yKHTJ
         vSAAjPwnT5qWMFwSMwEsVSMuUhhvtzlj4QCT/+oP3kA64IjTouyy/VsJ7uLwwEH6P7wQ
         qC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743761; x=1795348561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DcZj323bZhr2RPb3W8Nx/e4hADQ8eqTgk8RkWPbabR4=;
        b=qyFJTtqk4AhPOr9faQmxAMGQUEwMembLEFbk8VRyLLxMt3tl7Hm2bdF5SJAxdXyh9k
         QZMW2kixTYz70rjy1dGV7tuqHwns2PUj62we3PIxpmx/THtNeMW/ZvdeHydhVxyxcpO6
         xo28XQSrroi3vyla9IsfmJ83wUlLS5hvbKKvKIGhT6OiHRck36q7MOa0Uk8z674Q+Cdp
         hmD8B+prlQAf3SgE/tl7X09n/MG95CBJld0064fNTmN2POUOMOxA3SZwVAGwovXY0ZwC
         mdAnLsNNlL8L6tHlGN4uOa4y0NSO8Pbfz4wpeFI+wqgCiOSnX9leknYhKuquWxyHiEjH
         ZUsw==
X-Forwarded-Encrypted: i=1; AL+hErEowYzBzHP+Uid0oiXUTzc2zlj/NPraxZi2QyhIyg63tHj97NbHfcbCd1q+SBdiAhv288QFjy+B3EaxdbwgtSfrhnWH@vger.kernel.org
X-Gm-Message-State: APuU4Z/6CXATJW39+Z7thcf7BHarPMc/En8pJjHP1gf04YSO/umDFVjk
	pH6eqjb1u/IfrQ6IUUzJcAvq55x62x6QDc0b7/zWtiN5rSYRJA5Edrj6fUNeFRkXEbz09dsYwGx
	/xhdfoEK8OZZckWUBe4xTnppzfBNzq3rmwYC6m6U=
X-Gm-Gg: AYBFou2w2pu/BawpBlXHX4gtHaM7N7UmbZa9ViqQLETM4nE/6bmrdSUhW6NqvKheoU5
	jLao725Xirr2VN2hJzBvHVxlSbGMxkuykHmPTySfslZm0lCCpCwAvOakliByN1V+IluPeX00+wR
	j4nXoqq75ccFzQjjDWVXo/zKXIGhDMSAJlWKhA6UT5jwQ++G4oAkOGoRDqcp1ShESlbmkCzB2TA
	DBr03NO0+jHgwLjOtvgG9fcRFtrcJN9J4hiVbEgb4XXQFqRXTBkRzuODHAnlpuJOFbZ5YOxjupQ
	QevyHFFBfWXGtbse5XZ8UalZZO8iWyANtxBZBDDVMGVSgJrDraS1/x74n5kwiFY/D/972nWDqUX
	95bLr+k32BX7GnH45El/oO7ndPH9p+Jak6zcmkSk=
X-Received: by 2002:a17:907:60d3:b0:c46:d493:501a with SMTP id
 a640c23a62f3a-c50963427abmr712093866b.22.1794743761122; Sun, 15 Nov 2026
 03:56:01 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: skyedryv <skyedryv@gmail.com>
Date: Sun, 15 Nov 2026 19:55:49 +0800
X-Gm-Features: AclHuK_8g57vUNNcN8WCMoxcQIvtE3ah3lY4yYDivjNSAjpdIXdf2fRwg08yWIQ
Message-ID: <CA+Bqb3R2ZCrZZr6pUqLmw3qXMSA13Ft3nYqCx7jv+5PDEuH0uw@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: asus-wmi: fix camera key LED on Zenbook S14
To: i@rong.moe, jose.guilherme.cr.bh@gmail.com, git@turtledev.nz
Cc: denis.benato@linux.dev, hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	linux-kernel@vger.kernel.org, luke@ljones.dev, 
	platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rong, Zane, Jos=C3=A9,

On Wed, 2026-10-21 at 20:34 +0800, Rong Zhang wrote:
> Still, could you confirm whether pressing the camera key during s2idle
> toggles the camera state without emitting a WMI event or not? If so, a
> resync should be performed on resume.

Data from another model: Zenbook S14 UX5406AA (Panther Lake), BIOS
UX5406AA.310. I applied v4 to the asus-wmi in CachyOS's 7.3.4 kernel
(cachyos-7.3.4-1) and loaded it in place of the stock module.

On this machine, pressing the camera key during s2idle does toggle the
camera, and the WMI event isn't lost, so v4's event-driven resync covers
it. I tried it twice:

  - Stock asus-wmi, with a userspace logger on KEY_CAMERA: the press did
    not wake the machine. On resume, KEY_CAMERA (WMI 0x85) arrived
    within about a second of "PM: suspend exit", and the camera was
    disabled.
  - v4: the camera was enabled and the LED off before suspend. The press
    during s2idle lit the LED straight away (it seems to have woken the
    machine this time), and after resume asus::camera read 1, matching
    the camera state. No userspace resync was involved: a CAMERA_LED_NEG
    read a second after resume returned the "LED on" value, so the LED
    was already correct by then.

With v4, the rest also behaves as described:

  - asus::camera is registered (max_brightness 1). CAMERA_LED
    (0x00060079) is absent here, as on the UX5406SA
  - the LED matches the camera state at load
  - on camera key presses, the LED, brightness and brightness_hw_changed
    follow the camera (1 =3D disabled), and video goes black and comes
    back
  - KEY_CAMERA still reaches userspace (WMI code 0x85)

Cold boot: on this model the firmware re-enables the camera across a
full power-off. With the camera disabled (LED lit) before shutting
down, it came back enabled (UVC privacy 0, video working), with the
camera and mic-mute LEDs both dark, which is correct. So the "dark LED
with the camera disabled after cold boot" case doesn't occur here. Not
tested: anything on a model that has both device IDs.

Tested-by: Sky Dy <skyedryv@gmail.com>

I worked through this with help from an AI assistant (Claude); the
observations and logs are from my own laptop.

Thanks,
Sky Dy
