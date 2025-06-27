Received: from mail.w13.tutanota.de (mail.w13.tutanota.de [185.205.69.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B907B277027
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 08:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751013944; cv=none; b=KJGxrtKBkKrrfyjDmD+Ou5cO3xEysc+hTUCpauD1zMECbApeEvYJUr3tx0MElSDwet32zB/I/k6S5NydznvZ08r3s4H2O0VbPpx/o0vAMJ+TM7jT1OkvtK/UN4QzcB+6S1gMJtKICuyRugMaBQTD8xk6Fwn41dd2jQUkGPYjDK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751013944; c=relaxed/simple;
	bh=CYJ/ffsUEC9Nn9dmyLYz7CdV9WfAfoVpKmZqXwkBMWc=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=KPveh1ykZqW/UBz3EvJDtRO2CxmF1nOTlogNHONuuiSofEWy2g0A1a3jmBs8930Eg2qCiglUrwN/anSFmg2ZuYOgXOo7LbbTfX3rnMgHtG0201ScjYO5SD2D0WVr7Jk30tcOWJdfUDkoyzJEuEiPuIlgW0kXeJXunOSWzw8g7Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=ozwAATa4; arc=none smtp.client-ip=185.205.69.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="ozwAATa4"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w13.tutanota.de (Postfix) with ESMTP id 71FF29C0501B
	for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jun 2025 10:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751013939;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=CYJ/ffsUEC9Nn9dmyLYz7CdV9WfAfoVpKmZqXwkBMWc=;
	b=ozwAATa4HcQAJWXU/F59iSNqypSrrMK14Cw2AbJtVpZ+lu4bNOen4q/j4MgO57Hv
	zSnWwvy6MekNFRpGzF8IL6Rn8YjqqrHvQdb+Id7tuJ1AWlumtnze0ko6ybS15KwJ26d
	e00UXOWwbnWrUMs+BOtERrgdDwArizttHAXPQ//YbA8YfQYTLP2l35kkekUp46K+rHI
	jd7fhYCK1FwERMupqzwMJERoSjz/mFg6rBcWmab6V+BMM7tW2xr33Hz8DeBc7PoNz9/
	00QNqRHEQSHmkLq1wxhwp7qMi09wAxdNiZ6E9QoFIjRSlGkoT+PhK9Cx0r3HrcB0Aic
	uk4sVyTlUA==
Date: Fri, 27 Jun 2025 10:45:39 +0200 (CEST)
From: thysupremematrix@tuta.io
To: Platform Driver X86 <platform-driver-x86@vger.kernel.org>
Message-ID: <OTkZ4I6--F-9@tuta.io>
Subject: hid.c - need enable_5_button_array=1 for hardware volume buttons
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,
I'm running Arch Linux on my HP ProBook x360 440 G1 but I couldn't get the hardware volume keys to work, though they worked in kernel versions older than 5.5. I found that after some digging, sudo modprobe intel_hid enable_5_button_array=1 seemed to work. The documentation at https://github.com/torvalds/linux/blob/master/drivers/platform/x86/intel/hid.c said to contact this email.

I think this affects a lot more HP laptops, I found a forum post on Fedora forum https://discussion.fedoraproject.org/t/hardware-volume-buttons-not-responding-on-hp-laptop/97611 that said that this affected them. Maybe we need to apply the fix to every HP laptop that has volume controls? Thoughts?

Cheers,
By Matrix :)
