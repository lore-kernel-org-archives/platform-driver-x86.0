Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873335;
	b=izKPZwvvi9xSI3MZJMdeUhyZx4XD0UfQfT7hRK+ZuMeItqgOPUTwQGzcjrK2qVhMGG+q
	 ZYcNu2ihLDDyxuqYIcdStvKEWhBCDRwLT3AjW3BLCykyG7O7zmTTgvjlUXaVQ2proYejC
	 fqD1JdW/268QVTgAZSpYjeg86Bk18OIJC21ELCuYVZXtMecj2Y6ttD4aUPLgHX93XnKuP
	 oN6ANO2x0pB0Sl7B5XlIjbCMI+VrnYn+QMN0VM9ywlbnam38uYs1Lc3fCibR/vV6tlSTy
	 MHAt0iPY6hVLLmi47GGIe90WZohubYE6hgDPMFZCBEW4hPA25K9jy9cgoflFAn78cRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IGGQnCdGLk1tEXQbTKFqSACscsLhaosl2Ecc5g33iV0=;
	b=JFVFUODauRRcxwT3V0UL1JlcIJB1PTl9ynzZ+14NqBDz3cUzoSXFLu+bgxEkh098OKrE
	 ORiHzxmI5i93zkqeQ0t00/jAix3AUV3LxGq6fX0PA7KX12msbvL3nHdJ/VQOM9oKiAkrb
	 I2Vr8pmsGmMRbKGtssgHzCOzd3K6LligV3JGU2vl9AVuGWqRcBRbEoJhQImwvbfrS0ifU
	 jskoXJQOf5OpPDX2qXDOWmukBmqnc8CasWR+/6/et1f52Kra4kGlT3LBQXQ8MzmCb/Yj0
	 uaxqVWYijNVeIzcvQawsFFTsHs7IZTdOu66S2QSyIGTB6XLFmarAKB1NEFBu6qzsohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c3pIMVlx;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4798606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4798606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c3pIMVlx
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f6295304dso3447724eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873334; x=1795478134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGGQnCdGLk1tEXQbTKFqSACscsLhaosl2Ecc5g33iV0=;
        b=c3pIMVlxStQE2pypEAsHlFNBdSOHT6YDlOo/+Utqs03q55fIIZa62LYgvCZLj6PWFg
         Kv6U3CFrmDXq7aZvwYVmKEZTQ1fRhUGMWYax+3SqgUhTneupClmiSQzfNoUJDJc4nIkj
         VZOZayHVAoUGWXvLdY6WmzIFyDoyJYLHk6pLSSFGJEx3qK4UEHNdEjlxafHW5t/0FwMS
         ppcu0lWtMr+be63Fb9xW6eBVaeNZaXLBwbQzqZcrPqSRF637PhEEHqg15lQZL3oxJ9p3
         akHtEIk1qwg9YekV7kJQdJY8BuvmadwM1kTdTi5e0gSFWrmeFoogz1S1nSf0WG1JVpZe
         rRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873334; x=1795478134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGGQnCdGLk1tEXQbTKFqSACscsLhaosl2Ecc5g33iV0=;
        b=WwK/zGAce+ZSUfu5sjeYUdKZxBUUtZo2fwcMh+v5pdLv57ZLijz6lmg1kFEcC7AdQM
         03Ymq9MGTrdufgK7ND2d+Snmf+BRLC0Me4Q6MjbiaCyYKpvcYnvPr/Jgjt3YniyuuXt3
         BJJGBq9CPZw8UKtMT9eLpXn1u+N+96svxlHBt6qz3Lem8zeAZWosg4s6TN+iPrV8Y1E9
         veQh4A5N0/ywOGHvGNaRB6z8C3nmBebQ5KZmIo71GlcfAc/SJMMm7vsqvqtmenECMAbf
         sTsd2U63oK1Wy1H81TlFEJAw32fxpJHacqAknV3f4CP/1vth09NuJs0R6a2bWmQ3cQN4
         OjTg==
X-Gm-Message-State: APuU4Z/2VIJUnEgJegdhpRCDKkxzaOV8/YfLJvr12+y+9mu1yJRwyAf8
	MzDZ/1aMyRRpRDZSNo1zaTYIk0aEpIrDqxL+qXLRip2DgrnRadMZbvxs4SCBGg==
X-Gm-Gg: AZFdTZeY+iCVf1jePLxbngmVPt+u/i4xGu4+r90h2nwEmyz7IAOLtrq+6Wd7xdMp0Qx
	UHMvEBRhNKkMNgwbwr0ehidfK0vmvKF/PlO2xhC+5pAxK0QgZ5TsMUSH9iRgsXo7o33CNHS9u4x
	yIBRKi/FCbBcmHt+ecVXsWMsa+VP+yQ9FsHYjRBH9qHVt2uoBKdZCbsW5gGDOM6+tveVXF7PCQa
	2KpW0YbFDr0pc9XHLBAJWBj8uUDZT8edNcPEy5Guv/vSkA+UCDHMlhYwaG3wlXS9YhGa/faavQS
	hqJ2SxUBh8DZA5g6+g0qdqMCrBW7DBFgEecNObS3vSXV4K4exMYefSmlwJH7nDwzPwe1r01xxRz
	MG5Eyb8Hdu51hTald0CS2zQH/MASj67bv8t4ENz/gKAso8DLIlVewTEPCbaY8wNOumQMMzlWpNU
	7dUA6YoTNTPA+5ApVhoGzs94XMU18tSQdBcd9zy63dZMH5TqzFTQtpcnQEDx/KUn5ZdFDn38jz6
	Bea3WfG9nHk2Gs+T2W/TU1cIwKtG3GtvcJisqpkgURxlWGCSh+r+SUZWkCkEgoc5sh0AvB87FXb
	cKLcrKyrDlPhAHoBaFCQrOYf8L0iR2KcebOrSXVWZX65q6qo6/ycbXzY2TzOhD8tIAosAzQkwXR
	dT4WwCZ++5iud0mz5XdQ8L7CcknpEuWSNbc/uPR4xkuVG2zTxzX5HDWcuVzRu0mGSweqSETwtYH
	HvHw==
X-Received: by 2002:a05:7301:1285:b0:375:dc5b:4400 with SMTP id 5a478bee46e88-379633723abmr16572617eec.1.1794873333929;
        Mon, 16 Nov 2026 15:55:33 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:33 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 14/16] platform/x86: dell-smbios: Suppress bind attributes of the platform driver
Date: Mon, 16 Nov 2026 15:54:58 -0800
Message-ID: <4bab808a5b215aa5e7092e75d5e8dc105d602315.1794871007.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794871007.git.rosenp@gmail.com>
References: <cover.1794871007.git.rosenp@gmail.com>
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

The dell-smbios platform driver has no probe or remove callbacks. It
only exists so the platform devices created by the module have a
driver, and binding or unbinding them by hand does nothing useful while
the rest of the module keeps using them.

Hide the bind and unbind files.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index 9105154fbb92..8f48a8c4b9fc 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -524,6 +524,7 @@ static struct attribute_group smbios_attribute_group = {
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = "dell-smbios",
+		.suppress_bind_attrs = true,
 	},
 };
 
-- 
2.56.1

