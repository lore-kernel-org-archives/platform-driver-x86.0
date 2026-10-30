Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348654;
	b=EourCdQLOW6AFss6Nqd6VpneS9cUbfXi4ynKTcmZZ1vIZ9uTezCnIo8yKUQ+/c0An5vt
	 556LHB4fWVT0eAsMiQhI6F8nF5W1xJUcwV+yxpuNv4PGwnrj9L9SMdtSMjYf+jHVoNBnj
	 HCN3QqLADobEiL2TJX53WT7DPyhJcQDGJqZiP3HyBRIlp3oP+18MlQ3XQ4h+7o9n+FTBU
	 TNaHPZv8q+GFdJ1/90ty8q71MSZcLNwuRgPaSCT1pSPPp9HMDDpctnWvyHPQ9p+elHX00
	 4JCLzMjqZHnfwurW/Nbiyiy4VQoO/qvE75t/SUJlul2XbocqpBq+HUIkKaXREDbZ4Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3Eomz1+Wbpaf2im+RAxB6LnI3cINy1wmsYIQIhmX9l4=;
	b=AGOgNlcrBIn9bo2HNzzcCZNpaNZAzd83GYmg3HMijGGzrsDqHmZurFRG7yB1BxSbngzo
	 5FVkJ049XjLLlHH6ldg3nevBdN3nSZIJY6Qbc4vLxUzFci9PYgr7EeTVep8+fVm4qrVbm
	 osFWQPFGqpAlW57UWnePXwivWTMl0QxBYyLv+8V3+jgxKlZkzydXRZHriGfCuvB2IDejs
	 2ftl3oEr1coExYERSUjmN0ZVwl6CjBTqd/jrCUEkhMEejmKXJCF+5IrICwMPMbV+79vKS
	 /VwDNRWPOriDlTSBo7Jm4U0rEmztTbOHs1Kaq+t5Zun4KDp4Cnf+WLTiB3j1VGEj1bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLHN4GK8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053B3606A322
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 08:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 053B3606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gLHN4GK8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-369f33df08eso977239eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348653; x=1793953453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Eomz1+Wbpaf2im+RAxB6LnI3cINy1wmsYIQIhmX9l4=;
        b=gLHN4GK8lCzlYxDpyxRbKCa+pJVlsdal2yg1k9wCGlcmXoKQTAI8UoGGxHaWuSAdb/
         Uf9N7lDPlg900GL4AjwV6EZDcIvr3IItI6NiTA+pfM81SwDmB9Glhs7rppC0lbYbmL7l
         hhWBXGGgVrFpnKs3JTPt0AVWdHwTvg83tFTJWCmQ5RDAhVJGNaVCkfbOyDvBReXxqm8w
         cvbF/VQN7wrC64gLxjMDC/VQZW6W/lRVUzdCUM78eaR5huUxMYfN1iTgyQZnF7jTVlp3
         v78/uPBDcLFN8gSrBpFstai8V5TgS0h03B4tsb6Gmln7j7cD4RC/ntr6eRX5szQqF6bL
         WYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348653; x=1793953453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Eomz1+Wbpaf2im+RAxB6LnI3cINy1wmsYIQIhmX9l4=;
        b=SDUozodREmOQt8qsAgaFJmPJkXJ6skwplPKP/tNWvyiY00FPhROevjOx8I+aL+N0Z9
         TL7WUGqkpaUB1WR4dPaHUT/RJQFnnNASl1k7DkXoJMvMPDHOhdAhFiYFPllVo0aJHVub
         f1yMkPlW3fnbJ41lhRtbt0c+T6KQUZo7tsK735w4XBNE7oGW9zCpb97ppl6Q24lEy1hN
         B7F28p4wjnJFLIoZa7mOUIia23T2+3tZ4VRxeCnu/hxq+LpFdAJ3w+7bSA3wrI04aYwq
         eA1jOmRrY2kYnEeKvXCIcw5iowWVtRgs/dwl0cBvX7XT/AKAvZtloZi7yD8qklTj/TEL
         EOcQ==
X-Gm-Message-State: AFq9FYL4qi+ORhZcZM4IAZvkCSWSAHVCBrbOFNcpWF1XmAsztOgNeAUy
	jQ4dBucBkIzkxStJe46qQmqkLPYfGFTAO3kNk7FYYJ26sg/f6TKaUVyt
X-Gm-Gg: AYBFou1h0PlzIIDFI+Yw/dr3ANIu/kDEmJJCL01MqP5KgUNKfgOhFRKe9QU4n5puNlF
	tBBRq+SenzPmjjyBSS+7rS3fuXWorL4eIQbjDCqnmP0nKletvzlhXfDnKJQZDIt/cN3CNcVIe/N
	8lblLO75/OSsojqNyVZMyuOnT30nxaTsT5n8UiUl+LR+uFWCq7MvyXLSnLSEnOO2EoTPURlD7GD
	JZvUHUQD61MRosFWrqziijD6N/X6bMaDGL20sWbuqgFOAeboU7IKX4zZpxMCpAmK8xN8f69gM/C
	IyeAvHsWyPTxWcQVIvPQI2e30SayeyUMo+PhM1H0V7iYbmK9wVQ1lNhGo1HCWQwwcftZGVhC1QF
	1yvP6T7w6ul8FrGri0lMvgUH2+sNrtiArMwnFydwA0vOwa6sNMSW6n5OmOMkW0zy8HwdhAvf3Rf
	Qa7O6ulS+ZaQsxu+5y0grzDEdVPsw1T+FC0KNTX9Dk34BA7rVZiiBYd313Ryot/5BVZPhbgU/Hj
	ho7YOLRbXlHIxBPerS+0hnti1+YxIBq0+bg6ieeWb1bEcb0p1Chx5uOJ2/VXYrx1dkho1v9wsOU
	MS2KJP60k/Qvx5lPcTrr1xLPvuXG+goc3DpcB4NmmZ22g4i/lfbi/Rz3+6KqrxLyYg==
X-Received: by 2002:a05:693c:87c9:10b0:360:e2e6:f849 with SMTP id 5a478bee46e88-36a4241985bmr2650980eec.28.1793348652996;
        Fri, 30 Oct 2026 01:24:12 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:24:12 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 6/8] platform/x86: ishtp_eclite: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:53:00 +0530
Message-ID: <20261030082303.284271-7-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex is
automatically destroyed on driver removal via devres.  The driver was
missing a mutex_destroy() call on the teardown path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/ishtp_eclite.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/ishtp_eclite.c b/drivers/platform/x86/intel/ishtp_eclite.c
index bca7e217878b..d7b10ceeb52c 100644
--- a/drivers/platform/x86/intel/ishtp_eclite.c
+++ b/drivers/platform/x86/intel/ishtp_eclite.c
@@ -585,7 +585,9 @@ static int ecl_ishtp_cl_probe(struct ishtp_cl_device *cl_device)
 	dev_dbg(cl_data_to_dev(opr_dev), "eclite-ishtp client initialised\n");
 
 	opr_dev->ish_link_ready = true;
-	mutex_init(&opr_dev->lock);
+	rv = devm_mutex_init(ishtp_device(cl_device), &opr_dev->lock);
+	if (rv)
+		goto err_exit;
 
 	rv = acpi_find_eclite_device(opr_dev);
 	if (rv) {
-- 
2.43.0

