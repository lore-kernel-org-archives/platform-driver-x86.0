Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706121;
	b=Ii8JSZltjMVk8jF6hPw+r7M5qSylo3eldhXmAgzKoP4ftGTeP0ss+vVl+HcelQ7ReRAA
	 /mE0O79USfJFcauBGRlri/klD6k4iy5BwnvMuhlPDQ0AEzBt2jlCrpSXubdci++vM32Y7
	 dGI+jJF0RdquFTFJ5phQprY0dLOeGf0GarsT+rBn3dCTrllk+ifhg6JbTx505I7iDCpb1
	 H+iyKkOSS8GguHBquDVapB6DzYe6xNWfi60gj43eIPZN1Xkov/Bal/cHsGIJ3ypQ7hrhA
	 I6+AbSEZVyUZN4ebHG8r52AQ+oGpxtMM4oQM6v+gDfSxlmXfLAi+tm8Ujw0Yiy9dYaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706121;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:
	 Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8tYgI7U7JYmedYpkIdtnauPshatRkrQpdi/rpjwbkyM=;
	b=FMeJb+86PVyQF3NboVbmDip3PhB1aEJAY42vqqcy9mYag28VDCwa9j4SH4tWKnLV/u7X
	 61xX1pQeqaEf/1DeAzodLt15+uIZwgNXJLFo/gsg07jc6O+ZpeWJJMSsAmuYPTBfepGew
	 v5KdB7peizdUil4rx0k0ol+bxxIft6VUhtkRZ/f523/wSj1TCzuMj/adiZ9XbDXP5fM//
	 IEskTOXSj236v9Pz1in+xA/VmZ+UU2aDhRtFG8Gz7gdIhE74wjID7sWEI7LRZJJmTkENK
	 du+YUniWsditppz3SFrAOiQGrRhI5QKfp7UDmDfp5G1EDIQXf0RIbpZKuLaqglKgxjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smail.nju.edu.cn;
	spf=pass smtp.mailfrom=smail.nju.edu.cn;
	dkim=pass header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=mg+eudsw;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0929B6083617;
	Tue,  3 Nov 2026 11:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0929B6083617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smail.nju.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=smail.nju.edu.cn header.i=@smail.nju.edu.cn header.a=rsa-sha256 header.s=iohv2404 header.b=mg+eudsw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smail.nju.edu.cn;
	s=iohv2404; t=1793706091;
	bh=8tYgI7U7JYmedYpkIdtnauPshatRkrQpdi/rpjwbkyM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mg+eudsw9OV0O8fS4/fIA1eJhvLo0uRBwOvhIRXSbfft7pG7D4j/YTf0N9acqUqzz
	 Qx7tWLBqoVSDsh7BTijYf67OK33THWd3gKaCvx1CMzmPj07LEL1ddtg7Dad4gMnNmt
	 xW8hICEfLvTuDjvD56cVusZvuNYaDzLCmEQSVRnc=
X-QQ-mid: zesmtpip2t1793706086t1bb2953e
X-QQ-Originating-IP: D/AEZKMn2kJtUBFbU+hsHR+WHo//mWfb/3lQpT54PQw=
Received: from workstation-Precision-7920-Towe ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 03 Nov 2026 19:41:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6292213750309205283
From: Kang Chen <k.chen@smail.nju.edu.cn>
To: Jeremy Soller <jeremy@system76.com>
Cc: System76 Product Development <productdev@system76.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Tim Crawford <tcrawford@system76.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: system76: fix off-by-one in system76_name()
Date: Tue,  3 Nov 2026 19:41:24 +0800
Message-Id: <20261103114124.75032-1-k.chen@smail.nju.edu.cn>
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
X-QQ-XMAILINFO: MgQY1K25Ph0m4vdwcr0y+9/51aOErcfWj/LqYObz1ZVmUj70ayDbQQaw
	uLtxwH2JduZ9TEdWYQe4KFZPLfjxZg1ICs1/pUhLEBnjw2FxQhZudiPL7h5irw5+YsEuuH1
	TIyXHDhgIW+bk5A9yQxL5Z1qlBC1oXleXeKNHzzZsmazZ4nd1/n5bt18tKe5Z1IR1rQxfjG
	Xy7rXziSwE4yio/a137k6BlOZoVvU+CaoRVvoIuogke2cinl1hR1YS0tXjDo3+ZjwV72wWi
	snDFo5XRxFcyJAmgTkrABGq8FS00t/gFf05iqVC0CUFavPiDaa0JVa5phix7FvtEVh8tjPq
	tNcHgbD/qhk3KIXENuOEekhMYrsTjI067GBjjscS35+G4iOGADhkzsM256jneaUje3sqO3J
	ZQ2GnjfG9/bq07xpO6XwGN46iwwLafXQtve7JiEnKwn+Ogs57gwFONuKnv5TRPuBDCFs3C0
	FFAC2iZ+wt6r4M5ypHntCHMyIbmKcAQCSXX1QGlvZX1tB1wb82Z0x7DGHaFsTK3igoJRWxF
	E93Yb9j3qcXgBUoC83egq/ZFi7QQwqUpRXhPZNpLh/9z+ZNApAHbE58TiUx+nK/YmGAoyKO
	rHIs16THHtgSnYpro7TuFSgqaE4WfsKaD98EObAUs0yt6TtIeQ8NGuxW/RVJx+l3ntEgQ0Z
	4XvfX7810DWFzBZQQSsp8htbK0DU2C8Zu+1ALSA0BE5ebXFexBGhy54qn5b1i1Gl0jvacee
	19G6yXBWtgVtUKFvurMAf5ZHEIfUEvni5Fsv6QU926j2fpF6wOcYitlDYYrMgW5tg/KrUsI
	zi1kxerv7b42MamvUzfvgLtSxrkUSlDqgHWTrd6uw7joc3IqnlB9vBPSfM5Ce1gw2w/siuq
	oVr6uUf3P9M95AB/k+BUKp4IfAQ6kK7VQ6kVSbOvh6fKxXGzTz0F8y7Bslehs8idz2UFmjy
	+4t0Bxvcl86uHkGaAtyYvjWLF8LkvdY/sHIo+cgQgwbkxk68o5L3EmnvZDDk1OrraaDJKtJ
	Dt0HnQoZTV4lR3B1l8c30BfEM7K3A=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

system76_name() accepts index == obj->package.count and reads
elements[index], one element past the end of the package.  If the
adjacent memory happens to look like an ACPI string object, the driver
returns a wild pointer that is printed with %s through the hwmon
interface; otherwise it reads out of bounds.

Use a strict upper bound and reject negative indexes as well.

Fixes: 95563d45b5da ("platform/x86: system76_acpi: Report temperature and fan speed")
Signed-off-by: Kang Chen <k.chen@smail.nju.edu.cn>
---
 drivers/platform/x86/system76_acpi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index dd7b1b07c316..4cd6a7f45a8c 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -128,7 +128,8 @@ static int system76_get_object(struct system76_data *data, char *method, union a
 // Get a name from a System76 ACPI device object
 static char *system76_name(union acpi_object *obj, int index)
 {
-	if (obj && obj->type == ACPI_TYPE_PACKAGE && index <= obj->package.count) {
+	if (obj && obj->type == ACPI_TYPE_PACKAGE &&
+	    index >= 0 && index < obj->package.count) {
 		if (obj->package.elements[index].type == ACPI_TYPE_STRING)
 			return obj->package.elements[index].string.pointer;
 	}
-- 
2.34.1

