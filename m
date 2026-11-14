Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637412;
	b=blZY8hkdLltrO2QEuo1NmpBW6LU6g7I+7wbMbEBUHMWNAoZBwL1Tek6/UjwKIiGvpcIs
	 Zqe9QzPSaJ7rBFWAy76E+zOstUE/EbqgERlWd1WzCtKlLs2KEAXa4dXip7UFvduUNx/my
	 9P6wZovzI2mNoTkQQ3PqziP+zJ+r02oxdlHdKoDcosqtJFE5ArsXXuJufZOtjcTJiOhVH
	 t8zUf5Fx6EZrIez8l4qCi26jWVPvHsQfuR2Co8aS2/McwyQJ1tIepfYgDgguCrjkoOFJz
	 blLJ1qoBZVrSDkg02+BdnpfAV9MGGU5wf/0GvM/jpix5GyJRv/EUoKmkDP5hwpdg43g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=8yw1LePh+ceLAcf0GPSoWpXNbz23OP5vkg6CsQhLXiE=;
	b=0yHGZI5x9X/dJ1yvKXvq713IIMj7bYFv5FeqM5m3FxfMo/5YBFIoTaDeGxYdBgII7/Zp
	 B3/CbxgU/YNRxGmGl7esxRdEdXio8V0Ef3LzpG6T1aWBLFPjcGL1qutp/8dxrRrNScqBl
	 ZfSlOb8GNT0hX09FnXO89ZVE68WIhKokKVY8gRT4SpA+w7b2KOtTS3WFJAQT4hC+fCCAB
	 FLZPgDkvrRm6GmTbAZkokWNxa9Q5f28RsQw/lvP8MLyHOAdQKdomQRTDkXDTWENKw3AK7
	 HwZUN1ifEOD19ezJ2NJBrVhCIV8wOofvJchwEv5M7A2zstCB2qHOhIqnKPxq04W+ciA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWWryPfy;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BE6606A323
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BE6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWWryPfy
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so1394035a91.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637411; x=1795242211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8yw1LePh+ceLAcf0GPSoWpXNbz23OP5vkg6CsQhLXiE=;
        b=PWWryPfyePReYg513MkcydiHR37We48bWP3QTuBkchma2bF1cEpOyTrVBQGJjP2Ukv
         7nNnI1eDYb3I1aN6UNLxOQfwsILy3eYHg/5akxDW6tD1ygCMIyf4hjaFOuPFXZqkKpAD
         AuuF85L1MQ4phxvLchiGDWx/+G72C1AE+u2z46NynFqJxL/rh6mbGXpLr7jmEsY8fdg5
         vOXGCDx5zumBJNteHt5n6tLP16OlwMk1vWFcrCBvI2TzIE9JloU97NyfyY225++ngmdy
         NiOF6cJomWo8kTH5QyYZGDWwIQQ+Wcy8X9RhK7lfsDufEd6kCKobuX8osGw0UXLdzm0S
         HM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637411; x=1795242211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yw1LePh+ceLAcf0GPSoWpXNbz23OP5vkg6CsQhLXiE=;
        b=uHkf/N7CaB7/PjSjWx43Pz5vW5Z+A6Gdre2zwI1rKGhqSrFjabJ92HlY+V/iVxqxIf
         p6OU8fwY8rbDzMHPwY1fNPdqnmedW9VLMTuPfJ6S0o7pNT9AUs41T3X2xRMYHnCWhAxZ
         wIb3qkl0oJYOeufDwfvJjBMzqm776fYe4Djxck++7NNHFdlphlhB+DCwPfHfGNqH3K21
         0DQPhbvfJiiYjrJZM0atJZibTDdIVtdE+o6rchWIdqgb055KhsGIOkjy+meu2pikHydu
         0Uc2wu67yzrBZcQpoWt4cWvvimGZl3JLeX/fQLM81mXPqcDrxmbL3L7OqZZP8Eb57oRA
         OGrg==
X-Gm-Message-State: APuU4Z8tAUSXk/JRHM5NPH5BDbETSVFLO0dIXlv3IUhQPi0pmBOqK9I1
	RKdCopCeCEFAjd32IvkZPkR1RBkYe/Rv2ao1vIHoeC6AdS1IUC/vnfpu
X-Gm-Gg: AYBFou2UvlMPqbxchfWKcTBn5RCl5IPZxsPQ51qQushfYK93v4aaTT6nkh4JoHWgXHZ
	fr7g41Rg1X6c016S/+iv2JqXaRoTkg+DTJtdUaDH5bBDZDvkN6nWsUSCb5MxC3ErBxTuPLc4rwh
	oDdMMWDOWILXRdTI4xDqnHRbtdGE9js77wjHX0+AHqyj3g3QwMVIB4FUbMNOSZjTkM9ybe8eG6W
	OWg4FfS0tgNv69cyZmVPXlOH7GOdFEtRJyo9iqSyLNqc/ofyv+WSAnEPYDc3zp3lrfPDGIXa6EJ
	gfcoj53+lePR43keDCImOkwXiCSa5ENJOhLXXO3hzDHqvDQ7P34/f6Wr1MtOVwUgqnEtoJXfMlZ
	XRMcBucnbPwWj2sJ9e/nz46SZXUIOu8oAjbYB0hGune4wFzchhNh630e8oE5BPA6h4A2kgoBrIV
	U2urMemT1GnUFGOB8C63S203GaUFwvZcoeN/mlAYvQ569CzqjgI6SqKQQD0hmwMcdHhv/sSz+yq
	W6Tqahqdvbcsgt3ZAGN5Rq2OBv5372AZapU7rjAp69hwYlCg2JEWeEzBsducyyL1oXHfLbdvecg
	FkU3PY2ZbEJxKPPvZE5Tvn58salohNAg8nsaa5fJ0gLVuHrwoN88rdfU67ee/LlqnWBOxsEXCfh
	gKWXAgah7Kqj7QOP0COXukcMIrNYDu6d6Jrzalw12OsUbjKM4PTzF/xrc6xWFeh7rMtfrjCfEwt
	+/vg==
X-Received: by 2002:a17:90a:d2cf:b0:3a4:e934:e85c with SMTP id 98e67ed59e1d1-3b1b0a50370mr4457667a91.41.1794637411258;
        Fri, 13 Nov 2026 22:23:31 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm7635927a91.7.2026.11.13.22.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:23:30 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthew Garrett <matthew.garrett@nebula.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-smo8800: Suppress bind attributes of the platform driver
Date: Fri, 13 Nov 2026 22:23:25 -0800
Message-ID: <0c1bfd7d87cb29c503cbfd17eb64ca88fd12f18c.1794633181.git.rosenp@gmail.com>
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

struct smo8800_device, which holds the misc device and its wait
queue, is allocated with devm_kzalloc() and freed when the device is
unbound. misc_deregister() does not close files that are already
open, so if /dev/freefall is open when the driver is unbound through
sysfs, a reader blocked in smo8800_misc_read() is left sleeping on a
wait queue in freed memory, and smo8800_misc_release() later clears a
bit in it.

Module removal is not affected, since an open /dev/freefall holds a
reference to the module. Unbinding by hand is the only other way to
remove the device, and it is not useful, so hide the bind and unbind
files.

Fixes: 4738d8aabe89 ("platform: x86: dell-smo8800: Dell Latitude freefall driver (ACPI SMO8800/SMO8810)")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Developed with the help of an AI coding assistant (Claude Opus 5.5),
which found the issue and drafted the fix; I reviewed it and am
responsible for it. Builds cleanly with W=1.
Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules: the driver loads and the bind/unbind files are gone.

 drivers/platform/x86/dell/dell-smo8800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/x86/dell/dell-smo8800.c
index e056664656a7..aae9a028d69e 100644
--- a/drivers/platform/x86/dell/dell-smo8800.c
+++ b/drivers/platform/x86/dell/dell-smo8800.c
@@ -169,6 +169,7 @@ static struct platform_driver smo8800_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.acpi_match_table = smo8800_ids,
+		.suppress_bind_attrs = true,
 	},
 };
 module_platform_driver(smo8800_driver);

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

