Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975951;
	b=AGUDvCUO6ovUxGW8iSTeoxlfEW8jr/Ha6+ukfer2gNJq1ahNV7k2rlbFS5+oeSAP2OBc
	 4YLd1Wte/beP18iFroEdDNo7BCdhEXOa6ATWFt+0AUADE5G5XmsVLOsri+cJuTAYDPSR2
	 fAJlr9VeIYUOnu3ck7CQ+zkvvT3o62HGnv4qJVfq/jYEgTNQSompj+dr+m/pYbWErcKmo
	 fv+dy0vOMnHRWLAuuZT4PI/GP33JCLVVtY/n2s6BUDQh/jON6vNh3QbhHaPnqfXPKoUon
	 YiET0ATd/ol7XNljQAHfBXhRiBt60x7Ie7N7RuH8ZvM+jHLKUqo1Ng/7e1zu/x7Bm7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZLmT1RR6c0tdfGfGE06HwTpuXjKRJyX18VsyX/W06Z0=;
	b=YNWa3eVmO8b6BSu6uU81QOSntoZqojsmDJYlU2OVNritZLwZ+7K90NQXGZj1q/PQInE8
	 0prVCvQJa/VV+4TaD+d/0UO0jFj5aEwwTEbfIYCvSZq43g9mP5LuKjtdRBi0ahQEpDIbi
	 yiprWHIvhV2RjDZq0b81gKx2TMTSM4QmCVTh4JN3/LBEMu8hslODD84gcDGFF9xsGENXz
	 gGwIXn8OGfxzlNZoG//j+3eZ5OpjfX69j8TOJ0ts/WeAD0yBFQd8Zy/4tli1IvvoXfns0
	 wGAcNvZVKksE7zabtPrqRQuwwnVq4jsBWsbOAse8rGJYc3aB9bkSPiEpIHJmMKtPEDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nw7aLpE;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6E6606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A6E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0nw7aLpE
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ea7987517aso3272965ad.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975951; x=1795580751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZLmT1RR6c0tdfGfGE06HwTpuXjKRJyX18VsyX/W06Z0=;
        b=0nw7aLpEpMpbad/P5h43YH9uPl7MQCvej5nQa0TCJ/A6enDh3R8YGEi0aPWiKQTjms
         1m2GDrKZeusjcB3tnzfneYsLOA6qCFXebc6CazAGNZ+sTZyWOvwBNwwpN9k0sBmhxkWO
         88UjYOfGXtenidR723vxkf58SHx0Iy2mWriKzGNdAU4H2V/cf47Bm3gPoS16Rq2VHO4r
         1oGWhd1WWyJiDx90jrSLJn88s3VFgHQzL42LQ5/OLRJ2pkP+VBX1uqtT6kBeDeIAlvKM
         kVF/zJYFjoirA6TJDVRK+pfHNWlFu+vm5Wm9+r1lWx3t/+pZMjWQtdnW3VlcQJklaUc5
         nCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975951; x=1795580751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZLmT1RR6c0tdfGfGE06HwTpuXjKRJyX18VsyX/W06Z0=;
        b=thNeIW3CfHCYUOKriqNcuaF7qvpxWTEaNwHuDeAMj59kYtdGNP90/POyTLVnDrt1IY
         hIroA04CTjxwLNXtzgfout1AGOqvY8/RR+28OhgDnSGbG/gSld/abtvPdO/3ORxGFLb+
         CzTsSi7prCvcj/roS0VyFRu7FQPCpAbH/CI2QEtjdDI5fel46np7EXuOR4cpaw4wmzit
         0XEfUOMblQELqQ4o7SFMJwa2QHh4fyzZ/5VF0AeCffJrGi0IqCBJ2n6jz7T7tOJBh8Ef
         0LxlbBBk1fV1/5BqNjyAaDg8/llSLi1/O0yv6NIWWYi2UHYcwUGLfT0qd8vfn5Pp2/K5
         h+Wg==
X-Gm-Message-State: APuU4Z83hrCdHmNwVtEw4q9jVPPlDFls33pApgfNcRv+u9BOd+CPrUrG
	uc8J0AA++z7ll6J+5FpXhm2/B5yeQhLYahbhfioA4/our5czYqcXmp1n
X-Gm-Gg: AZFdTZcatph46sqDt6qKBuR8bJPfd7N4pKmX7wcKQoha8T9NtBX5s6BI89dLWppdfk/
	QxAB9N3i6/kRuCDiXaRycCeQeZZl36aDtWE9qVusqMnLlrmPWszIzMuIEJK1sgbUoc29i1Jf9VX
	xYdApmscNW+zU8vynrgi2qcQbjiJ3o0fQgEj19grPWV8O/GAI04QVIyUhnSZPlmm9pNoMvpBbsd
	mYiBXSh+LnbMv3RhFGd1l1y90dN4VGmG1cNULtuvrJOHZP101lAiW5/dee3fEaJK9tBbCV5QDNK
	+ISioxFJj4oeJf0gPI0H/IS3KUhl+w/VOS0i3Vv1snHEriL2oI5wLQ45m0wRFC/8r9XpjFzSsHB
	4SmftpjQ5irQWHp/72Y4uFxOLdDvlsMz3LWuoaAo8zkslSAre4ixNRWns6K03KkJXeu0LSYs40o
	fWgbxGi+5uzWvY/+NyuAZcetbqrTYrRJMpXsDlPfyQjnhaP6sNbzgQoyUnl4b2tu1rvNz+mM2MI
	6BZGUJqY2v53Mu5Oyl5FfrjZVjYuJCX93fQNO1rf/KFx/Ac4RspOTD0Pdg80l6VcP7C+3qcrGv9
	54RBsi2cwmgHhByfYxMipVbPQTl0w2mJHh+eEV3e78ehsderdQ7hDgmZMAesSL6gmJYF4kjRRPU
	ToJOujxL4WwOj1GXg2L6AsMx+U9ehJ8BhbyWlvlzF2mbKv3NAX2gyLmkxy32rNEClzcRXgH4cAV
	MZZQ==
X-Received: by 2002:a17:902:d60e:b0:2e9:776f:66b4 with SMTP id d9443c01a7336-2eff752e330mr13191205ad.44.1794975950676;
        Tue, 17 Nov 2026 20:25:50 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:50 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 05/16] platform/x86: dell-smbios: Use dev_driver_string() in debug messages
Date: Tue, 17 Nov 2026 20:25:27 -0800
Message-ID: <6756890b856608213f5b1f1edae8acf5382e16c2.1794975827.git.rosenp@gmail.com>
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

dell_smbios_register_device() and dell_smbios_unregister_device()
dereference d->driver for their debug messages. The device is not
guaranteed to be bound to a driver, so use dev_driver_string(), which
handles that case.

Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index 9327f9792b89..ec78ff1c606c 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -160,7 +160,7 @@ int dell_smbios_register_device(struct device *d, int priority, smbios_callback_
 	mutex_lock(&smbios_mutex);
 	list_add_tail(&priv->list, &smbios_device_list);
 	mutex_unlock(&smbios_mutex);
-	dev_dbg(d, "Added device: %s\n", d->driver->name);
+	dev_dbg(d, "Added device: %s\n", dev_driver_string(d));
 	return 0;
 }
 EXPORT_SYMBOL_GPL(dell_smbios_register_device);
@@ -178,7 +178,7 @@ void dell_smbios_unregister_device(struct device *d)
 		}
 	}
 	mutex_unlock(&smbios_mutex);
-	dev_dbg(d, "Remove device: %s\n", d->driver->name);
+	dev_dbg(d, "Remove device: %s\n", dev_driver_string(d));
 }
 EXPORT_SYMBOL_GPL(dell_smbios_unregister_device);
 
-- 
2.56.1

