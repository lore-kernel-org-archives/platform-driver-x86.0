Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929824;
	b=onLw2RrXGWeF8dQquutSP24WvGnx5LvmrLtmEcQEanUr5H1E9F5skicMevh+eTkmyVXk
	 TKRnKvfatcokA8a/sMhB8KCMTAfk430fOfgKtrKR2U1StNXr6rJoazFYc409j5DuIm+f+
	 kFvYituIoKM7PTFEPbQEDYXloRvtTTkn5jf4aGiECbwK2qr8qA1nAPh1R1eQle1KVXAwM
	 J1rIDOMMmf9dWZlY0ynl7ldd41UPh6HiW1rMSsc9Iws0O2p4o1fXqdgi2KkLpuRm1Bb4d
	 PN+/l4SKuF55IwslrhLtSo0eJ86uIBvRFFcqeJdE6BDXVMwNJrYSo8JgEBwA8nrIa6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=X8BtSKrWvVbIEE/cP+rBTBr19Xje+l3L0dnP4Fz9jF4=;
	b=kL4ZryGrKGCRDsHvAIQSaams8Rb1RWwsn1Csv2F/GlmD0bDuxdHavueBJ3OM01u1TP+x
	 UFFE6OLlX8gu+XaWaTCAxQyx+2qv40hGdiq94Hx7xz7aun21eHLgEnpLpirHid1EFhg0m
	 wetEd818r9mqZUklcCIbQsdvsUEM5c5hOK9u5tHao33M960WXqmvZCD1lZ0RSL88Xn8z9
	 BumUDYRKTt+08uCzj9gKug3D1hJBv3/5f19Akalk5iYMcCmS4JkXg6Kr8rdH95Crqjx0H
	 0lJmRDdkTnZ/i0Zpnop/yV5hT7xUqJQLvqvlyF1O2vBikz382BwAdy+eNh1uMy/NSVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CaeNWWDJ;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B6F606A32C
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 15:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B6F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CaeNWWDJ
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so7513984c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 07:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794929823; x=1795534623; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X8BtSKrWvVbIEE/cP+rBTBr19Xje+l3L0dnP4Fz9jF4=;
        b=CaeNWWDJWhvbfZO/KO6n9I3/GPO9vLmW8FpPqHLq8NU2CVAcmF3dIeFfQuU4mMjjf2
         y8rXYUK1iTMRA7+bs0t+j86zrYhFNDuVopyV6UdVjbCqmPoZYcPnoRBkt66PIiSqBjs9
         Ze7ZvGELjNZPuXIsa5DNV8TC3CndbPm0P3cT0vQLZ/ikasLyZX7Ro9ABZRNF30QQmjLR
         Yy+MBvZpCs6jHFFoDUJ/gxji/8cciOddYY8reotKo1QIfaOnylvENIkRJNozR/IhsXYs
         Af4ELR10ZRnHeXCwJ/PuH02rCCx+hrsLJ06mAL+5Oh6OvVQnZ7iTBqE52aZEqbWDSRwA
         4oNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929823; x=1795534623;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8BtSKrWvVbIEE/cP+rBTBr19Xje+l3L0dnP4Fz9jF4=;
        b=DO8ruz1LJPyx3dRDm+N8i/o0t/l649if+Uk9gKvELODBl23n8/0p5V4UHHP5ePh/6N
         wpmg9lAQH8n/4vYhTS1EDi0QaU1x0qlmWu0hgsVpzOI39qONJQ6dxhs2y9dVuAC0tA/q
         6HXmCyLr9Gp+Jyn8LYqiWG9wmTLEGu8X/RN8i/aI2KNcil/sTsajb3GijZv15/jojtwk
         tU6G4pQLcY7C3PD8WLxy9eB87OOswtjj/JiDX7KwVVjOWj3qy15BKt3reuY9ZweMslD7
         MdwPnOElQbjb3UBKM4E9of8L14DAArTJZd1B6tNRZq6KZphwBNgJTYnuD5CHOX/W5a4j
         a86A==
X-Forwarded-Encrypted: i=1; AL+hErFFlzv9LUctFb4VXb0H/+3o0V6wlTp5YBSaFftNo9On100zeTbI6ps2POuxyRzaMiTZqtTCF7WIj2e2WdJWd2bX2J1+@vger.kernel.org
X-Gm-Message-State: APuU4Z+wuxuH4ViAljYBUr1YoC4GcCjzajlXG4vjK3NhMH0crFMYbQNK
	bIYkr5I/sdDtUhNPrnnACwwsjnXpmXDSkWJHw1ehNxuvg6S/4kDFxTdd
X-Gm-Gg: AYBFou3CGsUj5uC4WvVzMTdVmE6HqFkPidnLCJLveEDQSVqz+puyJ6ozasXDVOSKzV8
	ufefmVyY3j6ak+9jmFu3b4RO34b9RwiuEI9rDdpsBYpMJnbv1qqgKGmw8UoucSUS+2nOP4yIxXt
	Su1H4ftl45xyfA6QFevZyfJ9MmWSTt5VTbeqmLxTqn1nkW2zIWXRia48AQ3bUkIIj1kse3kKnrp
	7S/tXXFIsdJtuSYGhK3eYty464QFF4uVaKQrC+GcG10x8/ekQ7GFIVf9q/xxMySs80NTXZgH2vr
	5EtRuzqpICEyPyX6xQvzRs1V2uj/C97ipj0pgNbzvmBM4iPcCsD2UaBwFplmXp778a/83u5pmdN
	uAgZyOulfmCrD8NvbwoSpCL7btJR8ntFy4t5c9pMhHOFYJB5or0WMzL1SXZoWpo6LCLerTONOXK
	ilkF8JbUQk5xXjQY3x9a1lG5BPUT2iCC7U5SQNInw/7hqXTm6TIROE0js4kdLVt8372DnIufXo6
	OSe6P9QhQsQMj7wvRza1pQhj49XkPJAlWd/FWqjbc5Rb4n1CzKAM2gfpGKdyqFpP9j2wad+FZJf
	54r2VghVkHujwCFgogf172o+JDVQ5JCm72OkhYATgHY1mY+qazer91/CZtL+mB8Qtg==
X-Received: by 2002:a05:7022:3a87:b0:15e:6541:3099 with SMTP id a92af1059eb24-1b5030980c9mr14244003c88.7.1794929822695;
        Tue, 17 Nov 2026 07:37:02 -0800 (PST)
Received: from marstop.local ([103.230.223.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm37933300c88.7.2026.11.17.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:37:01 -0800 (PST)
From: Spandan Barve <spandan567@gmail.com>
To: Jamil Khan <khanjamilahmed202@gmail.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Re-enable ACPI features
 on resume
Date: Tue, 17 Nov 2026 21:06:58 +0530
Message-ID: <179492981820.29200.9583804047448815059@gmail.com>
In-Reply-To: <20261112165433.64461-1-khanjamilahmed202@gmail.com>
References: <20261112165433.64461-1-khanjamilahmed202@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Jamil,

Same problem here on another model: Galaxy Book5 Pro 940XHA (SAM0430,
Core Ultra 7 258V, BIOS P07VAJ.330.250516.01), on Arch's linux-zen
7.3.4. I applied your patch to the 7.3.4 driver source (it applies with
offsets), built it out-of-tree and loaded it in place of the stock
module. Hibernation goes to a swap file via systemctl hibernate.

With the stock module, after one hibernate/restore cycle:

  $ cat /sys/class/power_supply/BAT1/charge_control_end_threshold
  cat: /sys/class/power_supply/BAT1/charge_control_end_threshold: No such device or address
  $ wc -c < /sys/class/power_supply/BAT1/uevent
  0
  $ cat /sys/class/firmware-attributes/samsung-galaxybook/attributes/power_on_lid_open/current_value
  cat: [...]/power_on_lid_open/current_value: No such device or address

and right after "PM: hibernation: hibernation exit" the log has 50 of

  acpi SAM0430:00: failed to execute CSFI; device responded with failure code 0xff
  power_supply BAT1: driver failed to report `charge_control_end_threshold' property: -6

They keep coming for as long as something reads the battery: an earlier
boot on 7.2.15 logged 5443 of them.

With the patch, over two hibernate/restore cycles and one s2idle cycle,
charge_control_end_threshold still reads 80, BAT1/uevent is complete,
power_on_lid_open and usb_charging read back, and there are no CSFI
errors or other new messages after resume. platform_profile works with
and without the patch, as you noted.

Tested-by: Spandan Barve <spandan567@gmail.com>
