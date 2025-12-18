Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAAA4C79
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 08:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766046401; cv=none; b=iSQWmZ0ds/VgUgFmxjjlqWhJZvjLkpp/sB5YsWP9pnU0zetw/fN2hn/uAmeuUKXcMKq//GxaD/8pRriAPgxzIxDPsYsyP14zAjuHsh4UDMTEGbvoZVE28vjiLLsVoJbk4krCxDfkXMwBHgoQV0x1ojlqKSVyH5JxUrQyPKa6W9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766046401; c=relaxed/simple;
	bh=TafDWPGT2uac8tFoxqnsQMcCLC1BWRvN6Nvuh1FCZvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aMxSO8Erqu/ZX65HX89RtQoXTJ4aHIpcBoCYq7laB69b1WuhWPMZXAn3oGZyi9MZwdDyEewrTKBm9dgWTBsV7gD+eB7hmIEi6pwtT6c6D1Q4/C8fB4KPsBhN2dFhsuO5WsD3O5nltqi5gfJmRHxgROXigD0gx4bwQC/RWw6H8FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFpBIzrq; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFpBIzrq"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so472505b3a.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Dec 2025 00:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766046397; x=1766651197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQJUNYwC1e0jDgeb4YzHJlg75Gqr1c7azJgTBpIUepQ=;
        b=OFpBIzrqcDVFV0/PY+yfRUcdnr1QZ8fxnzG73HDhVfWHD+9988IUplvLYH1NTe0FED
         /2Ag0FTVCfolaO11BeI8lAhLwtS6NVzav2i7rMifG5ET7BAcnbVjvNv8bO37Zb3ewVB1
         b2/gPnudS+W3G+FjWy8zrtDVVjIKJUNdpkcwVgmicQ37plQqVhbyuaJtoAYvPeoDkQGf
         wm6oy8xxOI88OAECn8AkVRiX1XXnNpSLounbzXQWoxWpakECB0PBJu0QlLqUIBImlxmQ
         377/QgOjaHWT+XTs3CumgqYeOQ0taXQ1nXcVQ4w3FwEkHUkx5gTq/pw59jldWcdpj6KR
         LCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766046397; x=1766651197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sQJUNYwC1e0jDgeb4YzHJlg75Gqr1c7azJgTBpIUepQ=;
        b=OUFVv8tU2BEPpvGAWXydSSUZWCFYPcvzN1yc/YbNI5ZNj918gTMWw1EBNo2QFcU5IX
         gxu1MN4JFDctDZR5Ld4UXx8PJV0Su/K3rUscOj7vzuLEnpefYhliiZMrh+SPe6csSdNt
         norZ+VstyijnFntXSRYjabY/vF6flqi0CGE+vM4txmMYeflvq5iktz+r13rO68AsaxsW
         maRNuzMNypOLkhSJ+tweh/hjMomnghJeXEmTC3XmApTACBRpc7V65awix1V6YrVsRfz9
         zWeyed1vRFsc4NFU29VTJ/O+N8Vc6B9W8sAYHswrI/U45EQZhlxVzI3pt1sRiIeROBFG
         hNdg==
X-Gm-Message-State: AOJu0YxmqpO52ynamRrKC8QFcf5760wRVu2ihMDXGcDKQHegB7cXq+Cy
	NtOCioQf497F+EDiuNz85jpcrBtNvnB2wn4vLfbul5nzTSTQOEZCgPnQjN90lg==
X-Gm-Gg: AY/fxX6RzpM8+nExfen5fSDVv4sdCijmzWRIbbiD/k8/9h0prnDeCka4FT5fOZ/u4hf
	a/g6h0WzVBbnXPnitzLtkcI9IST96fJ71RqWMEHGDQ46pj3wTuFsPHNIHweQFjiobH3aFGCFjy+
	7q3x+k1bZ13ynyrAsTk8MWOpCUVCa/4xt5k2hPd76lfH4BaZk6cIBuDISD0vjoHNhShAiPwRj7R
	WSs4DDt+2HiPK7scfCwa2nk+TJ4v16QAH/5Er6ftIfT8QE0FHC4dwRj4mvT7Mspvf8QbmRB8LIt
	N5duPFckRIKlnJOrkH/gVTGCf3zBtbHkH87zKuVdbLx4WHIHOel0rXG627yXo5DLxWu9++uZYwz
	QRCvAYeQ438SrHIe+oIx+o4uX/1w00H0kf3SPRGI3eSRLzIZu4U5JtAm7AIJ6xmWpnpqoSDAO8b
	hgvZuzrXKVzleQ4URnTvc=
X-Google-Smtp-Source: AGHT+IEGofcpxflPL0bUL0HmxfAYSWFncuKsLOECWrps6YAbku/CzM3+lGSH0BUGdnxmS7neQag5Kg==
X-Received: by 2002:a05:6a00:330a:b0:7aa:17f0:f63c with SMTP id d2e1a72fcca58-7f6702be84dmr20413002b3a.29.1766046397321;
        Thu, 18 Dec 2025 00:26:37 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:9e18:7101:be84:75eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe121222bcsm1817973b3a.19.2025.12.18.00.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:26:37 -0800 (PST)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>
Subject: [PATCH v3 0/2] Fix Omen 16-wf1xxx thermal profile and add EC readback
Date: Thu, 18 Dec 2025 13:56:27 +0530
Message-ID: <20251218082629.567911-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes incorrect thermal profile parameters sent for HP Omen
16-wf1xxx and implements hardware readback support for Victus S thermal
profiles.

The first patch refactors the DMI handling for Victus S boards. By
moving from simple string list to DMI system id table with driver_data,
we can now map each board to its correct thermal parameters.

The second patch implements "get" callback for the platform profile API.
It reads the hardware state from EC register 0x59. This ensures that the
driver stays in sync with the hardware during driver init and power
source change events.

Changes in V3:
- Moved DMI lookup to hp_wmi_init()
- Marked DMI table as __initconst
- Renamed `eco` to `low_power`
- Added second patch to implement "get" support for Victus S devices

Changes in V2:
- Refactored victus_s_thermal_profile_boards to use DMI table
- Implemented driver_data to handle thermal profile parameters
- Moved enum definitions earlier in the file for thermal profile
  parameters

- Changes in V1:
  Initial fix for Omen 16-wf1xxx thermal profile values

Krishna Chomal (2):
  platform/x86: hp-wmi: fix platform profile values for Omen 16-wf1xxx
  platform/x86: hp-wmi: Add EC offsets to read Victus S thermal profile

 drivers/platform/x86/hp/hp-wmi.c | 259 +++++++++++++++++++++++--------
 1 file changed, 197 insertions(+), 62 deletions(-)

-- 
2.52.0

