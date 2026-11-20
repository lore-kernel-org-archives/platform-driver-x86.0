Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186308;
	b=SuvODVlJ9fnKnx2ygOYxTdM+Ew6fsIC2BKq4hUts5hR7FYcOR0/BxHNvprKzZIKtB6BW
	 TIFgiOdswSBPX6BGWYs+y4BUY85wCxTmZ87eZSC5azrJZ3Vi0Hw9kAMIyoPaBKlpsH81x
	 /RWjweZwLnaTCVzh37YnlHgQuiEbtCq3/RTmre0T2Mp0mh5B68ad6QZolxZ0smwqP6CjK
	 zq1jZUSBrERnyqH/Ar9v4cT0RSkFn185ry4GG0i8wbAkgENjiwpxErFVPkIpfC6UCpbQz
	 CjSprsYBW0CpaJE2BeL82hqjUh1V7TuieFiPsyQJn8kUbRAEEEYUkDPR98beyS3YxOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186308;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Debian-User;
	bh=//6y8NvVjki9EHdcTl5gAEonla5ZryeZvsxmA5gzjME=;
	b=gYu5ewEkOuRa4/+Tkoe9/51kVNrp5JsuZemOYaYJdPUszGwHlp0sEbeXbPMWjIsalD+A
	 7C6Iehp6X5Nricw/9k9RvpSfB6lmYrL89lUv4ZqaimVZfGw4q4C5450oNHqajf2KZDu40
	 FqkIAlEkFfdSl23Cx7vXDKngrCtu/MRFzb5BB/4cB/91ox7X9abY+30+1yccTNVkRX3T9
	 5aQMdApZIIIbrmwclq0g8V8p/N5EbWQ0vPVDwYAGeeazJdaFPrJDs9m1TzDrE4pd88VhW
	 JnRUTEUkAQdoR+jqC3WeCOQi50oltFwEDq719Lp8DiYHr1jFVc7P4sJdQRE0NYrJKrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=flWmKV8Z;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF1D606A32C;
	Fri, 20 Nov 2026 14:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF1D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=flWmKV8Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=//6y8NvVjki9EHdcTl5gAEonla5ZryeZvsxmA5gzjME=; b=flWmKV8ZaWXRFh51NZ+Tr/FkjI
	Jcvbgc8mZ2wfnWCFSBWXtrYwc+/1LIVNP7ij5JdbgxLPxFN5NVCUEwlemDj8Z10nUR4+Q4B+QM76I
	JqZNXhVB0jL/vdDlJSnAdroZ1YJbOFF4kdIgHV/Tal8rrawY96Ko30sHdNI3rp1Lw0ul+G/UKGb1c
	ddkHncu/7kOYKzeN85ZTI8k57ZDQBBMoiSraLLZudd9JLLB3XsLjUpDM/aLOo9mCUcToZREvUU5s2
	evLqs9Gjvplx8iGKmrx1aUx5lue1Q9ZufxHiIHRjPpYtzhuhxJ81fSs1sbLU/9XXRgxYSQ/fphaC0
	NpCPphZA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <emfox@debian.org>)
	id 1xUPxb-002wgV-2p;
	Fri, 20 Nov 2026 14:51:32 +0000
From: Emfox Zhou <emfox@debian.org>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] platform/surface: aggregator_registry: Add thermal sensors and fan to Surface Pro 8
Date: Fri, 20 Nov 2026 22:51:16 +0800
Message-ID: <20261120145116.870772-1-emfox@debian.org>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Debian-User: emfox

The Surface Pro 8 device group lists the performance profile target but
neither the sensor subfunction of that target nor the fan speed target,
so surface_temp and surface_fan have nothing to bind to and the EC skin
temperatures and the fan speed stay invisible to userspace.

Verified on a Surface Pro 8 (i7-1185G7): all 11 sensors read back
between 34.9 and 50.6 degrees Celsius, including the three I_VTS
channels used for skin temperature, and the fan reports 4592 RPM.

Signed-off-by: Emfox Zhou <emfox@debian.org>
---
 drivers/platform/surface/surface_aggregator_registry.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index cf3ae25..1bab30c 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -359,6 +359,8 @@ static const struct software_node *ssam_node_group_sp8[] = {
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
 	&ssam_node_tmp_perf_profile,
+	&ssam_node_tmp_sensors,
+	&ssam_node_fan_speed,
 	&ssam_node_kip_tablet_switch,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
