Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795175926;
	b=v5QKyeczKrzpTrP99cbDRIIeYg3b91nyZ6+SD3n3JlkBvvkPgAYCVNqjdGzcW1zH6ncv
	 NPvVliPej8VygnqRgwtCRioT267um4xJnySWcRxD/XB63pNzP5gf4dLhh/B8YIn9FGVnE
	 bJLrAaJvdGvNxpDYDsaDz8gPOO/t0b8fXrcAb0+URALu6vtGYD/MKEMtdno4AqkBYIwFl
	 We1Ap6WrhvmvNwY+AotfaCiRyfclf+LLaO+qrGslaEuay1HUdaYDdGieT0D6nmJO2qSqD
	 oqhBx7xNx5ehIOlkYZYl9luZiBBkCYcKnOHXtrjzuJFUQ502xFvdpvOYMoYXCRkRNWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=NvuhaCDUWlRxm9BE4zHRrvko7BhHP1S1x7oYjGM6wyM=;
	b=IQsqqMWFiKL4BXd0tF+3+VpDNB2xR24boHCMU1BU2j34AK56vt+X5llEO1rjYJ8vynoq
	 WQ76yNhFa5Fv4EAx0IgjlGoLqZWGLHzJvuN5Kv3NuveHS4bYIUW/3Bh5CoRaQKwFf1fpz
	 1ufza2cCH0jBp86gl04vAxjsp2W3MmfVyOzzCiA2y2lE9sNwwWNP0h8OqJAYuuaIoyWvM
	 OVAKtE8a7GOb2ToOx6SeucJ0POfs9EuyufIDXPrCwQGsiqo/DAhehGAjGkBF1hJuXGvPC
	 LMGhmPpZ0IY9d66dawqiliTSj2Qm7YjuQkpd+UPdANkRP4g7otzdXK3TjUdCBfLG+nw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZGxdVby;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A0C606A325
	for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 11:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78A0C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZGxdVby
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-9210f2622ccso10909636d6.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2026 03:58:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795175925; cv=none;
        d=google.com; s=arc-20260327;
        b=KCxTxJiemax040kjP0N30L5ZwNdcCK6SDNs4LPTGySkePpCvb0sL2haSI7tvny26Vx
         jZRNTQ4mbEWd3y45FRiC3G4v7DSJnY9Y2NwIyzrjJ26YqR4TGj91wLOP7EGYR9UHSTFV
         A1r0b2WQRRYKZm+9W7a8SjGpffTnUTblLYS+rWTJk9PBDpmvFGPgGbyv32rMxEJW1n9N
         r1GAR4BActBIP4R0V65qcvHbOs8cURQ8/30OSpj1L4vWZRZ+hMtJ2rOTOsCqUX3DnoD9
         hZuTn+lZfa3fONmp1uMKSOS/qguNRRCl4Yh+N9qQDil52eQVTLZWcveYvWVWV4h16k42
         dddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NvuhaCDUWlRxm9BE4zHRrvko7BhHP1S1x7oYjGM6wyM=;
        fh=LAtpHtVR30q6rinFeyskR7Ff9QyURHB8q3bpp5R7hcA=;
        b=IpJpeYqrJp4O3qU9DfBMGR8U272/Uwr92mQy3Sd8l3/VdWu4WkoDjzz3h5oaDXVFL1
         DkvNYNnqsExfM0lJV0HJKXCxrKe6U1E8q76B0l+8uwzSSnmR18HhdUT6Cl8Yz3jXrI4y
         h0zTME6gJMDDGhU9RF7Lu6ll8WtfOxO2Ws00UjwHhl53Twv5cmNQGyx3BXXes/u8styi
         odRRDYIgC5DU1vXagPkwueRbFCoQYLPPZGOw039mJvegZco7KyV68LCpJR7/GIxbwCbs
         jUfR32mAi7WMZWfekbEUHd9gvNQ5I0aV5eTxHrbPbuiOJUcEphYQSf/545CWrBTgJOeM
         7tzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795175925; x=1795780725; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NvuhaCDUWlRxm9BE4zHRrvko7BhHP1S1x7oYjGM6wyM=;
        b=yZGxdVbytBCgcL5bgfRDcoxievf4qCa5Lm5sE+izq5X8PJmjBu0I01aEnPXelUGG+6
         xy4U3V5ABe0wARx+IW1H3KvSVReT9UQd8ekLzv1XkzsR4x5nQg7ioPEi5Pl4qrHyZaoc
         0j4XovwyOITKPjAQe6Z7c8fyEPS9nrZChpQwZMUnE4F97zvLGDcTxfEmIjrANJhNb29k
         LKxStnLp6SBnsR8ixkSvvoKDCj+r/82wLN/ZV9nzPcxvG01HJwkEMkNRnsvjqwQNKPCM
         Bek7YcbbVmWtr7FTqalPzHVN8szJ8m58tIwpRLhqtWvFGHm9uz1WAkzK8h4yk5GwZ4HW
         AGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175925; x=1795780725;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvuhaCDUWlRxm9BE4zHRrvko7BhHP1S1x7oYjGM6wyM=;
        b=n/eoaGYg2+FGJEK8UY9EN5KPmX13WfT8HcEIlfYToJ9ht3YXjDplx63jiXCv3lLLi7
         zL9OXx4I575iz/jS6vdyBMmcuKxclXVJoEotNBdzvcwqJ2eambBt7QIz2qyR34aOXbiZ
         RUrFAq2wQBQD/6VJ8t9RTKhbEy0q+PQeX8H1GFCIAxwgC1sjjEZhgHAVnN10kPBA3MJx
         AGKVRPwEudPtpadwNKEnp7YSAVN3/wuPTyOTJTERV+cquZgK2O6LuUQmPMyOCCHaEh3R
         5LKB1hrOFEq/jjLMXEENsaKsWgLMqRmtlYsSIAvExB1Q/wXhpxYRTi5I5iQET9n7VGLW
         kwGw==
X-Gm-Message-State: APuU4Z9tenr2SvUy4r8kJNYDZ2FyewglmxT54mjJWQnpZL159zpxjXQ7
	QqqQcrxVzQVBF5UQrMoIZtsUCmiAhTqp1GDGMPuFeQNptaKSaBvSOo45Ig5HzthaUTzwyrOo7e0
	r9+KOeEb9m7Gi3V9px0ScY3ArRYKVXUKb3g==
X-Gm-Gg: AZFdTZcCbZkz4N9B3vXIPNUqOJwxlVe3+SZTUlf36IhURiNq4N4AvKvNMOdrtVQqzsE
	TMe+ykbZKy3tmD94vpIya/C+TU8a+JlN5qXPJkrvkoA6vslLTHcxabtb326YdnMOkO5LcvRC0jU
	vL7rdWdNOCZWovmULsBWNJKYnIrI/bSXmcXUirBoc2w1KGWRL0j2J/JpRU4+qLxdiA6o4JmQztS
	RwgmI5c8q65zKQfFTioajhx6ZwbvMQ7Qcbs2cNFtMN5emxvnSYzkCeUNUycTO/SdG40iTUBqHXQ
	rcAYzGgEs7mE7NBaj+LmnkZa+UzLmp++FuXYAvh8+S30rIrDHFvZAsAVpXd7LKHglYzCSRn8tXY
	MH9Od9+KV0wn7gVLDstKM4+9xwZk4iNXsZ6R4fA==
X-Received: by 2002:a05:6214:8616:b0:91f:2374:d001 with SMTP id
 6a1803df08f44-92134aef4e6mr46090596d6.25.1795175924318; Fri, 20 Nov 2026
 03:58:44 -0800 (PST)
Received: from 1087654160852 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 Nov 2026 03:58:43 -0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Eduard Aliman <edialiman20@gmail.com>
Date: Fri, 20 Nov 2026 03:58:43 -0800
X-Gm-Features: Aa3M54qCuMoidSecJk02Vb-Tk4IkDHHUqJ221kfGK131OaeCfKXmmOVKzx4Krtk
Message-ID: <CAA4HgYKab7_GMCNdHF9+E=9ECVBHRs_axefeCOnZbUNUoyVSoQ@mail.gmail.com>
Subject: ideapad_laptop / lenovo_ymc: keyboard backlight stays on in tablet
 mode on Lenovo Yoga 7 14ARP8 (82YM)
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting an issue / missing behavior on a Lenovo Yoga 7 14ARP8 (82YM)
running Linux 7.3.4-300.fc45.x86_64 (Fedora):

System details:
- Product: Lenovo Yoga 7 14ARP8 (DMI product_name: 82YM)
- BIOS: LCCN26WW (06/25/2025), EC firmware: 1.26
- Kernel: 7.3.4-300.fc45.x86_64
- Relevant modules: ideapad_laptop, lenovo_ymc, amd_sfh, amd_sfh_tabletmode

Symptom:
On Windows 11, folding the laptop past 180 degrees into tablet mode disables
the keyboard and touchpad AND automatically turns off the keyboard backlight.

On Linux, SW_TABLET_MODE is reported properly and GNOME/libinput disables the
keyboard and touchpad as intended, but the keyboard backlight
(/sys/class/leds/platform::kbd_backlight) stays physically ON.

Crucially, even a userspace daemon listening for SW_TABLET_MODE cannot turn
the backlight off once tablet mode is entered: writing "0" to
/sys/class/leds/platform::kbd_backlight/brightness immediately after
SW_TABLET_MODE=1 changes the sysfs readback to 0, yet the physical keyboard
LEDs remain ON.

Test log (listening on both SW_TABLET_MODE input devices while folding and
unfolding):
  [ 2.681s] Lenovo Yoga Tablet Mode Control switch -> 1 | cur=1
           wrote 0 -> readback=0   (physical LED stayed ON)
  [ 2.763s] AMD SFH tablet mode switch -> 1 | cur=0
  [ 3.748s] Lenovo Yoga Tablet Mode Control switch -> 0 | cur=0
           restored 1 -> readback=1
  [ 3.803s] AMD SFH tablet mode switch -> 0 | cur=1

Note that "Lenovo Yoga Tablet Mode Control switch" (lenovo_ymc) fires ~80 ms
before "AMD SFH tablet mode switch", and by that point the EC appears to
already ignore physical backlight changes via VPC0.KBLC (KBLM/KBLS).

ACPI DSDT notes for this machine:
- VPC2004:00 exposes Method (KBLC, 1, Serialized) which writes EC fields
  KBLM and KBLS.
- EC0 has Device (CYMC) with _HID "YMC2017" and \_SB.WMIY (_UID "YMC")
  exposes WMAB returning EC0.PCMD.

Is there an ACPI/WMI call or EC command that should be issued before or upon
entering tablet mode (or a quirk in ideapad_laptop / lenovo_ymc) to turn off
the keyboard backlight like Windows does? I can provide the full acpidump or
test patches if needed.

Thanks,
Aliman Eduard
