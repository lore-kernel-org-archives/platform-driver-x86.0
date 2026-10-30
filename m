Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348660;
	b=Aw4wfmUXn7Oi1c9cfMLlzaaU8zeWUvwUL5GsG5Px2wsdV0ifrJO4KzwkUwHAt/Gh9qLR
	 DO2549GfXzniaX58yXPsV1jeOiJnZaSzsKN5RnSnCXStrVcNM7lOj536+IwLOgLRkGSbI
	 xJkhPuuS6SlRtrFoayJXu2sCxI/4se36d4eb5K49EO/ROj7e4DXLGUmze+lX5AhrCCQyM
	 6mVxZ1NxI1rYrfb0pSjYO9rxZnlk3T4KW3c7bGAuqxJZ33o3zdbRf9vjfeUx4G4flMZnx
	 VBZuJKKya6tYimUW3v68qIClXq/ymjln+Y7mtyf2EcLe50Dae2jPcvD1c2Q+rnPuLZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HWH3EiWhjtZPLmiiGuZgezDEl2iX0t7Y1U/kGiEiHOw=;
	b=KoRYOGRYrv8lGX6FgJI+YmEso76ajly7JKI0KMhZrxTr3fA/eGBTogFdVlsyKgrqKZbr
	 JpkOGAKJ1fEFM8CNXtFrhYnHpd5dFYyxVFfQmuRp7Wd3uvjaMkYwU1fKBmSaH28OCfjA8
	 ant/uqxWsjGJc1fdzaQ5X+VInKxfftmrKc6SUmXioVJers+tkucAE7/7DKN879GF8+Aan
	 Uf9nJWgp8oSlWA7Ci29o+PxC5weEaGpY0mLentuTzDAWUtAF/2bXMT1gjJN0mgqZaVNJh
	 1ILcuAwIF/Q5KwVkiE3y6FA0tBZ0yLP82eTgrcHozX4qRvQB7Zht7eNjwr5SHTWpcQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SpC3LyiB;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B79606A31D
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 08:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B79606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SpC3LyiB
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36a18fc7a38so1228826eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348659; x=1793953459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWH3EiWhjtZPLmiiGuZgezDEl2iX0t7Y1U/kGiEiHOw=;
        b=SpC3LyiBAZud6nVAQ+RwCqcl7sBxNOg4NK1cTrJUUu+pCoqeknIkuLz57bJL8IOzh6
         4/oL5XmV3WlbCT7e993UQJBbIzuf2tFlSIJNIEjod0ZFuOLbbNGihHQBBz0vooDpKKh1
         nLEpvKk7lKwJhTDu9Q9VxiC5/di7LYeLxxqvirfdm/FrLBOJfHpyGKNt3lf5h+VE7ZDN
         6rYML/lvz6sCqyfSZ8sVsX7A7UF9rLfrij367ILhvI8Ixzw7wStHyMIsOJRE0GDTirUE
         TeyYG4qT6vRv2fU74+qvyLTnHMTP17gI4xYkGgfaL78/Zkez3zOzMFkkVA7hmi743Fka
         oAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348659; x=1793953459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWH3EiWhjtZPLmiiGuZgezDEl2iX0t7Y1U/kGiEiHOw=;
        b=uToJCJSiAgxSkiUAvDZ9IDTiI8rKE3wy6sxaeLEg+4Uy4D4jjQdY0N2y+l3yPQx+kI
         tNOSmlQTUEVVJPk4KuAdpHOqfCmoarq3e9k1sVwguFAgc3U94z2RGoc87FVpHBUDnrnX
         Jfog9vr/9cb36kT/7NzH9uUy8GvhWcoFr3aAkKsme0q95JJZ3xO6ghevGvtxf3Uh/l9s
         hWmwV9Xay0mdbETd8Xayk2jMGjKBj4NzJKUD2xTuk6GxMRGwI85Wq0yzCbgFnYjPAV/e
         wNYFFJ/Kne2yp0MWRF8EwL3tgMaf7aF60YrDrhG+vPfGzE+z/co3gs0chHuhZfjewg1P
         lezw==
X-Gm-Message-State: AFq9FYLI84z2Lwe2O2YvbSEP5dLryXZPY9NuO4uer08mIoWNXqi0Kipq
	OlrOoUuoObHizLpiSXHJnZfYLfdOphvBBSni0vDNcPzT8J8H3NQwhOxb
X-Gm-Gg: AYBFou36xySVRyJpD2A24FMdwKpiwJACksMX4QjmzLYbhXWZ6R5BNoLFUvzIUxp605q
	OgEIC9GYJRkMkw78CZeoTxVnkAyRX0I4jdK/atH9/rzZx6/UftOqm9TatYCjX6SsE6ulq4R8iTK
	Y1ggL5xFkzDt2EYswl9fgIat9wSf8rg6kE+8FjgJjvNtSM0wH6joOAfWUm7v9DHY9ziTcEz8Iz1
	i1jSh2ua1h83ZEoq86FbRNNMoyaqVnVCxNgBECMyLsAvaHJfNu+0DEDH9kp5SaAyzLQX75e6bgx
	K4BvMZWW67noM6n5dXBZw3AYm48+sv568SS8p37rfKHIIs4rWGNZFnzNO6qqiTD9u3vQhYbk8Pd
	SynTy5F4i+GWptJ63Sq2gJwNI7z0UK4as4QQQ636W2QaBgmEK50EXPqT0BCnYu7gAXAU7qqGIeI
	CSb6W03QZJ4WqdHQKU+ftuuNTRQJeQEOT/a8aYevTlifJ3LkA0VFWAFOK8YsGmCo5TxzM58cwuk
	6f6PQV8w3CLugV+J9oA7DY24zDzBfOrDTp/c3kWBkKtfCv2T1vlq3c09dioMaW86BFEjvoWpIEV
	trXWW4CZxpWSxkddCEwcMPMgZN3jD6D72XxYD0yVJ1VycwoWWs4qE/10tAe1JEoLnA==
X-Received: by 2002:a05:7301:da83:b0:366:83dd:46f3 with SMTP id 5a478bee46e88-36a423a1f05mr2434932eec.14.1793348659286;
        Fri, 30 Oct 2026 01:24:19 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:24:18 -0700 (PDT)
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
Subject: [PATCH 7/8] platform/x86: punit_ipc: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:53:01 +0530
Message-ID: <20261030082303.284271-8-chitranshmandhaniya@gmail.com>
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
 drivers/platform/x86/intel/punit_ipc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
index a3d2b0b64135..1fdffe3ed8b8 100644
--- a/drivers/platform/x86/intel/punit_ipc.c
+++ b/drivers/platform/x86/intel/punit_ipc.c
@@ -260,7 +260,9 @@ static int intel_punit_ipc_probe(struct platform_device *pdev)
 		return ret;
 
 	punit_ipcdev->dev = &pdev->dev;
-	mutex_init(&punit_ipcdev->lock);
+	ret = devm_mutex_init(&pdev->dev, &punit_ipcdev->lock);
+	if (ret)
+		return ret;
 	init_completion(&punit_ipcdev->cmd_complete);
 
 	return 0;
-- 
2.43.0

