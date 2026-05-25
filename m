Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C311A262D
	for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714065; cv=none; b=V9FvnwC8hQvjwplWrAIqqubGED0GQbRqVKzsq+CY/bv5P53iHTiPnOZh+yHQ5APpVDYwJoLhtnvfAACxEV3zSZbjGv788Qz/paXLivcabsWv+PS8E8VcG9+9UTqGDXcbyskn24ibJfuPjvGurW03x3T9AGXy+ikgr1puOhLsFIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714065; c=relaxed/simple;
	bh=37VUK5+TWxK1e9cS3+n3ISVXXUnge3g+SRovTdHSao4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZM62znNtM/A1CYQkZyyw4C5Yqg7VwBJIR4c5SAqMSlue1l6AB0ALb0T9knKobxmD7/ji9SI7LNbBiGQW3XsR+ThRRLmxUhRiiGb3mxPUVCGQzZA1ASCRUFS6IUpY2NqTe4zoirmqPefdLdWkPf2feSCgb3mxE7BsSaneGr3u3fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bve/pAgI; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bve/pAgI"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so28066485e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 May 2026 06:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779714062; x=1780318862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATSlKdHLpNos2TET6+oDcJdIzVUNDY/6o6GgoTsG33U=;
        b=Bve/pAgIa9nBMYwk3ag5Ok5yhyzOqZDCAknzbRiVM69L1P14lvhjm+yUSNURsnqtCh
         L/EYUWKEmol6M5L+Hk01anFmU6eGtytTz6ySCFxQFU1sojz/D+ITUCbTUwfEu7K0ZDnz
         8unq9pyvc3Vseb+aI3Xy3nyacgLQSRV57fja2sAxFZ4J2bfuGhBKBnH52F8GMVlrmz70
         IFnHbtpSjmu8aDq9Bq+Uu05iPZNiEqk4JWl282E/UrV+S7sKfyrYmQ8UHqsuKcO9WZdw
         ZJfShMmFhPHRsFUGa6Ea2gnPEYn4QIPahf5kQQlfnIt80lCROAYETgQsLajGPKitR5T7
         izlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779714062; x=1780318862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ATSlKdHLpNos2TET6+oDcJdIzVUNDY/6o6GgoTsG33U=;
        b=TJHrn6kQuAaCUZD2XzJkXjRAlSkkKLMwq9x/Ufvkky8pktNsvapiry0cqQ08zhHyeN
         2K9M9J6BsZlCmVGz07MfCmdb/QaOAcjDZqdRMUBIZvH8NXKsVpX03RvXo5yYyopCB509
         ByXnHv+Hk8frY1G6Z1wnMnhBEPV601WfwVHYhUgjSAZY8HILJq7hTRJqUxHzPGhCpJJF
         6hXCmLgTSs0K8SzXDjf0vKWxZ0GUEqtDalMBZqlDDmpTK/InrgLjsIkAttHtt3qGdgXd
         p+2gcLA6XB7AJDeGmF5KRZv7WR0c7VJ3GU6LCzjPU/ZaKEt74B3QiclpkOo1BxQ5S4cv
         C82A==
X-Gm-Message-State: AOJu0YwVSD/S4CEbSYszUgWWQ022WqGHrrtd6vUpx6QcNicUkTeZ1XNA
	qhdteCoLTXNWSEa7sd9f2Ng9rW075dw37AG0K4WpHvMEOh+CRT49i5+T
X-Gm-Gg: Acq92OEEccHao8fOSVY5FniX4ZauD181p76vZkQ+3OsVxTMeDYASPocbbkS7lUCganj
	tgDb67N7GO3Dt5UrRRrHKyagIeS5HP4P40GOIJn8j0cJziYA6JBUnwD9+G9M4PtpVI1qhE5AX5A
	vKxER5t2P0P8/9DfzHG7Sbz4m47m3coqVZIQQ/OG7PjLnmM5GERcPJkgtwsNB7oirSMEc7hp7Hr
	HnJiZaMaXiZjtTKpnO50b2xkLs4gld9SaA97qGZjQ3FLSbHNrO/KY8w+U6HQjb/xW1z1UfA0AuV
	kK7nZ6Tky0T0u5Z7Eis+ho0acRUrtzgBqvfHo6AFOR/PFov/sLavVNYGJeT400IxmkezDT5m3ih
	gyTa911QnLzI3b9gXAC51Is1dJTZ/+WuFX0nDSW8NeBhmvtQQEkgczdh+4Jdi6I+Swf7ker9TvS
	TIXmlJQz+vrz+mTz9RbWGURQ==
X-Received: by 2002:a05:600c:4e4b:b0:48a:6fd4:d3d3 with SMTP id 5b1f17b1804b1-49069da61b8mr35429105e9.20.1779714061935;
        Mon, 25 May 2026 06:01:01 -0700 (PDT)
Received: from localhost ([37.99.69.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526c926sm429381525e9.1.2026.05.25.06.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 06:01:01 -0700 (PDT)
From: Shaposhnikov Daniil <2minesweeper2@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shaposhnikov Daniil <2minesweeper2@gmail.com>
Subject: [PATCH v3 0/1] platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer models
Date: Mon, 25 May 2026 18:00:56 +0500
Message-ID: <20260525130058.7408-1-2minesweeper2@gmail.com>
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

Changes in v3:

Fixed and improved error handling in huawei_acpi_fn_lock_set
Added FN_LOCK_ACPI_STAT_OK macro to describe successful STAT byte value 

Shaposhnikov Daniil (1):
  platform/x86: huawei-wmi: add ACPI fallback for Fn-lock on newer
    models

 drivers/platform/x86/huawei-wmi.c | 101 ++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

-- 
2.54.0

