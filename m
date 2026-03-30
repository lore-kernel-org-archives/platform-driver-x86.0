Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E514832A3FE;
	Mon, 30 Mar 2026 14:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774882555; cv=none; b=OjMriDh9qZokyh+4yMklSV98ntFgoq0rLWvXZRuJvtmQHSb+JJFO+fxxmMNeCt8A7n4dnIj7Ekl2NfZIf62emN2bGeotsqskR+zAqcG5WiTipuJr5DAzt5zWYepvBofamfoWr3/y2MVY/ZfU4hiG0SHH+YF1pz6troEr3+8+CuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774882555; c=relaxed/simple;
	bh=acCJO56NFfcB/8UhixJYyn2efEGJs6jPVdNzzkppuD0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:References; b=EBR+bKJJfDnzj8b1HygwoZAyKn8d07pG54uXuVxcUwfGZpls8AM/DLxWo9L1GqWkgb51Wgr/ByGrBSgy06ZQrB0FVwouQNVaAG/u9kh8TXoEoJQYlRp9SCKF4HlqkzhL9JPD1oZ7e+NVBaNBbTRvXh95mbHf3A9k7+rHe0X0WgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=ZI0mgFFa; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="ZI0mgFFa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=References:In-Reply-To:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=acCJO56NFfcB/8UhixJYyn2efEGJs6jPVdNzzkppuD0=; b=ZI0mgFFav2Dl1ujb2VyQ3dj6Gy
	2nTiGspRQpHFyaU5GRyG/UQgXaUhKo1zVQEOsvML1fDutrj5b25qH5JwraUnKrzkGC9Gqu4pPOn8N
	NluCqp3Uh/Vxlgmy1dcSJEoW5BhFGOSjLe/7VovgXbtVPJdERGokFa6NekVPMJXsYD4c=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7E1j-006W4L-2c;
	Mon, 30 Mar 2026 16:55:39 +0200
Date: Mon, 30 Mar 2026 16:55:39 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: johannes.goede@oss.qualcomm.com
Cc: mnencia@kcore.it, djrscally@gmail.com, sakari.ailus@linux.intel.com,
	ilpo.jarvinen@linux.intel.com, andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
Message-ID: <acqO62_87TM4UZMI@spark.kcore.it>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76baf0c3-4c1f-4169-846d-5c74dab69a18@oss.qualcomm.com>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
 <76baf0c3-4c1f-4169-846d-5c74dab69a18@oss.qualcomm.com>

Hi Hans,

Thank you for the detailed feedback.

> My main remark on the current patch set is that IMHO
> the LED name really should be: OVTIxxxx:00::ir_flood_led
> since that is what it actually does, strobe is typically
> related to flash LEDs which despite the naming in Intel's
> side this is not.

The series actually started with "ir_flood" in v1-v2. It was renamed to
"strobe" in v3 to match the GPIO type name used in Intel's ACPI _DSM
tables. But I agree with you that the userspace-visible LED name should
describe what the hardware actually does, not mirror an internal ACPI
label. I am happy to go back to "ir_flood" for the LED name.

We could keep INT3472_GPIO_TYPE_STROBE for the define (matching the ACPI
type value) but pass "ir_flood" as the con_id to the LED registration,
so userspace sees OVTIxxxx:00::ir_flood_led. Would that work for
everyone?

> We really need to get some input from the V4L2 maintainers
> here on if this is a good idea, before merging this series.

Agreed.

> I can even imagine
> a default simple mode where the v4l2-core just turns
> on the LED when streaming starts and off again when
> streaming stops (very much like the privacy LED) and
> then in the future maybe we can extend this, e.g.
> add a control on the sensor device to make this
> configurable ?

That makes a lot of sense. The current series intentionally keeps things
minimal (just exposing the LED under /sys/class/leds with no V4L2
integration), but this future direction sounds right.

I will hold off on sending v6 until we have agreement on the naming and
Sakari has had a chance to weigh in.

Regards,
Marco
