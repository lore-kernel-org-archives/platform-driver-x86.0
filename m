Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFF9379996
	for <platform-driver-x86@vger.kernel.org>; Sat, 19 Sep 2026 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817750; cv=pass; b=CjF24zdQMipw4ezMGJlsYfLozuIMU2GyFj9CowpbqzD3mSxiI2OS2/axZWsK7JW2VtI2/Ki0UvM102UX+n3tVHQQlntEPFl8U05ZggKUnBZGhuAh+v1WHlvHgV4kyQoXe8RFLwPzqjtQBfUG9FngEKKEQM0nla4JLbXGh5XR8HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817750; c=relaxed/simple;
	bh=Ww6EaPaG5l7v7GlHMU7uCAvsPaaeRa950b+JtDDCnDs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=dbBN8QqBa6LJ+ewAlcKXsKqInrmj9L1USSBXUvuhCcTIVnfNI6P+5Okvn8PZ2/8/weJp9W/PQIJYvvToypWcsli62FX9639hmvVXzDuWOpgWvxXC363hjYq29gYt8iXEF2hiQdt7gjxp7pPm+gRjwqZ+RljSvGWLgr5syb+xrSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vaf2Ad4Y; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vaf2Ad4Y"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so13763141fa.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Sep 2026 04:35:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789817747; cv=none;
        d=google.com; s=arc-20260327;
        b=Wl29baiB1pAN7nI3/nEK1WxB8aIrA1DcC0o4q3pZt25m10SrRX1jaIaQQvcM1KfPQT
         PHnaE0AxHoW6SzcOTQWsdi1jZYK+vLRwASRR4xz8hObmf3+gkUdYApqB+k3tOJz8fmq6
         248CDi0ebAwGHLnd7LvFZTR+cACz2og64ltm7OtxJrf3kfLJw3BYWC/mNQ0JfvMVRSG7
         G+FLROzKtc5K57J4GeLP8zg2gJXEFGv8Ms/k36Xh3mJg2HCwgjOz67eLnzNHvyQNjv4J
         wQxZgyZx+Sbah+o2vGQcN7awJxbSHAg4FQ1Vcs++xu7gYPKQLj+PSZBGox8Ugu1DSP55
         UsVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ww6EaPaG5l7v7GlHMU7uCAvsPaaeRa950b+JtDDCnDs=;
        fh=6bSt9mf+GZd2/fp0fcst2WiQWU/RoRkHgCFSYhItPZI=;
        b=B0Ziw7DuPWGloe3ilv5sEz+C9MOuPpZ9Nsax0pU5eLRGTz47w4JVIAxMOMPlt2lJio
         uc3BFO+wfJ+RiXYz8QYKNmaxna6xQZREfc4J+lrp+tATs9dZH7534yTyJ8xWCskUFQ8P
         npHNX8eehWLtWZm9yJ4PMUTbbsG2rdhUJYhYNMfKdKeXp8ajK4W6GP/7EDys6xb+zV5+
         KcEC3h2iSo8j5yFqDhkamfHzXMMDcYa5bKKkwxM4OiX35Y/vWpYUUaJlLHFnTqVvH1O4
         SYhmBthayqa9TGxrKTD20DSCjWLcCH/k16QoWE8wSMAuGkXN9HCGnHyC1xIStdYFyVZ5
         CiPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817747; x=1790422547; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ww6EaPaG5l7v7GlHMU7uCAvsPaaeRa950b+JtDDCnDs=;
        b=Vaf2Ad4Y6iYn1kZip94u3p5zkuYNdk1BCJSGWk+rC+5KjvRIZlNyASaLnUcIr3Mwzc
         SMhZTLYwvlzZioljFUQWKD7/GU0Q6UyUbolSPQYYKvUAC1iSd++wVvHvPJiiDTgPcoII
         B3Ebw46O9pP1/8TL3q53kdnz33A2l8RWHhPG5Zd0fE3gAVpo0c4VhvuSod8kqy2q/Ds0
         KNtNMhOcr66RQsExGC3S6xpndfrJgs7VbqsWcithuz6K+IJA8YhOv+94KO61YOGmTmhV
         TMjcb3GuaOLrIKw71A+Nd9yVnNXWT/CXAKFEcWZlaMLqpawEF+JrdIOeyDpAoXCYcEtc
         JACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817747; x=1790422547;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ww6EaPaG5l7v7GlHMU7uCAvsPaaeRa950b+JtDDCnDs=;
        b=CG58EVG6/dFSEiEfYfYyd9wq0aTYpF6vspUZmFSy9GVejsMeqjalDPUbmUzOOgXYHU
         zwEK2LhZURuoK4Zoq3iJIR3YKeZB5wDYK1R6frwN11mhPNrYzX1bNp4xHQo0YYFkZ8Gn
         Vy9E6i6/ES6aM8H7ZBNQCmPGTzWS5paECd4maQ8p8muvKov9AyZB31pwkZ5zaFrkptLu
         TowlCZAnn4FXO8Uk/I26n0UKkQ8qHn99InjXaRjnqvld/jw+KcX92/mQzqTlGOk7LJJu
         5Ovm7XdQ2osz3Dd9fQOzRR81KW+CJqvs+uz6SEBlVG8DD1vUsSt1El31ZW+ytCVxdBdl
         zuYA==
X-Forwarded-Encrypted: i=1; AKwUvBwkvUsdEgxo3Mkc7aOHRpF/4QOSoP7wDZFburgDQFI3dDMhZMRXpE88YI0vwUFF3xkzDP8qfotFd/nJqyVK76667rl3@vger.kernel.org
X-Gm-Message-State: AFuF++ngenwH8R3T57E9dYKN0CB0fqlpl2nHK2DqNY7cKK6PyLDGxU6I
	7XsPXHEhnsMEg2wDIwKdbd4XdMRnApu2VKDxr1ZGnQJ4dVWJSZP2qGporUAg/O6ovoI9kD9p4Rg
	FsXNrLHwrSh+wa0fFVy9dj5dfg02DA9fnxge7
X-Gm-Gg: AYBFou0pEWw+/2ivT3+37n58VIq6fh/yYlnqECFViNESATWe6J7na/WwlKUKSnc8l6Q
	yER9m5jrK3bB8UJCg5cf+AEyjLW3XwcVMiBvbHRICRs6BpJQlrppR89kEePCBM/V8Heuz9BDd8d
	6T9qAduukmuhcseqgU7YqefKtGJVBOPX1gKu1UW4cTTkib7g9ay+eXpqx8rv57nxBAoO9vbkcXW
	4HVfzhyJ8WKB2WslvH1SJmG2pZMK4Y2KHAlW6nhfcErB5M2A8NAecgsrvQBA4gX8CdCcY3rL5HQ
	XfSXQohr3qlKx+4h3HKxK7bXIrbV6ZiqB8VckYvRqDzP2YbYPB3KvP4ElrfIoztN3xE=
X-Received: by 2002:a2e:bc02:0:b0:39c:7d57:a3ae with SMTP id
 38308e7fff4ca-3a5fbbb3712mr10580171fa.0.1789817746547; Sat, 19 Sep 2026
 04:35:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Stephen Schattin <schattin.st@gmail.com>
Date: Sat, 19 Sep 2026 07:35:35 -0400
X-Gm-Features: AcwNN1Ui0W7FU4LJ3hY-oB4pLa5IKG8eW3DtU2QTRv6IUPWy9TjagCAJtCYRz7A
Message-ID: <CA+6Zs5s-=np6wvu-QfqgKkubGV8uo4UWwuHQWH6E7jqT6kufNw@mail.gmail.com>
Subject: thinkpad_acpi: kbd_backlight reports level 3 (Auto) above declared
 max_brightness on ThinkPad X1 Carbon Gen 14
To: hmh@hmh.eng.br
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(Resent in plain text. Two earlier copies were rejected by the list because
my mail client added an HTML part. Apologies to those who received them.)

Hardware / software
Model: ThinkPad X1 Carbon Gen 14, 21V7CTO1WW
BIOS / EC: N4OET51W (1.14) / N4OHT41W
Kernel: 7.2.6 (CachyOS), thinkpad_acpi 0.26 (in-tree)
Distribution: CachyOS (Arch based), GNOME 50 on Wayland

Summary
The EC on this model cycles the keyboard backlight through four states on
Fn+Space: Off, Auto, Low, High. The firmware reports Auto as level 3.
thinkpad_acpi masks the value to two bits (kbdlight_get_level: status & 0x3)
but declares .max_brightness = 2 for tpacpi::kbd_backlight, so on the Auto
state it calls led_classdev_notify_brightness_hw_changed() with 3 and
brightness_hw_changed reads a value above max_brightness.

Userspace consequence: upower (1.91.4) reads the out-of-range value and
stops tracking the LED, so GNOME never shows the keyboard-brightness OSD
for hardware changes. (upower dropping its watch is a separate robustness
issue; regardless, the driver is reporting an impossible value.)

Observed cycle (poll() on brightness_hw_changed, one press per line)
press brightness brightness_hw_changed
1 1 -> 2 2
2 2 -> 0 0
3 0 -> 3 3 <- exceeds max_brightness (2)
4 3 -> 1 1
5 1 -> 2 2
So the firmware order is 0 -> 3 -> 1 -> 2 -> 0 (Off, Auto, Low, High).

Auto was confirmed empirically: in the level-3 state, shining a torch at the
ambient light sensor turns the keys off; covering it brings them back.

Firmware side (from the DSDT)
MLCG / MLCS are wrappers around KBLS, which is SMI(0x14, 0x09, Arg0, Arg1).
MLCS compares the level as a 4-bit field ((Local1 & 0x0F) != (Arg0 & 0x0F))
and emits HKEY 0x1012 only when the level actually changed, matching the
driver's expectations. The meaning of 3 lives in SMM and is not visible.

Possible approaches (happy to test patches on this machine)
- Raise max_brightness to 3 when the firmware reports it, treating Auto as
the top level. Simplest, but misrepresents a mode as a brightness.
- Keep max_brightness at 2 and expose the Auto state some other way, so
brightness_hw_changed never exceeds the declared maximum.
- At minimum, clamp the value passed to
led_classdev_notify_brightness_hw_changed
so the LED class contract (value <= max_brightness) holds.

Reproducer (as any user)
python3 - <<'PY'
import select
p='/sys/class/leds/tpacpi::kbd_backlight/brightness_hw_changed'
f=open(p); f.read(); po=select.poll(); po.register(f, select.POLLPRI)
print('press Fn+Space a few times')
while True:
po.poll(); f.seek(0); print('hw_changed =', f.read().strip())
PY

Userspace workaround meanwhile
A GNOME Shell extension that watches brightness_hw_changed directly and
draws the OSD, treating the out-of-range level as Auto:
https://www.google.com/url?q=https://github.com/NDLS-Accounts/kbd-backlight-osd&source=gmail&ust=1789904058528000&sa=E

Thanks,
Stephen
