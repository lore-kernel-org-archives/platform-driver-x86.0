Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861662;
	b=0H87sm0jdpqpw/Gt5lLO27EW8t3LMKqv8xuivbFbG/e95u6m27T1pkwLo7oE1iTDJIjj
	 AnU0wX60iE1ZdVC9AxctAJmXVcefgBsDd/ITUq3+tMkLm5+5NvJmRBkjf25biaRbkmlDa
	 4UXooGskGcf4+jqK/jPzBazMytI39tphRjLQXOWKEAFyr16rHfcemtl3Picb/B4/Dh5xs
	 eKb1fKnhGJCNNiXm53iyocDfaxfNUKu8jRNOecPMZSHVkiURkAbjrl1E2FbShavwhVjaR
	 ceBKMi7Mxgfi3oMkGm0rOU2pCCNemhit4go+1UCdbcvF/4hGzjnI1QXDT9tL1kQtphQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KwupKsUiOqn7cLay4MlUcBS/p/Juvy45qENBSa3w+E8=;
	b=blXD8B/QrKXZpitRkJ4iDr5xruxejSH+mVAbs0OtR6+MoDflOsnKXV+W7V5ofgC4S/jh
	 nkDvxEPSCm/8ylvTgz6lGp/EOlyztF3xURNMVJi1QLx2A2h0fOs3CuXwYMzGwpcJw/36j
	 j2ulBeQ2xpsaNgjF1DuUEuaZYsJeat5tUmB2b5GH+oXS4RoyN1i7fFCpQHgb0fOtym+rR
	 eWxGjhmF5I9p/KorcAyKOjreRjxz15DtCW1Pw+zFKoG6dYG1O6Of0pw0ioc8RvnxgeFyO
	 nP9cdG2VQ9fGY0va/js9KyzDoiIwCrb84wytt8MLaRJF4WRqqe6sCZ5Jae+4Lqt/CgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgJq43AU;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E65606A323
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 20:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3E65606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QgJq43AU
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ed1414df17so18916365ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 12:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861661; x=1795466461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KwupKsUiOqn7cLay4MlUcBS/p/Juvy45qENBSa3w+E8=;
        b=QgJq43AUWZHaO8+QO4KXF8guoz9iXvueKPsr3RlpasNEDj24iCSCWKMJMeh4SpSbCx
         3Xm/m6fFLHiuZkg5SKbrQcrByCo4I4fWpCeS+EvU5YxmHmRT8eQqzC74WwxmIsHPkZUN
         Z2vjCWbWBtw2r5cyfyX20/MzcpsdlgqN7xeaU5OE2jKUVIhYK/hYdNgfkJTRwbfElg6H
         UctodA/hcFpcGcZLgGIaOmGDXoYcW+CYUQ19J7nj5qzXD9kxFLhRfIx4ljr64fQZWv/u
         zlKJBqszvvCZeRI1lxKOl0V2FgeDQKhZqTPVIGnxQlDwy9Ufsm5mn23vCHArggZ67ZoO
         aTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861661; x=1795466461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KwupKsUiOqn7cLay4MlUcBS/p/Juvy45qENBSa3w+E8=;
        b=g15/GGInn1kmvHnPaYD/zDhrexQH70nX7+NfLFL+ECg1kuG4HfLKvYdfB4V7JySgcI
         rY6GNYMtGEDG1tUdMjiVTV19V6Y8VljZYD9KlDHOprXimckz/D2pAueYb5CWPGEDcMiI
         fm9sD1c27AxcAE53zx87kQekUQLxPfsw8gn0VNd/+6bVI+EjOC5dRxtmzSIf00KiF7WR
         PSL3xgZorNJ8u3SmQLjaUn0gY/B7HF1w/+oribASGj+XpmBR/6i5x+aIhg5SmiuNeJze
         6wGBy6sAVSCX2otYz70G5xtoB6nAWfKMyj69GfQd1Xkx5sgkB0SdWYFdKEzSlAK0uaKr
         aYew==
X-Gm-Message-State: APuU4Z+Uww5v5vLcaamFnECrGrpV4MV3PFsmljfKEnST/y4glLPGemus
	3qAm92xI28ONKr6h88EqWLix/kScophIClWyu+R4LmCbdSVtwJk2GbmK
X-Gm-Gg: AZFdTZeZp2/R1VDbtoEuB1vSFQxpKFFPztr+EQJgAB1exZIUxdCncHLnDyPJ81gp851
	EEFS1JPnCGSxcuf+mGXGsgtKmIDTnmDXK9/o/5NX5DBs1/xro1XrQnvKtE9JSYm6QPM0BbaDzpX
	auFSSBjwcEs7tkuQZM94d1gKrWNbPVZAP1oigYMsWk6z5trJ4+KG6NDk6Xv97Lcp1P3pk4mIsDA
	xoKpZcgVblzrJBZHopkspajQ4tkUNcAxchiwV5mk2ZReCaKzG/bF2h4+ZiHysv0ytWm6WAFhpPF
	bkD4FCbFzCIBmcIamMcMVnXWNozFNn+cVUj+czGqyiZejsqhBIY3atnJTUVw3fg1mL5JM1DGOAw
	yFa6LVpmPKT/lyTT09NITeVySsg4NDP+CaoPX/7+8fzX6C9fwufdETdkDTU3YNZZZam8NEDSLtz
	TdVz0UVhfpUn9esep9i6P5+RMA9UawtoPjnRhrjUXoqZ4wWbrIPWKPfUnktoNPJXYLW/BDQlG4Z
	JKJYWmuJJRfVzg9B7OpysZYaW2XnuupssOSVW/uBksBFfTEjWGaPKzIJ8cvA12p2eS6QClycG1+
	KEHg+p82mx0xZ/bWR6xRWRq7R/ASf2AhMCDo9XmYw+SF56QHE8UVYBJ+aGb5TbCi8fPf/eecpcR
	PE008Mmb647I86vhMMV0WLpNo0ZGTNAKVm9gEVH92msmkuRcr8idFsugA8FCrcpZ8gdNZCbBry6
	789A==
X-Received: by 2002:a17:903:1b47:b0:2ed:3db6:2eb0 with SMTP id d9443c01a7336-2ee0e0ba6f7mr102960155ad.48.1794861660818;
        Mon, 16 Nov 2026 12:41:00 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:00 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] platform/x86: dell: dcdbas: Fix SMI completion wait and buffer handling
Date: Mon, 16 Nov 2026 12:40:48 -0800
Message-ID: <cover.1794861287.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes for dcdbas.

Patch 1 fixes the host control SMI wait for types 2 and 3, which the
compiler removed entirely because the status was a plain memory read,
and converts the type 1 wait along with it. Patches 2 and 3 fix the SMI
buffer lifetime on unbind and module removal. Patch 4 hardens the
validation of the firmware-provided WSMT buffer description.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
the driver probes, and growing smi_data_buf_size and then unloading and
reloading dcdbas with dell-smbios on top is clean, with the buffer freed
on remove. The host control SMI (only used at power-off) and the WSMT
paths were not exercised.

Changes in v2:
- Squash the type 1 read_poll_timeout_atomic() conversion (v1 patch 5)
  into patch 1, so both waits in host_control_smi() change at once.
- Patch 1: include iopoll.h instead of io.h, and return the error from
  read_poll_timeout_atomic() (-ETIMEDOUT) instead of -ETIME.
- Patch 2: add a Fixes tag.
- Patch 3: make the dcdbas_release_buffer() comment a plain comment
  instead of malformed kernel-doc.
- Patch 4: the problems were found by code reading, so drop the Fixes
  tags and describe the patch as hardening; reject remap_size < 8
  instead of <= 8, as an 8 byte mapping just gives an empty buffer.
- v1: https://lore.kernel.org/platform-driver-x86/cover.1794633178.git.rosenp@gmail.com/

Rosen Penev (4):
  platform/x86: dell: dcdbas: Actually wait for the host control SMI
  platform/x86: dell: dcdbas: Suppress bind attributes of the platform
    driver
  platform/x86: dell: dcdbas: Release the SMI buffer in remove
  platform/x86: dell: dcdbas: Validate the WSMT buffer description

 drivers/platform/x86/dell/dcdbas.c | 82 ++++++++++++++++++------------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 50 insertions(+), 33 deletions(-)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.1

