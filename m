Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779451;
	b=xbyFsPGLY65JTnX0jEgQQEZciA/bqXE6HEZRJUdtiuLjrzIhipgx8d5Z537UOCwhuCHj
	 Iui3cUoLoOqs0dqf5x+AyV0Vno0EzPabE7NPMuhglrcsM9eW0dYE/nvbZqEntE9XtTWXt
	 AJn2j52p0aXhnrk9Rhq6CrFzq/sdi5je/YhsJo8bZ6QAmqsK1fxj+1mn/NKtyhpUdi8Pl
	 8Z63/k7BuGUGzzbm13B+brRrl0HMfSZkjl98mUQ9IPnbjy12HCUdDe+/yBF86ULfLFiuz
	 OXErorhYGn7Ex54HR0XS3u+N8IUWlSZeSvrlVjLM4PJwSwXX7r12IAx0OM6glWD/kiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779451;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NPKIDkVsVZirAu2Ywa3NPNnkHUnqINIw4PcnK5IRJ0g=;
	b=dj6gNhd9SiFrg8cDdf9NA0Gv5ZdpcaoZkcx/+i4EI3qdDs+COxAtY2tJILEsZjoMVZbK
	 szAtG1n2oVl/+SsijirMjzoflIVIjVEYmSa5ThJ0eeEJVLdU4D4+W5+MNWhuYUalfk4FN
	 JcLob+C44DINyU9reVvW62QwXgjFHMZLcOK6YwNc7JiAcL60aNwCj16kQY4nQAlyBnDsb
	 oBHzJ1zRz53KdyNw9WMUfK/0Jkyh+TbgqGcVzMHXIwY292ygw4P0OeNCQYkq5Fmsbsh+t
	 9CCGp/IPoHPa5QmAOv397IQ9fZ+24DIypcffZybW4NsyDJ3xgkA3IXI3t9wXaetmQyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Bal4l+DT;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DC3606A31B
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Nov 2026 08:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DC3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=Bal4l+DT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Bal4l+DTjstzjA4/bYmkLvS6aJyqMKmCZALMsyMW4Z8JUdxSCAjcWD9cZxZIx9wJe06Pa1pDW4tpv
	 jOmqCL5sohrD4IZvsSJDnlTjegS5aD6FSG956Ewwg1wvppI7J5S3tiTyPt3jTW2zzErtmF6wBjZur3
	 YnSiskB9o4/y3iR0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76aeae6f7246-9c6ef;
	Wed, 04 Nov 2026 16:04:07 +0800 (CST)
X-RM-TRANSID:2ee76aeae6f7246-9c6ef
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from desktop-eb75daa8a6be458c-20260816004526035 (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66aeae6f58b6-19b9f;
	Wed, 04 Nov 2026 16:04:07 +0800 (CST)
X-RM-TRANSID:2ee66aeae6f58b6-19b9f
From: zhangchujun <zhangchujun@cmss.chinamobile.com>
To: platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com,
	zhangchujun <zhangchujun@cmss.chinamobile.com>
Subject: [PATCH] tools: wmi: fix free of uninitialized buffer
Date: Wed,  4 Nov 2026 16:04:02 +0800
Message-ID: <20261104080403.2100-1-zhangchujun@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

main() declares the buffer pointer without initializing it. When
query_buffer_size() fails (e.g. the ioctl device node does not
exist) or reports a size of zero, the code jumps to the out
label and calls free() on the uninitialized pointer, which is
undefined behaviour.

Initialize buffer to NULL so that the error path is a harmless
free(NULL).

Signed-off-by: zhangchujun <zhangchujun@cmss.chinamobile.com>

diff --git a/tools/wmi/dell-smbios-example.c b/tools/wmi/dell-smbios-example.c
index 1f3e7ab14b68..57a873d94fa9 100644
--- a/tools/wmi/dell-smbios-example.c
+++ b/tools/wmi/dell-smbios-example.c
@@ -154,7 +154,7 @@ static int query_buffer_size(__u64 *buffer_size)
 
 int main(void)
 {
-	struct dell_wmi_smbios_buffer *buffer;
+	struct dell_wmi_smbios_buffer *buffer = NULL;
 	int ret;
 	__u64 value = 0;
 
-- 
2.50.1.windows.1



