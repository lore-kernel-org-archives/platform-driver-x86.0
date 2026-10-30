Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348666;
	b=RT5w7CawdUwaOCCfAwpllrMQeSGDImaXcTnG/7paY/JZYvB+gKU0+QWlxDkRwHVNTivY
	 gOj+FkAEuJqgRSTiLM1grxg4OwCxMIIvuYsu1myG/lyyRdqa+P5hNnW63TgaAEeR7Naua
	 AwHiRDJZ3qfygQDLWLxc6jSPQcz6n4vOtJ3Sszi2iuUd9/2aWXx72u0cuPfnDcHPu1LZH
	 d+lzGcDj/WyUpVvQZdbSahRwhCTb8E6ABlN/qUD0VzmSVD/wlHw/+sHF/rWv7OWVS1IEX
	 UhWXC4knI7vxoHhcvGwFV7MNUhKZ1VxQjYERaX5lXgU2OufJXDbfYaHTXqQM8IGZuiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rG/NcuGbiOGELg6y7eJc5iHH1SHQcH5ELZ3obN5iebU=;
	b=cNYE6HutPGC+Nk/1+AfouFUZzmU59bFEC7R38oxr4jfeqXsSW7UdDgz1awChmSNSANXe
	 D2NQaMnSsFmzc96Yv98ixLh/BQWm3JTZCHQR8hJ5yUulbFeL0ZMjRhJGFJ/SA5zIKiuE3
	 yTR7j6qKMYGVU4DXrEp2K224R3l0DvS7YkrPX8bCUZIcXPDPq4OerlA+nfN+Ap9rbEZho
	 IlFQjiuv6O+DL4Vnlae+70uSDWIrPtd+3yOTds7FwOa70cM5RjPER+6QwHbdlK9CfuyoV
	 fharDyQ8qGeWAPOiLEpZn2WvEgUZCE2xOSPo9jEk3QSveKnXrd2us5xNZvdPyirgkGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcDvUhf0;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981B9606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 08:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dcDvUhf0
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-369f33df08eso977536eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348666; x=1793953466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG/NcuGbiOGELg6y7eJc5iHH1SHQcH5ELZ3obN5iebU=;
        b=dcDvUhf0Ea9ZGP4odjbCRyix+OG80QK7mqN4qG2DC7w8HLxA/wYoFFJZRgKFOkpxtY
         BVxfD2JTAkFbjQsYo1BiKpy4Uxky1rn6Q0vEoflmxdLfHdkMrDNyL3JjOz0XiQJ2MD8a
         TOjOqeqz9mVWzHrLgqUFvpE0rKy5EQnGo2/77GlYRvrDXyA8uyG/nmjcH7tEu3V1SBLb
         69uNQokmes8yOs9pHNGT24IXYO8Irds///xm3C7lmen2jW6adZ34kW6lKKh0OJAfIchR
         Xc5uiG28SFZEpfvuQE2h2EHyZIsquKZInDlfLEXGnDr1WDv3F57nhIHjQqjDC4cQLb0k
         jfhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348666; x=1793953466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rG/NcuGbiOGELg6y7eJc5iHH1SHQcH5ELZ3obN5iebU=;
        b=MkP5n6S4/DHymZNKPvhK90Q0sJWVS9bf+PMiEJTyQxt3uCo6NvE1d4hYi5/w73tvyS
         UrbIZVbrOVIvCm9vATuQvX8TEFy1bOS4/q7gWWrsJzOmCkRIeIN1vHnqzaKUCEDxEZP1
         x3Wo88LnG06whXDzLrFENKylbKGzrAOoJFZxsry+mVVVs/xD5VZEQNxgGhorYnyBAyco
         8/KDWBBr4HKIMttO1dHMaAod60tPqm4FPuk+GYUhQYv4eM4AFyaGiMbi3ihDNHMFkp/m
         soFjWUP3mXL2vnISlN+b2OzHFloQDkW5NfoMC5YWN0ooGMw4geC5JDsnH3vfOXLXjRuu
         Vatw==
X-Gm-Message-State: AFq9FYLpR3k2AN/OrhZrtkLAFMrL4qN4Ke6E5cwxlQ60+32txxhyDB/5
	yRkZQY2yFcB6bfyk2ODq9HVylKzmvDglkgn0QN2ThtdyW9FuExpfHz96
X-Gm-Gg: AYBFou2MZMbzsWMFv/pYsaSaxC40QhquRmJCSKhi8Jbj3ScbHISZ8OsjabA5WF8CA1J
	2nVj5/J9N7e75s1nj6aUBu/zwMPdz6PUA7MxECthKCgkpAIgWEPq3BefqGCfEnJYnzVVbaLXx5m
	z/P1HoGrDVoKa5YOeGy/Jnd/uZERZXPdZHK8JY7/WYlm2m/UKg8Vzpo8dZhf6ViZeLz5MqqK5rT
	M3yI2UcZHqzp51Cpei8gSP+U7hqbbogK/U8q21HNQ7jJ+jznXHsOCPzIC7ILOLDxQAeLy9nrb+R
	Aye5u9VSG3eBBQbFO4Ii2R4FX+oApkg55UzDyAH4VAbfdltCiw1VufXUpq7/9Ltbo4sQuhJqCEc
	4vhgkBQ8BVYXC0NOtN44FUzRRHsZoug4V1z9QIF58XkT/ckADdeCZM95i/8gig0cognSppagRby
	PvyMlUq+2+1UC+xS85zw2GfimClbiQYNTNZCuJAy3JcFBaShLp8vR5k8sWpjlKIRigJ5vXzGe8d
	mLmq4yLvLYttSJgLbuOukkLI+3jCTv+BQYId9a3rC+GDWGbJcdZLQsnw6+NHgFmCYmZX3hg+1mz
	TyKkWgjL7CiaiPHPMwS7JOLRfy9QO0IWFbVTGSo/dGrGxgVMxSUujM5VCCd/FafigQ==
X-Received: by 2002:a05:693c:69d1:b0:36a:fec:d8b0 with SMTP id 5a478bee46e88-36a423f9734mr2476230eec.25.1793348665664;
        Fri, 30 Oct 2026 01:24:25 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:24:25 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 8/8] platform/x86: sdsi: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:53:02 +0530
Message-ID: <20261030082303.284271-9-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex is
automatically destroyed on driver removal via devres.  The driver was
missing a mutex_destroy() call on the teardown path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/sdsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
index d7e37d4ace23..bf1ca472cb06 100644
--- a/drivers/platform/x86/intel/sdsi.c
+++ b/drivers/platform/x86/intel/sdsi.c
@@ -663,7 +663,9 @@ static int sdsi_probe(struct auxiliary_device *auxdev, const struct auxiliary_de
 		return -ENOMEM;
 
 	priv->dev = &auxdev->dev;
-	mutex_init(&priv->mb_lock);
+	ret = devm_mutex_init(&auxdev->dev, &priv->mb_lock);
+	if (ret)
+		return ret;
 	auxiliary_set_drvdata(auxdev, priv);
 
 	/* Get the SDSi discovery table */
-- 
2.43.0

