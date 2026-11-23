Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795476437;
	b=AKyaPH08Bhh0TgoVCCP8XXHIX9Pc9TYcuRM4ZwlORBKiKe5/NW6KxegbkVduvy6BzdKm
	 OyB1YAhc7y8u+D9TGmYoQmOc3dQaJvuejGfPUTzP9dS28vq3UNnF6stjsIsfn8xf9WcHn
	 c3TXyZeZGEU2STidIyFr/j3iIETvcbI6rOYD96tnoavNW9CflmlA5ZgFV2/3DFFL+8eqF
	 usHHIJKVYHjCZlqvK7fj/tov2QhDW8XFAN3en2qU4ZzwXBL6GeWJzc0fj6XXe+521qvjg
	 UNxbvgLHQMTTYTCQhpMtyir09rfNKUNk5n6UnMZWUnpeMBQEjD1bnSHU68ifgSQcJZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=ZuaNBh6pkcJ/82GdHcWJ4tfu5uUzu4/Xw5l2qcnwFHA=;
	b=V/PFFkJW7g/HmHnf/+NxoNaqyoYixSlgGjLtl2eisVQodh1F/nAukbppTF7Bbpk/3YGr
	 vgjFzU4xQHEPJnOMNWzfPFVBw+PYuQORiuwFofiFIMhgZuzQ52r8KKUUp9hlKHlzGIpPE
	 hbNyShac/rwE7+2o7WXK81JM4NEqZd6AeTnY9p8v4RX59kRF51K//m6CamQJPy3B7HmK6
	 gO8T4dc3SpU4Bs5lr5f6v/7kHlX6mQuA+By8q26EnCTxiScasc5te5P24AJVIRHnfN/hd
	 mMPsptEqQAR3iL/ElEuJNOfdr6+zcbeC4eTcyIFLg/u02VzcIDR13uh0+EWiNUA8dHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFezoO2N;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0146C606A321
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 23:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0146C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFezoO2N
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67da7d18f2fso4403001d50.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2026 15:27:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795476436; cv=none;
        d=google.com; s=arc-20260327;
        b=XUnJcSoZyo/zWLuZHPvgjoA/fau8vKSDp+npXlO6kv2PY6qo+T4bwlrCHB5DBJ4/tc
         2V7Gtrq02SJfuzkAfJ574fMUwbFngWHN1TBVp/rxi+R/HBILD8hSwdwyaLlxU6f3wp9e
         Y1BnSRhTX8xO3c+MDX+97WXEteieSxShHwDMekZocVQnsy6Y6VXA05naMb5jPPwBybu3
         IkICPSTaMegI3+E28jQNYDUmw0F4UxDX3y9q3Zj3vOOI1VgDQU7fOvQ2Y/DOEO2N1dOW
         h4DXXXCa6c1Nr6T/0iY9CTY3jpCiYZtBAn0evm9KE1EV2LTGMZrcueH5KGBrYlbYiVs+
         v/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ZuaNBh6pkcJ/82GdHcWJ4tfu5uUzu4/Xw5l2qcnwFHA=;
        fh=+Cj6E3aY/f852krNL+XerTCyIWzbt2GewUzogpeiEyk=;
        b=W88RV2jxvmanKC1Uz0/A/T+c2Hx/aBOvJ8NRApRdZIo/hdfVYhGYh/JFQojUZ26YXD
         STggXJRgZuow8mqKh/cEb2c+zP7K0dkQfAS2FSlQHmTf4pzLQcMRCKiLnu4LqSqASFc4
         3dykcYw8WKa59fceYNJXinZxN93AHshwckWajLrjmXhPtfgDOH1ksVy/9ZmiapQxX0gu
         f6VMhiJtx4H42qeQka87uHLr48FdUF2jA7nJxP4I6/QQvNeogwI0SxwAYiUNGGIXXbnU
         iH269O3K6rsDIxbmgIzpN/9jxmKSe5zfaGv1dW8OeFUdWzTRIu4NuTQR/JKOWVkF0mAp
         wyjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795476436; x=1796081236; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZuaNBh6pkcJ/82GdHcWJ4tfu5uUzu4/Xw5l2qcnwFHA=;
        b=lFezoO2NBjbOSWwbx9cyt2GR9xQ6nOxGpKuE2wAuIoVbVbOFVeSxKKa/xvLGdsLQxa
         n6lzgTAANX+ex7kKU1KCf6QIoZXUcn/QxzJKdHn2OUmhrVcDS6kgSrCTHV9Hqg0UprlK
         z1YIR1ZH503kFhBSG/L1yvAOnN0xQD69dJr7o5X92KKXzZGDSEXYM4qi+WonbVkUwy19
         U/ANFEMEZeZrAzYtE4dQ0Vx6hTBLHiaMN7H+LAXXi1NecGB8lYnZtWnvGfFGVLSJgak2
         ullyR8MrRAt2PFwNljaWmqvWzTIDzu3L6GpO2O07aSGWUUE+XwhQNTlLk3115NtA+aP9
         Zo+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795476436; x=1796081236;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZuaNBh6pkcJ/82GdHcWJ4tfu5uUzu4/Xw5l2qcnwFHA=;
        b=sSbnu8u92Q8XQSJDz4hn4XpNC3Lwfso++vzCBiWCE6RoEPq1k1OHstprOi8SaYNzL8
         P3ClH9bF3R+au/aAz5wVHWMb+jnfI6oB6K3Xgbc1EUY0fUa+ynsl7csj096HUi3SNrBT
         lkBVCSmDWJPIQrSfdnDg5nqBC07mo8klphBVuGFlMVv5yhowhswLpiE/llgrdr9PJUMC
         zyE/8jip/RjG6soIMmcUD7gxQpvD7yqHU2T6ocEIefzEUkalpKi9wkHhyr4VOVlagqjB
         m688+whYoRvp1bZ40QMte8dp6h0Q3baIHyx2maptwqiVLIs06/+Zlw5smuoJBHnh0H7Y
         kdwg==
X-Gm-Message-State: APuU4Z8LWIp9cKGqM9ICvmtl03U3VP2ImLCyLAA5dtAGT4JNn8KDlsTq
	bF4tpvywrI/8wM+aRMAk5XhDCy56jfdzDBdyenNqnBIEx86/pdMToDDfxWmcv/oVgKBmHEkx8TM
	CCI9+VZKPHkdh9LdzImRKrTvqPzzp0Lu8zCtIsNo=
X-Gm-Gg: AZFdTZegX2iKPxHKmSR7ttOY0kiuZMRpennGmRnHmSSTY0Y7pcOGw9XaTSUEsiuoY4u
	hKw9xJVhhsIPc8gvNyfHsXuwsRZxGimKUkhXTiBamd3AgLyBLouQ/1Ce9j5EHlwgO2Wx632J5HP
	ptBQ+zXKIZCCcbCm9BZ3sA0DY6SVU251Hko8fmvIP1eYlmhJ1wc6bwxLax9/kuqPy4jzCk+by8N
	Mvi4wqcuDde9i0H4nbD9lAXklFapHKES7K8jylCZSNIJTIF1pH6HAEFrEXRcoGBRJhQHolc761i
	l8lWnpGq6R8jO0Q41f4iE5MjWBu0RSUhW10Gje7PkdHGj82BJNULKXAFx29E46QyQeXle7/oMZX
	+N8ihln0MilI0B0LI9qMHnHxa2Q+ReXK8UJVCLA==
X-Received: by 2002:a05:690e:4814:b0:67d:d7ec:565 with SMTP id
 956f58d0204a3-67dec420419mr3923630d50.13.1795476436059; Mon, 23 Nov 2026
 15:27:16 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?Q?Riccardo_Zangh=C3=AD?= <riccardo.z.dev@gmail.com>
Date: Tue, 24 Nov 2026 00:27:04 +0100
X-Gm-Features: Aa3M54o5GEwOqBfEtPm2l2KM1CFzpqc22tehqKHIdacZtC0LqG3L8T2gE5Q7iOo
Message-ID: <CAMnz_-Dgg2eCgZxcCaGuKPV=3-kCfg7ajd9w=vs2fGL-Cb6hvw@mail.gmail.com>
Subject: [BUG] ASUS TUF Gaming A16 FA608UM: working backlight device differs
 between MUX modes
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	"luke@ljones.dev" <luke@ljones.dev>, denis.benato@linux.dev, 
	"ddadap@nvidia.com" <ddadap@nvidia.com>, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

On an ASUS TUF Gaming A16 (AMD iGPU + RTX 5060 Max-Q, MUX switch) no
single kernel command line gives working brightness control in all
graphics modes.

Laptop: ASUS TUF Gaming A16 FA608UM_FA608UM
BIOS: FA608UM.311
Kernel: 7.3.5-2-cachyos
NVIDIA: nvidia-open 620.73.04 (nvidia-drm modeset=Y)
Distro: CachyOS, KDE Plasma (Wayland)

asus-nb-wmi exposes gpu_mux_mode on this machine.

Observed ("type" in parentheses where recorded):

1. Integrated and hybrid, no backlight parameters:
   /sys/class/backlight contains only nvidia_wmi_ec_backlight
   (firmware). Brightness control works.

2. dGPU (MUX), no backlight parameters:
   Same single device (firmware, max 200). Writes are accepted but
   the panel does not change. The kernel log contains:
   "nvidia-modeset: ACPI reported no NVIDIA native backlight
   available; attempting to use ACPI backlight."

3. dGPU with acpi_backlight=native:
   Only nvidia_0 exists (raw, max 100), and it controls the panel.
   The message above no longer appears in the kernel log. If
   nvidia_wmi_ec_backlight.force=1 is added as well,
   nvidia_wmi_ec_backlight (max 200) also appears, but only
   nvidia_0 changes the panel.

4. Integrated with acpi_backlight=native:
   Only amdgpu_bl1 exists. It accepts writes but the panel does not
   change.

So integrated and dGPU need opposite settings: the default works in
integrated (and hybrid), while dGPU needs acpi_backlight=native, and
each setting breaks the other mode. I have not tested hybrid with
acpi_backlight=native. In dGPU mode the NVIDIA driver appears to ask
ACPI for a native backlight, get "no", and fall back to a device that
does not control the panel.

Similar reports on other A16 models:
https://github.com/OpenGamingCollective/asusctl/issues/118
https://bugs.launchpad.net/ubuntu/+source/linux-hwe-6.14/+bug/2134615

Would a MUX-aware backlight choice be acceptable here, or is a DMI
quirk the expected route? I can test patches and provide dmesg or
acpidump output if that helps.

Thanks,
Riccardo
