Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849506;
	b=yeRniIZXH7T6ADaReepsUAP1NEEYei8gKNLoJUKbQLaYUD4a4U0kVr+FNR/677EjfRqZ
	 KfQGl64AwlSvY2k6ZBFXesILHvr8dljMYgnUbMU5wlJnFnHHLhwPhJ1+zk2FqDyE4MctF
	 vBdHqehSj1V1iuGtcrRmzFYgnCQYtk7yVZK49gw/0iCD82tvp6oh32at/AniZ7t5gD22u
	 YIFIYkcbdapedT3Lz791F5sBpcKSaD+CQm6j7F9D/BTU6MO6eFP0ytRGa4XzOY0eDzv+6
	 3F+57Nx7KRR87x9YXZHSd/XJzs7LxBh9ANLsgBxubPzs7WxUvWcuYCybstQdyrZ5lUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y7Ml2BhA/CMPyDRBgPTdQ/lnKCFAMxSxJnPWD3wvhfY=;
	b=qTwAW6bUhbytCKGYveOnzTmjj0Rko/ysH6nMkg5huXUxa/GqxrpOUEd4FD4qg/DCy5Er
	 CHrJS2GcVYJrfgAnn2LN3xHnscOaSPapWAFo5kPB3yUljlVzwXICUUmcURC+3nYju7Y+i
	 kz0rTPYD4SqihrJVcMRH2eP0A6qwqx8SqltQMb+b9U9FtlfF2NnowNClT8LzURmVfuJtA
	 1hKWAzojsPCeCrWbw6RUPxSlLVRV1gxY8eVAX3pIwvFUfL+InPETbyBIcPdMPveagSU4A
	 t8Suuus7SsIHIXPYCTjCkHkDN0kO4DrRuOoc6w8nCzXW7Sk7rrBzYvvwfD4F2611byw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7W3L7KS;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CCE606A330
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 17:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CCE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7W3L7KS
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-372bdb942dbso3302085eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 09:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849505; x=1795454305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y7Ml2BhA/CMPyDRBgPTdQ/lnKCFAMxSxJnPWD3wvhfY=;
        b=x7W3L7KSmaZ8OqpO5MOm6QC2PLVVUrvrzIJYMfIBy5ijKDIolXVYWSXMx+5XlIteQX
         o70iJBJX0Q5Ga8Fts1frUdIvpaeVpryacI9xplFNQPVocPb+Zl5pxVhMW5Fa8hAc9e6i
         f2BpledfebaJjmXX9gBw99R/HLxNhtc0xdrvZkLRHN2VVmrol8f+fMME2twVtPh1w5f/
         btu1iEfA8coutFHTDtSbX0geMaByBfyt7990nXaTVVqzND6LUnNaCLSrRTK83AzrlzZS
         p2u3dPBduCS9O5RIK27VlzQa8zqkiySgCBw6unR+t4CYDnvQes8giPnYnV5W2M+730Ry
         0ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849505; x=1795454305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y7Ml2BhA/CMPyDRBgPTdQ/lnKCFAMxSxJnPWD3wvhfY=;
        b=1vTrNkiENZV3KCtZ0csXFIxQkQr2wLiheMQ8KBgkSKk6ddZ7nRprqQRH95mh88hHv4
         AEpoYSguLihkryV+/yHNhquIeBV5IXOaICBjg+gxoYWJdRPtqazxQb5I8/Nx4V+8BJ5I
         5BXUbNzwUMkhWsG75cHGV2GtiuGCXzGyeWy9PP7zYk1JQ8vYS8fh08t7aJCeSAcOeiHZ
         70DsVsHwJn7zjkFZg+Rbf/o1+g20tM6JaGeNJsBHo+f8xZJxFpYiKKolbKDN3vOGIIOn
         /2z+eA0rZp2AFskjwSPfHVmLTfsJoRmE6qWo2dlegy2Yh4GPTyColV6I0GnH+XMAZMIh
         M6bQ==
X-Forwarded-Encrypted: i=1; AL+hErEUpGFQUPueAiw/HRcr/OmjWYrFDPQdrlk8OQxEXQ3i6GDd0iy7N+uP4U67PghwbaYsD9+1OunJKtYgvrZXXpyTLrin@vger.kernel.org
X-Gm-Message-State: APuU4Z81vSVRh1yfEo3Qk4cF2m5Mnvmfl7b0PCeHcmm5CmVvouqLPWob
	HADW7L4BDOm7xbZKgB3pk9LNbtjADHKDaq3kCriS/2P+3tfjDWwFtbOc
X-Gm-Gg: AZFdTZdlFhjPsvQQ1q3h8iecDE4lRdfYAZ//mVgHeQ2YDHrYe/w7TC4aJ1dNhKkSXFj
	Xk7zL5Hfi7BaKDVw7ua1k2HdvmwYVxWKE5tkeCOH99MdeoxnOYAA/76bBf0y/jxoo0WYL92eWst
	jODWZ4M/b5ctxtP2AUQEVkzitbmasw+indjJXIomGDFhmrx0ePBP6Yu+Puop5bQFKHdPzLqpSpL
	GdCMTRaKis7ZzPpvwts3R2Z+fXBeLE44hxq0XQXONINcYdEnq0/gRSjG8fG3WUhqo8v6XWTpTPk
	V8Yg3cowcB2B7ppRRel8yJRGtdB+U7/Z/WWIO+WAlqqoAOWaR20JHmrVrW2LpNppA+Mcm1PD0fR
	AXpC0/vUugcOQxNGqMNHtWlCNYi0nb/n6jotVhw92l1rcDdgqvOA1Wn8mBLFG5+NDvl0Y1TW5MU
	U/72vmTfPpE/aOgvF/FxNp3TO76bSHnRx846kFkcSBFPWHrZl6txP4R2cD48YJEumnt+mkhK77+
	bRi5/7ev7iWSKANXNPxLBHqGO+xuIXMuWvloKfTTfSeBUtNEMgI/lYA2r+R5CCOo1qKM3cu4kSE
	EgVA+pKnjx4v5qpYxd+rWDZbZ35pxXy89XAb5i7laAVzjqopTGoBf2YyNf803TJlAU5woVqxVIC
	qzO5UBJAdGDNJcBmLo1XuCeBxcrgRAwGNKTxl+gr+Xg/OaYEgQ1XnY1t4HhOqjT/Dbqot9wtmZM
	vR8/cHHp5LW4t1IgAT5kCni458JLFohcxI3bVBst8o0g==
X-Received: by 2002:a05:7300:72cc:b0:372:598d:c0bb with SMTP id 5a478bee46e88-37966e3ad18mr17310894eec.13.1794849505368;
        Mon, 16 Nov 2026 09:18:25 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379559189e8sm36847831eec.11.2026.11.16.09.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:18:24 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: Add V14 G2 ITL to ideapad_dytc_v4_allow_table[]
Date: Mon, 16 Nov 2026 22:48:10 +0530
Message-ID: <20261116171817.21802-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The Lenovo V14 G2 ITL (82KA) uses DYTC version 4 for platform profile
control, so ideapad-laptop currently skips it and logs:

  DYTC_VERSION 4 support may not work. Pass ideapad_laptop.allow_v4_dytc=Y on the kernel commandline to enable

With allow_v4_dytc=Y, platform_profile registers with low-power,
balanced and performance. Each profile reads back after it is set, no
ACPI errors are logged when switching, and the firmware applies it:
with all CPUs busy on AC power, the sustained package power was about
14 W in low-power, 17 W in balanced and 24 W in performance.

Add the V14 G2 ITL to ideapad_dytc_v4_allow_table[].

Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Tested on a V14 G2 ITL (BIOS GGCN55WW) with the 7.0 kernel's
ideapad-laptop and allow_v4_dytc=Y, which takes the same path as this
table entry; the patch itself is build-tested (W=1) on pdx86 for-next.
Package power is the RAPL energy
counter over the last 20 s of a 45 s all-CPU busy loop, on AC, with
60 s of cooldown between profiles. Fn+Q does not switch profiles on
this model.

 drivers/platform/x86/lenovo/ideapad-laptop.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 91a8d11c79c5..ebd4bf6c8798 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1134,6 +1134,13 @@ static const struct dmi_system_id ideapad_dytc_v4_allow_table[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "IdeaPad 5 15ITL05")
 		}
 	},
+	{
+		/* V14 G2 ITL */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "V14 G2 ITL")
+		}
+	},
 	{}
 };
 

base-commit: a362539b42193dcdb17f8fba40031a515c53885c
-- 
2.53.0

