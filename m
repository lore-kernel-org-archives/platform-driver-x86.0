Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637104;
	b=H0KmSCMmh3LW0XD9Z7Ia3AD7+TqGXGSxuoKsqcVKjBe/denrvA4sZk0w7cj5XCEgB171
	 rYhZ1PZbvUPiBH9C5YBPeM2Bg+cjFZrduSQAm9P21GI6iZpKfjeuqU+58EAL0lVn5KsPV
	 4ZH18QvGrpxFOG6XXlBU2l1q+0O2fMvJVxr50eWRuj1ZvSVvdwr+rLvPK2rQBO9k5jnEr
	 67SdzV8fSckF2bixjk3OW/LJ5wcXSOu0wDlLoQA8kpn9dQaE/LdM7Hv+CF/r9LSry8sHI
	 4u0w+f91QMn1vEAHaeJmlv0uSBpX88mnZHJDfBJ+uff/pweNgr69uAA5yygorPfZx7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/TclRQyw8P3XuUaC5KJPN4mF+Cw73WG2hCQ7XKkVl9s=;
	b=cK1C79qznve8hKFOEZx9pfFUCirljj+xOAgTMOJ+DzeW8jQGkLYdLsOCAU2iGXH2hxpb
	 UPYpGuFI810AT5h1/C76+7M50S+stLPK7zcqpd5bj7hoMBZEyxhoW8nuPGwXBg/YQFg2H
	 U1SJZdYbHZShr33q7kzG83MRV9p2ImJgK6iegivn4rJ9URMM7Z564MISiFj0l4UcANk4n
	 RKrbdZ1/mPff220f8diywZ44awyDMntgp6+5AHbY28JRBjIA2VniywUfpxEaOivOH+AqG
	 PRLYGTOeg6eLlOBWW9JHmq7Hm+L+6BzY5XYX4++5lNDnj34zZ04tYOPuLl84qwY4YmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9xKTYcK;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B61606A89D
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49B61606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D9xKTYcK
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3704d30b84fso2255817eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637103; x=1795241903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/TclRQyw8P3XuUaC5KJPN4mF+Cw73WG2hCQ7XKkVl9s=;
        b=D9xKTYcKB+TRK1GKdN3JbOtEgASNTYzA/4mvcqKVOXo6+ynYFx0uSAF2HDNkXo8wIz
         g1oRsXosGiTw3tQje1vGcm7V/fmqqhE9M5Eljjf3okLo39R8tWO148oeDHgKlJZ4ZR4R
         OjDIz1ZEfa5kfpqY2p4pne4sBSuIkJN7Ik09/3Qm/6S7C9Es3LZzWi7TyzFm5jdgdHWn
         2reu0F9/ZEcpIxoqyknWlrkmxI/ef8MMJdbbGtg/MIOVXMPoeUFQmRrDVUUg/za/I0cO
         JTafUfihMNuc2aWGqaksb4LX57mwEAD4zkVgZjhu+aT2FVEi49qOWNPyezMeziicHJzD
         OT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637103; x=1795241903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/TclRQyw8P3XuUaC5KJPN4mF+Cw73WG2hCQ7XKkVl9s=;
        b=tXk6cPddRlYQvXYzUamx0agpPdi8bdBHvRGMAIUoBm1RwLJuzDRmn+EZDNwyNtBF0H
         aCMAtqxvUbRMOpq44tmaKSlRNHILkq/mE/DR5WD1G/6axGUV2z7t9Su3LzP/Sf0bMj/1
         e+ynOc68IyJ3bd+vz1mOSPItiYP51FGTb3xbx1mg6jqKpC6XllwgJeQ9zHwkmLUwRTYY
         fbF7oT65oXPkYKCjdCKlXdjGejNM0oj9OaYMnRGu85nXxplDxbuUcqWAtLmC/GSda/o8
         a5ZRzT08ZAZYabMkyqHsOZKeb0yvEB5wo72sC6aXjk64y2bT7Bhf9bm8gl2WFh1XEbzj
         xCjQ==
X-Gm-Message-State: APuU4Z/GKuuGsz2q5jSmnRCYiK/8XgO4+XVMpP2WvLzNbEUxF5ENhRMa
	4PF0OWy+9lo04/V25c3r5/rNupsnJ2v5qF8akMGjFvBsfQEfyV7pG/qK
X-Gm-Gg: AYBFou2UZhiU+kLF1d/E7RMmJHeVv6Zz6W73AqIbw48dbGvQWI8AwS+t+teBZQ+gvIK
	vksdtcEOCI0zC5/mUvWy28IvJkMSvbl3k2JxhYcDnSwtXB1H+LsSjzY56lrRSNWSmhwfkCmYaY4
	KWaDu/6q/l5km+0UhGpk3wZk7ONPbN13S/PeczYAh1VCvnspIJoXGVbsj95XsG97oWSdx/wHBBn
	nqEa38LNfLyvQIRCPPCaf+c3VpZLRZRswKeRhWJnQb7L7/RfIBc1rBXK3mO8dAORVKw6UsXQ/1w
	bNuJNuMO5YxXu/bZPyQIHhI0ujcZh5+ef+4dgfwtB6GuP32KHPYiKQ+8Rw1usx/8jP3RDBBt1aO
	vrs1BYkTiPOo4YyF/mWywOFHROe5IsZgxA9JV9M6LSTgoWy9mq4iUrtOzD6DL5FJBC/Aj9O8LiF
	qvweNwNBnY/rPTvG+Nm8vNL94pQt8rV55AMH1dWQhBqYYjT7Bjqup4PnpS1Lw9TsSWgTpbjY0hZ
	8s4vIBzyhCNUiaq/+5tZoxFaBc47V5zLXD+oRzNrOyMGHwUoqnL4Jbf7Gzp38x+HUQSCVAUUwaO
	+w+M+3cJ/G/iLyEEtQPw1brQbr3AnLNpda59zeaOQnmhFpYruFmXVwsuuyYq5XIO4mkZxCPmV4s
	4occnbX6gQZb5JpoEALxG2W76B4oM2WQ3NdjqpuenyyFLrqX1htxoHTSPiv5Wa23XoZ65ghmJxX
	ZF1g==
X-Received: by 2002:a05:7300:f18e:b0:375:894f:2524 with SMTP id 5a478bee46e88-37966b52646mr5653813eec.12.1794637103365;
        Fri, 13 Nov 2026 22:18:23 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] platform/x86: dell: dcdbas: Suppress bind attributes of the platform driver
Date: Fri, 13 Nov 2026 22:17:55 -0800
Message-ID: <fa93ff8c72aa9f8a12d032dfc8422d77782f2c6d.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633178.git.rosenp@gmail.com>
References: <cover.1794633178.git.rosenp@gmail.com>
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

The dcdbas platform device is created by the module itself and stays
in use for as long as the module is loaded: dell-smbios-smm allocates
its SMI buffers against it through dcdbas_smi_alloc() whether or not
the driver is bound.

Binding the driver again after an unbind also leaks state:
dcdbas_check_wsmt() runs a second time and memremap()s the firmware
SMI buffer again, overwriting bios_buffer and leaking the previous
mapping.

Unbinding or rebinding the device by hand is not useful, so hide the
bind and unbind files.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index a5917093d539..601ee8ca92e4 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -708,6 +708,7 @@ static void dcdbas_remove(struct platform_device *dev)
 static struct platform_driver dcdbas_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.suppress_bind_attrs = true,
 	},
 	.probe		= dcdbas_probe,
 	.remove		= dcdbas_remove,
-- 
2.56.0

