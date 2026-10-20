Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792473148;
	b=IJVT5jCcRug2AHlZPg41pc+NXo7ig4dVdBN8KV++KBNl7VAwyBEGVeaZu37DDrEHyoYq
	 xOJbMT3psXOokbCGxuGDuv1+FqF00Dy0nKdMb8UFH3ZODvVPKShW4+oIDFV65yjx9CGFB
	 bAhbAGGb06fNmIkCRm94Ca7q2bh0Cp/2ndVieVKNl9GAqbg1Gw6MWOnIW1PdKa/N1jp3q
	 W2kNKKGRDA8nmKnG9AeradpNZl4LP5hodfBk3UnT0JBK8NXaP2nrzFpehddcSWUaQ+g/f
	 JHTngGD4FpXPQrIhvdpoMKiLPF1hQa8OqHlRVuX4A7YOHpGGbt/Lifnmjo7RWyP0eRw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792473148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=PyynqMl4ncW1eB9AWHZFc/qe+eQxWGhcfOaNkw0KWyo=;
	b=W7S5j8iHqgNEi7Fevx38GKXscayQLBp0C7remU2nQwjgK8TAslhea264oLKdDx+DuNU3
	 4MTbqmXnjqs6f2G3W8dJJDNEAi6TRBseIRLNpOHrMje7iGv04uOZpFlBRbJyjq1cZa+io
	 pmu0OYs/GaXZeY1S1GY9NblatLaW2LPXLVYxozEz+Vq09W98fKRsuyUIQc3M7whXNcAwt
	 U5CJYUFOtDMiFq//QBfoQA0D9aetw3+6uOgjjGId1rGeBlfdyOP7H2AteVPb3cxZWZgZY
	 Fwn7UcRZQ0zuXl4hpVkPN95fDUkncWzlTqpS38h2EwMrPPgqJNsOnZdDXkT/BwBQvEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=glt+b1MI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACB6606A31A
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 05:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ACB6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=glt+b1MI
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0f59a5fdeso20596237b3.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 22:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792473147; cv=none;
        d=google.com; s=arc-20260327;
        b=Y2xszxoIsqVfkXuq+Inf4KcWcrCXJcrxhde6gO0mkSweG1tr7DEOfggSZl1wod9wS7
         8q2Mcp5tUw+pnEeFRQuc7I5UJhxkKX7ZXKMIIFI41wh2ynIPhnXTOCGiVMILSz4b8zo3
         UzIoWO8KRyEWlQCl8L7AFXS6yZOBGJVunFhPnM4GvtKeb3QhN9SHskMPIBCDOVi0Air3
         voOf4HNKxw5yTbJJU8dvzhkkQ0AavN0ru9e9UPKJyLQYuYTEGqTpyqo/EYKXKQ3kIB+X
         TIXJguldMSgbfeEX5J9IWAZ3ygDohHGchD2Pq5IL/2R9THYJiXfPrkdIXME5QvsWX+fh
         juLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=PyynqMl4ncW1eB9AWHZFc/qe+eQxWGhcfOaNkw0KWyo=;
        fh=+j4fThQ38ZkVR+xqOp0vkyjV4nRCWRJsWygDyjBOqXI=;
        b=E9vUiDdh5PuYxeRb+C4fTsZ8gVejaRhQ/JYU7erDFCqoCBcz+hzsM8jzRFM/l6EnKH
         C7WNzfzNAS/ifay97rUEUBsc4j4+L0uhNTPUnMETKZ5XSdVisoto3jtGb6BaaRdYsIv+
         bt1QSJHzQh9qxbeKbQx4N59ipofeB5qFnguK4ngEHoZVhOlNx+mts6MjjxrKESa4F+fc
         19Ybug6cl9tQu5PWZkrgUdQQZF7z5lUThkQSw2BnznmMpCz1r+UlB4vPeD/gSxuaJlqP
         iH7UwjU4W48geCYUyZsZA88RC/LSQY3QDsua/MMNyEBy08ky/eI5baG2UauAXeg731P5
         tnvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792473147; x=1793077947; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PyynqMl4ncW1eB9AWHZFc/qe+eQxWGhcfOaNkw0KWyo=;
        b=glt+b1MIc0Ox7fRjMS/cEWPhLzxkFEyMwoVLPxTgYZ3OdJBCA2tz41U+gZP1Vpwkuj
         yq7n+5fNkK/EBxq+YNHBY2RNNF7QhsRvINSaRkVR2kiyu81WohRLSchvkegpbekv+Udk
         syq4WWuPRpg8PAeNROD647g8H+B78cFSDlyl0oPs8ZGmOU/d8xePpbTgsA2XGe1KAcTh
         cQBxbN2y4u/WecFxtJW+rSRR7Lh/+ULFVfkxyj8pu4BFZOESPesy75UrIvUJCuBQ5NKF
         61N2vKXxWf2rYsRH5/fsIWTSXKxPYyLquqiUqSQabHIwykZAf9S6mQY2p4SkLnc4eWRa
         1DdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792473147; x=1793077947;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PyynqMl4ncW1eB9AWHZFc/qe+eQxWGhcfOaNkw0KWyo=;
        b=wm/FJeg3NvXiNL20kS4ObnGDbgwfVg0RJMllLL4kCwI6yd/TQN4Jp5i8vS3RvZBxDU
         iFxSOE8+nW5j3DqhPju4MO0FNGGw7U5IfYsQ/Ktctsjq8YujUzxOIetHyPR0qsafJcXB
         pXGTNOZU2b5Y4OlPfhKDTp2NDP42J1bQqT3rEQETbPOBY6dkEL8IxCDhRXhbhzqqZsF4
         J+o41nWKYsc1nym+Vi6+zAGZJ9BPYeIqMM/eIMNChLLjnALz+HQExI08QHq5wxQ2+dbn
         nVvItHjnmOXVUQVARnR0ra4BCx+zM4ndpR/4EAFFZ3uEoIUCDWYBjazPIvWqGAifJGQi
         Njjg==
X-Gm-Message-State: AFq9FYLUu3IT+EmLJ79wf7CGnk2hJFo+mUrEAbFpgQZ9xC8SSYdyGgwS
	TmC3NCYSbojsa35j/WaXgkeY+AhSmlc3DIlUU2BDFoY+iKhpShWsTN+erpPow2U6NPmSzKW1Mdr
	XS+GlS4oYcaoPQFa8c665Zrgzc6ROnyM=
X-Gm-Gg: AYBFou3o0jV3XYekOYpgN3VZT18PtD0NQSaXG87ujaLbkNbFug93JkVvOkaZvP7tQ8A
	dbtU5/oHvt3EXsrU0FnTkRsUkEeQLf23CHBwhWLKHAcPngfvikP5RVvAbSgPHW8GR+BYC+MNwjI
	X+sXVx76Kw5kTUjF843r/PH2Gcv7oLZ0dZZWFu/esinu7zMWV2MYO6hE7pMxw/6gMx462R3+yvv
	Ay8lELj0ga+5Fhe7imZUZ+UqV0m24j0/JOrXHMqePg3snkh8lejf9wTnWPpFjYKXrINbziBSgoV
	V98Pvhg/v57VTRtnqg1Im7eLMdVKuTTebPqlxfWn6i0YjeRpe47ibTVl
X-Received: by 2002:a05:690c:4147:b0:8b0:d9ff:4f7c with SMTP id
 00721157ae682-8b0f219aa70mr29146857b3.17.1792473147001; Mon, 19 Oct 2026
 22:12:27 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Serhiy Shliapuhin <shlyapugin@gmail.com>
Date: Tue, 20 Oct 2026 08:12:10 +0300
X-Gm-Features: AclHuK9lKSLAXYJcseLToAmTFHVV6FMHM4SpSTdy8VRD1egrrcMTKB8ZuQrU_UI
Message-ID: <CADGd8gGYm5QmnDrjBzfWsWcKg9_ULAAV7o8RzDxi1p9doN5gCw@mail.gmail.com>
Subject: [REGRESSION] platform/x86: bitland-mifs-wmi: platform profiles cannot
 be changed on USB-C-only RedmiBook Pro 15 (TM2017)
To: "qby140326@gmail.com" <qby140326@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Mingyou,

On my RedmiBook Pro 15 (2021) none of the platform profiles exposed
by bitland-mifs-wmi can actually be selected. "performance" and
"balanced-performance" are always rejected with -EOPNOTSUPP, even
while the laptop is charging, and "low-power" is accepted but has no
effect. As a result power-profiles-daemon can only stay in Balanced.

This is a regression. With Ubuntu kernel 7.0.0-38-generic the
Performance and Power Saver profiles could be selected via
power-profiles-daemon without errors (only the intel_pstate CPU
driver was used, as no platform_profile handler was bound on this
machine). After upgrading to 7.3.0-9-generic (Ubuntu 26.10),
bitland-mifs-wmi binds on this laptop, power-profiles-daemon also
uses the platform_profile driver, and profile switching no longer
works.

Last good: 7.0.0-38-generic (Ubuntu)
First bad: 7.3.0-9-generic (Ubuntu)

#regzbot introduced: dc1ec4fa86b2

Hardware / software:
  DMI: TIMI RedmiBook Pro 15/TM2017, BIOS RMATG5B0P0909 03/31/2021
  Kernel: 7.3.0-9-generic (Ubuntu 26.10)

1) DC-only modes are never available

This model charges exclusively over USB-C; it has no dedicated DC
barrel jack. The driver's DC power check (as documented in
Documentation/wmi/devices/bitland-mifs-wmi.rst, "Performance" and
"Full-speed" require a DC power source, not USB-C/PD) can therefore
never be satisfied on this machine.

Platform profile handler:
  $ cat /sys/class/platform-profile/platform-profile-0/name
  bitland-mifs-wmi
  $ cat /sys/firmware/acpi/platform_profile_choices
  low-power balanced balanced-performance performance

Power supplies while the charger is connected (no ACPI AC device):
  $ ls /sys/class/power_supply/
  BAT0  ucsi-source-psy-USBC000:001  ucsi-source-psy-USBC000:002
  $ cat /sys/class/power_supply/ucsi-source-psy-USBC000:002/online
  1

  $ echo performance | sudo tee /sys/firmware/acpi/platform_profile
  tee: /sys/firmware/acpi/platform_profile: Operation not supported

  $ powerprofilesctl set performance
  Failed to activate platform driver 'platform_profile': Failed to
  write to acpi_platform_profile: Error writing
  '/sys/firmware/acpi/platform_profile': Operation not supported (15)

I have not been able to verify the behaviour under Windows.

2) "low-power" is silently ignored

Writing "low-power" is accepted without error, but reading the
attribute back immediately returns "balanced":

  $ echo low-power | sudo tee /sys/firmware/acpi/platform_profile
  low-power
  $ cat /sys/firmware/acpi/platform_profile
  balanced

power-profiles-daemon then sees "balanced" and reverts its own
profile, so Power Saver cannot be selected either. It looks like on
this firmware the mode writes are either ignored or the current mode
is read back incorrectly.

Summary of all writable modes on this machine (charger connected):
  low-power             -> accepted, reads back "balanced"
  balanced-performance  -> -EOPNOTSUPP
  performance           -> -EOPNOTSUPP

I am ready to provide acpidump or any other information you need.

Thanks,
Serhiy Shliapuhin
