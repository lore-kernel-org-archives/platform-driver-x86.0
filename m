Received: from out203-205-221-221.mail.qq.com (out203-205-221-221.mail.qq.com [203.205.221.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB022C2363;
	Thu, 30 Apr 2026 16:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777567043; cv=none; b=pDVNaB+w4lfTzNGx0uPQ9Jr8XEd1lkjUsp0XFIRQAsZB2hqKoy36IGkGZiqH6Dvwdei/pXK4LWFrgY/61YkSkNUa/F6WiLDEdZoQcHBbmab6KO/tBtA534+U2K0bsExZNF1vOmeaZd4zHvvXfjBEHmb8Na7EO2WAElqLV2sx578=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777567043; c=relaxed/simple;
	bh=irP7/FKFCBOmizr9F5jpBV82URmuiltN9ZlaMxmk0YQ=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=oU3ykDTDWfQOAnS8tKZ9XArJ2HgkKb5HnlVriUiISFifaEvNX44kzIOuKhiDIy/hRNGwoT3cdw4eFnJmtCIoxg917vVkKpWB0GHmcptS4gTsPLdYsP/kkQxSBShw35JyAJNSiXnQwv8DdAOkIzMwSjt7lp595IqLOWdejIZ1CLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=zDZgDVD4; arc=none smtp.client-ip=203.205.221.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="zDZgDVD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1777567028; bh=O4HypXIiBtRismgvopDyMPgbB2rAwcZk0JILJYfoClw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zDZgDVD4BGt1ee7GcDKajKLdBnj9Ul9Gdtcl2bVts65lVT2oiZohtd1GtFyw/l3Eh
	 UhYUWPd4OypTo6XQ07PaZSHgNaSBAe1It5OLeX0yv4Friltz0ktTdhDLMSQfsSsvXC
	 otxtuSICRYvFrvwvpxNi1/u385vIFvTRBev0iTy4=
Received: from hp-victus-16r0xxx ([42.48.251.129])
	by newxmesmtplogicsvrszb43-0.qq.com (NewEsmtp) with SMTP
	id 946100E2; Fri, 01 May 2026 00:37:06 +0800
X-QQ-mid: xmsmtpt1777567026t4cl0yv6r
Message-ID: <tencent_6AA70E451B0D40B766785B0909ADC12A7E05@qq.com>
X-QQ-XMAILINFO: MAeldf1AAoBW0Au5wUciAE30whlgHcC9XbNEZQSKPJeKOKMlhEDgJiwbAr59Bh
	 HG5ao4iMcFCy3stIOCkGfCD5nAZjv+kJdQZaNtUyRIvKPdO+4pqf0+mSWFBkjOjkBAtZOLKoBEWu
	 vxIhQOdhRGtJXALxDZAL9agKLVvLdGb6jOz/gplNJeImtzRO7sILr1egMBvxuQSktWMRk+JRiVMZ
	 9b5YNyVtlAAr5D4tbdD3u+ZeId24JhMpRrTYdv31sYVq9mdUSjt3pFNaINU8htSorGHI18xtXWbR
	 LsswmoK9dwiMFIHH+rgfjxDdhSIYekT3ssPpAw4gN9+p6dr+bfucJVhDF8nVJNLXSyZRkIci3r4s
	 xUlNH34x46LwCpsBkAV9XQc9m0Arl9P4ix8hrGtLZvmR6oDOn/vVamAB/HD+6NmYw/fXzRmIVCCA
	 wii6aneUSnjyen9wqzRzxi5ERfuhpYDYhEw+hR0r4K8RI9rO9dinfhG38dJ5RBxwPefi8hp5JAQS
	 qGcT5IEmwI4r7mX01Irj/eUwVNGqcK16lQ0ANQHsJgVuAzyOzfPDU2nSW+SeSl44yJNxaZae2Yix
	 Cu0saQ+YIAU+8PIhPbHkD8+iYkyd+Gyohmi4iOzetn8shCepQz0qX0Abja4IqOrio8IGQABA2mc+
	 RLxnj+0vCbdfKtCDm1tIDify6oJAYCOmQSTr7CC2WH7HdYSa+RgUCgIaySRqagi7WGbLQHdS8dZk
	 zdVKc9UaldlmUudO14cfWQMAfVdGWlVjXZTfJUoSUMwHenn0A6gwy/2v9db3wB/2SRcQsfbU3eEc
	 FaiNtB1qAjI7RSmhtfTx9M161KMENYKChp+mc8zgdkjYxJVOJy56Irv+RdCRyD8TzQVZl7KpyNJ8
	 pbgt53JH46e4WyPNqS9LCAQJopb6g6bydVJ2m5+sNx9Sk48bWrQK9JbO2yyeb91aYpE+oPhQOrJd
	 0icwqTty20Sy9xQZJY9nHMhx3D57milNoqEwnE7YOOUf53IPKFye6qKIUrxwTEVZj+CcbPP7RFXx
	 Gwckod333O/K63FB38WmPGSq9AA7uzk/uhmTFZyRuG+1ucaw8284t6+ypnY/NS/LTE8dWnsaDkfV
	 V/AliSa//R4hLqQaB9I3nCJRDCuaF/t28/3yRmRYpqX60IOZ8g3zbIRZVjLgdpJ/1uvtXTUqo3el
	 Nm2NolUrtWSgz0nw==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Haichen Feng <2806891994@qq.com>
To: ilpo.jarvinen@linux.intel.com
Cc: 2806891994@qq.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: hp-wmi: Add support for Victus 16-r0xxx (8BC2)
Date: Fri,  1 May 2026 00:37:03 +0800
X-OQ-MSGID: <20260430163703.623398-1-2806891994@qq.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <930ba4a0-91be-03b3-4f71-4f43ea334843@linux.intel.com>
References: <930ba4a0-91be-03b3-4f71-4f43ea334843@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for write wrong patch. It is my mistake. This patch move 8BC2 to the front of 8BCA.

Signed-off-by: Haichen Feng <2806891994@qq.com>
---
Change in v3:
 - Move 8BC2 to the front of 8BCA
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d1..a5cda787c 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -205,6 +205,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BBE") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = {DMI_MATCH(DMI_BOARD_NAME, "8BC2")},
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BCA") },
 		.driver_data = (void *)&omen_v1_thermal_params,
-- 
2.54.0

