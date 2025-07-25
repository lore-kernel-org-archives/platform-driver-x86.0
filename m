Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B741624E4A8
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 21:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753480391; cv=none; b=dCW2dQfJeGq/SbtEYdw5zPe0VHFpYDm3tXIxR1vJYOEDAYAiMUmaRLPxR3kJ/PET+STlpVRDNh4xX0Vkz9u4/c2xBord2V6Mq6bDhfYpYFUFKluYgFc1kLUgBpwYxTmVwJEXS/pJyGE8jE/fOsVUm9E6GGzfrj2BSRPTNbj4+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753480391; c=relaxed/simple;
	bh=CESo5Zb4P9t90PyRpZiK1Obd9hHUziTXoeR20KOXdzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mOLAxuJOziliGw9GLduMpSZsS7WZ6UI6Cy2z75ToAItCTKi9wUPEjpZMwnJwf1aTWuwMioJ0bAy7KEejYhYCXDRE32SQgXeFrQc4UNkC5eFxizSS3yyqtLrNo3p+PRQE7sMqpe5iJXubLTIe8QCJMKOW10580iGOKOkfsvrjCok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SxiQYIgs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SxiQYIgs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6F5C4CEE7;
	Fri, 25 Jul 2025 21:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753480391;
	bh=CESo5Zb4P9t90PyRpZiK1Obd9hHUziTXoeR20KOXdzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SxiQYIgs+lrNAWjBfVF0VhiSb+OqWMCC7vOMOifGU/um2Lj2UVqYN1y+x7oVDmOli
	 /WHDBYnnjNmWCwcN1ogULffSD/XoQHLdVP7NAGlhhlnFEkgAV7w9fH+mSyU+8O6Jcn
	 DmgREljwV6ifIy4T4SH+51yEOHWp5YnOsLeCI5kWtwrVTg1iZ2UE8sx2F/SX+/tJ5I
	 8ZVarIzit+aQ9PzleTioas/vEH4HQCFDDSH/dawac/0Px/1zo8AY4xU0qek/qCJTIs
	 8+XTab2adKgF17oSwD/je7WVscgPlNPW82HuahMh5dF+2Mmy6yHodZ3XpkqwK19GC7
	 nBb5evb3sbQZQ==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 3/3] platform/x86: int3472: Increase ov08x40 handshake GPIO delay to 45 ms
Date: Fri, 25 Jul 2025 23:52:59 +0200
Message-ID: <20250725215259.402796-4-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250725215259.402796-1-hansg@kernel.org>
References: <20250725215259.402796-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On HP laptops with an ov08x40 sensor the 25 ms delay coming from Intel's
out of tree drivers is not enough. Testing has confirmed that 45 ms does
work.

Add a quirk to the int3472_gpio_map[] to increase the delay to 45 ms to fix
probing of the ov08x40 sensor failing on these laptops.

Note this only impacts laptops which actually use an ov08x40 sensor with
a handshake GPIO.

Link: https://bugzilla.redhat.com/show_bug.cgi?id=2333331
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/intel/int3472/discrete.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 74239ce38805..876bb75d4cf1 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -157,6 +157,13 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.type_to = INT3472_GPIO_TYPE_RESET,
 		.con_id = "enable"
 	},
+	{	/* ov08x40's handshake pin needs a 45 ms delay on some HP laptops */
+		.hid = "OVTI08F4",
+		.type_from = INT3472_GPIO_TYPE_HANDSHAKE,
+		.type_to = INT3472_GPIO_TYPE_HANDSHAKE,
+		.con_id = "dvdd",
+		.enable_time_us = 45 * USEC_PER_MSEC,
+	},
 };
 
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
-- 
2.49.0

