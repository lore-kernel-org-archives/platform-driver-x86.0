Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155574;
	b=zIR9It/z3Rq6JUWWrBe9j2GirJoYCMi/8LsmifAoTMJrTai72nx8Ex0NlqEQlEKsMm6T
	 Lpmd8bwLvPLLG9J8gx4wVDTiRGp35INFNVsO89SdyUs/9XroT5Gzt1An2d66KGFteBOXh
	 /U8VCq9Z0UrPnGBOMwFS3XL1ykH7JhbTA7hjNZXCjrBqPdeXWDpZ5/WhkRQTSK/rYVqhr
	 dSc1bCp4fP562phZgpXSlBegI54hO9N4JQeqxpo+zMpHe32Fny2Y/hDU7babnlzM9243c
	 yBQPDolS1VTafOtWEGMVTf/45frp2UUaF8rA6vt5lNOSiwOW9nztRXNY4WayU9asyrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155574;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uV/KI5F6xsEv55mt6+QsO3UqSg499egnSZIDp22G8xA=;
	b=l2Jojsy/BcYvdcG3NeFNbw3BPRGjrK4jtQ/grX1fiCZkgHqIqy6YJu1XFNAZeToFMaaN
	 jnbITvsfKrFgwOs0EciV7BCkF4z25UsYoxc/EGYra1gwen3kiIq43jOeVFYuocG0xo3Ed
	 UY/9kh+tkU/nSDp8D3rWiqQ7Y/VAYxCj3q3nv6an7wk2v4/Ihy31QmCYPa1A/sTxF6XyJ
	 l3keK6zRuxxZY72qGcYKogIC5+an8NLSa9GuQy4rAk4Bfsvz5/b/MjlmJcO2CRmYIlZp9
	 gC+e3vFnsbmobYuIV1GlooYFf8PcTm5QZaEceJSkoS+MDoaDY7T88K3whyWGWfuFiRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Y7qykj2p;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED84606A500;
	Fri, 20 Nov 2026 06:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BED84606A500
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Y7qykj2p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Y7qykj2phD3G7vYtYv7eNWoyRBjltJEe+jt2EXANTbFE3rDG+J0J8EsK++p2Iaz5RFUrmos2TjmOV
	 XXDC0ujwnqTLGTOzoEdWAPy1z0s4+OtSYQwkV10pg9hbgBknewxhPm9MiYHbKirtHefoQFsSXXPFuI
	 GRjXxmUWRH+IR66c=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96affe670b3f-2a57d;
	Fri, 20 Nov 2026 14:19:28 +0800 (CST)
X-RM-TRANSID:2ee96affe670b3f-2a57d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16affe66f4df-1837c;
	Fri, 20 Nov 2026 14:19:28 +0800 (CST)
X-RM-TRANSID:2ee16affe66f4df-1837c
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: platform-driver-x86@vger.kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] tools/wmi: Check the Dell SMBIOS buffer size read
Date: Fri, 20 Nov 2026 14:19:27 +0800
Message-ID: <20261120061927.98196-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

query_buffer_size() ignores an incomplete read, and main() can use a
partial size or reach free() before buffer has been initialized.
Require a complete size read and return failure before allocating or
freeing a buffer when the size is unavailable.

Fixes: 9d64fc08f6fe ("tools/wmi: add a sample for dell smbios communication over WMI")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/wmi/dell-smbios-example.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/wmi/dell-smbios-example.c b/tools/wmi/dell-smbios-example.c
index 1f3e7ab14b68..a4c63a6a0ee3 100644
--- a/tools/wmi/dell-smbios-example.c
+++ b/tools/wmi/dell-smbios-example.c
@@ -143,13 +143,15 @@ static int activate_token(struct dell_wmi_smbios_buffer *buffer,
 static int query_buffer_size(__u64 *buffer_size)
 {
 	FILE *f;
+	int ret;
 
 	f = fopen(ioctl_devfs, "rb");
 	if (!f)
-		return -EINVAL;
-	fread(buffer_size, sizeof(__u64), 1, f);
+		return -errno;
+	ret = fread(buffer_size, sizeof(*buffer_size), 1, f) == 1 ? 0 : -EIO;
 	fclose(f);
-	return EXIT_SUCCESS;
+
+	return ret;
 }
 
 int main(void)
@@ -159,9 +161,9 @@ int main(void)
 	__u64 value = 0;
 
 	ret = query_buffer_size(&value);
-	if (ret == EXIT_FAILURE || !value) {
+	if (ret || !value) {
 		printf("Unable to read buffer size\n");
-		goto out;
+		return EXIT_FAILURE;
 	}
 	printf("Detected required buffer size %lld\n", value);
 


