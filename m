Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873329;
	b=eoll/qy9y2nKDY9F5rS4aoGEMY+hnilFzHxG9b7Wi9jKcp7fFxqhpb+1Cx2TQUkkYXnv
	 DARl7KkeBL5MDActuRZpSEivgQMkmGGcxQ6RhcC7UM6TTQdSEGWq6kO+LPe2xcetIVOl4
	 zmK4Xv0qLjdQ74WGlZ47HvKLaZk/5jndRSf03fUzf6kcXTqlmp70hAcx+ySDjTzhliEm5
	 JK2qIXlL4WS5fe5MF2qNtJgVPprh5jROn6o/68Wz+U6VKnlwxXz3SGy1hVfYzoJpn/v31
	 4mTP0FUj91B7S8jDGfEtZhZ9UDNrwc0NjjLKQgXV5RP0ThgXPI0YmhK64QHmMkYU6FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/TF893wmZr/16BsSIkBX/d9aTkd9UKZnzUtb9EAvAws=;
	b=4Qe933cd8DtopjPXBYcyPifl0l1aJwyoLBR7/L2IIx93o32P6jOyNIxYqt2M1m/+KefQ
	 PVb87Uf/gB3Wg4CzYk0I/E0bxupPhHp/XmqcAzVX5uYA4Ecuv0Mp6Vmm1DuHDY+DG36yj
	 3+3SUF7ENT1FxbnTHho8lD2lmk7CA+4nGGR7dKILzxCLv3OTDCcinuHRVsZ8qL8Wju2SK
	 UW3PBH5P3Nqn34VXrD/TyKhJnbuPacnnFK5edjll7zeFxw6dxphTEIYAKRpoosO0Pd2Ul
	 Mvn1CbBOfweMOfqWZRZUkpMcDqiJ4xZQS6wps9mSm27YPVWfZmajoHyW/X7CQ7aIrOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="BSQ//MG9";
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D20606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09D20606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BSQ//MG9
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so5926709eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873328; x=1795478128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TF893wmZr/16BsSIkBX/d9aTkd9UKZnzUtb9EAvAws=;
        b=BSQ//MG9ey3CrRfrhuPgu8jJMdrPJjevo/PC2v3DPQ2ZLk8SNqjvcAAjneVSNMj4l7
         8UeUk7XAs9RMkSJ12Oi+GBZxD3BATtc+twRlTmdVpxp+d5WNMgjjpFlAINH0ihTYg2QG
         4G3SOGRkRG3pdNm307yWzbR5tcQ875lKfeA7+AJuclScltd4mTfIIQXi6x4rkwsQTooT
         SiATrDb2EjkYsy/gnB72bJsG4qyPdBt9QKbzWNSnjfnxCu5rpE+TL4nT1MY3diBSurgU
         1SBkPkffqlA31RobRbbNlS2xkUSk0kplfcdHmIAYt2jc00wmOW4wHsWnZwfb3/yErvcX
         UbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873328; x=1795478128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TF893wmZr/16BsSIkBX/d9aTkd9UKZnzUtb9EAvAws=;
        b=bwev23EwKWGZtZKRBcsW3NQ2UiJyfKIAzTc0e0Ipg2WW6IjQlwNpHahyELBiaoHn1v
         +vGIP8I8jg+IUYQ0P5x1AJ5y/OZT5CebEa2MtctgdLJQYzBA/dC+HXJ8qsqABfD9N0kO
         GRTkcN1aU5MVHW4pHQEKqZQg4s3Ah7pJU25DJgO1ncL3wPidHYyXCpTtOT9+vYRMog9F
         3rO5uu+pVAbGBz9DbuSL06x1dLD8zXr4WEzuATe5jdyy7wLQgcBZWRwAssR1onc9B5zS
         HmFD9tym+lXskGArn4g/mRcA/gvUHnzxMN2kTWTXq3gNexO9XIdi1YhW9iAtSqVldVid
         gr+Q==
X-Gm-Message-State: APuU4Z8Kr/DAtbODmO1lpRP1LZmCNpJUmwP3sLFK0hWi6DKUoFUIMoEJ
	P1WZMLOcEBLzfQDXVQMSITJy+w1uA0ZfoN9rhCsXmmU7T41nxX1Cz4Cn
X-Gm-Gg: AYBFou22JfgKJP6Ux4amN9YJGjm8imeoIHj1dd3mLKDIKsF7bwuIwX+jiMhyILl2cSK
	fR3u7/N/SlnaIrU+pJKG6DRvf2bZAu7sVgp04pLeEQfmd8B9rMxWSw1DGhDiexddDPXkv6e48at
	uYLHOnmPFi0XWdohda8xlL9sHggtMNVf2wRNE1s1QKcMZJPNZe9iD6I3Uygpydl65ckqUwH32sm
	2xKEY2t+KNf9g8eorwgxFnAhox2GA5st4RLlWjXoqZnDyZmbhCLkhwW7H0r7SKrfffVNpe7HU39
	TjJkqLiqdINW9vQ/MjdtVdnzCgtxujbFfaCLllF22MdLHGciDaJaHSx5MWsV/UCk5rqorYdGvYb
	fmiYaPOoKAtlwFmaGb+kQ19yv8tVAjbdU6PKwCCDPRnIG6tajFLVXvZbD6qAvxXwL64kQsK4PEo
	VgRhjNU5pPNtd44yWkLNcPTMeOcM2crHVQeVnQOx/c6726ZLFHCcW4vCVEJxypjfiWKolD/izhc
	XPPqG+cygqYCCIYyhwzJ7OMcMDRcwH6IqfgOsjOGehIgx1H49GwrJxoNaxtvxR+dhT+B7Tcjstm
	7TIKTwcxmqWWKePSx+nJz7O2sgpQJtbduQMiTSpWm1EjUwq9Dj8ClkJJ0EORV20Qb3ASZbQaNat
	j7ibEVJ0zg97WDag/PwHAqbaKTaxvU6YPcwGaOt1TWC7jjMb802FPRs7nF2pD0tAdw9TO9czhJf
	dxNi8=
X-Received: by 2002:a05:693c:83d2:10b0:377:2663:5fa4 with SMTP id 5a478bee46e88-3796676b191mr13892050eec.20.1794873328218;
        Mon, 16 Nov 2026 15:55:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:27 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 10/16] platform/x86: dell-smbios-wmi: Reject buffer sizes too small for a call
Date: Mon, 16 Nov 2026 15:54:54 -0800
Message-ID: <8672f36fae992493d364f141bc29e4376e51a1fe.1794871007.git.rosenp@gmail.com>
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

The WMI buffer size comes from the firmware descriptor and is not
checked. dell_smbios_wmi_call() clears the part of the buffer past the
standard call structure with

	difference = priv->req_buf_size - sizeof(u64) - size;

which wraps around if the firmware reports less than
sizeof(struct calling_interface_buffer), and the following memset()
runs far past the buffer.

Refuse to probe if the buffer cannot hold a call.

Fixes: 1a258e670434 ("platform/x86: dell-smbios-wmi: Add new WMI dispatcher driver")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
index e126fb4f048e..ffc8bc87a86d 100644
--- a/drivers/platform/x86/dell/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
@@ -233,6 +233,11 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev, const void *context)
 	if (!dell_wmi_get_size(&buffer_size))
 		return -EPROBE_DEFER;
 
+	if (buffer_size < sizeof(struct calling_interface_buffer)) {
+		dev_err(&wdev->dev, "WMI buffer size %u is too small\n", buffer_size);
+		return -EINVAL;
+	}
+
 	priv->req_buf_size = buffer_size;
 
 	/* some SMBIOS calls fail unless BIOS contains hotfix */
-- 
2.56.1

