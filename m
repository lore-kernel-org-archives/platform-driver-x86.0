Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A5D358368;
	Fri, 18 Sep 2026 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769884; cv=none; b=tyzHLsjFT43J5yS7h1gwWltDSrdKGEf+lRyAEMvdTyyt2OczD+lZeDKTdLLuYONFDEm71ReCevur8DHOt7sv8UHTwcTUFvNGy7bBCoatLeviYV8z7g8zvGbm97aWzfjKlyaBBIIHRWiptkXzUDEnH45r7CoR5QevZ7quNMaQcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769884; c=relaxed/simple;
	bh=shx9t1ms8LW/2rlee1GRn6DtexVP9G7WyrfJyXJxiUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=euBRuNR9pbgkZumPXp6AVJZ65DtxAgV9l9MItfywmUdqptsH7bXHp0SHa0QaIU2Cyy1zFk1fJFz54om8uC+l5Gy194+/NxdjxWAGsNiFLVZUj/W9f8p48qVO19IVMi9K90+OsagX2Ya1sX08Zo6EfhFbT7jNQeVsXwfNvZTTDAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=NWy5qWzi; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="NWy5qWzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769875;
	bh=shx9t1ms8LW/2rlee1GRn6DtexVP9G7WyrfJyXJxiUk=;
	h=From:To:Cc:Subject:Date:From;
	b=NWy5qWzigp+hZTAjo2t8+8imh2kAPcgooEqG3+zqC4X4axMTONeqs74ezHFBZsBko
	 wB8ddkzJu8dREiSV1X1yyRQOnJuueVTNVRoGvKI7rQFj3MC/O+3T4zFATCLdgeBced
	 RC7WHil4fx5UCi88msIfvw7gdvwe69Y6H410N2P2jlXcFLs15hR8recZQsRmslr1mo
	 bz0IbvaUFZIYGqJjFy/tjbl3gablvv14DzByvwIsGVb+lhxg08eQtbaTAA9XWHwx+B
	 T+eO07v/AzI8C+OL7Y8HVAbedmfcnK7+cM6CkXqer5cJoQc7CI/dta/oHTqnG5ux9y
	 K/ksGfk0HYLKA==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 1C02220117;
	Fri, 18 Sep 2026 22:17:55 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 00/11] media: i2c: st-vd55g1: Genericize driver and add VD55G0 support
Date: Fri, 18 Sep 2026 18:16:54 -0400
Message-ID: <20260918221705.323510-1-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series refactors the STMicroelectronics VD55G1 and VD65G4 image
sensor driver (vd55g1) to abstract sensor differences and adds support for
the VD55G0 monochrome sensor.

The VD55G0 is used as the IR face ID sensor in devices such as the
Microsoft Surface Pro 9, where it is found under ACPI HID `SMO55F0`. It
features a native resolution of 644 x 604 pixels and differs from later
variants in the family in several ways:

* It uses a different native resolution and register addresses mapping,
  requiring specification of generational feature differences.
* It lacks support for spatial and temporal HDR.
* It requires an exposure duty cycle limit to keep the illuminator current
  within safe levels.

Tested on a Microsoft Surface Pro 9 (an Intel IPU6 platform with ACPI
HID "SMO55F0") running kernel 7.2.0 (changes cherry-picked) and libcamera
0.7.0. Builds successfully on linux-media next.

Key changes from the previous series:
* The vd55g1 module is grown to support the extra hardware instead of
  replacing it with a completely new driver.
* The driver now includes a builtin patch array. External firmware loading
  is no longer required.
* Lower-level error messages are demoted to the debug level to keep kernel
  logs clean and actionable.
* Hardware registers are now fully abstracted, so operational logic never
  needs to touch a raw CCI address.
* Changes are broken into logical steps to improve clarity and make
  bisection possible.
* Rebased against linux-media next.

Peter Marshall (11):
  dt-bindings: media: i2c: st,vd55g1: Move allOf: after required:
  media: dt-bindings: i2c: vd55g1: Add vd55g0 compatible
  media: ipu-bridge: Add VD55G0 to the list of supported sensors
  platform/x86: int3472: Add VD55G0 supply GPIO mapping
  media: i2c: st-vd55g1: Default to illuminator on GPIO 1
  media: i2c: st,vd55g1: Handle virtual firmware graph endpoints
  media: i2c: st-vd55g1: Clean up module error reporting
  media: i2c: st-vd55g1: Unify frame timing calculations
  media: i2c: st-vd55g1: Abstract sensor models, revisions, and features
  media: i2c: st-vd55g1: Use indirect hardware register addressing
  media: i2c: st-vd55g1: Support VD55G0 global-shutter image sensor

 .../bindings/media/i2c/st,vd55g1.yaml         |   34 +-
 MAINTAINERS                                   |    1 +
 drivers/media/i2c/vd55g1.c                    | 1667 +++++++++++++----
 drivers/media/pci/intel/ipu-bridge.c          |    2 +
 drivers/platform/x86/intel/int3472/discrete.c |   18 +
 5 files changed, 1394 insertions(+), 328 deletions(-)

-- 
2.55.0

