Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABFE345CAA
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2026 12:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069161; cv=none; b=ZDDHDLgej/Tg/uZxzY9F9EgpUA8lI3gfF4CIYyJLkTvfl90wKMevIvXvg93jmvIR/5ywLkE/RoPPq+WWO2Bhx1pZwdCJ6vpnPxMiqnxs5TCMihdVe/lLateXmCYGO30xy76yhWAJSAhqpRP+A2Mm9dFdQMff97sBPaJiIBNbtC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069161; c=relaxed/simple;
	bh=cEVHgXyzWz8yuExvjK4SHL21r1UlBuz1ILbPryLJSow=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Oz632Mc4Wzal+IQHqaH7Y926nlCxiV/m6FVWDqpJxTI0wNjFc5lTL6iiAT7YMb042ElOkXWxZfV52WXb9x+isTWGqr06dBwm2wZIvXcfCfG34xI+2TitihcHVc0XQM6hz/pQz6XPXtfBP2kno7z72Q/McmkZbsm30mqoKwqxdc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=ZvUaC1w/; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="ZvUaC1w/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:To:From:Subject:
	Content-Type; bh=EPhIhfG9E3758dze5T1cLK3D8d0bo2pE99AyWS8oLfA=;
	b=ZvUaC1w/UI7RwBp9eB6PMShlG7RtfhtvSU20hRpIk2aYHT4BqbBeifDVA37tKN
	D6yTpspiu2b4qzE6YFFTjndvmtTU1cxbUpjQPvUPJX/lNl4Y5aydwI+ZBEKy/tD8
	jcZiK0XM3BbjKC0WBAhsgmuOs4yyqaOSXQj6XzALO2imU=
Received: from [192.168.0.111] (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCkvCgA3X__lLftpfuvPDQ--.10961S2;
	Wed, 06 May 2026 20:02:46 +0800 (CST)
Message-ID: <aea86975-3db1-49cd-9c17-80145a492779@126.com>
Date: Wed, 6 May 2026 20:02:45 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev, denis.benato@linux.dev, corentin.chary@gmail.com
From: =?UTF-8?B?5rGq5rWp54S2?= <wanghaoran505@126.com>
Subject: asus-wmi: kbd backlight brightness keys not forwarded as input events
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCkvCgA3X__lLftpfuvPDQ--.10961S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF17Gry5uF43uw1DtrWxtFb_yoW8WF1kpF
	WSywnYkws5AF1rJw1qqFsxXr1jvw4vyay5Awn8try5uan8X34xCr4ktw15CFsrC3y7W3W2
	grn8Aan7WFWDA3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j2ZXOUUUUU=
X-CM-SenderInfo: pzdqwxpdrut0qvqvqiyswou0bp/xtbBngbdT2n7LeYWwQAA3E

There is a bug in asus-wmi's handling of keyboard backlight brightness keys.

  == Problem: WMI key events 0xc4/0xc5/0xc7 are not forwarded as input 
events ==

  In asus_wmi_notify() (asus-wmi.c, around line 4551), when the driver 
receives
  NOTIFY_KBD_BRTUP (0xc4), NOTIFY_KBD_BRTDWN (0xc5), or NOTIFY_KBD_BRTTOGGLE
  (0xc7), it calls kbd_led_set_by_kbd() and immediately returns without 
calling
  input_report_key(). No EV_KEY event is ever delivered to /dev/input.

  The conventional behavior (as seen in thinkpad_acpi, dell-wmi, etc.) is to
  emit the corresponding input event after handling the brightness change
  internally, so that the keystroke remains visible to userspace.

  == Impact ==

  1. Wayland compositors and other userspace tools cannot bind or react to
     these keys, since no input event is generated.

  2. Because the driver only updates its internal state variable 
(kbd_led_wk)
     without emitting input events, userspace has no way to observe 
brightness
     changes or persist them. As a result,
     /sys/class/leds/asus::kbd_backlight/brightness is always 0 after boot,
     regardless of the value set in the previous session.

  == Suggested fix ==

  After calling kbd_led_set_by_kbd(), emit the corresponding input event
  (KEY_KBDILLUMUP / KEY_KBDILLUMDOWN) before returning, instead of returning
  silently.

  == Hardware ==

    Model:  ASUS ROG Strix G16 G614FR
    Kernel: Linux 7.0.3-zen1-2-zen x86_64
    USB ID: 0b05:19b6 ASUSTek Computer, Inc. [N-KEY Device]

    /sys/class/leds/asus::kbd_backlight/max_brightness: 3
    /sys/class/leds/asus::kbd_backlight/brightness: 0 (always after boot)

