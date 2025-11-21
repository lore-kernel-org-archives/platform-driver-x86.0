Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543E93F9D2
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732046; cv=none; b=jFbErRn2TkTKsIUS1L+qz1GQV3/dcGxUlm3wYkiDLioI3gVMrcxLG2Y2mZvdYeH8giaFmYwaj2D3C9LBBrkPKM2Q4GqH2UyAbVvulz2j6sJ/I8D54iUEy8F8SNWOHGkFnFn0OiqHzIDGkV2PgluH+LXm6bqDTB488zz6uVNnodQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732046; c=relaxed/simple;
	bh=JMf6sVa3t3YH8xrM6IoLfzeeJttXQP+a6Aj8dqHL+UE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UAs0eXqO5UwyIiOh5yLWBVkSsupQl2kBexlrlMXP3STZBDTIkkxUOrlkXUVtd00PpC8bki2sglhcVC3ujabCRpnjWphx/npa/ETbDNjU8hDbZ5f61lsiNyah5IC0+hnU1nOIT4++7bAbhEwSnqYCyycJpch790LD8clIa4aS1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lA92UoJx; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lA92UoJx"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso22474555e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 05:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732042; x=1764336842; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5gd+NXDJH1k/AiseFURMWhfY43fUAfOIrx0pDiZrMqs=;
        b=lA92UoJxh1TB30eYOgFlPCNHe6ELXU3oUn1zq9GJABckAhL5/xdopkAj0qAen0Qn8F
         CmL4Ob91FwH0x55cITKukQSY3jR93agNrDWGGntsLH5FygkCyMv0joZGB1zXLRgNH8+8
         iO40Im71TD3DhGEfkRBFCtslN0B0SULkEogfINV/xvVJ+d04ByVaq9qYrfkn+sEI1TdH
         30gKgMDAxa1hjybH4gL/8TySHATWqPZ6aMQ11NiFATf8jEAYgMz5HQzTAlRd5+8M0/SS
         kqUPGSlkg+TIWkHJ/YKVOQs43Xb7zXA9ppf328kirLhIxfbm9MdYDMDVsi5Y4JPFiiyw
         Z0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732042; x=1764336842;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gd+NXDJH1k/AiseFURMWhfY43fUAfOIrx0pDiZrMqs=;
        b=NInDn3wu99orWt8JZCbtgWwPDizOCFdBgCyPkIlXik7xFrPi30jKnh1ovpXOiSkzBK
         bJsyVeLEui0zDCKfryieSBej+KJ97QFlzVytNQVbx6O5T2ygVBcxFbK8c0+rX4D1RW4n
         5ZsWqpIRtMH9dE+oMTADYITOQiKyRxujpeTbwL+QUOByZbD3VgHEzknWUNp+P4Fdom2C
         CMxL/16Td/bRIrP7xvD707DGJKgR5JdHVL4HEAMGYdGshz/b0IBha58yQ9ujpE4GOKwb
         jagqF73DHz3Nvz59wZniw2XdOAwIcXJU7nLT8O7rN5F9FTPuEslDLJ3sQ6L7jn9fOXvK
         /HEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf1YaBZLlQoCRuRt/fMV4N6dzzTPyhY9cIx0b2xAK9rkbIAxdiT9HHeHFnYSKHP140zBNTG/fCwKOvQ+JaaMiFD88Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxVRd7qLsJaelr0dHdi1ZhIFDy+rjXUs0AGcOytiGysS2ncJvka
	aQFHXMSVPq1bngiuFKIk3pYY+3fz6X/4A13aC8BZKdaHu2AivCMWgldAFSsTtFvAaAQ=
X-Gm-Gg: ASbGncuX6Fwa1lXdGQn1/hpd+WOzcc07lEudCoovSsnSjebkd9ny2mF6bIiShbDzxYc
	oZ0JFnrzNVRVMaRyTskM+bAVWwp0/NQRxrtJ6FOVx78MMdOlJNw35LlwpsTwAe7AHVC7k3gnnTD
	1BtYj5K5LW15BZ78xWnpVCjWXx2mG+yfdcVqXv8jUxhvr4+3oVDmq3dlcE/rbgYBxq1gKiq7MTo
	AY6R72S7TPKUhIL0a9sHB7+ESCdNEqp8OUCn4szHV+cr8X+QNUYi4RI9+dOUlAKsNHy6IWR6oph
	HtkwMDz+QTHVw4G4qrnU9Oec3BdNldkGmQ4IUr3B2wwE0L2kGjWEpCDp5ztr34jCP1tUO2I1iQu
	VK/mM+I4phYmQD60DZ+MbeadOfXo9Yd4XgWGElTHY4ErTaLr26RvJT5d0Wjy2zlT5OpHU110/oj
	sY8zs/SBWAlQgMG5MO
X-Google-Smtp-Source: AGHT+IFz/AtAUGVrEx4UQpBBcJKuyq0FlCCQOjhjBHhOkLK1YZ+ecaVnE56K+BtIy27pAWFHs7Z3oQ==
X-Received: by 2002:a05:600c:4f89:b0:477:9bfc:dcb6 with SMTP id 5b1f17b1804b1-477c10e2bb4mr22166915e9.14.1763732041527;
        Fri, 21 Nov 2025 05:34:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fa3a81sm11420352f8f.26.2025.11.21.05.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:34:00 -0800 (PST)
Date: Fri, 21 Nov 2025 16:33:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] platform/x86: asus-armoury: Fix error code in
 mini_led_mode_current_value_store()
Message-ID: <aSBqRHs256Tz7EKr@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are two return statements in a row here.  The first one is wrong
so delete that one.  This changes the return value to -ENODEV.

Fixes: f99eb098090e ("platform/x86: asus-armoury: move existing tunings to asus-armoury module")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/asus-armoury.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 9f67218ecd14..a2cfaaa71f25 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -463,7 +463,7 @@ static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
 	}
 
 	if (mode >= mini_led_mode_map_size) {
-		return pr_warn("mini-LED mode unrecognized device: %u\n", mode);
+		pr_warn("mini-LED mode unrecognized device: %u\n", mode);
 		return -ENODEV;
 	}
 
-- 
2.51.0

