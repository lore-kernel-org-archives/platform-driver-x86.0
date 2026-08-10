Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11D135E926;
	Mon, 10 Aug 2026 04:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786337288; cv=none; b=lwjtf/mWUSjn4HgjIASWKWsXiRVSqM6voxrHRuJa9928xNYB7ewwwhHhKR4+iAihfymoyEgsZj2RDgckft89Wd012RrTuf86FajPaUoWWG0wxxF0FlqbfSjLaj6gpXX/69dbITgBsLdDR1fYSwvISUrr2hfmikmLSOWlkdSuEpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786337288; c=relaxed/simple;
	bh=KV0FyRUemZ8OWLoB6vgwVCYs+bEH/RacwscrbPwV4II=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ZrJJ9MHppWWDRSUjhbQ/Kv0YmebvayA62v4f5+HHuV1da49jvnZH+KwC1XZxvkuwntK9lmtArpxvJqoS5atytwHt/zxDHpGsFIX8j2DWspHwDNX1WdbSOcAJJf5lba5zQjdnRHEZO8k0vk73ZQ1CUOYDCOeuVBvtuEhu/1wu9zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com; spf=pass smtp.mailfrom=rsplwe.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=cIJSK2dh; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rsplwe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="cIJSK2dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1786337277; bh=FNZ3eCshjT+SH98gKX4KVjG/8iY3p5KiutHy2kh0ohQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cIJSK2dhd51OShOcXQj8EvQxmf3M6LFnwbMf64ITjQ5pqLODbR0aJrSjAcvJbaCCl
	 NNbcqP9whYwo6CS7A8VUhnXQVwYN1gGZLDcGaOaxILkR846mD2cpMB8rnwDEgd60K/
	 4xnrIsWUN7X1ULOr05A8RmOAZGAyKoxSKf5hwD+Q=
Received: from kasumi-star ([14.218.70.170])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id BF4AB415; Mon, 10 Aug 2026 12:47:52 +0800
X-QQ-mid: xmsmtpt1786337275txw17houy
Message-ID: <tencent_99E17CF368A7727F66FAC2D2879B63F30A09@qq.com>
X-QQ-XMAILINFO: Nas0IpQ89YT6slZSXi1cIIFAeM5jrWp3YutzwkNcjTbZuzLUWbDNNEwGaB/c2h
	 a4fYNaet6RvVVDas77SohLsuj8Cl/9mCK5h2iMPxhvTZasErr85/JdrtG4E/G/+N6gOtG7G5fCDD
	 dHu2xt3XTfkWIkeFcHZShO6S0RDFJKHHqe8XvNuuR/mlIinsVvolKKwFcdXoZ0JNhUA1GfjivvjD
	 FdkulpiK9B/Y5f47mdt2BW9hgFVshWXDOxom9zhAh540XeiGWWIwrKygsW0/j1Sz/lfZX2hy1KSF
	 scuvMbA1HefBgCpmFsNUH0ZM2JJ59dIRS1dwmbF3TNHAWpvZaEwW+g03OZJSD8j+kFk3YKufzS6T
	 th7I+R9xJCaM4lNy/x4iilwdBTXZrMbXcjikjRWS/kzfCjmWgL1NmmiRrH00arBHUO1RSjEhapeA
	 r3HPPqIe7lN8O/OZkmcMgyfpanRChqT9eA3DBEnY9elS+dqAuA3e3+B9u5yyYU8oAo9kQ1FrgT0c
	 RqAxYwyB9P+WHfiZkbKSrvF858unZjCVOz9KfQTBjtCOeGPjA40Vg4w6RL0X83geWpPsCgYbE/rU
	 lMp8suw2I51xZKP46T0u6Sb+tHQCPdVChS1T+/AMsV04EhfP1bORT79soanSyeFc7tmOfkR117iI
	 ShuXJIccXfgnXpfkgdCIaAyBohSoghZvHFsPdIrJHrdKPQqa3BD83UNNq129p6nAj+7x03CvHkDM
	 stNdocwX621Zz4BBVDWapb9ohM0F1pfpTomWwhbzwhwGEMTrngfxXhN2bRAZxktV8A3TcE5dZTYn
	 Zzt8mP/lO9Sk1QrMNP81AOWkaUO5Dc2luShMpqDCcl8xK0X7MTc868nxj9U1t+XWp2Ry0ucsMpoS
	 G/oDrWm0hR5HGtuqBl6gLOgKDLKONeHs1o4HErIPCusJa8sKXhYXwrt++SoRUCdoVONJvm6vTFji
	 j8SFlvTaMqFSjYNiXwqZjaB7xYTtStR4RNHBWgQI9pUtRe26BXM0PZ1iUctb9Uk02SVQvAHh//CG
	 bqOjh8w1kYQYNhQ2iaLDzcBf5YykghhXUEKfmxrT1IvxIkWm5k6sKlNGNFgnf71NATERYejswjcS
	 wl6H/vj4d6oZ4EkDG5+JKQg0tbVEF5WKCS76OiagvZ5zjVKro=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Rsplwe <i@rsplwe.com>
To: ilpo.jarvinen@linux.intel.com
Cc: hansg@kernel.org,
	W_Armin@gmx.de,
	qby140326@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rsplwe <i@rsplwe.com>
Subject: [PATCH 0/2] platform/x86: bitland-mifs-wmi: Add device controls and MRID6 quirks
Date: Mon, 10 Aug 2026 12:47:49 +0800
X-OQ-MSGID: <20260810044751.43045-4-i@rsplwe.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810044751.43045-1-i@rsplwe.com>
References: <20260810044751.43045-1-i@rsplwe.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds sysfs control support for ambient light, Fn key lock, and touchpad lock, and applies quirks for MECHREVO MRID6 devices.

Rsplwe (2):
  platform/x86: bitland-mifs-wmi: Add sysfs controls for device status
  platform/x86: bitland-mifs-wmi: Add quirk support for MECHREVO MRID6

 .../wmi/devices/bitland-mifs-wmi.rst          |   4 +
 drivers/platform/x86/bitland-mifs-wmi.c       | 228 +++++++++++++++++-
 2 files changed, 225 insertions(+), 7 deletions(-)

-- 
2.55.0

