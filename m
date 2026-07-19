Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188253B4EB7
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 18:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484232; cv=none; b=HIy3k1TS69OQtTWx+XgzYMMwgt2RyOvalvhThaOvTrjlVn/dMxujJ/rtQ8J8NWatMK05qzC9AA6uNKESSi61vLt5FVTvPAL9sUS0GMF40kWtwd1HSPS0/VMNMdw2urzqN9vrLH/gZDAVyHKfptmg7DlRT+y3uerbh9ZRLjq9vCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484232; c=relaxed/simple;
	bh=sVlAnhzfkzYQa1PcZYfpNzgJJd87BozZZNakBNALqlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVLIMvzSLu00F+thIpRwJZmpGwwz6SRLlYKM442ywY4P1jg7Sry0uq+dwOWKkk/vU70NfVVnpnccrDU1bXNwX4zwwl4X+r1dR95N2Zk94HkxUh3SGPyDmEUsYud0oWMCOJ4TCVBxWbWn3svzSCLA0QDKeD4zU3FpXrI6+pFx6qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VO41oVYo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VO41oVYo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so53297065ad.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jul 2026 11:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784484226; x=1785089026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jxozXjIKJbQZrZVReseOqoF/OLImpOhluGTGzSR1yOE=;
        b=VO41oVYojY5nNLDlQiMn6nnfXahXoClP/cwC9XHBUJf/aNsn76YDQYHUlyO81zd557
         YvWIt5o0EWh+URbiaqycX6C7b4JQt/Jkzlwh8vd7xrZXTmKfEfuwHMSGnTkXrDaN7FE2
         jSZFoJRDwcnJip5qO88NGfDWikr7Cx+J5uULPkgBrEJWj6uiMOdjQ6rzsYZ/1KKRU7RC
         1BVYN7Zxn4jAfRXOB8M5vEabMD6GvZgJYYREyQE5nBg4nf/rgZZkgSgCRUcqXBJbJHhl
         49JfSkQ30IgEDQQ63i5kq6otw8ArRObpqTIcFtA6nlbIUih6FG2u+71BRPxJlAbaoVwW
         aAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484226; x=1785089026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jxozXjIKJbQZrZVReseOqoF/OLImpOhluGTGzSR1yOE=;
        b=iT5rnjuHrdusNYw1vDlisV8OatKH81PIxCcr6FOMsIZRDFBPGk9CXJosYk1jB3iUtW
         EoUT/+KHInraBBDrFbT4q+PmkFNNEaAzBEJOz5f06B4ODZMo6GBlg4sohIO4yfScg9Eh
         S3Jes5/jOOkLpjiy+X567RK0Vcqf4JB+kuG7CZHaEdr+jXZp7nSw2/11WYapm5y7O2Ou
         ZU3hQeXXpzxnz94c1I78aKUF09NrQRK1aAIheEROXl1vAPC8C1W7M1cYLHj3vobQ6EB6
         Pmryb1WvfG45bC8CwNwhXOf80WgkvfA5bSgvzC+5dAVWbsOH9qGZgqjsUKfc8tzSv2V2
         bksA==
X-Forwarded-Encrypted: i=1; AHgh+RpLK2BmzZUaBUvkgzJAn3EfAtsRkUVZEnjW8xXZiC1/kFKu9lMNF3bkzev+NimqCkvZc3rTjMdOyO63F3FsimXzLH79@vger.kernel.org
X-Gm-Message-State: AOJu0YzDv5Zz/TzNJnS6/sVcQ+sJtwVVu9kIM9N97zdeUt0NUntEs1e0
	+4nd++01oufrN/ehlTeGz7Cd8Bkk9D0KNtAflUmrdQ+z6thJAeL6J28=
X-Gm-Gg: AfdE7cnSMYo148vBGXufrQRX1t9qDn5P2YKM7JJJsI06xY8dOnUSQiVckfO8B39Fe/g
	AIjzcinA3pkI3u3ac87vEe7t5i7fu+BJF876vTkS4pcZudu0oFOgR+jIUx8qSlSvG/QcolCE7LB
	KB+hBtYUNzLTM/2Qny4ZU5tjLlvF6a+rTp1ydRuB4dn459khmiLG+dxRJlHsNaE3z/A5OhuNsaB
	STzNGeaOFX4TV2+EwuGPnDfAVH28Fvi828GV6H9AeGVGB2RXcCyKqlZXOET1r/E6PjWwcgycYTV
	Pwo3GW4GA1sYSdaCaipli/N5BskVIkjQztengCytJra3pQ9lq5visSDQlFX//4mtFvdIYIjAinn
	tmwVpsk2LdNOImca/Du9rc37ZPG3q3bmIB9Znijhd6MqeK5kVcwCnJFbYH3vqsY9iHI+FstuoYB
	pGBlk+e4wVUNlvQJ5CbXWixUw7qg4e0+UeVGtG8DsexUYWt6IotUY=
X-Received: by 2002:a05:6a21:6cc9:b0:3bf:6237:4d46 with SMTP id adf61e73a8af0-3c3ad7ad65fmr11766169637.28.1784484225791;
        Sun, 19 Jul 2026 11:03:45 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([106.194.66.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm27967645eec.13.2026.07.19.11.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:03:45 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH 0/2] Add Apple T2 NHI device links
Date: Sun, 19 Jul 2026 14:03:02 -0400
Message-ID: <20260719180308.1398-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a cached flag to detect Apple T2 systems, then uses it
to create device links for the Thunderbolt NHI.

Atharva Tiwari (2):
  treewide: Add a flag to detect the Apple T2 chip
  thunderbolt: Add device links for Apple T2 NHI

 arch/x86/pci/fixup.c                          | 10 ++++
 drivers/thunderbolt/tb.c                      | 49 +++++++++++++++++++
 include/linux/platform_data/x86/apple.h       |  5 ++
 security/integrity/platform_certs/load_uefi.c | 38 +++-----------
 4 files changed, 72 insertions(+), 30 deletions(-)

-- 
2.43.0

