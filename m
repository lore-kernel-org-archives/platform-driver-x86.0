Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCFD3C9EF4;
	Sun,  6 Sep 2026 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788700328; cv=none; b=liTU7zvEzwfuAHIvlAn638ArlLe4x15MsbVcIJTyMRhfN+ANu5y51EzY5GHgtqVhuZ78j72MdF6EHOLybGJUQszIgpIiuFSrEoOtiwm90hZ84HhhXZ4Z+I2DoEXPhWPjA2NBdbf3t5vDGq2l8uMcxHsWOZ1EbR0hb4mJISrr3eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788700328; c=relaxed/simple;
	bh=5nsAgWt5B1mnFSR/NLMGwzXmfD/cB02LqlhoYiXWbSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eHrzgQ+RhCj2yfYzGyr3uWYiSscx19LjYe07ZYThrCBgBs2QrG87GVVjaa7K5lrAbRwaMAbu05PxkAWC3uoqw7r3CiaQhx5Roob2dpnmy485wnIkgb8SmTFN2drmg7v47X3Nn9XG2MwU0Bzb0EyBw1byM7LNdqm0qa5RnpsEtbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=gJQGDxys; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="gJQGDxys"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2A97480F4E;
	Sun, 06 Sep 2026 15:12:04 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLISd1mDzk0f; Sun,  6 Sep 2026 15:12:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1788700323; bh=5nsAgWt5B1mnFSR/NLMGwzXmfD/cB02LqlhoYiXWbSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gJQGDxysQkAGyyR8UqbwhS4FJLkbMNgREYUZs5U0lROPF2gdCzIFyeg2AFCJ8i4M2
	 ksUOjBN7NzF/twDLye9VK4roj1sTE/3hF6JDwr+v13IwdfzUu90HPYMbsQ9Uj3nu3d
	 fYhhjgI1g9yIFxqRM45L/xy3qXSXc3KHRs4xf96URYASbyuI9KjE2xdTWty14BzKUk
	 6KPHdUry4QZZsNwuuyC2oPmLul7zGbu8qZjnJEql/E6pfPPBUU8C9+CeYEvYtH9jSW
	 tNovjROSIoL5bI5eE9i/uJaRwP9HoVK88EbphC9JkBtZN9484aJbYmuRUMeb3Miebt
	 FB3hfLDjIeT3g==
From: =?UTF-8?q?Ali=20Ahmet=20Memi=C5=9F?= <aliamemis@disroot.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nitin Joshi <nitjoshi@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] platform/x86: thinkpad_acpi: convert conditional mutex locks to ACQUIRE_ERR()
Date: Sun,  6 Sep 2026 16:10:20 +0300
Message-ID: <20260906131107.20966-2-aliamemis@disroot.org>
In-Reply-To: <20260806061925.625482-2-dmitry.torokhov@gmail.com>
References: <20260806061925.625482-1-dmitry.torokhov@gmail.com> <20260806061925.625482-2-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Tested on a ThinkPad T490 with lockdep enabled, details in my reply to 1/3.

One question on brightness_get(). It is the backlight_ops->get_brightness
callback and has returned 0 on failure so far, with the conversion it now
returns a negative errno instead. In backlight.c that changes what callers
see. actual_brightness_show() passes the negative value out to the sysfs
read rather than reporting 0, and backlight_force_update() logs "Could not
update brightness from device" when the EC read fails. Is that intended?

I couldn't test this, since the T490 backlight is owned by i915, so
thinkpad-acpi registers no backlight device on this machine.

Tested-by: Ali Ahmet Memiş <aliamemis@disroot.org>
