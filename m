Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392264F5E1F
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674130; cv=none; b=T67vQX4mhvLatUREcU2IlLzDsiN97jDvX3yC5irwBUhsKI0jDKRPcu4OTrgOZSRy0xvMT4krob4Xenhr9atlwpAdn5+/JeUIyAWbqy1c+B/3Evq0el5+ihml+pEQrWd2fPrk12dkIDomhnxueBu8PxSRgK2Xz9BXdFkQsDsdwp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674130; c=relaxed/simple;
	bh=jIQzI9+A4o2AckNvjSyl/4N91rZSr5JY5roZQlJ8cd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MFU7xPHHH6DSskswAl0hnhxlqsbc4frjnMonlCPsqln56Rse7tEJzFe5i0L+9DO3yzWI5eGir/DVVQJE6y30rAD6C64p0YimcRjx+VocmhsQk5SuARSg1EFjMO7CeWZojiaiSZ6GzHGYwT3XKUVu9rd6IzQEREJyVJgr2VoLrqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssBYhL8J; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssBYhL8J"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c1b8d7b5so3419314e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 02:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790674124; x=1791278924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNu/CsyE7pSagieHFaxR4LRsyGjSzrWj83DFH9sX2nc=;
        b=ssBYhL8JJQhJ0Ke1RTkyZwzRdkWNkSETZWw9iznQh7B1l2cwwDomtuJvYlxHj/Q0+W
         /dSRo8oDTkbdOTSGjbA0W4YhFJY0gxSCKR+/CP/gmZc+/kTdqC/f4eYLoC7gIof/6dH3
         yLRmbm2790qgXK+jvFFihYuPEQLXsKnvJmWgEsyua4oT/JOAYh3uq7QsXMy1PhPYfDwM
         HSt0Gkqogh1/64n1OO12GNwPQJbOOv9VybuyL5E2vZnVQ/l4X5AtnTu2eS/+7GhEwTWv
         vVtXT75pwqQlxLuxCEapj+Ghodvk76cNd/XuXJ4Ibi1qsDQeeqjSuNITYEbZqqvsH79k
         cyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790674124; x=1791278924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TNu/CsyE7pSagieHFaxR4LRsyGjSzrWj83DFH9sX2nc=;
        b=naoDQ16+618ReH8FPn6PG1ATTZhxzInLe3Iw5uXxeGxIUGRGfmBhaAmXj39KLlK7P8
         1tGVW6rsGuiMmRwj7SO6tHM9ofhexlW68g1WMEzeksPBGJmZx8yXkFAMcnQSUOsMcnr4
         E7M4zbNWgSk0mHR2z2faJbSVoeuVDGri9OTlpNumyYHq0KiQ+fiVNyr9P0oNECjRhv7s
         t0ijQCyst0kACxpk1TGd8qluuPoCktMQyN51JfGL9/Jig0p2c76Z5UlvORocDOZzCt0R
         /kxoIixoKpk/JbycwVifokllEqLPPoSxKZMGZKt7NwdEBrp3cW3RSZdHR3x6/7bXQelo
         UK2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2P6BjKJsjK0BAO9Sa7bpGKqh3e7y/ymyJdpgeibD6qrOQizKJClmJJWpSSaJQfAaZoAiTzguKUFwH9eYweYE+A4wL@vger.kernel.org
X-Gm-Message-State: AFq9FYLezCFs/riygbbEUjuJxkl7u1OhVi45mAkFSej/3ReNwf6AYHAu
	h9VqeeWQz1wiV5Yto8dTQ5K/wOypEBVsAkloHf7j34UnF2XquRUsLx/J
X-Gm-Gg: AYBFou12agpyoqupR/OWBe23N8BS/cNPalv80XQMf1JuWO+CWfVfe0s8fCX04qp1U8V
	JcISGBhVZer5qYTDM7ITPJDxCoWE3ch3CO9NWs39EDWBlucaHoc/oXnbX0BLNPqreHgPkKE12wY
	oUVtJrbG1quw8Fl497XFzoHvfUQ+DYZyWqtwXSYMjzWPZ+YVbnQZCF66k3vw0Snz8RiRZT7LGK7
	oA6m1U6Ecl/Zf5IfRuYyYzxv0SIDlWxGvsFVxb1blZlk2yg8C6IDGW+Paychd24jRqlWZSEnsgZ
	JzeIfMhdS8ZNZgMWzMpoW36jIUzhdXWp7uSa9QKbj7bwOT0qU2urYLVTv0gMJ3t2Tny17o0Kg+g
	h7Ux2PpPFg6TXGamKK2djAMxJPuyFZ9joD4xKr/sSHL4s2GRZrbQVz9Sb+/SDaqBrQlnz28yE16
	yyhHn3D69Cj0A2SX8xBF0XeN6KcS1p2e8y7rehfCUvuD1poSZ4HsSWnEQRVdbj9no4OyymeIbDo
	zi+hJghU2Q=
X-Received: by 2002:a05:6512:12c6:b0:5b8:bc5e:d106 with SMTP id 2adb3069b0e04-5b8df0a3c30mr5516039e87.48.1790674123980;
        Tue, 29 Sep 2026 02:28:43 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([169.40.47.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9debb0bb2sm1216403e87.37.2026.09.29.02.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:28:43 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH v2 3/4] media: i2c: vd55g1: Return the endpoint parser's error code
Date: Tue, 29 Sep 2026 12:27:00 +0300
Message-ID: <20260929092700.1776966-5-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929092700.1776966-1-koreev.r@gmail.com>
References: <20260929092700.1776966-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass the endpoint to v4l2_fwnode_endpoint_alloc_parse() without checking
it first and return the parser's error code instead of -EINVAL. The
parser returns -EPROBE_DEFER for a missing endpoint, which is what a
sensor on an ACPI system needs: there the endpoint is a software node
that the IPU bridge attaches when the IPU driver probes, possibly after
this driver. On OF systems a missing endpoint now defers the probe as
well instead of failing it, as in other sensor drivers that leave this
check to the parser.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 22b1497e8..8043eaa50 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1801,7 +1801,7 @@ static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
 
 	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
 	if (ret)
-		return -EINVAL;
+		return ret;
 
 	/* Check lanes number */
 	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
@@ -1905,11 +1905,6 @@ static int vd55g1_parse_dt(struct vd55g1 *sensor)
 
 	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(sensor->dev),
 						   0, 0, 0);
-	if (!endpoint) {
-		dev_err(sensor->dev, "Endpoint node not found\n");
-		return -EINVAL;
-	}
-
 	ret = vd55g1_check_csi_conf(sensor, endpoint);
 	fwnode_handle_put(endpoint);
 	if (ret)
-- 
2.55.0

