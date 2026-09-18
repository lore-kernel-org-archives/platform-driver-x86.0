Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F758396561;
	Fri, 18 Sep 2026 22:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769997; cv=none; b=sRgOz2HckZ3Swe9x595sWxCILDY2YfYWUksRFIgCYYtB7bKHDjtijFJd++hscsDSvx9Za1TiDNMt0JrSV2ly97KhTo2TkDZ4Yyw5rD3hFP8XdYVqOm7KJ4yhxi4feW89xOM6GCWQwr2I+AmPmI1vPn1L9sPe6rkneL01Ku/t5PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769997; c=relaxed/simple;
	bh=6VrW9DFrFRXl1bfk+uu1kJXC/tge1zYD3NN+OY9Jnqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPMbD2nnFZr+FXiyfxf3+LLT/xq+2Wk74D2P7l2ZMAGsiHN0eb9iiV3rNYvDEghPl2VdN2/fsYSrAuUCNSpJ67cZtHs0Qw0PjyF2EgHwp5lkFTrf5KzMr///hvbXVoa/WY6iyVwRaQVyF2H4/FsYgfrZZ1vfy70prZiR4y6oc+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=ZAsEQZCu; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="ZAsEQZCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769893;
	bh=6VrW9DFrFRXl1bfk+uu1kJXC/tge1zYD3NN+OY9Jnqw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAsEQZCukAycWbrhQVG856CRqYCCNOLoSnXv2iefb7PpLtOtaG5FKwvlk0COA0+cG
	 pR/Cj1OdXo1c/MrNGQybPiSV2g2ZxoJbNbAbujXNhq7gpupvtDt3EcnUlO2LUex0Dt
	 RbjZ0GYb3qKgKlIGa2hzj51h5BWoD33tYgaw9ZrsO9yVDw6H979jcQmw1/746jXROw
	 G1sDhY7svCvUbLvbG6f9PAIqct2KPnKyzmJRX/WoyV8hbXlNZH+onOJAyNtt6RrxvD
	 VfyJXtjRMp5XLkQDUfZEuqwIFqnsnGDjKX7GXzBCRo6jSD2RtUPGMUaU1w9mGOFDvc
	 QGtoyZHeeSB9w==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 5BFBB20126;
	Fri, 18 Sep 2026 22:18:13 +0000 (UTC)
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
Subject: [PATCH 05/11] media: i2c: st-vd55g1: Default to illuminator on GPIO 1
Date: Fri, 18 Sep 2026 18:16:59 -0400
Message-ID: <20260918221705.323510-6-pm@petermarshall.ca>
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

Sensors enumerated through a bus at runtime instead of a device tree may
not have any GPIO pins detected. Assume the illuminator is connected to
GPIO 1.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 drivers/media/i2c/vd55g1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 22b1497e8851..032b76a84638 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1895,6 +1895,11 @@ static int vd55g1_parse_dt_gpios(struct vd55g1 *sensor)
 		set_bit(led_gpios[i], &sensor->ext_leds_mask);
 	}
 
+	if (nb_gpios_leds == 0) {
+		sensor->gpios[1] = VD55G1_GPIO_MODE_STROBE;
+		set_bit(1, &sensor->ext_leds_mask);
+	}
+
 	return 0;
 }
 
-- 
2.55.0

