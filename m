Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAFF194C95
	for <platform-driver-x86@vger.kernel.org>; Mon,  1 Jun 2026 14:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322797; cv=none; b=qamu5bbxkWc2g7kpuqshuukTsKAao9hN7vuoR69kwaNtQUj90B+ILFXSJGds9WyzROYYL8wi10+j0pQvxMXBv7oCq9ODhNJzk3cSWX/urpeQ3TdEQr4K4taBYlul5xNxWCW8HgLIXj1ckVn4Unqc1KkfDcRNu5GiRS7pTFYajlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322797; c=relaxed/simple;
	bh=k9DY2eKAq43fDbUXhY0ndixpVAYu6LqK3b0B59oV4N8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=WxjlbLxO093ZW0RCXfAh6LSeSJgO1jSGXUf9nrYQ9EYXejDBdeBTp+rKKBYU9HAJjicJScXD+bw4iDYRdRjNPnzcS26smpXNrmkSCodHZQzB8OnuQq8dt7en2H8X1aoRfDQR3y5RV4GMg++7c35FgoVVx/t6XN80Kxa6flaw0Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DaMZv8cP; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DaMZv8cP"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3967738c801so15626771fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jun 2026 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780322794; x=1780927594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOc7BFAMb/Y9gmJ/GTgJ6m/JbBQ6Da1YwZ1MJKOchbg=;
        b=DaMZv8cPcXe5r4xytjMG3kWwmY+bZjHUpBzWL0x5fDnSa6KdnF7kg+Mf5eVxOGmFaI
         iWWejdsvROzWxnh9d0thQmwcsp+At6l/8knTpG/opX3R5/NENmgbOZkLazSO5VGoDL1s
         995xUAfDDnGmgyvJ/xJpKpGi+W+2aALd9OymlsdGfrQs3bz5Cy0iYy0xP9MXmF25jOxY
         jEd176R6B7Q+BJK+r6shqMU6fr6EhnTXS1uxhv6p8DcBBfmN3gQih3Iqy9NoCU73P2xV
         x4l0iFPwaTqypDUrOh0JZljpLQyaRVtZg6U9WAweiQjY4811ipHhM6wAoSga6KY+3kKI
         87jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780322794; x=1780927594;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nOc7BFAMb/Y9gmJ/GTgJ6m/JbBQ6Da1YwZ1MJKOchbg=;
        b=H6tySTmtjred2MqBEOBNiqkcJZsRrrLaT3x7gwxYtu0ouXHLNP3lIwDUSniy4u1110
         oviAdjIasWCeq/jdDYl85ooFA+YM4x31mn2dM5MH7yfRdnedkqEwy8QCye2kjmUAXJ/V
         3xJmLSvjLYWDpq2yopjVRt7okHUOeImHbWDiLqnrL5y9bimsY1MKdeo9Qi5MENfPciFd
         utBVGJJ85YxzEMu65lSeqLsN4qxt5dMfPah47SGFB9h0g8hvPAXjguYuf2allrbfFhcH
         9kXLx7+1NdwEW5ho0BBcTRcoOOkdv+UkEYyxv+9n+KlIDljuyCws2I0MpAuCE+SFbVbA
         pMxA==
X-Forwarded-Encrypted: i=1; AFNElJ8N5/Qbha8vCyYvJcSmi+0a031WAaNNVVTU1/QqrxNueaFys64Dqcb6B2OOXPFCT5xdl35+/1mHukfhuhbDb43EdvBg@vger.kernel.org
X-Gm-Message-State: AOJu0YzohvLJAemw+Lsy4xB6qaE9wXPb8IZ7uDlkTLSR1iBbwvY+WyYb
	e29Y1mvSLSuuBjTjxt+/JRidcmsRnAOXdPxf/BPfJ0GGUaimxRo3e/HL
X-Gm-Gg: Acq92OEdAHa8BLOfx00XdHnkIQ44pd0qmRz1v02xmoEWzsk1+GQ6ItHY59+wyJn0QLM
	3c0U/I+HGrq4rhk7LvQC9oeV1yb9ynivAyV7artXtkp9fjwSV8v7w6OGwUPDQVx27wfnInhwooX
	I4TnPokdoUPrhzmBr2D7qWE/xwcPW1a0+znRPvoWZzwXmC6z7P6KmxPD88isM1oLVBuVICIx5R+
	+Q4Hmw8CU4HcIv3ChT/pc8DXw1KuCpwULo/gb4CLRyXr1OJRMSJxTYqf1ZoFD+KNaTzVacz2BpB
	wq2b5WXjxmUy148PArZCpyoXWVKP6RPXx2Fi/gX108l6mzAmL7SHPrlsY67YgAexkXdym/HdUB3
	Pb5N3y1LF3crlte9owIDqCdKfKvY4RkIVVYpa7A6FjPXlSMxx9rmcTEocbIjKtO9tROEhk77gDk
	mQhJeKTyITVpGXfOdJDKi+uxv5lNs2pMGsIoYwE1c4cOR7jg==
X-Received: by 2002:a05:6512:1252:b0:5aa:678f:5646 with SMTP id 2adb3069b0e04-5aa678f5ademr2666938e87.8.1780322793547;
        Mon, 01 Jun 2026 07:06:33 -0700 (PDT)
Received: from [192.168.7.105] ([83.136.105.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef356b129sm32078117f8f.32.2026.06.01.07.06.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:06:32 -0700 (PDT)
Message-ID: <abeb9142-16a7-417b-be0f-b929234de6db@gmail.com>
Date: Mon, 1 Jun 2026 16:06:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Angioli Samuele (gmail)" <angioli.samuele@gmail.com>
Subject: [BUG] OV02C10 on Dell 16 Premium DA16250 (ARL): INT3472
 handshake-derived "dvdd" regulator registered but never linked to sensor,
 sensor probe fails with -EREMOTEIO
To: linux-media@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Marco Nenciarini <mnencia@kcore.it>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Language: it
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

On a Dell 16 Premium (DA16250, Intel Core Ultra 7 255H, Arrow Lake-H)
with an OV02C10 IR camera sensor behind a Lattice NX33 USB-IO bridge
(2ac1:20c9), the integrated webcam does not work on a vanilla
v7.1-rc5 kernel. All required drivers are in-tree (usbio, gpio-usbio,
int3472-discrete with strobe / handshake support, ov02c10, ipu-bridge),
yet the sensor probe consistently fails with -EREMOTEIO at the
chip-ID read because its supplies fall back to dummy regulators.

Summary
=======

* INT3472:0c declares (among others) a HANDSHAKE GPIO (type 0x12) on
\_SB.PC00.XHCI.RHUB.HS09.VGPO pin 1 (USB-IO bridge gpiochip,
INTC10B2:00, 128 lines).
* int3472-discrete successfully acquires that pin (gpioinfo shows
`line 1: output consumer="dvdd"`) and registers a regulator named
`INT3472:0c-dvdd` with init_data.consumer_supplies set such that
`dev_name == "i2c-OVTI02C1:00"` and `supply == "dvdd"` (lower- and
upper-case forms, per
drivers/platform/x86/intel/int3472/clk_and_regulator.c:219).
* The OV02C10 sensor (ACPI HID OVTI02C1, i2c device dev_name
`i2c-OVTI02C1:00`) calls devm_regulator_bulk_get() for
"avdd"/"dvdd"/"dovdd" and gets the dummy regulator for *all three*,
including "dvdd". The chip-ID read at register 0x300a then returns
-EREMOTEIO and probe is aborted.

In other words: the regulator is correctly registered and the consumer
device exists with the matching dev_name, but the regulator core does
not link them; `regulator_summary` shows `INT3472:0c-dvdd` with
`use=0 open=0` and no children, while the sensor stays on dummy.

Hardware / software
===================

Machine : Dell 16 Premium DA16250
CPU : Intel Ultra 9 285H × 16
Camera sensor : OmniVision OV02C10 (ACPI HID OVTI02C1),
module id 'CJFME322D'
Power controller : INT3472:0c (discrete), ACPI status 15
GPIO provider : Lattice NX33 USB-IO bridge (USB 2ac1:20c9),
auxiliary HID INTC10B2 → gpiochip1, 128 lines
Distro / kernel : Manjaro Linux, kernel 7.1.0-rc5-1-MANJARO
(vanilla 7.1-rc5, no out-of-tree DKMS modules)

Relevant log excerpts
=====================

dmesg (initial failure):

ov02c10 i2c-OVTI02C1:00: supply dovdd not found, using dummy regulator
ov02c10 i2c-OVTI02C1:00: supply avdd not found, using dummy regulator
ov02c10 i2c-OVTI02C1:00: supply dvdd not found, using dummy regulator
ov02c10 i2c-OVTI02C1:00: Error reading reg 0x300a: -121
ov02c10 i2c-OVTI02C1:00: failed to find sensor: -121
ov02c10 i2c-OVTI02C1:00: probe with driver ov02c10 failed with error -121

dmesg with `module intel_skl_int3472_discrete dyndbg=+p` (selected,
duplicate retries during probe-deferral elided):

int3472-discrete INT3472:0c: Sensor module id: 'CJFME322D'
int3472-discrete INT3472:0c: dvdd \_SB.PC00.XHCI.RHUB.HS09.VGPO pin 1 
active-high
[... ~30 deferral retries while gpio_usbio finishes coming up ...]
gpio_usbio.usbio-gpio usbio.usbio-gpio.0: [Firmware Bug]: GPIO 4 is not 
in FW pins bitmap
int3472-discrete INT3472:0c: [Firmware Bug]: ir_flood \_SB.GPI0 pin 
number mismatch _DSM 0 resource 352
int3472-discrete INT3472:0c: ir_flood \_SB.GPI0 pin 352 active-high

After int3472 finishes (probe returns 0):

$ sudo gpiodetect
gpiochip0 [INTC105E:00] (451 lines) # SoC GPIO
gpiochip1 [INTC10B2:00] (128 lines) # USB-IO bridge (Lattice NX33)
gpiochip2 [cs42l43-pinctrl] (3 lines)

$ sudo gpioinfo --chip gpiochip1 | head -3
gpiochip1 - 128 lines:
line 0: unnamed input
line 1: unnamed output consumer="dvdd"

$ sudo cat /sys/kernel/debug/regulator/regulator_summary | grep -A1 dvdd
INT3472:0c-dvdd 0 0 0 unknown 0mV 0mA 0mV 0mV

No consumers under INT3472:0c-dvdd. The ov02c10 i2c device exists at
the matching dev_name but gets the dummy regulator instead.

Suspected cause
===============

The HANDSHAKE case in int3472 was added (commit history under
drivers/platform/x86/intel/int3472/) on the assumption that registering
a regulator with init_data.consumer_supplies[].dev_name set to the
constructed i2c sensor name ("i2c-<ACPI HID>:<inst>") would be enough
for an ACPI-instantiated sensor i2c_client of that exact dev_name to
match via regulator_get(). On this DA16250 the device naming matches
(the dev_err prefix on ov02c10 is literally "i2c-OVTI02C1:00"), yet
the supply_map entry never fires and the consumer ends up bound to
the dummy supply.

Possible explanations:

(a) fwnode/of-based supply matching in the regulator core now takes
precedence over the legacy dev_name-based supply_map lookups, and
the sensor's fwnode (a software_node created by ipu-bridge) does
not reference the INT3472:0c regulator -> the supply_map is
shadowed and dummy is selected.

(b) The sensor i2c_client created via ipu-bridge has a slightly
different dev_name than what int3472 constructed via
I2C_DEV_NAME_FORMAT ("i2c-%s") at probe time (possibly due to
sw-fwnode instantiation differing from acpi_i2c enumeration).

I am happy to provide any further data — DSDT extract for INT3472:0c
(both _CRS and the _DSM result for the GPIO at \_SB.PC00.XHCI.RHUB.HS09.VGPO
pin 1), full dmesg, lsusb -v for 2ac1:20c9, and any patch test results.

Thanks,
Samuele
