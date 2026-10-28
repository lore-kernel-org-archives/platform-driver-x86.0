Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186924;
	b=upU3G50lzjndYul07fA9ctYKL8G3ZUXWMXKavNRpCvVXlAXHHHlAZxLtjDUXuZFBh9rK
	 LjfSitTBSTMUALDGW66P45a1wK+ivLMCSEqrbTX373xFK1oDIfhJDYYpVUkstZnLmUoLk
	 MQC1c+oK8aNXCdpi8sbtui/xDp4We0SCkxvRWg8AKqiOMSQXAHLqDa6EmTtOaKH1/JImA
	 d70JyDSQTzO/rpIZs22s99ybm5KBw2MMt9qhc85Zm1njgTq+bBPMm4c90WU5c3fMZM9mu
	 dn8xNTJrfP5V+kdCMEtwogARCkpbD+p+H9lzNxikRgYvWz+qkffYKzP2Q82CvnzjErA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
	b=Gr9TpOPxNmOMuLsaiMB71tj8why5iVFFutkBsSNBAkKDjYl/KzHDKKHTSOgoWv8zsSvK
	 WZdYtnL2E1yZok9h79geXEHi6BYmXBvBdV0lUa4iT4ua0jOJwKnvxIlTq91G8EhoyvYNz
	 ymOeo0HEDRUXRbOPzUla1UNyNtGiM8opw9kypLXATHYDLQPpTk2HnfiF053iwM4bmLRBd
	 Uz+AJILnqWkelvudbsYAelX81FQjQ7SvX6mL/MqfWYGjVg77ZMw259vCYDBFh9m4nrQ84
	 kbJDY8r5ORYeltUUwRnm8dkaAL6fW0AuZxrFfxPaXjq4FZb+DuKbn4sIZJiNJ+dE4gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="D/k1N/1h";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D1606A33B
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 11:28:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3D1606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D/k1N/1h
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e9995ce866so7290725ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186924; x=1793791724; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
        b=D/k1N/1hhxjXCeizQ310bdBkvpa8x8AaKvzGAZOwe4dZJwGMDd9vIN6wuKr4OdhI0R
         LaBsy6Ew3IO7jzHKeyZeCBIZ4TBova1q4yqfOJn6ko8/2sx5cZFNmeGkRbTvpezlMBH2
         Up3KelZCRnBWf1UJ5i7tRe3goFIyOTpHCxYe/krLh7KUp9WCjWmrG8Y/iVEzY1CkBiz6
         csm3pzW2MbyfTLTCBQGVI48NRKrjuUVJzEdVKJwkQFjzzMggZccx97jNR6cYDUOg52Be
         xlCL0civtopK1JuISNpPFiIx/3m+tLMfvdevW/YJZu/pWAo254/NwzstQkv4/cZsCDF5
         ZYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186924; x=1793791724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ycmAB6PxtVDAOSxkc4Ku8pcl/F85BhrFwHWXHoa634=;
        b=q0Il3XCxICUqoHPw1VomU0FmfnjcWbzEnYOpH+1Irn82QZgLKcjI2QtM1X+A36PMFx
         9imovVnlFks3lxAOHxGzVIfOQAisPocF5EKaqqodqTeW1nx4RfA8/in/PiP36klqn4TA
         x00jyPUasIg8MFjWzq573/HcaNIZaZkyGs3CCSDJK3os7Z+EphiT3wf+JXFdjiP8ToAc
         rfCuyA8hwT+72+7dwDChM/nnVTnZV0H9JEAfYAu9xye1dcdaKkgrxIFQtXMjOCNgqXht
         V0jyx2nUVhvPRT9zglP+rCapPe9CTJhaYoPoo/p3sX+WCwcdO+5LExEgYrtV79ELLQHt
         edYg==
X-Forwarded-Encrypted: i=1; AKwUvBzQzi0wFDmGTLlxlv4B9NbhaCRWseYvRJVm67TjyiG58KeaU+P2TQFFhhO/2ZXUncKKsqzSpo53CZMNTZfin9n1BMfj@vger.kernel.org
X-Gm-Message-State: AFq9FYJnsCllYSN8vubaphQIcuQngShSYUaMHSUfzFdSRHqwoXsnWtGO
	k8QurnYo2kQDe5eB4bymJBEKHzYtNAYbeFGFhJNC+V28pdCRyuq2lXYt
X-Gm-Gg: AYBFou0XKiY9WHBKdVIbZT/c/Dw55XX/2VLsBa/CTsYr66cxDelV9eXTqJL/f3t+RbA
	Yz9bHlwurCHwo9ixmvysP6/do6d9MFGocs9E5IQefi+pdxZEBhAfoTx1fv7qF9NV3r9D5EzGnwG
	wb4nSmVanrJsU311qHbkUmNTsRTpfiLAT3AgAC61750J/xdMaVuVGdu9fBVNkT75A1disGsYJHN
	JoKUoCeZglkjQYOWcYmSwEZC9XbZkXkuw3QynYmbs5lkPZQ9/Po39/6W1xvfq1LbASJkPqE/yc6
	3gpV9SltW2ImuP1S/SS/V4+bCcfcH1pgTSrYdP2OeDH2I7jx6WJF+sDSOkOoAmwFhwnkmf/Id3b
	tUbp4pIbmj5NMkZGljEd5iEBtEo19ioVR8uYlA77K/nvIzGvMIWmLCQcai9MLrHEfYr+uE1LVeD
	4loNp9j5waQu19o8Pq29sGEAutPfdQtbUzB14fmwbnAL9rWc9cuWu62pjQwmF3V8W9UK0b8er5U
	L2+nG6SUnS3UasdFqKM635eVwLuoYGePziyjqHFweoFUAaCvpVF+wuKPC/TUFg1e5yB++zRSrSn
	LlX7/aGx/qg=
X-Received: by 2002:a17:903:2c0f:b0:2df:991b:4368 with SMTP id d9443c01a7336-2eb004eec42mr21869625ad.53.1793186923460;
        Wed, 28 Oct 2026 04:28:43 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm20128745ad.18.2026.10.28.04.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:28:42 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v15 6/6] platform/x86: bitland-mifs-wmi: Fallback to balanced platform profile if last performance profile is not available
Date: Wed, 28 Oct 2026 11:27:42 +0000
Message-ID: <20261028112742.674847-7-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112742.674847-1-qby140326@gmail.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
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

On Bitland laptops, performance profiles require an external power
supply. If the system enters suspend in a performance profile and the AC
adapter is unplugged while the machine is asleep, laptop_profile_set()
fails with -EOPNOTSUPP during resume when attempting to re-apply
saved_profile.

Returning an error from the resume callback simply because the power
cable was removed during sleep is undesirable, as the device is
otherwise
fully functional.

Gracefully handle this condition by falling back to
PLATFORM_PROFILE_BALANCED
whenever restoring the saved profile returns -EOPNOTSUPP. Update
saved_profile accordingly and notify user space via
platform_profile_notify() so daemons such as power-profiles-daemon stay
in sync with the actual hardware state.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 3f8f1ebb10fb..a431d3fef774 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -392,13 +392,27 @@ static int bitland_mifs_wmi_suspend(struct device *dev)
 static int bitland_mifs_wmi_resume(struct device *dev)
 {
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(dev);
+	int ret;
 
 	/* Skip event device */
 	if (!data->pp_dev)
 		return 0;
 
+	ret = laptop_profile_set(dev, data->saved_profile);
+
+	if (ret == -EOPNOTSUPP && data->saved_profile != PLATFORM_PROFILE_BALANCED) {
+		dev_dbg(dev, "Cannot restore profile %d (likely on battery), falling back to balanced\n",
+			data->saved_profile);
+
+		ret = laptop_profile_set(dev, PLATFORM_PROFILE_BALANCED);
+		if (!ret) {
+			data->saved_profile = PLATFORM_PROFILE_BALANCED;
+			platform_profile_notify(data->pp_dev);
+		}
+	}
+
 	dev_dbg(dev, "Resuming, restoring profile %d\n", data->saved_profile);
-	return laptop_profile_set(dev, data->saved_profile);
+	return ret;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(bitland_mifs_wmi_pm_ops,
-- 
2.56.0

