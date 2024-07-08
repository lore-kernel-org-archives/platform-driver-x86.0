Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04308146A63
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jul 2024 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455773; cv=none; b=IVDGI9BQetgZVPYLnvA276jyCUMhYAJeJflYQphM4NopgKQJmNI+FJxRsJ1NKUOK8i6rpeNqSljL4mK+2O687JmKqDjLqEOrKk3rrjGaukGtfZG9lr2WG5M4q092z/MzEE7voEiDjfMcSfBJJ/ugJzGdotodUsjwTzY5Vfdnxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455773; c=relaxed/simple;
	bh=IIbdDIU/3qjnZ5u6Az8LH/BCAU8w0/Kuu4ppXiR9jBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DU60Wch7UwdUG5T8rSfhYQvZ1zOmoKWNQmDoRLdIKaULDLEFfiLxxHbjnVYDbPHtbdYFxmo69uynqugJakzw1BESgOkaRplHH39uFhZeULz5LcqSk/azoVhmm1XlaCQYz9tLnrn2trvlfDN55GWcxayginILdPrfqtakinV+Abs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDoUy+KZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDoUy+KZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720455772; x=1751991772;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=IIbdDIU/3qjnZ5u6Az8LH/BCAU8w0/Kuu4ppXiR9jBc=;
  b=FDoUy+KZVydghXfzXK0I2JznbOaiQhCvBC7nZikpOt3BxTF2eiKC+lPz
   uDjDHm2FYCtA4vk/vcl41qaZ5pSMfUopBUK4u8W5m2zNrM72VWgxy4lIf
   56MSfwo71NXho3P8max9ce+JaLSuwnmLwmXERDnWKPh1YRg80+dY+cFCK
   h2+rGKNAkblPcBFa+FCmmbJ3zEaOLirfaVX/+K6Am0TWbXphaIGqbVtUZ
   Y9Ys0yP4musDU++XWtJ0vBQfhhBZy8IiChi4jItMFY2LpquiwyZJlYzu0
   d1qTCOyRkvSX33memOpWjynuFFj3oDiLzNAnfxgvabYDhNzLQitag9aBW
   w==;
X-CSE-ConnectionGUID: ZremdrtlQdSPeLzPdZX/dA==
X-CSE-MsgGUID: czibnz1KRumxy0gKiXkGdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="28271430"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="28271430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 09:22:52 -0700
X-CSE-ConnectionGUID: EmjwZZECTeCc9MIoziLRWw==
X-CSE-MsgGUID: 7NTkywRORbGw7RI3aBV2aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="52494425"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.115])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 09:22:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: W_Armin@gmx.de, hdegoede@redhat.com, 
 Alexis Belmonte <alexbelm48@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
In-Reply-To: <Zovh22-7B1jI7sfF@alexis-pc>
References: <Zovh22-7B1jI7sfF@alexis-pc>
Subject: Re: [PATCHv10] platform/x86: hp-wmi: Fix platform profile option
 switch bug on Omen and Victus laptops
Message-Id: <172045576536.3424.14598982078039514960.b4-ty@linux.intel.com>
Date: Mon, 08 Jul 2024 19:22:45 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 08 Jul 2024 14:55:55 +0200, Alexis Belmonte wrote:

> Fix a platform profile option switch/getter bug on some Omen and Victus
> laptops dismissing userspace choice when selecting performance mode in
> inadequate conditions (e.g. by being disconnected from the AC power plug)
> by
> 
>    -  hooking an ACPI notify handler through the
>       omen_register_powersource_event_handler method that listens to AC
>       power source changes (plugging in/out the AC power plug)
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: hp-wmi: Fix platform profile option switch bug on Omen and Victus laptops
      commit: 2282159b33580076235384597df1d62a6a1037ee

--
 i.

