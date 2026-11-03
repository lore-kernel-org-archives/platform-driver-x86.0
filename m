Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706143;
	b=Qk3KwJJkfhRMPzXcIP+ONImsySoJhL7OmTuPER08BDp3QQwAHaOAy7MnXa7vcKRAnruB
	 Qs66gH5UQYhFiEA+P8WsZXHzr5bpgTP5e6nm6WyZJ7fHwbr/KIftFyAFVLtFDzB/waxDo
	 LCxDst02uQLUIooIVkBJoMTu4M24uLVx6h17Mg15GdrImI11B9op+tH3MU4BL83a46c3c
	 lCYZjOu5wRHGhFBzuQy6tlofKyxev0ha8SWZOY0g0TdueXL0U9Rk8LjveA2PY7v8Z6Tze
	 Gq0qnSOSAgXbqmWGig+0UIkTRMnAvsXylcVOcyOcmjPE6NP7eHel/6LEwrQmliRYkRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706143;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=qfAmY9hWFtYQHe/RDXXqSbSUcJzO7rpkAw0Yqq9vD9E=;
	b=sXOX2Ry7zzHNh+QAqoU2EdzvyAL7UaWAhA83vr2VFBFv/MyHs/aiDBTFcUOvvEFFFm0c
	 DkDpimtr+JAmC4/YEiSop5jDCwMU67ztD2v+g6rWJBzceCEkyfbHIea5J0KwerBADkPuo
	 YJQ+ZfGrd6gykrj9NaXQGF8/xbDw4TkLOIXRMAbrZ23IlYQTeO3TZUGwQ3bHLOZ4vBOtf
	 GpiL6fZB+QpsZcR+RoS80OYdZL5ecTBfZsiTQ5MwGd/n6+pCOXgNBwrnKmQmMbmkfdw4V
	 8v+KX0vgbJg4FpaWvCV7YewB8FM9xZb1CqpVh3T7tdzkKPD9H9rsa/5xlFaYkbajFDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smail.nju.edu.cn;
	spf=pass smtp.mailfrom=smail.nju.edu.cn;
	dkim=pass header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=IVYwE3N8;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66D2606EE85;
	Tue,  3 Nov 2026 11:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66D2606EE85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=IVYwE3N8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1793706118;
	bh=qfAmY9hWFtYQHe/RDXXqSbSUcJzO7rpkAw0Yqq9vD9E=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=IVYwE3N8dNNV/+0g/fRWCXP+zmDEXP9yVT80dwOpQkdTFolFRXMkppT93KI5pzdDn
	 bj0lycJ21sBgNJaj4mmlMN9U0ya0iXifqUx/R8EJAqqF7ZT0DMX+fx8p6+erHtJ0a3
	 6fq/K1OoBOBQukBmzroNapkS2qHipz16y27wbaoU=
X-QQ-mid: zesmtpip2t1793706113tdbb4ca86
X-QQ-Originating-IP: 9QHR6nocLiZKsYRyeQM8ZTgIlFjYpSQ+DJtpHCAV5gA=
Received: from workstation-Precision-7920-Towe ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 19:41:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18426690713893391119
From: Kang Chen <k.chen@smail.nju.edu.cn>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Patil Rajesh Reddy <Patil.Reddy@amd.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmf: check slider data reads
Date: Tue,  3 Nov 2026 19:41:52 +0800
Message-Id: <20261103114152.76115-1-k.chen@smail.nju.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:smail.nju.edu.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OezpMYl8oadHvgBMUhX/qVo92eVS1pY/QAcc8U8+uRM8CrAeSSBZ04JE
	j5xDQsD0nP6DL3m1+NahmDG927xLIYD6CwYjVOvGmNSUJAFT9CjnqNc6h0t5rQOzTf/KgKn
	0tlvugUuUPNzFcWgRSf3F/9hJgytttjD0u532SezCUbkKYI0nUn0GMbrYT6gyOtUXYKx11t
	jcEkOX0UALlTRb7mrzZiFAcwufk0YCdzosqefltFyg7HXimtBx4GIfLuDeROUOb5zI2TtpE
	lhBtPJ5BvbPyZnS1wrJagL5gzsuUa1vBZwUq2qwYTWI5zPd3RHK0lMppZ7kB9uys5cwmAF+
	CTP2hz9ivjl+LQ4s9kFnX9VacDceXeLuBFZeEEelRn+TFksQWa1MxoqKXC+gUkujisDoCzx
	b65vyAVogZFKxdnd9mEVBFNhWw4wf4BWRDj/PiywCClU/EPEKT9fhIHXZ2Z1w0JGEqfLfXF
	SKa/ZH78v4ec2QK61kDTNYluBWkNTx0jXkqoFDh+1EfeZV7/bAxwA1FoYlgimmr48w9vtfr
	eh/8+mXXoKgZot1/rSSQaYo6BxYl1CsOAb4pHg3o034NXAh8rhM3DQksDT0mjYRqKHknKnb
	FWHQQ7UTzLr4Wf2TDmxyc9C0s08gAha2LTHcfPo4eteUSP5P/WfBIM+LjC5NptVSpMghS5i
	9UuymJL2CYFvXEQ/fC2pNt0IPRto1a1+KjwDQQDtFhoyyAKH9T36kjDjMjTQUeU9qmUorZE
	sDe8r6gsf9elqQ8vMKxdLy/GjLLAHCL2aiTnyAm4W65Q6RHwC3tryn1RQbg025ukBC87QX8
	fGiwaGmZwZz+uR+nkACkIxCyO3qyH1oV+ktoYmBKXNSTfup/rZ0lSq7QzhSuCuxreH9vcuG
	YA7Hb216wPem0qrZb/UiEKVXPNexT66X1EGDeWZ1qZJKx7coLPKKjbMO236S0J4RHOH4Yd+
	XNQSzHB5e5MSB5X8UiYjW1FCgpnlM4H6kboGeDhotshGYBTsJquc2rwuxg1UG5WgX5eos1o
	aowwnuoNeGIxrzYuyCwjOww368PunigSk5wKycSLr/NWtrEmZX1iWDu9YLcdw=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

amd_pmf_load_apts_defaults_sps_v2() ignores the return value of
apts_get_static_slider_granular_v2() and copies fields from an
uninitialized stack buffer when the APTS call fails.
amd_pmf_load_defaults_sps_v2() has the same problem with
apmf_get_static_slider_granular_v2(), and
amd_pmf_load_defaults_sps() has it with
apmf_get_static_slider_granular() on the v1 interface.  The APTS and
SPS buffers come from firmware, and the helpers are allowed to reject
malformed buffers, so a failure would copy uninitialized stack data
into the cached defaults.

Skip failed APTS entries, as the destination is zeroed before the loop,
and leave the SPS defaults zeroed when the read fails on both
interfaces.

Fixes: 3eecb434d7f2 ("platform/x86/amd/pmf: Add support to get sps default APTS index values")
Fixes: 48d38f569261 ("platform/x86/amd/pmf: Add support to get APTS index numbers for static slider")
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
---
 drivers/platform/x86/amd/pmf/sps.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
index b0031afae33b..fffd24ca589b 100644
--- a/drivers/platform/x86/amd/pmf/sps.c
+++ b/drivers/platform/x86/amd/pmf/sps.c
@@ -132,7 +132,9 @@ static void amd_pmf_load_apts_defaults_sps_v2(struct amd_pmf_dev *pdev)
 	ps = apts_config_store.val;
 
 	for (i = 0; i < APTS_MAX_STATES; i++) {
-		apts_get_static_slider_granular_v2(pdev, &output, i);
+		if (apts_get_static_slider_granular_v2(pdev, &output, i))
+			continue;
+
 		ps[i].table_version = output.val.table_version;
 		ps[i].fan_table_idx = output.val.fan_table_idx;
 		ps[i].pmf_ppt = output.val.pmf_ppt;
@@ -151,7 +153,8 @@ static void amd_pmf_load_defaults_sps_v2(struct amd_pmf_dev *dev)
 	unsigned int i, j;
 
 	memset(&config_store_v2, 0, sizeof(config_store_v2));
-	apmf_get_static_slider_granular_v2(dev, &output);
+	if (apmf_get_static_slider_granular_v2(dev, &output))
+		return;
 
 	config_store_v2.size = output.size;
 
@@ -169,7 +172,8 @@ static void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
 	int i, j, idx = 0;
 
 	memset(&config_store, 0, sizeof(config_store));
-	apmf_get_static_slider_granular(dev, &output);
+	if (apmf_get_static_slider_granular(dev, &output))
+		return;
 
 	for (i = 0; i < POWER_SOURCE_MAX; i++) {
 		for (j = 0; j < POWER_MODE_MAX; j++) {
-- 
2.34.1

