Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1620285CAD
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Feb 2026 03:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772249892; cv=none; b=GRsFXgtZPvG14zlPI5RA+FYimmktJGlNgz7CPz8PQwmOsr8TEieY8YcJtWN8i9RyvlMW8sLu51BeT9fUbbgvD/B6aw4nNUuCLZXoUv05jRsCsdR6c1erBK5iUfBHf4N+R+7GKPVkyQtWwm3kHqdzDZC8RM1DGJRO0j5ETkvcoXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772249892; c=relaxed/simple;
	bh=KOv894Zum9uT4XfBej//fajNVk0OmnrKyDJ9iinzbNk=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=OvEwnda6EXUvfdhzGvBLp5CNHu31XmDGaIdNnQ8Cj3cHyeOgtDvFpU8ubesY/JDMXNRyR4IteURVqSBtXWmAMoadlJv5Qm4/Vt6a/aib45bKVOLmsFcHEhNUeFyDNpzooFYbM+yzLL4QVKKWxgDTqOpDrmkc3i2z4vWvElFo0jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sebmeyer.de; spf=pass smtp.mailfrom=sebmeyer.de; dkim=pass (2048-bit key) header.d=sebmeyer.de header.i=@sebmeyer.de header.b=RdTUzkCv; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sebmeyer.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sebmeyer.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sebmeyer.de header.i=@sebmeyer.de header.b="RdTUzkCv"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fN9rY4zKtz9tKq
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Feb 2026 04:38:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sebmeyer.de; s=MBO0001;
	t=1772249885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tE+u/HpMJ1xcPyAUw4ktnnTsVlFBQTHW0nSXvXFjIC4=;
	b=RdTUzkCvB4ByBwSlnWFqYpnENmaRopLOrxklIaEgTzHWqpRXthP+oWnEsXwBzNWO3bMse4
	FLEyv+HbaV8/ynzA4BNYukVgnPVXgVeuestaPdlW6aq2Ib+qddFGLn547c9n3Kmt3TfW/Y
	cF+d05VyYfKtz8FKGVumG9I59l1fRw8k4vP5nXPtFt/I2x/8v5Z7eizPj8ZagqpN6cZ+8d
	gBi6bF2dEJjx3iEFwXQP2UNOPRCE0tnbjW6j1Nf0klH6UBgcbnvFAfR6eTDIL+TQSSbjtS
	oqEIj/vOHctX6ne0WHwVQmcCEuMmFGI3R2R0U4HzL0hZ3yD1eF2EgBxipYvdmQ==
Date: Sat, 28 Feb 2026 04:38:05 +0100 (CET)
From: Sebastian Meyer-Bohr <ich@sebmeyer.de>
To: 
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Message-ID: <143005271.770665.1772249885281@app.mailbox.org>
Subject: Reporting intel_hid.enable_sw_tablet_mode=2 for Dell 5320 2-in-1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal

Hi Hans, Hi platform driver team,
 
regarding drivers/platform/x86/intel/hid.c 
 
The 4 year old comment from Hans asks to report to platform-driver-x86@vger.kernel.org in case the enable_sw_tablet_mode has to be set - but since I didn't find a previous report I'm not sure what to precisely report or how to pull useful information. If you let me know what you need to know, I'll happily supply more info :)
 
Just mind I'm not subscribed to the list, so CC me or reach out to me in a direct mail (I'm willing to temporarily subscribe if that makes sense).
 
Hardware is a new-to-me Dell 5320 2-in-1, that's one of those with a non-detachable keyboard that can be flipped into a tablet (service tag clf03b3 if you want to look up the exact device over on the Dell website). Just like the Lenovo Yoga et al.
Kernel 6.18.13-arch1-1 on Arch Linux.
 
I'm not sure how to pull relevant device IDs, else I would have added them of course.
 
Tablet mode isn't entered in default (auto) mode, but setting the parameter enable_sw_tablet_mode to 2 does the trick (I did not try option 1 as on probe seemed more sane to me).
A new /dev/input/eventX appears and my DE (Plasma 6) can act on the "switch tablet-mode state" events reported in evtest.
 
Thanks for taking care of all the things input :)
I usually would not have reported this (setting a Kernel parameter doesn't hurt me), but since the comment explicitly asked for reports I wanted to comply ;-)
 
Best regards,
Sebastian
