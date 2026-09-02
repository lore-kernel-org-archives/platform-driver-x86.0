Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D637A3B5E08;
	Wed,  2 Sep 2026 20:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382483; cv=none; b=DVhAkzkPa3d6+0lf34ZTIJ0KemvXfGgp+c40/daNy+wPMoPiwSJVoxTcmqTkc4kTOCofa2KHGj0hmyEtiQn/RxVCF3WCsj1DAjcSOc+6C8blJqpbjU1HhY4pFRKImYRTXeKH7TzL++1I5RnHUw9OPgOc3LxEdQMR4ty6tX0SXnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382483; c=relaxed/simple;
	bh=0hM9JzeR/lKw/CSYeDPtW4Wyv++XUFg7SqEZplK5dog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H545LlVES3EwjcxWVeK2WFiE94puZ1M8UG+NAaFPAbZAW9i43HP0pOmABThbt7JIjmIPOEMq1aXBxrgNJXRt9VamgG9kfe++Va9AMWGgB3IRk6tENflg8kgoYc4MntYRlar+f+f4uO/R0XwPzEOzW5nNgAlBDICeuyNIfBIc4wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=evyyP928; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="evyyP928"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1788381978;
	bh=0hM9JzeR/lKw/CSYeDPtW4Wyv++XUFg7SqEZplK5dog=;
	h=From:To:Cc:Subject:Date:From;
	b=evyyP928iegx62yFbAsHekjkmnTLEpjoBpZQQ1UuVDW0i2xjE8rkjTsdWEsXUiEm4
	 zKGD/imJ7aBrrkmjXoEoGZ+VK5ZbskQl3WEk8jz6X1Xnas4rCeJNxN7W2cpYdAU+AE
	 o7Y4SYXMqbC8shGE9FU4fvHSLz6cR3Rn+RQvlP+5XYZheum5HfOdgCc9OL8B2JmRCJ
	 FyGFZFSuZptHy764BQgrGtYMi2sz1+0arUQ8wWjyi6moC/fhuVQHlRe2fXrC7jxz57
	 ziIJPQTP1gdOXm3Jj2CPtwoXcwAkPaVFpj3RJznHaUmbovRNCKtNFxbUFH1y+BFuRk
	 o2AUulL8mYmqg==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 5A75D20A07;
	Wed, 02 Sep 2026 20:46:18 +0000 (UTC)
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
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add VD55G0 support
Date: Wed,  2 Sep 2026 16:45:39 -0400
Message-ID: <20260902204549.657228-1-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series refactors the STMicroelectronics VD55G1 and VD65G4 image
sensor driver (vd55g1) into a generic VD55G family driver (vd55g) and adds
support for the VD55G0 monochrome sensor.

The VD55G0 sensor is found in devices such as the Microsoft Surface Pro 9 under
ACPI HID `SMO55F0`. It features a native resolution of 644 x 604 pixels and
differs from later variants in the family in several ways:

* It uses a different native resolution and register addresses mapping,
  requiring specification of generational feature differences.
* It lacks support for spatial and temporal HDR.
* It requires an exposure duty cycle limit to keep the illuminator current safe.

Tested on a Microsoft Surface Pro 9 (an Intel IPU6 platform with ACPI
HID "SMO55F0") running libcamera.

Peter Marshall (7):
  media: i2c: vd55g: move patch array to a separate firmware header
  dt-bindings: media: i2c: st,vd55g: rename and add VD55G0 variant
  media: ipu-bridge: Add VD55G0 to the list of supported sensors
  platform/x86: int3472: Add VD55G0 supply GPIO mapping
  media: i2c: st-vd55g: Add generic driver and VD55G0 support
  media: i2c: st-vd55g: Remove legacy vd55g1 remnants
  MAINTAINERS: Update ST VD55G camera driver entry

 .../i2c/{st,vd55g1.yaml => st,vd55g.yaml}     |   30 +-
 MAINTAINERS                                   |    7 +-
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    2 +-
 drivers/media/i2c/vd55g-fw.h                  |  305 +++
 drivers/media/i2c/vd55g.c                     | 2166 +++++++++++++++++
 drivers/media/i2c/vd55g1.c                    | 2061 ----------------
 drivers/media/pci/intel/ipu-bridge.c          |    2 +
 drivers/platform/x86/intel/int3472/discrete.c |   18 +
 9 files changed, 2531 insertions(+), 2071 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{st,vd55g1.yaml => st,vd55g.yaml} (76%)
 create mode 100644 drivers/media/i2c/vd55g-fw.h
 create mode 100644 drivers/media/i2c/vd55g.c
 delete mode 100644 drivers/media/i2c/vd55g1.c

-- 
2.55.0

