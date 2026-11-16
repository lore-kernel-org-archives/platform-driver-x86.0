Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862934;
	b=5fpjYBUueQ0mhM6MAp4qiq7nmqdSOOC9wjoPByISwSCrVpuoXGrslXkTSEAkBkOez8ci
	 yftZ1nM2lycd7QQcQVJc3sBQkr7/+Nw9JnmbSRu5+SNIfQcJS4qg9BOKqthjCDSHg8KuX
	 C5qqfsrTwWGWrH/n6yP+AJYjP2v8jribABAezY6xzxfv03t0rygJnDLyjp1mbGFBMXix9
	 YIAPrXjMKVB8cj+4AzRk2876gJfaPx3oOTZ6UYQRfQ+BSd5wY6wnuPSaMrcA6V5c0Y8Rt
	 pT8Of0F8BgreJ0iv8b//kxGnB8/ckGHly5p6CQy7jgxgaYouawIMG+8wan51xeZp81Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862934;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ihNaY8Q7sdIpTVvIZdqpJQt3++msVklRZp7QGqeejRI=;
	b=Clse/+OvMk3xNKD8DrIDw5iQdGRljb3SEg/A1xgHHu4MlnlazZukpWPRvCLF6QobxiaF
	 5Ray50dz3NFG/qwcfeW7cVnWQrOoBknNL0ZEkM3Dfr+cZw8JvxQOB9TcsoHA7pBnpQYEE
	 JH1BitqqB7RWM7R9amYluMS27cPqRpcjlLQBjvkO4so38m6NDt6Y2rQ4RH0RpFO/Kq9jv
	 fo25TTc9NetnY5WbHDlm/3CufaRHrEmXMYPWggOJvKSfd8fcb7RZm+Ye18nBefoZB/kIG
	 PTsvTRz7zO4EjJj+PjEYHfKf8fNWuSjqzAtrbBopLytBJ/soJxSJOrw2jIWPKsFKR0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H7eFeyDA;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BEF606A323;
	Mon, 16 Nov 2026 21:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32BEF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H7eFeyDA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794862933; x=1826398933;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wPpgSBDHLuIRbE2QOg1mvojqlhNr2HkWFRLK5DG7dxg=;
  b=H7eFeyDA0QJr6vGC/hEjKxYAeCnAklVbL3zu/uiO4DDMeQcZb23h4qWs
   NZEQHggQiQQ8hHbWh7iFvd+nl7ZGz93AE1OIXEgf4AEuoD5imDQLLgyNK
   /AuJJry0wwE8LaMxK1jxQ+yW+f7UoKEk9EJCOdypUh9Ij3hRgfPKN1eOM
   Sgiwgjl4h085beZ+zo3nLCI6khJoNR2o2JNfNbgi1lKHsQTbKLnfptcWv
   4a5jf+zvCMpxANFNR2cqWWkOfXrxJcAUoV1rfvt6/kqARDvAy18Yb2/8D
   srKqT8z8dxTTB9gnbogQjMSzdySKdIm/MW0UBU1KWVh7ab4oPGx85AffE
   w==;
X-CSE-ConnectionGUID: LZgIocFZR0qD8uF2RENwRw==
X-CSE-MsgGUID: accG1GmGTn2xrK9omsRzYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3507620"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3507620"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:02:12 -0800
X-CSE-ConnectionGUID: llPKizJ4QO++JSs14a/w6A==
X-CSE-MsgGUID: wsAsBFHdR0CNmvzP4ZnJAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9775766"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:02:12 -0800
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Piotr Kubaj <piotr.kubaj@intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] platform/x86: ISST: Propagate def_ioctl errors to user space
Date: Mon, 16 Nov 2026 13:02:09 -0800
Message-ID: <20261116210209.3737388-1-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

isst_if_def_ioctl() declares an inner "int ret" that shadows the outer
"long ret". When the TPMI def_ioctl callback fails, its error is lost
and user space always sees -ENOTTY.

Remove the inner variable. Return the callback result unless it is
-ENOTTY.

Fixes: 33c16dc1a2d1 ("platform/x86: ISST: Add IOCTL default callback")
Reported-by: Piotr Kubaj <piotr.kubaj@intel.com>
Co-developed-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 .../platform/x86/intel/speed_select_if/isst_if_common.c   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index 4c04f0bc9b47..fecb908bc88c 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -614,12 +614,12 @@ static long isst_if_def_ioctl(struct file *file, unsigned int cmd,
 	default:
 		for (i = 0; i < ISST_IF_DEV_MAX; ++i) {
 			struct isst_if_cmd_cb *cb = &punit_callbacks[i];
-			int ret;
 
 			if (cb->def_ioctl) {
-				ret = cb->def_ioctl(file, cmd, arg);
-				if (!ret)
-					return ret;
+				long def_ret = cb->def_ioctl(file, cmd, arg);
+
+				if (def_ret != -ENOTTY)
+					return def_ret;
 			}
 		}
 		break;
-- 
2.43.0

