Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C50AAD2C
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 Aug 2025 22:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162456; cv=none; b=dAHVBdg4ccB2tbuYHgZEVTjQATE50FYlwGhVJ0iWA/EVe5QUAFsAi2b7a0wguose20hfXfchTpaUDN1NHYi3h0fJ56VgMx+C0RFOBEpGjL6sa2XLuaJjoW143axQdVAJ6+QoIH0VBmcgNc8i7eDo63slvjouALnFtckd1uO9GwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162456; c=relaxed/simple;
	bh=1MHXHFabpm+KE/tfymJ5gATmcoviHT0V+KsI4zlWT0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=saSzGW/2bX3A9oDEBnaFoPHq7BOZi95U/f1zV8VzOzfGoEBnqke1D7hDEaIDygthSD/A8r7ZGa8IQTMcLpNSmB7ZtxjYyJ9GNHOrCFUVzk9F8G1onU2jmC8WaeVMuVZO/YiGUuEaosCbdjB2VEVptcJTN2vIFb023ydzScFdEiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6at/HXS; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6at/HXS"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b109c59dc9so67503381cf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Aug 2025 15:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756162454; x=1756767254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=up6z4zDYFkup+3pgFJw3BQj3zMktQbvmNW5/y2mrUco=;
        b=j6at/HXS8tEbjVqPb0RluQT1HD7KereYUsDLjPoKMGZciCEbZS4EtnHmcnK/d7VpeL
         BXeO9P6ow5ADw+ov6eXiNFhv3Ht3YiqaKgTrkY+2/XUpqZFhUcgMhQOt2lB0Cp56Fgqx
         qscDMtGtO2janMdoja0///Xl4eoSXq5rck7wRQXO8JZnvSm2rns+OXph/L2/7F96rrlf
         AXw/KFbGWwJFbBZEP4dmSMBzSI2EvcnB7kPYRCDCaqZXMscjNOhi675tavv//yr1J/mb
         9P83ipgvl2yzqgr4Sm7k/pc+xZXLYD9cuqR7m8ihYULDycLMrvJHYutd8t88TwScfoF4
         85Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756162454; x=1756767254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=up6z4zDYFkup+3pgFJw3BQj3zMktQbvmNW5/y2mrUco=;
        b=QEhPF9N8cNIhx85+/bdBWRrcQT9or9PASxHbhDfB0P0B1f5dN88D5OlcRkfOgeulzX
         5dUEpXge77Q52Z2mp/8wmzC37wdnQLRYorZ0LCSDcgDePnkY3mesJ8mrP6GiJVQKt9mH
         vXE+O0r7rgmQRBlJkF/ZxmatJ1zJZ/SbJWOpwidWdv/tamW3vVKR3CPq4PGDMW1IWrww
         i3x4sIisz2xYEHpgKg2yPQq/L7d9J3sVECjQcHgyidJzayYr8CihbcFWFeiZkT7wYmqm
         Lo1Bb+N0peSzQpMC49Dk0S5iQVu+WdDIg0QYuL0WW9XHVjyi+mnm4WciVlhBrK9bq+N5
         HAFg==
X-Gm-Message-State: AOJu0YyfszCICWzGHeOzcpnLKgEIEsgDJscl3QaM3BLYMT8uNQRIRG8K
	6JU8eeYUsZy27rZXbUekq+wj6tl59tiPfyWgUFrPMf+/XlSynEwg7E5hE+8JEQ==
X-Gm-Gg: ASbGnctnXIeV58ctA3FJaECb4dW4mX0TvcLMz2QfBgSHvU6KniHZefgi+sAJ8fbUAHS
	AjJX3MK8vCmoHO/Nli8Hmjl66Siu8+vZmz8JbchOVGc+vgISSJeJ7Ap9CuT1/FRkp5BVeErMd5J
	yTVR9t/CrbuxtkuYCjPra39Zn2IiSIBdREPWLeEh/UCv133kzImujFfu2QjOG4mLWmdVr5mnp9u
	5mwGSoAjt2i1GIhIY9X+lamxGOsjZ7hiIzXQwBmwWaNjOnmVCuD8+H5aV2HGcxhXHTbpC/TLH4h
	TcY7B4Zed7iN/DmQ7TzJy4t0an3k87KGHgKcoBHCyiOqZj47IbbJ9xL5gjsRrpU/pD4tVNBv1Hs
	h5MRfgKlmK4fDzpJ57oKMh53wb9mFRwQRTQNq4+cmfdhd4x3pMOv4fc9mGLUOO2C9vZcooI78bs
	Nfem8sEXM3dmrUPMAMShPdMr5S5r62X94dvPFN
X-Google-Smtp-Source: AGHT+IHLbtfNJr+vvnmUKcr24Fvjlqfj2cbab7xtw8Y0asEC64pB56Qp7C1/a0DgwQdA7dsbJPT30w==
X-Received: by 2002:a05:622a:4d4a:b0:4b1:1351:e3e7 with SMTP id d75a77b69052e-4b2aaa0257fmr146494901cf.8.1756162453637;
        Mon, 25 Aug 2025 15:54:13 -0700 (PDT)
Received: from davidm-laptop.home (hlfxns018gw-47-54-39-96.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.54.39.96])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7ebed79a712sm570754185a.17.2025.08.25.15.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 15:54:13 -0700 (PDT)
From: David McFarland <corngood@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: David McFarland <corngood@gmail.com>
Subject: [PATCH 0/1] platform/x86/intel: hibernation aborts due to spurious power button event
Date: Mon, 25 Aug 2025 19:53:55 -0300
Message-ID: <20250825225404.143288-1-corngood@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Last year I submitted a patch that partially addressed the issues described in:

https://bugzilla.kernel.org/show_bug.cgi?id=218634

I recently got a Dell Precision 3680 workstation, and came across the problem
that's still affecting some users in that thread: when hibernating (even from
software), a 0xCE (power button down) event is received, and hibernation is
aborted.

I've attached a patch that I'm currently testing. I think it makes sense based
on the pm.h description of freeze:

> Analogous to @suspend(), but it should not enable the device to signal wakeup
> events or change its power state

However, I'm not sure about the implementation. Perhaps it would be better to
set wakeup_mode in suspend instead of prepare? As it is, wakeup_mode will be set
between prepare and freeze, which feels wrong.

I also did some investation into the source of the spurious events, but I'm a
little out of my depth.

A normal wakeup from suspend with the power button looks like this:

[ 1549.112851] intel-hid INTC1070:00: pm_prepare wakeup_mode 1
[ 1549.117033] serial 00:03: disabled
[ 1549.173790] e1000e: EEE TX LPI TIMER: 00000011
[ 1549.363439] ACPI: EC: interrupt blocked
[ 1559.055878]    evmisc-0132 ev_queue_notify_reques: Dispatching Notify on [HIDD] (Device) Value 0xCE (Hardware-Specific) Node 00000000a22ff378
[ 1559.056071] intel-hid INTC1070:00: event 0xce wakeup_mode 1
[ 1559.059997] ACPI: EC: interrupt unblocked
[ 1559.736517] intel-hid INTC1070:00: pm_complete wakeup_mode 0
[ 1559.747551] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/tgl_guc_70.bin version 70.44.1
[ 1559.747555] i915 0000:00:02.0: [drm] GT0: HuC firmware i915/tgl_huc.bin version 7.9.3
[ 1559.749329] spd5118 0-0051: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
[ 1559.749334] spd5118 0-0051: PM: failed to resume async: error -6
[ 1559.749627] spd5118 0-0053: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
[ 1559.749631] spd5118 0-0053: PM: failed to resume async: error -6
[ 1559.749996] i915 0000:00:02.0: [drm] GT0: HuC: authenticated for all workloads
[ 1559.750719] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[ 1559.750720] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[ 1559.751300] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[ 1559.751343]    evmisc-0132 ev_queue_notify_reques: Dispatching Notify on [HIDD] (Device) Value 0xCF (Hardware-Specific) Node 00000000a22ff378
[ 1559.751396] intel-hid INTC1070:00: event 0xcf wakeup_mode 0

The spurious event in hibernation looks like:

[ 2510.569198] ACPI: PM: Waking up from system sleep state S4
[ 2510.570714]    evmisc-0132 ev_queue_notify_reques: Dispatching Notify on [RP02] (Device) Value 0x00 (Bus Check) Node 0000000074f801ab
[ 2510.570775]    evmisc-0132 ev_queue_notify_reques: Dispatching Notify on [RP05] (Device) Value 0x00 (Bus Check) Node 00000000bb982283
[ 2510.571061]    evmisc-0132 ev_queue_notify_reques: Dispatching Notify on [RP21] (Device) Value 0x00 (Bus Check) Node 000000009ba3a342
[ 2510.575365]    evmisc-0132 ev_queue_notify_reques: Dispatching Notify on [HIDD] (Device) Value 0xCE (Hardware-Specific) Node 00000000a22ff378
[ 2510.575369] intel-hid INTC1070:00: event 0xce wakeup_mode 1
[ 2510.575715] ACPI: EC: interrupt unblocked
[ 2510.602774] ACPI: EC: event unblocked
[ 2510.602887] intel-hid INTC1070:00: pm_complete wakeup_mode 0

There's some code at the end of acpi_pm_finish which sends a power button event,
but it doesn't seem to be hitting that.

David McFarland (1):
  platform/x86/intel: disable wakeup_mode during hibernation

 drivers/platform/x86/intel/hid.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

-- 
2.50.1

