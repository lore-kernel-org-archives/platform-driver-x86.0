Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4A1F91F3;
	Fri, 17 Jan 2025 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737101695; cv=none; b=kKir4n0Z8VzjeiisW4NziIC8XfhqeFsCZnKjOaKzLxGhmwsU2+Arin5MhGXXene7seTkeQ1rrUGX5MWWaqToGmOSV25r7L2Wg19AyR+PEBBV5dwyJ6lmcW9yXnI269aE97rXBHwhZ5QtcU1hS7k9ZFfi8pTWMcqU+tHlj+UNRjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737101695; c=relaxed/simple;
	bh=Woq4swbnYq3xsWIj3EtplDj2WuXqxSueFP8J8UTTZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5cFafv+9906Plnkd+QOBc5vX4JYvbBS+AmAtOiglGV2BSViFG9cTlCn6U64ehDaA/5n+V2Jg1bBv7ZUvlOZzRMyqUkeUY925g1r8O2H4wqlFOKHNS8BzYeBBZ+WVJi2Z10l34ERZ2gf6Wia7GdNRICZcTnUgsFwNcTvav+UjL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNhRyewt; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNhRyewt"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4affd0fb6adso434568137.1;
        Fri, 17 Jan 2025 00:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737101692; x=1737706492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=RNhRyewtxxuAU6cHvuMxcy8FF3n2BtnYd+WB/RiEkp9JCMseJcdmRtqeNd+pjB9lkr
         ZS1+IpnR5PhAM9bVyDSag83yclq2S9PXG0pD5j8enaUF+cjdzhKr/CzOqKooWV8mknpc
         s+aOeNKMr3dBp33ylehnv5bUnFgB8tSCqOJpLIPWdLVqH0aB5fdc7RBALHbvCbsuFkBV
         sIGwvY9/ALrCEYEY5SxGLS1CqqWJa/ta/0lcZILHiCrpj5jV7XO0RsmhSkTG+utJ9c83
         vz/hiVhnvMxZsMM8X9x3Dx01OyJ+MNANxjBqfAX39WEUPWLnth++sbXTn90MPnUBeCSS
         x9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737101692; x=1737706492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=NuomPl5iYNdV5LxKAPw0RgdBBup9qzMkZPZO/OlfOSgQ/CPCpY+3ypqKXwQHQztAkW
         qu6PDFeeRwUL52/C/C+cBGo47IOhAHBTHmNLpEW1bie5nVaUcdlvk6DFlQaFrRiW1xh+
         BqTzh6GTJuilgbQjEXHrbZBFDrmlDfw6hIPRLEqWCuyGfq03RI68BLTDHGfjCmnQxL2b
         K/nCgolrxrLJIJXisglYxbOn5Q2BloNCXfs+RwM7K/wGLsJjiKnH1AjNXLy0iCsMmaJX
         01eGCGdVVrzlnBtm9aAEuUe0PZxhWHf0A1hxJz8/vyU7KQPwe7xwxXhWe05INUzzKCCK
         N/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCU/S/OofFrYq/ATgY80mmo8YJpP+j3Ss4PAB4XTKrdHfma/n2HnThSDfwvg5FOn4ntA1ctigNSnCHY9VCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwqaDlfsLIHcbV5ngvh0JcHAqTdhYB795vM/VchqTPy48UDQWN
	7BDuAXZpza4qS559WjCHKBXynk/Cfh0qlnzfYqNcxm3ow9r7kn/JT3OWJw==
X-Gm-Gg: ASbGnctEaSTq02WMwoTyxVHp3wE+OIWMe8DbLwg0Dx1ZCOHnKojN/h9iYsQMAyVKIp1
	s1RHXouPORIRYVdXRq4sDE21RTZ1TGUMgEpmkxd5BluiewqZgIWjjxZVkqeK7cLqzQIgUL0imWK
	588XvMAss5NgLGfPuGKYICtgL3atatQtf2F3TqkuIvsGKUkSMFbj5cAFTFwawJjvzAaHeuWlBSX
	1l1Mp3r8UoCApGJRPNXTewOAksSslui5DnfeM4sEVRiT5PMGOKPm01F0Mg2B/8e
X-Google-Smtp-Source: AGHT+IEHdE8E7YlEvyO+NDWp38evYUN85bFEAyBXgJFEwMt8QbFImlB42C6fNHd0QLidu0uVa5d8gA==
X-Received: by 2002:a05:6102:3fa2:b0:4af:deaf:f891 with SMTP id ada2fe7eead31-4b690b5e789mr1025491137.4.1737101691016;
        Fri, 17 Jan 2025 00:14:51 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642caca4edsm393703241.11.2025.01.17.00.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:14:50 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v4 09/14] platform/x86: Rename alienware-wmi.c
Date: Fri, 17 Jan 2025 03:13:42 -0500
Message-ID: <20250117081347.8573-10-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117081347.8573-1-kuurtb@gmail.com>
References: <20250117081347.8573-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename alienware-wmi to support upcoming split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile                               | 1 +
 .../platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c}  | 0
 2 files changed, 1 insertion(+)
 rename drivers/platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c} (100%)

diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index bb3cbd470a46..f8aec8502c2f 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -5,6 +5,7 @@
 #
 
 obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
+alienware-wmi-objs			:= alienware-wmi-base.o
 obj-$(CONFIG_DCDBAS)			+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi-base.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi.c
rename to drivers/platform/x86/dell/alienware-wmi-base.c
-- 
2.48.1

