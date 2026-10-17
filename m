Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652D3A5E6F;
	Sat, 17 Oct 2026 18:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792262695; cv=pass; b=Mh5bRaz89prxNSgfp2Mz+Y4EEhjIQ2rodopxKocjowGZLHyoz/5GeEetPfGxW/Dlj5Fwm0XuHH/jzLAV3cw79gj7fBhDx8mpUXiDIMKV86CNlqitBqiEJGUn71u7foB0Jr0rpnTe0eY3nGaUG8IjdoVdtUdp4813njUerX/fRKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792262695; c=relaxed/simple;
	bh=A0rRh/QeYtmdUgAhUuqkGkSk2dzuMp4cLDqwyVGPelM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7RH7WGgmcFfV+TDymMsuIVmdUfEy++5ENbJHA0zuEcVdh0vCpsYIYwx7YrnNF/aeaxNmIyIFeq1/QXRB1upyGbTXh/ltidBr4jVqpypLc1mPiaZZD3rkctwv71X3dwHwl0WN1m7y7eLr60ijrmJaYRPfCyWXeJZKtWm6OOckSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=DqCduN3f; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="DqCduN3f"
ARC-Seal: i=1; a=rsa-sha256; t=1792262609; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=k+Y2CfoAtQ0UI9+kxvNyKlFW0hDyJ5icnvDA9dp5g70yYjYn415qMLmTLVsGJODId/8Dr4ueT0CNOUWj3mZbVBnOUlN0vysicn/GO4cPu9mLr53TK3XLlcrkqiSX1sCTv47azL8KUf8tV/WYX8IyJhCr6PQX9+74qXAaX97k3bQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792262609; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Cu0Ku63ibtiD8dSCNBVjWGKMrJyfLPEWtMUvr63+F74=; 
	b=JtamZsxftY6LocrigMiunxJnH0lBjrsoNZyzVdA5536JbxmR6a1HZRuSu2fNRyKWfzaUJor7sJidQIpJL8dRALnHLR2ch1fqplV1UJdLsRD593SCoEidjH01Z4Qmha2MoGw8T8VthGY5BX7eMJaLabpni70tuu3livMfS10tgkg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792262609;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Cu0Ku63ibtiD8dSCNBVjWGKMrJyfLPEWtMUvr63+F74=;
	b=DqCduN3fStfZipZI93r28Zaomaprm0dkJGOXSwKa96sa77Hy5iv+CatUC9q5qwCC
	eQ1AbXry7pt1IX50ImO/8ZMasI948/4jzJscDMvEUPCXZSYgzZ541m5St7b4prS3jfS
	RdfkDAMHOQIfCudPkLAODc3BFSGubx3eyD5516HB84J6AiGTm+o7dH9ClkyTeBR+a24
	IUQOkXo7xm934tbMsThCZ3otKHNLel7SW6oBurTL5D12fsJkSm6lujqas9MxIsaQAIL
	GvBbSBaFAbTe6Ex/IXU76CCNUCGw61dV/YKE59+exk7apOJ2n95VDRyEnGXedf/UDzy
	FYPSc9Wb5g==
Received: by smtp.zohomail.com with SMTPS id 179226260737642.869995973074424;
	Sat, 17 Oct 2026 11:43:27 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Sun, 18 Oct 2026 02:42:42 +0800
Subject: [PATCH v4 12/12] MAINTAINERS: Add myself as a LENOVO drivers
 co-maintainer
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-lwmi-wmi-new-api-v4-12-aafef7956c4a@rong.moe>
References: <20261018-lwmi-wmi-new-api-v4-0-aafef7956c4a@rong.moe>
In-Reply-To: <20261018-lwmi-wmi-new-api-v4-0-aafef7956c4a@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Charles <hanker007@gmail.com>, 
 Navon John Lukose <navonjohnlukose@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-73bef
X-ZohoMailClient: External

I regularly review patches and resolve bug reports posted on the pdx86
mailing list or the kernel Bugzilla to improve LENOVO drivers (including
lenovo-wmi-* and ideapad-laptop) along with Derek J. Clark and Mark
Pearson. I've been submitting patches to add new features and fix issues
on my devices, too.

Add myself as a LENOVO drivers co-maintainer to reflect this.

Suggested-by: Derek J. Clark <derekjohn.clark@gmail.com>
Link: https://msgid.link/782FE636-A06A-4E12-9563-786374805947@gmail.com
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c..fa576b4b5919 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14808,6 +14808,7 @@ F:	drivers/usb/misc/legousbtower.c
 LENOVO drivers
 M:	Mark Pearson <mpearson-lenovo@squebb.ca>
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
+M:	Rong Zhang <i@rong.moe>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst

-- 
2.55.0

