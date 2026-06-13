Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6214AD0D
	for <platform-driver-x86@vger.kernel.org>; Sat, 13 Jun 2026 02:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781317021; cv=none; b=W8TKTBwLhrvFGkzXX9SM7q/xzbke4gGmXJM2LMtxaWKZwstmhtv1MOGmz9U1jOr8t43AZV4cjsAbfiLLwGbgMSaV/nEqjtQj1D8NGtR9TzBJN3NOPwQ0DqK9xmORl2hziR8VMd0XbbxGdbJgjR/7dyT54Kb5TovEf5tSz77BmsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781317021; c=relaxed/simple;
	bh=dCaL/C2gM9NpVO6Ezwtd7FXON5aqwxWKLeLmwERqZMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QCfE0jN5vVbNIWrpFXEtqVlbAFCTN6vG1y0Y7iR8Eyc9Fk3KYQGLaiJUkF6W41N8r/la/YHR1LZWlhHLYYAEEXDpZuPTqa6ZpKjFWubk62pxJlppm7zi8wM+HIRQ8oCJt/UW+XaQERJPPe2ktlXjVWI/nr6lu/+GBvwcyGR00Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xnz4DfHn; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xnz4DfHn"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-307d0405e07so2569534eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 19:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781317018; x=1781921818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+gOfinrp44idLoKgg6GJIjA0yxfjv4JZvg/g0wesME=;
        b=Xnz4DfHnCpXQrUy5bVpx70WOxJvCBc4WyGmRss2Gege9E2qJBBt7F1jNVWl9MKWFLZ
         AtJCjlk/I1zpOWi2M4MjBGrFKJgWCmjUwAZCdgV89jfd/NasCzmvcqyd7m2+vtJ7yllD
         uFsn7zjtNCdznLtNPW0TX77/tIb6/LIOpcMTFNKEfyDDW7WuIMSV1Y/E9wDeEo1FmJDj
         JfUbn7nzmssj6UPKHhSpAuclEZK5rQSVPfe1lOdUNjSGYGldNMERxcwiDHb68dbHHLPT
         4iMAUK/8d9ed5voVo2nIf6NhnUKFLlr/OhQ8dIqHYEplKT2zHJmKklVIXC9NWlaRU1Lp
         bPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781317018; x=1781921818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+gOfinrp44idLoKgg6GJIjA0yxfjv4JZvg/g0wesME=;
        b=nE4JJTLtzKpc9jMIjLD8FunyYlHq54PL7r8ZgU87QvRX9TWUXkDOpFeJ+EReFVH2EK
         WRNGz2uU8L3pMRRcT90kKcWqqqQZR8Cy4wIRCCWo/0Y6eec2G0gcQnsl37gGHGaHmn+W
         tGtbqFv8TRAsr0FVUpffKJs3yKkMkbZe5kTkkQ0crpjvrin1kbcJrwX80MlviG/zil2P
         ljwKucVOY6hKK9votakr68ta4SSGogNfm6Va+q1lfdL+ystV1XiDs0IAbXFtXjrcyTAM
         6LV0RzS68p7VBmd88yZiZusBbJMu2Bx3QoUnd9DEYGmFNeZs9aUx3xVzHQX2hzZDBZfQ
         3uqQ==
X-Forwarded-Encrypted: i=1; AFNElJ/h8d2dtqw6XoRmkX7RWt8k+4dD2PrJm0hUojbpFWZdXAjB5b025qnfLjaWNQBVDM+UlESJD/XozayhV0yw66oLv6bj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3ZDb+PkeN4CG9jGA8ToxtY36L86DxMukyiEG0BNuuya4Hd3ej
	noi0f3oPozCxmaL2ixqGaETFur2ItPd9zq6kXP+J5lKDm4AaBLMr8vPU
X-Gm-Gg: Acq92OE0oJUEjQuvK9uEh/ray5uy/7KWOGgo6BbVRb/Xarc3ayrTBlArkFsc7MqsQ5X
	GhyHW7kJ+LGYLEYVHra0hOawcih0gg/zCt7xtgXwAnOEx+cPM35wRAPn9pSGQvjbkN+Bqo8KOjO
	uwKEyke40P/OyjuUfl86zMZRCWLQ4NCdmpAqWI0DWsFsDo1WuNFcKEoIV6na7Zn3vAtuR8LLNXH
	yWTfCUhu6rkAWlUV7F/yh80Qrjbwa9ITRLWBUuyrzAvbjL1Iw+1jt0h2islAw5LRqsViURbTheB
	yaOAxgXLcpKWs7vDk/Cp/7mQ190QrPIVNPV9S4CRcqU/JX+U7Dtat7nrm0fWn4HpNcegVEgKGJ1
	KQAYsq70//mEw5xdEf1vsrokIMPD4t1/7OFxFejCmgbvxOI7crCD3rmUzpxtTKAh25AIN0U7s8z
	5E1tAYXDBWLJ7UClxA5x/NUyf36+Cg+zQzkAoUU2gOLAT3oDTanpOzs9vbZq889T5mTtQc+my/i
	ycJ
X-Received: by 2002:a05:7301:19ac:b0:2ea:c085:44b1 with SMTP id 5a478bee46e88-3093b944381mr1085065eec.19.1781317017512;
        Fri, 12 Jun 2026 19:16:57 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e48e412sm6417828eec.4.2026.06.12.19.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 19:16:56 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Armin Wolf <W_Armin@gmx.de>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Thomas Renninger <trenn@suse.de>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] platform/x86: msi-wmi: Fix unknown wmi event messages on MSI Claw models
Date: Fri, 12 Jun 2026 19:16:52 -0700
Message-ID: <20260613021654.933618-1-derekjohn.clark@gmail.com>
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
---
v2:
  - Add comments explaining buffer fields & length.
  - Test that we have at lease u8[2] before assignment of key ID
v1: https://lore.kernel.org/platform-driver-x86/20260611223920.1679438-1-derekjohn.clark@gmail.com/
Derek J. Clark (2):
  platform/x86: msi-wmi: Reformat msi_wmi_notify()
  platform/x86: msi-wmi: Add MSI Claw M-Center keys

 drivers/platform/x86/msi-wmi.c | 97 +++++++++++++++++++++++-----------
 1 file changed, 65 insertions(+), 32 deletions(-)

-- 
2.54.0

