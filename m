Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975958;
	b=4sLLB9HVln0jmqL7MuTg32O99Fm9eCoxdfRK0fVU9HxW7lCpQw+ibHKmjZYzIUuq9+dg
	 Y//quUZC8NobPKXJtqWlISTjd0vaV4YlU/t0R4sTGEm7LpvrWFgPvGBgvBmA39BX9D0bj
	 bUIBD/dbos8wcw82F/CMuieuziH7UCRCU1eQ/NvZsNERhk/w0SdtBp0Kx1zJ30/4bM3A6
	 Ni2OPKilCsRdkQ9t528iCq7O6wt6mXy3Qab5OSRpleYuV7KFGBdG8I8QWkxJSQfO1tbcN
	 iv5/Qo825wKbmlKsndP16+aYm4cMmcFUB8UolKtMnBN8kUg9IkbDqsZWCRo4DgCPqgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OHQ/M/inUnJA/lTj2NIuSJ3Cb/toQ7tWHGfFPhC4p+8=;
	b=lDBm3QyEfBu21tpyYanhf5B4N4JlWpJJlEJgGTiza/vQXAn1lMpxrBl0bZaSpUmhR5Ow
	 c4ISmMQvssbiZytvdM8oISS/PwyIvF2LHOob2cKlb7Cor5muOeno+SdO0FgAYMF0KVlHn
	 XjyhaYd3gGqwxRlF2Mo9B0kcKuDXTCLCQ2BNG7tYi35CwgAF/d+EyQyS2a9A0KV/C6+8B
	 JCTMyP127aCQXROq02GlVJpFbTUarT7L55ytzI8SI+HbCs0W/cdMDcYo/FvDZvFcs3Qp7
	 JlH5aXVq03Aulu+yC6ZM9H28/14i4R6KMCpbWwYwwoLYMEyhs4kLS9TP7EwksmT4NHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLBiTp2+;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844E6606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 844E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WLBiTp2+
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso3742315ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975958; x=1795580758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHQ/M/inUnJA/lTj2NIuSJ3Cb/toQ7tWHGfFPhC4p+8=;
        b=WLBiTp2+R0xj9D4HouOlQixECmQULpBRH9OX60nw/9U+0nHoYrGDZF8B42FSp577wj
         IZNFCYOW63INRJO7C5bKWs8OPc8fPaK0EOWB4qBdu87Y3cIA6uCpq2SVuLirkiw63MwC
         ZPG6NwSMVx1+S/5JlMZ2cwtDJ02njpXTBN774C4hmWU4XLoK9/xYTv3ovVwGxjpD/79u
         3sqeT/lzmY/nW/S8K+U3vqHy9i60yWBK5xb3blI/673Netsi3eugh3IKqR7ULsqtvLg3
         DMlFc9e3FrY/VwvJYH0R1cl94miKKw7VrTOhYK0P/xCl/KfO/EsWDzJhspF7yY1CaFtO
         tAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975958; x=1795580758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OHQ/M/inUnJA/lTj2NIuSJ3Cb/toQ7tWHGfFPhC4p+8=;
        b=XGuTYxH5XsUuRbaoSuo1QSTElOlsQXwBPI29wTcO4JjPKJUmp6f2L9O0uHnaUE8ieK
         yUJVN3b588VuIrGsxs+TJu+9g01ZnrGpZilj/KyTqwS/0XV5MOSz1ZzeSJ1KDDKJdk4x
         nnxGJbE0nFaNs0PFi5jkiA6xDyLZWPm6RS41RolxbsbYP5RjPTXr3EfZKqTxSSHV3xaP
         w8AA3a/3gKwsPlW8MeOfGfsZ5zmrMSLZKno8Kbi53yv3oamtO3rPE1yxrWAxvGqJdPzx
         HDsZQqkvb5VVLAUq+1TFqvHaCMpvJFWT5zMip2aSqmV59/KCguFrTdSk5K1VsHlOmFdo
         1joA==
X-Gm-Message-State: APuU4Z93CdsxLfbo7p4UM1NH2rN93zAmOt3fDdFOLz/4OksUzytHH2Dx
	5dPzd0f1i1dKasvKAnsW+1ZJj0mL6tnS2A3lT9URZbetV+SJITQ1kprovNKyWw==
X-Gm-Gg: AZFdTZetp+VvWQMXsgmFoAKg4gu9qRzS0kH5aZ9jBs+G2Kc4iEZiP8rEJCdqWlBKbL3
	1uZY/NViGNsDtnv1BMxGIy2DU1ASa8qeGk4oaOJaNi0crNtkcdMIa6I2vZ6gI3FMTsxXzRR9yzq
	mESh9weGWHT52SWDzSwwInKukX3bb2sPIUGdH3AfP1eevk0En1BnUF09VfYgpZ3KXevCQZH1w60
	PEg55jsXAI3TacjCj5Kk39kUTKLT7b9eJ+jgduOFQ5y0PfXwaZVPg0DpRuaU8TK0qivcwfqbiLV
	Xp3pTaPSBL2uAt10kaO0cA2DT6eGBgZb3gKu4lrVxnWw9NQBvcOcqeIHSAtMyyn1f4mg3GnDqin
	l172lHX/mmoRQoYBjge7s6813H9W6gmT5DaqLIN1HdIS4jzCneEZTRouaPMP2hNTQFday7/TBJx
	cuGMwSuFWzLhDso6U+s1Mvxmn22u3YCBfdsWFWYbOYOeQ+YAriFlQAmvK07Vh/+W6i+yUt1VQ2F
	6DRXYJiV7JVSJTZTh5Od3MCoVGfE+hRs9XHI7zKXh0kqyMD1tONHP5vlYCG7tY1yN21irquVBra
	Ymw47hrBsNKzcgRkjdM867/uPgus1K06MNgxYynmxQVC3vJApaeBkldqKYCsfw9vOGhkUgG5XqQ
	D/350JVuycRN8SBNPhw6HrTzk3kxFo8QWIW8/hLCoBfIG5yG/aEZg30/dAzZ9XOLrdyOLloMjYs
	tZrw==
X-Received: by 2002:a17:903:19e4:b0:2eb:1dd7:3aa4 with SMTP id d9443c01a7336-2eff740c2fbmr14488295ad.34.1794975957553;
        Tue, 17 Nov 2026 20:25:57 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:57 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 11/16] platform/x86: dell-smbios: Don't tie dispatcher entries to the device driver
Date: Tue, 17 Nov 2026 20:25:33 -0800
Message-ID: <20c6c1899aab10d9f775c35071372f05a50a5746.1794975827.git.rosenp@gmail.com>
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

dell_smbios_register_device() allocates the dispatcher entry with
devm_kzalloc() on the registered device, so it is freed when that
device is unbound from its driver, whether or not it was unregistered.

The SMM backend registers the dell-smbios.1 platform device, which is
bound to the base module's platform driver and never unregisters on
unbind. Writing dell-smbios.1 to the driver's unbind file frees the
entry while it is still on smbios_device_list, and the next
dell_smbios_call() from dell-laptop, dell-pc or dell-wmi walks freed
memory.

Allocate the entry with kzalloc() and free it in
dell_smbios_unregister_device(), so it lives exactly as long as it is
on the list.

Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index ec78ff1c606c..cf75e4e5ad53 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -150,7 +150,7 @@ int dell_smbios_register_device(struct device *d, int priority, smbios_callback_
 {
 	struct smbios_device *priv;
 
-	priv = devm_kzalloc_obj(d, struct smbios_device);
+	priv = kzalloc_obj(*priv);
 	if (!priv)
 		return -ENOMEM;
 	get_device(d);
@@ -174,6 +174,7 @@ void dell_smbios_unregister_device(struct device *d)
 		if (priv->device == d) {
 			list_del(&priv->list);
 			put_device(d);
+			kfree(priv);
 			break;
 		}
 	}
-- 
2.56.1

