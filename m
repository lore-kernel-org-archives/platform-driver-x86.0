Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E233DAC02
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Apr 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743210; cv=none; b=qWWssenGZkYNpTcelNNFzy+ZDP1v2tmr2EyrBOi/Kuq8Ts1/U63W988hyN+uqiM8BYxW6qC0CudWdiEVhrFTaf5TfHFFf2Z2IxPvskUiR1YR76exYllRyFSaJ9A+Y/6mwk02tinNx8i6D0uCLIS5c1OTZ3Wndz0dw5n+z0KPLyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743210; c=relaxed/simple;
	bh=SZcr7dFFx/HqG0JBLpYgsFWXkSiAbQ2w8LnHJcDf3+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZuGTrMSYP/9DRhpqwhcGpgyoV57hwV3zj6dGNoKZ5ka3/vzGhAMblBs58+xrLVfdWYXN2ik00tpayORUl452HpmhVoDfkgP3ufnUAut2eYzw+z3ch7fWD6AXqfAuzox9Uw1TtUSqP32ezpKev+oqFS930LwCjIDzI7uTM7tzzdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erBFKGmE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0m47IL2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erBFKGmE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K0m47IL2"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639ACJZY1727089
	for <platform-driver-x86@vger.kernel.org>; Thu, 9 Apr 2026 14:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r31whLi7CQ0J1EL5aLItfX5SVplnR48JHc5fhjXLdz8=; b=erBFKGmEWFstHqVH
	W+0mQ9qVcsShfVKoVuUM2/XIIDXjGEZGaq1wseDsDNhqYDAWOoYTspdcZGmakeMc
	p4/jOnQiCMvqBQroyjl2ackELhwpZm7sauHLFo0v6qnsUTBlD9ReWbRbCYODKQsD
	5uJ5sGG0MRBi6IUhFR5bzJ32zA4Ce/WCTE/REqjikMFIFNxi80j96QR3ewbRTpky
	QGtLHuMyY/A6e/UFu5LtLZqH0WVrP7M9GMjRkQhT7XIdscqPGmUgSMBrv2jsO0Zf
	yuMUfyM9C3sn5jUXgrwThkfy+PHQbnXwM4Rdmz4eRnjAxG8uGfWthAs7lph6DAGt
	XPMYIA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcrumhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 09 Apr 2026 14:00:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8ed08aa4so4639991cf.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Apr 2026 07:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775743200; x=1776348000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r31whLi7CQ0J1EL5aLItfX5SVplnR48JHc5fhjXLdz8=;
        b=K0m47IL2ETGQ1CQtSDwgo/ARu7y10FzVOQfiyxKUjiUhreIM0tBKUrN4xXJ25KkJvy
         GxXh4oUXd08pZ1dLVXL91yhi7q/7jNXrkBy/L9aA9PIsh37kkuNk7RW7YRZOBfuBN4Z/
         ahhCsCAlRnwEdP7k3o4IDM1O1SA7UFPsGwumkNXYuIps3v8CGKhKLectiZP5h0ssV2X4
         v0qInsngvIn1yErc+RIZkUdUQyomz+LBuZo2m+XjRrYafY8GOHChYnfU6VgfwYRFmYEn
         ULkTyIaRgVHtl8OVnhlTezYlcydF5a/hoDiv1StIokx217xx8QCSpCZagWbV6SV8yPcI
         j6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775743200; x=1776348000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r31whLi7CQ0J1EL5aLItfX5SVplnR48JHc5fhjXLdz8=;
        b=SZ6DpdjpjDza3P0CMsxeO7HvwOMAp+RJDaJ9oRNvXCzwPo91u0TXRchN4KxMZVra+K
         o7mQMR4P1itKLpgtdRy4YrsRL9bqm/X3Zfq/NtJRsZXHgqiGfiK5+4/drJKfiqRrczwt
         cNMwAShJDkuKg30TQZz1bpKeQxGFX2jv8il16GUGFunJ7vaVHZbBLsHIZHnKkWR5yPzP
         Xmivt5iWa7AYC/Z9OUr9Eewm+FD95qPEqzvzoDpHFKWRoMIQV1IzNX3yzUWxYuIV8kSr
         bJy1eIgvS4hzYpFT6aTLWm8uuTnVlNfqqjtrHuoZci88V9HSQHhNYFLF3cMwQ3xny1rQ
         WeZg==
X-Forwarded-Encrypted: i=1; AJvYcCWGWqhIi1wmP8UfOqcPcTdlg6nsyRB7G2oT6J9sf0JZ8vGz7q36XUCTjb6q6dx0SblPMgY2WnU1Ar8ZHrX4AV1zoLFC@vger.kernel.org
X-Gm-Message-State: AOJu0YyOTu6pSlV/+/4ki7ZbisoDipmOE6qJhE2LaOJ5XSp4d/2PUAYb
	lK5iZaxhmsaVha/8yQA50F1Id1AnyRiTlHotoepNF4oJgQV4bliS/EJnqFdNPpZGCWzawywVZRi
	OdNr0g/PEyTVV5h2KMyXmM+1TNBGS/yzFalJ8E+339oaCtctdHDRT3xKlWs0rLG3YEERX3R6s3s
	uY
X-Gm-Gg: AeBDietaVLfZ2O+YwDxcc6tlHoXxeiw6vKA+RYzyV/D17oOtORblPSxUjOTT82fO8em
	y7AgskWlZfUfdV/Zg7Ewm+HrY6UsZWeCqI7XHdgb7HQiRuiH9ejW8QwvMBoLw8hRgc42MTUmd7d
	VftirOBGxGl42zIjX31GdU1XZh2HjUtOpGc1zs4L6tRnDKrwf+7tAf2qtmGX8OYflDyHXPU34fg
	VS0c1JwiQlt6hyTvz/jAnT7dcmhQRtwGXyeI142aHPoFfxRwBz6uaeCXFcDEk6foLr8SNie/YfL
	Utyyuq0t91+QSUNYI0uzmnPtzJDqMVm9RirzHAejPuRb1jDmTMUyXvqfoMMEnVX9VOYlhJ3Wavc
	Xkk4HkXecSGlLx8Xxsuw01elIeOK0tblhP+/UHYemMv22TxPClA==
X-Received: by 2002:a05:622a:558b:b0:509:3098:819a with SMTP id d75a77b69052e-50dc22dd2a7mr55274331cf.44.1775743200015;
        Thu, 09 Apr 2026 07:00:00 -0700 (PDT)
X-Received: by 2002:a05:622a:558b:b0:509:3098:819a with SMTP id d75a77b69052e-50dc22dd2a7mr55273731cf.44.1775743199450;
        Thu, 09 Apr 2026 06:59:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2346:762:14f4:8b01])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3ba180ffsm117373666b.35.2026.04.09.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:59:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org
Subject: Re: (subset) [PATCH v4 0/2] driver core: make references to unregistered software nodes a special case
Date: Thu,  9 Apr 2026 15:59:55 +0200
Message-ID: <177574318973.111981.5466026181315933610.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyNyBTYWx0ZWRfX6d612O6K3nba
 qliz8wEQG33BAkVdLKWK70gPU+gaYlfBtSPgNcRDvsIO22jIEeIvjjtAdxjN5HbDbvltJfQiD05
 Ke80OJTvShsHxHxZYhgghE7EPnvDrFRyMFK2f/lS1nD6KTD6iBp5lg4GI/QwOswqnfrF9Eie+YG
 R+oM1LUQb59JurdQ/DJ1y1cggr3TePDGhVZEg/enO/FkD//QCujBXiFaNpuNzYzH81IswDwMdQA
 fmACtiDfAkZ2DXAAuxZhTwBaWd9WqX5oyUTkuM3o1Pmw/BieHk/5pKjyLlxU/hXMI71iIaF8zpX
 Cl34RNzTJw5EADbTup+bleNdunLhJo4zRDlHzvH1Uia1U2vJiLydHGOP9Are6s+qEofbUGSSaKz
 YpIskQ6FFO1PYn0kVtwFhOi2lyw2BEhikB1MLXvySJNFArmBOc4SdrdHwaRXvcd7L9Wju6fmb2y
 BhMJ9trvpM7ugcs5Olg==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d7b0e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-2faNgSI12pgEayDPOwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NQJjVFH4CgBYh6KdjujdY5ztfz4UuJw9
X-Proofpoint-ORIG-GUID: NQJjVFH4CgBYh6KdjujdY5ztfz4UuJw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090127


On Tue, 07 Apr 2026 15:27:56 +0200, Bartosz Golaszewski wrote:
> I spun this out of the bigger series (see: link to v2) in hopes that we
> can get it in for v7.1 and make follow-up development easier next cycle.
> 
> This series proposes to make unregistered software nodes (ones that have
> an address but which have not been passed to software_node_register()
> yet) a special case with its dedicated error number. This will allow
> subsystems to defer probe as if it was a firmware node not backed by
> a device yet.
> 
> [...]

Applied, thanks!

[2/2] gpio: swnode: defer probe on references to unregistered software nodes
      https://git.kernel.org/brgl/c/ca13ab654064fee86d6e7c9e87d0af7789561509

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
