Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30B73BB122
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 22:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781217570; cv=none; b=INOGiyxrLIjWj9SdQDjaxIWF4qx2ERfvB1zb2zUVU8EXhTLVzsENpWgvKv5xt68uBglSg57XkaEc9e6GhfZotyw/R20Cc0vHpTmzn0lrSmGpNPC353pXVyhQDevbe923UBt6tr7oBw9o35rtAkFjU5Jl6oWK4FwSIgjDBWC2B+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781217570; c=relaxed/simple;
	bh=bnx9nxq66efrk34Iy8/61uOzy7WpWyxJKioobTu4+Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MUdsTRDYtNlFv/Pjz7EnY5I+j3WR1ceRseXv14ceAUA2DtuOOihHIu3THa7J7LNkWHE7y4hg7JJJ9cGiQ/w9iXq3wSwE4ZC5LRhaeyqitAGAvk4u7d6c07DR0TsxBRQy9xHEPsnart50gUlsZlwb6QiOmAXreTqX8PlEhZzpDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEQ3PwiB; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEQ3PwiB"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-138129a622dso657298c88.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jun 2026 15:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781217564; x=1781822364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=71FrFQoxdX77O7zERQz215QQ+ueTBKRpp2bUMPUHqkg=;
        b=LEQ3PwiBAOd1ywU+DnUrrbaqAgYjNzBDk2rq+smvXmjx/kiVGgjfaQcx+1Zzl9ruRJ
         ufJ1NRLR0C+9CIwbKKyS6X0w0W7fFP91/61nb3ExQTBBa+1L5TS47HoQ9FlfKzPlw+vn
         EhW6Mgld1w19vKUt8NBKXiIkKuD8nrJzJl/kMoCyAXLQiWflpezIl4dS50XTtG7DjzFn
         7z/Dd9YckzYkz3/+RTFdgFUMSBCah6MMBduF0fiNFCC7aUHoqY1kX4xaass/EQntv/BL
         HUiklmOrd3/wI/nUsDQgjll14VtRrfpJJpYuQgG5WwtbaLSLeM8aschjrAuzJA94nMQm
         6L7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781217564; x=1781822364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71FrFQoxdX77O7zERQz215QQ+ueTBKRpp2bUMPUHqkg=;
        b=p6a6vcN2OMzSHVYCOuxk4doK85lzttc//5ITflZytImKrJVPSzgIPNk12E7yx2Fujf
         D4qOTJeZM1lYv+IC7SleKjh8LE49hocOYlx+nrM95NR6GRHjmIkQ49lBuc88HRmUooTz
         gpF1UJsDM7QjbAAd1EFAmQTHDtmodTcpCmTqEyb8/Sv1XYmX01S68R0vI6n4qMZAUUqo
         LjnT1cDlbtKKVw3YxXQW5klWKNAMqhp/tvD/PQ9r4NtmUYiABodGnzPh0TZB3WFKgrof
         u669SQBBwr+2TOL0HGIcj0hPGzZX2hapYeniKnuz3Kbhn78BPe28/n1C4yPtasrHe3Ly
         cX5Q==
X-Forwarded-Encrypted: i=1; AFNElJ8wtZtbsVsi6JM2urYQSvtPeM1g2NQ7w/uQyd2kRBk8uGraXbEgPoLjX8FHtB0j3rxIEYELBm61V/Cl04oF1/52ZZFB@vger.kernel.org
X-Gm-Message-State: AOJu0YxSs+WNKv57+1tUvgQnAYRL7SFUs7N5sC5zV3ULZutt+9Ng2t15
	fLiCREFVM8RhjSInzrMsLMr/PRSf5dMtzWPpWFPWP7jYnQo63vkYIKhG
X-Gm-Gg: Acq92OGXyryfGpofL7Twkub2ZAK8J/STd7vUOfpFEjR4kEADtkxtJWm4TIm55scqDFF
	r5Z7pWpfTzP+iEJEYPz+mvinpdNYmq7ogHho+uyQ4DDo3VFx/zRSRGIZaCMsIlYrgbSrUy8+B9e
	42YNwaWg0Ti2Cd+YLU4+g26BEfnK1y3uCW/3l3csiH8ChiCt910J48QkJ36rHLU4GBde4pl87t8
	whCXyKVjuFbCiITAfpiLuS5Rn+QKFNkdEtIKPXwJnu86hUoFxgMVHztbEa9ePKDFMdQ+i0kFOhw
	tUDLMZ7ONNjjwI8CO8hZLaJDNqPqMnralehz8nJFUx+Rn80dcNvTSf9T55qUtqlYjKC+qVtkZvl
	qctJpYSL1twPZwuktfpHpfyaGZDD++puSrWhUaFmnXTtPCzONu2E4PEVUuSDYCuwvcvZ8NM0MBX
	vQyHklipMbD1DR2pZ7WqA3kMqKc5f38CI3gRpRa45xGV+TDEFrdeKOMqlmsUziy9HvikivCEGYB
	s2K
X-Received: by 2002:a05:701a:c94e:b0:12d:c730:c7f with SMTP id a92af1059eb24-1384bbda719mr135519c88.33.1781217563937;
        Thu, 11 Jun 2026 15:39:23 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b975e55sm241273c88.13.2026.06.11.15.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 15:39:23 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: msi-wmi: Fix unknown wmi event messages on MSI Claw models
Date: Thu, 11 Jun 2026 22:39:18 +0000
Message-ID: <20260611223920.1679438-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSI Claw devices produce WMI events through the MSI WMI hotkeys GUID for
some of their buttons. When pressed, these cause spam in the kernel. The
Claws use a GUID already supported by msi-wmi, but use an
ACPI_TYPE_BUFFER instead of an ACPI_TYPE_INTEGER.

Patch 1 reformats msi_wmi_notify() to reduce nesting by using early
returns and a switch case in preparation for handling this new data
type.

Patch 2 adds known MSI Claw event keycodes to the keymap and support for
ACPI_TYPE_BUFFER.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

Derek J. Clark (2):
  platform/x86: msi-wmi: Reformat msi_wmi_notify()
  platform/x86: msi-wmi: Add MSI Claw M-Center keys

 drivers/platform/x86/msi-wmi.c | 92 ++++++++++++++++++++++------------
 1 file changed, 60 insertions(+), 32 deletions(-)

-- 
2.54.0

