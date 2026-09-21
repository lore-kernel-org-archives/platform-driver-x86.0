Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD24A9D50
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 14:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002206; cv=none; b=W19RIg8oCQhHkUtMsDusu1njih0NE4xhtRh3netEc/c7pYJMPiFCZyY49fsvSwWOraaWgj/JwBHv6tzehAqxJlqXFN9tEZHV3zVPqtEfRHv3sIm0y3DDxHyKHBcT13B/EVdkZmVL1B8OpBNGHIiOlWmp6Or5n0hO6jMoCfQebak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002206; c=relaxed/simple;
	bh=MvGGZL4IS4MjWjWviaHP6B+xBpIms7EWjzyjzTLCRMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+MKfOIiVDqREaLD4QQi0C5nYvJ5IjzHIJfca7zed8VKWBW3tFiG/MNSHHXKPRLzMdQI6KJD2gF6bB1X+gUVq4MHVOdOLKy8DjfUViaMFhgE4LUcm3Q911P7Pmy0WQdr62yhYyo48GD5CPz4Q7OO5i51+u0fa1p/HyyAn0G6IzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibFJkjo3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibFJkjo3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so15384395e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 07:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002203; x=1790607003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8M61Qqjvm/dE/aUDfnFagoCXYMpIF6uiqbbGLV3Yg4M=;
        b=ibFJkjo3rloeFPr/uQSGRzTdb2rtT3XvdwBejgVrMVEFTSiQGps+NMJ5k7Zon/iFbS
         d/rWKBmD89UZ01QNl8I9qANU4bdCFHmRJzKV6Xjy0ZRKRgFTdwvY8IHXj3OP0DkpBnfY
         Tner00BDrTu+acah+vzm2mkvTkaFfAOiUH04wbnKznoiZT0GEFuWhuWhNUTTFxPHdDm4
         duHF4De1gF4H2w6iTG0U92fS4dizHTZXAKyROVpSKQUNLxlNq4JeuPObP3TvIoSDwJ3B
         8R0PqNZk1ZaaP4lJeYj0SSIv0LFHC2b6mm919ut1cg59Yrv+cuq4hAgK+25sST20VF6x
         Aojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002203; x=1790607003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8M61Qqjvm/dE/aUDfnFagoCXYMpIF6uiqbbGLV3Yg4M=;
        b=bkYcXpqknOuG8Y9WYZ68Q6tBkNeo5bNSTvsBZcxxzq44TDB1B9zEK23oxhAzVVXNIc
         TYeX9SK+IXOBUdIH5/m+LKyISAtwt6/Er65s2DPudRdgEGLVHNqiSd7g9p90l+ZnecYz
         S2ZcpvJ/+JLgu45xwU0IFd1Rs1zh1OpdfaGrGQJWyN+p7glS1pd3qLGo2BMI+Ne0jXiD
         RPuCN6W+/UxLYSslBeVnWDMiY3QTUXTJDTtS2/WXUOwXTAsivtWeZD4S5ypE0akO+YgK
         i9IZmOXb+4p9Fmo8F2KtbnoCHWo6A3K2wP3flml1yCNuvcaAvzK1itPopc8zQR+zwJLt
         JYkA==
X-Forwarded-Encrypted: i=1; AKwUvBxCe1tXj6th26v1LdSLzCq3moR0KGQM3Ho6PEj8Gdnf31Pjk3c6BtjThJ/wnjSL6DMzGLzyCrJYdJRlnNjARUOvmvxU@vger.kernel.org
X-Gm-Message-State: AFuF++lCDFd94wxZvr4HCuMJ6VZ+iGbDdzs4k2TVxUsor0U9DloZ+dVE
	t/zZfnlGLawbhdY8039hZZzvVXwGEEzDFwplFARaxC7tm3fR7scuOAWi
X-Gm-Gg: AYBFou2W7a1+HLiCwi69Zs32zNEkRIPh12txm0OvpsczgEEYcb4VULP97C3yxyLHyZX
	nlNL8vXvJkIAXUlWHHj6c010Havx5wfBgFWVyyBPS1Pc/8yEj8KqDXsBtbpfMMbAobnh8YUhwJV
	BCdeLwf1jrLkKtAmoiGxZIA1Ch+aqdvZqhflgvRftdRzVZFhbRZeYWo3YtTOp4vwdjdBcB4K6AB
	tzmH8ZDt3Gx+1hMj86kJPB9YhRXRFfbK84YEhda7VCxQ3p7MI/TsXL30RTui5IDYLoA0+pLSE6I
	L7iKgKxCOrAea8OYtERGkFAee+tPVscY7dqI2DrsKNrfDc3TsWkObnt9XKxj1YAPLJmnJKNB3v/
	TvJWTOfE1f8O1THgmADLW9OWR7CRZik6gpa09xJnscDMSImCFkQ28IlzxzjZvzOwhIi0Kbz63KS
	ScAlYxJj3OFG+SatwlM2JvMjkL0I8xqmDSg+w7Ti5s5a17bXIpxEisHeoIoVGR5EVezVuQbfxMJ
	y/VWg7Nj6eY+t5ZbJJd
X-Received: by 2002:a05:600c:3107:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49fc5669346mr157236555e9.6.1790002202748;
        Mon, 21 Sep 2026 07:50:02 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm191595725e9.1.2026.09.21.07.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:50:02 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 0/3] platform/arm64: Lenovo Yoga Slim 7x Gen 11 embedded controller
Date: Mon, 21 Sep 2026 16:49:50 +0200
Message-ID: <20260921144953.15113-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Slim 7x Gen 11 is a Qualcomm Snapdragon X2 Elite (glymur)
laptop. It carries a Compal EF06 embedded controller on I2C at address
0x70, which is the only source on this machine for the board thermistors,
the battery cell voltages, the fan tachometer, the keyboard backlight, and
the mic-mute and airplane-mode keys.

Patch 1 documents the binding, patch 2 adds the driver, patch 3 adds the
node to the board.

Why one driver
--------------

The automated review of v2 asked for the hwmon part to become an
auxiliary driver under drivers/hwmon/. The hwmon channels, the LED and
the input device all sit behind one command mailbox and one interrupt,
so the driver stays in one file, like huawei-gaokun-ec,
lenovo-thinkpad-t14s and qcom-hamoa-ec next to it. It is documented
under Documentation/ABI only.

Notes
-----

Fan speed is reported but not controlled, deliberately - the EC enforces no
thermal floor over a manual setpoint. Patch 2 has the measurement.

Tested on a Lenovo Yoga Slim 7x Gen 11 (DMI 83QR, "Yoga Slim 7 14Q8Y11").

Changes in v3:
- Add the board DT node as patch 3. It was posted on its own [1], and a
  node cannot be merged before its binding (Konrad).
- Add the "Why one driver" section above.
- Patch 2: name the driver after the module, and the i2c id after the
  compatible.
- Patch 2: spell out both SCUK bits the Fn-lock toggle moves instead of
  the 0xa0/0x5f masks.
- Patch 2: return -ENODATA for a thermistor reading of 0, as probe already
  treats 0 as "not fitted".
- Patch 2: ten tries for a cell-voltage sample instead of thirty.
- Patch 2: include what is used directly, devm_mutex_init(), comment the
  mutex, fix the address in MODULE_AUTHOR, say in the commit message that
  results cannot be matched to commands.
- Link to v2: https://lore.kernel.org/all/20260908183403.2107-1-okerixx@gmail.com/

Changes in v2:
- Patch 2: drop #include <linux/mod_devicetable.h>; <linux/i2c.h> already
  provides both of_device_id (via linux/of.h) and i2c_device_id (via
  linux/device-id/i2c.h), and the header is on its way out.
  Reported-by: Uwe Kleine-Koenig <u.kleine-koenig@baylibre.com>
- Patch 2: add "depends on INPUT" to EC_LENOVO_YOGA_SLIM7X_GEN11; the driver
  registers an input device unconditionally, so a config with INPUT=n did
  not link.
- Patch 1: pick up Conor Dooley's Acked-by.
- Link to v1: https://lore.kernel.org/all/20260908091752.5508-1-okerixx@gmail.com/

[1] https://lore.kernel.org/all/20260914082950.9393-1-okerixx@gmail.com/

Oleg Keri (3):
  dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
  platform/arm64: add Lenovo Yoga Slim 7x Gen 11 EC driver
  arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller

 .../sysfs-driver-lenovo-yoga-slim7x-gen11-ec       |  21 +
 .../lenovo,yoga-slim7x-gen11-ec.yaml               |  56 ++
 MAINTAINERS                                        |   8 +
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts    |  12 +-
 drivers/platform/arm64/Kconfig                     |  23 +
 drivers/platform/arm64/Makefile                    |   1 +
 .../platform/arm64/lenovo-yoga-slim7x-gen11-ec.c   | 653 +++++++++++++++++++++
 7 files changed, 772 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
 create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c

-- 
2.55.0
