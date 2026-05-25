Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0E175A7E
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779711470; cv=none; b=P2fXSdWe78KOm/55DJ2fUsh4sr+Lz9VFQ7OSOV8De28/ARe7e7isCFGq3fCsjx7FgzOJtkUlJf/qTEykhmCatRf77s7nkzhABnPa6AqQC2/7n46gygWcbMp2bdGEGtCh6gyidSUwJD+DLByk6kbVhNMbKLvQMBHMlnae03WLAxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779711470; c=relaxed/simple;
	bh=FmJ5gcPBmSvTiezDNXoyC0XASiS2GqnDwiH6ULXwBXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndcE9IB7rnjr/CM9WOh4v52/WK1fgy2waC/LOv+EbZ+213f04EMuCmyKIwoc39ziny/caxpjUaBjGgU99cd2HCFF71VKh8ODlMgOCZoZaoRffPE58AR1mKPewbov6HvN6tcllP6yuKSzJRwkvfotarFNzw9pbwDzZKxb/QwB0nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UX7vWIY+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UX7vWIY+"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4904127c32cso19989785e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779711467; x=1780316267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGLIE2lCsAFRZf6pACu3KQCD//YcBcawUO4U41gdq5E=;
        b=UX7vWIY+TeMqH+yW+bimJhLEDXwkpFQNmV1RHQpmvzY4I/F/fdZaypuqwtcnjX0ncD
         RDcsUsFXCDaK4FWA9dkc1js+mT4OZaAuiP/hkkVxyk8AOLDSWTnHy4aymTaVAsOE34Qm
         PSP1crSD+BlZicTUlKZZPIdVJUUGktGQmz5q2Myto6d73gD5b8g2or/Qnnlt8dH6TPUD
         6I5Cp1v+jX51C8Zt7JLPSvsuLlD2ywJ5WnNej2bckUPe02Cm9mVHxe2OiWJdjYtLvOwl
         L6SuAd74ZO45KZ10FZrgu91EodGPYsyUMzn95MStM9wgZKmEWtHj+ycpPw597sTAtyCX
         Dq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779711467; x=1780316267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pGLIE2lCsAFRZf6pACu3KQCD//YcBcawUO4U41gdq5E=;
        b=VGruAhNUaxv/hOXfAEzCSk0lF7cldlz10uqguy/m14earQIWiueHxLI3EVT9E2fOy7
         7qCjTqmK2wijLfUVVsc6q2n+8ZR8VImFdATNWTxTB8SDRNmA5BtEKHHoiyV76IF9qAB+
         C3/mQL1Sr1RYX1+4K7nOe+XyZP9MnNUgl9MyflLIOO0t1k2sM6NxIXdb9o6YP77oqtuw
         BDgJBa2qlTQv0/PdVhuGFzyfa4WdV2dHJf6ar4FJKDxAtvZDK75Ne2SXLHB0PjRrLoPb
         /ybvL/FnyBdWx9TNi4r34OQh/but5ZTEt/362vhRd0dersM7cC8xeTgG+W/2xevvUWKQ
         O/AQ==
X-Gm-Message-State: AOJu0YxBhN3kpClT5qfBOG8ilDf9qcH4sx5eAsjaf8YsTWl4uUmBqsEz
	tQkVnAea8Dn12EdqZBP/ptZ1EGv0DvmNRlN8VW64iSRNduD2eMH/sJA97Wkc1Oi45jI=
X-Gm-Gg: Acq92OFIoPpsjRGL6wPLOpLo0gjXHk+IJA+xTwhSOp2iFZb8xFHdUj1co3WGYUdfseh
	XdMcMxbM47AjxibJbyJEDRVkh+GUwdMqV8Ubid3Re2ravKxT8XY6pEgRaIi6Gmkv/hPyFfQPHLj
	auDOa88o6mTyDCBmy+Ro9HKAH+JFbGJoN+AO3qE/z47BAl/gPjdupa99Ip6U4o868wZ45uhGT8H
	vKwsYYAfvor9PYDgBoRf/DXUmzFaJFGpaBjqVot8HaI2eRWAm8PuNjz0p7d8CgCHs6UsFUbf4Gy
	HRHKyb2X9g8h8zYJAj3pC2k+gKTUArTL6+xWt/TgdmAGA4LhIl4gNK515s+HEjvkeVW6KhL8hQr
	8rNxIdeAxCL5MR+tM+fEiBfWh1qpAesKYzwacWVA/yiSt3yiSowVcD2G5+cFxG1CHV3BwILWg82
	1jG54gkltF0ADTUonLIuL7jA==
X-Received: by 2002:a05:600c:8b12:b0:490:5191:6e1a with SMTP id 5b1f17b1804b1-490519170d7mr180006855e9.24.1779711466913;
        Mon, 25 May 2026 05:17:46 -0700 (PDT)
Received: from localhost ([37.99.69.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904527f7f7sm368219345e9.7.2026.05.25.05.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:17:46 -0700 (PDT)
From: Shaposhnikov Daniil <2minesweeper2@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaposhnikov Daniil <2minesweeper2@gmail.com>
Subject: [PATCH v2 0/1] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer models
Date: Mon, 25 May 2026 17:17:36 +0500
Message-ID: <20260525121738.11354-1-2minesweeper2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524121510.36961-1-2minesweeper2@gmail.com>
References: <20260524121510.36961-1-2minesweeper2@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v2:

Added linux/cleanup.h include for __free support
Used __free(kfree) macro to avoid duplicated kfree calls
Replaced magic literals with FN_LOCK_ACPI_OFF and FN_LOCK_ACPI_ON macro
Used switch/case in huawei_acpi_fn_lock_get to ehance readability
Removed unnecessary cast in SFRS argument construction

Shaposhnikov Daniil (1):
  platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer
    models

 drivers/platform/x86/huawei-wmi.c | 98 +++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

-- 
2.54.0

