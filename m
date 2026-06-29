Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3B93DA7C3
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 07:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718864; cv=none; b=rDOaJ1Q38+2wlyIg1+Xst+Qcu5kGYAxpp1idznntuel2mitpQBKJzhqlGaXSvA+wRr1Ina//FaWiV+St2hLFnp2DtBwFE9n6Kcw+lHIMtGW/5P+leNb8LKUsR9YyGQmWJHjJsS4nHbDJj/FbXEAY5qG6oIIhRenexOiz1xgW37Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718864; c=relaxed/simple;
	bh=FyDFSzplXeB6PDHS/Nomdon6/tNG/wd2fOLuPUfZ7oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cB2WUjLkqY74MSuwZQmKc2Q3W2PADNaXva6bY0o0d7nDaMJ5kPD9aPvMlKJUa6ousDV3IaiqjKCKsgF8qW2dYpytpdUm4z4e2uNHSyUp9b/xXf/kMrnrnhPKtS3z3VKKuSBmOMugNcOXYrIBMLubRoB3q1VsA4E3KZzyMQ3ExA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dSs673cD; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dSs673cD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782718860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8tyLqLSgpIeLAGIOfYwqq95HC8B2awaWZSPTU2Wc9uE=;
	b=dSs673cDMkTe/yHCUkunNFYpUNkuqKBB7XyBlaKExCD0z8N2PPWV83N5/PNC1twcZKnvTm
	X6y3PIbGs2VHHFTxqFvbimXnUHi4z+nOEguZihL742Ogc2zROq8EBj8S6JQcFtD7PXoGSe
	HDeb/KPYgyFkT2OM6PcVSOlC45h5yoI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-7-XdU0cYhHPSGuqGG03ci0fw-1; Mon,
 29 Jun 2026 03:40:56 -0400
X-MC-Unique: XdU0cYhHPSGuqGG03ci0fw-1
X-Mimecast-MFC-AGG-ID: XdU0cYhHPSGuqGG03ci0fw_1782718854
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A8471956051;
	Mon, 29 Jun 2026 07:40:54 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.com (unknown [10.67.32.110])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A7E8B1956041;
	Mon, 29 Jun 2026 07:40:45 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: computman <anis@talbi.fr>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v6 0/4] Add Sony IMX471 camera sensor driver
Date: Mon, 29 Jun 2026 03:40:22 -0400
Message-ID: <20260629074026.35490-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

This patchset adds the Sony IMX471 camera sensor driver to the Linux
kernel and resolves the IPU7 camera can't work issueon Lenovo X9
laptops [1].

The patchset contains two patches:
1. Add DMI information of Lenovo X9 to the image upside-down list
2. Add Sony IMX471 image sensor driver

The IMX471 driver can be found in the Intel ipu6-drivers repository [2].
To comply with the sensor driver implementation, the clean-up work
includes:

1. Use CCI register helpers.

2. Enable and disable streams using enable_streams and disable_streams
   functions in struct v4l2_subdev_pad_ops. Invoke
   v4l2_subdev_s_stream_helper() to manage the streaming state.

3. Get rotation information from fwnode properties using
   v4l2_fwnode_device_parse().

4. Finalizes the initialization of the subdev, including allocation of
   the active state using v4l2_subdev_init_finalize().

5. Add the IMX471 driver to the Makefile and Kconfig file.

6. The mutex lock is managed by the V4l2 core.

7. Replace the supported link frequency with v4l2_link_freq_to_bitmap().

8. Drop unused codes.

[1] https://bugzilla.redhat.com/show_bug.cgi?id=2454119
[2] https://github.com/intel/ipu6-drivers/commits/master/drivers/media/i2c/imx471.c

Changes in v6:
1. Add the con_id "vana" for the power enable to the int3472_gpio_map table.
2. Drop unnecessary macros.
3. Name the registers.

Changes in v5:
1. Add a description for the DMI_BOARD_NAME in the ipu-bridge driver.
2. Check the numbers of MIPI lanes. The driver only support 4 lanes mode.
3. Fix many rumetime PM issues.
4. Drop pixel_rate control variable.
5. Drop unnecessary comments.
6. Name the registers.
7. Fix a leak in imx471_init_controls().

Changes in v4:
1. Add TBE20A0 (found on Lenovo X1 Carbon G14) to the supported sensors list.
2. Revert the sensor upside-down list to v1.
3. Decrease the max analog gain to 800 to mitigate the image flickering problem.
4. Return the error value when __v4l2_ctrl_modify_range() fails.
5. Fix indentation issue in Kconfig.
6. Fix the cci error value issue.
7. Drop unnecessary comments.
8. Drop unused link_freq control variable.

Changes in v3:
1. Naming the register addresses and set up the value with the correct value length.
2. Implement the .get_selection().
3. Drop "identified" field from struct imx471.
4. Drop "streaming" field from struct imx471 and use the __v4l2_ctrl_grab() instead.
5. Moreover, The naming for the register can be found in a seperated patch. If we
   agree with the patch, I will squash it into one patch.

Changes in v2:
1. Change the Bayer format setting according to the vertical and horizontal flip settings.
2. Replace the self-owned mutex with the v4l2 subdev state.
3. Rework the flip control.
4. Manage the regulators using devm_regulator_bulk_get|disable|enbale API
5. Invoke devm_v4l2_sensor_clk_get to get clock-frequency

Kate Hsuan (4):
  media: ipu-bridge: Add DMI information of Lenovo X9 to the image
    upside-down list
  media: ipu-bridge: Add Sony IMX471 for Lenovo X1 Carbon G14
  platform: int3472: discrete: con_id vana for Sony IMX471 as power
    enable
  media: i2c: imx471: Add Sony IMX471 image sensor driver

 MAINTAINERS                                   |   6 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/imx471.c                    | 957 ++++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |  41 +
 drivers/platform/x86/intel/int3472/discrete.c |  18 +
 6 files changed, 1033 insertions(+)
 create mode 100644 drivers/media/i2c/imx471.c

-- 
2.54.0

