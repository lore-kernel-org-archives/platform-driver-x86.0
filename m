Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975947;
	b=SgSO+TzUqqpfCWkEUpELBR5VyWD+pwdcNl+1SXyTrpyoXrqcsfSY4phyXmEc0TffbvXq
	 Sm7EUgyMZo8xY8fDOgycgWxaGNX1k3z8PVoKl53Uvoxex1sPPgwk/Mb8y98z2D+XGHgu2
	 zPPYRa+YI7wbLeUQ0F/nVOhVTMl/yQ+6cZkbvNRBOfl8O1Rm1v29Q6Yv6AILHtASRchZl
	 1L9eEz2/+yg7rox1SXVVZcj5Q8RLXKf2xd3M1oasyPR6uaKQ0nnNwyf/svYqUcXq9sIoV
	 GpMtWPsr2jbwXHnPAN7/wQozmm1LYgaqbKfSNUJFOh3fF5fwSSwvlWp50In61oUpJGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2QLASSGa3v9K7rXAHspKjve668de311Ix/B5wkH5KLQ=;
	b=xSff6rNZ9X2uEJN3i+042WXyfeEw+IuDstCwfRpO1TL17TsBit91hxKG5/Jg4s9ubhmW
	 EqZ5WZjTiFdyZsQ3rWxWqZ84cs3/5M93TViWiWtCIP6XUnrQvWN/fxzytTQ1genYRqHCf
	 9MBFPqMqF77jrxyDQcyGN+BH5pY1yph8Go0vcLR7PdjqbXnGmAdFSxdCiCt+TWwFKCphF
	 4h/Q32sz+9aDQfzRsqAOt14VCtsVA9EvXokeHIle/S900uKEmjVyuckjzaNLnz+zjEwOz
	 a4rdEwzwPP9v3ZILV3OjS4ilbvUMKIOpprO5+AH2aJgPk6nUBMi37hcnW7ndD9avmIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vb+PrztR;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DDF606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DDF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vb+PrztR
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eddafe648aso2583565ad.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975946; x=1795580746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2QLASSGa3v9K7rXAHspKjve668de311Ix/B5wkH5KLQ=;
        b=vb+PrztRFy2++IICInYZ+NkGVJ/AdPl0KECE88Z5N61mz9b87jB/BKFWru3vw442Pc
         FcgqCb33OiQJkmn5aIN8GnuxadLLa6at6AWtHSi+lC02qrNBYbewxRe9mMZDXhHoNddW
         ztw3fAHymq7M9fKISacNBvbaDoeymxtJYYV9Re9d+oZS0ehYFARdrEGNDja0pNn1dvRK
         1rUskH0fJnDcf+wCUOuqCczl/c6yv5Fnr1+uGyTRn3U6gkOpa9R1x1O5wpeGgtB62K1O
         nS44kXnZokwEpVeYYZHJeJia/m6bGXHY4PqaGjPWWB6GHhMjbqqB71S88/s6MyXH//hd
         Xyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975946; x=1795580746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2QLASSGa3v9K7rXAHspKjve668de311Ix/B5wkH5KLQ=;
        b=f5GMte4bzY8FpXBHW3P7IOb2v3V8JWFPXUuvJskaxFAf/5zjw+6vN7wG5LGgbNv5qt
         rQVjEYwc7Qfg11M2LRz1qWWA+xGXE5Fl5HU5h82Pi1o2n/gRhCAEyxtQ0OQGKgzqtFWO
         GPABDY5pDqlpXGSKysnOXQsOm8Ss4fpXqosubViAUxmfnTrUeDOx/mvxwuPa+w0nuqmt
         fbCJ3Soljyh8kLikBPI1JLoaZ7rmsoBSJsweZzmXzKPSpOuQ4eWMfeNIHN3zhFmE3JkE
         0TPm7QjWsxa4bCg4fmunhZyHtWj10SfMKddlxeCGB5OzNCxCHbyGnB8ffDSlkwTNdBws
         SGRQ==
X-Gm-Message-State: APuU4Z+HWt9pB5J7iUCtvIq7yGnlz7klK/P8TeeKNaRD+1jjT6kx1hdi
	io/vSoIG4N1zJi8gk267q33ZKGma7cIbzz2W+K5LbOMFXELWb3is1TF2Fh2yEA==
X-Gm-Gg: AZFdTZfNO7Xg+yJ/RWHD/By+/fuI2XI5iiddr8CIrNNJ/dVpWiAMpjzjG5d/iqfJ9ay
	95lWdHBweWx/mEwfVW08M3mXkBHivbM+z8A75zN7wp/Y+IVO7MsoDoBHGB5NAexqHfjsQJyLwXk
	gNJRAku+hc8tvxAR05uCGxTLCSVgDGED8U9K81A2awU8/aK+01ocwFc4z2W8XMgIO+T4oC07z2q
	Hpp4IPIi+/sTe2BqRRRnkuRZGdY49pRAIZRGmJvaJQC6FlqYaFygUELAYRDTS0wcitfok/c2FbR
	MQ0Bw3kAHjVCPsvkF8Tm3upkvNbIMDAxt7XI/pVvYoHfYWhQweUqXCa1Du1AnmmtOdsFZ54kI2Y
	8yIWLg0k/eXw+lVLHKgTz2N6g7dOTjvfArclG7g/XBg1bzKZNEwwc4aAnmQp0oSWTyTi11p2A3S
	MAcKNBJPU712Dej0+Im0GX8gXymqvsQypWOP/+6s3e6MMzjS5bQR1KoCnR5DnFwlQuBjnfFmPmq
	kucxzXmE+Xz3qkjWOlBaa1tUhRtyPrPSwTJsaBvGtBnrf0wHb0ijqGuTX7Ncs2UTczby0WFGCVJ
	iI+gHzgT6trVAkUpKegLcGLwSa7WPfeAcbuzupmApos/OkuyUqoVce8OcTeNmp39sxYHZjFej5M
	+7dsp3kgvEOv62y4Ba3XPEHJOqVnNWWpUd+YYuvt4o7Ha719vshbGYQuJyCQd6LGDUd2A3hqnna
	9Wqs4Pl+6gbUZrmZSCKxo4vwGv
X-Received: by 2002:a17:903:2b0d:b0:2eb:3599:aa2a with SMTP id d9443c01a7336-2eff757c9c0mr14641275ad.56.1794975945904;
        Tue, 17 Nov 2026 20:25:45 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:45 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 01/16] platform/x86: dell-smbios: Only allow unprivileged reads of whitelisted tokens
Date: Tue, 17 Nov 2026 20:25:23 -0800
Message-ID: <2c587b6ed77f8d66c16dcea3aaa6e4aa541253a2.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794975827.git.rosenp@gmail.com>
References: <cover.1794975827.git.rosenp@gmail.com>
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

The WSMT tokens are whitelisted without a capability so that userspace
can find out whether WMI has to be used instead of SMM. The whitelist
check does not look at the call class though, so the entry applies to
CLASS_TOKEN_WRITE as well as CLASS_TOKEN_READ.

/dev/wmi/dell-smbios is mode 0444 and the ioctl only needs a read-only
open, so any local user can write an arbitrary value to the WSMT token
location and change the BIOS setting.

Only let capability-free whitelist entries match token reads. Writes
fall through to the call whitelist, which requires CAP_SYS_ADMIN.

Fixes: 1f8543a5d602 ("platform/x86: dell-smbios: Add filtering support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index c8e93c12c445..d98e1fb1deef 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -255,6 +255,10 @@ int dell_smbios_call_filter(struct device *d,
 			if (t < token_whitelist[i].min ||
 			    t > token_whitelist[i].max)
 				continue;
+			/* tokens needing no capability may only be read */
+			if (!token_whitelist[i].need_capability &&
+			    buffer->cmd_class != CLASS_TOKEN_READ)
+				continue;
 			if (!token_whitelist[i].need_capability ||
 			    capable(token_whitelist[i].need_capability)) {
 				dev_dbg(d, "whitelisted token: %x\n", t);
-- 
2.56.1

