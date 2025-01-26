Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8196B1F91F4;
	Sun, 26 Jan 2025 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737904115; cv=none; b=f8eG6oSkEkE7qdYiHG4kZUPE6zMTlMXDLLQM3WGw/Ubw2KCKtAX/2PLWLEdYz5xDn6McLHJO60PKdpMMTMWsri4HF/D7jzpB4/oeao/2fzHPZPTo3PHQpXQHsjMm9dCErtLXdHDUBAUIDJhibLgUaPP65Kp5kEe99Kh1SVO53dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737904115; c=relaxed/simple;
	bh=m76EXt3CTtkAe1W38UvClZ9FzeDXxZ2aa8LQMrfbEBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LIGU2zJmDJSkxDD2cBnNVZe+2b+piEBTby3NN82ibNQR4zDE58zPiZO4+E2GpoQ639F0XO9iXL3zWS+ORaUBewg3gmQmV6HbcuQQmm7y1qVMZmdugtK/fMCE1/u9GEATPfvcKy0NMjAaTI+w9620o97HM6SBHlfST1QEDUBEuyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUBlvDd4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUBlvDd4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66202C4CEE2;
	Sun, 26 Jan 2025 15:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737904115;
	bh=m76EXt3CTtkAe1W38UvClZ9FzeDXxZ2aa8LQMrfbEBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OUBlvDd4eTbJh7y+DMhugJdYro8/swW1vU0Icmddbk89HVQVXquaV0jQZSfxW8BRV
	 7mfp8duV37kV+011RliRSp4KSm8NNIZjbX03v70wb1CTYK9WQzFo48aKsZXT10/JdX
	 zOxrxwPmenK76T3pW5gael7pH2VXxy77aDM3pMiC6IlwewiSpiKkIGOW7l0MCCn3Yz
	 agMLuveInqCZJeWjzsiJkakt84tNs//ET03Q5Emy+JLosAS+rxb4eht5a9rFJitj0q
	 uE4oPhrw/4iuySr0337f17Cc6SqE84x7jKARGpiE4h2n0L8IMI4SPMBZj3MwO/WDIF
	 P79OpN5uwkL9Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hridesh MG <hridesh699@gmail.com>,
	Kurt Borja <kuurtb@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	jlee@suse.com,
	hdegoede@redhat.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 13/14] platform/x86: acer-wmi: add support for Acer Nitro AN515-58
Date: Sun, 26 Jan 2025 10:08:00 -0500
Message-Id: <20250126150803.962459-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150803.962459-1-sashal@kernel.org>
References: <20250126150803.962459-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Hridesh MG <hridesh699@gmail.com>

[ Upstream commit 549fcf58cf5837d401d0de906093169b05365609 ]

Add predator_v4 quirk for the Acer Nitro AN515-58 to enable fan speed
monitoring and platform_profile handling.

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
Reviewed-by: Kurt Borja <kuurtb@gmail.com>
Link: https://lore.kernel.org/r/20250113-platform_profile-v4-5-23be0dff19f1@gmail.com
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/acer-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index f69916b2eea39..6534f0cdeb2bb 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -583,6 +583,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Nitro AN515-58",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58"),
+		},
+		.driver_data = &quirk_acer_predator_v4,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PH315-53",
-- 
2.39.5

