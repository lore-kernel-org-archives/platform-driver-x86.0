Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC2E4137A8
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 18:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273059; cv=none; b=I72mvXLMVwfBvr8dmHUwyWr3CqOMlbox4BKN2M3n4Kbbs8VlNpElJh6RrFaGGu1r7fZnDdDJlpziAZcPgfme7bJHbZuObTMSexQF5IAln96sFVzL4ijsKPTbfzvvm/TrOklCr3o4smTrc+1GpxPWFZhRdf3R9mmWMxhIQkH+yvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273059; c=relaxed/simple;
	bh=y7PL0+ejjyHGcnok7ngTGhIV4WHYWuQR9i0Pn0Z9nR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WrLbN4icR6k/REBW4r6iN0kx4PUhtBmM7eXaRKBQII0SCjJ8O7CXc0fQD1IGfPhqqx4FGWVFO//fv3CvTpWzoPp4SXsAb1Z02237wpAUE/GbUWyFQNrLR5KcjG3nDWzuyer32LlGd8dTUcQ1yU/7c1YzYGzIDUZzHJ04x2tZvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuWAQ0Hy; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuWAQ0Hy"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2946aa0d5aso186209466b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Sep 2026 11:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273056; x=1790877856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ZaSVO+SF6MEByvXtiNZMR9/TYrsAkgI1sYilat2LtQ=;
        b=MuWAQ0HyO144YjPCnNEPhO39lRH+EK2CCiHkS2HHTlJEuTpToT3q2pzYDLi/znwRPW
         gpMN57KKXWivPsxe5Mf5Jc8dqR5lj41L+HH8LvR6qIXadM5FGFdCnWbnbzxU5xYHMcOf
         RvxU9f8Q63v6zQyh/CAnzDoHE0v8OAIgIQSkOtW2pV8d15tburpy9Fuc7xohb92c9mhf
         RazyWXt8TPqBZAAulmhR5UnEGIOXvFvxDm1uxNF/uQvt1jR7zrG1uTd4xah2r+2foTtR
         UxYJitxk+AvGqAUv+RMRmig45/5/f/AcR/IS/LFMk7fQ2kmk8z6L73KdkUGmpmN+acpg
         87qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273056; x=1790877856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZaSVO+SF6MEByvXtiNZMR9/TYrsAkgI1sYilat2LtQ=;
        b=1OT+TNfi4Yw3G9arlPfzENvM4MqJaOf9fMZdaDZ7bKeaK1rPhJvNSoaVZ7T8QQbJOR
         vRSvki971O/0sXEbkJo7rtD7Hhca690gVsp0YxMQl8GIcMwi10Mc5MoMUhhbRUXa/89W
         PHPwAEHuBtiiarxvCJEcu56BiwG+54iPyJ2uiJ1L7AQ/zXkTuxPXcpC6/NL+oySy5V5r
         +yr7KbOq6lA+ZsUx4oYp2wrQw1Q3AKgjxhBjW7bznMf4LZGzXqEVxhghGRdWyUMWCbiK
         MX9KzSO79Q4ssdonYI2s0Q8/J7OrfHF1xAeEH4UzQwMTSb4LC3j4kcsXlxKJaoofa/0S
         kMAg==
X-Gm-Message-State: AFuF++lvQiKwcB0ordZ7XgWaQSyfC2HEw9EJm7m+D4MUJzSgb3jf9x24
	afZhtlSpcYgH3FW+q4QVNUuDc4NprvqNf956W8JTHN+BZYoRvKuIOwU=
X-Gm-Gg: AYBFou2x799Lzje/O8iD15delphChjCsMZkXpM6NJhZxoOj6rdZCkAv6PkRDtEYZGUR
	raJQaDO6j5RhWf2TY0m624hnYFVGH/JMgOhUc7kVly50rEFU/MInISFFH6aV/sNkL3UPg2elQqa
	2c0PZfv93cLr/gRkDruucA/kCJL1i7ZALphfdV/dj0EO98hd2VREQ9WB1Xxnp9lxcNCDy+RHl/t
	GvhdugdJx8I4jJAEtdmU4z501bed22CYvhSDghCcJhMxRP18AYmZg6zEp0gQk9UFsK/Tky0NyLw
	Cit83sllt3oYvcQubKk+Fbgs8I/IB1DzgKIygt0RkmXSe4jZyguN3Krmg0aSHhA4ddEES1mgUjv
	0mmiE2bRawOwT6H69SHXet3MyIW5ga1FTF92OMunTtvgW9+A63BUQngKv0ZHGK4+8r+E62Man1t
	ss/kNelOVWr5Y+Af+9YEC9Z8JrFscJAsEm1jA5kWG5ycnZ2dIfhSbhAqq2/05Hca/jqoN9xN/mh
	FxK
X-Received: by 2002:a17:907:6ea9:b0:c29:42ad:acd0 with SMTP id a640c23a62f3a-c2ac23a733fmr314809466b.30.1790273055386;
        Thu, 24 Sep 2026 11:04:15 -0700 (PDT)
Received: from okuroshi-laptop ([169.150.245.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae6610a6sm336715966b.39.2026.09.24.11.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:04:14 -0700 (PDT)
From: Artem Maksimov <okuroshioffc@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Artem Maksimov <okuroshioffc@gmail.com>
Subject: [PATCH] platform/x86: hp-bioscfg: support large bios data
Date: Thu, 24 Sep 2026 21:03:41 +0300
Message-ID: <20260924180341.34064-1-okuroshioffc@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory allocation for ordered_list_data and string_data
can fail if contiguous physical memory is fragmented or insufficient.
Switch from kzalloc_objs to kvzalloc_objs to fall back to
virtually contiguous memory when physically contiguous
allocation fails.

Signed-off-by: Artem Maksimov <okuroshioffc@gmail.com>
---
 .../x86/hp/hp-bioscfg/order-list-attributes.c         | 11 ++++++++---
 .../platform/x86/hp/hp-bioscfg/string-attributes.c    | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index 5bf8d40bdf81..80ac15435a18 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -98,8 +98,13 @@ int hp_alloc_ordered_list_data(void)
 {
 	bioscfg_drv.ordered_list_instances_count =
 		hp_get_instance_count(HP_WMI_BIOS_ORDERED_LIST_GUID);
-	bioscfg_drv.ordered_list_data = kzalloc_objs(*bioscfg_drv.ordered_list_data,
-						     bioscfg_drv.ordered_list_instances_count);
+
+	if (!bioscfg_drv.ordered_list_instances_count)
+		return -EINVAL;
+	bioscfg_drv.ordered_list_data =
+			kvzalloc_objs(*bioscfg_drv.ordered_list_data,
+						bioscfg_drv.ordered_list_instances_count);
+
 	if (!bioscfg_drv.ordered_list_data) {
 		bioscfg_drv.ordered_list_instances_count = 0;
 		return -ENOMEM;
@@ -438,6 +443,6 @@ void hp_exit_ordered_list_attributes(void)
 	}
 	bioscfg_drv.ordered_list_instances_count = 0;
 
-	kfree(bioscfg_drv.ordered_list_data);
+	kvfree(bioscfg_drv.ordered_list_data);
 	bioscfg_drv.ordered_list_data = NULL;
 }
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
index f3dfba270f7e..095201004d87 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -101,8 +101,13 @@ static const struct attribute_group string_attr_group = {
 int hp_alloc_string_data(void)
 {
 	bioscfg_drv.string_instances_count = hp_get_instance_count(HP_WMI_BIOS_STRING_GUID);
-	bioscfg_drv.string_data = kzalloc_objs(*bioscfg_drv.string_data,
-					       bioscfg_drv.string_instances_count);
+
+	if (!bioscfg_drv.string_instances_count)
+		return -EINVAL;
+	bioscfg_drv.string_data =
+			kvzalloc_objs(*bioscfg_drv.string_data,
+					bioscfg_drv.string_instances_count);
+
 	if (!bioscfg_drv.string_data) {
 		bioscfg_drv.string_instances_count = 0;
 		return -ENOMEM;
@@ -390,6 +395,6 @@ void hp_exit_string_attributes(void)
 	}
 	bioscfg_drv.string_instances_count = 0;
 
-	kfree(bioscfg_drv.string_data);
+	kvfree(bioscfg_drv.string_data);
 	bioscfg_drv.string_data = NULL;
 }
-- 
2.53.0

