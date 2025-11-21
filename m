Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558AC346FC6
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763732072; cv=none; b=YYU2Oz/WUm/Fh76rrJWrHJ45I9zY/qJtveXTViNcEp5a9hC2UPQD3Z7c/o0vz1JKDT8lBIbwY4FQCwv13rCvG2V03dtkgcQ2pBfqth9NxTZBF3EQWKqGTgg4XqeL6Ytnd0t6e8PuJFNk88OiJF7penlTrcH9atfDBfUyQWl59tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763732072; c=relaxed/simple;
	bh=Oos7HIGTn/bwgg3Teeti/x3pmf7pNso68OPu4n64u/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0PozZ9QpebvOQBh0IQNFZO+vLg+0sXkdMEjzni6OBFOyN0sXFgF7N4OEnxD0Ce9ev8a3XZ167N9/2RNMqbAeh+FY4Rgy2Gv/QgRusq1mcUCrq93HqiobqswQoikw82qpY/BEQfMisK9JH6PwGtZNb9KwxBWr+akloX9UuSRhEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A0uRsbVc; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A0uRsbVc"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47755de027eso11536045e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Nov 2025 05:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763732066; x=1764336866; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3CEpaA/qJ+oGSKReLG4S4q01srEKS4qUk5M4KQAAlM=;
        b=A0uRsbVcFLccWUhBfOJDPkZ8+jMKxjWuUAVm0oi5beAfOHaClvo0+0a+ivn/6MWCzP
         glKIojLaiKe6w6FRs5wHNX+BJHxrxmcQOiD6wZKjqSfP0bc/VGAj9/J3m1zWbQ+0ig0W
         dhEQndWFDMe1Zs/rQPfh5z+PHKRNJQsGEe6pcgA8cJWk5i98LtVey9conFFicpYXRSeo
         E5zP+WFlijU1nAJhPjFgvjoVx+HWmSu9zKIBJGv4ErN4iafPuLMNDpaxY+cAQevsR1FS
         Q7KUVESbk6wwhRJclPbXH1RwAgBgsN+trYMwwL7YRWS7T2/ztMeu7mNfKFnIrfs+/iF4
         COQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763732066; x=1764336866;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3CEpaA/qJ+oGSKReLG4S4q01srEKS4qUk5M4KQAAlM=;
        b=Xta/RmoK5GMq7nh5FMd3x6V8zvooZjrDBxbMsFG/30W7CCsajipBnkTHwh9dzfvZOA
         /OXZgj+YviMBPhAVBvNU/QGO63eejen2itUiKbKMFT9ZxPDdYrreEfIMb6pqK6VOv3cd
         kuc/epSDUWIvDK7ls9AE6wh8KEKdumnWidg4YayQMzNmS/kK9HxWShFBAtg0azzUcrTC
         x2cFEdN8T8LVmsSTDRujgqEXtrCc7zBZWWgYEk4vVVCaujmLR3bE4spvZZMuyxgW5nVq
         Bo/5wlXk6CWu7EfUPOfhjvwWHQHbiZO9QXPoZ3FhVZ76XXoMEOgiCYYklqcOfiQhMUME
         lWpA==
X-Forwarded-Encrypted: i=1; AJvYcCULKDm2/oLoq0wcUdqsrLDqjaPoJ+zTnTCdOci/Af1k91zEHAA/wYLuSMZHMALiRtgSjLlR4IivSALMkcYqLpkOZSIk@vger.kernel.org
X-Gm-Message-State: AOJu0YwK4GoMBlusFCp4IK6UcFf/SS0ieguhaH/7ipp2BnbujZt7j5vS
	SDBsjUeJ+ajuxP+yMylbQYSkOp8C9rq7owUOL6nEKxC+e5+iUfzQ0e9pP2lBZ5yPJ5Q=
X-Gm-Gg: ASbGncuYNwM1NF2FiGDFfW5Y+Zh4s/9TuD2R/Yhm6Bc935Y0upm76UvdkadCFYkzwqu
	13KDnQERMjM3IumQjEJKR1YgKcgimYWvxU7B0byEx4iwDHSCc1pvMuP6oiF3pOM51HpXlmRq37j
	A8yicfPDmqwBvNXzS5P2qWL9qxsuMcZSsR16oifAP/rqup23S+Y0IK9jBhbOr9GATyKkXqCh7T6
	QDitxRW6jsqleS0G6lDOXcN0BFihYMcH/O/hT0tRpKjvYj21cz8X4A2/mux22pTinfXYo+ZPUTF
	2Za/VY0F5JL0bOSDXSAvfc/O+4InrRcCn8ElTyk79QpRjVf6hloWSwggLuxXr/dzzYMQOCrOSP7
	2rOFl+uKocTxTU9vFFW1v2gJffthr8NrNbodmIEPIowlAhNs5EJ27OxQuLRWbarlZGROqYtUQHD
	2rU7zz6iypjL1SVoA0
X-Google-Smtp-Source: AGHT+IFEY2c4x6XIWLbZF3xrWJhBqpdxwAsK0LObkYinXP4JTX+8TruP5faN5XWGNC0J5oEbJFCbWw==
X-Received: by 2002:a05:600c:1f0f:b0:477:8985:4036 with SMTP id 5b1f17b1804b1-477c016bc96mr26169455e9.1.1763732065926;
        Fri, 21 Nov 2025 05:34:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477a9e051d8sm87690635e9.5.2025.11.21.05.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:34:25 -0800 (PST)
Date: Fri, 21 Nov 2025 16:34:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qipeng Zha <qipeng.zha@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: intel: punit_ipc: fix memory corruption
Message-ID: <aSBqXtt8hJb7WYIc@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This passes a stack address to the IRQ handler, "&punit_ipcdev" vs
"punit_ipcdev" without the ampersand.  This means that the:

	complete(&ipcdev->cmd_complete);

in intel_punit_ioc() will corrupt the wrong memory.

Fixes: fdca4f16f57d ("platform:x86: add Intel P-Unit mailbox IPC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/intel/punit_ipc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
index bafac8aa2baf..14513010daad 100644
--- a/drivers/platform/x86/intel/punit_ipc.c
+++ b/drivers/platform/x86/intel/punit_ipc.c
@@ -250,7 +250,7 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
 	} else {
 		ret = devm_request_irq(&pdev->dev, irq, intel_punit_ioc,
 				       IRQF_NO_SUSPEND, "intel_punit_ipc",
-				       &punit_ipcdev);
+				       punit_ipcdev);
 		if (ret) {
 			dev_err(&pdev->dev, "Failed to request irq: %d\n", irq);
 			return ret;
-- 
2.51.0

