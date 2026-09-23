Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5587C2FE042
	for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2026 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167672; cv=none; b=SAgIbn1r6bLAWDWNXav+iNhFlXvNWuqEAptFe5fSVyeeEmQM8gwkRfhtWOANhKxYRWWySNl4a5d6Qz5wYRS+PX5D8WZdYNl226wkWpi/KH2pvr3oOsjFkOfta5iYoOfcGrLxcMZF2APQUV3LSNxrVFd48FsHQJ17Km8B9JTxbFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167672; c=relaxed/simple;
	bh=PR+nkjgFdt8KW6rr8XD5p6NJuf14I9FUk5rQR1VxrDM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sozX3gt/YRnhBHtCPRrWbdFlF+2qX9HXF2HLu0igQLf/1bDXUAH7Jfh8i2bAAhcRQuZoAFFEfhQ/86FSd+2LMAmAWIgFwonOm1ZBNJEXMD5lO2BscFWiOuKPZTKYqQyuZyPyer0qKj3sj7xPFKrumYDP55GTxpBO9fc5FoD98Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=b3gao8F5; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="b3gao8F5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790167660; x=1790426860;
	bh=h208NgNTT6F/Gu/lzps/mjSZZNGTomju5YIHK8oJk1I=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=b3gao8F5lXrdkoHz5AaD2qyn5ogR39ZHBdHOUuJG9PznVchBHL7aJIVWLVuRZ9BTz
	 hGZ0/SsbwwSSn5WW+r0sqRjH7kajM1YUwxcocqOOlg+8eZBiUc6uY1QR3FA7Qi4sr1
	 VSUL9VS6sw26e3afQ4DzASMTGmObC73/v8VWpCgSlRNZQWqYXfsN9ErTKDBAme3EW8
	 g7cnDmwGUIpGnNi5wbQRmDhF/WCzdp/F3jz4Tu5kNmyW/spRDITbcIyIyqBfqR1Asc
	 GENnCymBUSuCDr6z9hrSmyMDk8w16AHFjbWA6ti/CFXOfw1BiWIbnzQuqeB1l+cGD8
	 X+clPUXcvxO5g==
Date: Wed, 23 Sep 2026 12:47:36 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Jakob Berg Jespersen <dev@berg.pm>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: i2c: ov13858: add regulator, clock and reset GPIO handling
Message-ID: <20260923124728.73609-1-lsa.uz@pm.me>
In-Reply-To: <20260831130312.26296-1-lsa.uz@pm.me>
References: <20260831130312.26296-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 2af9a1462b0c1966d6ffaf05df5b540a8953904a
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A ping, two weeks on:

  https://lore.kernel.org/linux-media/20260831130312.26296-1-lsa.uz@pm.me/

It still applies to media/next at aedd77ea81, checked today, and builds
there clean under W=3D1. Nothing in the patch itself has changed.

One line below the scissors has gone out of date, in the patch's favour. It
says this needs POWER1 GPIO support in int3472 to be useful on this machine=
.
That landed: discrete.c now maps INT3472_GPIO_TYPE_POWER1 to "dvdd", so the
rail is a registered regulator here rather than a dummy, and the dependency
the patch declared is no longer open.

With the patch applied the sensor identifies, the driver binds, and
v4l2-compliance reports 46 of 46, 0 failed. That run carried this patch, th=
e
gain cap and the flip controls together, since all three touch this driver.

Sergey

