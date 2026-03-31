Received: from spark.kcore.it (spark.kcore.it [49.13.27.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610133BC672;
	Tue, 31 Mar 2026 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.13.27.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941037; cv=none; b=iCWRxkf8pjL7xq7j4tBcdvXQP4j5TkrrBdhUj59tjiOeejyRIWQp2N4kLd3j6YbW491azJsWtOCRxswjNFXBxxMnXokGDo0cP9HjqpcS/+AcmTiNIBGp7QBIRhKaNxiKN2H/hZV08UsTUDO1E591z2zOAx5ZF2w/5FO7EGEIoxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941037; c=relaxed/simple;
	bh=NmqmpQK69Hut5zdJVxNTqJZaHn/oz/vzYnRexXdV/No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AU6NgIN39GfQzbJhF/Oeqvwyeu4Iv8pHitHlG4Kmo6lcubH9QulJndhyDiLqT434cI42P6k1NX8LkdaTCe8mcMo6JoLoJvRyL8w+vc5Yxw/13/Gej/iaxWJ+H1HhB65GbVBjyB+KuVhr2OFTtm+JmM5gn278iqKft0NboblolXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it; spf=pass smtp.mailfrom=kcore.it; dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b=jbm0eUzX; arc=none smtp.client-ip=49.13.27.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kcore.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kcore.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kcore.it header.i=@kcore.it header.b="jbm0eUzX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kcore.it;
	s=spark; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=NmqmpQK69Hut5zdJVxNTqJZaHn/oz/vzYnRexXdV/No=; b=jbm0eUzX5uxlFAvsqfE3AXi6Ft
	LttWklRn+9/mLlROqA+azM4gCQpTsQHZc90NmvnKveth7tTnY26KvQ55/VE+4jh5oghyX+tJa9sfu
	+MEPg5B2tkOhmkuri3BZMF0AuFYwNXg5crcABuTTsQQbYueNgcieAT/IHVzMLoJuffbw=;
Received: from mnencia by spark.kcore.it with local (Exim 4.96)
	(envelope-from <mnencia@kcore.it>)
	id 1w7TF6-006ZcZ-2a;
	Tue, 31 Mar 2026 09:10:28 +0200
Date: Tue, 31 Mar 2026 09:10:28 +0200
From: Marco Nenciarini <mnencia@kcore.it>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: johannes.goede@oss.qualcomm.com, Marco Nenciarini <mnencia@kcore.it>,
	djrscally@gmail.com, ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] platform/x86: int3472: Add support for GPIO type
 0x02 (strobe)
Message-ID: <actzZDFuL8MYUMN_@spark.kcore.it>
References: <ab0URIrzZPsYjWrM@spark.kcore.it>
 <20260327181031.1489365-1-mnencia@kcore.it>
 <76baf0c3-4c1f-4169-846d-5c74dab69a18@oss.qualcomm.com>
 <acqO62_87TM4UZMI@spark.kcore.it>
 <06317144-d652-466a-86e9-da2569a1acf6@oss.qualcomm.com>
 <acrbTBh8KsHmtJN5@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acrbTBh8KsHmtJN5@kekkonen.localdomain>

Hi Sakari,

Thank you for looking at this.

On Mon, Mar 30, 2026 at 11:21:32PM +0300, Sakari Ailus wrote:
> I wonder if there would be any deterministic ways to find the LED device
> based on the sensor. It'd probably require more information via MC / V4L2
> controls to allow that.

The LED name includes the sensor's ACPI device name (e.g.
OVTI9734:00::ir_flood_led), so userspace can match by naming
convention. For proper integration, the privacy LED already has a
led_get() lookup keyed on the sensor's ACPI name, and future work
could add a similar lookup for the IR flood LED once there is a
consumer driver.

> Alternatively we could use a boolean control for this, but I think I'd
> avoid adding that now and rely on LED API instead.

Agreed, LED API keeps things simple for now and leaves room for V4L2
integration later.

> Are there use cases for this LED, apart from Windows Hello? :-)

Face authentication is the primary one. On Linux, projects like Howdy
can use it. More broadly, any application that needs the IR sensor
benefits since without this patch the kernel refuses to register the
GPIO and the sensor cannot function at all.

Since everyone agrees on "ir_flood_led" for the name and the LED API
approach, I will prepare v6 with that rename plus Andy's cosmetic
fixes.

Regards,
Marco

