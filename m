Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3649C3D170C
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298945; cv=none; b=EX0bi4YWss6OiLl88xssilTA0+OBKycZ60ttVXY3f0Uy7+h2EAUDKu2g6QNbSk+Ni39PEt1pf2HIM7oG61N0r61jn+KUMJmyRTczgKjExB6P8E2U43F+bzkUM/rw2rf15Vm13el4u0qnW+A1Bwu6i9zEVC90OwJMPq0+xFSjzTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298945; c=relaxed/simple;
	bh=6iBp5T/boDDw3f8vu9674vxoHItIhbflv+gOtQ8i928=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wsp3SzbH+XDsLa1MUWnBMXXdpZHhyZVgae3yPJqVDuCmo2Kzmr5iA4fY1XA0a0oSnzCLB+GU2sEkxU4QuBBA4f51yP8itoZ9wPGukq7DRBBiIiBMGvDs8J8n8TQ/t6QBbHeLTWjz6jLDSfM5/F6ZTsRCa+Da+Twv60cdn6rtJ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhD6B8wF; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhD6B8wF"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ae3a007bd1so11552915ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 07:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777298943; x=1777903743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0xqpRZaDGVxEqa2CyY0E4vPQn/D7tfhzxeK6F4mGsO0=;
        b=ZhD6B8wFNKys5HD7qL9JidzIVzeFrjpKTu/2Xpx190l37XkrceE4rxp1mXHDv9uw8K
         30YxUnvrqCzhrNYtwb+H7D8xwkM96BbpaTMmwEYTkx0jv/7Y4Ksvq+/Bdzzr1ffZNqDE
         jRxO5ZHP1nBA9zQWfaFljjITN4J23Pzde01yQEDfi5HFw3OOx4hP83w/OWgLryMDwFkF
         5ut63ux3uZFgItjur0ReAKicMSpi5KHGxeUDB4hF8PWOfY4FC4C4mqlNopPHVqlD31x1
         eXsWT0fbxIoeCTkP1uVMVDn8fbK8lvbO/Th9kn7sqppO2b7koGqQy2SH5r7/XQs7bGO6
         FmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777298943; x=1777903743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xqpRZaDGVxEqa2CyY0E4vPQn/D7tfhzxeK6F4mGsO0=;
        b=gyGWig2+nQjtWZRBtAXL1WEwjUNqZ4cWSwrqPBFHqynTsHtAYY+XfXIhG00H06vhck
         js3MjIF3zWX/M6QQ1qudbpW0XfVVJ2qe2WOcZd8cI87fhMb1vA/7n4sSvW0JnYSab8uV
         PDpbgwovMAeb/FzochbGDFliBBKqnxG8pWli926I0M613cjDB2KqoBWVPo80RV1UT0vf
         JkQp6bDeq2mcxzXA2WNteHs7SIvOX+gWbutP/VQ4FvXUN3MGP5ky88Oo8X9Xy0MxX25f
         JIA5BWf6p0WYfoKGcESKawsP4zHyMNNfYu4Guen2O2WHMU+74lguRTtUpOBYsJNfAKmr
         NMgA==
X-Gm-Message-State: AOJu0YwTtsAtrSOGhKAQ7nYC9vdR4+8VlA6pC8tcEQ4t8wJQGWAb9Mtd
	0z/JMy0sz8PZQNt3m3STtwZh6ZAg9xHF1pyyGoQobf2HuKutsS+AjfEWXkG2x9IQ
X-Gm-Gg: AeBDiesYK9quVh4WLEpIpWNdYIB5dEaTpT17+u7FJVLdGsCoXEY/eDHUfoNCqL7DNRO
	Mt5yPrxxJBl8msZjl6AOM54uXQgHhkv8HgYg8pXihKxYSOaZvB9WqWrq3QoueVzsStuapURpzUA
	bv/HWGpEAfthBdqkUXXUoIUejkpRBVL0WMrFIlKLyeW+dNe4HRYs9Ak9+Y6eRz6g47df2IUQJOq
	Fbw1j6wTkZRqSh86EdA7qvp8kv9Jh7zPPaEIDYKI1qV51kICUQTF9XyNiStH/pAAII1gKl2s08M
	CvC1aPXNjj+qNGjmE9xgiGNugnsHQU8NGL0oxCOkMr28y82vPe+7xBY0g/4DiM2pE6CNPjDsRQz
	P2Nvf6LV4U6LYaU8XaoEUvEbtjWPxYTfUnrL3NDxVLvpphbEvtY8/rrJLzZJdA/1Lc6XHkO4U3d
	NZHIszcTWH88m7wQjBaP4PZT8vT1tJZM3o+0sKT4/Y
X-Received: by 2002:a17:902:8696:b0:2b2:5c84:32ba with SMTP id d9443c01a7336-2b5f9ece9f3mr169617925ad.2.1777298943363;
        Mon, 27 Apr 2026 07:09:03 -0700 (PDT)
Received: from magniquick ([45.112.148.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff98csm307322975ad.3.2026.04.27.07.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:09:02 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jorge Lopez <jorge.lopez2@hp.com>
Subject: [RFC] HP laptop charge mode control via POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR
Date: Mon, 27 Apr 2026 19:38:57 +0530
Message-ID: <20260427140857.397971-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I have been looking at battery charge control on an HP laptop, and I would like
to check the right upstream direction before preparing a patch.

This is not a new userspace ABI. The kernel already has
POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR, and some existing drivers expose charge
modes without exposing charge thresholds. I am trying to confirm whether that is
the right interface for this HP firmware interface, and where the implementation
should live.

On this machine, Linux currently exposes no native battery charge thresholds:

  - no charge_control_start_threshold
  - no charge_control_end_threshold

The existing HP kernel drivers also do not expose this feature here:

  - hp-wmi does not expose battery charge mode control
  - hp-bioscfg is present, but does not expose Battery Health Manager or related
    battery threshold attributes on this machine

However, the firmware exposes working ACPI methods for charge mode control:

  - \SBCC 0x0000 -> normal charging / auto
  - \SBCO 0x0500 -> inhibit charge
  - \SBCO 0x0200 -> force discharge while on AC

These mappings have been tested from Linux by observing battery and adapter
state transitions:

  - auto allows normal charging
  - inhibit-charge leaves AC online and reports Not charging / zero current
  - force-discharge makes the battery path discharge while AC is connected

My current thinking is:

  - expose only POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR
  - support AUTO, INHIBIT_CHARGE, and FORCE_DISCHARGE
  - do not synthesize charge_control_*_threshold properties in the kernel
  - leave policies such as "resume below 75%, stop above 80%" to userspace

For driver placement, this seems HP-specific rather than generic power-supply
logic, so I think it should probably live under drivers/platform/x86/hp/ and
register a power_supply extension on the battery, similar to other platform
drivers that use power_supply_register_extension() from a battery hook.

Does that sound like the right direction?

In particular:

  1. Is POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR the right ABI for an HP platform that
     appears to expose only mode-based charging control?

  2. Should this be implemented as part of an existing HP driver such as hp-wmi,
     or as a small new HP-specific driver under drivers/platform/x86/hp/?

  3. What should the driver gate support on? For example, should this be gated
     by DMI quirks, HP WMI/BIOS GUID presence, ACPI method presence, or some
     combination of those?

Thanks,
Navon John Lukose
