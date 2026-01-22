Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51F035B658
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097328; cv=none; b=oUTch2xaY2MISpEaN7cKxlI/CpSH03WlT6ZsZyWcLCIxLBxu/0B24i7tzrWMhD7F4GIjwJfkbSPsiIxuepOTmDj2qQaJcoh0sh1jk4eKOQP6zYVjZ/DmE7uJbqNq5rMZAIWQTw5fsRBvZHM3wwdDhgIaDTt1/oBJgHMIlWJPUIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097328; c=relaxed/simple;
	bh=pITSoNE3VQ33XxIaYm2AgBt4ZThPk06LRfJuwhvwh/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YNVdXb8pF/9p7unxZBPKqA3/j1paz0Epyzk0zUkX7cJeJLRYDWxUwiAn8jP+5mzEI2h3g4J/4v6NCdJtQxbfB4mY5xb6GSbEbbmuf0Hrilugpobj1kaECmWgB0tfkEwb+yByLUTeiH7zVxRaYV8j/0OQmVhxQegA/SPI5WtSHxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgcetXa7; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgcetXa7"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b71557299dso1535452eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 07:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097319; x=1769702119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKtMTSVYxonSlbpUyIW/ic7Xfc0BNVbSgxoEnuNp57U=;
        b=PgcetXa7/UbUvlCl5xrRn2P0afO9xNMimnoaK2rZe/taRFWKcnM4Om6dTp1wKm+q0a
         mhk9xgYkHfw9G9MqzjoZgX2iCZ8YXCxifCLT2B4jEqLsEZXfBa1I8OA36YXOG4y3WIw6
         +7AQ4mN03yuctxeBDwra0W5ynr0Jxf2Cv4QCxOJ59PnnEw+RrXPTLPfbvMajA9n/G2vo
         Rg1I/DWIID4Z/vZBA+8DYHFb5Y0eZFKRx6Us9RcU9jobUO4nssxxdXX0ZdKWMKA4FtmC
         Cr2tMR+BddISbcQJxInHLFsxX6qGXkRefGcYXN8BxSbJ/lxtwbysfU8i5NWedE1PWv+l
         EPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097319; x=1769702119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SKtMTSVYxonSlbpUyIW/ic7Xfc0BNVbSgxoEnuNp57U=;
        b=pYXE2v/fnJ3E6m+PLdH6p2KR1FhmPFI9oSmhFjOmvtGq6rBbRm1gPcQ5Xf7ajmSZi5
         nKBV6HXewMLYQyKsEWEkyko78RjfOzpb+DKzjGUY1irIfwfy4lK+KNO9csjxCL+2QF8s
         YS5rmUftL+E8Fyn4zDdpv2qgktTB0CjJUug0M9KXPZXOjzuk/IfrwLGSXInwQ/Tq548H
         M+6jq5KcRMFcCsMspMYLE+ipXtrFy4B7r9iEkKQrWouAanW5V2oNQ9kNkc5BmnkieQ5G
         uz/TSe+SWPmWodojz02YXfm28yJhfVOkRYN45AuW8GdyqikF0dEe8snEj++ipc+xgONK
         lwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1yu7anldbmMHOttPbPRlQKzigTz1VIMBOny1wDVK6UXa0UpV3IcOdrzqX0Id6yv1BShJSmoa2p6z3/DWfXKVot1tK@vger.kernel.org
X-Gm-Message-State: AOJu0YzSCWc6Ib+3ox4aStfcs64XR8C5/jx32pYSof7Z/83wx/P0YB+s
	rpZDy9HxGJGouM/TWY1PD5q7SwGRM7ByjZUcFON37xguK4ZUxjKVMjzj
X-Gm-Gg: AZuq6aIW3fSpCklajC4TawSETYGLUROKcVguciKu52qDV9dioxq7Z4nAoEF8AkAFS+1
	4SeilNo3uGhI+Tymtu3c0UGqBw0Ru3uV2XTa/tN3CvI7ivgB5FYLASfVPmi0oNSDcsvjizuGTT4
	54vImVQzRtO+Xgx2o0Cx+Fag1t5ayZNoP4MuLyWXU3SdPK2pLrtPsWnLmRtpL7dVFEMqJh9P/d/
	hq70xqzobAUh0dCF88yK+p6BkPsNGFWF8oDfpb6aQm9bLi8EfVMRAfw8gpVup3hkWrgit/sNQrB
	UnMeY5v1p+dwAKxn5rNr64IkwQHgwmVEpd7XZhrB49ThWi4pt0sKbPh+KOKh4Gvwnv5r2LoqcMF
	iKSQiidI60CxuOHMnUfDqAJ1tMXkhrNMnqmwA6sKxlQsiFmNrgk+dFTBA1bAFZflvEKOE9KLyYk
	vFaJXRkbbkpWivhQvlwEQa4qf6CRBUXeRNMPOKiekaKy3SisU9l7YU
X-Received: by 2002:a05:7300:1908:b0:2ae:5bb5:5732 with SMTP id 5a478bee46e88-2b6b4e97901mr13128772eec.29.1769097318588;
        Thu, 22 Jan 2026 07:55:18 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:18 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: rafael@kernel.org,
	dmitry.torokhov@gmail.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-acpi@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	550230171hxy@gmail.com
Subject: [PATCH v2 2/4] Input: i8042: Add quirks for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 23:54:59 +0800
Message-ID: <20260122155501.376199-3-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122155501.376199-1-550230171hxy@gmail.com>
References: <20260122155501.376199-1-550230171hxy@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MECHREVO Wujie 15X Pro requires several i8042 quirks to function
correctly. Specifically, NOMUX, RESET_ALWAYS, NOLOOP, and NOPNP are
needed to ensure the keyboard and touchpad work reliably.

Signed-off-by: gongqi <550230171hxy@gmail.com>
---
 drivers/input/serio/i8042-acpipnpio.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
index 654771275ce87..4cd09560c5bfb 100644
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1176,6 +1176,13 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
 		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
 					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
+		},
+		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
+					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
+	},
 	/*
 	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
 	 * after suspend fixable with the forcenorestore quirk.
-- 
2.43.0

