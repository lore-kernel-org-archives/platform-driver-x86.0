Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF453F166D
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164805; cv=none; b=hECNomZ3/bMpjbaF0JS2pTQ/ZiQhmHMoQJgGPDG9qxiggmTiPbHf4d2fFkWagcnoqJoP19Wi54UN2ehSYKHA2nZ8Gr6wS1Ad6nzRx0fbCacgYpafXD8IVgXMi+cOn2MjJ4+TEE8Ay7Xu0+qVT+OYj42TNOxSsJxG78N7aUC9ez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164805; c=relaxed/simple;
	bh=9i8wVeR3JGIzzDdoOlOV4Dt1ow4Qbw1neuY/X+3SHWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m+ale2//DPQq1bWpHZ7DXWTy87psMItoXBqus0YlGDQ+YF7VzrvjADiP96JUMzOU0/tZ00XtqixsOdmjE8G5C9jjm4BsvtQ2iBWBAHRRySk3Y52do9uecmJk4SvScSwPzxlKOC/8Zwij7LRPJIBkbSIM7CutftQosGhHReZgki0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eu12+6Uf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eu12+6Uf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso9729245e9.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778164802; x=1778769602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6GP3FoSJEigBezrG4cSJuHLL5OsUHzb8oH8VhdDSWG4=;
        b=eu12+6UfLxSyXGgGhtWK8+aqdzxXvU6KboByv+1xFBtqW0vZehbIAUeWSHvwJ4GSij
         FAR9fgaPr9paoEcb1D8qjaOA+UlOq6ZdKYEICBExVMm1kaI2osA+qKVNIWVDI2XDUYy5
         4LAnFJh+VmXZglS976frU9RZB+OrFt+OvGKA5WPYS3NnrbQ3Wc+onxu5/I5lhK7847DO
         Bv0i880uPfrTrYMOkCO0g+KduF+Tu/yCQYtKksM1C7+FvBt444jy6EwxddocMTB8Er6Y
         cWYxWOqMD+CoIzHKAgUuNpq/LNlc7d3yMFARv7/CU8hSUbbDomkmYQBhm1ji+9CM+keq
         0jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778164802; x=1778769602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GP3FoSJEigBezrG4cSJuHLL5OsUHzb8oH8VhdDSWG4=;
        b=fihDsnRF/yTWP7htDXmp1lhUPt1Col1+Fg98D+DU1uDMqHPr+TWM3rZx8/OmHT3a2b
         oXnpiH0ilTr9EqvqajwSSTqOSR7i1lo8x5qPUfUZU8VojzbqFkpteChe0Nd35cFqN+/V
         T57cFaMulwJNngcanITu1ooL1tXAQnqbRntuoEIbkwncCMOIcbZVQ63xOLZk0Vbj0Og7
         3CLuEj/7qFRIsZywiP27KXHEEtn2hGjE94SlmPidvRv53NXN5+gCqsWuefIvdh4eQWJZ
         3XB4qRoZoa6RklQrVBsK/Y7CCT8z1e04OXLt0FYVI0ztaFQLoTuDwdLsVIvXa880zt6Z
         cJ8g==
X-Forwarded-Encrypted: i=1; AFNElJ8tpTGuP5xuyg9eGkbXBiTPABPtk6sJ9KcFqZmFjVkzLMaYUgu+cVojjoLTBlJRTjw+S74AXihO+I0hcqjhirsRaRzi@vger.kernel.org
X-Gm-Message-State: AOJu0YzqsX5oeFIrv3V0e9TIjKaiR8iavZZ48KEaMob6X/mBn3/vwkWl
	+V/LuMnYCkAbU3YpVU+slxufDHwAFvCaG5KG7Ru/nkduRfnDjM2i46VRBM+pMtEpa5w=
X-Gm-Gg: AeBDiesCKGxxDInci1gTO9SnMME/IqaxKf3eAkLe9CkZUyNvMUaeAA5nYUw7JGJz7mj
	T0CFGrsSrXN9D6K9jXdcRVSp91vmYgdqYX3rp5zeD923i+RAYn2yE/EZrPEcKXDfseafHLPDYyE
	Kgsp2c0kyYDPMxd2o7qfr8Demn0J6zwyeZBFYUR7qLUzu5OdNX0nM0qfcX2yJrOa8ofz8ehzofe
	Ky0jyxdPzCKiDM7CvkFLXVd0OhuHq47So9GHLv5Wp57vJpzeqAd0KNhWe0eR1qKbnmB1KMp2VH7
	KLjuxfQi7XETtJwsWKv1lZLZEUE141eAzEAHePzoVjgDE/VPfyoQn2VziRVboMXK6fpUg8w99N6
	BsEpv7FkvH+U1UP8RBD8B8VIDROCLLeoWUORdEQpuczkE4wNZjNjsNSWIHLsQsFy69d//FOKabi
	JBRxm47XLOdavelgTZYk1LsDZ8T/E7QPs+uO7NQqGrrnw0wO5MDr4DEARyaNi8EqDc45W0
X-Received: by 2002:a05:600c:4a25:b0:48a:768b:eea9 with SMTP id 5b1f17b1804b1-48e51e09797mr75327075e9.4.1778164801852;
        Thu, 07 May 2026 07:40:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e59b74277sm86655525e9.3.2026.05.07.07.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:40:01 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH] platform/x86: asus-tf103c-dock: Move long delayed work on system_dfl_long_wq
Date: Thu,  7 May 2026 16:39:53 +0200
Message-ID: <20260507143953.342654-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently the code enqueue work items using {queue|mod}_delayed_work(),
using system_long_wq. This workqueue should be used when long works are
expected and it is a per-cpu workqueue.

The function(s) end up calling __queue_delayed_work(), which set a global
timer that could fire anywhere, enqueuing the work where the timer fired.

Unbound works could benefit from scheduler task placement, to optimize
performance and power consumption. Long work shouldn't stick to a single
CPU.

Recently, a new unbound workqueue specific for long running work has
been added:

    c116737e972e ("workqueue: Add system_dfl_long_wq for long unbound works")

Since the workqueue work doesn't rely on per-cpu variables, there is no
obvious reason that justify the use of a per-cpu workqueue. So change
system_long_wq with system_dfl_long_wq so that the work may benefit from
scheduler task placement.

Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 drivers/platform/x86/asus-tf103c-dock.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
index f09a3fc6524a..de683e17ce01 100644
--- a/drivers/platform/x86/asus-tf103c-dock.c
+++ b/drivers/platform/x86/asus-tf103c-dock.c
@@ -669,7 +669,8 @@ static irqreturn_t tf103c_dock_hpd_irq(int irq, void *data)
 {
 	struct tf103c_dock_data *dock = data;
 
-	mod_delayed_work(system_long_wq, &dock->hpd_work, TF103C_DOCK_HPD_DEBOUNCE);
+	mod_delayed_work(system_dfl_long_wq, &dock->hpd_work,
+			 TF103C_DOCK_HPD_DEBOUNCE);
 	return IRQ_HANDLED;
 }
 
@@ -677,7 +678,8 @@ static void tf103c_dock_start_hpd(struct tf103c_dock_data *dock)
 {
 	enable_irq(dock->hpd_irq);
 	/* Sync current HPD status */
-	queue_delayed_work(system_long_wq, &dock->hpd_work, TF103C_DOCK_HPD_DEBOUNCE);
+	queue_delayed_work(system_dfl_long_wq, &dock->hpd_work,
+			   TF103C_DOCK_HPD_DEBOUNCE);
 }
 
 static void tf103c_dock_stop_hpd(struct tf103c_dock_data *dock)
-- 
2.53.0

