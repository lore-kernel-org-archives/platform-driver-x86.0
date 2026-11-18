Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975955;
	b=qtJxwlOI9WypzGB7UI2gtCL+N5y/sOTyOntFJBgkv/0f1TK9OvixceFe+yewpAOuagTL
	 htgfAKa4izo3bYZYI+JPrTlFCAckQSjpZ3KHkw8ooP/LCPxghh+TO3B+NZZDGaIueT3IZ
	 yMcPvbIqp7MNxdhvMe3KRcyooXeC1cbOkkg5zsHwky29MytvtRDG6FeJl4ejMRLyn/5ad
	 sbFqNRDBoLouZB20UvcPY6Lnmna2uHGw7F9CqC+G7TEMo8U4NJnf4U8m3+tn767Zn8nHx
	 Xmgam5G/xkFnoPptuwIFSl9gjdgdMb4q0eE7KLoQzrVQbzjDa1O6xKywPhBLHQGI/qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o0k8km+RlrAzwCDIglHBreyk3uk3Elyguo4XLg0KncQ=;
	b=RHadNH5t9iwdyYHkhRhoyYFGyGQpA6aYl+a/eEI1l0Imz+iEFAzh10Y0SbihnsK1I4Du
	 +NmPm1v6I8WNJ45+V1npy+Y5+jX8y6vRFxUrGp6hqaZpAWuzxhF8ncHBVH0dWJbdn3iUZ
	 S6iV/xxkH+vOJoT9iGdK+6RwVgBrMVktKEmvX2NHvJuXhrqzQhObTakBV7HWOnMIHpeOR
	 mH85PSNAF2sAAiNwFFQUdbOtJCHZU/rEUEt/znY3JcSPb6XmCJBCv2C39sZD5/yKkKkIe
	 XthQQsAqfAjCU9uh991sf+idr3g08iydNsujgVuXc8133gzsOx/cevAx3fpW++TGmUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6N+LoQN;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCECB606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCECB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a6N+LoQN
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9ae391a05so2895905ad.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975954; x=1795580754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o0k8km+RlrAzwCDIglHBreyk3uk3Elyguo4XLg0KncQ=;
        b=a6N+LoQNWxIl7DI5W0HI/lvU3xGPgVAD0tj8wn+IjNFszXZfTrx7RIrd9uYtTg/SwY
         4uyC4rlfl64J2S+b3SoEt+rr83UFMN/x2gSCep3on17jJMdKH7oVhKS6wnXECkRFku69
         ToLZZPoEtkrXYXX+Fv02JyLPUL7wu5v81n5EvoghxjT4XHzejsY7xFKPCZHuyvAgGQKf
         8T0wjvEPThjbQXw/Ra/XELVd/k1P8rPvp+Z53GeObMZJsAKH6MHv3xbbh4N8kgkswwQZ
         e1wWy1wSXEq5RXy4gSM6tbCc88YAh/aEIRhr8sjxKHXSaEgLfjw48IILWCygUN5XcyqQ
         rr/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975954; x=1795580754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o0k8km+RlrAzwCDIglHBreyk3uk3Elyguo4XLg0KncQ=;
        b=2OkIeKsrdmaXeZ4egS+Ye9v8a9hFeEt+CcRYoMRaDbG3pr+0G1WgM5SsnBbQyY4RSE
         7dpMkt2/ezFDSFMruponghffmEG2OXhXx91tVQpCBABoaM9m7+1JjiVCGc+gJWyZsnEN
         hhaZJ06JltTYwUX9lJ8c5d1RI8Ywxqk06iXa6f1TSfUik1cumGC1AaZXlGt+OGvW5A6m
         fFgus9vrLS7RwkU68kziCTYLBsHO9UfMLGLcc5bm2Nj9AxYciNF8uUE5Pv6g0nFX8qG7
         ufza0au69NV2P3sEZznPvYGZ0TSrmu8L1SwYHs0+5/9e+Ax7iqMo001NVlnCE3d05aSU
         P6vg==
X-Gm-Message-State: APuU4Z9FQumFDV/OgyuWXGKVdOfd+cNw3ivTRDbtQ3Hk1J4Y4orgkOKq
	leAaLzrJehaoaPrfuJKrlOzvKe5Am23AI1HjVw9aFDZLT57YBcU4R5Nr
X-Gm-Gg: AZFdTZeieo9MD31d49WbzoHRD3QfE3yQHLj3vCN59jJs3OVAMsuT/hgTKgdqscZYycv
	7cGOw38Sgq8YVeQWqrdVS9zZDbPeIj457/Dse/BcrEVEvj7gv+PUGXzb22lOuJllXp8jLkd7J/L
	+P5kvECJogaYJD8A0tv4q5oliqS2vJ8rALnvMvn6pZSilXGKXiL6A3nM1FKPJqhpcBKM1KdsAEW
	EiRnX1N8uWmSrBad0dD36EQRL1aQg8j1vzGFsW04HMfYyZOWDgpSbLTdTIV79Q5MvQu1Br7wBSL
	NaMrzpSYDuyXQTLJRTZC7ueJWII6r/Btah4Fzxihr2+ep3xe9kzZmAwguMyOv6+UBzziR1xR077
	qadnBtcDmN+NhZ/SsUfCIVZ+FRSp3yBwozkP37dK8Dnrd4GYa0TcNFCJU4vuxwvxPICD/asvoCX
	6sI1ZtBx2Qa3d6g7rVSe/9ZDaNfhL0NstFdIDGSfvYPyRSGneZnXBf04Pitkpjkx/JVoqGHQXgw
	JwLbGSz4ury0MJ0TMOg+TogwgpaSQlRfz8AWgpLrDllyilCPRDSu0vNwf1TMzSRLzsP5vK6yptC
	lg2/mkbxymFT23xMKig4N4bfnWK4cFpLLf0SE91JAukpHyPLRWK2KQJbluQAioWMNb+K/g5CF3M
	0MQk6v6SAvnWpGScaVg0l/Whg3A//EckMjl8/n9ncFPw9dXddvDWsqLbA2KmNkuQJmCV9Uu+/CD
	V8Ag==
X-Received: by 2002:a17:903:234a:b0:2e9:fd49:64a with SMTP id d9443c01a7336-2eff7218257mr10942335ad.1.1794975954026;
        Tue, 17 Nov 2026 20:25:54 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:53 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 08/16] platform/x86: dell-smbios-smm: Clear platform_device when it is released
Date: Tue, 17 Nov 2026 20:25:30 -0800
Message-ID: <6ca87f75a5080f171ba6a6f0c1e28cec4821e5e9.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794975827.git.rosenp@gmail.com>
References: <cover.1794975827.git.rosenp@gmail.com>
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

If platform_device_add() or dell_smbios_register_device() fails,
init_dell_smbios_smm() drops the platform device but leaves the static
pointer set. dell_smbios_exit() calls exit_dell_smbios_smm()
unconditionally, so when the WMI backend loaded and SMM did not, module
unload unregisters the freed device and frees smi_buf a second time.

Clear the pointer whenever the device is released.

Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-smm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platform/x86/dell/dell-smbios-smm.c
index 8c297732f351..d9c41ecaf90d 100644
--- a/drivers/platform/x86/dell/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell/dell-smbios-smm.c
@@ -150,6 +150,7 @@ int init_dell_smbios_smm(void)
 
 fail_platform_device_add:
 	platform_device_put(platform_device);
+	platform_device = NULL;
 
 fail_wsmt:
 fail_platform_device_alloc:
@@ -162,6 +163,7 @@ void exit_dell_smbios_smm(void)
 	if (platform_device) {
 		dell_smbios_unregister_device(&platform_device->dev);
 		platform_device_unregister(platform_device);
+		platform_device = NULL;
 		dcdbas_smi_free(&smi_buf);
 	}
 }
-- 
2.56.1

