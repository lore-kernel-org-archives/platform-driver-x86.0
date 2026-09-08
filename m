Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3909537DE9F
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 05:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845992; cv=none; b=IVWKdo7NkoOwJkQnJGvM7VYh1wtM3QekZO08j1RYtoQgRCeVUvicCFdhmdbuscOpiPbWdJiOLM3bJQZu7+RZtrrPppbj0PXLOZ2Mo1ywacfh6rnDXWBH+9GCM//OHoe1UsnoaMWeafgDMooLv9T0RD7nuQGm+u2hMKKeGZN9XzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845992; c=relaxed/simple;
	bh=+wdB7PxXXtKvNQ35EUFAY1t6ihDReA2lJ+JGlRl8HqU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HAYLegAKrusSNmSukltQ0l6RpXamgnT8GsF88X0FS0eUUjqPQCQf5dV65Ge/Nwi4dD1/SPDovw1aH+C6XFAQXv8Bf5YQ+uD2KpJ+ER94GVS2tJlJVGsbtCsb3NyHMSCJ+DIQ7SpASHJ9Ijlvgm1y2iJzAgih5Dd9ENF3oH8LnYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dy6jspNb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dy6jspNb"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso40940475e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2026 22:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845986; x=1789450786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPvq113vaLkp19diB9PBTYq+aXRuG2muF34cABuckMo=;
        b=dy6jspNbxGAKGG3lIe/bspSeQ5j6q6O7nVNct+gSf+FKrKUULLHhV4YZxLyD0FyzPP
         5hCuizsetB/+39eiGzEi2UYzh/o2UrulEoDzGOEOimzTa7zUE3kIDqj6RdcmykWRNDMs
         XaxvwNCZTh9iAOBYKGR+e9eCCk+LaMpQuppd9go90pCBSfbYMiQoQp6WFlCvE0ojmTI7
         5EfY5SjAJE1+pJlnUwlgKZO9u6lhxwY0Sj1NYKXMko8BRuvXThgKVpdRSQWtILOlovgH
         3UbNOCwk19AmEURMWAFD6nRY2x1FC3lAAHVAnNPos6nLvfItW/9fN5KJMKcMPtNn/DCb
         4GAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845986; x=1789450786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iPvq113vaLkp19diB9PBTYq+aXRuG2muF34cABuckMo=;
        b=cOpi0jd2UQ9+ARP1GhyVZXnb5z0aOPMP42P35q8zAtSdEYMGgU+UkUNRvuDzhANcqu
         BJdtMXeytLt5Tf4JPnqweWxGQl6OwzFK2rfqLavv8H1OBWAbpQ6pAGzXQruLI0rB/1Vj
         aJkRi1Nrcm+HSt4+38LjaWZ2xN9LmA+QL5aDmN8m6AqkwwKAazKRpXzK+wMKAD3S3yyR
         t20LXqfZOYH1AAhuxvIiFJC9aLO2BMuMjHjUWj2GUScARGrxASlbtqZwoKsRSXvVgJIL
         ftO98uVN8Ia7kebhrEMrrTJG/iipb48NYJ4vAEsAlX2dYIhViIT1O8kg3bkfyFNnc0CJ
         DMOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOUWbqOjbCrEO2PyE9OmfcDpXxoGI5ZNgPkhGf3FDy89kH30gF2SCAKeR9s0YKNM7sbWt9BxcH7UzTByeaBXC4LPT3@vger.kernel.org
X-Gm-Message-State: AFuF++nnyNGJP2jyyaq8ZCkDAzkbfsn73DRONoXwe4rwO1Bpy3BrIqGJ
	EIOr5N3J/DqAjceScf42w56W4os8OJyXiaelulcmzP5cij/Kd4m5yb4i
X-Gm-Gg: AYBFou0gIOsRezP9MwCl11x7s+fubnl9OeYdiLklGtZrFuu1m+YCsHJWyhQx94oWfq+
	jJvz8Kbnf3LbcFfxR7CfnkvJkniEAy+WLqssHcqRohX8ZThYCfoZvicW343R1l8JduTGN7NOtXF
	DpVUP/WQfazlDYbdTWcWDsyib5/ZVxJjRsK9pWssLE6BxyX2Orh8TnmljigROqTKYUnLH2tEZlF
	KQVu2EbzA/Mtw5I2ZtpSxPYDZOU8OYDdDzYLFRClE0uV0B/A5Fx2LByof++HboF4gGUFdbNniks
	J6qJC81DFDFGmoxsOSzt20X1MvgmgUgtDUyxQdXqdeZztfxYU7u6d5+8phQ55H/IV/y4Fuzi3AX
	koi08ALVpP72BwCDTxz4t2u1BzyqpOI6HWW4l4U2Cq3K/Jqlcp9sGI6qh4Jppzx1eSfHXZrlZY6
	fKwSu0XoVgKo8lK/BWpL2Z7MxrO764NSs46AiFqhBfL+6BRXtT/3A8jGHsIhOSA5LiMl4+6XWCh
	ZOVXwS+CEMOHomVLE8ErDHbFiU5AY8J1CEY4DfCkcmqfpw6HVgvy0q3rAaOl51ITi5iu+uj//mk
	ohHvj8uDFpxqsZUMKTjlo6FtVDC9aXWOv+qmilxrsv4=
X-Received: by 2002:a05:600c:620b:b0:49c:fa20:cc07 with SMTP id 5b1f17b1804b1-49cff19cbf4mr203278645e9.30.1788845986284;
        Mon, 07 Sep 2026 22:39:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm523841335e9.13.2026.09.07.22.39.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 22:39:45 -0700 (PDT)
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
Subject: [PATCH v3 5/6] platform/mellanox: mlxbf-tmfifo: implement synchronize_cbs()
Date: Tue,  8 Sep 2026 07:38:16 +0200
Message-Id: <20260908053817.26065-6-kmehltretter@gmail.com>
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

TmFIFO invokes virtqueue callbacks from its FIFO work item under
spin_lock_irqsave(). The core's synchronize_rcu() fallback already
covers those sections.

Implement synchronize_cbs() using the existing per-direction locks
instead of waiting for an RCU grace period. fifo->spin_lock[0] covers
the transmit callbacks, including the callback from the timeout
handler. fifo->spin_lock[1] covers the receive callbacks. Take and
release each lock in turn to synchronize with callbacks running
under that lock.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 3c6408581373..664bec20a7ae 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -1135,6 +1135,20 @@ static void mlxbf_tmfifo_virtio_reset(struct virtio_device *vdev)
 	tm_vdev->status = 0;
 }
 
+/* Synchronize with callbacks running in the FIFO work item. */
+static void mlxbf_tmfifo_virtio_synchronize_cbs(struct virtio_device *vdev)
+{
+	struct mlxbf_tmfifo_vdev *tm_vdev = mlxbf_vdev_to_tmfifo(vdev);
+	struct mlxbf_tmfifo *fifo = tm_vdev->vrings[0].fifo;
+	unsigned long flags;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(fifo->spin_lock); i++) {
+		spin_lock_irqsave(&fifo->spin_lock[i], flags);
+		spin_unlock_irqrestore(&fifo->spin_lock[i], flags);
+	}
+}
+
 /* Read the value of a configuration field. */
 static void mlxbf_tmfifo_virtio_get(struct virtio_device *vdev,
 				    unsigned int offset,
@@ -1179,6 +1193,7 @@ static const struct virtio_config_ops mlxbf_tmfifo_virtio_config_ops = {
 	.find_vqs = mlxbf_tmfifo_virtio_find_vqs,
 	.del_vqs = mlxbf_tmfifo_virtio_del_vqs,
 	.reset = mlxbf_tmfifo_virtio_reset,
+	.synchronize_cbs = mlxbf_tmfifo_virtio_synchronize_cbs,
 	.set_status = mlxbf_tmfifo_virtio_set_status,
 	.get_status = mlxbf_tmfifo_virtio_get_status,
 	.get = mlxbf_tmfifo_virtio_get,
-- 
2.39.5 (Apple Git-154)
