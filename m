Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F873264C4
	for <platform-driver-x86@vger.kernel.org>; Sun,  9 Aug 2026 04:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786249605; cv=none; b=aLviQlR2rko4iwF7dUEIXUX9NFICptOGaHlC/TgnzIHPI3G2A/jcF82eMmjFNIk4l76QZIXDbYM+fLQPfok7GzNleYbu8M/maA2gKh90vBZFAUL6h8uE7NcKgd9huRMJBDxn9Qw8eAMswNliauhvOJCjOjPaRxievPHN1zj+r8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786249605; c=relaxed/simple;
	bh=iQBv7pUeEg3ytv+MCJ3yxgVxq3jCBJ5srbYcx2us9Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dZlWspH59eG/yvq8Of9RU5h7MzYt+pDOxcSnA2Ul9FNMtP1RD1+n4o8BKwHUXE24KXWV37BXu37v4oflJigtcyioDLwM3FyBMrX/zGJFoPXqCnJKo4J4uXKg9CtO28gtVBmlo6Jn2APswiXjDJBpi5g5EhWdttJs9sR09PHiOFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sz6jyOU/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sz6jyOU/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ceab75934dso9268215ad.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 08 Aug 2026 21:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786249602; x=1786854402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQPiHvxFttNhH3iwRqRd4nOB/qBhTJriz5rjrn2Jji4=;
        b=sz6jyOU/50EqUta3YzRbpx+9tfxCnHe1KyKq1gcLPAlsoKp7ZsAupwMdFOQLK4lyYV
         kgmuTDRI+m0c56isxqkoBJafzHejfoueKt/IDNGRFljVOEP0WD0fZ4PLhvZBy2lBqXBr
         vUkLYU6BSv6mTxAq3RpIiaDP66gIubgnyYG5PTnoYN8GcHJt5MeoIKUL8AAnZ8fO4mVg
         YElPc7WAGW5woEmK1LwmUoqPaRB1X+53Y5OwfsEep/m+uqcFHc/ux4esXIHJoEmZm+SC
         gllEysFS6zdNPUZ4Lb5HvRJzCf7xctUaiSssACOBsaRVniyJ4apHB4ErzGCSgOFtuxsK
         fGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786249602; x=1786854402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQPiHvxFttNhH3iwRqRd4nOB/qBhTJriz5rjrn2Jji4=;
        b=oabnMslbo4Io4zotvEFPbXC3MTyB9vgAnwE27+FC8hOMm+crPyZnsmQhRzZiOlQhch
         HCsxAj3nvxm2n2S1oumiLU23nU7u2U3LlO80rJIlKC9AayYJgcY1etwGOkPbZ/Ht1RvI
         GNxZj577gPfQjgmaarJM42cRTzn/tmLCsSJ1+/IVsbTMgbz2QI0igvoJ+aM8H2uEddTJ
         B+RJHZIXP+KLgVZKpbdY2mSWMM9/hzf0sM5aUCH+qwMMMnvAcf2RkSgkjw0soCmSq436
         E4X0zyl9gdizpfXlPbRJVzpV9QM7/ntlNjXbJqVvhF7QxFKSD09fSxwKySaja7IFU1xf
         bXzg==
X-Gm-Message-State: AOJu0YwTol4nyIxEOu8Mt0q9gwiI2SQghnbx6LzEXALYQ6ubGV0ViJ0F
	tuXz7fXf4e+4QAZdVXLYUUrsHDLbM8gpnPwoyruJH8DvGQjT7FGy5rwuRo/sBYxI
X-Gm-Gg: AR+sD12OF5Dv3T1zAkSnVs0UdSScbJoAVMKYnsi3RWaEkfP1fX+qFYGzfqUAfnZNFtn
	OLWeAIXU2lQVeMj2n0SbzJcDB8C5se5bRw1alpFaVBJyhKpRILDWgIr0yJLAwsgO8w4NiEMxUEi
	lIePyM5PHnG6A6sqpdy8Sc3v68DrdTSeoWNvifhQULgsKwxrqFywRYtDXXDRTmDP1HuHpISluMV
	08o7SmvSI40gA7aW4XAWsQPa25TIc+GdFfRa0CMoiVwK0IzbAsCHFMFLdtH3jKTmgGVWgYICFcd
	NIwkgwqpOQBAqDg50Ut22GWBHP5zBLh+4uesP0Bnh/I/iUoQue0B5GJNSsZkPLuFarTKtfZVNCE
	3Xqlog6eDSuAyFluizR1d8ytMveos/MWpAkcQg+HSm7xEVsAnDRAJKHmFJxfqmL28tzL2T/6G9/
	RHZSXLv45bpuQs/rE7/UZAf/ABB5G8+oIa8/HlSnIwaG0zgiefeJqECw0AZPTwkLLAg/RLF2DQu
	k2EQLDuNoj8j/OwmOK9YGbp73XEKyDR/g4c2xJdHLi/DQY4qiDg
X-Received: by 2002:a17:90b:2f03:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-3903c53404amr35739006a91.7.1786249602278;
        Sat, 08 Aug 2026 21:26:42 -0700 (PDT)
Received: from prof-g-y-land-Latitude-7320-Detachable (121-45-161-118.tpgi.com.au. [121.45.161.118])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1410199cf49sm21659516c88.3.2026.08.08.21.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 21:26:41 -0700 (PDT)
From: Sahan Nissanka <adee.sahan@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: dan.scally@ideasonboard.com,
	sakari.ailus@linux.intel.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Enable the front camera on the Dell Latitude 7320 Detachable
Date: Sun,  9 Aug 2026 14:25:16 +1000
Message-ID: <20260809042540.15849-1-adee.sahan@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the user-facing 5MP camera on the Dell Latitude 7320
Detachable, which has never worked on Linux. Two open reports ask for it:
intel/ipu6-drivers issues #24 (2022) and #402 (2025), the latter blocked
waiting for "OV5678 sensor specifications (clock rates, power requirements)".

Those specifications turned out not to be needed. ACPI describes the front
sensor as OVTI5678 and no driver has ever claimed that id. The part reports
chip id 0x005675 at register 0x300a, and the values ov5675.c is sensitive to
were read from the machine's ACPI SSDB before the sensor was ever powered and
both agree - 2 CSI-2 data lanes and a 19.2 MHz external clock. The advertised
5MP also matches the driver's native 2592x1944. So no new sensor driver and no
new register tables are required to make it stream.

One caveat, set out in full in 2/3: this part is not a plain Bayer sensor. It
carries a 4x4 RGB-IR colour filter array, one pixel in four being infrared.
That is confirmed from Intel's own Windows IPU6 configuration for this exact
module, from measurements on the sensor at full resolution, and from the
module's tuning data, which agree with each other. The SGRBG10 that ov5675
declares is therefore inaccurate, and colour is wrong in a way white balance
cannot correct.

That cannot be fixed in this series: the V4L2 ABI has no RGB-IR media bus
code at all, and ox05b1s already carries the same inaccuracy for an RGB-IR
sensor of the same class and resolution. I intend to propose RGB-IR media bus
codes separately. Until such support exists, this series takes hardware that
does not work at all to hardware that works with imperfect colour, which
seemed worth having in the meantime. I am happy to hold 2/3 if maintainers
would rather not add the id before the format can be described honestly.

That leaves three small pieces:

  1/3 gives the TPS68470 PMIC board data, without which the sensors are not
      even enumerated - they declare an ACPI _DEP on the control logic, so no
      i2c client is created until it probes.
  2/3 adds the OVTI5678 id to ov5675.
  3/3 adds the ipu-bridge entry so a software node is created for it.

The patches touch two subsystems: 1/3 is platform-driver-x86, 2/3 and 3/3 are
media. They are independent of each other in build terms, but none of them
does anything useful alone, so they are sent together for context. Happy to
split them if maintainers prefer.

Tested on a Dell Latitude 7320 Detachable, BIOS 1.48.0, kernel 7.0.0. With
all three applied:

  intel-ipu6 0000:00:05.0: Found supported sensor OVTI5678:00
  intel-ipu6 0000:00:05.0: Found supported sensor OVTI8856:00
  intel-ipu6 0000:00:05.0: Connected 2 cameras
  ov5675 1-0036: ... appears in the media graph

and libcamera captures 2584x1944 at 29.95 fps.

The rear OVTI8856 sensor shares the same PMIC. Its rails are described by the
same board data, but its reset/powerdown GPIO assignment is not yet known, so
it is deliberately left out here.

Sahan Nissanka (3):
  platform/x86: int3472: Add TPS68470 board data for Dell 7320
    Detachable
  media: i2c: ov5675: Add OVTI5678 ACPI id
  media: ipu-bridge: Add sensor configuration for OV5675 (OVTI5678)

 drivers/media/i2c/ov5675.c                    | 11 ++
 drivers/media/pci/intel/ipu-bridge.c          |  2 +
 .../x86/intel/int3472/tps68470_board_data.c   | 92 +++++++++++++++++++
 3 files changed, 105 insertions(+)

-- 
2.53.0

