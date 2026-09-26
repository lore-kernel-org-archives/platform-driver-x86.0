Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C192EEE62
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 00:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790384303; cv=none; b=QwvvBM/gVYQ4yAG3On0XWnWsiBXMXWKFVz2QWNsYSc2y99+g+MW1BBdKxT8ha+g89aIPoksccAi2glfdfWYQQHgOmFi+0yCWDIvw/oHGsLQ+RohQ4Fbr8ZWeKXsj6vuxr1iAzy8PF+VysNPBgrmckRBmSFyg/rMdhQh9s+PTR4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790384303; c=relaxed/simple;
	bh=HPr8/2EtAeRAkpW50wA3FXIhEB229L1oWQntdtEa/N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2zPkk31V2aey5S7OSF1fAH1MRN7pZ95kkcKfJh9SmlA/+RMHOz1J/lyZz4X/LchSs3T8Uhdc0D4uA3XjvF5evAu1gOwvDR3n/98WVqWrCMu1scRtFs6Rcy465ETwTCVChhcwB3BlLGAGcTmuMjP7MZONwipd1iGtarUuDEMubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEQq3Ypf; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEQq3Ypf"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so794078f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Sep 2026 17:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790384300; x=1790989100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uSW8OZsYMIZFbWWsjbfvd+eNMCgy9dlKRXhhKSm1DA=;
        b=UEQq3YpfarkfetrkVv+0KYrJLbfQfmPwE5lovfZo1ABJg6qxn+8JP7Uu+dcOjY8GbW
         OUWozJ8rJAJ2G7RIraiSCT/btLbWsKDSc26hWlBOKp0rzD6gKOXBSp4mwK7u7FUKYSzz
         st+zIhA1u5zICyOkXaJGGemKUVqvlQmWvcdduDjZqDKNfptvSEAeiFq12z62jjV2YPl2
         6HReHUoIQFvK4i7V5OfP3gfoOpdIsEl4GHPzb90HzpX8iZ59s+uB24HtPheeaEqzgWCA
         RkWD9JBGWl2Y+WmruRmtH5p1M5rfHCiSYQp2qRFKmG/wWMezkrlj8BfeTav2/LfDHBI5
         7WEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790384300; x=1790989100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8uSW8OZsYMIZFbWWsjbfvd+eNMCgy9dlKRXhhKSm1DA=;
        b=s5rVh3iaVlvY0vLQt1dPoqTpbPeUDyshe+ydTa7FvWuduTYrzlUHEtaxA+3463xI78
         nhVWpKE20DXfaUqtST6Nw2CkVklDya8vSEFhd5GsVZi2Z26NM0pMUEkSdka4HfyKp1/v
         6g7jf12WXW41WfvFA7K24hpRMolluocKcEoxHHAVf6+58/wUL5YpUmApYfIVs3JyjLH9
         qyJvWQIxYXDsYl2O0SZoCG/b9BtV2Dd2RAAwTsshgmarfQommhodkdnd8fc4NIOjvp1f
         tdTFOyQ2mZp+no3k+fPq60Zr9jKTQl93WZVzJRq6g9wKU56XMwn+j1W02kPiWL3PggJh
         ArRg==
X-Gm-Message-State: AFuF++mHYjL7UJyhdS7GHLQKIGWRe/bz4L03nrLTkf+fW+b5Hg5YQekY
	aTYklMTijwP6JUavvi1bseg9vAYfP5mT2a8rFcDMT6YtXoWrSstU1eOlSVKVDgNMjvgg8g==
X-Gm-Gg: AYBFou0/5lxN56NsLP6NsYvaYn+7eOy3emPewUljoslDCZS80S2uEg25niZMyABx4dZ
	SkGM0jgJEifCeARbQQl9HP0IMjQUKcGOcTPKgoOSX0F/0oKF+GM2E7jMrPHYVDQ+ldwTPm8H35l
	6zPRhe3spqWNBAzeGbxPpFx6JG1FSOrVXeHGwuCHFJHa0mocCfchusIajNg4n+2S9i5jI2v2wzf
	o7mdHLuQ/mKEb/J5OaAO8qUKfzyOwlSAKgG73WuEsqc1N9g9b8sZCT/x4XoNrQ0t0zPxNXOVQQE
	P/CR+N4uqxLpv70PBO/pcVOltZpFBAWv7n2+XxDF3Dh2Id8gX3e9fA/t2BUF93ZRKbiedWc0Khd
	5gJgjXGu/FQRIjE+yIuJnLOIRu2xf15z6Hb+e+sR6mQzQDK6lJQZ+U61Zlj32SnfQNxHcyMRtvS
	h65zRhwBujVG6pC7fcIWff7knWAGbD7ehw4i/PItt/qFtwFYdPabeNh1jfOP7k
X-Received: by 2002:a05:6000:490b:b0:487:27f6:a4ce with SMTP id ffacd0b85a97d-488828c8ad6mr4522670f8f.30.1790384300031;
        Fri, 25 Sep 2026 17:58:20 -0700 (PDT)
Received: from ASUS ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm10195890f8f.9.2026.09.25.17.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 17:58:19 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Bartu Alev <bartualev@gmail.com>
Subject: [PATCH v2 0/2] platform/x86: asus-wmi: Fix TUF keyboard shutdown naming and add RGB readback
Date: Sat, 26 Sep 2026 03:56:23 +0300
Message-ID: <20260926005625.171560-1-bartualev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925200744.129714-1-bartualev@gmail.com>
References: <20260925200744.129714-1-bartualev@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes the historical misnomer of the TUF keyboard
shutdown power-state flag and adds sysfs readback support for the
TUF RGB mode and power states.

Patch 1 relabels the fourth state field of kbd_rgb_state_index from
"keyboard" to "shutdown": BIT(7) gates the keyboard backlight during
the ACPI S5 power-off sequence (A/B verified on FA507NV: bit set =
keyboard lights up white at power-off, clear = dark shutdown).

Patch 2 adds readback support via DSTS 0x0010005B, which evaluates
the DSDT method EC0.KBLS() and returns the live EC RAM state as a
16-byte buffer (mode, R/G/B, speed, power flags). Both kbd_rgb_mode
and kbd_rgb_state become readable.

Re: the cmd field question raised during review of v1 - the KBLS
buffer carries no command byte. "Immediate (0xb3) vs save (0xb4)" is
a property of the write verb, consumed by the SMM handler; neither
the EC firmware nor the ERM2 mirror retains it, and both verbs result
in the same applied state (verified by writing with cmd=0 and cmd=1
and reading back identical semantics). The leading '1' in the output
is therefore synthetic, chosen as the canonical input form so that
readback round-trips with what userspace writes.

Changes in v2:
- Split into a 2-patch series:
  * patch 1: isolated naming fix with a Fixes: tag for -stable
  * patch 2: the readback feature
- Renamed the new DEVID to ASUS_WMI_DEVID_TUF_RGB_READBACK to avoid
  confusion with ASUS_WMI_DEVID_TUF_RGB_STATE.
- Documented the synthetic cmd field in the patch 2 commit message
  and here.


Bartu Alev (2):
  platform/x86: asus-wmi: fix TUF keyboard power state shutdown naming
  platform/x86: asus-wmi: add TUF keyboard RGB readback support

 drivers/platform/x86/asus-wmi.c            | 87 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  3 +
 2 files changed, 84 insertions(+), 6 deletions(-)

-- 
2.55.0

