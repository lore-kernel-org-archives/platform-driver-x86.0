Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE723CF1FA
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 23:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873201; cv=none; b=LmI1prhhOGgs50qNDUPVsOjj6828x14ADKrAG8NxGId+5Fu3un49hb/hEd4wyMSFikZir+KXcxdS4pvCrHGJW7HOzRq9Z8EX7aduixAnPCad4THMMCADFDKhiNigHhde/CPRJwbvW+LoQRtzLV+Y1gP4N8UAI7t1C3OIX62ft+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873201; c=relaxed/simple;
	bh=YksPChi/EoVfJI9NHvL0KIqXyqu81Sg4wRemUaUylhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M1AlyTogyWMpqD/VXeXOSxwbf4iXSUn3wdgAMIl03pB9K+uuETcBtqZTgsz5GQWm+dFLKpP+DrEMtMUwqj17XympaRaoFVbN8NTliSmadJIevoYDintnn3Rvck4XibCkx/Eqc1r8KD5/VLi0yTKu03kapyqSWNyktr/WAyof+/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qd6lLyBn; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qd6lLyBn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fe89fb333so227948f8f.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 16:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787873196; x=1788477996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rhxvKj9HTkh2M35sEpZ3bErnbD52nBKxqfsNzhJSlms=;
        b=qd6lLyBnpEtoJByhF9XVfUmDSpqV3VFlpb6wAAfVcdnpXX5jPjgFhKC6XOklAj5Q1m
         Q5JAwyxCLfo1iSr1wSreFMfpGlvbyoaSTw5IG591FYGewQ4q0dvfZeNXc64xRc3ORY3F
         nbJKAJmk0zESSoQJ3Ddib4iEFcZLawPkSRn4l6EyPG19P/pcDoCasnBV0dOQ9HuG6sau
         5KkUvViKuIHik93niWt+ovF/cF8b1ZWdVjdxgebILREcdl6WrLLx7+T1dWxqitZ+eiXA
         0C81I5KUkUIkfdlhLRiP/gF/cl8Dxdblhg9HfAGP4y7IcknApf8hscu09RXl5n3C8TBS
         RUsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873196; x=1788477996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rhxvKj9HTkh2M35sEpZ3bErnbD52nBKxqfsNzhJSlms=;
        b=Eaxsy0XOD1eQcSYPZnQLE9BpuGRLl8rhLQwAF48oO+PdNkqEprh9raWBJC5P1lGqVs
         SzlniRTQiouEsUxj7s4eU/cFRSG7I0haHGDVcoRS+SMMqfaZ0AInb1zhDWnbTS+Gtoms
         ltj/gw4LP528gRQMmPVjv/xtsHNTrWw9iNF4DuLfKKh2Yths/njo6AfI2iAHOXNTjoik
         osl5vdd/AnJ/QsZNRgSBA12y0t0VYD2xmJq1BkrOapCDaYVGeZ9wP914qEKJZ1CFx+VA
         +6Cs7OlfpGS+skBjee++DdA4aOjUh/YKI6O8bRlQHHHxk7ufzBwDqQ8clJckpkX2eyoT
         0lvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbYTF5z9XkX25av07SbLW+Mg+DY4GVpnEBusNErbBaPBGI5Ka+LVS6OmuUMP4fCKjvRQFf0viKGKSk16SiAF2ATbyT@vger.kernel.org
X-Gm-Message-State: AFuF++nwAENYL/NRdLoAvEj0DJqw/sKjF6QHNbezL+sXY+fQabfetn2F
	tJAPJ8tZQY+n12Yw0LCGy36Y8CtGxZzYXAXjcXZ8uQYAOrU7geKSZAk=
X-Gm-Gg: AR+sD13wh7Q3pLJW+q1F+LUJxmEoUadWusrXHigg5FUfVLlKN8lfEt/y2vs1xpfmGW/
	4lZeMppJWU/zwCdM8KFsRJAm9hp33CdXttmWWFHy1kH4FiuMP2Nfoz6FS2SQ4gPk1Hb15HXMtDx
	k/je/IVu9qQuMNsviUtxihCQ/Gl9fsa6LgMG90VV/iwMW7Y/Wwsjz5hwNvoExjQaqBdWeTIQzoA
	UvIzoM5W0zjnThQnJKxrWPoWNGzeGWcbUd96CtEMDkE6Ier7FUt5xZ9g08tyoo45wplblykzdjX
	jRtbgZFAaKaUJ8ACYSXv0/1zPsqoHAY4fMWAUuXlGPGWUGSWt8pS2hQwCYrVMBRqoyj7UH2Gn7R
	Xgv4YYeOSHEzrXGyc98fB+F8s4RWRVbkUEyWfnkQ63QciZExr3m79mlqPQJOctqO5WaGsZwcIiN
	V/Kr5g84tG+VoyZScGLqZV6eGmcpVn6qUT6QYgtHmNd3LjC67xLC+K+Lr1/pTHcVLRDxsM2Z5DJ
	UNJCivSHM/N
X-Received: by 2002:a05:6000:4a1e:b0:47f:96f9:a99f with SMTP id ffacd0b85a97d-482f79bf369mr3206807f8f.13.1787873196396;
        Thu, 27 Aug 2026 16:26:36 -0700 (PDT)
Received: from surface.. ([217.61.227.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbe29sm12550988f8f.17.2026.08.27.16.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:26:35 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "D . Manresa" <dmanresa@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: int3472: discrete: 4-char GPIO supply name limit and unhandled vendor GPIO type 0x08 leave OV8865 unpowered (Surface Pro 7+)
Date: Fri, 28 Aug 2026 01:26:34 +0200
Message-ID: <20260827232634.93131-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On the Microsoft Surface Pro 7+ the rear camera (OV8865, ACPI INT347A)
can never be powered up by the int3472 driver, for two independent
reasons: its second power rail is declared by ACPI with the
vendor-specific _DSM GPIO type 0x08, which the driver does not handle,
and even if it were handled, the supply name the ov8865 driver most
plausibly needs ("dovdd") cannot be expressed at all because
GPIO_SUPPLY_NAME_LENGTH only allows 4 characters plus NUL. A related
con_id mismatch also leaves the OV7251 IR camera (INT347E) unpowered.

Hardware / kernel
-----------------
- Microsoft Surface Pro 7+, IPU6 Tiger Lake (PCI 8086:9a19)
- rear OV8865 at ACPI INT347A, discrete PMIC INT3472:01
- IR OV7251 at ACPI INT347E
- observed on linux-surface 6.19.8-surface-3 (base v6.19.8)

All file/line references below are against mainline v6.19. The
linux-surface patchset does modify this area (see below); where the
observed dmesg comes from its downstream patch this is marked.

1) GPIO_SUPPLY_NAME_LENGTH cannot hold "dovdd"
----------------------------------------------
include/linux/platform_data/x86/int3472.h:36:

	/* E.g. "avdd\0" */
	#define GPIO_SUPPLY_NAME_LENGTH				5

and skl_int3472_register_regulator() enforces it,
drivers/platform/x86/intel/int3472/clk_and_regulator.c:204:

	if (strlen(supply_name) >= GPIO_SUPPLY_NAME_LENGTH) {
		dev_err(int3472->dev, "supply-name '%s' length too long\n",
			supply_name);
		return -E2BIG;
	}

"dovdd" is the standard OmniVision I/O rail name and is what sensor
drivers actually request, e.g. drivers/media/i2c/ov8865.c:2970:

	sensor->dovdd = devm_regulator_get(dev, "dovdd");

At 5 characters it is rejected, so no int3472_gpio_map[] entry and no
future type mapping can ever route a GPIO-gated regulator to a sensor
driver's "dovdd" supply. (The buffer that motivates the limit is
supply_name_upper[GPIO_SUPPLY_NAME_LENGTH] at int3472.h:101.)

2) GPIO type 0x08 is declared by this platform and unhandled
------------------------------------------------------------
The _DSM of INT3472:01 declares a second power GPIO (pin 0xaf) with
type 0x08. In mainline, int3472_get_con_id_and_polarity()
(drivers/platform/x86/intel/int3472/discrete.c:169) falls through to
the default case (con_id "unknown", discrete.c:232), and
skl_int3472_handle_gpio_resources() then ignores the pin entirely with
the warning at discrete.c:376:

	"GPIO type 0x%02x unknown; the sensor may not work\n"

The warning is accurate: with only the type 0x0b rail powered
(registered as "avdd"), the sensor's first I2C access fails with
-EREMOTEIO and probe dies. Verbatim dmesg from this machine (note:
this kernel carries the linux-surface downstream patch,
patches/6.19/0013-cameras.patch, added for the Surface Pro 9, which
registers type 0x08 as a regulator under con_id "pwr1"; the first
three lines are from that patch and would not appear on pure
mainline -- the end result is identical because no sensor driver
requests a "pwr1" supply):

	int3472-discrete INT3472:01: GPIO type 0x08 detected on pin 0xaf
	int3472-discrete INT3472:01:   con_id=pwr1, flags=0x0
	int3472-discrete INT3472:01:   register_regulator returned: 0
	ov8865 i2c-INT347A:00: supply dvdd not found, using dummy regulator
	ov8865 i2c-INT347A:00: supply dovdd not found, using dummy regulator
	ov8865 i2c-INT347A:00: failed to perform sw reset
	ov8865 i2c-INT347A:00: Error -121 runtime-resuming sensor, cannot
	 instantiate VCM

3) The rail is real: mapping it powers the sensor
-------------------------------------------------
Mapping the type 0x08 GPIO to INT3472_GPIO_TYPE_POWER_ENABLE with
con_id "dvdd" makes the OV8865 probe and stream correctly (verified,
including the dw9719 VCM coming up). Which physical rail the GPIO
gates (DVDD or DOVDD) is unknown -- ACPI provides no name, and "dovdd"
cannot even be tried because of (1).

Related: the INT347E (OV7251) power-enable GPIO is registered with the
default con_id "avdd" (discrete.c:222), but the ov7251 driver requests
vdda/vddd/vdddo, so that sensor is never powered either:

	ov7251 i2c-INT347E:00: ov7251_write_reg: write reg error -121:
	 reg=103, val=1
	ov7251 i2c-INT347E:00: probe with driver ov7251 failed with
	 error -121

An int3472_gpio_map[] entry mapping INT347E POWER_ENABLE to "vdda"
fixes that one; it fits the existing mechanism.

Reproducer
----------
Boot a Surface Pro 7+ on mainline v6.19 with the IPU6/ipu-bridge stack
and the ov8865/ov7251 drivers enabled. int3472 warns about GPIO type
0x08 and both sensors fail probe with -121 as above. (Note the INT3472
GPIO enumeration only happens at probe, so each test needs a fresh
boot or driver rebind.)

Workaround
----------
We currently carry a local patch (not proposed as the proper fix):
it maps type 0x08 on INT347A to a power-enable regulator whose con_id
is a module parameter defaulting to "dvdd", and adds the INT347E ->
"vdda" map entry:

https://github.com/dmanresa-saes/surface-ipu6-cameras
(patches/int3472-surface-sensors.patch)

Open questions before attempting a real fix:

- Should GPIO_SUPPLY_NAME_LENGTH simply be raised to 6 so "dovdd"
  fits, or is the limit load-bearing somewhere beyond the two arrays
  in int3472.h?
- Since ACPI does not say which rail a power GPIO feeds, is a
  per-sensor (HID + type -> con_id) table like int3472_gpio_map[] the
  right place for these, entry by entry? That does not scale well.
- Is there any documentation of the vendor _DSM GPIO types 0x08 (and
  0x10, also seen on Surface devices) from the Windows camera stack
  side that would let them be handled generically?

Happy to test patches on this hardware.

This report was drafted with AI assistance (Anthropic Claude) and
verified on the actual hardware by the undersigned.

D. Manresa <dmanresa@gmail.com>
