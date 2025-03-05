Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B892356A8
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Mar 2025 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741173917; cv=none; b=GRCV/NlLmLeaQPzm+PeOJFSMcW5oBqXid7Iequ9nUE/OdMxNp0Yuknl6l/I0yHcSlMklyWdTh7gXBx1mpVtbqudzyEpxoi/Tm9VdJjxYEezdxnbl3uZHDEi8awuxHwzXRCTF5CsJic6aEA7cX+Fc19gxev2SGO8cDi/+Pnv8ni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741173917; c=relaxed/simple;
	bh=xiH804oufxrxYJTAwlcyfD+RL0wGycJOQj1WxbEh2ww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D02ziitWww05phf/Uz9Lf+k33uCeNhYwrwgmcbgu5xoYMNLcCtI9ZwYctTn91lr0A/2UhN5G62Gm4llayb/4gekkOes/pQntUQWZ3tnB3iCSuxc9lHfAwt5JQG4vfLI7eIjkkZXd6xakCcDSQhT2FRx2RE7BmiYU194ee8h50cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HctouAZe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HctouAZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741173914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TLdBM80iSu/uxRPEIQYDIE15fbxOACwJC7A0CjWSe5Y=;
	b=HctouAZeNcJ8mNvud9224KeXaOBg4fgyI/SLXQb/rF1os6Ub8vUHQf4q9nFmNLnvORFDl8
	+/3rbO8ozs6BrEYgt+Rz6IvLATkNu8XoNApBP0yILO3bild4+W0Fnsp2iU0aYJDz+iTNNt
	qs6T9OpiIWhtN2uHjCeqer2R3yWpVD4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-y0FPyWlGNoiK4xg09ENdrw-1; Wed, 05 Mar 2025 06:25:08 -0500
X-MC-Unique: y0FPyWlGNoiK4xg09ENdrw-1
X-Mimecast-MFC-AGG-ID: y0FPyWlGNoiK4xg09ENdrw_1741173907
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac21ef37e38so30479766b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Mar 2025 03:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741173907; x=1741778707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TLdBM80iSu/uxRPEIQYDIE15fbxOACwJC7A0CjWSe5Y=;
        b=kAhQF994lckyLRQdlJE/O3kLeWHNGEO3Rwm4IhoRFxWP8+K1Jk1/kFLlZVecz57yHe
         2oX1QUxRISaeYo0J/DPy/N8Pv+qIXLC9FlvF1l7i3BfTKWvSenFQVII7kI66cN8S5XlN
         7T4foqMJIeIuxP/ywBGJYepG44yq6g2OdDHH24tedArryuevbJbXAIZXI9Fbq17LbZWm
         MG5LZ3KLzmOQBsuny1oNgSUqzqGtL+pB0dU+OdLjFOxtZIfMqQ2dgo75b6AVokghGePy
         BVLeIdxV3xMYjerFxEasYQ4Ba+QUjqcE/3Y1Bv/pJfIu1D58kVB9zS2MqWbNEnuyFlOi
         HD4w==
X-Forwarded-Encrypted: i=1; AJvYcCVAFTPuav4Q6i7NONmvLOWcxtcn6GFqFR4aguXw90nxmzGx6BaDCo07JvZIM1An0VHgnMEfZPyFKePO9K8d6U5OVc1S@vger.kernel.org
X-Gm-Message-State: AOJu0YxRlw1M8ZALl3YWUlnTjydCQQA7u/TwAz0h6cakgUxW2sQeMHmJ
	7RopoCJy1jK6Euu/ISfhpXmIgXQ7xlm7236vLqu1vI9RrtqkeQMBWDPfJ4VZwY/3ehVjNTSq/KN
	CGjpP6yoQLDaA8hceFVlv+7suHpHJpvxuFocGAu2U8NRAmzeJQ8J6DIFfDZGXn5qKLsCDgfc=
X-Gm-Gg: ASbGncsmNrzwVCzcQ8LkkL4yyVRa7eTTJxutafFU6P+Xcqc4lRo33x9nCCzDX4ShUKy
	8/LoMtQZBa3CU1/AIGP8Xllhbrvmhz53irYPJbIvxayyeba34f4iHvbcxFvE35t4AITecDrpavd
	zUS64SKhTTvbMlmn8cEsQ2+2eMzu962kZGGsdys7AmhgkLM5zEJfXaDp10qui5Pgk6Z8Duh0P2h
	i9gC91pxDDts5wSGWQQO+PxL5XZBk6SLRCKWbQrDq+yGE+dek+3TyfMV+LsS73ydK9Igz9KElXq
	J50Q1pWCWH7acM5Jx8W9TOC8oGyCk2mGRbu4ovH5Lh4PS8ZnsN3iHgXkiz+f60yhR0gWZSjqoeu
	Ki3CuMjk+sf3qEnYmo7XZQmbaOzHfX24bajto9FP3iCRp/bkkpnpa7iLqc5hTx7yHsg==
X-Received: by 2002:a17:907:9451:b0:ac1:e53c:d15a with SMTP id a640c23a62f3a-ac20e1e0852mr245953966b.54.1741173907354;
        Wed, 05 Mar 2025 03:25:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfK0GN8cel3aG2y75MwUH71YyraHg7k6K92jmUWyjDePWKPAfjLCL/CMQnQRRlkAciRT8l1w==
X-Received: by 2002:a17:907:9451:b0:ac1:e53c:d15a with SMTP id a640c23a62f3a-ac20e1e0852mr245951066b.54.1741173906892;
        Wed, 05 Mar 2025 03:25:06 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf53bf6621sm747600166b.41.2025.03.05.03.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 03:25:06 -0800 (PST)
Message-ID: <1bee0a62-058b-482a-8eec-d45b8aca1614@redhat.com>
Date: Wed, 5 Mar 2025 12:25:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Fix TUXEDO NB02 notebook keyboards
 FN-keys
To: Werner Sembach <wse@tuxedocomputers.com>, mario.limonciello@amd.com,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250303190442.551961-1-wse@tuxedocomputers.com>
 <20250303190442.551961-2-wse@tuxedocomputers.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250303190442.551961-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Werner,

On 3-Mar-25 8:04 PM, Werner Sembach wrote:
> This small driver does 2 things:
> 
> It remaps the touchpad toggle key from Control + Super + Hangaku/Zenkaku to
> F21 to conform with established userspace defaults. Note that the
> Hangaku/Zenkaku scancode used here is usually unused, with real
> Hangaku/Zenkaku keys using the tilde scancode.

So this control + super + scancode 0x76 sending is also seen on
quite a few other laptops and I think we need a generic fix for this.

I recently noticed that KDE's keyboard-shortcut settings actually has
a  control + super + Hangaku/Zenkaku -> touchpad-toggle key binding
in its default bindings (IIRC). But that cannot work because xkb actually
has no mapping for evdev code 85 / KEY_ZENKAKUHANKAKU if you look in:

/usr/share/X11/xkb/keycodes/evdev and then look for 93 (*) you will
find no mapping. I think this KDE default binding may be from a long
time ago when this did work. Or maybe KDE uses the FOO part of KEY_FOO
as symbolic when there is no xkb mapping ?

*) 85 + 8 all codes there are shifted up 8 compared to the KEY_FOO
defines because codes 0-7 are reserved for modifier.

I hit the same issue years ago on "T-boa Tbook air" laptop and
their I fixed this by mapping Hangaku/Zenkaku -> f21 in
/lib/udev/hwdb.d/60-keyboard.hwdb :

###########################################################
# T-bao
###########################################################

evdev:atkbd:dmi:bvn*:bvr*:bd*:svnT-bao:pnTbookair:*
 KEYBOARD_KEY_76=f21                                    # Touchpad toggle

+ teaching GNOME to also accept Ctrl + Super + XF86TouchpadToggle
as touchpad-toggle:

https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/blob/master/data/org.gnome.settings-daemon.plugins.media-keys.gschema.xml.in?ref_type=heads#L577

Notice that system76 has the same hwdb key mapping for their
Pangolin 12 model which I presume also has something like e.g.
a clevo as base model.

So for now to fix the touchpad on this TUXEDO NB02 you should
simply add a hwdb entry like the above entries.

Longer term I think the right fix for the touchpad toggle for
all laptops which do this would be to make GNOME do what KDE does
and change the touchpad-toggle-static keybinding list which
currently is:

['XF86TouchpadToggle', '<Ctrl><Super>XF86TouchpadToggle']

to:

['XF86TouchpadToggle', '<Ctrl><Super>XF86TouchpadToggle', '<Ctrl><Super>"Something"']

Where "Something" would then be the new mapping. Or maybe just teach
atkbd or xkb or hwdb to map scancode 0x76 to TouchpadToggle by
default then at least in GNOME this will work OOTB and for KDE
a default binding of '<Ctrl><Super>XF86TouchpadToggle'] -> touchpad-toggle
should probably be added there.

> It suppresses the reserved scancode produced by pressing the FN-key on its
> own, which fixes a warning spamming the dmesg log otherwise.

Can you not also suppress this by mapping the key to "unknown" in hwdb?

Regards,

Hans


