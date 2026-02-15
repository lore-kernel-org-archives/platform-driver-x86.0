Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0903E212F98
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 06:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771136025; cv=none; b=VsjD0rzyk04h5UwGKHOY8JICPhtvqKSoCOLaEwgueYpQ8M1DVuJ59MHyyCuWMxobXUG6sN/KDF/Tnq+54L2s3EFjIryJ4zR4Z6NkPEvdYGC4ob03t0Pu30qkHpvvl2kv5ofsa5AkZUVyrJqEXq9fkd6iJh1NGT9f1riA538Jfyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771136025; c=relaxed/simple;
	bh=NuoWdMkI4zb9o92HF0VAA1xvTuEfPLaG2mc4/JVBPho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hLUkkKZOz7vaAUXqGDH03T9YzBrWgE+zkb5mb1eforSFQVmfzyyxFkagjMzQco0bHtwnW9sMC3SO75cUj8BbIHbXUOrt8z8QFZEqzorPL6HFiiPJXGvOWsnGoSRni1Ik5X8Vj98Dn1X/GHPGpDAhL4G/lOpcUod2B/9G0WKmEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9jdJtEY; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9jdJtEY"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1233bc1117fso2353560c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 22:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771136023; x=1771740823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hyOyhqjdcaZH1JmS3/LX/rDvhQe+l28zkSACpoEDccI=;
        b=K9jdJtEYs2eHuSdEE2VmIVr3yIHlv01BWBIZBoZ9Ls2Ni7OAtvrAHUxIyKkPIU/f+C
         BOEnAjufXgdvH8yNi+q28pfTz8fcpOyRy7OujBu2QKlea1ysLd7z9Mm7tL/F/7eLF9Y+
         tdcp/LN/aGvNkqNjRfiVzhwj54b0bL7T6ddQZO/ifJNZ+NvBW04kM1V2GXIIjE7PYnnI
         FSEeXM0GvbUcgdsgWU8qepX3QySMqCwyOYPoUtWKklC+18+kvyQGRXfnNVMaUWECAI4G
         N4VNZX2e5kWIbHwFdKZNEHlofqrEbux8Web2UYx2B9PS26tBTgmWvYYbU5wLFGeLESEo
         Gqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771136023; x=1771740823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyOyhqjdcaZH1JmS3/LX/rDvhQe+l28zkSACpoEDccI=;
        b=Dl1mTB8CJgsZ2rO9ZWtSfu8mRmEZdWjBg/ZSI9hwVdV/iO1iSk+MzjoyPd9e2JRteg
         6UYb5d5aAwxWkXKlje6oaRuq5qNEwhDVXnVzC61G341cRZoLR+Xz5Y0uKsPYTBcjEiYk
         RI6gC+spwMnUSkL+1rKx6T60MGYfXT3gc1UCp0Grt9qvI58DjWy05F6E6hQ02Fs5egNW
         BQS55gir//seU6Pg7t/w56jqt2o7fBcU4wYPsqsddIAY8KHdqQnlVLLWZfLsZCbAcVXq
         OA3/UYyRsu9OA1epmaTcK2uJipEHvTqJuN5iCQFkUKL1RmH0NsKnkgpf1muYw1tQmpC2
         /39g==
X-Forwarded-Encrypted: i=1; AJvYcCU2QF8RQlvhbtxZROvNx2JZIwguHjzUA2/wGs1C/O8iXl1IhZg4uXfro64FTNxSec2i9FvOYBQDZ36elZm97/CUQqbd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg8nHdEpHMyHuIjpTrCySoQu9779dZfNKNUYN21ZTVPQe66DHd
	FyzvKpeJ3Iqr11InaideDDlZGTvfISrYlSCI49JzP6A9iNBjJpQy6Fvi
X-Gm-Gg: AZuq6aKGv1vx7JnnpDInEKmKlS6grY1wiD9QnFrB83EJZ1Bo1X3UAhP7LL7MFhCg1Lt
	irBd6SkSpTXNGOq5/3bzaEUGke6oqxquT5eLeJbwWpmgA57Nk35/yqZ4WRc/Y4M+gjk3Zdky4lX
	ldFEGXEpko0j5hEi5VC3iM9/Cw2w55xfcF6/wpfzPLcdTRfOueaP+321GvH6GvQAu6Cm4SiDfQ4
	nP3gA8MLsuu5u+0nC4WTN9ZLM5GJzp52Ub17vsnhcnPyZ61ad8+Si2YTuSh56PqRN6SvS52VfiR
	7x0oenJIRmdeJ292enETGIKncOUZsPx2pdWjA4sdpNu3jDUANTxN6QN463dP24C6jqkokv34zop
	6s5VazHYb3gE9Qzw7YNcU4BR4y3vFo5Gb3LNyzZk2LnkQCKt2Lse2coXWnagJgNkPn++eh/Cu+g
	6xwPd9mA1QGSfVx+uBQskhmPVPX4OoxIEJu8qix5otDA7GDBGOTDDRayrDwfScTw4Dbrdx47dZa
	rA=
X-Received: by 2002:a05:7300:ca1:b0:2b8:3b47:8951 with SMTP id 5a478bee46e88-2bac71d4b02mr2061987eec.1.1771136022880;
        Sat, 14 Feb 2026 22:13:42 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm4759245eec.12.2026.02.14.22.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 22:13:42 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] platform-x86: lenovo-wmi: Add fixes and enhancement
Date: Sun, 15 Feb 2026 06:12:53 +0000
Message-ID: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds many much needed features and fixes to the lenovo-wmi
drivers.

Patch 1 adds a macro to make assigning attribute ID's for capdata
cleaner and easier.
Patch 2 addresses bugs where devices that don't support exposed
attributes would still create the attribute, and also attempts to
identify the correct capdata and set/get methods as some legacy
interfaces don't use the custom mode in the method or capdata ID.
Patch 3 adds the remaining CPU attributes that weren't previously
exposed.
Patch 4 adds the GPU attributes that weren't previously exposed.
Patch 5 consolidates name constants in preparation for patch 6.
Patch 6 adds battery charge-type limiting when supported only by WMI.

After applying Rong's series from
https://lore.kernel.org/platform-driver-x86/20260210191938.137234-1-i@rong.moe/
I found that there weren't any conflicts, so rather than combine
the series we can just review each separately.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v2:
 - Fix gpu_mode misisng from attributes list.
 - Fix prototypes for power suppy patch.
 - Reorganize CPU and GPU attributes alphabetically.
 - Break out the patch consolidating the driver name cost.
 - Move some of the refactoring of attribute_id back to into patch 1
   where it belongs.
 - Fix some additional typos in function prototypes.
v1: https://lore.kernel.org/platform-driver-x86/20260213081243.794288-1-derekjohn.clark@gmail.com/

Derek J. Clark (6):
  platform/x86: lenovo-wmi-other: Add LWMI_ATTR_ID Macro
  platform/x86: lenovo-wmi-other: Limit adding attributes to supported
    devices
  platform/x86: lenovo-wmi-other: Add missing CPU tunable attributes
  platform/x86: lenovo-wmi-other: Add GPU tunable attributes
  platform-x86: lenovo-wmi-other: Consolidate name into single const
  platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.

 .../wmi/devices/lenovo-wmi-other.rst          |  21 +
 drivers/platform/x86/lenovo/wmi-capdata.h     |  13 +-
 drivers/platform/x86/lenovo/wmi-gamezone.h    |   1 +
 drivers/platform/x86/lenovo/wmi-other.c       | 606 ++++++++++++++++--
 4 files changed, 592 insertions(+), 49 deletions(-)


base-commit: 5a5203a45b063a594e89a2aeaf9e4923893a5b4c
-- 
2.52.0

