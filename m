Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442C7379C22
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 05:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845986; cv=none; b=X9Wrr3jKImNzd6k3TtwLn0qelLOvSw5ny2XvtvtU7+t2feTk3fECj2b+3q6wwV7JekxpSXnLicWLCI/GuAAK5IeBkEK2nI77SHDT7GsoRUbtv6OidRbJ7PxpBw1tkIF8B9dPyNXwnsn0OqTNdO6QBok9SBOzAlTd808QH8pRp4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845986; c=relaxed/simple;
	bh=faRvsNO+3ng5yp7scD2ooEy+g3RDxAsErW36M1n5UGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lhIlsWWJhqwxD3DQMqinjkiB+jhI2RkyhO2lBxW7wCxusoBdsBlyL90tvSqHd1tn8SPWs70IEni/+wWHCSCGbP/UJ0fwV+Jzp7Wllth/OcV6KL+sFDr0zrevvhhvMjsUTsW+/f30nRtpsXzV4pa/HqfUluJpfk6MN40IV2L60qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3xFggSd; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3xFggSd"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so33542905e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 22:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845979; x=1789450779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Ry5IsRI3u6+OA2QrlJEuTetR9sltFKry3tbM/33hEE=;
        b=m3xFggSdQQMBIZKvFKAVdG3FM6JbMZdD5AVitmU25Sw/nIYzpGh1jHuCl3u2qGnSX5
         wbtEyT9jpSW+bzep6HhLaFnJGg+uDwbTI4v3MFZuRwitHS179JMx27LRgxfUmzjeuh8u
         +PpXBYa0itQd4NkhxDzXKxEzcT7QpViN3cEn/UOjBjcS2hFhiMH0xf/H6FLLVfK2etrL
         +6kvJ15Pc2chJKXRTmHAZtnE2V1p6uhYPT4S5n3usGkcuIoLmnyT7BS7Oec6UosEJoNm
         qopxOEO/xlQyz0VI7aZSKdbbY4XX2t+2jeEWcqHt4j5goH0tv34Gaml7bxbJSjE4beak
         mg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845979; x=1789450779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Ry5IsRI3u6+OA2QrlJEuTetR9sltFKry3tbM/33hEE=;
        b=dWI8LIEYbwPI0cdR3nJ8l6ikgFhXEqb5VtdkewAo+Lq51lHYXx76s1j5wNTlcUIeyz
         mLCVPBP63+NO7b4HbvCUdcd/Wrc2Z4K+6eSfnaBGQalg6WaQQfMPu8Hn+ICrf9cHaMs8
         5hTCKMZ5UVYRLgde1frlkK5akCQT2UMFlYn0AsEDFqodMXMosw0Jje+EnNkp8k2PDbNj
         fyu6qXa4V0epAagRGSTmCBJtFoObR/212kpqh9LAUGgHtJyvUWMJOhzXSybGIpEwMhfo
         0GSqClp/xP5cN+co2RhHJ6hh5hd3pLShxNUTCfc7G0Kqm13WtAKNPxpGNDWDV8Niwlq1
         tkQQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8GCA5km5HwfXmRO+3CPfl7TqyfXfRVZutI5ta4xmVfXE9ig4bipZe/UBr2AZRI5hHJUaSJowmuNttIrNNj8BFSEux@vger.kernel.org
X-Gm-Message-State: AFuF++mg+Eyav2dwwtLkuH+S6Dc+7MKxo7QWBHoWGsvhPyQVKBWAt+eT
	UdCq8QCTB67JtTGk+g0/WFP1xep8VBmmF+4bzQuS/+Vi1HGaqzZ+ERN4
X-Gm-Gg: AYBFou01q0PqOIa1wvSZuLDlQl3Wi82Rg9bUiMDta1wnWnfc/VB2HOuS8gnsCxnY2S1
	Y1d4Kwqg2ePvSjUqiLzxqRkG0rv1C7mKqhFST/g/u+6iq0rtMWWUPMxFX6DI+YAuFHUO0SluAOE
	2rtIHVCdV7Lq3WS0dOXOhSpOzoq4x34xWZM+yyMvvex74aWhvc+rwUnGbd0/2CE3iJjQk/9GXOq
	Z4FfW+hsEJ9jtqDJCQcq2rFPenfk4jQv5vSS4bZj4uE5i27BMGapPPX1oU+9DmYdIdlZ3ePVFiw
	6TMs8x6pgIg/W94D6gs2EoIL+RtKROsTzDIzQ6BrKeyADzsY8eBSFmLwoYrP+YTRmgSk4gFPWNq
	o8m9WYKx73HEL0yYbetCzJePlPVhJWaeK5CQrvop1RUaBqtHqDF5nkuT4OsfdYaxiKPwu/g8uHg
	9bjT/BgfIZ42P3AOv2hmUh1R455+cQWJcEqoLj4jyowqiu/Ud6TYjMjSE7kT5sfsfNtk1HUFBjb
	yp9NVFSReBa1aZ/m2yzeqAHtPyRgrWpMv0i3E+nfhqgyd8uzCLY9+qH6N5vLqdCQEdRsKDbiRZP
	EUAsZ09aaEanNXACPsyKDlr90FPvtL1e3WOngrPttQ==
X-Received: by 2002:a05:600c:6748:b0:49c:fc6c:bdfa with SMTP id 5b1f17b1804b1-49cfc6cbfa2mr234336305e9.17.1788845978942;
        Mon, 07 Sep 2026 22:39:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm523841335e9.13.2026.09.07.22.39.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 22:39:38 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pawel Moll <pawel.moll@arm.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-um@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: [PATCH v3 1/6] virtio_ccw: fix synchronize_cbs() after interrupt fallback
Date: Tue,  8 Sep 2026 07:38:12 +0200
Message-Id: <20260908053817.26065-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260908053817.26065-1-kmehltretter@gmail.com>
References: <20260908053817.26065-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio_ccw_synchronize_cbs() assumes the device uses adapter interrupts
when vcdev->airq_info is not NULL. If registering adapter indicators
fails, virtio_ccw_find_vqs() falls back to classic interrupts but can
leave airq_info set.

With VIRTIO_HARDEN_NOTIFICATION enabled,
virtio_ccw_int_handler() invokes callbacks under vcdev->irq_lock.
synchronize_cbs() instead takes the indicator area lock, so it does
not synchronize with those callbacks.

Use vcdev->is_thinint, which the fallback clears, to select the lock.
Keep the airq_info check because is_thinint can be set before the
first find_vqs() call, when airq_info is still NULL.

Fixes: 3a232277c1ac ("virtio-ccw: implement synchronize_cbs()")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/s390/virtio/virtio_ccw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/s390/virtio/virtio_ccw.c b/drivers/s390/virtio/virtio_ccw.c
index bab6cad3fd5c..b90299205698 100644
--- a/drivers/s390/virtio/virtio_ccw.c
+++ b/drivers/s390/virtio/virtio_ccw.c
@@ -1062,7 +1062,7 @@ static void virtio_ccw_synchronize_cbs(struct virtio_device *vdev)
 	struct virtio_ccw_device *vcdev = to_vc_device(vdev);
 	struct airq_info *info = vcdev->airq_info;
 
-	if (info) {
+	if (vcdev->is_thinint && info) {
 		/*
 		 * This device uses adapter interrupts: synchronize with
 		 * vring_interrupt() called by virtio_airq_handler()
-- 
2.39.5 (Apple Git-154)
