Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EE638AC6A;
	Fri, 18 Sep 2026 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789770019; cv=none; b=mpRI2KQAZIH6PHFJEnV/XvJf1BjLXokxsqCAL5RLLyYm23NOyaEtiijs7/4ImluDZlw2smwVx/S7+9bmmvXm9I0EkHhYRVKnihsvsjVGD4SRjjqHkwvCO86ik/UHDijLqkYxNwnuzQX3ZSkBnj8rvNvzUkee6teTQ826UZhNYk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789770019; c=relaxed/simple;
	bh=R+i9/brATPXKsaSdkmkTCyFQ838QK4lX8a0P1sm3k98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RJyVD97z0vJW0XiMqz/VyvHOGPDmSrkEs1E94WaLATmkk5MKv9Wz3FOlrqK+eU2+cyEfX+WmphocMyZeytsPH4XwIgIeELUrKofg/4xkYEm6A2u2K/TqWxOPkK5WxJMzPE74nKfg9QcsFEXujhTSXOYqEKXwb6BTtQl5+MgVC+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=Sd1iPN2x; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="Sd1iPN2x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769895;
	bh=R+i9/brATPXKsaSdkmkTCyFQ838QK4lX8a0P1sm3k98=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sd1iPN2xsuqI3TfiNSznl5WgXWpuwyblHdmBYJI2DGpk+Gr5218Upnuw0J1e+c51f
	 JVLrrR7VhjZmpYi6SkYA+O8e13zBFwN/7icM/kymzPD+Q/wOuBXP5KAX7cdyWGvjuJ
	 zO5vFsrG5DwO/rhG/flJebyw1LChsEWbHsbh3P3gUVSaC6nvjwUHbKXsUjbjLi8+7R
	 EK5jzay3UoshP7yWD83xPV/f+jEPn3xiYFFbKxMPRjeQnKMp39oolob8DD3GshUD7S
	 McEz9tJ3xrPJWd/j4mmPMa9mvN6O5P1nF9hO4AyTxzdyoyzXKMglEJqVvHUcvFEfmz
	 iWtc6+2VeLu+g==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 0D3F220127;
	Fri, 18 Sep 2026 22:18:15 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>
Subject: [PATCH 06/11] media: i2c: st,vd55g1: Handle virtual firmware graph endpoints
Date: Fri, 18 Sep 2026 18:17:00 -0400
Message-ID: <20260918221705.323510-7-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918221705.323510-1-pm@petermarshall.ca>
References: <20260918221705.323510-1-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware graph endpoint may be conveyed by a software node from
a module that has not been loaded yet, causing the module to bail out.

v4l2_fwnode_endpoint_alloc_parse() handles a NULL/missing endpoint by
returning -EPROBE_DEFER. Skip our own validation in the device tree
parsing logic and rely on its native error handling.

Clean up the fwnode allocation by handling it inside check_csi_conf().

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 drivers/media/i2c/vd55g1.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 032b76a84638..3e2261a95f2d 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1792,16 +1792,19 @@ static int vd55g1_power_off(struct device *dev)
 	return 0;
 }
 
-static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
-				 struct fwnode_handle *endpoint)
+static int vd55g1_check_csi_conf(struct vd55g1 *sensor)
 {
 	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
+	struct fwnode_handle *fwnode;
 	u8 n_lanes;
 	int ret;
 
-	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);
+	fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(sensor->dev),
+						 0, 0, 0);
+
+	ret = v4l2_fwnode_endpoint_alloc_parse(fwnode, &ep);
 	if (ret)
-		return -EINVAL;
+		goto fwnode;
 
 	/* Check lanes number */
 	n_lanes = ep.bus.mipi_csi2.num_data_lanes;
@@ -1839,6 +1842,9 @@ static int vd55g1_check_csi_conf(struct vd55g1 *sensor,
 done:
 	v4l2_fwnode_endpoint_free(&ep);
 
+fwnode:
+	fwnode_handle_put(fwnode);
+
 	return ret;
 }
 
@@ -1905,18 +1911,9 @@ static int vd55g1_parse_dt_gpios(struct vd55g1 *sensor)
 
 static int vd55g1_parse_dt(struct vd55g1 *sensor)
 {
-	struct fwnode_handle *endpoint;
 	int ret;
 
-	endpoint = fwnode_graph_get_endpoint_by_id(dev_fwnode(sensor->dev),
-						   0, 0, 0);
-	if (!endpoint) {
-		dev_err(sensor->dev, "Endpoint node not found\n");
-		return -EINVAL;
-	}
-
-	ret = vd55g1_check_csi_conf(sensor, endpoint);
-	fwnode_handle_put(endpoint);
+	ret = vd55g1_check_csi_conf(sensor);
 	if (ret)
 		return ret;
 
-- 
2.55.0

