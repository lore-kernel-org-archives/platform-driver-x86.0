Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847272472A4
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Sep 2025 07:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758871149; cv=none; b=TRHtIDIrYICs/pp0qSP5PgO+r6TJ9tv3opGmDaML3IAl7/v6c9Dw0cWxJml/5uutbOoOcMKyTvCw9l13Xt0gIEcTjeODyKFciPP8Thp5WqhBRQBRcjmaqe0l7KHWJE9rkZObuw5kA9jQvFnVKrH+qPRLh+34wEWfP5cwoj/Ldi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758871149; c=relaxed/simple;
	bh=FDV3uBNAbwFXT+M7fyNWH+HJ349lnbWYLaE+n4S8cdk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AR4fNg4es95SnUOhoPAEnMcM3DZWPR9z/SxjUor+upQsPCLztpDEdjtefi/MUTYhefj64nBXwbRL3STQSle8GYryivGQuuGJ+Mxmzv9lNx4WHX1I5TAjDWRQ7nbs4HlRXwzYeHOOih3xRQsx5330KqALy+WjU3Mnki2b9qbCMTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xgy1FRMX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xgy1FRMX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758871146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tOPngMxA7p4GyjZLW1Z2fZxDxzYAemuo6fVS/hsRC0Y=;
	b=Xgy1FRMXmgtRel2xJLVU1BWeTsYDDjt97BNyRgiyWw1t32CpKNkna5CmDXjeWzM+kj87fi
	5q57v6WrxMh8Cj/CSuSv7ZL9nEELj7pJIZMGnFjkmUCNuxdUm5YvrirOv0b5jNOwhxphG4
	ILXlgXikl1H0Vx+MidpT4hOQAoUAK7s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-WXupIz9gN2W6w_oGF9ig3w-1; Fri, 26 Sep 2025 03:19:04 -0400
X-MC-Unique: WXupIz9gN2W6w_oGF9ig3w-1
X-Mimecast-MFC-AGG-ID: WXupIz9gN2W6w_oGF9ig3w_1758871144
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3f4fbdf144dso943805f8f.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Sep 2025 00:19:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758871144; x=1759475944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tOPngMxA7p4GyjZLW1Z2fZxDxzYAemuo6fVS/hsRC0Y=;
        b=H7lb7LbrHutbHWQrJw/oOY9o3cPpdOnYXRlxDbapUv7w3E0Jignre9LFl8xSc70Bi0
         jI8dE3A2AUus5OogLeca020fIKAy2jAfE5g87bRShG7hseFiKVCqfki8OSp2pftN7OVA
         4SMsfDAgEai2tnQtiZK2NP1Mdtj3GrDP1wGBJf438CpbXh59VqPQs5JBy3qejYzJOB9E
         7FySivPV8ZULXLbFtVHEhROWyWLV3i3dpJkvA8kT8gmxod3DIRtDiuRMSZS1mEV/6r49
         qRNzRxT/apVZAGpmCyfcITl98FKqKrusv1k0vqPgCCJW0uhCHzyClc+ZDrHRX/fuLbHk
         gTNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMuxesLh4idAGaJYTDsukAMUtrI3PcbqFAvus5hWC4X3l6nd9An9c0y24UAxP+Cd2rEL6j81pXqdJrs/0I8cCOY5zw@vger.kernel.org
X-Gm-Message-State: AOJu0YzjZvxcqWpx4cUrelPfz5THR2Nw6FZO3ShV5PZ3cJZps4zF7q/+
	rNOiRjQDMsxT1rqlToeYOMmdMHqhM3pIeaHBOFgzF6EAqaUTVrsFPpkJjpW1Ojn59SD24kth8K4
	vlIWrvVLH3j/TBAfHbnOaZZ88c4I2LF8mmEejpZ5JRac3JRGBLT78eiblI1tIzMhto52PBE5MTS
	w=
X-Gm-Gg: ASbGncsbkrHbt7fG34pit6DVOJofjMSkW9fFKCB7x9WQxCmbcdofMEAveXgarUY16zI
	BDH9lKorPPSY7Rgz0wm7y5SIr46EY03ZQzZ3gk3HLipowb2dGbqANIEqSY9Op2ZJA7ks3jQmLC/
	EAdGJGVabtAAvCRUTw8tNJ/nsZAqrvIZS0LCadokW5s/KItJo15ZuM3OsWCXHyRb6lL55XziX0s
	m2FFBOXhJw8gXVJByicaCqGWo1liRKRtg8vyxYnNeoIE7/FCX5QZxcywCMWUPvISvulfhV8hHNe
	cPZFl1h8TGXHtW+p77ryiT6xQyNR8zmYuRiXUV4EeBSEPzUCahU29stv6wrX7qq/be44IpKrnO+
	5XbeZqz7uZBWrKQ==
X-Received: by 2002:a05:6000:310b:b0:3e7:1f63:6e81 with SMTP id ffacd0b85a97d-40e4a711565mr5936587f8f.16.1758871143686;
        Fri, 26 Sep 2025 00:19:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlb1Wb38trve2rzHq8pOF44+10uFK3uhKPrtJDVZXfjYr23BydS246rnVqWWs+QAxza2wP6g==
X-Received: by 2002:a05:6000:310b:b0:3e7:1f63:6e81 with SMTP id ffacd0b85a97d-40e4a711565mr5936558f8f.16.1758871143271;
        Fri, 26 Sep 2025 00:19:03 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc92491efsm5994003f8f.62.2025.09.26.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 00:19:02 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Sebastian Reichel <sre@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	platform-driver-x86@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in THINKPAD T14S EMBEDDED CONTROLLER DRIVER
Date: Fri, 26 Sep 2025 09:18:59 +0200
Message-ID: <20250926071859.138396-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

In the activity of revising the patch series "platform: arm64:
thinkpad-t14s-ec: new driver" from v1 to v2, the location of the dt-binding
for lenovo,thinkpad-t14s-ec.yaml was changed, but the change of that
location was not reflected in the corresponding MAINTAINERS section.

So, commit bee278e18e64 ("dt-bindings: embedded-controller: Add Lenovo
Thinkpad T14s EC") adds the file lenovo,thinkpad-t14s-ec.yaml in the
embedded-controller subdirectory, whereas commit 27221f91b83f ("platform:
arm64: thinkpad-t14s-ec: new driver") refers for this file to the
non-existing platform subdirectory.

Adjust the file entry to refer to the right location.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8fcf4e34eaa5..b641b5e60bf5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25466,7 +25466,7 @@ F:	drivers/platform/x86/lenovo/thinkpad_acpi.c
 THINKPAD T14S EMBEDDED CONTROLLER DRIVER
 M:	Sebastian Reichel <sre@kernel.org>
 S:	Maintained
-F:	Documentation/devicetree/bindings/platform/lenovo,thinkpad-t14s-ec.yaml
+F:	Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
 F:	drivers/platform/arm64/lenovo-thinkpad-t14s.c
 
 THINKPAD LMI DRIVER
-- 
2.51.0

