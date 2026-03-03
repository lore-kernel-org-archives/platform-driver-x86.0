Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FD2351C24;
	Tue,  3 Mar 2026 18:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772561910; cv=none; b=LWFClMvHk/qN88uw3jx4VLffqH3sdn/PuzXgRKvDjKwSSitfEKDs+cPkSpk3PKrjLrrQS1Jivq2dHrTPSZ/R3AGt00ToZYClKaaluvw+WGS86j+8QBNaUiOYi4OuWOzjm85lDSUkG5oYI9Fg0FwXjcUC+GKzzMEeYvj3Z3RUraM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772561910; c=relaxed/simple;
	bh=j/2gqBgx9RYbaR8BrQe7tCgW/Et6QpCg722X4ShPrjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MDG5tA16Ru1tLff9KwNZ3fTjDiuBpc43igAXKBvTTYJ3Y4MvXEbbPsQMtUkShbjWEPPsdqBd0O35aYtxRQ3OhYHEk7/MTLXFdU81dmQ49W98s7VMk2gxKaV6Ta+Hcpoh9DA7Lm4f+hx/ZFfcGU5OX6BowyMl7abXJXeiYcTJ8Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=l7C9hwQo; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="l7C9hwQo"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 7EB23BDCAE;
	Tue,  3 Mar 2026 20:18:19 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id D0038BBF26;
	Tue,  3 Mar 2026 20:18:18 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 347A91FF1F4;
	Tue,  3 Mar 2026 20:18:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772561898;
	bh=KdugWhgApbpYkp5ulPSM4iY1f+pLRyIvHEfY0i5KqC8=; h=From:To:Subject;
	b=l7C9hwQoL9v3Y4Gy3YwdmiJDBY8t5TKePDD42Dh3Fc6UV0I7QgI7QbRey9UcLqh4i
	 orR1rsnMiM0thfvMJmzQIzJ7ya2NuyvAORW2Boq5Z6ooaQe3S48UVDt3/9BwGzAEu0
	 mw6OrURV4l/IrpIVCgo96aJ6xysPHF6F9q2Z2wmlIqpybY0Xrjwvsj4RvC9ci1LWYm
	 7VVCRQV1mW+TOAM0/FAFShH83h2lI0zWTa0csm6Br7n74MRxR6s8AtskJq3ySbIYTY
	 PNc+OOGn9QKKpyuq5RghjnVJUT+wL/OP4Sp2OUJIjsqf4TJRm8jr4Jujx7VRNnSL51
	 6H4Cz6A7fdviA==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: Mario.Limonciello@amd.com
Cc: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [RFC v1 1/2] Documentation: firmware-attributes: generalize
 save_settings entry
Date: Tue,  3 Mar 2026 19:17:06 +0100
Message-ID: <20260303181707.2920261-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303181707.2920261-1-lkml@antheas.dev>
References: <20260303181707.2920261-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177256189853.1380802.6467359031591345364@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

The save_settings interface is also implemented by amd_dptc, which
has the same bulk/single/save semantics but no save-count limitation.

Generalize the description to cover both drivers: move the Lenovo
48-save architectural constraint into a driver-specific notes section
and add the amd_dptc behavior alongside it.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 .../testing/sysfs-class-firmware-attributes   | 41 ++++++++++++-------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 2713efa509b4..c762bed50de8 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -388,31 +388,42 @@ What:		/sys/class/firmware-attributes/*/attributes/save_settings
 Date:		August 2023
 KernelVersion:	6.6
 Contact:	Mark Pearson <mpearson-lenovo@squebb.ca>
+		Antheas Kapenekakis <lkml@antheas.dev>
 Description:
-		On Lenovo platforms there is a limitation in the number of times an attribute can be
-		saved. This is an architectural limitation and it limits the number of attributes
-		that can be modified to 48.
-		A solution for this is instead of the attribute being saved after every modification,
-		to allow a user to bulk set the attributes, and then trigger a final save. This allows
-		unlimited attributes.
+		Controls how writes to current_value are applied to the hardware.
 
 		Read the attribute to check what save mode is enabled (single or bulk).
 		E.g:
-		# cat /sys/class/firmware-attributes/thinklmi/attributes/save_settings
+		# cat /sys/class/firmware-attributes/*/attributes/save_settings
 		single
 
 		Write the attribute with 'bulk' to enable bulk save mode.
-		Write the attribute with 'single' to enable saving, after every attribute set.
-		The default setting is single mode.
+		Write the attribute with 'single' to enable saving, after every
+		attribute set. The default setting is single mode.
 		E.g:
-		# echo bulk > /sys/class/firmware-attributes/thinklmi/attributes/save_settings
+		# echo bulk > /sys/class/firmware-attributes/*/attributes/save_settings
 
-		When in bulk mode write 'save' to trigger a save of all currently modified attributes.
-		Note, once a save has been triggered, in bulk mode, attributes can no longer be set and
-		will return a permissions error. This is to prevent users hitting the 48+ save limitation
-		(which requires entering the BIOS to clear the error condition)
+		When in bulk mode write 'save' to trigger an apply of all
+		currently staged attributes.
 		E.g:
-		# echo save > /sys/class/firmware-attributes/thinklmi/attributes/save_settings
+		# echo save > /sys/class/firmware-attributes/*/attributes/save_settings
+
+		Driver-specific notes:
+
+		thinklmi (Lenovo): On Lenovo platforms there is a limitation in
+		the number of times an attribute can be saved. This is an
+		architectural limitation and it limits the number of attributes
+		that can be modified to 48.
+
+		Once a save has been triggered in bulk mode, attributes can no
+		longer be set and will return a permissions error. This is to
+		prevent users hitting the 48+ save limitation (which requires
+		entering the BIOS to clear the error condition).
+
+		amd_dptc (AMD DPTC): No save-count limitation. 'save' can be
+		called any number of times. Returns -EINVAL if no values have
+		been staged. In addition, when in 'single' mode, the driver
+		uses pm ops to trigger a save of staged attributes on resume.
 
 What:		/sys/class/firmware-attributes/*/attributes/debug_cmd
 Date:		July 2021
-- 
2.52.0


